Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 989D6EC873F
	for <platform-driver-x86@archiver.kernel.org>; Thu,  7 Sep 2023 16:14:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237922AbjIGQOm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 7 Sep 2023 12:14:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238608AbjIGQOO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 7 Sep 2023 12:14:14 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1B841BCA
        for <platform-driver-x86@vger.kernel.org>; Thu,  7 Sep 2023 09:10:42 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-68e29792976so986273b3a.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 Sep 2023 09:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694102969; x=1694707769; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XvLrxMQ1IidFWYQv1qbOrK7Zz+kctFqLG1SqA3KCV8I=;
        b=ujVryTcOHGdwm54GxIe3aX6MG8wZe1C1nCd45GygZVCfwOWq80hCRsHdEzsWtP8jwX
         ZiBn48VIJz+PCRZ8hLX2xXnXEm0bU2CTQnQNf4TXH6KYZTt6GYzUJAqPgOvnZom+Ez9x
         fJBWPwWhtl+gQVbbspfw3AuNwwDB0PRobVQOpLMVwl5InbfFAXTVQcdAs+zH4QHmrZiE
         buaCk6VC1lY7vHi8Pqkq2vnGLuRSOYJCvoFRXwYm+DK5JffR4k0uUxwqimbyVA2YYcJZ
         pMa9K3JoFdwW3ZC1xtTOk2b2TdMldHpAlaQ9+jY+8Im/GZXaozEEFeD553tpiGD2A4bk
         3YaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694102969; x=1694707769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XvLrxMQ1IidFWYQv1qbOrK7Zz+kctFqLG1SqA3KCV8I=;
        b=MGF8dbsR8Vs9fQifJqfDR3hYBEOFw/1CHJ+M3liZ0tPnraSeNG/Cqj2/2P1BSWj1kq
         gi0pDE0hA+AFHOHYSPtX7t4hkgOJAVSrGQULzoz0xXtP4wd8qOWoq1d7x1euakmEXphj
         oPEJDjdBwjmqsfGmFR6nmaogMavLO3BTWAURHeE+NDgCOnF7b60qj976TbTEK1JRvTZf
         UQW21NWJ9RfADesATXGiQpwcirgZxYoN/oCJ/N4YycM5Y8Tr/Nrh+KD8aY9eOeihQhA9
         p4vAFZDNtE0zengORKTzgaVY2bLiiXFiJ341n1eIlBaDUB4kI1EmyaR/lPOhcAseOf+u
         7aTw==
X-Gm-Message-State: AOJu0Yw4QKIsWCE92pTTa99+yuOd9Ao71x997daSYVEpXbXLe27lwaJ2
        CULx7AB/jrIOncS29sj5+vS4iek7RSxRxi7aoQ+e8hRKYZStW2UU
X-Google-Smtp-Source: AGHT+IF33BsQs6PXZBD6Yyx6MLxtC5D3dCLaevE9AUQBN2cYvO/VBix1ip+znuJz46jocHvadEET9qd1DQq8TKxIbhc=
X-Received: by 2002:a25:fc16:0:b0:d78:be:6f02 with SMTP id v22-20020a25fc16000000b00d7800be6f02mr17528083ybd.11.1694071503985;
 Thu, 07 Sep 2023 00:25:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-14-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-14-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Sep 2023 09:24:52 +0200
Message-ID: <CACRpkdZE9hMWNeY=J0LrGTO1=83L46z69V6b7BX=Q-vaM3kBAA@mail.gmail.com>
Subject: Re: [PATCH 13/21] hte: tegra194: improve the GPIO-related comment
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
> Using any of the GPIO interfaces using the global numberspace is
> deprecated. Make it clear in the comment.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Split this off and send separately to Dipen.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
