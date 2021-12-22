Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01CDEC433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 22 Dec 2021 12:51:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241244AbhLVMv4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 22 Dec 2021 07:51:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241182AbhLVMv4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Dec 2021 07:51:56 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4D66C061574
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Dec 2021 04:51:55 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id j6so8160870edw.12
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Dec 2021 04:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zgO1V1cXjXM68tSLUV05SN02znR2LZXapD+QXrPlsNU=;
        b=bWrg1GEBFuY0sNBjDQqua98nBf7W9HnYq+TAVOS4t45dFe4mdKIJMAaTqwnFdrkvD6
         pfVYqNOCaVg8hl1YeIA907Io/EGEvpHup6AHktkv0phmB7GKqrfYpQZ8yoVSQSFKxxTM
         G6pSOSoUpaTNfRlLRgJ/Jneom0mJxtBWg9FePx+Z6ii3Su5VLr6IfXvhrZFfnnoQD5/E
         yom0ZxpKXKdKvAL+9s6+raQjfNLa9gvJxbAAgr7TdyW3j7JoSP8EvrQou6m6VcatKUsi
         +TKKNutOaAvonXG6n5nHwspZpbvbIidleYO88fBLWkGSgxIcQbR+po7N99PDwquX1nnF
         HoRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zgO1V1cXjXM68tSLUV05SN02znR2LZXapD+QXrPlsNU=;
        b=DHGRNhqM9uN2FpxMcFMdiKZI+c3La6sNqzW3kMxYAzJ0UZTAllEr3jqOEMqg08WwGy
         fBTYPm95MY7LRP2P36lWkhYXm3BFL1u4ZJafnuj2eocuKpQy0+vKWGBidOtfk6yFMCA2
         l9fkIBhnlsA+acAxc7NTUT3vHthw9w/r53m7Z5XHPSxBsbftA+SJR/wNGvrNmBccYpnk
         qDlj+yFElHr0O9nzyaayH0QbYFN0wbFT2mk8tEC0/SVlO0ClAT9TSFvarHP/f0n3cvlv
         vjM96VAZwGEIn/qoZ2YLVSPYdkZXOEw7cmjKv2O+e0q26PcXL3Cvq41B5xbYWXTC1WP0
         d8xg==
X-Gm-Message-State: AOAM533S8CueQ14n3hbtb7qZVNqPu1s/kqcoS8A60ZG9pgg5uS6J2O/m
        yb4docEKnCDLIfetRGAHf/lw8WwJye7/24sSrHc=
X-Google-Smtp-Source: ABdhPJz3viJ71wUDckkypL/zUeTFFxsf415rpmkCFIfToUm9vbADCTyWMD+wp570UI9tNS4zL+gG/NIjYmAYFAWywEM=
X-Received: by 2002:a17:906:c450:: with SMTP id ck16mr2246993ejb.579.1640177514470;
 Wed, 22 Dec 2021 04:51:54 -0800 (PST)
MIME-Version: 1.0
References: <20211221151243.66216-1-hdegoede@redhat.com> <CAHp75VcCMeuSHkQT=azcEZeFxqU9_Na2yiXESEBvNqniyhtDvg@mail.gmail.com>
 <32e68787-66ec-1522-0fea-e11130a428b8@redhat.com> <YcMd7dn+RCVrKOlj@lahna>
In-Reply-To: <YcMd7dn+RCVrKOlj@lahna>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 22 Dec 2021 14:49:56 +0200
Message-ID: <CAHp75VcP1Ca1Y0tB0MeKmjxbCGO5puiQuNJmv0K4U1ase+XQvQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] platform/x86: Add x86-acpi-irq-helpers.h
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Dec 22, 2021 at 2:47 PM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Tue, Dec 21, 2021 at 07:58:26PM +0100, Hans de Goede wrote:
> > On 12/21/21 16:27, Andy Shevchenko wrote:
> > > On Tue, Dec 21, 2021 at 5:13 PM Hans de Goede <hdegoede@redhat.com> wrote:
> > >>
> > >> Add helper code to get Linux IRQ numbers given a description of the IRQ
> > >> source (either IOAPIC index, or GPIO chip name + pin-number).
> > >>
> > >> This is intended to be used to lookup Linux IRQ numbers in cases where the
> > >> ACPI description for a device somehow lacks this info. This is only meant
> > >> for use on x86 ACPI platforms.
> > >>
> > >> This code is big/complex enough to warrant sharing, but too small to live
> > >> in its own module, therefor x86_acpi_irq_helper_get() is defined as
> > >> a static inline helper function.
> > >
> > > ...
> > >
> > >> +/* For gpio_get_desc which is EXPORT_SYMBOL_GPL() */
> > >
> > > gpio_get_desc()
> >
> > Fixed in my local version.
> >
> > > and honestly I don't like this kind of includes (yes,
> > > I know sometimes it's the best compromise).
> > >
> > >> +#include "../../gpio/gpiolib.h"
> > >
> > > ...
> > >
> > >> +               /* Like acpi_dev_gpio_irq_get(), but without parsing ACPI resources */
> > >> +               chip = gpiochip_find(data->gpio_chip, x86_acpi_irq_helper_gpiochip_find);
> > >> +               if (!chip)
> > >> +                       return -EPROBE_DEFER;
> > >> +
> > >> +               gpiod = gpiochip_get_desc(chip, data->index);
> > >> +               if (IS_ERR(gpiod)) {
> > >> +                       ret = PTR_ERR(gpiod);
> > >> +                       pr_err("error %d getting GPIO %s %d\n", ret,
> > >> +                              data->gpio_chip, data->index);
> > >> +                       return ret;
> > >> +               }
> > >> +
> > >> +               irq = gpiod_to_irq(gpiod);
> > >> +               if (irq < 0) {
> > >> +                       pr_err("error %d getting IRQ %s %d\n", irq,
> > >> +                              data->gpio_chip, data->index);
> > >> +                       return irq;
> > >> +               }
> > >> +
> > >> +               irq_type = acpi_dev_get_irq_type(data->trigger, data->polarity);
> > >> +               if (irq_type != IRQ_TYPE_NONE && irq_type != irq_get_trigger_type(irq))
> > >> +                       irq_set_irq_type(irq, irq_type);
> > >> +
> > >> +               return irq;
> > >
> > > I'm wondering why it can't be a part of the GPIO ACPI library?
> >
> > Interesting suggestion, but this really is only intended for the
> > special case when the DSDT is missing this info. I'm a bit worried
> > that having this available as a generic helper may lead to it
> > getting used too much. But I guess we can just put a comment on it
> > explaining that normally its use should be avoided.
> >
> > I've added Mika to the Cc, Mika, what do you think about adding this
> > as a new helper to the GPIO ACPI library ?
>
> Preferably no :-) Reason is that even if we add comment to the function
> you don't remember it after two weeks so the next patch adding another
> user will not be noticed by reviewers (unless tha name of the function
> clearly says it is a quirk/workaround).

Oh, we have a solution for this already, it's called an export
namespace. We may export symbols in its own namespace and any user
must to import it. It will show immediately who is trying to do "bad
things". Code duplication makes kernel bigger and harder to maintain.
Imagine if there is an issue or refactoring happening in one copy of
the code and missed in the other. How long would it take to discover
that and fix it?

-- 
With Best Regards,
Andy Shevchenko
