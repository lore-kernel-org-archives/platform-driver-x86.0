Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 981E5CA0ECE
	for <platform-driver-x86@archiver.kernel.org>; Tue, 12 Sep 2023 07:28:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231531AbjILH2y (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 12 Sep 2023 03:28:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229766AbjILH2x (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 12 Sep 2023 03:28:53 -0400
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com [IPv6:2607:f8b0:4864:20::a31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4054E79
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Sep 2023 00:28:49 -0700 (PDT)
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-493545b4eaeso1791594e0c.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Sep 2023 00:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694503728; x=1695108528; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K4NbWWoBti8qk3UwKRcYmKazYR0a5hsSNCUeHFhe+5A=;
        b=kQj2RPhUu51y9PS7z68Ez4tPMVbu53FYhJYgDDp4j8tKHpEtuJSQKTfHxLdIRt3dfF
         S2Ru2B5BA7kZxuUc0yoUP4rCUjD+1PBcNEZkO7eoMuQFwMLbBJE2+BYHABhhCBSTefe1
         YVfQLMYGbZI2g3ycp0oAJdmI3AVoI6507vbxfllMxnPmZVEt/eiPqBOtp7CLLURcYDv6
         ynukNzWnQwqoK/zQQ9Rok4Slnp1IEZpXQUqpDLxBo8wM8bwU+Bp9QyPem1bgRh772Nt3
         O0dHo+yE2zAS0BWUWOR1v5EPBuTIAzlsmg3n49UxubP7SKkrldTkvIHM8QTw2bmwyVq6
         r6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694503728; x=1695108528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K4NbWWoBti8qk3UwKRcYmKazYR0a5hsSNCUeHFhe+5A=;
        b=a6cmGsC0afJ8qSvwG+r+EvYuY4ppNafR/Usbmtfg9z64ZIqmmvg6vzhlq6knRjjThC
         g+lZgz5OElAbKumS/uCf8mvn53VakwFpl5Fa92ah7LQUrvVRGLLNUtX5KeKBTR81YqTp
         h0TgVvCGzmuRkzBy4Ni1BnHDXn+zRJxcqQWkdfWLAf7AcokCTrgh5apC1amRP5bwTlJP
         pTbM15sCM02WXfosJKdlAN3GGlNEssWJ/BgHQ46YH7ryfjzEyUNxdlhQurtM/BwPp3sb
         A2AVplmT4eliq3XFuOFgm2QjVSt6HjGcwJF/N1H2mG6Oax93UMHBnTlaLvjKHVtDV6Sr
         DS6A==
X-Gm-Message-State: AOJu0YxNl+5pb48Fyk0w3Xf1EE7DECxzGsA0A/2Z8k6SMJKZQjMpTE7T
        xuUTQBeWeSiejVHpmng138N6s2KSv9BPqsXBbsvUIfm6l0Ctveh+
X-Google-Smtp-Source: AGHT+IGwWT8jEs4Y1gAQoX8wjXepJ758gnjavisCGjeMcPF+e7GcXn9EvoIqgEsv58nESMgPk54zUQ7Di9W9WjCAmF0=
X-Received: by 2002:a1f:de84:0:b0:48d:3b80:fba9 with SMTP id
 v126-20020a1fde84000000b0048d3b80fba9mr6255964vkg.11.1694503728376; Tue, 12
 Sep 2023 00:28:48 -0700 (PDT)
MIME-Version: 1.0
References: <cc9f31c3-ad0a-a688-c202-ce432dc71daa@redhat.com>
In-Reply-To: <cc9f31c3-ad0a-a688-c202-ce432dc71daa@redhat.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 12 Sep 2023 09:28:37 +0200
Message-ID: <CAMRc=Md+gdTz-ejnTefLqe-YAktQX9GmzsrSV+VCsCCt+_dCvw@mail.gmail.com>
Subject: Re: [GIT PULL] Immutable branch between pdx86 android tablets branch
 and GPIO due for the v6.7 merge window
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Sep 11, 2023 at 1:43=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Hi Bart, Linus, et. al.,
>
> As promised here is a pull-req for merging into the GPIO tree
> this makes the x86-android-tablets code stop using gpiolib
> private APIs (to provide a cleaner basis for Bart's gpiolib work).
>
> Regards,
>
> Hans
>

Pulled, thanks!

Bart
