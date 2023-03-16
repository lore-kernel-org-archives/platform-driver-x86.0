Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B37C6FD1F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Mar 2023 13:41:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230332AbjCPNlW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Mar 2023 09:41:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229743AbjCPNlU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Mar 2023 09:41:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF751BBB16
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 06:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678974016;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=jLI+n0GbwBQRhOd6vq4dlsCtA7e4bDldTxIW64FjbEI=;
        b=XzYCQ2AusJhykYEss9xBNslvS6IWHQlCAhsF9cAM/rM+e4lGrtejDcDS+1mwojQrs9+Q0Q
        rG03I/eF2WNxrjWEKF6ZOZl1JzZUN4Jzc3Tywa8I/ztlCSWDMcVJ4QdBjApAsxkvm6RQDR
        Tp4gpFg/3lKEZ5EwU5Xt0BBRLPSB0aI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-CEbi0eykPFq2yPbadOFelg-1; Thu, 16 Mar 2023 09:40:14 -0400
X-MC-Unique: CEbi0eykPFq2yPbadOFelg-1
Received: by mail-ed1-f70.google.com with SMTP id j21-20020a508a95000000b004fd82403c91so3111677edj.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 06:40:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678974013;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jLI+n0GbwBQRhOd6vq4dlsCtA7e4bDldTxIW64FjbEI=;
        b=RRom9e3qN94VlaqcULTy3TY+/iwwGdoCioI5fFYL+8m3OVEJASY4OQV0aedrv1YT52
         wfYp17wsPlKeCMTMVa5QC7slxQZCTUSuklX5MRHT7Y6O6Cfa4bbhgU7P0o9FhhyTug0p
         PoY4VPo5cc3P5kZyvKxNGV6JMVrIbSvetpDRoMgYBvZgSA7bAw8AcvnY7Qy/N1QyP3sS
         BkSsnYfPKVA3hnaDkuKJBv4wZLNj3B4ebOXRaY8faMFXqenNo23u4An4Ha32BVhcYm0I
         pipzPNB1M4VtvYPQw0Zv/B0bMWu23KTybjEn30EapnkJukQWX5JNzX27KcmkIs9/hKPV
         Yqkg==
X-Gm-Message-State: AO0yUKWEzn7RlUAgzqm9WlgmhGlSA2BLtLCmrfKrVien5/zSICCnn6vp
        n8r3+Hwd0auhCHz+U2PTAeTKCSknwvq1xjnPDf423XTE2A5ASbybICxie4AKlNL9KWYrOb2LiHP
        r07UuULN8s2t7eL76mqWAwZwBQQ6TMxwi2YuzlAPPeQ==
X-Received: by 2002:a17:906:b01:b0:8b1:3a23:8ec7 with SMTP id u1-20020a1709060b0100b008b13a238ec7mr9943334ejg.43.1678974013343;
        Thu, 16 Mar 2023 06:40:13 -0700 (PDT)
X-Google-Smtp-Source: AK7set9tymNTz9+387YqRSF0HfGwjk6gJq9Cx7CTWJFRUKlHqxlPPDd0aRk66kI/bxI8GFQaGPuBHw==
X-Received: by 2002:a17:906:b01:b0:8b1:3a23:8ec7 with SMTP id u1-20020a1709060b0100b008b13a238ec7mr9943316ejg.43.1678974013120;
        Thu, 16 Mar 2023 06:40:13 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id f10-20020a17090624ca00b009306ebc79d3sm796733ejb.59.2023.03.16.06.40.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 06:40:12 -0700 (PDT)
Message-ID: <5816e60c-5283-fa0c-fc95-76401904317e@redhat.com>
Date:   Thu, 16 Mar 2023 14:40:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US, nl
To:     Lee Jones <lee.jones@linaro.org>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] Immutable branch between pdx86 and backlight due for the
 v6.4 merge window
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Lee,

As requested here is a pull-request for the apple-gmux / apple-backlight changes between the pdx86 and backlight subsytems.

Regards,

Hans


The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/ib-pdx86-backlight-6.4

for you to fetch changes up to 3608a2cd818a8d97bd3d4dc32f6c0afaf09b15ec:

  backlight: apple_bl: Use acpi_video_get_backlight_type() (2023-03-16 13:33:11 +0100)

----------------------------------------------------------------
Immutable branch between pdx86 and backlight due for the v6.4 merge window

----------------------------------------------------------------
Dan Carpenter (1):
      platform/x86: apple-gmux: return -EFAULT if copy fails

Hans de Goede (2):
      platform/x86: apple-gmux: Add acpi_video_get_backlight_type() check
      backlight: apple_bl: Use acpi_video_get_backlight_type()

Orlando Chamberlain (5):
      platform/x86: apple-gmux: use first bit to check switch state
      platform/x86: apple-gmux: refactor gmux types
      platform/x86: apple-gmux: support MMIO gmux on T2 Macs
      platform/x86: apple-gmux: add debugfs interface
      platform/x86: apple-gmux: Update apple_gmux_detect documentation

 drivers/platform/x86/Kconfig       |   1 -
 drivers/platform/x86/apple-gmux.c  | 404 ++++++++++++++++++++++++++++++-------
 drivers/video/backlight/Kconfig    |   1 +
 drivers/video/backlight/apple_bl.c |  31 +--
 include/linux/apple-gmux.h         |  72 +++++--
 include/linux/apple_bl.h           |  27 ---
 6 files changed, 393 insertions(+), 143 deletions(-)
 delete mode 100644 include/linux/apple_bl.h

