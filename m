Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D6C0EC8742
	for <platform-driver-x86@archiver.kernel.org>; Thu,  7 Sep 2023 18:29:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240589AbjIGS3O (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 7 Sep 2023 14:29:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235037AbjIGS3N (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 7 Sep 2023 14:29:13 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B53321FDE
        for <platform-driver-x86@vger.kernel.org>; Thu,  7 Sep 2023 11:28:58 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-68c0d262933so1094224b3a.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 Sep 2023 11:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694111338; x=1694716138; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Cz/9gzupE5TkNJMwQALq93+f7LW0hvWUSZEk1aMybo=;
        b=PwAIxDYpnOCcJez5FXGfWfPHSGcyKhmcTZzmKK91jtlsK0Rpk6XbU7zePtYHdR0QcP
         ar5J70e62Zs3OYXuFJQOx9lBHfOA7oTsDm0CTdKlQUUuExrIXTosZbFrjsrX8LM+JpxA
         zRQVNQfI4yFFJzu7FQRBTOGkRbx+fTFfSYW3kGFXASw56zaAe18WDzJmpGnQDSIyHuFE
         iXTXx+6PWTijgaW66KdVufrCsdNtz3A+5sqLulrlmQIUW48Th4GASUEFTnEWwFaHcveo
         oA2uPrSt0xCYZizZuMcSXiLw+8wUpDNi1NNBrk5zpWMPsrgt3oNaLULr5bo80KvCS7Kz
         tS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694111338; x=1694716138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Cz/9gzupE5TkNJMwQALq93+f7LW0hvWUSZEk1aMybo=;
        b=nvvv/8GaYmWLZO3FkZymz7zmwmX+MSOqj5hx6tUPU+xrL745klcVfzXQCCiaxtSQdc
         uiYCEDH027hdMigcS7QRh2crWmWxa9Z7dZrFMIT4o2/eBD7kdYiNf4ACQiGFY/6zKUEE
         CZSDtA48hsR80Ri+MC2+7L8PY3V5TXfp8JVNtFjFJOfV59MEnoH9gBrHOPiyPKJUhb50
         LzgfWaz1ljXctHVTrqUvbcNmEGJZoz1U1c4CNB9p/d9DfoYj8sUa727OYuWev88bc0f7
         fx0/CQCFA6rURX1otEI8QfvqRgUxuoARMl801zFmr7xsvC5a3wIfxjeOxpkarDa7DYsj
         yzIg==
X-Gm-Message-State: AOJu0Yz79VrR4LEpRviGYtNUT2N0SR24mJlNOTsW4rlHn2rJW/2hxsSY
        ZNQSFk56tKWblyGpCsjv9KH5t7sOXbqYVjQPV6daTN0qdeixK/aS
X-Google-Smtp-Source: AGHT+IHhmgzWKTsylHHZ2qSwdCSe8fG9sB+HCDYVng7dujabCyOchOSgbCuVeCZbRiidwPEiAF4MbYeMV3WMB/wKWxY=
X-Received: by 2002:a25:40ce:0:b0:d7a:d628:f69d with SMTP id
 n197-20020a2540ce000000b00d7ad628f69dmr19332220yba.32.1694070175534; Thu, 07
 Sep 2023 00:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-2-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-2-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:02:44 +0200
Message-ID: <CACRpkdbT25G+KSUOPjgo9BQmPy2_rgXULVM1fpZQDqE+Xcj80g@mail.gmail.com>
Subject: Re: [PATCH 01/21] gpiolib: make gpio_device_get() and
 gpio_device_put() public
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
> In order to start migrating away from accessing struct gpio_chip by
> users other than their owners, let's first make the reference management
> functions for the opaque struct gpio_device public in the driver.h
> header.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
