From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] toshiba_acpi: Fix blank screen at boot if transflective
 backlight is supported
Date: Fri, 20 Nov 2015 16:48:30 -0800
Message-ID: <20151121004830.GN7413@malice.jf.intel.com>
References: <1447644767-356-1-git-send-email-coproscefalo@gmail.com>
 <20151120231632.GC7413@malice.jf.intel.com>
 <CAGdLNWE8XJZ_EZwKU0HeH5-37qxOubPzVyGZj+=dFazXxg=pjA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:54864 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752011AbbKUAse (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 20 Nov 2015 19:48:34 -0500
Content-Disposition: inline
In-Reply-To: <CAGdLNWE8XJZ_EZwKU0HeH5-37qxOubPzVyGZj+=dFazXxg=pjA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable@vger.kernel.org, Fabian Koester <fabian.koester@bringnow.com>

On Fri, Nov 20, 2015 at 04:46:07PM -0700, Azael Avalos wrote:
> Hi Darren,
> 
> 2015-11-20 16:16 GMT-07:00 Darren Hart <dvhart@infradead.org>:
> > On Sun, Nov 15, 2015 at 08:32:47PM -0700, Azael Avalos wrote:
> >> If transflective backlight is supported and the brightness is zero
> >> (lowest brightness level), the set_lcd_brightness function will activate
> >> the transflective backlight, making the LCD appear to be turned off.
> >>
> >> This patch fixes the issue by incrementing the brightness level, and
> >> by doing so, avoiding the activation of the tranflective backlight.
> >
> > So... I'm not sure this is a bug or even wrong behavior. The lowest setting on
> > my Thinkpad Yoga 12 is also "off" in Linux. Same is true for my Mac Book Pro (in
> > Mac OS X).
> 
> Yeah, and even on "regular" (with non transflective backlight) Toshibas
> zero is also "off" and no problem is observed.
> 
> >
> > From what I can tell, what this patch does is merely disable the lowest setting.
> 
> Nope, we are just not letting the driver enable transflective backlight
> and continue using the "normal" brightness range.
> 
> >
> > What is it about this behavior that is considered to be wrong?
> >
> 
> The problem is with laptops with transflective backlight support.
> 
> The code for transflective backlight is fused with the LCD backlight
> code (go figure...), so if a Toshiba laptop with transflective support
> is detected, the max brightness levels are raised by one.
> 
> A regular laptop's brightness levels are 0-7, but on a laptop with
> transflective support, the brightness levels are 0-8, zero being
> "activate transflective backlight" and 1-8 the regular brightness
> levels.
> 
> So, when a laptop with transflective support AND an initial
> brightness level of zero gets probed for backlight support,
> the set_lcd_brightness function activates the transfective
> backlight, as the brightness levels are still not incremented,
> and thus, the screen goes dark.
> 
> 
> I hope this clarifies a bit the situation here.


Thanks, queued to testing.

-- 
Darren Hart
Intel Open Source Technology Center
