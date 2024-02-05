const handler = async (event, context) => {
    console.log('Ambiente...', JSON.stringify(process.env, null, 2));
    console.log('Evento...', JSON.stringify(event, null, 2));
    return {
        hey: 'hey jude'
    };
};


module.exports.handler = handler;