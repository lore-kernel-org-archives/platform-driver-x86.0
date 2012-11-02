From: Sebastian Riemer <sebastian.riemer@profitbricks.com>
Subject: Re: How to implement ACPI EC support?
Date: Fri, 02 Nov 2012 12:43:18 +0100
Message-ID: <5093B1D6.7020807@profitbricks.com>
References: <50912CC2.2050902@profitbricks.com> <20121102021232.GB3262@khazad-dum.debian.net> <CAHR064jOAKNWgDanyO5EEoWSd6bnaCa6UpAL9O7WZSSMJyvD0w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:60352 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750796Ab2KBLnS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 2 Nov 2012 07:43:18 -0400
Received: by mail-bk0-f46.google.com with SMTP id jk13so1347015bkc.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 02 Nov 2012 04:43:17 -0700 (PDT)
In-Reply-To: <CAHR064jOAKNWgDanyO5EEoWSd6bnaCa6UpAL9O7WZSSMJyvD0w@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, platform-driver-x86@vger.kernel.org

First of all: Thank you very much for your responses!

On 02.11.2012 10:57, Corentin Chary wrote:
> On Fri, Nov 2, 2012 at 2:12 AM, Henrique de Moraes Holschuh
> <hmh@hmh.eng.br> wrote:
>
>> It was done through lots of trial and error by several people over more than
>> a decade, and sometime ago SuSE managed to get me in contact with some
>> Lenovo ThinkPad firmware engineers in Japan, which did help a lot.
>>
>> However, thinkpad-acpi is an old driver, you might want to ask the
>> maintainers of newer WMI-based drivers about how they are managing...
> I don't know if WMI can really help here, but will free to use wmidump
> to extract all WMI informations, and
>
> http://lwn.net/Articles/391230/
> https://github.com/iksaif/wmidump
> http://msdn.microsoft.com/en-us/library/windows/hardware/ff565588
> http://glucik.blogspot.com/2011/12/mof-decompilation.html  (!!! the
> tool is Wmimofck.exe not wmiofck.exe)

Nope, I guess not. There is no MOF stuff in the DSDT.

wmidump:

C16C47BA-50E3-444A-AF3A-B1C348380000:
    object_id: 00
    notify_id: 30
    reserved: 30
    instance_count: 1
    flags: 0x1 ACPI_WMI_EXPENSIVE
C16C47BA-50E3-444A-AF3A-B1C348380001:
    object_id: 00
    notify_id: 30
    reserved: 30
    instance_count: 1
    flags: 0x2 ACPI_WMI_METHOD

The method WM00 uses completely different fields.

On Windows the EC is handled by "intel.sys" if I've seen that right.
"objdump -xS" on it would show big big disassembly output for sure. So
Windows debugging is needed I guess.

I've also asked the Samsung support for documentation. They want to do
internal research. At least they didn't answer "Linux is not a supported
operating system." like other big companies do.

Cheers,
Sebastian
