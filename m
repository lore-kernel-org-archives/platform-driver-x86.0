From: Corentin Chary <corentincj@iksaif.net>
Subject: Re: samsung-laptop: Samsung 530U3C major ACPI issues
Date: Wed, 24 Oct 2012 16:24:37 +0100
Message-ID: <CAHR064g+rHyjqauc_TME17z+ZTtR3wZiXSvdx0wGhb=z5hWGfg@mail.gmail.com>
References: <5087F449.6040906@profitbricks.com>
	<5087F70E.3010406@profitbricks.com>
	<5087FDA0.5010002@profitbricks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oa0-f46.google.com ([209.85.219.46]:36772 "EHLO
	mail-oa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756111Ab2JXPYi (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 24 Oct 2012 11:24:38 -0400
Received: by mail-oa0-f46.google.com with SMTP id h16so544777oag.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Oct 2012 08:24:37 -0700 (PDT)
In-Reply-To: <5087FDA0.5010002@profitbricks.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Sebastian Riemer <sebastian.riemer@profitbricks.com>
Cc: platform-driver-x86@vger.kernel.org, Adrian Maertins <adrian.maertins@profitbricks.com>

Hi,

On Wed, Oct 24, 2012 at 3:39 PM, Sebastian Riemer
<sebastian.riemer@profitbricks.com> wrote:
> Hi Corentin,
>
> as you're the maintainer of the samsung-laptop driver I think that you
> can help with getting support for the Samsung 530U3C laptop into it.

samsung-laptop doesn't use ACPI, only SABI interface.

> My colleague Adrian reports the following ACPI issues:
> - the closing of the lid isn't detected
> - if the DC power supply is removed, this isn't detected

This looks like ACPI issues, please file a bug on bugzilla, but first
thing, check for bios updates :).

> - Wifi LED is always turned on even if Wifi is deactivated

I don't know what handle the LED here .. anything in /sys/class/led ?

> - high battery consumption

See powertop for that, may helps. Also check various graphic card
parameters for power consumption.

> Attached you can find the debug data from "dmesg" and "lshw" from Fedora
> 17. The kernel messages already indicate ACPI issues.
>
> How can we support you with getting the 530U3C support into the
> samsung-laptop driver?

Unfortunately, this doesn't seems to be related to samsung-laptop :).

-- 
Corentin Chary
http://xf.iksaif.net
