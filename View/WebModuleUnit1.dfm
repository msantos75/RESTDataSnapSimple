object WebModule1: TWebModule1
  OnCreate = WebModuleCreate
  Actions = <
    item
      Name = 'ReverseStringAction'
      PathInfo = '/ReverseString'
      Producer = ReverseString
    end
    item
      Name = 'ServerFunctionInvokerAction'
      PathInfo = '/ServerFunctionInvoker'
      Producer = ServerFunctionInvoker
    end
    item
      Default = True
      Name = 'DefaultAction'
      PathInfo = '/'
      OnAction = WebModuleDefaultAction
    end>
  BeforeDispatch = WebModuleBeforeDispatch
  Height = 382
  Width = 419
  object DSServer1: TDSServer
    Left = 48
    Top = 11
  end
  object DSRESTWebDispatcher1: TDSRESTWebDispatcher
    Server = DSServer1
    AuthenticationManager = DSAuthenticationManager1
    OnFormatResult = DSRESTWebDispatcher1FormatResult
    WebDispatch.PathInfo = 'datasnap*'
    Left = 48
    Top = 91
  end
  object DSServerClass1: TDSServerClass
    OnGetClass = DSServerClass1GetClass
    Server = DSServer1
    Left = 128
    Top = 11
  end
  object ServerFunctionInvoker: TPageProducer
    HTMLFile = 'templates/serverfunctioninvoker.html'
    OnHTMLTag = ServerFunctionInvokerHTMLTag
    Left = 48
    Top = 224
  end
  object ReverseString: TPageProducer
    HTMLFile = 'templates/reversestring.html'
    OnHTMLTag = ServerFunctionInvokerHTMLTag
    Left = 160
    Top = 224
  end
  object WebFileDispatcher1: TWebFileDispatcher
    WebFileExtensions = <
      item
        MimeType = 'text/css'
        Extensions = 'css'
      end
      item
        MimeType = 'text/javascript'
        Extensions = 'js'
      end
      item
        MimeType = 'image/x-png'
        Extensions = 'png'
      end
      item
        MimeType = 'text/html'
        Extensions = 'htm;html'
      end
      item
        MimeType = 'image/jpeg'
        Extensions = 'jpg;jpeg;jpe'
      end
      item
        MimeType = 'image/gif'
        Extensions = 'gif'
      end>
    BeforeDispatch = WebFileDispatcher1BeforeDispatch
    WebDirectories = <
      item
        DirectoryAction = dirInclude
        DirectoryMask = '*'
      end
      item
        DirectoryAction = dirExclude
        DirectoryMask = '\templates\*'
      end>
    RootDirectory = '.'
    VirtualPath = '/'
    Left = 48
    Top = 160
  end
  object DSProxyGenerator1: TDSProxyGenerator
    ExcludeClasses = 'DSMetadata'
    MetaDataProvider = DSServerMetaDataProvider1
    Writer = 'Java Script REST'
    Left = 48
    Top = 296
  end
  object DSServerMetaDataProvider1: TDSServerMetaDataProvider
    Server = DSServer1
    Left = 184
    Top = 296
  end
  object ServerEntidadeExemplo: TDSServerClass
    OnGetClass = ServerEntidadeExemploGetClass
    Server = DSServer1
    Left = 248
    Top = 11
  end
  object DSAuthenticationManager1: TDSAuthenticationManager
    OnUserAuthenticate = DSAuthenticationManager1UserAuthenticate
    Roles = <>
    Left = 208
    Top = 88
  end
end
