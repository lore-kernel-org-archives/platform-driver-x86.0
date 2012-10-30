From: Sebastian Riemer <sebastian.riemer@profitbricks.com>
Subject: Re: samsung-laptop: Samsung 530U3C major ACPI issues
Date: Tue, 30 Oct 2012 13:23:35 +0100
Message-ID: <508FC6C7.8040906@profitbricks.com>
References: <5087F449.6040906@profitbricks.com> <5087F70E.3010406@profitbricks.com> <5087FDA0.5010002@profitbricks.com> <CAHR064g+rHyjqauc_TME17z+ZTtR3wZiXSvdx0wGhb=z5hWGfg@mail.gmail.com> <508811BC.9050006@profitbricks.com> <CAHR064jQwnGxxFvrcwtB9w+fHkCVxw5kpbF4sgvFmNqtXEdYxw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:54228 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758043Ab2J3MXh (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 30 Oct 2012 08:23:37 -0400
Received: by mail-bk0-f46.google.com with SMTP id jk13so126428bkc.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Oct 2012 05:23:35 -0700 (PDT)
In-Reply-To: <CAHR064jQwnGxxFvrcwtB9w+fHkCVxw5kpbF4sgvFmNqtXEdYxw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentincj@iksaif.net>
Cc: platform-driver-x86@vger.kernel.org, Adrian Maertins <adrian.maertins@profitbricks.com>

Hi Corentin,

I've found the related bugs in the kernel bugzilla. These are really
ACPI issues.

https://bugzilla.kernel.org/show_bug.cgi?id=45461
https://bugzilla.kernel.org/show_bug.cgi?id=44161

If my colleague Adrian wouldn't have removed Windows from his laptop,
then it would be possible to do some reverse engineering, I guess.
Where do vendor specific ACPI/WMI drivers hide for Windows? In the
chipset drivers? SMBus?
Special are also the HECI/MEI devices with that laptop model. Haven't
seen such drivers before - these are also in the linux staging drivers.

Cheers,
Sebastian


On 24.10.2012 20:21, Corentin Chary wrote:
> On Wed, Oct 24, 2012 at 5:05 PM, Sebastian Riemer
> <sebastian.riemer@profitbricks.com> wrote:
>> Hi Corentin,
>>
>> On 24.10.2012 17:24, Corentin Chary wrote:
>>> samsung-laptop doesn't use ACPI, only SABI interface.
>> I thought it does for the video driver/backlight control. The strange
>> thing is that the issues start directly after loading the driver.
>> Perhaps it has to be blacklisted for this model.
> samsung-laptop talks to the bios directly using SABI. But the BIOS is
> also related to ACPI, so things can get ugly I guess...
>
>> Kernel log:
>>
>> samsung_laptop: detected SABI interface: SwSmi@
>> samsung_laptop: Backlight controlled by ACPI video driver
>> ACPI Warning: 0x000000000000efa0-0x000000000000efbf SystemIO conflicts
>> with Region \_SB_.PCI0.SBUS.SMBI 1 (20120711/utaddress-251)
>> ACPI: If an ACPI driver is available for this device, you should use it
>> instead of the native driver
> Hum can you try to blacklist samsung-laptop, load it manually, and
> send me the dmesg ?
> If possible with and without acpi_backlght=vendor boot parameter.
>
>> Where are the custom ACPI drivers in the kernel tree if not in
>> drivers/platform/x86 ?
> drivers/paltform/x86 contains x86 platform drivers, and some of them
> are ACPI drivers, but not all of them.
>
>>> This looks like ACPI issues, please file a bug on bugzilla, but first
>>> thing, check for bios updates :).
>> Which bugzilla? Sorry, I'm not an ACPI specialist.
> The linux kernel bugzilla. But before doing that, are this issues only
> hapenning when/if samsung-laptop is loaded ?
> Can you send me he output of:
>
> tree /sys/devices/platform/samsung-laptop/
> tree /sys/class/backlight
>
> Thanks
>
>
