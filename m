From: Corentin Chary <corentincj@iksaif.net>
Subject: Re: samsung-laptop: Samsung 530U3C major ACPI issues
Date: Wed, 24 Oct 2012 19:21:15 +0100
Message-ID: <CAHR064jQwnGxxFvrcwtB9w+fHkCVxw5kpbF4sgvFmNqtXEdYxw@mail.gmail.com>
References: <5087F449.6040906@profitbricks.com>
	<5087F70E.3010406@profitbricks.com>
	<5087FDA0.5010002@profitbricks.com>
	<CAHR064g+rHyjqauc_TME17z+ZTtR3wZiXSvdx0wGhb=z5hWGfg@mail.gmail.com>
	<508811BC.9050006@profitbricks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:32775 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934943Ab2JXSVR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 24 Oct 2012 14:21:17 -0400
Received: by mail-bk0-f46.google.com with SMTP id jk13so402797bkc.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Oct 2012 11:21:15 -0700 (PDT)
In-Reply-To: <508811BC.9050006@profitbricks.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Sebastian Riemer <sebastian.riemer@profitbricks.com>
Cc: platform-driver-x86@vger.kernel.org, Adrian Maertins <adrian.maertins@profitbricks.com>

On Wed, Oct 24, 2012 at 5:05 PM, Sebastian Riemer
<sebastian.riemer@profitbricks.com> wrote:
> Hi Corentin,
>
> On 24.10.2012 17:24, Corentin Chary wrote:
>> samsung-laptop doesn't use ACPI, only SABI interface.
>
> I thought it does for the video driver/backlight control. The strange
> thing is that the issues start directly after loading the driver.
> Perhaps it has to be blacklisted for this model.

samsung-laptop talks to the bios directly using SABI. But the BIOS is
also related to ACPI, so things can get ugly I guess...

> Kernel log:
>
> samsung_laptop: detected SABI interface: SwSmi@
> samsung_laptop: Backlight controlled by ACPI video driver
> ACPI Warning: 0x000000000000efa0-0x000000000000efbf SystemIO conflicts
> with Region \_SB_.PCI0.SBUS.SMBI 1 (20120711/utaddress-251)
> ACPI: If an ACPI driver is available for this device, you should use it
> instead of the native driver

Hum can you try to blacklist samsung-laptop, load it manually, and
send me the dmesg ?
If possible with and without acpi_backlght=vendor boot parameter.

> Where are the custom ACPI drivers in the kernel tree if not in
> drivers/platform/x86 ?

drivers/paltform/x86 contains x86 platform drivers, and some of them
are ACPI drivers, but not all of them.

>> This looks like ACPI issues, please file a bug on bugzilla, but first
>> thing, check for bios updates :).
>
> Which bugzilla? Sorry, I'm not an ACPI specialist.

The linux kernel bugzilla. But before doing that, are this issues only
hapenning when/if samsung-laptop is loaded ?
Can you send me he output of:

tree /sys/devices/platform/samsung-laptop/
tree /sys/class/backlight

Thanks


-- 
Corentin Chary
http://xf.iksaif.net
