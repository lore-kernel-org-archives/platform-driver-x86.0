Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1646DC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Dec 2021 15:29:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239377AbhLUP3i (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 21 Dec 2021 10:29:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239365AbhLUP3h (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Dec 2021 10:29:37 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B766C061574
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Dec 2021 07:29:37 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id k21so12016718lfu.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Dec 2021 07:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TIEcZ4xvBTThicDG8gWW4fojXLw3Jbfr6V6W2qhapj4=;
        b=J1yLUXDO+VyhgBGDf+l4KIcooCwNMq27gieIS4HYY250F+LvN8YcDhAHK8QjKW3hRx
         9vyPDr2U3/NP4ktKyLjI8aKEcugIjiB75zG9CBaOsNdRftF33/RjHVxg3e0i1ay8ZISf
         zuTAXbZhJaitDWquCYOqd+q5MI1KbjONQf06CMb4iylJ+kB7CvBpOqf5YO/lKlzxtfrV
         Guf5HOUWgNrxdb1C16PV6/X/59Zh3wRx4kJ94lImD9jBaVKXf5sMWy0UZewx7wUv0rK3
         A9mIjBeyhdXx0GeKhAu/x+40cfAz61NfyGQTt9o1n++Z7Ai77uuKqGCZ0jQcjgPJj2VS
         b51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TIEcZ4xvBTThicDG8gWW4fojXLw3Jbfr6V6W2qhapj4=;
        b=KFEh7KFypy2b6xtCbdA3fQJ9qS89TB56OBREtvNFNcy1zhtINTyL0bSM4OcLhOHJlB
         9ON5jQf1KG+uC6+rnJA84MrOEdOgWAVmc1lyQQ6w73RoqWWxvXbyIVSoxXVZ16BqE3NS
         W3xff3yaQQE3Gh4S0gGGcrQ7xAB+Ir6Uhaob1kQ245pN3MFP0IfqnPCNCdSl49g7pffq
         vLTPBGLWU3lY0ZieVRiEq0gKVdbud70c0/CDv8C9K9sFgaV9Vw98w54s7ueZjo+L41dY
         UOcrNNwh01xnIaZg9R324SCTNJHinFXBrC22Xe5jdmZjlLExA7nwIFDPN3kVKRvoePWQ
         nlUQ==
X-Gm-Message-State: AOAM533yaEzcCS6eRKRkS8gKf2JljgX71vzbv8RS/9+DKNTQa9IGwkl7
        3/PEBREhNnIUBbHoFcD3p8ytTeu/YV8Gkda3i2ngl2eE9S/sNA==
X-Google-Smtp-Source: ABdhPJy61mD+hvK2TpUmCzB46O7IJK6rYVOlRbgTql6QKizhdNT52KYoQrh4yNqfbsO1jidrxEDKY3UKwkmSyTXfyMw=
X-Received: by 2002:a19:6e42:: with SMTP id q2mr3419935lfk.60.1640100575482;
 Tue, 21 Dec 2021 07:29:35 -0800 (PST)
MIME-Version: 1.0
References: <20211221151243.66216-1-hdegoede@redhat.com>
In-Reply-To: <20211221151243.66216-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 21 Dec 2021 17:27:36 +0200
Message-ID: <CAHp75VcCMeuSHkQT=azcEZeFxqU9_Na2yiXESEBvNqniyhtDvg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] platform/x86: Add x86-acpi-irq-helpers.h
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Dec 21, 2021 at 5:13 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Add helper code to get Linux IRQ numbers given a description of the IRQ
> source (either IOAPIC index, or GPIO chip name + pin-number).
>
> This is intended to be used to lookup Linux IRQ numbers in cases where the
> ACPI description for a device somehow lacks this info. This is only meant
> for use on x86 ACPI platforms.
>
> This code is big/complex enough to warrant sharing, but too small to live
> in its own module, therefor x86_acpi_irq_helper_get() is defined as
> a static inline helper function.

...

> +/* For gpio_get_desc which is EXPORT_SYMBOL_GPL() */

gpio_get_desc() and honestly I don't like this kind of includes (yes,
I know sometimes it's the best compromise).

> +#include "../../gpio/gpiolib.h"

...

> +               /* Like acpi_dev_gpio_irq_get(), but without parsing ACPI resources */
> +               chip = gpiochip_find(data->gpio_chip, x86_acpi_irq_helper_gpiochip_find);
> +               if (!chip)
> +                       return -EPROBE_DEFER;
> +
> +               gpiod = gpiochip_get_desc(chip, data->index);
> +               if (IS_ERR(gpiod)) {
> +                       ret = PTR_ERR(gpiod);
> +                       pr_err("error %d getting GPIO %s %d\n", ret,
> +                              data->gpio_chip, data->index);
> +                       return ret;
> +               }
> +
> +               irq = gpiod_to_irq(gpiod);
> +               if (irq < 0) {
> +                       pr_err("error %d getting IRQ %s %d\n", irq,
> +                              data->gpio_chip, data->index);
> +                       return irq;
> +               }
> +
> +               irq_type = acpi_dev_get_irq_type(data->trigger, data->polarity);
> +               if (irq_type != IRQ_TYPE_NONE && irq_type != irq_get_trigger_type(irq))
> +                       irq_set_irq_type(irq, irq_type);
> +
> +               return irq;

I'm wondering why it can't be a part of the GPIO ACPI library?

-- 
With Best Regards,
Andy Shevchenko
