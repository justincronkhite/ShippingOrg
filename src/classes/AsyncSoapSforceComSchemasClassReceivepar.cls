//Generated by wsdl2apex

public class AsyncSoapSforceComSchemasClassReceivepar {
    public class updateInventoryResponse_elementFuture extends System.WebServiceCalloutFuture {
        public String getValue() {
            soapSforceComSchemasClassReceivepar.updateInventoryResponse_element response = (soapSforceComSchemasClassReceivepar.updateInventoryResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.result;
        }
    }
    public class AsyncreceiveParametersShip {
        public String endpoint_x = 'https://na210.salesforce.com/services/Soap/class/receiveParametersShip';
        public Map<String,String> inputHttpHeaders_x;
        public String clientCertName_x;
        public Integer timeout_x;
        public soapSforceComSchemasClassReceivepar.CallOptions_element CallOptions;
        public soapSforceComSchemasClassReceivepar.DebuggingInfo_element DebuggingInfo;
        public soapSforceComSchemasClassReceivepar.SessionHeader_element SessionHeader;
        public soapSforceComSchemasClassReceivepar.DebuggingHeader_element DebuggingHeader;
        public soapSforceComSchemasClassReceivepar.AllowFieldTruncationHeader_element AllowFieldTruncationHeader;
        private String CallOptions_hns = 'CallOptions=http://soap.sforce.com/schemas/class/receiveParametersShip';
        private String DebuggingInfo_hns = 'DebuggingInfo=http://soap.sforce.com/schemas/class/receiveParametersShip';
        private String SessionHeader_hns = 'SessionHeader=http://soap.sforce.com/schemas/class/receiveParametersShip';
        private String DebuggingHeader_hns = 'DebuggingHeader=http://soap.sforce.com/schemas/class/receiveParametersShip';
        private String AllowFieldTruncationHeader_hns = 'AllowFieldTruncationHeader=http://soap.sforce.com/schemas/class/receiveParametersShip';
        private String[] ns_map_type_info = new String[]{'http://soap.sforce.com/schemas/class/receiveParametersShip', 'soapSforceComSchemasClassReceivepar'};
        public AsyncSoapSforceComSchemasClassReceivepar.updateInventoryResponse_elementFuture beginUpdateInventory(System.Continuation continuation,Integer inv,String productCode) {
            soapSforceComSchemasClassReceivepar.updateInventory_element request_x = new soapSforceComSchemasClassReceivepar.updateInventory_element();
            request_x.inv = inv;
            request_x.productCode = productCode;
            return (AsyncSoapSforceComSchemasClassReceivepar.updateInventoryResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncSoapSforceComSchemasClassReceivepar.updateInventoryResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/schemas/class/receiveParametersShip',
              'updateInventory',
              'http://soap.sforce.com/schemas/class/receiveParametersShip',
              'updateInventoryResponse',
              'soapSforceComSchemasClassReceivepar.updateInventoryResponse_element'}
            );
        }
    }
}