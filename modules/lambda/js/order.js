const AWS = require('aws-sdk');
AWS.config.update({
    region: 'ap-south-1'
});
const kinesis = new AWS.Kinesis();

async function streamToKinesis(payload) {
    const params = {
        Data: JSON.stringify(payload),
        PartitionKey: payload.productId.toString(),
        StreamName: 'products_stream'
    };
    
    await kinesis.putRecord(params).promise().then(response => {
        console.log(response);
    }, err => {
        console.log('error', err);
    });
}

exports.handler = async (event) => {
    console.log(JSON.stringify(event));
    
    await streamToKinesis(JSON.parse(event.body));
};