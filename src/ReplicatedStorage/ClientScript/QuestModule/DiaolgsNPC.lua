local Dualogs = {}

Dualogs.QuesetDialog = {
    ['Vladislov'] = {
        Name = 'Vladislov',
        NoQuset = '', --// Если не стоят квесты или нет квестов 
        QusetTable = {
            [1] = {
                NameQuset = "Vladislov", -- // название квеста
                QuestNameTask = "",
                Dialogs = { -- // Тектс для диологов 
                    NewQuset = { -- // Новый квест и новый диолог
                        ""
                    },

                    OldQuset = { -- // Старый квест и квест не выполнился 
                        ""
                    },

                    Completed = { -- // квесть выполнили
                        ""
                    }

                },

                Task = { -- // Задание 
                    ""
                },

                Rewards = { --// Награда за квесты 
                    ""
                }
            }
        }
    },
    ["Bread"] = {
        Name = 'Bread',
        NoQuset = '', --// Если не стоят квесты или нет квестов 
        QusetTable = {
            [1] = {
                NameQuset = "BreadOneQuest", -- // название квеста
                QuestNameTask = "",
                Dialogs = { -- // Тектс для диологов 
                    NewQuset = { -- // Новый квест и новый диолог
                        "Hello bro!",
                        "Quest big hard",
                        "Serecert",
                        "fFiveff",
                        "Today"
                    },

                    OldQuset = { -- // Старый квест и квест не выполнился 
                        "OldQuest",
                        "Bye"
                    },

                    Completed = { -- // квесть выполнили
                        "Yes",
                        "OneQuset",
                        "Good lick"
                    }

                },

                Task = { -- // Задание 
                    {
                        Type = "CollectCoin", -- ! Collect snalik
                        StartAmt = "0",
                        NeedAmt = "100",
                    },

                    {
                        Type = "KillHilder", --! Kill Hilder
                        StartAmt = "0",
                        NeedAmt = "10",
                    },
                    {
                        Type = "KillSeeker", -- ! Kill Seeker
                        StartAmt = "0",
                        NeedAmt = "10",
                    },
                    {
                        Type = "CollectTokenMap", -- ! Collect token at map
                        StartAmt = "0",
                        NeedAmt = "100",
                    },

                    {
                        Type = "TimeGame", --! Timer
                        StartAmt = "0 min",
                        NeedAmt = "1 hour",
                    },
                },

                Rewards = { --// Награда за квесты 
                    {
                        Rewar = "BaseSettings",
                        Type = "Sneliki",
                        Amount = 1000
                    }
                }
            }
        }
    }
}

return Dualogs