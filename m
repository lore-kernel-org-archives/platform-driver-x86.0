From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH 00/10] fujitsu-laptop: renames and cleanups
Date: Thu, 9 Feb 2017 09:22:20 +1030
Message-ID: <20170208225220.GD8250@marvin.atrad.com.au>
References: <20170208134633.5152-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170208134633.5152-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi Michael

Thanks very much for the work you've put in to clean up these patches.  I
very much appreciate it.  I will go through them myself in the next day or
so, and most importantly test them on my hardware to confirm there are no
regressions.  Some initial comments follow.

On Wed, Feb 08, 2017 at 02:46:23PM +0100, Micha?? K??pie?? wrote:
> Some of these patches raise checkpatch warnings.  This is intentional,
> in order to make renames clean and easy to review.

For what it's worth, I was also planning to go through and fix the
checkpatch warnings in this driver, but held off until the issues raised by
Alan's patches were addressed (essentially to make it easier to apply those
old patches.  If you are planning on doing this then I won't start it. :-)

On to the ommitted changes from Alan's orginal patch series.

>   - Restructure fujitsu_init().  Quite frankly, I am pretty sure Alan
>     did not test his series on Fujitsu hardware with a logo lamp and/or
>     keyboard lamps.

Back in 2009 I don't think there were many models with these features.  This
observation is therefore quite possible.  I'm more than happy to leave
fujitsu_init()'s structure as is, especially given that related issues will
be addressed in your furture patch series.

>   - Bail out when FUJ02B1 is not present.  It could have been deemed
>     correct back in the day, but we now know that Fujitsu started
>     shipping devices without that ACPI device present, though with
>     FUJ02E3 still in place.  These two ACPI devices are independent and
>     thus should not rely on each other's presence.

Agreed.  You are right, in 2009 I think it seemed like a good idea but it's
clearly no longer valid.

>   - Move keycode[1-5] fields to struct fujitsu_laptop.  Doing this
>     causes ordering issues inside fujitsu_init(), while a patch series I
>     have queued that makes fujitsu-laptop use a sparse keymap removes
>     these fields altogether.

This makes sense.

>   - Allocate and free fujitsu_bl and fujitsu_laptop inside ACPI
>     callbacks.  While elegant and correct, this also causes ordering
>     issues inside fujitsu_init() and can only be done once platform
>     device registration is properly fixed.

Agreed.

>   - Sync backlight power status in acpi_fujitsu_bl_add().  The long-term
>     objective for fujitsu-laptop should be to achieve a clean split
>     between the backlight-related part and the laptop-related part.
>     This change keeps both parts intertwined.  My fujitsu_init() cleanup
>     series contains a similar fix, but I have since found a different
>     solution to this problem which I will post once Alan's rebased
>     series gets applied.

I'm happy to wait to see this alternative solution.  In the meantime,
keeping the two parts independent is a good idea.

>   - Remove dmi_check_cb_common().  The sparse keymap series I have
>     queued gets rid of this function without introducing an additional
>     field inside struct fujitsu_laptop.

Ok.

> Moreover, some other minor changes present in original patch 1/4 were
> left out.  A brief discussion of each such case follows.
> 
> -#define ACPI_FUJITSU_BL_NOTIFY_CODE1    0x80
> +#define ACPI_FUJITSU_NOTIFY_CODE1     0x80
> 
> Notify code 0x80 is used by both parts of the driver (the
> brightness-related one and the laptop-related one) and thus it should
> not be annotated using the "_BL" infix specific to brightness-related
> code.

Agreed.  Perhaps back in the day it was thought that it did only apply to
the backlight but with the benefit of hindsight this is clearly not the
case.

> -#if defined(CONFIG_LEDS_CLASS) || defined(CONFIG_LEDS_CLASS_MODULE)
> ...
> -#endif
> 
> This does not really bring any benefit while breaking consistency with
> other parts of the driver.

Fair enough.

> 
> -       dmi_check_system(fujitsu_laptop_dmi_table);
> +       dmi_check_system(fujitsu_dmi_table);
> 
> The original patches moved this dmi_check_system() call to
> acpi_fujitsu_laptop_add(), which justifies renaming fujitsu_dmi_table to
> fujitsu_laptop_dmi_table.  However, for reasons discussed above, the
> rebased patches leave the dmi_check_system() call inside fujitsu_init(),
> thus making the rename dubious.

Agreed.  In light of the reasons given this makes no sense.

> -                    DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU SIEMENS"),
> +                    DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU_LAPTOP SIEMENS"),
> 
> There are multiple changes like this in original patch 1/4.  They are
> obviously wrong and were probably introduced by an unreviewed automatic
> replacement.

I noticed this myself; they are clearly incorrect and have the hallmarks of
a global search/replace operation.  They were omitted in the initial RFC
series I sent through for this reason.

[Blank line removal]
> There are four instances of such a removal in original patch 1/4.  They
> are obviously correct, though they all happen inside functions related
> to platform device attributes which I hope will soon get removed
> altogether.  Thus I refrained from applying these to reduce churn (at
> least a bit).

I'm happy with that.  The future checkpatch cleanup series could address
these if they are deemed important enough.

> Finally, some of the changes suggested by Alan were already applied
> along the way:
> 
>   - kmalloc() + memset() occurences were changed to kzalloc() by commit
>     6c75dd0f965b ("drivers/platform/x86: Use kzalloc").
> 
>   - Unused debug macros were removed by commit 00816e1b3839
>     ("fujitsu-laptop: Remove unused macros").

The entire debug structure has been revised since Alan's original patch was
made, making most if not all of the debug changes unnecessary.

My ack will follow once I've tested this series on my hardware.  I will try
to get to this in the next 24 hours.

Regards
  jonathan
