Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC931C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Feb 2022 16:48:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230251AbiBXQs5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 24 Feb 2022 11:48:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230246AbiBXQsz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 24 Feb 2022 11:48:55 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 59E2612A9B
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Feb 2022 08:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645721304;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=ed8Lh2cOU0YL5cudob+OfUR2qUzn6zWG4kvh6tQayA8=;
        b=T/QjF6RU0fzL/K6nkXGXumBMJT50rVZhV2wSh5Ydi56Ziysm2vdbA4tWUxYARe49BLdrnJ
        g0gGrAgH4sy3iYmg0ecIw2DTJgKUUgFl0La4ZmjcY/kc1csPk2U7u1dt2db7NGpOfuKrpv
        XbwqNtCHGljLO09d5+Q4GbIjj2L5J80=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-flgNL-9gMb-mapp1kZm7WA-1; Thu, 24 Feb 2022 11:48:23 -0500
X-MC-Unique: flgNL-9gMb-mapp1kZm7WA-1
Received: by mail-ej1-f69.google.com with SMTP id kw5-20020a170907770500b006ba314a753eso1467107ejc.21
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Feb 2022 08:48:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:cc:content-language:content-transfer-encoding;
        bh=ed8Lh2cOU0YL5cudob+OfUR2qUzn6zWG4kvh6tQayA8=;
        b=B4M0X2ZHOOzwPw4nhgmWVshMIG9JoJDpcs8dMe+DpoS7mkCWv0bIjQJY+dPBRu2UKV
         pj7acRU5EangUBG86tJ8UdrzjHF81hNwuEBPrZWnP48rxQrgenpoS5X4oqUMr5ZEZXiT
         4j1v3khwYkukPMoxGF7xm+1NgUhGc0Lq4UWFtMkAv9Zz18VitT4qiTFNyjJll8nScdGd
         /0tKnzhnOnlWcb0LWk0n0xgsO8YgE78wEoZDeaVf/M+2I6PrO6iCCdV9mopzTghSSfWD
         dPvQibEz0iscmS1D0ImSX9x2Or05PNxGwDCfqIWYYS6GH06/MOdkQ1DUKENzPnRLB9+L
         d4Ng==
X-Gm-Message-State: AOAM532p6YF/FSUSQXnNbONrKN7V9I5UzlEsnCtE9XEkUwVI61L4jUdI
        V2BW2nX0QnRgzxI3hWsNGHjyR+S2y4fdsFd24lHdExSElXQfMw+6fjkZrwnmqdZCc0ltOzaWGG+
        cZVRqVZ1f/V9QFhUpvbFMSNquqL2V7W7mNg==
X-Received: by 2002:a17:906:2a85:b0:6ce:36bd:bcd9 with SMTP id l5-20020a1709062a8500b006ce36bdbcd9mr2932871eje.318.1645721301981;
        Thu, 24 Feb 2022 08:48:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwCzbVpybNtYpt6KzoO4sAHpNzvlPveHRcLj6nM2900NEWrFM+SUWFtXSn0OBBhOiujgnP3jQ==
X-Received: by 2002:a17:906:2a85:b0:6ce:36bd:bcd9 with SMTP id l5-20020a1709062a8500b006ce36bdbcd9mr2932857eje.318.1645721301745;
        Thu, 24 Feb 2022 08:48:21 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id i9sm1660140edc.56.2022.02.24.08.48.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Feb 2022 08:48:21 -0800 (PST)
Message-ID: <7640f9ac-88af-ace7-0bd4-990d852567dd@redhat.com>
Date:   Thu, 24 Feb 2022 17:48:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] Immutable branch with 5.17-rc1 + "pinctrl: baytrail: Add
 pinconf,group + function for the pmu_clk"
To:     Andy Shevchenko <andy@infradead.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello Intel pinctrl maintainers,

As discussed here is a pull-req for an immutable branch with 5.17-rc1 +
"pinctrl: baytrail: Add pinconf,group + function for the pmu_clk".

I'll merge this into my review-hans branch with the dependend
patches merged on top and I'll push the whole set to for-next
once the buildbots have had a chance to test things.

Regards,

Hans


The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-pinctrl-pmu_clk-1

for you to fetch changes up to 2f46d7f7e959da3ae18ed5d283935673f7a22354:

  pinctrl: baytrail: Add pinconf group + function for the pmu_clk (2022-02-24 16:44:34 +0100)

----------------------------------------------------------------
Immutable branch with 5.17-rc1 + "pinctrl: baytrail: Add pinconf
group + function for the pmu_clk"

For merging into both pdx86/for-next and pinctrl/intel/for-next.

----------------------------------------------------------------
Hans de Goede (1):
      pinctrl: baytrail: Add pinconf group + function for the pmu_clk

 drivers/pinctrl/intel/pinctrl-baytrail.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

