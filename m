Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 583CCEC8742
	for <platform-driver-x86@archiver.kernel.org>; Thu,  7 Sep 2023 17:03:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231976AbjIGREA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 7 Sep 2023 13:04:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239516AbjIGRD7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 7 Sep 2023 13:03:59 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CB7310CF
        for <platform-driver-x86@vger.kernel.org>; Thu,  7 Sep 2023 10:03:34 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-76f1cc8022bso67479685a.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 Sep 2023 10:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694106154; x=1694710954; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoLVfI/Qa17hM0LLGxXlqleEL6Bcc6ph7u/GtpOctOM=;
        b=hIxjE3ZwlGEK2vfJowol5ahDB5Hk8wfsTXkbDUkayta4l3OcROywc8emUaisxQOAW4
         bgtumL2oE+9XKQjljOhm0NpJBG0sqf4tp1nm7lW8lN1MPm2l96DIi/uTUUDNF7a82PSS
         nMA5+EpLDJ6zft+E57zfrBhskWDneWE1yGhjqAm31JR++3i1BuIOvGuLL3MfYfVkhGNj
         Pt7EM5cBOCQ+7pV1TxtUXNEQmaKLGnv14hKMhkpA+NF2vk/cyOPD3r3yHaJ+g6DG6np5
         /QfjTQ0Nvqfnw78C1VxaLcvAaWU7LJ9JD7tjUDxmHZJnVzWyIajp40ZX7IcnlGoOwJrX
         rWZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694106154; x=1694710954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoLVfI/Qa17hM0LLGxXlqleEL6Bcc6ph7u/GtpOctOM=;
        b=Ejf2fJT9lUv3rgsOpkjmmULGTda94SoZ3OKQrUgjVjUI9GzW+8eVaXbbkBshXpc37w
         rcqLSlZbFle+phGLnNebP74xkt30spnkl7vhAZNRYSwn8jV90m0FXGLa8Y/XOWuLXnr9
         e0ZTix8YcWIHiqQdw1kCm6MgjM5rKo0ctp0VpoB82IHFwgA09BcmIxcvTr0m4eia49yA
         rrM2zBdC0tdc++xHAzQcPhFEoL+HNuuR3WZGf7OV7gYWjZxuVkl78q0PLD3DUGyDETnu
         N1+wiLCDA8IBdmfVLfvnjBWX7P4cxFyH1StWWd2KCnYud0WPADb0V26MSiuEAcO3vW71
         E7zQ==
X-Gm-Message-State: AOJu0Yyx1q06+j5/xYVmu3cProKWIlbNNG9Du/MKjqK5rQHg5CQ8o3Re
        SUExvuBdL2wJJrRMLjkqqdHhLp0FH34MNE/1Zbb3/qJpAN4NiZFP
X-Google-Smtp-Source: AGHT+IHG0TBlmxyoTQFIa7FFpqQqYMcVr4pyVQslrpSztqetV//HxeApegU4hZ/YXLQ350AtIlPtITxSVFId9gOqRWY=
X-Received: by 2002:a25:40a:0:b0:d7f:7690:d865 with SMTP id
 10-20020a25040a000000b00d7f7690d865mr6786114ybe.6.1694072130152; Thu, 07 Sep
 2023 00:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-16-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-16-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:35:18 +0200
Message-ID: <CACRpkdaLKqNM1xMCo9jz1Pe_18A=GJodbaTHL+VmoRZa5jJbjQ@mail.gmail.com>
Subject: Re: [RFT PATCH 15/21] arm: omap1: ams-delta: stop using gpiochip_find()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dipen Patel <dipenp@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, timestamp@lists.linux.dev,
        linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Oops one more note:

On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> gpiochip_find() is going away as it's not hot-unplug safe. This platform
> is not affected by any of the related problems as this GPIO controller
> cannot really go away but in order to finally remove this function, we
> need to convert it to using gpio_device_find() as well.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
(...)
> +       struct gpio_device *gdev;
(...)
> +       gdev =3D gpio_device_find_by_label(OMAP_GPIO_LABEL);

This leaves a reference to the gdev right? No scoped guard?

If you leave a dangling reference intentionally I think it warrants
a comment ("leaving a ref here so the device will never be
free:ed").

Yours,
Linus Walleij
