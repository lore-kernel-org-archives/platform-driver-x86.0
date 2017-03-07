From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v2 0/4] fujitsu_init() cleanup
Date: Tue, 7 Mar 2017 09:08:07 +0100
Message-ID: <20170307080807.GA1805@ozzy.nask.waw.pl>
References: <20170301081044.12141-1-kernel@kempniu.pl>
 <20170304014723.GA7944@marvin.atrad.com.au>
 <20170305234854.GG28473@marvin.atrad.com.au>
 <20170306044905.GA3845@kmp-mobile.hq.kempniu.pl>
 <20170306050104.GT28473@marvin.atrad.com.au>
 <20170306081030.GA30975@marvin.atrad.com.au>
 <20170306093350.GB1372@ozzy.nask.waw.pl>
 <20170306184723.GA795@kmp-mobile.hq.kempniu.pl>
 <20170307035016.GY23178@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:35551 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753331AbdCGIQV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 7 Mar 2017 03:16:21 -0500
Received: by mail-lf0-f66.google.com with SMTP id v2so8393142lfi.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Mar 2017 00:15:39 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20170307035016.GY23178@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

> Hi Michael
> 
> On Mon, Mar 06, 2017 at 07:47:23PM +0100, Micha?? K??pie?? wrote:
> > > > In light of the above findings, what would you like to do?
> > > 
> > > Thanks for testing, good that we caught this before the patch series was
> > > applied.  I think it is reasonable to skip applying this version of the
> > > series as at least patch 2/4 is faulty and breaks a working feature.
> > > 
> > > Moving on, though, as I do not have access to Fujitsu hardware on which
> > > this feature works, I was hoping you could help me verify whether my
> > > assumptions were reasonable in the first place.  
> > > 
> > > I attached a crude patch to this message.  I would like to understand
> > > how the underlying ACPI variables behave when the FEXT interface is
> > > used, so please apply this patch on top of dvhart/testing (i.e. without
> > > this series applied).  After compiling, please load the module with
> > > debugging enabled, then test backlight control once again by writing 4
> > > and then 0 to bl_power (this should work).  Then please send me all the
> > > messages spit out by the driver into dmesg.  This should shed some light
> > > on the matter.
> 
> I have done this.  Writing 4 to bl_power did indeed turn the backlight off,
> and 0 restored it.  Annotated output from dmesg is at the end of this
> message.
> 
> > Actually, scratch that.  I just ordered a banged up S7020 for ???15 to
> > avoid pestering you with experimental patches and hopefully make the
> > whole driver cleanup process a bit smoother.
> 
> Ok, no problem.  Obviously I'm still happy to test as required.
> 
> > Darren, Andy, please ignore this whole series for now.  I will post v3
> > once I figure out how to clean things up without breaking working
> > features.
> 
> To clarify, I see no reason why the earlier 2-patch cleanup series can't go
> in at this stage.  It's only this 4-part patch which needs revision in light
> of recent findings.

Yes, this is what I meant.  As I mentioned earlier in this thread [1],
v2 of the 2-patch series for acpi_fujitsu_bl_notify() is independent
from this one.

[]

> 
> echo 4 > /sys/devices/virtual/backlight/fujitsu-laptop/bl_power
> 
> [ 3320.168775] fujitsu_laptop: call_fext_func: FUNC 0x1004 (args 0x1, 0x4, 0x3) returned 0x0
> [ 3320.168779] fujitsu_laptop: bl_update_status: Backlight power set to 4
> [ 3320.168793] fujitsu_laptop: bl_update_status: BLCT = 1
> [ 3320.168800] fujitsu_laptop: bl_update_status: NGTM = 3
> [ 3320.168805] fujitsu_laptop: bl_update_status: Got ACPI handle for SBLC
> [ 3320.168808] fujitsu_laptop: set_lcd_level: set lcd level via SBLL [7]
> 
> echo 4 > /sys/devices/virtual/backlight/fujitsu-laptop/bl_power
> 
> [ 3322.774773] fujitsu_laptop: call_fext_func: FUNC 0x1004 (args 0x1, 0x4, 0x0) returned 0x0
> [ 3322.774776] fujitsu_laptop: bl_update_status: Backlight power set to 0
> [ 3322.774790] fujitsu_laptop: bl_update_status: BLCT = 0
> [ 3322.774798] fujitsu_laptop: bl_update_status: NGTM = 0
> [ 3322.774802] fujitsu_laptop: bl_update_status: Got ACPI handle for SBLC
> [ 3322.774804] fujitsu_laptop: set_lcd_level: set lcd level via SBLL [7]

Okay, this is exactly what I feared.  I correctly inferred how BLCT
behaves from the DSDT dump, but it looks like it works in tandem with
NGTM, which can only be set using the FUNC interface.

This means that, to avoid code duplication, we will need to use
call_fext_func() from within the backlight driver.  If we decide to
split backlight-related code and the rest into two separate modules,
this means that the backlight module will depend on the laptop module.
This is not really bad in and of itself, but I was hoping we could do
better than that.  That being said, a part of me is also happy that we
will stick to the "official" interface instead of doing custom low-level
tricks.

Anyway, I will prepare a v3 that does not break backlight control.
Driver untangling will have to wait.

[1] https://www.spinics.net/lists/platform-driver-x86/msg10776.html

-- 
Best regards,
Michał Kępień
