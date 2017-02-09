From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 00/10] fujitsu-laptop: renames and cleanups
Date: Thu, 9 Feb 2017 08:29:11 +0100
Message-ID: <20170209072911.GB999@ozzy.nask.waw.pl>
References: <20170208134633.5152-1-kernel@kempniu.pl>
 <20170208225220.GD8250@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:33948 "EHLO
        mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751577AbdBIHaP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Feb 2017 02:30:15 -0500
Received: by mail-lf0-f41.google.com with SMTP id v186so96114894lfa.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Feb 2017 23:29:15 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20170208225220.GD8250@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

> Hi Michael
> 
> Thanks very much for the work you've put in to clean up these patches.  I
> very much appreciate it.  I will go through them myself in the next day or
> so, and most importantly test them on my hardware to confirm there are no
> regressions.

Thanks!  I did my best to keep track of everything, but something surely
could have slipped through, given the number of changes Alan's patches
introduce.

> Some initial comments follow.
> 
> On Wed, Feb 08, 2017 at 02:46:23PM +0100, Micha?? K??pie?? wrote:
> > Some of these patches raise checkpatch warnings.  This is intentional,
> > in order to make renames clean and easy to review.
> 
> For what it's worth, I was also planning to go through and fix the
> checkpatch warnings in this driver, but held off until the issues raised by
> Alan's patches were addressed (essentially to make it easier to apply those
> old patches.  If you are planning on doing this then I won't start it. :-)

I have a few draft patch series prepared that contain "real" cleanups
and incidentally also lower the total count of checkpatch issues in the
driver from ~70 to ~20 (ballpark figures).  I think it is way better to
fix as many checkpatch issues as possible while also fixing actual code
and then iron out the leftovers than to first generate a lot of churn
which fixes spaces and newlines and then fix the code anyway.  So yeah,
I would hold off pure checkpatch fixes until the more pressing matters
get sorted out.

> 
> On to the ommitted changes from Alan's orginal patch series.
> 
> >   - Restructure fujitsu_init().  Quite frankly, I am pretty sure Alan
> >     did not test his series on Fujitsu hardware with a logo lamp and/or
> >     keyboard lamps.
> 
> Back in 2009 I don't think there were many models with these features.  This
> observation is therefore quite possible.  I'm more than happy to leave
> fujitsu_init()'s structure as is, especially given that related issues will
> be addressed in your furture patch series.

Yes, they will.  How these fixes will exactly look depends on the
feedback I get from Darren and Andy.

> 
> >   - Bail out when FUJ02B1 is not present.  It could have been deemed
> >     correct back in the day, but we now know that Fujitsu started
> >     shipping devices without that ACPI device present, though with
> >     FUJ02E3 still in place.  These two ACPI devices are independent and
> >     thus should not rely on each other's presence.
> 
> Agreed.  You are right, in 2009 I think it seemed like a good idea but it's
> clearly no longer valid.
> 
> >   - Move keycode[1-5] fields to struct fujitsu_laptop.  Doing this
> >     causes ordering issues inside fujitsu_init(), while a patch series I
> >     have queued that makes fujitsu-laptop use a sparse keymap removes
> >     these fields altogether.
> 
> This makes sense.
> 
> >   - Allocate and free fujitsu_bl and fujitsu_laptop inside ACPI
> >     callbacks.  While elegant and correct, this also causes ordering
> >     issues inside fujitsu_init() and can only be done once platform
> >     device registration is properly fixed.
> 
> Agreed.
> 
> >   - Sync backlight power status in acpi_fujitsu_bl_add().  The long-term
> >     objective for fujitsu-laptop should be to achieve a clean split
> >     between the backlight-related part and the laptop-related part.
> >     This change keeps both parts intertwined.  My fujitsu_init() cleanup
> >     series contains a similar fix, but I have since found a different
> >     solution to this problem which I will post once Alan's rebased
> >     series gets applied.
> 
> I'm happy to wait to see this alternative solution.  In the meantime,
> keeping the two parts independent is a good idea.
> 
> >   - Remove dmi_check_cb_common().  The sparse keymap series I have
> >     queued gets rid of this function without introducing an additional
> >     field inside struct fujitsu_laptop.
> 
> Ok.
> 
> > Moreover, some other minor changes present in original patch 1/4 were
> > left out.  A brief discussion of each such case follows.
> > 
> > -#define ACPI_FUJITSU_BL_NOTIFY_CODE1    0x80
> > +#define ACPI_FUJITSU_NOTIFY_CODE1     0x80
> > 
> > Notify code 0x80 is used by both parts of the driver (the
> > brightness-related one and the laptop-related one) and thus it should
> > not be annotated using the "_BL" infix specific to brightness-related
> > code.
> 
> Agreed.  Perhaps back in the day it was thought that it did only apply to
> the backlight but with the benefit of hindsight this is clearly not the
> case.
> 
> > -#if defined(CONFIG_LEDS_CLASS) || defined(CONFIG_LEDS_CLASS_MODULE)
> > ...
> > -#endif
> > 
> > This does not really bring any benefit while breaking consistency with
> > other parts of the driver.
> 
> Fair enough.
> 
> > 
> > -       dmi_check_system(fujitsu_laptop_dmi_table);
> > +       dmi_check_system(fujitsu_dmi_table);
> > 
> > The original patches moved this dmi_check_system() call to
> > acpi_fujitsu_laptop_add(), which justifies renaming fujitsu_dmi_table to
> > fujitsu_laptop_dmi_table.  However, for reasons discussed above, the
> > rebased patches leave the dmi_check_system() call inside fujitsu_init(),
> > thus making the rename dubious.
> 
> Agreed.  In light of the reasons given this makes no sense.
> 
> > -                    DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU SIEMENS"),
> > +                    DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU_LAPTOP SIEMENS"),
> > 
> > There are multiple changes like this in original patch 1/4.  They are
> > obviously wrong and were probably introduced by an unreviewed automatic
> > replacement.
> 
> I noticed this myself; they are clearly incorrect and have the hallmarks of
> a global search/replace operation.  They were omitted in the initial RFC
> series I sent through for this reason.
> 
> [Blank line removal]
> > There are four instances of such a removal in original patch 1/4.  They
> > are obviously correct, though they all happen inside functions related
> > to platform device attributes which I hope will soon get removed
> > altogether.  Thus I refrained from applying these to reduce churn (at
> > least a bit).
> 
> I'm happy with that.  The future checkpatch cleanup series could address
> these if they are deemed important enough.

Yes, I have this specific cleanup queued in a branch containing
miscellaneous fixes anyway, so it should not get lost in the noise.

> 
> > Finally, some of the changes suggested by Alan were already applied
> > along the way:
> > 
> >   - kmalloc() + memset() occurences were changed to kzalloc() by commit
> >     6c75dd0f965b ("drivers/platform/x86: Use kzalloc").
> > 
> >   - Unused debug macros were removed by commit 00816e1b3839
> >     ("fujitsu-laptop: Remove unused macros").
> 
> The entire debug structure has been revised since Alan's original patch was
> made, making most if not all of the debug changes unnecessary.
> 
> My ack will follow once I've tested this series on my hardware.  I will try
> to get to this in the next 24 hours.

Great, thanks!

-- 
Best regards,
Michał Kępień
