Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7928FEC873E
	for <platform-driver-x86@archiver.kernel.org>; Thu,  7 Sep 2023 16:48:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239780AbjIGQsp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 7 Sep 2023 12:48:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242277AbjIGQsn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 7 Sep 2023 12:48:43 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57D4FE6B
        for <platform-driver-x86@vger.kernel.org>; Thu,  7 Sep 2023 09:48:24 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-76dc77fd024so69459285a.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 Sep 2023 09:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694105240; x=1694710040; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9b7v8ynf43I8EPh86qv2+Qihb/MMTTB3QC+Af1PR4Qs=;
        b=YS7sfNjl8Y0cHglLS9s/5o4QPBrepDMLnEhRLeZfsA1YZ4MhXNQgSQPD4gnjBJpGki
         j7imxiCbRqqAvFQCi6HQ7sORLxaLSMIwwhCOzYrxP9lIno5BH8ubZf7PHCpybjqwGKLM
         AtdNlhfj76GDKUVX7MPVKWdBvgJPUpqB6tiSDL4qIpYo9h/1wewCbpYdUflCMPTvY6qe
         5hTHsJlBIKdet+5QpWSpHk0NQRIK07u2vlfmW8Yl73y4s2XU9zQ60JINXQLDAsoybGMS
         xZiWoOELxFnj7qpw0LIrR5ISb+P020+UG0hTL7BS7KCrZJvIYdfJ7+RIUt1ZR00smVHv
         lh6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694105240; x=1694710040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9b7v8ynf43I8EPh86qv2+Qihb/MMTTB3QC+Af1PR4Qs=;
        b=qO9dzn6TO6Qu1S0Wtl9B/jpSqDNb990vA00ehEz4aWihGZnOI/dfwb2lyyOPg3eJSC
         ab3LmUdFTllqy+MHXKY37EDJThBVBjL+puyrK9XroS5X2UuYSL2KXzg1rLn/Y/EmVnJP
         CLU5mRw2kRuvNc6EOB+XMq8XOK150+Q2A1w3e17NwcaRkuTIQE5T2S4Nrh3tPvvsUVGW
         5TlEGUx4TlthZHsY0Naz2xjW93lEEYmJzjEAe/YjRLp6UEP/6IzaAkbnqZ0MxZFT0MU5
         xPYxKXbaJ7TQjpezwpWdb9L42+3twnBE5UZ7BM0O+yaiTqMft4vxdOLciUmiEY9toSEY
         Mh1g==
X-Gm-Message-State: AOJu0Yz5nethZP3Rv86oNNUSSPxoxbQQtacHLcAXteWYUcwl+Tp2X18X
        9KCb83BWVAWljEiYvWFv1E4J+7/y119IjdVzFxI9YStcqfXf7WOlj2M=
X-Google-Smtp-Source: AGHT+IFBMY2aVjLfU4IGVauVzzx/POp8es0I/Cix3TKhZtX3AA6hztSUPcllgbHHruPMjhuUvCKYwAD/N3CsJPq8yKo=
X-Received: by 2002:a25:bc53:0:b0:d62:6514:45b7 with SMTP id
 d19-20020a25bc53000000b00d62651445b7mr18630990ybk.37.1694070562057; Thu, 07
 Sep 2023 00:09:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-6-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-6-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:09:10 +0200
Message-ID: <CACRpkdbAeBQj2RUjj9ybaAiytvtgpF4PXFvX+S4C0ZVP0bb8Rg@mail.gmail.com>
Subject: Re: [PATCH 05/21] gpiolib: add support for scope-based management to gpio_device
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
> As the few users that need to get the reference to the GPIO device often
> release it right after inspecting its properties, let's add support for
> the automatic reference release to struct gpio_device.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Needless to say, I'm a strong advocate for scoped resource management.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
