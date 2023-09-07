Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C746EC873A
	for <platform-driver-x86@archiver.kernel.org>; Thu,  7 Sep 2023 16:04:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231295AbjIGQEa (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 7 Sep 2023 12:04:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234670AbjIGQDr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 7 Sep 2023 12:03:47 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08C565FC3
        for <platform-driver-x86@vger.kernel.org>; Thu,  7 Sep 2023 08:52:40 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6c0828c3c2dso769796a34.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 Sep 2023 08:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694101880; x=1694706680; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhjMO+NmlnkrwuQTWTc/YRBA9QtXdjC/hl8DIJEpExk=;
        b=iRmBNejH4hUQmB3rw5g4Bm/Wy2Un8FxfnsdgLJh7hx/nQMEJ6KU6mmz2LdMjahOXH7
         JAOVf+gvCfjIvCYGYlw4wkUkZ4E1EhTi7OHWuPQqC+k2J1rUb25oB54bEmqHXj8WaTMd
         Z5trlTHt43OB1hamU/4fCrWXzMI06u8D6DcE7qhanQhfRsLn+MQ2Hf7HwebAI/S3YxGs
         ZUhNJ3h0sfa7CStWlI1Ll+y7EiIN662+w3iJ+V8Zk/uo2dtOsdwGtANYqrBcMoAI3h8+
         xDUY7y4ehnZWtjhuZdV/XQuOvz36H8yTKr/QN0zfXHocekx6xmyIKIP/C2sopEipWKtV
         eozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694101880; x=1694706680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uhjMO+NmlnkrwuQTWTc/YRBA9QtXdjC/hl8DIJEpExk=;
        b=lqayWP2gMSdwfNY/0JuUVO32ZToAubk5e9drQr3X2UFaPzhs6dmblo2C+FSOZFO0Rf
         EM0ga6M6iLt444fxMaFKEJeQTxxWcf3+0tjx6MIONhaYXrIkh+WBGpMtP9LifVoth+O6
         Uz2yG4a9BcuYt1fyDwoXhDITy7dpIhIodr+G8BD+AbH+2BK6bls3zmJz5Wlt541Dc6+v
         cXla2rPdsIwj0XvvydF9ifXDFLmIVIdjam90przz4i25OON/BmxGgSiu64NH3gEkS0Fc
         SJboNRfqzqhhtAWltQ3/snwVef8tzzbKlzjKtZOcTfOYoYrV12GZezylaC2Lw75ZVqWN
         3ufw==
X-Gm-Message-State: AOJu0YzjQ7poYEyRHsEx913WZTRjK2PZi+PCfAB9aFu2aPvZMbFn8cZd
        13vpSyYO8+CVLa9gdiCehJHFWjdi4sbaIEvuU1k6bvH6JrtXnNG/o3Q=
X-Google-Smtp-Source: AGHT+IEos+IWcRlRURBpWq2f/yqX4JwD1uUNGc4FMcBDjtB4EYVZgMX+6wsZb6/oamwVKLnZoLMvxAzj5BAJ8/qIfJs=
X-Received: by 2002:a25:aad4:0:b0:d7b:9ac8:f439 with SMTP id
 t78-20020a25aad4000000b00d7b9ac8f439mr18109140ybi.40.1694071872125; Thu, 07
 Sep 2023 00:31:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-16-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-16-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:31:01 +0200
Message-ID: <CACRpkdaVUPNYVjAi2XsNKVhwmtk2qpVp62Lke4xeDOwhhBXLtg@mail.gmail.com>
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

I was cleaning this one just some merge cycle ago, now it
looks even better!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
