From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: How to implement ACPI EC support?
Date: Fri, 2 Nov 2012 09:57:14 +0000
Message-ID: <CAHR064jOAKNWgDanyO5EEoWSd6bnaCa6UpAL9O7WZSSMJyvD0w@mail.gmail.com>
References: <50912CC2.2050902@profitbricks.com>
	<20121102021232.GB3262@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:50669 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964939Ab2KBJ5Q (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 2 Nov 2012 05:57:16 -0400
Received: by mail-bk0-f46.google.com with SMTP id jk13so1308010bkc.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 02 Nov 2012 02:57:14 -0700 (PDT)
In-Reply-To: <20121102021232.GB3262@khazad-dum.debian.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Sebastian Riemer <sebastian.riemer@profitbricks.com>, platform-driver-x86@vger.kernel.org

On Fri, Nov 2, 2012 at 2:12 AM, Henrique de Moraes Holschuh
<hmh@hmh.eng.br> wrote:
> On Wed, 31 Oct 2012, Sebastian Riemer wrote:
>> I've noticed the ACPI embedded controller (EC) support in the
>> "thinkpad_acpi" driver.
>>
>> New Samsung laptops (NP530U3C, NP900X4B, NP900X3C, ...) also have an EC
>> which isn't supported by the generic ACPI driver. The lid, the battery
>> status and the power supply status are connected to it.
>>
>> How did you implement the EC support in the thinkpad driver? Did you
>> have documentation or was it done by reverse engineering?
>
> It was done through lots of trial and error by several people over more than
> a decade, and sometime ago SuSE managed to get me in contact with some
> Lenovo ThinkPad firmware engineers in Japan, which did help a lot.
>
> However, thinkpad-acpi is an old driver, you might want to ask the
> maintainers of newer WMI-based drivers about how they are managing...

I don't know if WMI can really help here, but will free to use wmidump
to extract all WMI informations, and

http://lwn.net/Articles/391230/
https://github.com/iksaif/wmidump
http://msdn.microsoft.com/en-us/library/windows/hardware/ff565588
http://glucik.blogspot.com/2011/12/mof-decompilation.html  (!!! the
tool is Wmimofck.exe not wmiofck.exe)

-- 
Corentin Chary
http://xf.iksaif.net
