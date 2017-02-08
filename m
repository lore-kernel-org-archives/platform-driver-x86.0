From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 00/10] fujitsu-laptop: renames and cleanups
Date: Wed, 8 Feb 2017 17:24:53 +0200
Message-ID: <CAHp75VfaN+wefbk71OthMDTeDLc9pu7fwrnMm_0hrh8VocheHw@mail.gmail.com>
References: <20170208134633.5152-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170208134633.5152-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Feb 8, 2017 at 3:46 PM, Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempni=
u.pl> wrote:
> This series of patches was originally submitted by Alan Jenkins in
> September 2009.  For various reasons they were never acted upon before.
> Sadly, their original state makes them unreviewable due to multiple
> changes happening within one patch and unreliable commit messages.
>
> In order for Alan's efforts not to go to waste, I have rebased his
> patches on top of dvhart/for-next, further split them into logically
> separate changes and rewrote commit messages from scratch, based on the
> assumed intent of the original author.
>
> Here is how the original patches map to the rebased and split patches:
>
>     1/4 -> 1-6/10
>     2/4 -> 7-8/10
>     3/4 ->   9/10
>     4/4 ->  10/10
>
> Some of these patches raise checkpatch warnings.  This is intentional,
> in order to make renames clean and easy to review.  All of these issues
> will be fixed by upcoming patch series.
>
> Not all ideas suggested by Alan are present in the rebased series.  A
> brief discussion of each rejected suggestion follows (most important
> issues first).
>
>   - Restructure fujitsu_init().  Quite frankly, I am pretty sure Alan
>     did not test his series on Fujitsu hardware with a logo lamp and/or
>     keyboard lamps.  Neither have I, but with his original patches
>     applied, what happens on such a model is:
>
>      1. fujitsu_init() calls acpi_bus_register_driver().
>      2. acpi_fujitsu_laptop_add() is called.
>      3. fujitsu_laptop is kzalloc()'ed.
>      4. fujitsu_laptop->pf_device->dev is accessed.
>
>     This results in a NULL dereference, because the platform device is
>     only allocated and registered later in fujitsu_init().
>
>     On the other hand, registering the platform device before the ACPI
>     driver is also incorrect due to reasons I already pointed out in
>     another thread (in short: we cannot _assume_ FUJ02E3 is present).
>     This can only be fixed properly by registering the platform device
>     inside acpi_fujitsu_laptop_add(), but I am still waiting for
>     comments from Darren and Andy in the other thread before moving
>     forward down this path.
>
>   - Bail out when FUJ02B1 is not present.  It could have been deemed
>     correct back in the day, but we now know that Fujitsu started
>     shipping devices without that ACPI device present, though with
>     FUJ02E3 still in place.  These two ACPI devices are independent and
>     thus should not rely on each other's presence.
>
>   - Move keycode[1-5] fields to struct fujitsu_laptop.  Doing this
>     causes ordering issues inside fujitsu_init(), while a patch series I
>     have queued that makes fujitsu-laptop use a sparse keymap removes
>     these fields altogether.
>
>   - Allocate and free fujitsu_bl and fujitsu_laptop inside ACPI
>     callbacks.  While elegant and correct, this also causes ordering
>     issues inside fujitsu_init() and can only be done once platform
>     device registration is properly fixed.
>
>   - Sync backlight power status in acpi_fujitsu_bl_add().  The long-term
>     objective for fujitsu-laptop should be to achieve a clean split
>     between the backlight-related part and the laptop-related part.
>     This change keeps both parts intertwined.  My fujitsu_init() cleanup
>     series contains a similar fix, but I have since found a different
>     solution to this problem which I will post once Alan's rebased
>     series gets applied.
>
>   - Remove dmi_check_cb_common().  The sparse keymap series I have
>     queued gets rid of this function without introducing an additional
>     field inside struct fujitsu_laptop.
>
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
>
> -#if defined(CONFIG_LEDS_CLASS) || defined(CONFIG_LEDS_CLASS_MODULE)
> ...
> -#endif
>
> This does not really bring any benefit while breaking consistency with
> other parts of the driver.
>
> -       dmi_check_system(fujitsu_laptop_dmi_table);
> +       dmi_check_system(fujitsu_dmi_table);
>
> The original patches moved this dmi_check_system() call to
> acpi_fujitsu_laptop_add(), which justifies renaming fujitsu_dmi_table to
> fujitsu_laptop_dmi_table.  However, for reasons discussed above, the
> rebased patches leave the dmi_check_system() call inside fujitsu_init(),
> thus making the rename dubious.
>
> -                    DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU SIEMENS"),
> +                    DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU_LAPTOP SIEMENS"),
>
> There are multiple changes like this in original patch 1/4.  They are
> obviously wrong and were probably introduced by an unreviewed automatic
> replacement.
>
> @@ -495,7 +495,6 @@ static ssize_t
>  show_max_brightness(struct device *dev,
>                     struct device_attribute *attr, char *buf)
>  {
> -
>         int ret;
>
> There are four instances of such a removal in original patch 1/4.  They
> are obviously correct, though they all happen inside functions related
> to platform device attributes which I hope will soon get removed
> altogether.  Thus I refrained from applying these to reduce churn (at
> least a bit).
>
> Finally, some of the changes suggested by Alan were already applied
> along the way:
>
>   - kmalloc() + memset() occurences were changed to kzalloc() by commit
>     6c75dd0f965b ("drivers/platform/x86: Use kzalloc").
>
>   - Unused debug macros were removed by commit 00816e1b3839
>     ("fujitsu-laptop: Remove unused macros").
>

Nice clean up!
So, I would apply 1-7, for the rest I need more time to review.

Regarding ACPI case and device presents you may assume it if you just call
acpi_walk_namespace() (AFAIU) and check _STA for the device if it's in
the table.

So, at any point you may have got understanding if device is present
or not, and if it's active or not.

--=20
With Best Regards,
Andy Shevchenko
