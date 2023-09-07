Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B66EC8740
	for <platform-driver-x86@archiver.kernel.org>; Thu,  7 Sep 2023 16:22:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233413AbjIGQWL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 7 Sep 2023 12:22:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235042AbjIGQVl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 7 Sep 2023 12:21:41 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C24627D93
        for <platform-driver-x86@vger.kernel.org>; Thu,  7 Sep 2023 09:18:59 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-68a410316a2so1029052b3a.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 Sep 2023 09:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694103480; x=1694708280; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2UPY8Ad0JyZ552HHQpe1k1G4pRk3wLhmWob6nvmGZM=;
        b=zOQxHwhNXOFAiHnPeOYWGe3KDsbH1703OpfJkkBL6RCirO9c5xtAB1spHr/xMgnTO6
         gTT8/tdZY4FEmqrOd4YMv6JfLyeCfg/+cVLqqCnQUju519gfloVoLrT5UegTzgb112d4
         oXHMdtDjHaXnKz//JSU4ROtvH1fwTVarLcY2N5fsqZ5q61ecdIybvl9fTkYs+ndH1SjG
         ZKbs45czPeM2GNj6ezyk1HeZmPdLq4McrdbjG1LxfZ62xHQp6+zdOM+0AHrE6ux6Sw7V
         u/KqrDF2M/dzBiYsTedIT6wfA6hK/96N3ivUkpWZFyyBpswkSDOtwKXgPLtFQ57khdJ8
         Dq5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694103480; x=1694708280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h2UPY8Ad0JyZ552HHQpe1k1G4pRk3wLhmWob6nvmGZM=;
        b=UArjQsm9tnq4QZgqVsQhVpxGl634bhJ9r9tLq8d1smEHzheL0r4tGhFPOLGxIAbgGe
         ymfGQxmgtKn6lmtOZP6ONyR6RN/88cAKx2gTHmY+KWsKXouKRWWk+FITknfQhxpX55vU
         elB60EISte/CReePYSKS14RGfDNi2P8qY0BeBGqmURUKBDFRi0Hd3I7F5on9icXu2i8S
         3jnIMx7Hd69zyo75Au7Y70e7MJM9u3h1v68TOe74mklCqxygRDap8RzhWjIhti/a/NoS
         a+CgSzRSWNvRHBbaBm/hjitS8cucgZAoaMbRT4JQ1floELJ/ELN9wAbawjhewgfV+RLJ
         a/HQ==
X-Gm-Message-State: AOJu0Yx5aSerPFh7oqB7d/0hjZwai/Pvvgz2Np17rPO3QO3Ipx1Nk1/J
        SIiwlGGebXmcapsCxNnvDQs1Ys9Z48aYNu54eUXIuPraQhkk+pODJDA=
X-Google-Smtp-Source: AGHT+IFxuGmnz6UhP+iDHBaAUw7EFN+gVZSw6nwdZwmmFMJ3XnkMU5k7fxCuPngY53Trr0s6Te5MkJ1CXk5K8y+Rwo4=
X-Received: by 2002:a25:ce47:0:b0:d1d:514e:27c6 with SMTP id
 x68-20020a25ce47000000b00d1d514e27c6mr18577035ybe.6.1694070485563; Thu, 07
 Sep 2023 00:08:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-5-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-5-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:07:53 +0200
Message-ID: <CACRpkdYCOVJZ6TUMQQHSaKZHMCx8tE8=3z=1BogYTkr52mFr8Q@mail.gmail.com>
Subject: Re: [PATCH 04/21] gpiolib: provide gpio_device_get_desc()
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

On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Getting the GPIO descriptor directly from the gpio_chip struct is
> dangerous as we don't take the reference to the underlying GPIO device.
> In order to start working towards removing gpiochip_get_desc(), let's
> provide a safer variant that works with an existing reference to struct
> gpio_device.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Andy had some good doc comments, with these addressed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
