var mongoose = require('mongoose')

var MasternodesSchema = new mongoose.Schema({
    hash: {type: String, default: ""},
    status: {type: String, default: ""},
    address: { type: String, default: "" },
    pubkey: { type: String, default: "" },
    lastseen: { type: String, default: "" },
    activesec: {type: Number, default: 0 }
});

module.exports = mongoose.model('Masternodes', MasternodesSchema);

