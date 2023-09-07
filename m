Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6763FEC873E
	for <platform-driver-x86@archiver.kernel.org>; Thu,  7 Sep 2023 16:15:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239257AbjIGQPb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 7 Sep 2023 12:15:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239469AbjIGQPK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 7 Sep 2023 12:15:10 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51C104C34
        for <platform-driver-x86@vger.kernel.org>; Thu,  7 Sep 2023 09:12:16 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-413636c6d6aso7316631cf.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 Sep 2023 09:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694103071; x=1694707871; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pwy6uKOVyjPH/vJMAsaPCoM0fNwaGdU7NPhSy+lwVBs=;
        b=Lnos4LYt89nZfeHlj36qRssIEnZjGovduC4lcL0ULZjIjO0uRqNWgUlb+P4LRWNqGc
         PC3WGaKuFCrw/6RFrlblJTMQIIQcoY7oc7D72eVWoga9X7wWDz7wKn1l16LinGmtuzfE
         TxSsj61JsCb2QYbKPmbZC1ZozDTPKeKlqUbFuQJDtH58yM3gMz7HHk08aAdwVkjQf0V1
         3KPu34ViZNhSDF7UmXEDFRfSBYY0kPuCrTswcHiRdpF0mQoqNCOjV0EBHRT6b1WmIeEc
         J6BsQFho+5cLrz32Pwc+Wxp04hil6NQ74pHCU70LgCB5UA2nT14ooSCCsbdCDY5Oz3ev
         dKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694103071; x=1694707871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pwy6uKOVyjPH/vJMAsaPCoM0fNwaGdU7NPhSy+lwVBs=;
        b=XiowQn5yXCBSFkUFVhd1IXvOiBkJTnaCCQDv2j/4AiBuHSDM4kg5ahDHijyYc7XHZR
         qPMaqmFHNhHWKMNVlXU+o72zc6aJT2gNTDL2efLMj+Q3xKmRKj1LDT5ce6b2aTD90wRb
         uVwFDM//S9WK7U9Z3OQa1uqDgtuk3XvzoDwsaVskli50Es64hic1Y0BLhm/hfk+JZhLU
         2OTmAlMCBsbFNPcawto29qlN3Xlv8T59iu1atA7MPyuplp2lnbB+IizFCxCOdUjNiduh
         e4rbX0ReYdvdpAWiNMfLZZWKyxWUAf1OoB2R8bDrYhZjzWh3s4M/KJDUz/SbjRvm+3hi
         ppbw==
X-Gm-Message-State: AOJu0Yybxtnn3Exh5lEv3321+ZbQii6/iIMwhyxHfvswy/vhrg9y6XOS
        uytafiODai+rMdvTlAeyS+Aw9PPuvjPPxkqUTo7F9oZiYbjKNyaVueg=
X-Google-Smtp-Source: AGHT+IFDrgWVURx3JNju7kZZF1wu9Y/TadMJ5yuRpzoXN8X2bh2xdWz8hzInBvmi+tzixNC0aGXs9GN4uotRGCxcdwY=
X-Received: by 2002:a25:dc54:0:b0:d44:a90b:ba50 with SMTP id
 y81-20020a25dc54000000b00d44a90bba50mr19457872ybe.5.1694071251891; Thu, 07
 Sep 2023 00:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-11-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-11-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:20:40 +0200
Message-ID: <CACRpkdZdaBELiyR8da2GHxj+=FFzsvL+5POX5139+OTA8rKUeg@mail.gmail.com>
Subject: Re: [PATCH 10/21] gpiolib: replace find_chip_by_name() with gpio_device_find_by_label()
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
> Remove all remaining uses of find_chip_by_name() (and subsequently:
> gpiochip_find()) from gpiolib.c and use the new
> gpio_device_find_by_label() instead.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With Andy's comment addressed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
