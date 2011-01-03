From: Thomas Renninger <trenn@suse.de>
Subject: Re: Bug#587014: screen brightness can't be modified on some Panasonic laptops
Date: Mon, 3 Jan 2011 10:40:03 +0100
Message-ID: <201101031040.03797.trenn@suse.de>
References: <20101229152428.GB4116@nashi.hw.39mm.net>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-6"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:35915 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752942Ab1ACJkG (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 3 Jan 2011 04:40:06 -0500
In-Reply-To: <20101229152428.GB4116@nashi.hw.39mm.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Nicolas Limare <nicolas+debian@limare.net>
Cc: 587014@bugs.debian.org, ben@decadent.org.uk, laforge@gnumonks.org, platform-driver-x86@vger.kernel.org, mjg59@srcf.ucam.org, cristopher.camacho@gmail.com

On Wednesday 29 December 2010 16:24:28 Nicolas Limare wrote:
> I also received a message reportin for this bug on a Panasonic CF-52.
> 
> Can I in any way help this bug get more attention?
> 
What is Bug#587014? Do you have a link?

Panasonic is the only driver which will always try to use
native backlight switching (may conflict with video.ko?).

drivers/platform/x86/panasonic-laptop.c misses a line like:
if (acpi_video_backlight_support()

The reason panasonic was not changed to differ acpi/native
switching was because ACPI based switching resulted in 2 missing
backlight states. But this was fixed by better (more Windows compatible) 
parsing the backlight ACPI states and they should be all availeable
with ACPI as well. Len Brown has/had such a machine.

> Just in case, I am at 27C3 now, with my laptop, so if anyone there
> wants to directly investigate the issue just let me know.
No idea whether it's above, there is not much info about the issue,
but you could try in this direction. Tell me if it helps or if
you need assistance to try things out.

Ah, and there is the "global methods execution is broken":
https://bugzilla.kernel.org/show_bug.cgi?id=19462
which very much affects Panasonics.
Make sure your kernel has the git commit mentioned in the
last comment.

    Thomas
