Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28AA5CA0EC6
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Sep 2023 22:06:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355626AbjIKWBc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Sep 2023 18:01:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236133AbjIKJv1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Sep 2023 05:51:27 -0400
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7C80E50
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Sep 2023 02:51:23 -0700 (PDT)
Received: by mail-vs1-xe29.google.com with SMTP id ada2fe7eead31-44e3a4d0a6fso1627696137.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Sep 2023 02:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694425883; x=1695030683; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T0WH4+Wc29rD5CEkIjJocX4Prp2Urfkick4BKKKLe1M=;
        b=nGK0iAXhV0D+oDRRCXPHR5YFlOpdur7MkHCGOuEHBa3zDHDM0jmnOidkAh3amVWZNx
         xbiTII5sPGbmebJG+FAlzpaIm6jijTqGn/jXpJTvsjscIsLtBAM6c1NW6GG9SIKvkca+
         kh5Dj6WNpZMQ4fRNRi9y8mD0/JtFTNY2RqV4ZRRFVyZsS5F1+mK7RZFgK641HryEi4lZ
         K3Bw3WNnxvxfcmRkmKLoNHEDw6ra5EMISskYBx2JGM939ToauUpCuUW1svvX5boHy+Iv
         5zuiomzACIJfzWvi5zkgXq70q8NsGA5ZvGv5/kGDCEnDGyZmAQ+MYXDQr/NjPHQmgRB9
         5NVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694425883; x=1695030683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T0WH4+Wc29rD5CEkIjJocX4Prp2Urfkick4BKKKLe1M=;
        b=VYUZQIemVR5Jhv/4YsQEV5tL87y5KhLiwMsTdRLb33AKIliajy2Ax6LjtDUTKrkgzP
         fe/idWzvgNxgdcKBWh36D5Dz+7VK7eGAfWRozLKGgibxyXTqOglWWehWdE9wApHEDanR
         giJXrYeiMC6Gegu4unHsHlaFv7ZvKdG4AxdjCzuoKY0QaHHIO/QvO1xHfv2cjV8RmKaI
         c9G30uooO7cskptr4YxjpgaIJ+0fYrPR8HkKg9mV4UQOQXASuqda3KgIY+vJyAeadZKs
         wtxOUNdblCT8j0G3ggt6UAjmzeDr9Y4+o2F1KB7i26ZHwjlkf74DsOHkp4jYmPDvcZSN
         kzZA==
X-Gm-Message-State: AOJu0Yz03Wt3N9T8eSOxqb+1EGO1VxJFfBtUlT2XMyjnk7RHHxOWpLWw
        aG/ZgLc9N8LxZLhNQCHpof2eWlmZI2ZLrS7GbK4bmQ==
X-Google-Smtp-Source: AGHT+IFOEx+C3bfi/cg9aJe+W1CyEYTAODyP1z7k1dE1LcRmzBWXPMQc1sQ2Pv7QPw6aWchIhQ5xPTtHb868sarlRdE=
X-Received: by 2002:a67:f3c8:0:b0:44e:d85c:ac48 with SMTP id
 j8-20020a67f3c8000000b0044ed85cac48mr8052269vsn.5.1694425883024; Mon, 11 Sep
 2023 02:51:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230909141816.58358-1-hdegoede@redhat.com> <20230909141816.58358-3-hdegoede@redhat.com>
In-Reply-To: <20230909141816.58358-3-hdegoede@redhat.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 11 Sep 2023 11:51:12 +0200
Message-ID: <CAMRc=MdnhF1DfaknaxNNt+paB86429C4_CjV5j5FgE0ZyJkR3g@mail.gmail.com>
Subject: Re: [PATCH 2/8] gpiolib: acpi: Add a ignore interrupt quirk for Peaq C1010
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
> On the Peaq C1010 2-in-1 INT33FC:00 pin 3 is connected to
> a "dolby" button. At the ACPI level an _AEI event-handler
> is connected which sets an ACPI variable to 1 on both
> edges. This variable can be polled + cleared to 0 using WMI.
>
> Since the variable is set on both edges the WMI interface is pretty
> useless even when polling. So instead of writing a custom WMI
> driver for this the x86-android-tablets code instantiates
> a gpio-keys platform device for the "dolby" button.
>
> Add an ignore_interrupt quirk for INT33FC:00 pin 3 on the Peaq C1010,
> so that it is not seen as busy when the gpio-keys driver requests it.
>
> Note this replaces a hack in x86-android-tablets where it would
> call acpi_gpiochip_free_interrupts() on the INT33FC:00 GPIO
> controller. acpi_gpiochip_free_interrupts() is considered private
> (internal) gpiolib API so x86-android-tablets should stop using it.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
