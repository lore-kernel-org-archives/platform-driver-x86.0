Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F130ACA0EC6
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Sep 2023 22:07:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355927AbjIKWCZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Sep 2023 18:02:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237889AbjIKNSz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Sep 2023 09:18:55 -0400
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36FC9EE
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Sep 2023 06:18:51 -0700 (PDT)
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-495c744d690so756920e0c.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Sep 2023 06:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694438330; x=1695043130; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tOwZ3PqGkQm9ofbRLCvZJFp++8f4cNKLlNK9XpNhLu8=;
        b=0pF69P13+fjFwP6i+38Q2rltPsvi5wPz6uZLTv5z2EFn/8bGTmqhOHVrr+UOLTXGe5
         Soe/4jZOZ+R/pkubVC1FfHPmyFLH0biuGmLN/4K8yKoEV3s9IpQNgonghEXq26S7HrcX
         uFcerWlysc8MUNQEDDBk5theCBMrNKKz0CCC9JTZwXvxh8ztLhoKHjWLxxYzMEfs7hrD
         rO5lVAiGbEr2ium/mGul1cf07ehvVHOTpYzbI1suY/diehrK965m0uKupRxCovXnko02
         4s7os3CtWOsiL7yd877XGyFeZKfVYjzAHxnIMVDuL1H9DR4i0IUAYe2vYAugUnYWSimY
         q/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694438330; x=1695043130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tOwZ3PqGkQm9ofbRLCvZJFp++8f4cNKLlNK9XpNhLu8=;
        b=koXGvwCOGT11FK/IIBC+Z729JjiBY2hCgnurj/Pvs9PHQ8fDtZ86yNq/dtjfSXu9s7
         utsG6Ft1DLwqP6tklZFknDZfyNeSbvhpfixkxuirGjERRwMosxWhK8NvZ6qkgKDY+Rh+
         Kok6XiKA1BgP7Lav6Y7neviskN8URppU5yiQeCtauWaq4o4pMMcY/xVJZeWF4ar2jDSn
         h3/A51W7m6mxAeg72OprPh0+8zi7z4QGmziEwHxGiT3PwVAeNSq/UfshNbt4HwKJvIb3
         wrcjc9poIyVRUKaYZuC9jznEYfU1FyiwIu5n2q5dHwTVnDV+Lmbm6maIfw1pnE3NYczz
         j/Ew==
X-Gm-Message-State: AOJu0YxOZXps6JedGv2NDpCVThEKQW0kzd8Qc6wR8pH4nVgSaYgCoqt4
        aPUVQX1rZgEUYdoajOSiCP59ILfI2FxBw53B/yu3vuh9ht93+poD
X-Google-Smtp-Source: AGHT+IEb6yZR04UHL1Vjshp/bpdQmyW+Y8SQySHEdgnLvcZXY9znHtE5aje0yqXsxexkQR/XxtVzqpCo9ll/gBUY6Wg=
X-Received: by 2002:a1f:c806:0:b0:490:e790:a15b with SMTP id
 y6-20020a1fc806000000b00490e790a15bmr7477248vkf.10.1694438330068; Mon, 11 Sep
 2023 06:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230909141816.58358-1-hdegoede@redhat.com> <20230909141816.58358-7-hdegoede@redhat.com>
 <CAMRc=MfeKirks7N7scu+dh+M1Nf0bNxzC7PE2Q7J4bxgpRnECw@mail.gmail.com> <0b1e0312-9144-85ed-666e-a84110b26418@redhat.com>
In-Reply-To: <0b1e0312-9144-85ed-666e-a84110b26418@redhat.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 11 Sep 2023 15:18:39 +0200
Message-ID: <CAMRc=MfVZCqc-v+5oMkTkhfLvq1pE66E7GykqT2ymxzS_kw83w@mail.gmail.com>
Subject: Re: [PATCH 6/8] platform/x86: x86-android-tablets: Stop using gpiolib
 private APIs
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Sep 11, 2023 at 3:08=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Hi,
>
> On 9/11/23 14:50, Bartosz Golaszewski wrote:
> > On Sat, Sep 9, 2023 at 4:18=E2=80=AFPM Hans de Goede <hdegoede@redhat.c=
om> wrote:
> >>
> >> Refactor x86_android_tablet_get_gpiod() to no longer use
> >> gpiolib private functions like gpiochip_find().
> >>
> >> As a bonus this allows specifying that the GPIO is active-low,
> >> like the /CE (charge enable) pin on the bq25892 charger on
> >> the Lenovo Yoga Tablet 3.
> >>
> >> Reported-by: Bartosz Golaszewski <brgl@bgdev.pl>
> >> Closes: https://lore.kernel.org/platform-driver-x86/20230905185309.131=
295-12-brgl@bgdev.pl/
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >> ---
> >>  .../platform/x86/x86-android-tablets/asus.c   |  1 +
> >>  .../platform/x86/x86-android-tablets/core.c   | 51 +++++++++++-------=
-
> >>  .../platform/x86/x86-android-tablets/lenovo.c | 28 +++++-----
> >>  .../platform/x86/x86-android-tablets/other.c  |  6 +++
> >>  .../x86-android-tablets/x86-android-tablets.h |  6 ++-
> >>  5 files changed, 55 insertions(+), 37 deletions(-)
> >>
> >> diff --git a/drivers/platform/x86/x86-android-tablets/asus.c b/drivers=
/platform/x86/x86-android-tablets/asus.c
> >> index f9c4083be86d..227afbb51078 100644
> >> --- a/drivers/platform/x86/x86-android-tablets/asus.c
> >> +++ b/drivers/platform/x86/x86-android-tablets/asus.c
> >> @@ -303,6 +303,7 @@ static const struct x86_i2c_client_info asus_tf103=
c_i2c_clients[] __initconst =3D
> >>                         .index =3D 28,
> >>                         .trigger =3D ACPI_EDGE_SENSITIVE,
> >>                         .polarity =3D ACPI_ACTIVE_LOW,
> >> +                       .con_id =3D "atmel_mxt_ts_irq",
> >>                 },
> >>         },
> >>  };
> >> diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers=
/platform/x86/x86-android-tablets/core.c
> >> index 3d3101b2848f..673f3a14941b 100644
> >> --- a/drivers/platform/x86/x86-android-tablets/core.c
> >> +++ b/drivers/platform/x86/x86-android-tablets/core.c
> >> @@ -12,7 +12,7 @@
> >>
> >>  #include <linux/acpi.h>
> >>  #include <linux/dmi.h>
> >> -#include <linux/gpio/driver.h>
> >> +#include <linux/gpio/consumer.h>
> >>  #include <linux/gpio/machine.h>
> >>  #include <linux/irq.h>
> >>  #include <linux/module.h>
> >> @@ -21,35 +21,39 @@
> >>  #include <linux/string.h>
> >>
> >>  #include "x86-android-tablets.h"
> >> -/* For gpiochip_get_desc() which is EXPORT_SYMBOL_GPL() */
> >> -#include "../../../gpio/gpiolib.h"
> >> -#include "../../../gpio/gpiolib-acpi.h"
> >>
> >>  static struct platform_device *x86_android_tablet_device;
> >>
> >> -static int gpiochip_find_match_label(struct gpio_chip *gc, void *data=
)
> >> -{
> >> -       return gc->label && !strcmp(gc->label, data);
> >> -}
> >> -
> >> -int x86_android_tablet_get_gpiod(const char *label, int pin, struct g=
pio_desc **desc)
> >> +int x86_android_tablet_get_gpiod(const char *chip, int pin, const cha=
r *con_id,
> >> +                                bool active_low, enum gpiod_flags dfl=
ags,
> >> +                                struct gpio_desc **desc)
> >>  {
> >> +       struct gpiod_lookup_table *lookup;
> >>         struct gpio_desc *gpiod;
> >> -       struct gpio_chip *chip;
> >>
> >> -       chip =3D gpiochip_find((void *)label, gpiochip_find_match_labe=
l);
> >> -       if (!chip) {
> >> -               pr_err("error cannot find GPIO chip %s\n", label);
> >> -               return -ENODEV;
> >> -       }
> >> +       lookup =3D kzalloc(struct_size(lookup, table, 2), GFP_KERNEL);
> >> +       if (!lookup)
> >> +               return -ENOMEM;
> >> +
> >> +       lookup->dev_id =3D KBUILD_MODNAME;
> >> +       lookup->table[0].key =3D chip;
> >> +       lookup->table[0].chip_hwnum =3D pin;
> >> +       lookup->table[0].con_id =3D con_id;
> >> +       lookup->table[0].flags =3D active_low ? GPIO_ACTIVE_LOW : GPIO=
_ACTIVE_HIGH;
> >> +
> >> +       gpiod_add_lookup_table(lookup);
> >> +       gpiod =3D devm_gpiod_get(&x86_android_tablet_device->dev, con_=
id, dflags);
> >> +       gpiod_remove_lookup_table(lookup);
> >> +       kfree(lookup);
> >>
> >
> > Any reason for not creating static lookup tables for GPIOs here?
>
> Not sure what you mean with static?
>
> I guess you mean using global or stack memory instead of kmalloc() ?
>
> gcc did not like me putting a struct with a variable length array
> at the end on the stack, so I went with a kzalloc using the
> struct_size() helper for structs with variable length arrays instead.
>
> Note this only runs once at boot, so the small extra cost of
> the malloc + free is not really a big deal here.
>
> I did not try making it global data as that would make the function
> non re-entrant. Not that it is used in a re-entrant way anywhere,
> but generally I try to avoid creating code which is not re-entrant.
>

I meant static-per-compilation-unit. It doesn't have to be a variable
length array either. Typically GPIO lookups are static arrays that are
added once and never removed. The SPI example I posted elsewhere is
different as it addresses a device quirk and cannot be generalized
like this. How many GPIOs would you need to describe for this
use-case? If it's just a few, then I'd go with static lookup tables.
If it's way more than disregard this comment.

Bart

> Regards,
>
> Hans
>
>
>
>
> >> -       gpiod =3D gpiochip_get_desc(chip, pin);
> >>         if (IS_ERR(gpiod)) {
> >> -               pr_err("error %ld getting GPIO %s %d\n", PTR_ERR(gpiod=
), label, pin);
> >> +               pr_err("error %ld getting GPIO %s %d\n", PTR_ERR(gpiod=
), chip, pin);
> >>                 return PTR_ERR(gpiod);
> >>         }
> >>
> >
>
