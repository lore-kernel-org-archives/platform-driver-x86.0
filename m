Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09976BFCE
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Feb 2026 04:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770610668; cv=pass; b=OqmHlTOeJpVccbp7rngLcu57tmKE3m3D8dSbreoa//sVOD/ExLuHOx9JjwRXRzRyjyOE4+WWAYiC6krByukUhPg2Q0bCRp4cqmT8LI+ctSIAm/e2s4V1hAwoZEFlYEpQp7QNEkRqrGoP+47pSq/fcIEMtnxqyZb6ujVXWMRD56E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770610668; c=relaxed/simple;
	bh=cRFVtA813xgio+HtbFUlB0Qk2SFkym1x0aHpUcdZ1ak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lqRxjxMG0n7nAPSWbA/5JjPmm+ukpsV7gWnD28taUNWc91ME2aj8Yd1AtjEIumquWXAoJWP2pw6T+D2B+O0wvnLLw7t4Sdz7mzT/kDy3SfYbHwmTx1VWrp4ucDTATixCw45AuvbpZV+Ub8F9wArKZCYj4lWipniTw+nWT0j8xDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xi9Ta5tv; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xi9Ta5tv"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59dcdf60427so4403808e87.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 08 Feb 2026 20:17:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770610666; cv=none;
        d=google.com; s=arc-20240605;
        b=J1ONclr0MP35D+ihLUfEgyX88CUA+GGD5/R1HWhIBAiGyyPeUgn9cuvpt+yRhKtFtu
         upcNxI/rk2nBrBIZ2d2d0lyOItf/araBX2sskHJ2askVnYcNmftnTzLnVPCLS0Q7N3SU
         1RomD/TOt7Z+m+7jciHVEeeLXb/3MN6uztAeKtP4BG4nJHGGPgPlNVlQ/lP7ZG4h1s8u
         ktNbOtvhBVnfEHvRtD9ThLzoWdHDK0K3mVN1c1LEyfPf5ccFnSoqyMkTysm87UwyZv+4
         n1Zxkj5Uc8zGQXPqPvJYoO91Ul7IzRrWsaX+0HUdxABrq9S/rQSFC6THMtRLywPWBxM9
         5f5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QVR/HDKS1NYRkh2eEZR+Uo0uUCwVg1y44ubnRqi4ECo=;
        fh=XXDfijkoFvVSneulFjArQV/75xiQEtrI0HUXe1jvTk4=;
        b=fCFM13x5Fz2e3R6P3AqwIuLIkznN8tfPW1c4R8WaE1N1MLP5W6tektsMXFfSfp9UEn
         XA/fWUUkNeKKYOlQdM64LyEXzqaWNLY5eGk1VIJ3WM/LT4x6hm0a7RnKSIjFtT8jxXOq
         PwV5CgnSbQ7XlNjKSLIHKdvNNZsfF7w14gZuZhy0IAmmCksG3vE5XpOwKOWPbVFQYBY4
         IJGnpkdIQD2fUYdB/d1XjzSVVroGJ3of962uvf30117y4DBNKAWz4FegDgsOfUOQhBCG
         UBRH1BPBac3rrCyy+r5zWwAma4ZRN3MwJ9SvQ2Cobak2yt3/gp58fTEmzfdNqZofo0vp
         7spQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770610666; x=1771215466; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVR/HDKS1NYRkh2eEZR+Uo0uUCwVg1y44ubnRqi4ECo=;
        b=Xi9Ta5tvL31nMSDg9qrxQ7r3uIq/STT8wVPx0tCvgqb82aoQ8yAKiCAznVSp6BKBtj
         Y+mXKl3SH8lRBLYKv8U44V9vCUL8N7x69GmcKCKBisWQkXOvseJTnVMasMUB1VqHN00m
         Q/pDakWLCBWdIophqFtmHuqicGEjZUf5YjVPARlkXuqfW7EgMlphN0vKM2/4beClrxsl
         JtVTa1P18Jd2B588hjtha2VCyu1i+fooYxQbQCC2PZDg63CzO3BG5hDwCvm3ruPxnSYn
         QGHchHPNLQXZDndS6t67nB310EKJM+MdJ3P0xL7CgcoPTuGc1CIeAFug1i3mowEYIIBS
         3rqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770610666; x=1771215466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QVR/HDKS1NYRkh2eEZR+Uo0uUCwVg1y44ubnRqi4ECo=;
        b=Nk4XYZIhNz2jRlqgpgjYpG5FZByB1m1hMFcWKOuBqcXG1wB7S9dpX0xPqoo2j8EgHF
         fmpTYQJc3q9rNput7McoyrnJmSc4A5TN30aE4JjndDmdOu2IWbYBzuYtsPnwkAjaZDUh
         eAspkAvCp8GVdcrLtkzWLnyPoIEcutmjjN7b636z1IIWoCxZT1wUuCHUfJj244eEIHmf
         ceRhgMpjINJnx+BFLqpnWJQYTKhReCMNPRYZvLpng1BcCRzlAHmHwzLh7qKrfMIWYycs
         iuQzeOClSsVeUXqKmdK2M7kuutZZ8lpCjv1meDKqwpLnL20yptZKSVxj6PcOKHcRdhO1
         Fj9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXoDqW/UEioP0OIUbHwonn3kS0HHSdXzy1QHB9tvlfWZekb4OPzXT2wnw+6GYUidYjjFSg35vvlXflS9gLrdd89TrAJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwuMylLB1cp/qX/I2lHJ5tSBOvN8fqUGortK54pPFj7dk39IX2K
	FfXbr2EW6k2MbOwC0eWeCgPRCUKsTxWsFxHzeVTh5rj/nvJACuKqwpANPZON94HsBkiF2ihorA7
	2fHU/8x7xfOCsEtbB0FYp4w7DFC/U2cM=
X-Gm-Gg: AZuq6aKpAikVtoYTlRsRZWVacJjN03U8Btq/DY/2+cOaVp6zk5VWD+3uZPUQNGAM51E
	FLENQC4G/zV85c7cT9qIsJ4T5K7nsgBwob6YKGTGW+rFnXh5u/c/0szZ3cRwmwevGnO/aEDJ2m+
	744mP2Yn3mNwF0On+nP+oFBi4G2GzIFNTINdEyw+Y8X0MstiH7AEgj/e9izk/nO2m+OpEsBdmx0
	bIioIKHbwv3UtzfFCCQz3qt+PH5kk+pt3DaBE4t6VDyFb3NtHMazONNB3ZdxdvsWdUEDRT280CJ
	Pipg/8RbMBPuP5y0dfcyPmkaK0w=
X-Received: by 2002:a05:6512:23a3:b0:59d:de87:3352 with SMTP id
 2adb3069b0e04-59e451620e7mr3154419e87.35.1770610665538; Sun, 08 Feb 2026
 20:17:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203232219.11683-1-vishnuocv@gmail.com> <30354f74-91c0-4fd6-82b1-15f79ae7a60f@kernel.org>
 <1dbfcf656cdb4af0299f90d7426d2ec7e2b8ac9e.camel@rong.moe>
In-Reply-To: <1dbfcf656cdb4af0299f90d7426d2ec7e2b8ac9e.camel@rong.moe>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Mon, 9 Feb 2026 13:17:08 +0900
X-Gm-Features: AZwV_Qgx42qgnnY579OfT6vgm9zThVk3Ng6iFYuE7BcrOU3Lkwyi2TeRREjvx2E
Message-ID: <CABxCQKug=Z2U+tT5YA1yDUW6FQVMHHHM-efmaTak-U+0pLxpNw@mail.gmail.com>
Subject: Re: [PATCH] thinkpad_acpi: Add Auto mode support with dynamic max_brightness
To: Rong Zhang <i@rong.moe>
Cc: Hans de Goede <hansg@kernel.org>, mpearson-lenovo@squebb.ca, hmh@hmh.eng.br, 
	derekjohn.clark@gmail.com, ilpo.jarvinen@linux.intel.com, 
	ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, vsankar@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans and Rong,

Thank you so much for the comments.

On Mon, Feb 9, 2026 at 6:03=E2=80=AFAM Rong Zhang <i@rong.moe> wrote:
>
> Hi Hans, Vishnu and Mark,
>
> On Sun, 2026-02-08 at 11:54 +0100, Hans de Goede wrote:
> > Hi Vishnu,
> >
> > On 4-Feb-26 00:22, Vishnu Sankar wrote:
> > > Dynamically detect keyboard backlight capabilities and set
> > > max_brightness correctly (2 for old models, 3 for new models
> > > with Auto mode).
> >
> > Thank you for your patch.
> >
> > If I understand this correctly, writing 3 as level does not
> > make the backlight more bright then writing 2, but instead
> > it puts the backlight in some auto mode ?
> >
This is correct.
> > If I've that correct then  userspace should keep seeing
> > a range of 0 - 2 and the special auto mode value should
> > be reported / be made settable through a separate als_enabled
> > sysfs attribute under the LED class device. See:
> >
> > Documentation/ABI/testing/sysfs-platform-dell-laptop
> >
> > You can add extra attributes there by setting the groups
> > member of the struct led_classdev, see kbd_led_groups[]
> > in drivers/platform/x86/dell/dell-laptop.c, except that
> > you should use a .is_visible callback to only show this
> > on hw which supports it and you only need 1 group with
> > 1 attribute.
Got it.
I believe, once Rong's changes come up, We may need to handle it a bit
different.
>
> When I implemented "als_enabled" for ideapad-laptop, Mark Pearson
> suggested it'd better to introduce "something similar to
> LED_BRIGHT_HW_CHANGED" rather than using custom attributes, as "this is
> going to be a common feature across multiple vendors it might need
> doing at a common layer". Also, auto mode can be activated by HW as a
> result of user input, so we need an approach to notify userspace just
> like what LED_BRIGHT_HW_CHANGED does. More importantly, the read value
> of the brightness attribute becomes nonsense when auto mode is on. This
> matches the semantic of hw control trigger.
>
> I agreed with Mark and had a proposal of allowing HW to initiate a
> transition from "none" to hw control trigger and vice versa. See the
> thread in
> https://lore.kernel.org/all/08580ec5-1d7b-4612-8a3f-75bc2f40aad2@app.fast=
mail.com/
Thank you Rong.
We had a discussion a few months back about this internally.
I will discuss with Mark on this approach again.
>
> I hadn't push it further due to other things taking the priority,
> though I already had a PoC back to then. I quickly rebased the PoC with
> some cleanups and put it here for preview:
>
> https://github.com/Rongronggg9/linux/tree/leds-trigger-hw-changed
>
> I will find some time to refine it and send an RFC series.
Thank you.
>
> Thanks,
> Rong
>
> > Regards,
> >
> > Hans
> >
> >
> >
> >
> >
> >
> > >
> > > Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> > > Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
> > > ---
> > >  drivers/platform/x86/lenovo/thinkpad_acpi.c | 33 ++++++++++++++++++-=
--
> > >  1 file changed, 29 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/pl=
atform/x86/lenovo/thinkpad_acpi.c
> > > index cc19fe520ea9..f670cdd1791e 100644
> > > --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> > > +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> > > @@ -5043,6 +5043,9 @@ static struct ibm_struct video_driver_data =3D =
{
> > >  static enum led_brightness kbdlight_brightness;
> > >  static DEFINE_MUTEX(kbdlight_mutex);
> > >
> > > +/* Maximum level supported by hardware, will be updated in init */
> > > +static int kbdlight_max_level =3D 2;
> > > +
> > >  static int kbdlight_set_level(int level)
> > >  {
> > >     int ret =3D 0;
> > > @@ -5050,6 +5053,10 @@ static int kbdlight_set_level(int level)
> > >     if (!hkey_handle)
> > >             return -ENXIO;
> > >
> > > +   /* Validate against detected max level */
> > > +   if (level < 0 || level > kbdlight_max_level)
> > > +           return -EINVAL;
> > > +
> > >     mutex_lock(&kbdlight_mutex);
> > >
> > >     if (!acpi_evalf(hkey_handle, NULL, "MLCS", "dd", level))
> > > @@ -5075,6 +5082,7 @@ static int kbdlight_get_level(void)
> > >     if (status < 0)
> > >             return status;
> > >
> > > +   /* Status can be 0, 1, 2, or 3 (Auto) */
> > >     return status & 0x3;
> > >  }
> > >
> > > @@ -5143,7 +5151,7 @@ static enum led_brightness kbdlight_sysfs_get(s=
truct led_classdev *led_cdev)
> > >  static struct tpacpi_led_classdev tpacpi_led_kbdlight =3D {
> > >     .led_classdev =3D {
> > >             .name           =3D "tpacpi::kbd_backlight",
> > > -           .max_brightness =3D 2,
> > > +           .max_brightness =3D 2,    /*Initial value, will be update=
d in init*/
> > >             .flags          =3D LED_BRIGHT_HW_CHANGED,
> > >             .brightness_set_blocking =3D &kbdlight_sysfs_set,
> > >             .brightness_get =3D &kbdlight_sysfs_get,
> > > @@ -5167,6 +5175,17 @@ static int __init kbdlight_init(struct ibm_ini=
t_struct *iibm)
> > >     kbdlight_brightness =3D kbdlight_sysfs_get(NULL);
> > >     tp_features.kbdlight =3D 1;
> > >
> > > +   /* Detect hardware capabilities and set max_brightness */
> > > +   if (acpi_evalf(hkey_handle, NULL, "MLCS", "dd", 3)) {
> > > +           /* MLCS accepts level 3 - new ThinkPad with Auto mode */
> > > +           kbdlight_max_level =3D 3;
> > > +           tpacpi_led_kbdlight.led_classdev.max_brightness =3D 3;
> > > +   } else {
> > > +           /* MLCS rejects level 3 - old ThinkPad */
> > > +           kbdlight_max_level =3D 2;
> > > +           tpacpi_led_kbdlight.led_classdev.max_brightness =3D 2;
> > > +   }
> > > +
> > >     rc =3D led_classdev_register(&tpacpi_pdev->dev,
> > >                                &tpacpi_led_kbdlight.led_classdev);
> > >     if (rc < 0) {
> > > @@ -5201,6 +5220,7 @@ static int kbdlight_set_level_and_update(int le=
vel)
> > >  static int kbdlight_read(struct seq_file *m)
> > >  {
> > >     int level;
> > > +   int i;
> > >
> > >     if (!tp_features.kbdlight) {
> > >             seq_printf(m, "status:\t\tnot supported\n");
> > > @@ -5210,9 +5230,13 @@ static int kbdlight_read(struct seq_file *m)
> > >                     seq_printf(m, "status:\t\terror %d\n", level);
> > >             else
> > >                     seq_printf(m, "status:\t\t%d\n", level);
> > > -           seq_printf(m, "commands:\t0, 1, 2\n");
> > > -   }
> > >
> > > +           /* Show available commands based on hardware */
> > > +           seq_puts(m, "commands:\t0");
> > > +           for (i =3D 1; i <=3D tpacpi_led_kbdlight.led_classdev.max=
_brightness; i++)
> > > +                   seq_printf(m, ", %d", i);
> > > +           seq_puts(m, "\n");
> > > +   }
> > >     return 0;
> > >  }
> > >
> > > @@ -5230,7 +5254,8 @@ static int kbdlight_write(char *buf)
> > >                     return res;
> > >     }
> > >
> > > -   if (level >=3D 3 || level < 0)
> > > +   /* Validate against max level */
> > > +   if (level < 0 || level > tpacpi_led_kbdlight.led_classdev.max_bri=
ghtness)
> > >             return -EINVAL;
> > >
> > >     return kbdlight_set_level_and_update(level);



--=20

Regards,

      Vishnu Sankar
     +817015150407 (Japan)
