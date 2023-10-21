Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DF3FC001E0
	for <platform-driver-x86@archiver.kernel.org>; Sat, 21 Oct 2023 09:39:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbjJUJjj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 21 Oct 2023 05:39:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjJUJji (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 21 Oct 2023 05:39:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A31513E
        for <platform-driver-x86@vger.kernel.org>; Sat, 21 Oct 2023 02:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697881135;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=TRE7vQcpC4wu7sntT/DBAdIhOafIt83BirCV8+0Y0dY=;
        b=DR1PTvi8xYmtLlSpYEIjQqWLTwpds6FVFL/IsclxzE//4Y+IF9rDnlzqGkalCLWE4hVdXX
        4WRej7mXn7F/xkWe8pV61kIF0sT+Aqry+hTFdwGgOZIM6bf1/9+uEXqGlWToGOxbRbs4IH
        bA8g1WaGKrclXLbCEaeTir0VKK5c1xI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-750zC9IePjy9PFo92O6Isg-1; Sat, 21 Oct 2023 05:38:46 -0400
X-MC-Unique: 750zC9IePjy9PFo92O6Isg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9ae57d8b502so103742166b.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 21 Oct 2023 02:38:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697881125; x=1698485925;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TRE7vQcpC4wu7sntT/DBAdIhOafIt83BirCV8+0Y0dY=;
        b=RX3HN8dJO8vq0wDsMEszwLry/bqmwmq/M0JNT+s8HgqznsI6+qVOrmAa4mJwR5FSH2
         BJfmnhFuYFqs73VavnuF1zETvNmELYTyK9Vsqnl9hyFyadLVCBNRu8NnvYKgSX6QHl3s
         Y1h5xiTZqUBuN1JNr8LLAA81NAKDjNPmBntYaeVG/9zxHZ5a70EwW69HxoEqhFwpz92V
         COV1Zi0vYTIlmVIpD4PvtyOwx0f7y3xkgPBJhlWTWDBjra2gSGdCf9GwZXe+8q0wOoKM
         HVdSHPhEvqFT5uIIrio+euCx6z8Onts4Sa/74tbq5tJerCzPqnIkBGs8Iz+yw6uJRM4N
         z1BA==
X-Gm-Message-State: AOJu0YwoeDndkItx3DZ84bNwUM5NoGGW47euKwjjxxiH6DPwS3apLoS8
        hyCT0k/Uu0JdtSoNEE69d1jpwhofWiRUYOFykoUJrJS1kg2RrifbfgsNVSljsFEFWRVd1pDZQ2Q
        XK85/Z7Ta6xx7g9pwAubPY9qg8TgVgG/gqA==
X-Received: by 2002:a17:907:9282:b0:9ae:5120:5147 with SMTP id bw2-20020a170907928200b009ae51205147mr2967619ejc.38.1697881124854;
        Sat, 21 Oct 2023 02:38:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSifaMLiCDs//Z1pk8gGhUAjgwiZoCbi984YPlGrPkgKj4aoVZLST7+hJq8Vjbz6FRfTTAug==
X-Received: by 2002:a17:907:9282:b0:9ae:5120:5147 with SMTP id bw2-20020a170907928200b009ae51205147mr2967611ejc.38.1697881124570;
        Sat, 21 Oct 2023 02:38:44 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id xa17-20020a170907b9d100b009b913aa7cdasm3271539ejc.92.2023.10.21.02.38.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Oct 2023 02:38:43 -0700 (PDT)
Message-ID: <bc630929-8352-5548-07ec-1de7ccc150e8@redhat.com>
Date:   Sat, 21 Oct 2023 11:38:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 6.6-5
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Armin Wolf <W_Armin@gmx.de>
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Linus,

Here is one last pull-request for 6.6, highlights:
 -  Fix spurious brightness down presses on newer Asus laptop models
 -  Fix backlight control not working on T2 Mac Pro all-in-ones
 -  Add Armin Wolf as new maintainer for the WMI bus driver and
    change its status from orphaned to maintained
 -  A few other small fixes

Regards,

Hans


The following changes since commit 5b44abbc39ca15df80d0da4756078c98c831090f:

  platform/x86: hp-wmi:: Mark driver struct with __refdata to prevent section mismatch warning (2023-10-06 15:09:40 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.6-5

for you to fetch changes up to 99c09c985e5973c8f0ad976ebae069548dd86f12:

  platform/mellanox: mlxbf-tmfifo: Fix a warning message (2023-10-18 15:38:09 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v6.6-5

Highlights:
 -  Fix spurious brightness down presses on newer Asus laptop models
 -  Fix backlight control not working on T2 Mac Pro all-in-ones
 -  Add Armin Wolf as new maintainer for the WMI bus driver and
    change its status from orphaned to maintained
 -  A few other small fixes

The following is an automated git shortlog grouped by driver:

Merge tag 'platform-drivers-x86-mellanox-init-v6.6' into fixes:
 -  Merge tag 'platform-drivers-x86-mellanox-init-v6.6' into fixes

apple-gmux:
 -  Hard Code max brightness for MMIO gmux

asus-wmi:
 -  Map 0x2a code, Ignore 0x2b and 0x2c events
 -  Only map brightness codes when using asus-wmi backlight control
 -  Change ASUS_WMI_BRN_DOWN code from 0x20 to 0x2e

intel-uncore-freq:
 -  Conditionally create attribute for read frequency

msi-ec:
 -  Fix the 3rd config

platform:
 -  mellanox: Fix a resource leak in an error handling path in probing flow

platform/mellanox:
 -  mlxbf-tmfifo: Fix a warning message

platform/surface:
 -  platform_profile: Propagate error if profile registration fails

wmi:
 -  Update MAINTAINERS entry

----------------------------------------------------------------
Armin Wolf (2):
      platform/x86: wmi: Update MAINTAINERS entry
      platform/surface: platform_profile: Propagate error if profile registration fails

Hans de Goede (4):
      Merge tag 'platform-drivers-x86-mellanox-init-v6.6' into fixes
      platform/x86: asus-wmi: Change ASUS_WMI_BRN_DOWN code from 0x20 to 0x2e
      platform/x86: asus-wmi: Only map brightness codes when using asus-wmi backlight control
      platform/x86: asus-wmi: Map 0x2a code, Ignore 0x2b and 0x2c events

Liming Sun (1):
      platform/mellanox: mlxbf-tmfifo: Fix a warning message

Nikita Kravets (1):
      platform/x86: msi-ec: Fix the 3rd config

Orlando Chamberlain (1):
      apple-gmux: Hard Code max brightness for MMIO gmux

Srinivas Pandruvada (1):
      platform/x86: intel-uncore-freq: Conditionally create attribute for read frequency

Vadim Pasternak (1):
      platform: mellanox: Fix a resource leak in an error handling path in probing flow

 MAINTAINERS                                         |  3 ++-
 drivers/platform/mellanox/mlxbf-tmfifo.c            | 21 +++++++++++----------
 drivers/platform/surface/surface_platform_profile.c |  3 +--
 drivers/platform/x86/apple-gmux.c                   | 14 +++++++++++++-
 drivers/platform/x86/asus-nb-wmi.c                  |  3 +++
 drivers/platform/x86/asus-wmi.c                     | 15 ++++-----------
 drivers/platform/x86/asus-wmi.h                     |  2 +-
 .../uncore-frequency/uncore-frequency-common.c      |  8 ++++++--
 drivers/platform/x86/mlx-platform.c                 |  5 +++--
 drivers/platform/x86/msi-ec.c                       |  3 +--
 10 files changed, 45 insertions(+), 32 deletions(-)

