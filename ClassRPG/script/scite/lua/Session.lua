SessionManager = EventClass:new(Common)

function SessionManager:OnOpen()
	store_last_session()
end

function store_last_session() 
    local ses = io.open(props["SciteUserHome"] .. "/stored_session", "w") 

    ses:write(io.open(props["SessionPath"], "r"):read("*a")) 
    ses:flush() 
end

function restore_last_session() 
    scite.MenuCommand(132, props["SciteUserHome"] .. "/stored_session") 
end