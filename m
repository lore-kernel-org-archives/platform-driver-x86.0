Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F128BC77B73
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Jun 2023 08:42:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237181AbjFFImV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 6 Jun 2023 04:42:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235151AbjFFImU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 6 Jun 2023 04:42:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60499F7
        for <platform-driver-x86@vger.kernel.org>; Tue,  6 Jun 2023 01:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686040893;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=6tQ35W6HLuuEXQ1QV6ZcMIzGfWPz5E/TpOyat14Si5U=;
        b=K2VAOpmn0TwX0glJI7Kvp/j5X44kR5hyYO/ZiiY3+x7t8AkcBjfiNkSiaWtlfroQQB3qZi
        s+qMpHpG3sDSlOYkWlVIwcc4h1iKLFZkTyIXDzbhwQPg/FNA+T8Me/+PMFcI6FL/X6bc+N
        CIzQGESeiQGUUh9/e+2lwcIqYb0kUE4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-uIakjXDZPXSrB1sLASRkyg-1; Tue, 06 Jun 2023 04:41:32 -0400
X-MC-Unique: uIakjXDZPXSrB1sLASRkyg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-97455ea1c14so361201066b.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 06 Jun 2023 01:41:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686040891; x=1688632891;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6tQ35W6HLuuEXQ1QV6ZcMIzGfWPz5E/TpOyat14Si5U=;
        b=TYu2/NdnG4nFxuil9P7fHNjxXoezHRODw7gn7i0ormxyL5M7wAlFUnhe8UEYAkaW+j
         PPrjyf+gnEs8dlRl9VdRoPY36FfY1rQyISeb0N1PjhUvoJ0oRo3wvrTO4nyXcE5tZ/mW
         Xp/+mJoJgUGTDTVjn1J03iFuT6IZ++CEz172bhtZs+C6nDzakj3/kYhgfCZK9tgVkCRN
         h5Fd85ZABhNFH1A282D0DE4/iTnScHOV1nswhDZwo+KPfOM2e++HywXvEq22pUNsGnkw
         GM1RaGwJf7Uy190i3Q89F2kI4WAhwlQLkKkHATh4Sno3+PSqN9l0pN0aDMnqzzPakWC5
         sTwg==
X-Gm-Message-State: AC+VfDxS+ILEaJXgLU0bX0L0LrL6EfeAKUo78dmiZgoSX9xUtGdzbRfq
        x0ZnVDnUVPZ0bb8V5XsFAK7sKAyqEXUYMvA/tMtiKXsMxMK1t/ytqYZe2NiFel+gN+Ja++Bpb4h
        LBL+sJgoV0lR5yRockM5gynE8syyc9rUkqw==
X-Received: by 2002:a17:907:1606:b0:973:91f7:508a with SMTP id hb6-20020a170907160600b0097391f7508amr1637456ejc.4.1686040891273;
        Tue, 06 Jun 2023 01:41:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7eCTct8SXbWejRailHG0JSybcAu8U+jNTSaBUfomCUtGKIuBuzxz87cs44KUPwS3wT5KC4vg==
X-Received: by 2002:a17:907:1606:b0:973:91f7:508a with SMTP id hb6-20020a170907160600b0097391f7508amr1637447ejc.4.1686040890960;
        Tue, 06 Jun 2023 01:41:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id qc16-20020a170906d8b000b00965d294e633sm5278626ejb.58.2023.06.06.01.41.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 01:41:30 -0700 (PDT)
Message-ID: <0614c271-1786-c032-a888-26c9f9ae5a70@redhat.com>
Date:   Tue, 6 Jun 2023 10:41:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 6.4-3
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Linus,

Here is the third round of fixes for platform-drivers-x86 for 6.4.

Nothing special to report just a few small fixes:

 -  Various Microsoft Surface support fixes
 -  1 fix for the INT3472 driver

Regards,

Hans


The following changes since commit 3279decb2c3c8d58cb0b70ed5235c480735a36ee:

  platform/x86/intel/ifs: Annotate work queue on stack so object debug does not complain (2023-05-23 12:55:16 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.4-4

for you to fetch changes up to fb109fba728407fa4a84d659b5cb87cd8399d7b3:

  platform/x86: int3472: Avoid crash in unregistering regulator gpio (2023-05-30 12:10:22 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v6.4-4

Highlights:
 -  Various Microsoft Surface support fixes
 -  1 fix for the INT3472 driver

The following is an automated git shortlog grouped by driver:

int3472:
 -  Avoid crash in unregistering regulator gpio

platform/surface:
 -  aggregator_tabletsw: Add support for book mode in POS subsystem
 -  aggregator_tabletsw: Add support for book mode in KIP subsystem
 -  aggregator: Allow completion work-items to be executed in parallel
 -  aggregator: Make to_ssam_device_driver() respect constness

----------------------------------------------------------------
Hao Yao (1):
      platform/x86: int3472: Avoid crash in unregistering regulator gpio

Maximilian Luz (4):
      platform/surface: aggregator: Make to_ssam_device_driver() respect constness
      platform/surface: aggregator: Allow completion work-items to be executed in parallel
      platform/surface: aggregator_tabletsw: Add support for book mode in KIP subsystem
      platform/surface: aggregator_tabletsw: Add support for book mode in POS subsystem

 drivers/platform/surface/aggregator/controller.c       |  2 +-
 drivers/platform/surface/surface_aggregator_tabletsw.c | 10 ++++++++++
 drivers/platform/x86/intel/int3472/clk_and_regulator.c | 13 ++++++++-----
 include/linux/surface_aggregator/device.h              |  6 +-----
 4 files changed, 20 insertions(+), 11 deletions(-)

