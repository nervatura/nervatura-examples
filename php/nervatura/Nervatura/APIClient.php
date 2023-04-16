<?php
// GENERATED CODE -- DO NOT EDIT!

namespace Nervatura;

/**
 *
 * Nervatura gRPC API
 */
class APIClient extends \Grpc\BaseStub {

    /**
     * @param string $hostname hostname
     * @param array $opts channel options
     * @param \Grpc\Channel $channel (optional) re-use channel object
     */
    public function __construct($hostname, $opts, $channel = null) {
        parent::__construct($hostname, $opts, $channel);
    }

    /**
     * Logs in user by username and password
     * @param \Nervatura\RequestUserLogin $argument input argument
     * @param array $metadata metadata
     * @param array $options call options
     * @return \Grpc\UnaryCall
     */
    public function UserLogin(\Nervatura\RequestUserLogin $argument,
      $metadata = [], $options = []) {
        return $this->_simpleRequest('/nervatura.API/UserLogin',
        $argument,
        ['\Nervatura\ResponseUserLogin', 'decode'],
        $metadata, $options);
    }

    /**
     * User (employee or customer) password change.
     * @param \Nervatura\RequestUserPassword $argument input argument
     * @param array $metadata metadata
     * @param array $options call options
     * @return \Grpc\UnaryCall
     */
    public function UserPassword(\Nervatura\RequestUserPassword $argument,
      $metadata = [], $options = []) {
        return $this->_simpleRequest('/nervatura.API/UserPassword',
        $argument,
        ['\Nervatura\ResponseEmpty', 'decode'],
        $metadata, $options);
    }

    /**
     * JWT token auth.
     * @param \Nervatura\RequestEmpty $argument input argument
     * @param array $metadata metadata
     * @param array $options call options
     * @return \Grpc\UnaryCall
     */
    public function TokenLogin(\Nervatura\RequestEmpty $argument,
      $metadata = [], $options = []) {
        return $this->_simpleRequest('/nervatura.API/TokenLogin',
        $argument,
        ['\Nervatura\ResponseTokenLogin', 'decode'],
        $metadata, $options);
    }

    /**
     * Refreshes JWT token by checking at database whether refresh token exists.
     * @param \Nervatura\RequestEmpty $argument input argument
     * @param array $metadata metadata
     * @param array $options call options
     * @return \Grpc\UnaryCall
     */
    public function TokenRefresh(\Nervatura\RequestEmpty $argument,
      $metadata = [], $options = []) {
        return $this->_simpleRequest('/nervatura.API/TokenRefresh',
        $argument,
        ['\Nervatura\ResponseTokenRefresh', 'decode'],
        $metadata, $options);
    }

    /**
     * Decoded JWT token but doesn't validate the signature.
     * @param \Nervatura\RequestTokenDecode $argument input argument
     * @param array $metadata metadata
     * @param array $options call options
     * @return \Grpc\UnaryCall
     */
    public function TokenDecode(\Nervatura\RequestTokenDecode $argument,
      $metadata = [], $options = []) {
        return $this->_simpleRequest('/nervatura.API/TokenDecode',
        $argument,
        ['\Nervatura\ResponseTokenDecode', 'decode'],
        $metadata, $options);
    }

    /**
     * Get returns one or more records
     * @param \Nervatura\RequestGet $argument input argument
     * @param array $metadata metadata
     * @param array $options call options
     * @return \Grpc\UnaryCall
     */
    public function Get(\Nervatura\RequestGet $argument,
      $metadata = [], $options = []) {
        return $this->_simpleRequest('/nervatura.API/Get',
        $argument,
        ['\Nervatura\ResponseGet', 'decode'],
        $metadata, $options);
    }

    /**
     * Add/update one or more items
     * @param \Nervatura\RequestUpdate $argument input argument
     * @param array $metadata metadata
     * @param array $options call options
     * @return \Grpc\UnaryCall
     */
    public function Update(\Nervatura\RequestUpdate $argument,
      $metadata = [], $options = []) {
        return $this->_simpleRequest('/nervatura.API/Update',
        $argument,
        ['\Nervatura\ResponseUpdate', 'decode'],
        $metadata, $options);
    }

    /**
     * Delete an item
     * @param \Nervatura\RequestDelete $argument input argument
     * @param array $metadata metadata
     * @param array $options call options
     * @return \Grpc\UnaryCall
     */
    public function Delete(\Nervatura\RequestDelete $argument,
      $metadata = [], $options = []) {
        return $this->_simpleRequest('/nervatura.API/Delete',
        $argument,
        ['\Nervatura\ResponseEmpty', 'decode'],
        $metadata, $options);
    }

    /**
     * Run raw SQL queries in safe mode
     * @param \Nervatura\RequestView $argument input argument
     * @param array $metadata metadata
     * @param array $options call options
     * @return \Grpc\UnaryCall
     */
    public function View(\Nervatura\RequestView $argument,
      $metadata = [], $options = []) {
        return $this->_simpleRequest('/nervatura.API/View',
        $argument,
        ['\Nervatura\ResponseView', 'decode'],
        $metadata, $options);
    }

    /**
     * Call a server-side function
     * @param \Nervatura\RequestFunction $argument input argument
     * @param array $metadata metadata
     * @param array $options call options
     * @return \Grpc\UnaryCall
     */
    public function Function(\Nervatura\RequestFunction $argument,
      $metadata = [], $options = []) {
        return $this->_simpleRequest('/nervatura.API/Function',
        $argument,
        ['\Nervatura\ResponseFunction', 'decode'],
        $metadata, $options);
    }

    /**
     * Create and download a Nervatura Report
     * @param \Nervatura\RequestReport $argument input argument
     * @param array $metadata metadata
     * @param array $options call options
     * @return \Grpc\UnaryCall
     */
    public function Report(\Nervatura\RequestReport $argument,
      $metadata = [], $options = []) {
        return $this->_simpleRequest('/nervatura.API/Report',
        $argument,
        ['\Nervatura\ResponseReport', 'decode'],
        $metadata, $options);
    }

    /**
     * List all available Nervatura Report. Admin user group membership required.
     * @param \Nervatura\RequestReportList $argument input argument
     * @param array $metadata metadata
     * @param array $options call options
     * @return \Grpc\UnaryCall
     */
    public function ReportList(\Nervatura\RequestReportList $argument,
      $metadata = [], $options = []) {
        return $this->_simpleRequest('/nervatura.API/ReportList',
        $argument,
        ['\Nervatura\ResponseReportList', 'decode'],
        $metadata, $options);
    }

    /**
     * Install a report to the database. Admin user group membership required.
     * @param \Nervatura\RequestReportInstall $argument input argument
     * @param array $metadata metadata
     * @param array $options call options
     * @return \Grpc\UnaryCall
     */
    public function ReportInstall(\Nervatura\RequestReportInstall $argument,
      $metadata = [], $options = []) {
        return $this->_simpleRequest('/nervatura.API/ReportInstall',
        $argument,
        ['\Nervatura\ResponseReportInstall', 'decode'],
        $metadata, $options);
    }

    /**
     * Delete a report from the database. Admin user group membership required.
     * @param \Nervatura\RequestReportDelete $argument input argument
     * @param array $metadata metadata
     * @param array $options call options
     * @return \Grpc\UnaryCall
     */
    public function ReportDelete(\Nervatura\RequestReportDelete $argument,
      $metadata = [], $options = []) {
        return $this->_simpleRequest('/nervatura.API/ReportDelete',
        $argument,
        ['\Nervatura\ResponseEmpty', 'decode'],
        $metadata, $options);
    }

    /**
     * Create a new Nervatura database
     * @param \Nervatura\RequestDatabaseCreate $argument input argument
     * @param array $metadata metadata
     * @param array $options call options
     * @return \Grpc\UnaryCall
     */
    public function DatabaseCreate(\Nervatura\RequestDatabaseCreate $argument,
      $metadata = [], $options = []) {
        return $this->_simpleRequest('/nervatura.API/DatabaseCreate',
        $argument,
        ['\Nervatura\ResponseDatabaseCreate', 'decode'],
        $metadata, $options);
    }

}
