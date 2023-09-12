Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F1ACCA0ECE
	for <platform-driver-x86@archiver.kernel.org>; Tue, 12 Sep 2023 07:15:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231316AbjILHPf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 12 Sep 2023 03:15:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231450AbjILHPe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 12 Sep 2023 03:15:34 -0400
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com [IPv6:2607:f8b0:4864:20::a2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7867E78
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Sep 2023 00:15:30 -0700 (PDT)
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-48feedb90d2so1987497e0c.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Sep 2023 00:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694502930; x=1695107730; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+0OLswzodm1av5Wpp7mGG8ZdGkJ1QyDOqEboshS6xU=;
        b=xlhicadGCX8/96gvQIKsEQ6c7X5n2a8hN4cXAk7UX9THJKYlOJMyzzLni790TgOruC
         k4SzDADDlLxFeXH60AXhGVF5v+6mEsdr/okLVL2JgmnncCWlWSBoa9TEKubWWclMGmEm
         yU6PbDPjbLBgHQ+loJbH22GIltDe0MlyH+h8pyzeQnZvQsVHLLbohvSRqjNiU2noqdjk
         +KzjQdts/EhOLRrUx3bSv10xviOFlh4hGKBuP+CF0tazr1wD+AYwBEleXNmWGvVxBTCR
         Q9/9b977DkIObdrOxHTSS6INTciNOHPS+zZDV98ptmZHfHz/n8b0TY1uPs6oqyFw6svV
         xIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694502930; x=1695107730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z+0OLswzodm1av5Wpp7mGG8ZdGkJ1QyDOqEboshS6xU=;
        b=xFlYL3Gng+JIaSMdDNwnQFap9+T0cFZjwzjo5Bb4BOVyV6SFztr21SLMwLUzUAy/Kx
         i/xuizlccWrbw8oPRURfZp/B/gcEIYiLLfz13r1rmesgIok59/nZEr6PL0L/I9XUM7b6
         WiK7QUa0rsTqvJsFoWGrUV92RPRvCaQ7ULBLvHl9ggxB9jEKfBff1eW94v441sXE8IaE
         CVbIHFRPsBZW09ppvK+HvuEEr4wVdOsE3r6X5pr5Gh/46ekny7yks+1jCZiOOzrw7mvH
         WZpfGad3I5LLZAyIZFiTgb32fgrWx4tQtI5zosOQL1yV3a4a+qHrDg4PhTOtVfU4w1aD
         Fm6A==
X-Gm-Message-State: AOJu0YwX0B+2/RMOwO6JeNpx/AtflPTkk7UQcTM50Gbpq379j8KlGDSc
        rUXyYwhBE+29HayQ32XwkP5S1Rh6kgUyqv1DxndUUw==
X-Google-Smtp-Source: AGHT+IG2nThERjU6EdD9OV0vY2s8gn+NYMxA1sZGF/r8TCUHyU5CfSLi8PvCW/yY0159NFRmyIZIhYjKhPEQXxXs4eE=
X-Received: by 2002:a05:6122:3104:b0:495:be1c:5be9 with SMTP id
 cg4-20020a056122310400b00495be1c5be9mr9078148vkb.1.1694502930024; Tue, 12 Sep
 2023 00:15:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230911210928.264908-1-hdegoede@redhat.com>
In-Reply-To: <20230911210928.264908-1-hdegoede@redhat.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 12 Sep 2023 09:15:19 +0200
Message-ID: <CAMRc=Md4Tch1kJtRoDUVW7MjHM9GuO_GDaQ+O_o1Pkw60EjNLA@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: x86-android-tablets: Add a comment about x86_android_tablet_get_gpiod()
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

On Mon, Sep 11, 2023 at 11:09=E2=80=AFPM Hans de Goede <hdegoede@redhat.com=
> wrote:
>
> Add a comment explaining why the special x86_android_tablet_get_gpiod()
> helper is necessary for some of the GPIOs used in the x86-android-tablets=
;
> and that for normal GPIO lookups this example should not be followed.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/x86-android-tablets/core.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/pl=
atform/x86/x86-android-tablets/core.c
> index 8a1f22aaac00..b55957bde034 100644
> --- a/drivers/platform/x86/x86-android-tablets/core.c
> +++ b/drivers/platform/x86/x86-android-tablets/core.c
> @@ -24,6 +24,21 @@
>
>  static struct platform_device *x86_android_tablet_device;
>
> +/*
> + * This helper allows getting a gpio_desc *before* the actual device con=
suming
> + * the GPIO has been instantiated. This function _must_ only be used to =
handle
> + * this special case such as e.g. :
> + *
> + * 1. Getting an IRQ from a GPIO for i2c_board_info.irq which is passed =
to
> + * i2c_client_new() to instantiate i2c_client-s; or
> + * 2. Calling desc_to_gpio() to get an old style GPIO number for gpio_ke=
ys
> + * platform_data which still uses old style GPIO numbers.
> + *
> + * Since the consuming device has not been instatiated yet a dynamic loo=
kup
> + * is generated using the special x86_android_tablet dev for dev_id.
> + *
> + * For normal GPIO lookups a standard static gpiod_lookup_table _must_ b=
e used.
> + */
>  int x86_android_tablet_get_gpiod(const char *chip, int pin, const char *=
con_id,
>                                  bool active_low, enum gpiod_flags dflags=
,
>                                  struct gpio_desc **desc)
> --
> 2.41.0
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
