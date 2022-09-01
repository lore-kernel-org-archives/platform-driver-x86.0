Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF21AECAAD3
	for <platform-driver-x86@archiver.kernel.org>; Thu,  1 Sep 2022 16:43:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233452AbiIAQnj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 1 Sep 2022 12:43:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235088AbiIAQni (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 1 Sep 2022 12:43:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F4695AA04
        for <platform-driver-x86@vger.kernel.org>; Thu,  1 Sep 2022 09:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662050616;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=PrJ4ySHIrP8ROBjoDBorg1jCunJZhbH8/S5JcvsTtFM=;
        b=Tx+MV4/wx7IstIHbuSp/n7o0pbfI+qOH0cueWtiqnUEjf5fwzDVKUWtmmAwGLaOv+X4+/z
        pKsBBbJx4L2U8o1JJqSd/yjW0Zio3l9RliHKCFUN0h0sUf4AxvHcZn83FXRpPAcZa+NiOz
        zdDLmS+nO+h1hdqUjThQGTANHm8n+kM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-480-tOc2mxrcMMWtIsJBC_1mYA-1; Thu, 01 Sep 2022 12:43:33 -0400
X-MC-Unique: tOc2mxrcMMWtIsJBC_1mYA-1
Received: by mail-ed1-f69.google.com with SMTP id z20-20020a05640235d400b0043e1e74a495so12198714edc.11
        for <platform-driver-x86@vger.kernel.org>; Thu, 01 Sep 2022 09:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date;
        bh=PrJ4ySHIrP8ROBjoDBorg1jCunJZhbH8/S5JcvsTtFM=;
        b=lgRAMFr6HE7fiO3v4DPk17rbpW7vm49e7JLEENqkutm9+Wx0rhwbDBgztyA9aLCT7d
         spnoPD0GHrlo4s1DhdG5Mk0PhTuEv8fdQcKLuxjUwrNrr93NPJgRX0KsHd4/+1siDjFe
         OqkEhiyzWNCQ1kZ8wluwqKh9qd0GJ6HktQGugq5QpvJI9hqN29t/o6RY97G1ULqtzuMq
         Qjt35GqnB5io7rjOVLZNePCV0pwzpCR/KJk2HWqOLll3r8Z6YpX6QmCU5YX6BUd+awAp
         m2fpMbUZZkHutDR4JUgHLAbB9P+sxV6BYesskaWnlBtLZirGLIXM2xvI9pfTpuUluHas
         NWEQ==
X-Gm-Message-State: ACgBeo1jqNK3LXBbaeiq5N2YgT0JowP9dJX52nWagc2+me8IyrbQc7Ue
        1FybnPb8bPWI88sUiaUIv33405PiI8GK8KxodenTBct3eMStgP//CAnDnJf53xR023fNsz9NbDj
        KPBIHdYhjDR/FVtrUgJH0hZH9SB//rkyN9Q==
X-Received: by 2002:a17:907:7678:b0:730:e1ad:b128 with SMTP id kk24-20020a170907767800b00730e1adb128mr25179596ejc.67.1662050612026;
        Thu, 01 Sep 2022 09:43:32 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5NrGqkbyyZ0fwizjhE35YmoDlfDgv524Gsk/uveADS0YNnu8WYkhS9FzPvX7l7wwMqul5mtQ==
X-Received: by 2002:a17:907:7678:b0:730:e1ad:b128 with SMTP id kk24-20020a170907767800b00730e1adb128mr25179578ejc.67.1662050611763;
        Thu, 01 Sep 2022 09:43:31 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id h10-20020a0564020e8a00b004478be33bddsm1583098eda.15.2022.09.01.09.43.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 09:43:31 -0700 (PDT)
Message-ID: <3766fb4c-d7fa-564c-abeb-c746cdf12526@redhat.com>
Date:   Thu, 1 Sep 2022 18:43:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 6.0-2
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Linus,

Here is the first round of fixes for platform-drivers-x86 for 6.0,
nothing special to report just various small fixes and hardware-id
additions.

Regards,

Hans


The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.0-2

for you to fetch changes up to 647e82dbf85124697be59a4b4cf00c0d38177dcb:

  platform/x86: p2sb: Fix UAF when caller uses resource name (2022-09-01 17:51:34 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v6.0-2

Various small fixes and hardware-id additions.

The following is an automated git shortlog grouped by driver:

acer-wmi:
 -  Acer Aspire One AOD270/Packard Bell Dot keymap fixes

asus-wmi:
 -  Increase FAN_CURVE_BUF_LEN to 32
 -  Fix the name of the mic-mute LED classdev

p2sb:
 -  Fix UAF when caller uses resource name

platform/mellanox:
 -  Remove redundant 'NULL' check
 -  Remove unnecessary code
 -  mlxreg-lc: Fix locking issue
 -  mlxreg-lc: Fix coverity warning

platform/surface:
 -  aggregator_registry: Add HID devices for sensors and UCSI client to SP8
 -  aggregator_registry: Rename HID device nodes based on new findings
 -  aggregator_registry: Rename HID device nodes based on their function
 -  aggregator_registry: Add support for Surface Laptop Go 2

pmc_atom:
 -  Fix SLP_TYPx bitfield mask

thinkpad_acpi:
 -  Explicitly set to balanced mode on startup

x86-android-tablets:
 -  Fix broken touchscreen on Chuwi Hi8 with Windows BIOS

----------------------------------------------------------------
Andy Shevchenko (2):
      platform/x86: pmc_atom: Fix SLP_TYPx bitfield mask
      platform/x86: p2sb: Fix UAF when caller uses resource name

Hans de Goede (2):
      platform/x86: x86-android-tablets: Fix broken touchscreen on Chuwi Hi8 with Windows BIOS
      platform/x86: acer-wmi: Acer Aspire One AOD270/Packard Bell Dot keymap fixes

Luke D. Jones (1):
      platform/x86: asus-wmi: Increase FAN_CURVE_BUF_LEN to 32

Mario Limonciello (1):
      platform/x86: thinkpad_acpi: Explicitly set to balanced mode on startup

Maximilian Luz (4):
      platform/surface: aggregator_registry: Add support for Surface Laptop Go 2
      platform/surface: aggregator_registry: Rename HID device nodes based on their function
      platform/surface: aggregator_registry: Rename HID device nodes based on new findings
      platform/surface: aggregator_registry: Add HID devices for sensors and UCSI client to SP8

PaddyKP_Yao (1):
      platform/x86: asus-wmi: Fix the name of the mic-mute LED classdev

Vadim Pasternak (4):
      platform/mellanox: mlxreg-lc: Fix coverity warning
      platform/mellanox: mlxreg-lc: Fix locking issue
      platform/mellanox: Remove unnecessary code
      platform/mellanox: Remove redundant 'NULL' check

 drivers/platform/mellanox/mlxreg-lc.c              | 53 +++++++++++++---------
 .../platform/surface/surface_aggregator_registry.c | 47 ++++++++++---------
 drivers/platform/x86/acer-wmi.c                    |  9 +++-
 drivers/platform/x86/asus-wmi.c                    | 11 ++---
 drivers/platform/x86/p2sb.c                        | 18 +++++++-
 drivers/platform/x86/pmc_atom.c                    |  2 +-
 drivers/platform/x86/thinkpad_acpi.c               |  7 ++-
 drivers/platform/x86/x86-android-tablets.c         | 14 ++++++
 include/linux/platform_data/x86/pmc_atom.h         |  6 ++-
 9 files changed, 108 insertions(+), 59 deletions(-)

