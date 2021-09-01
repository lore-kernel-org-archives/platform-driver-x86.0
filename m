Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 117A3C4320E
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Sep 2021 15:58:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E70806109E
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Sep 2021 15:58:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344138AbhIAP6z (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Sep 2021 11:58:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344135AbhIAP6s (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Sep 2021 11:58:48 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9235C061796
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Sep 2021 08:57:49 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id fs6so2173984pjb.4
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Sep 2021 08:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bpnJL9b1ZSCBiJrJrREp2DCCrK4MM5yZQJOIfaGjDt4=;
        b=mev2HZZFuQnmTFXzk3ShrZKtCRgzjVmLpngDEVCAFpqUrAUVn7nFl97A8bDppJNaQ+
         T/7ErBe4M3n1I75TAOwZn+TV0RKk6kQd8+NZeXJhNejUCOaMQFERui8fDOslv1F4VD/p
         7PVsCfdEh/lCifRwNAmM+nIfOPwlzZcJQSAzEMg/PKgUjRAExDbFZC+NpiGkIWDFJlRH
         u1UVOsiseTYq0ROPKnMgYmsKtdOWfYooedg/+a5td5KPEEvGEnacsKeas3Sk2n61Zcs2
         JTbrEkybiGJJCxxWf69nWjJdbc5gt1eu3MopENOkAAANpH4M7YvQVysT+T6fWxpCbfvS
         be/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bpnJL9b1ZSCBiJrJrREp2DCCrK4MM5yZQJOIfaGjDt4=;
        b=UoYHTcUaL0OdtAnHR5OCu5yrvMiZ4cWP3GCrhmQ//5tSRGuBqj9zRniRkZMfVtZVLT
         mHOUpQtS5W6CxYDp+0ct+0Dp+jgu6/pM75SOHTqEf+b24iIP/aE1hIPEyly1Pr0iG3EN
         0ewIjmWPZhsYWB+3HNJn86YGjEZgVAUeWpepQBGAjaMFBW4tu+1+wD5SWLyjIY/uJBkt
         DwrzOdcuoeweDFEMBWwDCl4IqB4V/hEn6I7mUkslKMbsNFEGxPOplb0eFvoAQAfHuqf2
         wSjXF+HwOThTCYiO5iTD/+V8c4XsEaEsmUIkUNSVkAjQIRbZSMLvDA27PjXw/Z2BqAIb
         1/fQ==
X-Gm-Message-State: AOAM533KuPZTsCIU9Dhv/qcmbTt+YPhaRLtS+HNtG+dwSd8tWlgTQjVz
        dEKgP0/bZl+2ULhFl0mTK+yEPeWC3cNL0Ze/ssY=
X-Google-Smtp-Source: ABdhPJyeeDQtJhJB/i8tUfCdEBQTDLcqDAxniEpYod3V7YpMmGEwYl9xlKaiRakDrAxo5mmU/6yCrCBzAmUTBGJ4UFk=
X-Received: by 2002:a17:90b:78f:: with SMTP id l15mr49194pjz.181.1630511869159;
 Wed, 01 Sep 2021 08:57:49 -0700 (PDT)
MIME-Version: 1.0
References: <70b81e33-c769-4cb8-0bae-5ee10a209389@nvidia.com> <20210831224906.1072-1-ddadap@nvidia.com>
In-Reply-To: <20210831224906.1072-1-ddadap@nvidia.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 1 Sep 2021 18:57:13 +0300
Message-ID: <CAHp75VcvhPL2dNy4HdoEU5FtuWQkG-t0tH5rAJRKpeG0iB9AUg@mail.gmail.com>
Subject: Re: [PATCH v4] platform/x86: Add driver for ACPI WMAA EC-based
 backlight control
To:     Daniel Dadap <ddadap@nvidia.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        mario.limonciello@outlook.com,
        =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>,
        Darren Hart <dvhart@infradead.org>, thomas@t-8ch.de,
        Aaron Plattner <aplattner@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Sep 1, 2021 at 2:27 AM Daniel Dadap <ddadap@nvidia.com> wrote:
>
> A number of upcoming notebook computer designs drive the internal
> display panel's backlight PWM through the Embedded Controller (EC).
> This EC-based backlight control can be plumbed through to an ACPI
> "WMAA" method interface, which in turn can be wrapped by WMI with
> the GUID handle 603E9613-EF25-4338-A3D0-C46177516DB7.
>
> Add a new driver, aliased to the WMAA WMI GUID, to expose a sysfs
> backlight class driver to control backlight levels on systems with
> EC-driven backlights.

> Signed-off-by: Aaron Plattner <aplattner@nvidia.com>

Seems like missed Co-developed-by. Or you are the wrong author. Fix accordingly.

> Signed-off-by: Daniel Dadap <ddadap@nvidia.com>

...

> +#include <linux/backlight.h>
> +#include <linux/module.h>
> +#include <linux/wmi.h>

types.h ?
mod_devicetable.h ?

...

> +enum wmaa_get_or_set {
> +       WMAA_GET = 0,
> +       WMAA_SET = 1,
> +       WMAA_GET_MAX = 2

Is it part of HW protocol? Otherwise drop assignments.

> +};

...

> + */
> +enum wmaa_source {
> +       WMAA_SOURCE_GPU = 1,
> +       WMAA_SOURCE_EC = 2,

> +       WMAA_SOURCE_AUX = 3

Missed comma.

> +};

...

> +/**
> + * struct wmaa_args - arguments for the ACPI WMAA method

> + *

Redundant blank line.

> + * @set:     Pass in an &enum wmaa_get_or_set value to select between getting or
> + *           setting a value.
> + * @val:     In parameter for value to set when operating in %WMAA_SET mode. Not
> + *           used in %WMAA_GET or %WMAA_GET_MAX mode.
> + * @ret:     Out parameter returning retrieved value when operating in %WMAA_GET
> + *           or %WMAA_GET_MAX mode. Not used in %WMAA_SET mode.
> + * @ignored: Padding; not used. The ACPI method expects a 24 byte params struct.
> + *
> + * This is the parameters structure for the ACPI WMAA method as wrapped by WMI.
> + * The value passed in to @val or returned by @ret will be a brightness value
> + * when the WMI method ID is %WMAA_LEVEL, or an &enum wmaa_source value when
> + * the WMI method ID is %WMAA_SOURCE.
> + */

...

> +       ret = wmi_call_wmaa(wdev, WMAA_LEVEL, WMAA_GET, &level);

> +

Ditto.

> +       if (ret)
> +               dev_err(&bd->dev, "ACPI WMAA failed to get backlight level.\n");

...
> +static const struct backlight_ops wmaa_backlight_ops = {
> +       .update_status = wmaa_backlight_update_status,
> +       .get_brightness = wmaa_backlight_get_brightness

Missed comma.

> +};

...

> +       if (source != WMAA_SOURCE_EC) {
> +               /* This driver is only to be used when brightness control is
> +                * handled by the EC; otherwise, the GPU driver(s) should handle
> +                * brightness control. */

/*
 * Wrong multi-line comment
 * style. Use this example to fix
 * it properly.
 */

> +               return -ENODEV;
> +       }

> +       /* Identify this backlight device as a platform device so that it can
> +        * be prioritized over any exposed GPU-driven raw device(s). */

Ditto.
And for any other multi-line comments in this driver.

...

> +       backlight = devm_backlight_device_register(
> +               &w->dev, "wmaa_backlight",
> +               &w->dev, w, &wmaa_backlight_ops, &props);

> +       if (IS_ERR(backlight))
> +               return PTR_ERR(backlight);
> +
> +       return 0;

return PTR_ERR_OR_ZERO(backlight);

...

> +MODULE_AUTHOR("Aaron Plattner <aplattner@nvidia.com>");
> +MODULE_AUTHOR("Daniel Dadap <ddadap@nvidia.com>");

So, Co-developed-by seems missing above.

...

> +MODULE_LICENSE("GPL v2");

"GPL" is enough (it's a synonim).

-- 
With Best Regards,
Andy Shevchenko
