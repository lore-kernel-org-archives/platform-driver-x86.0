Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE04EE57DF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Sep 2023 08:18:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbjIKISo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Sep 2023 04:18:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbjIKISo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Sep 2023 04:18:44 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C39CBB
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Sep 2023 01:18:30 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-58e6c05f529so40983317b3.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Sep 2023 01:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694420309; x=1695025109; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3FtP4eYfLciH8NMTppInh1yd0cZJOo0SC9UK5LWqOM=;
        b=n/Fs+Yw/XZiSsoksmVatDxI/qFr2a96lZEmYxEzOPGRxJQOUTzz8Hn6ajrEIcw4SSZ
         vKEgH1oeOcYsbAfA9mxrL1ZPxN6DF1Z2r1x/D8B8tH4wALHhPWgIaI6b7VoOjTJcRj/F
         P0Ns5F1HG8EW1Gf+t9f2z5E9s2AG4B05GcZH7VprhYGhG4LkUIcahPIGk56tx0T/xMi1
         gmV3/xszPZTU/WI3uQYJS0V9kEWueY94KIbiz2Bn7E0p5K78Wtzl3dibjsPV0L38bt9l
         nIxcwIcVj2inZ8B7LPuOSgWpgBlMPoKTNwUoYoG+L9E5tnOCmYRIX4r+BkdmDAcpWIDM
         Xr4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694420309; x=1695025109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V3FtP4eYfLciH8NMTppInh1yd0cZJOo0SC9UK5LWqOM=;
        b=B0pT54NUtGw3umMd9poLGonin+CZAKceJ7ftGEqANp//+oLBxggwbCs0Cd8Iq3tGO1
         usHyg7k3gPT3haW2nGPX+2E7Ou0uJTzbhpbWBfR443cIPQx6inBmQOEoWZXiOY0v4Y7A
         2UoSwVf8MfB7z61nVFad1k5kJ6fKBVRiv7ry+5mQlGKFuiKhAZz3nqpByY+eL6z8Hv+C
         +FgcNVa8GI4nJ23BrsyyXHTwITK7/6j9t284ZfAJGQ0MJbhy/yG+Q4TVix7XLFhvQFLA
         kvXEdCImDOS+TB74WzRIqOV0eBx/2TN5N+CUFTls47obJ4j5z6iKcCANrmgTN4wrvLxr
         D1tw==
X-Gm-Message-State: AOJu0YwxwNcuGBZsW0frsCHNStRjz6yMzHoAg2TB/jmIMMFGm05LnVgG
        Gmp2qT5LZ2zcBSCUsYSbRcxFjlfBMTrPHm7SpZ1Xog==
X-Google-Smtp-Source: AGHT+IG6UBPsG3ER528i9u+4r8BVScL4ahYE/NA5v/zdBiZoZtNwPxGro0BQJVKq2AZUOGGOK7dxSEsNfSot8t1uxn8=
X-Received: by 2002:a81:490e:0:b0:583:9e6c:eb69 with SMTP id
 w14-20020a81490e000000b005839e6ceb69mr9522290ywa.42.1694420309307; Mon, 11
 Sep 2023 01:18:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230909141816.58358-1-hdegoede@redhat.com>
In-Reply-To: <20230909141816.58358-1-hdegoede@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 11 Sep 2023 10:18:18 +0200
Message-ID: <CACRpkdYOan92797er6==bvTWVrNd5EepYVts5noZvEdwf5AJsg@mail.gmail.com>
Subject: Re: [PATCH 0/8] x86-android-tablets: Stop using gpiolib private APIs
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sat, Sep 9, 2023 at 4:18=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:

> As promised here is a patch-series to make the x86-android-tablets code
> stop using gpiolib private APIs.

This looks very helpful to me!
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
