
function GetURLSearchParams(windowLocation) {

    const params = {};

    const query = windowLocation.search;

    new URLSearchParams(query).forEach((value, key) => {
        params[key] = parseInt(value);
    });

  return params;
}

export default GetURLSearchParams;