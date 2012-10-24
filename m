From: Sebastian Riemer <sebastian.riemer@profitbricks.com>
Subject: Re: samsung-laptop: Samsung 530U3C major ACPI issues
Date: Wed, 24 Oct 2012 18:05:16 +0200
Message-ID: <508811BC.9050006@profitbricks.com>
References: <5087F449.6040906@profitbricks.com> <5087F70E.3010406@profitbricks.com> <5087FDA0.5010002@profitbricks.com> <CAHR064g+rHyjqauc_TME17z+ZTtR3wZiXSvdx0wGhb=z5hWGfg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:45024 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757623Ab2JXQEk (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 24 Oct 2012 12:04:40 -0400
Received: by mail-bk0-f46.google.com with SMTP id jk13so341382bkc.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Oct 2012 09:04:39 -0700 (PDT)
In-Reply-To: <CAHR064g+rHyjqauc_TME17z+ZTtR3wZiXSvdx0wGhb=z5hWGfg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentincj@iksaif.net>
Cc: platform-driver-x86@vger.kernel.org, Adrian Maertins <adrian.maertins@profitbricks.com>

Hi Corentin,

On 24.10.2012 17:24, Corentin Chary wrote:
> samsung-laptop doesn't use ACPI, only SABI interface. 

I thought it does for the video driver/backlight control. The strange
thing is that the issues start directly after loading the driver.
Perhaps it has to be blacklisted for this model.

Kernel log:

samsung_laptop: detected SABI interface: SwSmi@
samsung_laptop: Backlight controlled by ACPI video driver
ACPI Warning: 0x000000000000efa0-0x000000000000efbf SystemIO conflicts
with Region \_SB_.PCI0.SBUS.SMBI 1 (20120711/utaddress-251)
ACPI: If an ACPI driver is available for this device, you should use it
instead of the native driver

Where are the custom ACPI drivers in the kernel tree if not in
drivers/platform/x86 ?
E.g. "eeepc-laptop" registers something like a custom ACPI driver if I
see that right.

> This looks like ACPI issues, please file a bug on bugzilla, but first
> thing, check for bios updates :).

Which bugzilla? Sorry, I'm not an ACPI specialist.

Cheers,
Sebastian
