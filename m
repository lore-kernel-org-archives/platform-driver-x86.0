Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1656CEC8748
	for <platform-driver-x86@archiver.kernel.org>; Thu,  7 Sep 2023 16:53:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244396AbjIGQxe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 7 Sep 2023 12:53:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbjIGQxd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 7 Sep 2023 12:53:33 -0400
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84042CE7
        for <platform-driver-x86@vger.kernel.org>; Thu,  7 Sep 2023 09:53:04 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-412989e3b7bso8516831cf.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 Sep 2023 09:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694105467; x=1694710267; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vz1SpvYEblGQIUFOwvXI44dywFm7Krfl3gOSvV8SUSg=;
        b=cQSa2hUak6O/qWDFDkEJ3AMX1UjMji0zV48COdwT+ltIEMp+K7DKAd4QrUtTKHYdIA
         usjHvAgRPAjutCh1pxnWWXawcxQKlgV6HXR7wQL7DoMuyzuHs47EV+GwGmNYnLCQQs8G
         RR0+eUL7MkR6fQ+Nl75OZd/HLrIErvgQ7oCztOJFExRANUzJmwyYWHJtiZZk4AgEV9d7
         8YW7JkdWpj+EA7q7BpbWtra1bHmLO0lltHhILj3oHIQA1WT1HdBNbKs77fgE5f6am1EL
         hf6UlUfMSSPA01ZXtbLNqz2Mnx5af+eNKqHUskYyKykl8y4MX6Jjl7fjgUxAUiu6cWtt
         xMNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694105467; x=1694710267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vz1SpvYEblGQIUFOwvXI44dywFm7Krfl3gOSvV8SUSg=;
        b=SfKbNQeFZ5UKhjmgQPGPtTDp43vJhT417cEdD2P0SbNFure2AWy+isCLkZg5Mw1N8n
         x/+7GZ85zV3pJzYY0H3pYZ2hEtcQF/etAfLZJcd/3hdX7khJ4GfcO3yaR6o2MPhIwYis
         3VDgzUn97inusfeizGLLd9lcex+Bdm6jdGYr1bw0+N9VtMIv7C0eyWreSoX4sUgD1YVT
         Q9+gVwtP/QGvEMU4AQ9s31h/6FpOV/fWizqMLQKxeG8sSPbyb4ORjmunCeuFl80dMPfF
         2OOYjMslyYED9jTT4/sQp99msBAV1IhY+aWKguBlfkkI+EC8N1fnaxw+ElHmqr29e/io
         F3nw==
X-Gm-Message-State: AOJu0YzRYdblv8siEUPb9miy4jJ9oSVDl2b7NEY72yofjEa9IZVnjnuU
        QdDmztPSxfCMlNTY6zUVR3xyClDqslJZ3qEmnVp9OUonIVBBQDNR
X-Google-Smtp-Source: AGHT+IFX/4eyumxiC7nEFR+XPxzCJ5uyMTs6iy7ZgZ+cx415alKaYaIdPMXy/YLPsS1BT9j2oJ541saIGrDoN3xslRU=
X-Received: by 2002:a25:838b:0:b0:d35:f59a:6e46 with SMTP id
 t11-20020a25838b000000b00d35f59a6e46mr18424020ybk.49.1694072273274; Thu, 07
 Sep 2023 00:37:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-18-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-18-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:37:42 +0200
Message-ID: <CACRpkdaq8jwYLWfqvmjJFyxRPktTSTt-FY_OoPQ-ymU3fFk41w@mail.gmail.com>
Subject: Re: [PATCH 17/21] gpio: of: replace gpiochip_find_* with gpio_device_find_*
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
> We're porting all users of gpiochip_find() to using gpio_device_find().
> Update the OF GPIO code.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
