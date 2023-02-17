local dap = require("dap")
require("dap-config.dapui")
dap.adapters.node2 = {
    type = "executable",
    command = "node",
    args = {
        os.getenv("HOME") ..
            "/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js"
    }
}
dap.configurations.javascript = {
    {
        name = "Launch",
        type = "node2",
        request = "launch",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        console = "integratedTerminal"
    }, {
        -- For this to work you need to make sure the node process is started with the `--inspect` flag.
        name = "Attach to process",
        type = "node2",
        request = "attach",
        processId = require("dap.utils").pick_process
    }
}

dap.adapters.go = {
    type = "executable",
    command = "node",
    args = {os.getenv("HOME") .. "/dev/golang/vscode-go/dist/debugAdapter.js"}
}
dap.configurations.go = {
    {
        type = "go",
        name = "Debug",
        request = "launch",
        showLog = false,
        program = "${file}",
        dlvToolPath = vim.fn.exepath("dlv") -- Adjust to where delve is installed
    }
}
