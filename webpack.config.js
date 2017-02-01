var path = require('path');
var webpack = require('webpack');

module.exports = function (env) {
    var app = env.app,
        subapp = env.subapp,
        devtool = env.min ? '' : 'inline-',
        entryPath = subapp ? path.join(__dirname, app, 'js', subapp, 'app.js') : path.join(__dirname, app, 'js', 'app.js'),
        filename = (subapp ? subapp : app) + (env.min ? '.min.js' : '.js');
    return {
        cache: true,
        entry: {
            app: entryPath
        },
        output: {
            path: path.join(__dirname, 'static', 'js', 'build', 'app', app),
            filename: filename
        },
        plugins: [
            new webpack.LoaderOptionsPlugin({
                options: {
                    eslint: {
                        failOnError: true
                    }
                }
            })
        ],
        devtool: devtool + 'source-map',
        module: {
            rules: [
                {
                    test: /\.js$/,
                    include: path.join(__dirname, app, 'js'),
                    loader: 'eslint-loader',
                    enforce: 'pre'
                },
                {
                    test: /\.js$/,
                    exclude: /node_modules/,
                    loader: 'babel-loader',
                    query: {
                        cacheDirectory: true,
                        presets: ['es2015', 'react']
                    }
                }
            ]
        },
        resolve: {
            modules: [
                path.resolve(__dirname),
                'node_modules'
            ]
        }
    };
};
