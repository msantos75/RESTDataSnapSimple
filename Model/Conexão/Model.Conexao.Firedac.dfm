object DataModule1: TDataModule1
  Height = 244
  Width = 439
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\Sistemas\CVSoft\Dados\DADOSM.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 72
    Top = 40
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 184
    Top = 40
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 304
    Top = 40
  end
end
