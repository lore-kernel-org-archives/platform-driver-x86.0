Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A956FCE7B08
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Sep 2023 18:40:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231406AbjI1SkR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Sep 2023 14:40:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231976AbjI1SkQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Sep 2023 14:40:16 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 965D411F
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Sep 2023 11:40:13 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-59c268676a9so163838787b3.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Sep 2023 11:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695926412; x=1696531212; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y95bvgZdeDdsBCYjefAKBMoB3y5noRiDCdm/BR1RHRI=;
        b=YiNrvilf3OjZrgklSJXf16yJ+b+yHoByVR5EyE7zT6qfm9MYUUnn2Kt64rGzyK7Q/X
         UqNoSqAiaoqRUt7ju4alkfR44Z77BELWSQ2DUE7+ZgVDl7dlBicJpp+vDc1QMaqNTcVw
         DU/zyL58ZPoY3KE/Vjs3nFcO/GL75heiZZAA8fLOKMSmMrKesjq+Qsi5c6pk+i9GWKB3
         Qc1UEkbHum5PBhbuGVUzHhYLudnBEmdOe9bsUQkJfWvRNPiZjYo5EjlKKyAeQTC5FrAz
         vJT0d9btmkIQ1qGyJ62y39/GQS4N+QnoySQ3PX+9KNX2n95AvFrKmULToW0rLWETVtYr
         niuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695926412; x=1696531212;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y95bvgZdeDdsBCYjefAKBMoB3y5noRiDCdm/BR1RHRI=;
        b=dPBMczZRhNj8PYQPiTVbE8iLgl/Ph3MX3MjSWsbPxOtOC7YzV3mlW+00e/AxCkVrG/
         Ld3K86LKp/4ZQUYQRcjD5XFimh+wbL0ciyM1XKEZBopmFVaFBnCUyidJ/yE40lqFZ3yL
         fPOIltunYcPcvpBq0kUJRkXRRMXeoL3u+iq6FeGDhdbL/HiIXhuKmJDSYTx4xM9p/Bos
         IWcMBzOY8e3lm7NrclILC//lhE7Jor6v7uXqVwgU0pZb31R+jfFv7JAuWxyOqBu5IYP3
         mZhcxSYLo2Mw7TEmIL/FqzBrv6UMdmBfMWusOH+X728nTsvS9nrRNII2t86uZV0SiXCL
         bQ7Q==
X-Gm-Message-State: AOJu0Yw4LFN4JkjU8fMJZX3W0GCWzgM9AuWNlAhCys0OSQmduIbJ7Z6U
        EIb5qFNADoaSqvdDsAwNPWLbJIyA3yz6qQbAyUw8uw==
X-Google-Smtp-Source: AGHT+IEStuY1jaSYpbOeINbGsBAxa0XDn+/8B2qloC+Mkxuq1vgTpNjjiaenDAt/S2ypr6HWq4hm9r+CIRrUYbmmqkI=
X-Received: by 2002:a0d:d410:0:b0:59b:c847:bce0 with SMTP id
 w16-20020a0dd410000000b0059bc847bce0mr2110790ywd.42.1695926412719; Thu, 28
 Sep 2023 11:40:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230926145943.42814-1-brgl@bgdev.pl> <e6817d30-b443-1a73-efae-84415604b19f@redhat.com>
In-Reply-To: <e6817d30-b443-1a73-efae-84415604b19f@redhat.com>
From:   Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date:   Thu, 28 Sep 2023 20:40:01 +0200
Message-ID: <CACMJSetWH=Z5ubHb33W0mYvpqkU7vv=nKNBSa9eLmAi94NyrgA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] platform/x86: int3472: don't use gpiod_toggle_active_low()
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, 28 Sept 2023 at 14:40, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi All,
>
> Here is a v2 of Bartosz' "don't use gpiod_toggle_active_low()" series.
>
> New in v2:
> - Rework to deal with ACPI path vs gpiod_lookup.key differences:
>   acpi_get_handle(path) -> acpi_fetch_acpi_dev(handle) -> acpi_dev_name(adev)
>
> Regards,
>
> Hans
>
>
> Bartosz Golaszewski (2):
>   platform/x86: int3472: Add new
>     skl_int3472_gpiod_get_from_temp_lookup() helper
>   gpio: acpi: remove acpi_get_and_request_gpiod()
>
> Hans de Goede (3):
>   platform/x86: int3472: Add new skl_int3472_fill_gpiod_lookup() helper
>   platform/x86: int3472: Stop using gpiod_toggle_active_low()
>   platform/x86: int3472: Switch to devm_get_gpiod()
>
>  drivers/gpio/gpiolib-acpi.c                   |  28 -----
>  .../x86/intel/int3472/clk_and_regulator.c     |  54 ++--------
>  drivers/platform/x86/intel/int3472/common.h   |   7 +-
>  drivers/platform/x86/intel/int3472/discrete.c | 101 ++++++++++++++----
>  drivers/platform/x86/intel/int3472/led.c      |  24 +----
>  include/linux/gpio/consumer.h                 |   8 --
>  6 files changed, 93 insertions(+), 129 deletions(-)
>
> --
> 2.41.0
>

Thanks Hans, this looks good to me. I'd let it sit on the list for a
week. After that, do you want to take patches 1-4 and provide me with
another tag?

Bart
