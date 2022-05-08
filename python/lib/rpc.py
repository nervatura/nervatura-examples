""" 
This file is part of the Nervatura Framework
http://nervatura.com
Copyright © 2011-2022, Csaba Kappel
License: LGPLv3
https://raw.githubusercontent.com/nervatura/nervatura/master/LICENSE 
"""

import os
import grpc
from nervatura import api_pb2 as pb, api_pb2_grpc as api
import json

def client():
    channel = grpc.insecure_channel("localhost:"+os.getenv("NT_GRPC_PORT"))
    return api.APIStub(channel)

def decodeValue(values):
    item = {}
    for key in dict(values).keys():
        if dict(values)[key].text == "null":
            item[key] = None
        elif str(dict(values)[key]).startswith("text:"):
            item[key] = dict(values)[key].text
        elif str(dict(values)[key]).startswith("number:"):
            item[key] = dict(values)[key].number
        else:
            item[key] = dict(values)[key].boolean
    return item

def encodeValue(value):
    if type(value) == bool:
        return pb.Value(bolean=value)
    if type(value) in(int, float):
        return pb.Value(number=float(value))
    if type(value) == list:
        return pb.Value(text=",".join(value))
    return pb.Value(text=str(value))

def mapValue(values):
    item = {}
    for key in dict(values).keys():
        item[key] = encodeValue(values[key])
    return item

def DatabaseCreate(apiKey, options):
    metadata = [("x-api-key", apiKey)]
    try:
        response = client().DatabaseCreate(pb.RequestDatabaseCreate(
            alias=options["database"], demo=options["demo"]
        ), metadata=metadata)
    except grpc.RpcError as err:
        return [None, err.details()]
    except:
        return [None, "Internal Error"]
    result = []
    for item in response.details.items:
        result.append(decodeValue(item.values))
    return [result, None]

def UserLogin(options):
    try:
        response = client().UserLogin(pb.RequestUserLogin(
            username=options["username"] if "username" in options else "", 
            password=options["password"] if "password" in options else "", 
            database=options["database"] if "database" in options else ""
        ))
    except grpc.RpcError as err:
        return [None, err.details()]
    except:
        return [None, "Internal Error"]
    result = dict(
        token=response.token,
        engine=response.engine,
        version=response.version
    )
    return [result, None]

def TokenLogin(token):
    metadata = [("authorization", "Bearer "+token)]
    try:
        response = client().TokenLogin(pb.RequestEmpty(), metadata=metadata)
    except grpc.RpcError as err:
        return [None, err.details()]
    except:
        return [None, "Internal Error"]
    result = dict(
        id=response.id,	username=response.username,	empnumber=response.empnumber,	
        usergroup=response.usergroup, scope=response.scope, department=response.department
    )
    return [result, None]

def TokenRefresh(token):
    metadata = [("authorization", "Bearer "+token)]
    try:
        response = client().TokenRefresh(pb.RequestEmpty(), metadata=metadata)
    except grpc.RpcError as err:
        return [None, err.details()]
    except:
        return [None, "Internal Error"]
    result = dict(
        token=response.value
    )
    return [result, None]

def UserPassword(token, options):
    metadata = [("authorization", "Bearer "+token)]
    try:
        client().UserPassword(pb.RequestUserPassword(
          password=options["password"] if "password" in options else "", 
          confirm=options["confirm"] if "confirm" in options else "", 
          username=options["username"] if "username" in options else "", 
          custnumber=options["custnumber"] if "custnumber" in options else ""
        ), metadata=metadata)
    except grpc.RpcError as err:
        return [None, err.details()]
    except:
        return [None, "Internal Error"]
    return [None, None]

def Report(token, options):
    metadata = [("authorization", "Bearer "+token)]
    try:
        response = client().Report(pb.RequestReport(
            reportkey=options["reportkey"],
            orientation=pb.ReportOrientation.values()[pb.ReportOrientation.keys().index(options["orientation"])],
            size=pb.ReportSize.values()[pb.ReportSize.keys().index(options["size"])],
            output= 3 if options["output"] == "print" or options["output"] == "auto" or options["output"] == "pdf" else pb.ReportOutput.values()[pb.ReportOutput.keys().index(options["output"])],
            type=pb.ReportType.values()[pb.ReportType.keys().index("report_"+options["nervatype"])],
            refnumber=options["refnumber"], template=options["template"],
            filters=mapValue(options["filters"])
        ), metadata=metadata)
    except grpc.RpcError as err:
        return [None, err.details()]
    except:
        return [None, "Internal Error"]
    result = json.loads(response.value)
    return [result, None]

def ReportList(token, options):
    metadata = [("authorization", "Bearer "+token)]
    try:
        response = client().ReportList(pb.RequestReportList(
            label=options["label"]
        ), metadata=metadata)
    except grpc.RpcError as err:
        return [None, err.details()]
    except:
        return [None, "Internal Error"]
    result = []
    for item in response.items:
        result.append(dict(
            reportkey=item.reportkey,
            repname=item.repname,
            description=item.description,
            label=item.label,
            reptype=item.reptype,
            filename=item.filename,
            installed=item.installed
        ))
    return [result, None]

def ReportInstall(token, options):
    metadata = [("authorization", "Bearer "+token)]
    try:
        response = client().ReportInstall(pb.RequestReportInstall(
            reportkey=options["reportkey"]
        ), metadata=metadata)
    except grpc.RpcError as err:
        return [None, err.details()]
    except:
        return [None, "Internal Error"]
    return [response.id, None]

def ReportDelete(token, options):
    metadata = [("authorization", "Bearer "+token)]
    try:
        client().ReportDelete(pb.RequestReportDelete(
          reportkey=options["reportkey"]
        ), metadata=metadata)
    except grpc.RpcError as err:
        return [None, err.details()]
    except:
        return [None, "Internal Error"]
    return [None, None]

def Function(token, options):
    metadata = [("authorization", "Bearer "+token)]
    try:
        response = client().Function(pb.RequestFunction(
            key=options["key"],
            values=mapValue(options["values"])
        ), metadata=metadata)
    except grpc.RpcError as err:
        return [None, err.details()]
    except:
        return [None, "Internal Error"]
    result = json.loads(response.value)
    return [result, None]

def View(token, data):
    rpcOptions = []
    for v in data:
        values = []
        for value in v["values"]:
            values.append(encodeValue(value))
        rpcOptions.append(dict(
           key=v["key"], text=v["text"], values=values
        ))
    metadata = [("authorization", "Bearer "+token)]
    try:
        response = client().View(pb.RequestView(
            options=rpcOptions
        ), metadata=metadata)
    except grpc.RpcError as err:
        return [None, err.details()]
    except:
        return [None, "Internal Error"]
    result = {}
    for vkey in response.values:
        items = []
        for item in response.values[vkey].items:
            items.append(decodeValue(item.values))
        result[vkey] = items
    return [result, None]

def Get(token, options):
    metadata = [("authorization", "Bearer "+token)]
    try:
        response = client().Get(pb.RequestGet(
            nervatype=pb.DataType.values()[pb.DataType.keys().index(options["nervatype"])],
            metadata=options["metadata"],
            filter=options["filter"],
            ids=options["ids"]
        ), metadata=metadata)
    except grpc.RpcError as err:
        return [None, err.details()]
    except:
        return [None, "Internal Error"]
    result = []
    for msg in response.values:
        ritem = {}
        item = msg.ListFields()[0][1]
        for fld in item.ListFields():
            if fld[0].name == "metadata":
                ritem["metadata"] = []
                for md in fld[1]:
                    ritem["metadata"].append(dict(
                        id=md.id,
                        fieldname=md.fieldname,
                        value=md.value,
                        notes=md.notes,
                        fieldtype=md.fieldtype
                    ))
            else:
                ritem[fld[0].name] = fld[1]
        result.append(ritem)
    return [result, None]

def Update(token, options):
    metadata = [("authorization", "Bearer "+token)]
    items = []
    for row in options["data"]:
        item = { "values":{} }
        for fkey in row:
            if fkey == "keys":
                item["keys"] = mapValue(row["keys"])
            else:
                item["values"][fkey]=encodeValue(row[fkey])
        items.append(item)
    try:
        response = client().Update(pb.RequestUpdate(
            nervatype=pb.DataType.values()[pb.DataType.keys().index(options["nervatype"])],
            items=items
        ), metadata=metadata)
    except grpc.RpcError as err:
        return [None, err.details()]
    except:
        return [None, "Internal Error"]
    result = []
    for id in response.values:
        result.append(id)
    return [result, None]

def Delete(token, options):
    metadata = [("authorization", "Bearer "+token)]
    try:
        client().Delete(pb.RequestDelete(
            nervatype=pb.DataType.values()[pb.DataType.keys().index(options["nervatype"])],
            id=options["id"], key=options["key"]
        ), metadata=metadata)
    except grpc.RpcError as err:
        return [None, err.details()]
    except:
        return [None, "Internal Error"]
    return [None, None]