From: Seth Forshee <seth.forshee@canonical.com>
Subject: Re: [PATCH] xf86-video-intel: Add support for toshiba backlight
 interface
Date: Wed, 14 Mar 2012 09:57:40 -0500
Message-ID: <20120314145740.GA8693@ubuntu-macmini>
References: <1331735859-6337-1-git-send-email-zbe64533@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:48452 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750857Ab2CNO5r (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 14 Mar 2012 10:57:47 -0400
Content-Disposition: inline
In-Reply-To: <1331735859-6337-1-git-send-email-zbe64533@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Akio Idehara <zbe64533@gmail.com>
Cc: chris@chris-wilson.co.uk, intel-gfx@lists.freedesktop.org, mjg59@srcf.ucam.org, platform-driver-x86@vger.kernel.org

On Wed, Mar 14, 2012 at 11:37:39PM +0900, Akio Idehara wrote:
> xfce4-power-manager cannot control backlight brightness via
> toshiba backlight sysfs interface.
> The reason is that xf86-video-intel doesn't treat it.
> This patch adds support for toshiba backlight sysfs interface.
> 
> This was tested on a Toshiba Portege R500.
> 
> Signed-off-by: Akio Idehara <zbe64533@gmail.com>

This isn't a good idea. On many (probably most) Toshibas the platform
backlight interface is read-only. I think this patch will break more
machines than it fixes.

I have a patch for toshiba_acpi that (among other things) makes it only
register the backlight device if it can be written. I've just been
sitting on it though because I haven't been able to get anyone with a
read/write backlight interface to test it. If you'd be willing to help
with testing then I can work on getting that patch into the kernel, then
I wouldn't object to your patch.

Seth
