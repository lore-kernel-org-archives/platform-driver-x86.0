From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v2 0/4] fujitsu_init() cleanup
Date: Mon, 6 Mar 2017 05:49:05 +0100
Message-ID: <20170306044905.GA3845@kmp-mobile.hq.kempniu.pl>
References: <20170301081044.12141-1-kernel@kempniu.pl>
 <20170304014723.GA7944@marvin.atrad.com.au>
 <20170305234854.GG28473@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170305234854.GG28473@marvin.atrad.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi Jonathan,

Thanks for testing this series.

> Hi Michael
> 
> On Sat, Mar 04, 2017 at 12:17:23PM +1030, Jonathan Woithe wrote:
> > On Wed, Mar 01, 2017 at 09:10:40AM +0100, Micha?? K??pie?? wrote:
> > > These patches should make fujitsu_init() a bit more palatable.  No
> > > changes are made to platform device code yet, for clarity these will be
> > > posted in a separate series after this one gets applied.
> > 
> > I have a preliminary report.  The backlight functionality remains functional
> > on an S7020 across all four of the patches in this series and with the
> > additional 2-patch cleanup series applied.
> > 
> > With regard to patch 2/4 you wrote:
> > > Jonathan, this *really* needs testing on relevant hardware.  After
> > > applying this patch, you should be able to turn LCD backlight on and off
> > > using /sys/class/backlight/fujitsu-laptop/bl_power.  Also, the value
> > > returned by that attribute upon read should be in sync with actual
> > > backlight state even right after loading the module (i.e. before writing
> > > anything to bl_power).  Please let me know if any of the above is not
> > > true and the module works correctly without this patch applied.
> > 
> > With patch 2/4 applied:
> > 
> >  * It is possible to read bl_power
> > 
> >  * It is possible to write a value to bl_power and read that value back
> > 
> >  * Writing values to bl_power does not appear to affect the LCD panel in 
> >    any way.  That is, the backlight remains unchanged regardless of the 
> >    value written.
> > 
> >  * Behaviour is the same both under X and from the terminal.
> > 
> > Backing out patch 2/4 but with all others still in place, resulted in no
> > change in behaviour.  So while bl_power had no effect with patch 2/4 in
> > place, it seems that patch 2/4 is *not* the cause of this.
> > 
> > I shall run some more bl_power tests and complete a review of the code later
> > this weekend.
> 
> I have completed a review of the code in this patch series (patches 1-4 of
> 4) and can find no obvious problems.  There do not appear to be any
> regressions introduced by this patch series.  As noted, patch 2/4 does not
> provide working backlight power control on an S7020 but it may well be that
> this has never been functional on the S7020 (I do not make use of bl_power
> myself).
> 
> I can add that immediately after loading the driver the value returned by a
> read of bl_power is 0.  As noted above, setting to 1 makes no difference to
> the backlight, neither does returning it to 0.

Have you tried setting bl_power to 4?  Because that is the value of
FB_BLANK_POWERDOWN, which is the value the patch is supposed to handle.

> A value of 0 would normally
> indicate that it's on I think,

Yes, I believe so too as 0 corresponds to FB_BLANK_UNBLANK.

> which means that the initial read of the
> backlight power state does not appear to be working either.

So I assume you have some kind of external display connected and the LCD
backlight is off, correct?  Just curious at this point.

> As for the
> other behaviour, this does not change if patch 2/4 is omitted.

Commit 3a407086090b ("fujitsu-laptop: Add BL power, LED control and
radio state information") which introduced backlight control mentions it
was "tested on the S6420, P8010 & U810 platforms".  Not sure if
backlight control was tested on all these models and S7020 is not listed
here, though I still find it puzzling that it did not work in the first
place, i.e. without this series applied.  This patch emerged from
reading the DSDT table of a S7020, so I would expect backlight control
to at least work properly through the "officially exposed" interface,
i.e. FEXT.

> Unfortunately I ran out of time over the weekend to cross check the
> behaviour of bl_power on the S7020 with an unpatched kernel (as mentioned, I
> don't utilise bl_power routinely myself and therefore can't recall whether
> it has worked on my hardware in the past).  For completeness I will try to
> look at this sometime this week.  However, given the patch content and the
> observation that omitting patch 2/4 makes no difference to the S7020
> behaviour I am satisfied that at least on S7020 this patch series does not
> introduce any regressions and represents a worthwhile clean up of the
> driver's code.

I would be happy to hear from someone for whom bl_power works as
expected, though we really should not leave that backlight sync code
where it currently is, so I am happy this is the conclusion you came to.

> 
> I am happy to see this series applied in its entirety (including patch 2/4).
> 
> Tested-by: Jonathan Woithe <jwoithe@just42.net>
> Reviewed-by: Jonathan Woithe <jwoithe@just42.net>

Thanks,

-- 
Best regards,
Michał Kępień
