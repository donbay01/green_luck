const { default: axios } = require('axios')

const uri = "https://ng.1x001.com/service-api/LiveBet/Open/GetCoupon"

exports.getGames = async (code) => {
    const res = await axios.post(uri, {
        'CfView': 0,
        'Guid': code,
        'Lng': "en",
        'partner': 159,
    })

    const { Value, Success, Error } = res.data

    if (!Success) {
        throw Error
    }

    let payload = []

    for (let i = 0; i < Value.Events.length; i++) {
        let data = Value.Events[i]

        const { GameConstId } = data
        let { O1IMG, O2IMG } = await this.getGameInfo(GameConstId)
        data = { O1IMG, O2IMG, ...data }

        payload.push(data)
    }

    return payload;
}

exports.getGameInfo = async (id) => {
    const url = `https://ng.1x001.com/service-api/LineFeed/GetGameZip?id=${id}&lng=en&isSubGames=true&GroupEvents=true&countevents=250&grMode=4&partner=159&topGroups=&marketType=1`

    const res = await axios.get(url)
    const { Value, Success, Error } = res.data

    if (!Success) {
        throw Error
    }

    return Value;
}