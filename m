Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE0D8CA0EC6
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Sep 2023 22:07:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355830AbjIKWCL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Sep 2023 18:02:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236108AbjIKJu7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Sep 2023 05:50:59 -0400
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20451ED
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Sep 2023 02:50:55 -0700 (PDT)
Received: by mail-ua1-x931.google.com with SMTP id a1e0cc1a2514c-7a50a1d1246so1681584241.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Sep 2023 02:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694425854; x=1695030654; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x5UYe75FP8toYURe1y5KQ1BGMkvcZaEW0CyeqMEnRyk=;
        b=IUSU0ImG9M85d23hYzB7bpDBI94yAXU7yb3KtFO22tR9KyhGzTYX8UrG7x/myd3q72
         uTFgJOAzv9jw3BpJKVTTDuP4YwYVAdX21idzyoCcMOdqISTqCFBylIocj4WU1o/GHxs6
         PV0qMe1e4vPgdHht2mLV2pqRbK1wE+BFhRJ3ka4+mACjKue9AWjL2ToE+nYZJlB2gRR+
         RPxqCBSrPbbkpxeXabtLTE43/NkkH/71EfGofjq8v1QTQcrtLiWtmKvw4AJp3cNP6sm0
         ajLskmIq/Ub165cTMCNLv8IoL7bViLPYWUVfJAD5pIeUv0MPsd44ConNMJJWdsVIbszi
         Jytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694425854; x=1695030654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x5UYe75FP8toYURe1y5KQ1BGMkvcZaEW0CyeqMEnRyk=;
        b=Rt9LUDJoldemzmMQ6R1m5js08221XGwD8gkLYlvS5p9ysiEkqD/VZvH8A37nt1m4sE
         p62NPn89YMDpvf16uhxKPglX5PvXnFWLYfSKFoMEIh4b+v6maQl4g4Xc9D6W5VojtePX
         qIN8IRHkn4BKPIMZs2KAbv3qKsnxcwte5/FzyN4a7xELgvU0yuhdgifpWztpFa//TZeo
         4yKBspuRNNSisWmKcTFFHpo4nyB7VpxyaTHD3yxkNlfQ1orEK/o7XKVdvzmwuhJsJ+kl
         v2m1b8AgIJoscYGB/Ld9PRqlgZ/54Q07fy1PMLvrmEwWa911/JtSUbVwaK7ZOiTL3aaJ
         cXTw==
X-Gm-Message-State: AOJu0YwaOGk4WRLXdEUPabN/gAAOZzAx4k44yX1WlhGG7j/XbyNPINP8
        B8WtYoDX1Q2/GmLpkWdkXt1pC+hZYK3E8IkFT1xaqg==
X-Google-Smtp-Source: AGHT+IEggNm68Hr3RRD2F35KLRNwrrw6//YEgnoVHrVVzY9f74otc6OHWj8qqne2MLlaWMad6BNeDq9fIoKfbNoyalU=
X-Received: by 2002:a67:fd41:0:b0:44e:dece:6b38 with SMTP id
 g1-20020a67fd41000000b0044edece6b38mr8040621vsr.23.1694425853682; Mon, 11 Sep
 2023 02:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230909141816.58358-1-hdegoede@redhat.com> <20230909141816.58358-2-hdegoede@redhat.com>
In-Reply-To: <20230909141816.58358-2-hdegoede@redhat.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 11 Sep 2023 11:50:42 +0200
Message-ID: <CAMRc=Mdtbnc-uktsgG4rRMRpRfSO7a+6wCQZZgr3Q7uGKprbfg@mail.gmail.com>
Subject: Re: [PATCH 1/8] gpiolib: acpi: Check if a GPIO is listed in
 ignore_interrupt earlier
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
> In some cases where a broken AEI is present for a GPIO and the GPIO
> is listed in the ignore_interrupt list to avoid the broken event
> handler, the kernel may want to use the GPIO for another purpose.
>
> Before this change trying to use such a GPIO for another purpose would
> fail, because the ignore_interrupt list was only checked after
> the acpi_request_own_gpiod() call, causing the GPIO to already be
> claimed even though it is listed in the ignore_interrupt list.
>
> Fix this by moving the ignore_interrupt list to above
> the acpi_request_own_gpiod() call.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
