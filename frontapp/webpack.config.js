const path = require('path');
module.exports = {
    entry: "./app/index.tsx",
    output: {
        filename: "frontApp.js",
        path: path.resolve(__dirname, '../vendor/assets/javascripts'),
    },
    devtool: 'source-map',
    resolve: {
        extensions: ['.js', '.json', '.ts', '.tsx'],
    },
    module: {
        rules: [
            {
                test: /\.(ts|tsx)$/,
                loader: "awesome-typescript-loader"
            },
        ]
    },
};
