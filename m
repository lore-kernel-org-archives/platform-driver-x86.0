Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C0BCA0ECB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Sep 2023 22:01:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238100AbjIKWAn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Sep 2023 18:00:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236171AbjIKJwR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Sep 2023 05:52:17 -0400
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E46F0E40
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Sep 2023 02:52:12 -0700 (PDT)
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-7a5170c78e6so1371202241.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Sep 2023 02:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694425932; x=1695030732; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KIn7ppfI5hUpZ9BWxWQzUJmi7tuPomUJZC2PQ3FzTQQ=;
        b=07YFJQkUeiL3lWFl7abLIGKxeKDPyLSlQvruWtuE0RXA3iHdEPmYRzO+dSTW1yls7P
         im38IXFacFuIQibFMVCGF/JdCcfW3gVvaehmubYhS3TwiLnxd7mmluFkj2P/PTie7skn
         q6eDMcNkYgzx6JalgZnSoCfqjxoSpOHs0ukqDQb62PrbF/YcVHB1qcfLsVPzahBvaWW0
         cf/SnTinPTP07H8iIT1tj//ruT97cgtd7Rj9/i8LHe6+DlpbgxXvER5McsJ9a1Hcjyhy
         KFI4TPEYhwJDQjO3/76fuF7/Hm2flaeOl1WHskRz+E8v/TbDxu7qFWyBEkIri98v4soq
         ZfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694425932; x=1695030732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KIn7ppfI5hUpZ9BWxWQzUJmi7tuPomUJZC2PQ3FzTQQ=;
        b=Re0XYD3m6h5/CbYgx48BcO5HHpFa7R6pPrKlP8FUlxnP/+KMp4VQ41q6Q9VEugGZ8F
         D7foO7WW3/0fclkgZqSLPDTBycwFIEvpRb4Y/ToVfl4U4/nybmOTBTM7CNJmSqLs4CBj
         Wj7xNBaRf8UJHN2Gxg5GiWC9HiVH9HUqQm3KPihEdO2sFEMK65sSf5BbauCS8OyPz5Hd
         UMKiH/xqw11JQg4XTfnQRkQqYolzOt95FKseVJlu6V9mFi9McNRh2rV/Lz0J3e+ebCKp
         VahjUYjUOs+mPMLLOYOfRhAmJ17J0zdeig4LDfizSkcuIzwYO0DEDd/O8n+vHryBHB5q
         +nrg==
X-Gm-Message-State: AOJu0Yz1nHAzOAWcl8UABd7qCcz3hKuIF5tZjht6dDxjC/V36PLhJxsu
        TGJorODNTmM5m/cc3zWvWD/OtPjlpozEsWYsuL8Psw==
X-Google-Smtp-Source: AGHT+IHibDNcC0W+t+sqyHgZd/i+fSeIzfiyJ4cjrCpSbO2UJ3YBbXCP+TDuS+qow+FJct3Pniq4ec1uXbAZUbmESNQ=
X-Received: by 2002:a67:e981:0:b0:44e:d6c3:51d6 with SMTP id
 b1-20020a67e981000000b0044ed6c351d6mr7589163vso.14.1694425932088; Mon, 11 Sep
 2023 02:52:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230909141816.58358-1-hdegoede@redhat.com> <20230909141816.58358-4-hdegoede@redhat.com>
In-Reply-To: <20230909141816.58358-4-hdegoede@redhat.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 11 Sep 2023 11:52:01 +0200
Message-ID: <CAMRc=MeErGNWcYmm=T8HXPUoYzOQwjsSZGh9w_ssTffk-ze_zA@mail.gmail.com>
Subject: Re: [PATCH 3/8] platform/x86: x86-android-tablets: Remove
 invalid_aei_gpiochip from Peaq C1010
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sat, Sep 9, 2023 at 4:18=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> Remove the invalid_aei_gpiochip setting from the x86_dev_info
> for the Peaq C1010.
>
> This is no longer necessary since there now is a quirk to ignore
> the "dolby" button GPIO in gpiolib_acpi_quirks[] in
> drivers/gpio/gpiolib-acpi.c .
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
