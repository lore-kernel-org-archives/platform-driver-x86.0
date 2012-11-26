From: Sebastian Riemer <sebastian.riemer@profitbricks.com>
Subject: Re: Acer Aspire 5733 - acer_wmi problems
Date: Mon, 26 Nov 2012 11:32:51 +0100
Message-ID: <50B34553.8010603@profitbricks.com>
References: <50AFD2B6.6050502@justinzane.com> <50B33D87.9080904@profitbricks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-la0-f46.google.com ([209.85.215.46]:54688 "EHLO
	mail-la0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754504Ab2KZKcn (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 26 Nov 2012 05:32:43 -0500
Received: by mail-la0-f46.google.com with SMTP id p5so5640327lag.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Nov 2012 02:32:39 -0800 (PST)
In-Reply-To: <50B33D87.9080904@profitbricks.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Justin Chudgar <justin@justinzane.com>
Cc: platform-driver-x86@vger.kernel.org, joeyli <jlee@suse.com>

Btw.: with "evtest" you can check if the scan codes of the missing keys
are sent when pressing them.
Then, it is just a key mapping issue and not an ACPI issue.

Scan codes need to be mapped to key codes.

Here is an example:
http://ubuntuforums.org/showpost.php?p=11336640&postcount=178

Cheers,
Sebastian


On 26.11.2012 10:59, Sebastian Riemer wrote:
> Hi Justin,
>
> the disassembled DSDT always helps as a first step.
>
> 1. install "iasl" or get and compile the source:
> https://www.acpica.org/downloads/unix_source_code.php
> 2. cp /sys/firmware/acpi/tables/DSDT dsdt.aml
> 3. iasl -d dsdt.aml
>
> This creates a "dsdt.dsl" file. This is the interesting one.
>
> Furthermore, check the kernel bugzilla if there isn't a similar bug
> somewhere already.
> http://bugzilla.kernel.org
>
> This article is also good literature how WMI drivers work:
> http://lwn.net/Articles/391230/
>
> Also check for latest /lib/udev/keymaps/ and
> /lib/udev/keymaps/force-release/. On this page this helped e.g. on a
> Samsung laptop: http://blog.nonobis.nl/?p=11
>
> Cheers,
> Sebastian
>
>
> On 23.11.2012 20:47, Justin Chudgar wrote:
>> I have an Acer Aspire 5733 that is having issues with:
>> - <fn>+<brightness/volume/suspend/etc.> key combos not working
>> - screen not resuming when unplugging/replugging a system while system
>> continues operating
>>
>> Could someone please help me determine how to triage these and direct me
>> on what info the maintainer needs from me.
>>
>> Thank you.
>>
>> ##### Excerpt from lshw #####
>>    description: Notebook
>>     product: Aspire 5733 (Calpella_CRB)
>>     vendor: Acer
>>     version: V1.07
>>     serial:
>> NXRN5AA00221703D023400                                                                           
>>
>>     width: 64
>> bits                                                                                           
>>
>>     capabilities: smbios-2.6 dmi-2.6
>> vsyscall32                                                              
>>     configuration: boot=normal chassis=notebook family=Intel_Mobile
>> sku=Calpella_CRB
>> uuid=F5E6A1B5-81FF-11E1-A5D0-DC0EA1AC38D5                                                                                             
>>
>>  
>> *-core                                                                                                     
>>
>>        description: Motherboard
>>        product: Aspire 5733
>>        vendor: Acer
>>        physical id: 0
>>        version: V1.07
>>        serial: Base Board Serial Number
>>        slot: Base Board Chassis Location
>>      *-firmware
>>           description: BIOS
>>           vendor: Acer
>>           physical id: 0
>>           version: V1.07
>>           date: 11/07/2011
>>           size: 1MiB
>>           capacity: 1472KiB
>>           capabilities: pci upgrade shadowing cdboot bootselect edd
>> int13floppynec int13floppytoshiba int13floppy360 int13floppy1200
>> int13floppy720 int13floppy2880 int9keyboard int10video acpi usb
>> biosbootspecification
>>
