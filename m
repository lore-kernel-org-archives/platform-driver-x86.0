Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A932EC8738
	for <platform-driver-x86@archiver.kernel.org>; Thu,  7 Sep 2023 16:21:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234951AbjIGQV3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 7 Sep 2023 12:21:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240996AbjIGQVJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 7 Sep 2023 12:21:09 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B435271E
        for <platform-driver-x86@vger.kernel.org>; Thu,  7 Sep 2023 09:18:14 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1bf7423ef3eso9030685ad.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 Sep 2023 09:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694103415; x=1694708215; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I18DoVxRqFJaTqip4HKub/TPXgj9WnWp7a45EaJWvuM=;
        b=KvlWgtU3QySDbVz1FsLrcPQXCb/ZmDhcXIj4QOUqeZeUAKZltjJsfYX2XA1GZqhjDv
         DX1pYOq4aSI+z3WsdoNxB5/A4Rl1vDpmJSQpqx5tyWcLYKeih0r7HZ7O2VbRMJlipEvr
         3oONGRWerxiOYSJ40hzBOUgb0crvXyHB8ZcLzdN+B1ruFyRx8EoB3/eDS7RM+VbVCm8Y
         oT621GBDoRPAXeMMG3Ldq5JS1KRctOezgEFBVM5vRn2HVhyfW+i7PAZ6nEYbDp1TnlnL
         hT/LCbu7Zv1WKDS/4y/pC1pEQvGR9cAVFSgy3T2WKQzyHaJesab4/qj/CU49cOPiWj21
         NyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694103415; x=1694708215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I18DoVxRqFJaTqip4HKub/TPXgj9WnWp7a45EaJWvuM=;
        b=ZEtWAQmwb978qGrw1Pp53hjC3IeD5gAke01+sCEja0Cv5UqK+KcGHgnVsTUGFKxoKh
         ZTcsGDvBJOQG5cxIEJqDDZzGuCHllTEN37z0SHO03EKhUeLRFBBpav14TouBokfDCvuP
         JAn/UkZsdoF3wdcsg12GsQzuHNBBMOtNpkwAN/r1vVcY44tttKLgQ/BWPUh+STIS6Ozx
         i8nYaDNb4nlFAlQA3+BIxihLrvuJj6D7GofSvjNt6nLti7jZYqIhvwRX0PYGR2yc05pU
         y6rXx1NEOfjgJPiYQXHNDEc3IOZuQ80WRQohm93aVOFHq87mdS8esBHa8BDesfZj0n5e
         Qrqg==
X-Gm-Message-State: AOJu0YzwTCGz7E3JP7jFVkCRU1DwM6izTW9eDfr69pq6Diwmg2sfGA8m
        xW8LF2wDJY13LAF6uM/vSXc4ZjuQeAuYCXwLhEvgOj1/dP3VCsZtfgA=
X-Google-Smtp-Source: AGHT+IH52ZmMDQle74d5+xBv94alRH/CYtL/TIhLKM9b7HFrce/j3cJJJRCz5BcoTZ3hxH+Wxp8LvqydUyq2rr0UgjU=
X-Received: by 2002:a25:5f0d:0:b0:d7b:90c6:683c with SMTP id
 t13-20020a255f0d000000b00d7b90c6683cmr17866183ybb.26.1694070426178; Thu, 07
 Sep 2023 00:07:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-4-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-4-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:06:55 +0200
Message-ID: <CACRpkdbE5AJHiGan_oj4_kBSOh7okfwM0u9qDcEyTBr+NCO=wA@mail.gmail.com>
Subject: Re: [PATCH 03/21] gpiolib: provide gpio_device_find_by_label()
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
> By far the most common way of looking up GPIO devices is using their
> label. Provide a helpers for that to avoid every user implementing their
> own matching function.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Yeah this is what everyone and their dog reimplements.
Good to centralize this.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
