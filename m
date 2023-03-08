Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E25FC64EC4
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Mar 2023 14:57:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbjCHO5L (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Mar 2023 09:57:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230495AbjCHO5J (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Mar 2023 09:57:09 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 895008C95C
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Mar 2023 06:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678287383;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=/vOaxlqRdn+odbXW5oy3q9pXbqCmxAheTjAjGTcvnQk=;
        b=g0MogK459pe+hLVoY1Tb3xfcO19sn0gvNTHpDSSo1E8ubdAY9EEmj4RWzTF71+XiPWFHQ4
        /waDRbE5iM129VI4ZDexe/A+Jyriw0AiWKU4eyxTSrWk9LBUvky49bHh7KTeUauah5RR8Q
        B2w1iRoWkZwKUjVlpgmHOKAKGEagtEk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-zDSgbQu9PqqQcP-A6VqWjg-1; Wed, 08 Mar 2023 09:56:22 -0500
X-MC-Unique: zDSgbQu9PqqQcP-A6VqWjg-1
Received: by mail-ed1-f69.google.com with SMTP id dn8-20020a05640222e800b004bd35dd76a9so24422119edb.13
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Mar 2023 06:56:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678287381;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/vOaxlqRdn+odbXW5oy3q9pXbqCmxAheTjAjGTcvnQk=;
        b=WFPmvoJ5ubXw3WaxRHABVGfwBY66uiDMgOdd6t1Em/MQJB4xOWE/LD/xDUszseWpft
         ue8GtHcn6W+Cs3B12E35YMq2kziAvi0rD3qyDS1hHwl0bOcvnc8+VPlLjpaaHQ5E0K/X
         u2THSURVlI+XQorEPBWBn+uXKvyR6YRoPB70Ndxhs/PpfBnO2o8OoNXyQZXLfphtFfGs
         npXPdstK41/XZnpA9dtFOkDMcYA++2FDceqXu0fq8dgM7HpgxV90K02Ebynt+Kv2E/3f
         jcsm+gAK2W9731YkRPZBip4zNLBWGHNOuW1/VjB1tIm0dyEtZqOQQGDoI9Ry0InIQDCn
         j4qA==
X-Gm-Message-State: AO0yUKVsMp+SWD1tfle3zBIryH0OhwQkSdQ8HWqpmbvuOgMxrEdtDep6
        7FHc0Qbroqs69xJWAzRTaJqnFKiozjywojfs+SKBN1H483sg+YJQV6/qw/mdh79AVpMdiy928gp
        uxT8pz0ZZh+G2X6KARkwlmfVYVigxI4RwHA==
X-Received: by 2002:a17:907:868c:b0:8f4:1d98:af83 with SMTP id qa12-20020a170907868c00b008f41d98af83mr22729557ejc.74.1678287381443;
        Wed, 08 Mar 2023 06:56:21 -0800 (PST)
X-Google-Smtp-Source: AK7set/HQeEE03XhfoK45BPdCtFnKikYSWuVuBem2QH++7XdPiSQ3aOZxmpLPP/KnFknvx8Vc4AJ5Q==
X-Received: by 2002:a17:907:868c:b0:8f4:1d98:af83 with SMTP id qa12-20020a170907868c00b008f41d98af83mr22729537ejc.74.1678287381202;
        Wed, 08 Mar 2023 06:56:21 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id rk9-20020a170907214900b008d2d2d617ccsm7720188ejb.17.2023.03.08.06.56.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 06:56:20 -0800 (PST)
Message-ID: <7cbefa41-8c79-8280-3d87-3b0b13857aba@redhat.com>
Date:   Wed, 8 Mar 2023 15:56:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 6.3-2
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Linus,

Here is the first round of fixes for platform-drivers-x86 for 6.3.

Nothing special to report just various small fixes.

Regards,

Hans


The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.3-2

for you to fetch changes up to 1a0009abfa7893b9cfcd3884658af1cbee6b26ce:

  platform: mellanox: mlx-platform: Initialize shift variable to 0 (2023-03-07 12:08:30 +0100)

----------------------------------------------------------------
platform-drivers-x86 for v6.3-2

A small set of assorted bug and build/warning fixes for 6.3.

The following is an automated git shortlog grouped by driver:

ISST:
 -  Fix kernel documentation warnings
 -  Increase range of valid mail box commands

dell-ddv:
 -  Fix temperature scaling
 -  Fix cache invalidation on resume

int3472:
 -  Add GPIOs to Surface Go 3 Board data

platform:
 -  mellanox: mlx-platform: Initialize shift variable to 0
 -  x86: MLX_PLATFORM: select REGMAP instead of depending on it
 -  mellanox: select REGMAP instead of depending on it

platform/x86/amd:
 -  pmc: remove CONFIG_SUSPEND checks

platform/x86/intel/tpmi:
 -  Fix double free reported by Smatch

----------------------------------------------------------------
Armin Wolf (2):
      platform/x86: dell-ddv: Fix cache invalidation on resume
      platform/x86: dell-ddv: Fix temperature scaling

Arnd Bergmann (1):
      platform/x86/amd: pmc: remove CONFIG_SUSPEND checks

Daniel Scally (1):
      platform/x86: int3472: Add GPIOs to Surface Go 3 Board data

Hans de Goede (1):
      platform: mellanox: mlx-platform: Initialize shift variable to 0

Randy Dunlap (2):
      platform: mellanox: select REGMAP instead of depending on it
      platform: x86: MLX_PLATFORM: select REGMAP instead of depending on it

Srinivas Pandruvada (3):
      platform/x86: ISST: Increase range of valid mail box commands
      platform/x86/intel/tpmi: Fix double free reported by Smatch
      platform/x86: ISST: Fix kernel documentation warnings

 drivers/platform/mellanox/Kconfig                  |  9 +++----
 drivers/platform/x86/Kconfig                       |  3 ++-
 drivers/platform/x86/amd/pmc.c                     | 30 +++++++---------------
 drivers/platform/x86/dell/dell-wmi-ddv.c           | 12 ++++++---
 .../x86/intel/int3472/tps68470_board_data.c        |  5 ++--
 .../x86/intel/speed_select_if/isst_if_common.c     |  5 ++--
 .../x86/intel/speed_select_if/isst_if_common.h     |  1 +
 drivers/platform/x86/intel/tpmi.c                  | 14 +++++-----
 drivers/platform/x86/mlx-platform.c                |  2 +-
 9 files changed, 39 insertions(+), 42 deletions(-)

