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
    }
}

return Dualogs