From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] ideapad-laptop: add support for Yoga 3 ESC key
Date: Mon, 9 Nov 2015 13:46:24 -0800
Message-ID: <20151109214624.GI18221@malice.jf.intel.com>
References: <3945339.hkrnUBKIiS@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:46932 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750792AbbKIVq2 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 9 Nov 2015 16:46:28 -0500
Content-Disposition: inline
In-Reply-To: <3945339.hkrnUBKIiS@wuerfel>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: platform-driver-x86@vger.kernel.org, Ike Panhc <ike.pan@canonical.com>, linux-kernel@vger.kernel.org

On Fri, Nov 06, 2015 at 10:28:49PM +0100, Arnd Bergmann wrote:
> The ideapad-laptop handles most special keys on various Lenovo Laptops
> including the Yoga line. Unfortunately, the Yoga 3 11/13/14 models have
> one important exception, which is the Fn-ESC combination.
> 
> On other Lenovo Laptops, this is FnLock, which switches the function keys
> between the primary (Mute, Vol down, Vol up, ...) and the secondary (F1,
> F2, F3, ...) behavior. On the new machines, FnLock is only available
> through BIOS setup (possibly through a yet-to-be-implemented feature
> in this driver) but not through Fn-ESC, but instead the ESC key itself
> switched between ESC and a "Paper Display" app for Windows.
> 
> Unfortunately, that means that you can never have both ESC *and* the
> function keys working at the same time without needing to press Fn on
> one of them.
> As pointed out in the official Lenovo Forum by dozens of users, this
> makes the machine rather useless for any serious work [1].
> 
> I have now studied the ACPI DSDT one more time and found the event
> that is generated for the ESC key. Unlike all other key events on this
> machine, it is actually a WMI, while the other ones are read from the
> embedded controller.
> 
> I am now installing a WMI notifier that uses the event number from the
> WMI subsystem as the scancode. The only event number generated here is
> '128', and that fits in nicely with the two existing ranges of scancodes
> used by the EC: 0-15 for the 16-bit VPCCMD_R_VPC register, 16-17 for
> the VPCCMD_R_NOVO register and 64-67 for VPCCMD_R_SPECIAL_BUTTONS.
> 
> The only sane way to handle this button (in absence of the Windows Paper
> Display driver) seems to be to have it emit KEY_ESC, so that is what
> I use as the default. Should any user ever want to overwrite the default,
> they can install their own keymap.
> 
> To ensure that we can still build the driver without adding a CONFIG_WMI
> dependency, all new code is enclosed in #ifdef.

I'm not thrilled with the ifdefs, but whether that's worse than the CONFIG_WMI
dependency or not... I'm not prepared to argue, so I'm siding with you :-)

> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> [1] https://forums.lenovo.com/t5/Lenovo-Yoga-Series-Notebooks/YOGA-3-14-How-to-reclaim-my-Esc-key-and-permanently-disable/td-p/2070816
> 

Queued to testing, thanks Arnd.
-- 
Darren Hart
Intel Open Source Technology Center
