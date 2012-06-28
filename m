From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] backlight: add support for disabling backlights via
 sysfs
Date: Thu, 28 Jun 2012 20:36:52 +0100
Message-ID: <20120628193652.GB10945@srcf.ucam.org>
References: <1340910426-13269-1-git-send-email-seth.forshee@canonical.com>
 <20120628191043.GA9777@srcf.ucam.org>
 <20120628193017.GA29456@thinkpad-t410>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:59840 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751727Ab2F1Tgz (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 28 Jun 2012 15:36:55 -0400
Content-Disposition: inline
In-Reply-To: <20120628193017.GA29456@thinkpad-t410>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Corentin Chary <corentin.chary@gmail.com>

On Thu, Jun 28, 2012 at 02:30:17PM -0500, Seth Forshee wrote:

> I actually don't think Corentin's solution is a bad one. It does suffer
> from a couple of shortcomings though. First, it only works for broken
> ACPI backlights, and some platforms have other backlight interfaces that
> are broken (e.g. the i915 backlight on the MacBook Pro 8,2). Second,
> marking backlights as broken in the kernel necessitates ever-expanding
> dmi blacklists in some of the platform drivers, unless we can get
> vendors to stop providing broken backlight interfaces.

Userspace should already be prioritising platform interfaces over raw 
interfaces, so if gmux works on the Mac then there's no problem. DMI 
lists should, broadly speaking, be unnecessary - they're mostly a 
symptom of us not understanding how the hardware is expected to work.

> I'm all for fixing integration bugs in the ACPI backlight
> implementations if we can, but some vendor implementations are just
> flat-out broken, and it isn't always possible to get vendor cooperation.
> In the case of Toshiba I've tried reaching out to them to work on ACPI
> integration issues, but they flat out refused.

We already know that our implementation of the IGD opregion is broken, 
but Intel won't hand over newer versions of the spec. If you see 
problems with the acpi backlight interface on Intel graphics then that 
should be the default assumption.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
