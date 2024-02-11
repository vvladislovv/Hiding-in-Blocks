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
                Icon = "rbxassetid://16312164831",
                NameQuset = "BreadOneQuest", -- // название квеста
                QuestNameTask = "",
                Dialogs = { -- // Тектс для диологов 
                    NewQuset = { -- // Новый квест и новый диолог
                        QusetNPCDiologs1 = {
                            "Hello bro!",
                            "Hello bro1!",
                            "Hello bro2!",
                            "Hello bro13!",
                        },
                        PlayerDiologs = {
                            "Player Hello NPC",
                            "Player Hello NPC2",
                            "Player Hello NPC3",
                        },
                        QusetNPCDiologs2 = {
                            "Hello bro!2",
                            "Hello bro1!2",
                            "Hello bro2!2",
                            "Hello bro13!2",
                        },
                    },

                    OldQuset = { -- // Старый квест и квест не выполнился 
                        QusetNPCDiologs1 = {
                            "TEsetr!",
                            "TEsetr2!",
                            "TEsetr3!",
                            "HTEsetr13!",
                        },
                        PlayerDiologs = {
                            "asdfasdfasdf",
                            "sdfgsdfhsdfh",
                            "sdfgsdfgsdfgsdfg",
                        },
                        QusetNPCDiologs2 = {
                            "sdfscvxcvbxcvbxcv",
                            "vvvvvvvvv",
                            "ccccccc",
                            "xxxxxxxxx",
                        },
                    },

                    Completed = { -- // квесть выполнили
                        QusetNPCDiologs1 = {
                            "Completed!",
                            "Completed2!",
                            "Completed3!",
                            "Completed13!",
                        },
                        PlayerDiologs = {
                            "Completed",
                            "Completedf",
                            "Completedfff",
                        },
                        QusetNPCDiologs2 = {
                            "fddddddd",
                            "ssssss",
                            "aaaaaaaaaa",
                            "cccsssss",
                        },
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