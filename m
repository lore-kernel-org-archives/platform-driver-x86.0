Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59297EC873E
	for <platform-driver-x86@archiver.kernel.org>; Thu,  7 Sep 2023 16:16:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbjIGQQQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 7 Sep 2023 12:16:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239771AbjIGQPr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 7 Sep 2023 12:15:47 -0400
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45F5A8A76
        for <platform-driver-x86@vger.kernel.org>; Thu,  7 Sep 2023 09:13:46 -0700 (PDT)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6bf01bcb1aeso864133a34.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 Sep 2023 09:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694103099; x=1694707899; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDyS14lOc9gIdV8qqpJN7dVOi7FiXE2O1crBwgTrNhg=;
        b=JxsAG55yV3JR8f+WVAsHP0UsnbOF0wwdDQRda4EpideAR6Zjy4AWh0o3Kp1n3wOzHm
         X7y4uZ2TwWGfcqV8N1nQkeHCx9xttXOFGkjkCdam/9XLkd4G3rcO/9/2lNpIXKo7KoD3
         hVrIJCtbsFyKJDY8QYF6Hd/hmpudAoHsFmt1nfeoluQPzpizfzv0x08JeFvjaZ/oDM0j
         9/Gx3LWRGPpyrPKRPPwmptl5sNKeTrrhd+YkSHfuvJ4PLLcgIlWGCOhnaKbUS+Pz0hNl
         xVnEJBLtd+oOndIxaOJZMYMSiRkanEA8AVJBFpj5qAa6MCFuyfEI+DXprH/QlBB93May
         tLFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694103099; x=1694707899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KDyS14lOc9gIdV8qqpJN7dVOi7FiXE2O1crBwgTrNhg=;
        b=fU/9VnY0S1uwRmbTZvfiG7CCOMl3M8IwKWaUO60EhNVVDRUlnbOFTPDOTXj9c7vMDG
         yxY96E/Kuy09ucO1dw+tWVHZsmdxJkODCkz3kz69djJi7voC0DRxpdH8E4ZgYqy4wRuH
         i/OcFmac5EpECRO03+Y6Ufwualtk23Xd1QX+R8aCD29N7RWtNkQ4HEm4faJKaReTwzqo
         Eil3ejRVaOu9PJ8w7HVqUSckI/rNCTov6KvByMZrdj/Wt+pCJ0DjeW4NUOkwB4kFR3Cl
         ELCR9f/5PjhZTFGNmCl/S6GosDbDXkv7ixmrKKqronuF68KtzbgA93UDOv9Imcj3tAHZ
         A0tQ==
X-Gm-Message-State: AOJu0YzYmRVfChhgipM7Rs3GKwCpSXN07P+Iq2MJ+aVygCtoVXoFV8mH
        gCzNN29EcmMZK5AxTnTONdvgO8w7yxbdyKDXz9Rq6ZrmqMZDiM7q
X-Google-Smtp-Source: AGHT+IGJ2fOJYbfgZwCYkGOqpBoV8zRdwms0YQyjwmM812KoO4CG3kmEhKK7s/PjKGQeVe41+y3pVjBhSp9/fdWja/U=
X-Received: by 2002:a25:408a:0:b0:d06:49e9:a29c with SMTP id
 n132-20020a25408a000000b00d0649e9a29cmr19754022yba.34.1694071374753; Thu, 07
 Sep 2023 00:22:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-13-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-13-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:22:43 +0200
Message-ID: <CACRpkdYJhP5otaFXbn49sK_33GJMy85MszyD9rqoQT1-fqd9dA@mail.gmail.com>
Subject: Re: [PATCH 12/21] hte: allow building modules with COMPILE_TEST enabled
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
> Allow building all HTE modules with COMPILE_TEST Kconfig option enabled.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This should be a separate patch should it not?
Just send it separately to Dipen so he can merge it.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
