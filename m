Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A99D0C54E94
	for <platform-driver-x86@archiver.kernel.org>; Thu, 26 Jan 2023 14:01:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231862AbjAZOBj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 26 Jan 2023 09:01:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231783AbjAZOBM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 26 Jan 2023 09:01:12 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75C956D5E0
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Jan 2023 06:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674741603;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=golVTvyAYMyqQTXL0A4vzvXwefTm1YQbAQTKoQROxVQ=;
        b=FD5gKYrDYlhzuVzb7ZUHAiZukVkqJX6mIk9RjJGJaob4ChttE2KrIQwmNDy3J/3fyYIUzU
        afmYGrHZqqUQ873br5n1kUy8y/qNaReJ1O8oXLIMf0nP3B4VoUYcCeywuHEuZW86xJME+2
        SBFH5SCrLxFUKGOh637PMoNfigLiNyU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-589-ko_QR4HVOb-HXdMbIPxOaQ-1; Thu, 26 Jan 2023 09:00:02 -0500
X-MC-Unique: ko_QR4HVOb-HXdMbIPxOaQ-1
Received: by mail-ej1-f69.google.com with SMTP id nc27-20020a1709071c1b00b0086dae705676so1315764ejc.12
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Jan 2023 06:00:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=golVTvyAYMyqQTXL0A4vzvXwefTm1YQbAQTKoQROxVQ=;
        b=2B+y6qHKC/nAcqAqKdTQFlHbt5tWR72K5BgaS/OmutvOQH9eLHtfhjbZibrhEPw+N6
         Kiv/n0QP/eePU0/xwVHIZ85kH4JvTpVk0VbrOucvYLWDMUkkie/w2fA1ptG1PEt0PFX5
         UNcNfcmbj7pV4o+ZqNAnJ37rpEn4YSNbSahMVFCF4quQPZQnTw/lRZCYo/FN7Sz1yhIo
         rByM4VPeg3KULCj8EvZjpjZfm0930m5kMlieiyLfHRuM6vNjfwfVmdP84S9YFwevsIXx
         F2QndXN6y6wKFXiK1bh/fFZR+LkzTkObxgl25jA6peL5bcRwpO3H27n41LmQIQ/OQgMi
         6Bjg==
X-Gm-Message-State: AO0yUKXSHjDr8zrUMD2hdb/VFo5y7Uoq+uI2BDz4QfWSGvv2flPHKxdi
        CriM7G3gtEaBDuqcdQP2rA/hiZDy1naW3JsYA7Y802C34BX9QHcMt3JXUytDAfiUNkA9T+Zg3cX
        fT2G93R6hQ9c9FhUZfYsa4ZtfiF5cpDHg/w==
X-Received: by 2002:a17:906:1290:b0:878:5da4:77a6 with SMTP id k16-20020a170906129000b008785da477a6mr2841362ejb.51.1674741601545;
        Thu, 26 Jan 2023 06:00:01 -0800 (PST)
X-Google-Smtp-Source: AK7set9i+i8oVPbwI2m3EAe737D5eqSwY72umpiASPA9QOU/tRuFqjGkSd6v7xXqSk4NzbP4w8Gzcw==
X-Received: by 2002:a17:906:1290:b0:878:5da4:77a6 with SMTP id k16-20020a170906129000b008785da477a6mr2841347ejb.51.1674741601326;
        Thu, 26 Jan 2023 06:00:01 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id h17-20020a1709066d9100b0087856bd9dbbsm642242ejt.97.2023.01.26.06.00.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 06:00:00 -0800 (PST)
Message-ID: <4d44b351-d4bf-56dd-952b-97a70687fb68@redhat.com>
Date:   Thu, 26 Jan 2023 14:59:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 6.2-3
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Linus,

Here is the second round of fixes for platform-drivers-x86 for 6.2.

Highlights:
 -  Fix false positive apple_gmux backlight detection on older
    iGPU only MacBook models
 -  Various other small fixes and hardware-id additions

The MacBook backlight fix includes a small change under drivers/acpi,
this has been Acked by Rafael for merging through the pdx86 tree.

Regards,

Hans


The following changes since commit 2241ab53cbb5cdb08a6b2d4688feb13971058f65:

  Linux 6.2-rc5 (2023-01-21 16:27:01 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.2-3

for you to fetch changes up to 1bc5d819f0b9784043ea08570e1b21107aa35739:

  platform/x86: thinkpad_acpi: Fix profile modes on Intel platforms (2023-01-25 12:45:16 +0100)

----------------------------------------------------------------
platform-drivers-x86 for v6.2-3

Highlights:
 -  Fix false positive apple_gmux backlight detection on older
    iGPU only MacBook models
 -  Various other small fixes and hardware-id additions

The following is an automated git shortlog grouped by driver:

ACPI:
 -  video: Fix apple gmux detection

apple-gmux:
 -  Add apple_gmux_detect() helper
 -  Move port defines to apple-gmux.h

asus-wmi:
 -  Fix kbd_dock_devid tablet-switch reporting

dell-wmi:
 -  Add a keymap for KEY_MUTE in type 0x0010 table

gigabyte-wmi:
 -  add support for B450M DS3H WIFI-CF

hp-wmi:
 -  Fix cast to smaller integer type warning
 -  Handle Omen Key event

platform/x86/amd:
 -  pmc: Add a module parameter to disable workarounds
 -  pmc: Disable IRQ1 wakeup for RN/CZN

thinkpad_acpi:
 -  Fix profile modes on Intel platforms

----------------------------------------------------------------
Hans de Goede (5):
      platform/x86: asus-wmi: Fix kbd_dock_devid tablet-switch reporting
      platform/x86: hp-wmi: Fix cast to smaller integer type warning
      platform/x86: apple-gmux: Move port defines to apple-gmux.h
      platform/x86: apple-gmux: Add apple_gmux_detect() helper
      ACPI: video: Fix apple gmux detection

Kevin Kuriakose (1):
      platform/x86: gigabyte-wmi: add support for B450M DS3H WIFI-CF

Koba Ko (1):
      platform/x86: dell-wmi: Add a keymap for KEY_MUTE in type 0x0010 table

Mario Limonciello (2):
      platform/x86/amd: pmc: Disable IRQ1 wakeup for RN/CZN
      platform/x86/amd: pmc: Add a module parameter to disable workarounds

Mark Pearson (1):
      platform/x86: thinkpad_acpi: Fix profile modes on Intel platforms

Rishit Bansal (1):
      platform/x86: hp-wmi: Handle Omen Key event

 drivers/acpi/video_detect.c               |  24 +------
 drivers/platform/x86/amd/pmc.c            |  58 +++++++++++++++-
 drivers/platform/x86/apple-gmux.c         |  93 +++++--------------------
 drivers/platform/x86/asus-wmi.c           |  17 +++--
 drivers/platform/x86/dell/dell-wmi-base.c |   3 +
 drivers/platform/x86/gigabyte-wmi.c       |   1 +
 drivers/platform/x86/hp/hp-wmi.c          |   6 +-
 drivers/platform/x86/thinkpad_acpi.c      |  11 +--
 include/linux/apple-gmux.h                | 109 +++++++++++++++++++++++++++++-
 9 files changed, 211 insertions(+), 111 deletions(-)

