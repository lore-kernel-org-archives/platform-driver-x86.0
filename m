Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAB0AC433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 29 Jun 2022 11:01:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231613AbiF2LBt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 29 Jun 2022 07:01:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbiF2LBs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 29 Jun 2022 07:01:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 36F4E3E5D6
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jun 2022 04:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656500506;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=JncY8iU7qudh/q/NGqxm2tsN+EiGstzfMOsDe7WvCvo=;
        b=dV/PuEQDGMqDNseSQuRy8UUIISBJu013yQm28Ot62JfjvkSIaonHBadCfHqMOiaeAxQSWI
        QggWKwyW7F/WzwmophR6x/UcogxlGhit8w9HMtuj2fqMrGvH2e6Cyiuok0LGUIGBw1DgqV
        TkgN9+mEFhmuNa1Wr0mDLUToaqxWVns=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-379-PaDXSpxRP5Cr0iESJfUneA-1; Wed, 29 Jun 2022 07:01:45 -0400
X-MC-Unique: PaDXSpxRP5Cr0iESJfUneA-1
Received: by mail-ed1-f71.google.com with SMTP id c20-20020a05640227d400b004369cf00c6bso11625267ede.22
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jun 2022 04:01:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:cc:content-language:content-transfer-encoding;
        bh=JncY8iU7qudh/q/NGqxm2tsN+EiGstzfMOsDe7WvCvo=;
        b=RRB+3mHd1bH3vG7aO2f33HTmeIxuaYjOkuo713brhJnOJDRc/3pIcLNRTSIXgkBamO
         qiqhSuoKRzpQ8YoFls7KdCheBqCJy+w6ckdk1rENRAe5A5oFhkhUvV3UU4obaJX1fcN7
         l8VAoG0CfCVKH6QgZi8E6BiweSahyLev7gUKcGBwZ73iM4JL1WlBDyTzKJjmFMbc7JNV
         1pIoJS1q+YFxH++86JOw3xUn8fA7nvHe6FcnNzBGc7sVS2sb1WerQHd5jsdeTYznZOBy
         oX3qOYqdj1fHj6/EHFtmqlJ4eOpjVmxNMpl/PhbQwOPTr5rPzCbSzWU2O17Wx/LimDbO
         fwUQ==
X-Gm-Message-State: AJIora9pM/QimhJkDV9DGhwNpO6VM+asnN6CNIAhAAbiiksjMl81BEd4
        vicFHKqCHK628GGoYR/Fnx4QGbQK1xgfn6sF7AwObkwoPaM4Vka+qXCTu9AEnjwjk5ThurC/sVC
        7eUBhumAfJreMlpkTVa83+EcATENa7gatOw==
X-Received: by 2002:a17:906:c14f:b0:726:a609:a369 with SMTP id dp15-20020a170906c14f00b00726a609a369mr2760534ejc.326.1656500503963;
        Wed, 29 Jun 2022 04:01:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s8eOy+oPXUz1mVczyDKrGkwCyqsPLS5yJ4CQZghPK7i176EkxCQZyOelDL60BAfwGWPhi1yw==
X-Received: by 2002:a17:906:c14f:b0:726:a609:a369 with SMTP id dp15-20020a170906c14f00b00726a609a369mr2760512ejc.326.1656500503782;
        Wed, 29 Jun 2022 04:01:43 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id m9-20020a509989000000b004355d27799fsm11331281edb.96.2022.06.29.04.01.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 04:01:43 -0700 (PDT)
Message-ID: <42646771-d1ea-0b05-7cb8-233d6e42ac1d@redhat.com>
Date:   Wed, 29 Jun 2022 13:01:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 5.19-3
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Linus,

Here is the second round of fixes for platform-drivers-x86 for 5.19:

 -  thinkpad_acpi/ideapad-laptop: mem-leak and platform-profile fixes
 -  panasonic-laptop: missing hotkey presses regression fix
 -  some hardware-id additions
 -  some other small fixes

This includes a small fix to the acpi_video_handles_brightness_key_presses()
ACPI helper function, this has been acked by Rafael for merging through
the pdx86 tree.

Regards,

Hans


The following changes since commit d4fe9cc4ff8656704b58cfd9363d7c3c9d65e519:

  platform/x86/intel: hid: Add Surface Go to VGBS allow list (2022-06-12 14:41:17 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v5.19-3

for you to fetch changes up to 9ab762a84b8094540c18a170e5ddd6488632c456:

  platform/x86: hp-wmi: Ignore Sanitization Mode event (2022-06-28 22:20:07 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v5.19-3

Highlights:
 -  thinkpad_acpi/ideapad-laptop: mem-leak and platform-profile fixes
 -  panasonic-laptop: missing hotkey presses regression fix
 -  some hardware-id additions
 -  some other small fixes

The following is an automated git shortlog grouped by driver:

ACPI:
 -  video: Change how we determine if brightness key-presses are handled

hp-wmi:
 -  Ignore Sanitization Mode event

ideapad-laptop:
 -  Add Ideapad 5 15ITL05 to ideapad_dytc_v4_allow_table[]
 -  Add allow_v4_dytc module parameter

intel/pmc:
 -  Add Alder Lake N support to PMC core driver

panasonic-laptop:
 -  filter out duplicate volume up/down/mute keypresses
 -  don't report duplicate brightness key-presses
 -  revert "Resolve hotkey double trigger bug"
 -  sort includes alphabetically
 -  de-obfuscate button codes

platform/mellanox:
 -  nvsw-sn2201: fix error code in nvsw_sn2201_create_static_devices()

thinkpad_acpi:
 -  profile capabilities as integer
 -  do not use PSC mode on Intel platforms
 -  Fix a memory leak of EFCH MMIO resource

----------------------------------------------------------------
Dan Carpenter (1):
      platform/mellanox: nvsw-sn2201: fix error code in nvsw_sn2201_create_static_devices()

Gayatri Kammela (1):
      platform/x86: intel/pmc: Add Alder Lake N support to PMC core driver

Hans de Goede (7):
      platform/x86: ideapad-laptop: Add allow_v4_dytc module parameter
      platform/x86: ideapad-laptop: Add Ideapad 5 15ITL05 to ideapad_dytc_v4_allow_table[]
      ACPI: video: Change how we determine if brightness key-presses are handled
      platform/x86: panasonic-laptop: sort includes alphabetically
      platform/x86: panasonic-laptop: revert "Resolve hotkey double trigger bug"
      platform/x86: panasonic-laptop: don't report duplicate brightness key-presses
      platform/x86: panasonic-laptop: filter out duplicate volume up/down/mute keypresses

Jean Delvare (1):
      platform/x86: thinkpad_acpi: Fix a memory leak of EFCH MMIO resource

Kai-Heng Feng (1):
      platform/x86: hp-wmi: Ignore Sanitization Mode event

Mark Pearson (2):
      platform/x86: thinkpad-acpi: profile capabilities as integer
      platform/x86: thinkpad_acpi: do not use PSC mode on Intel platforms

Stefan Seyfried (1):
      platform/x86: panasonic-laptop: de-obfuscate button codes

 drivers/acpi/acpi_video.c               | 13 +++--
 drivers/platform/mellanox/nvsw-sn2201.c |  4 +-
 drivers/platform/x86/Kconfig            |  2 +
 drivers/platform/x86/hp-wmi.c           |  3 ++
 drivers/platform/x86/ideapad-laptop.c   | 29 ++++++++----
 drivers/platform/x86/intel/pmc/core.c   |  1 +
 drivers/platform/x86/panasonic-laptop.c | 84 ++++++++++++++++++++++++++-------
 drivers/platform/x86/thinkpad_acpi.c    | 51 ++++++++++----------
 8 files changed, 127 insertions(+), 60 deletions(-)

