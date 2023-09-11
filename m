Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C427BCA0EC7
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Sep 2023 22:06:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355600AbjIKWBX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Sep 2023 18:01:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236940AbjIKLn7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Sep 2023 07:43:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0C756CDD
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Sep 2023 04:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694432587;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=iKdjkytRW1RKARIy7Ovk3eIg/sQI4Dyr5qqVf3qxKz0=;
        b=e7NSAop0EkHDhTz2lsZVPh1J3CZPvvn3s6s7dSTp/RES7jglQauPmaGGAAaDmpMv5+9/CP
        Dg2ZIbnZVUru2OZClh6qcQLeMty46kViufLZKZ0IDeRrZA1cdo9PnCiIj21hOZUDgj7YGz
        8EaZcqRtekNOeHyBqhDBBaG8Se0UKT4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-110-pYROh7IqPu6hdSD_-UE0kg-1; Mon, 11 Sep 2023 07:43:06 -0400
X-MC-Unique: pYROh7IqPu6hdSD_-UE0kg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9a9d7a801a3so283990866b.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Sep 2023 04:43:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694432585; x=1695037385;
        h=content-transfer-encoding:cc:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iKdjkytRW1RKARIy7Ovk3eIg/sQI4Dyr5qqVf3qxKz0=;
        b=pEveC4B7SMmRBe/iDZRoOr/BSHCP6r5giBipfVQO20mGKLAgjidZRfnOH3zBha8E8L
         91LZGM5ksAvLNK5uvcMVlJwFGNcW3veQoSAIj+gPLq1YZMhyvsAkfHcE1p+03zn8Zkdg
         gniqtaQ6LKv0ao/5RcLNl9Ry4+bKUsWvF2zewy8nEIN9LwfTihDW3doxYVs9z0S/zU3W
         +P44le1FQkrGGYfYU9alw7T54i8Y3FxOh/0e/rqYn0NrfaJHOOPZ1/rvj/C7su+ABzd3
         dnFzSPm1ha9P/shjuW9EMzrp++C7JFjOMx+EhJGtaflMAvAYvdyvSwK1Ezgphdmtusz8
         hFtw==
X-Gm-Message-State: AOJu0YxBeV9s64Ixg73lMO9gO8O4gwaCgLe+nDR4SCE9SkOGa20VML/P
        5anXfFjJxnIw3e5i4lRjqxjW5rELPGYFDdj4NwuodCqNPz1Sh5TZcSGVY+/INpixDVzhzD/8ixa
        NzbE6iQ44vPtBUKPhYgwvw8Y/NyU0/8QdyQ==
X-Received: by 2002:a17:906:3112:b0:9a1:914e:490e with SMTP id 18-20020a170906311200b009a1914e490emr7302015ejx.53.1694432585398;
        Mon, 11 Sep 2023 04:43:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEF6L5QiZIF0AMsl3073IFMxcJiS8zc6zqEssMd1l9qYLyrRfhHjHEXeCPy7+HjFRkrdhI3EQ==
X-Received: by 2002:a17:906:3112:b0:9a1:914e:490e with SMTP id 18-20020a170906311200b009a1914e490emr7302004ejx.53.1694432585103;
        Mon, 11 Sep 2023 04:43:05 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id va17-20020a17090711d100b009929ab17be0sm5187708ejb.162.2023.09.11.04.43.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 04:43:04 -0700 (PDT)
Message-ID: <cc9f31c3-ad0a-a688-c202-ce432dc71daa@redhat.com>
Date:   Mon, 11 Sep 2023 13:43:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] Immutable branch between pdx86 android tablets branch and
 GPIO due for the v6.7 merge window
Cc:     linux-gpio@vger.kernel.org,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Bart, Linus, et. al.,

As promised here is a pull-req for merging into the GPIO tree
this makes the x86-android-tablets code stop using gpiolib
private APIs (to provide a cleaner basis for Bart's gpiolib work).

Regards,

Hans


The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-ib-x86-android-tablets-v6.7

for you to fetch changes up to 9578db7939fcfa0bdfa6ab767fd0386adf2302eb:

  platform/x86: x86-android-tablets: Drop "linux,power-supply-name" from lenovo_yt3_bq25892_0_props[] (2023-09-11 13:28:59 +0200)

----------------------------------------------------------------
Immutable branch between pdx86 android tablets branch and GPIO due for the v6.7 merge window

ib-x86-android-tablets-v6.7: v6.6-rc1 + ib-pdx86-android-tablets
for merging into the GPIO subsystem for v6.7.

----------------------------------------------------------------
Hans de Goede (8):
      gpiolib: acpi: Check if a GPIO is listed in ignore_interrupt earlier
      gpiolib: acpi: Add a ignore interrupt quirk for Peaq C1010
      platform/x86: x86-android-tablets: Remove invalid_aei_gpiochip from Peaq C1010
      platform/x86: x86-android-tablets: Remove invalid_aei_gpiochip support
      platform/x86: x86-android-tablets: Create a platform_device from module_init()
      platform/x86: x86-android-tablets: Stop using gpiolib private APIs
      platform/x86: x86-android-tablets: Use platform-device as gpio-keys parent
      platform/x86: x86-android-tablets: Drop "linux,power-supply-name" from lenovo_yt3_bq25892_0_props[]

 drivers/gpio/gpiolib-acpi.c                        |  30 +++++-
 drivers/platform/x86/x86-android-tablets/asus.c    |   1 +
 drivers/platform/x86/x86-android-tablets/core.c    | 117 ++++++++++++---------
 drivers/platform/x86/x86-android-tablets/lenovo.c  |  29 +++--
 drivers/platform/x86/x86-android-tablets/other.c   |  11 +-
 .../x86/x86-android-tablets/x86-android-tablets.h  |   7 +-
 6 files changed, 118 insertions(+), 77 deletions(-)

