Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1CF0C4338F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Jul 2021 10:34:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA9FD60EB2
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Jul 2021 10:34:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236007AbhG1Kef (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Jul 2021 06:34:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41970 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235986AbhG1Kee (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Jul 2021 06:34:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1627468472;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=WqbYlFVczMjefGq/E8hjUCD6IN/H9aL+LJX308Bbaeg=;
        b=R+0KIYVs6f6dz93RygEojWRGvZHS1GU1G6Lc4xjcsxVkgjZih89DXzdk1ipDxe+oCBH/vS
        ihuhSLcmFXKVe4h6I6zpbM6uiNTOsNJIwdqqRqPmVX2LLlhPeGCZL4304Ls0CjhILWpdCa
        UKtV+G+JG69yf8FqEe8tB1WCspQ2/nE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-rAQVIhqpO9iKrRMl3fSslw-1; Wed, 28 Jul 2021 06:34:31 -0400
X-MC-Unique: rAQVIhqpO9iKrRMl3fSslw-1
Received: by mail-ed1-f71.google.com with SMTP id l10-20020aa7caca0000b02903b874f26036so1011378edt.20
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Jul 2021 03:34:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=WqbYlFVczMjefGq/E8hjUCD6IN/H9aL+LJX308Bbaeg=;
        b=Yt2aw9ikBRxNDpdkxnIlMisFKUA3twOn5x361FXIJa8Sid8Xo/RZQ5Z43KPy4JaSeC
         a/NrkcimmP2Mdw6L52La+whgSnOAQZAf0nP1J2/gMQUxRukJcfR0fH0Kokigw4BF69vQ
         4aXBZuObG+cJZJ6Zt4apa4NxDJVbdT0DLseujEUAOv0uEV+zrVtpFlSHVvioguc+Rhc0
         jHIiicCT0RJlrfOCaWDMzwOI2agZ1jEvOckCwimXnZZvhwzUYP1P56eR4uXEV0ABNB7L
         tcK0HvzS+Ls4X3x6epfo5ZR7ygYUMUqT5ZkiAu0kSEErV/KpdxaR9giaDh2lltslNfQ9
         X68g==
X-Gm-Message-State: AOAM531bDwuHA9viUQ46kHkXJhGgi6MeQtD0OgP2lJgHCjJbBJ/JLxAy
        R0GCM/FxX7e8v7vscqSlWw7nNotKlxjx1cJP27YM38Ch8Oo3lvnuzLoZDIOqKF9Z41SS6WGMoC6
        7kgND9EBii4CeoJaGRG5EHGJkbojkhKeEP96GERy6jyivNj2tHZj2ztRl//N83SYaK9ajZWDbQn
        tsGFI/e3Tz4g==
X-Received: by 2002:a17:906:3006:: with SMTP id 6mr27197630ejz.73.1627468469786;
        Wed, 28 Jul 2021 03:34:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7JwMzC99Ym6dFiISGnF85kJMEhce47Kwas0P1ncLLr2Or9f+7pd5G3HAGd/vW91ItZkzukg==
X-Received: by 2002:a17:906:3006:: with SMTP id 6mr27197610ejz.73.1627468469567;
        Wed, 28 Jul 2021 03:34:29 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id f12sm1883953ejz.99.2021.07.28.03.34.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jul 2021 03:34:29 -0700 (PDT)
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 5.14-2
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org
Message-ID: <093f84b2-d058-40f1-e888-1cafe1846b12@redhat.com>
Date:   Wed, 28 Jul 2021 12:34:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Linus,

Here is a set of bug-fixes and new hardware-ids for platform-drivers-x86 for 5.14.

Regards,

Hans


The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v5.14-2

for you to fetch changes up to 2b2c66f607d00d17f879c0d946d44340bfbdc501:

  platform/x86: gigabyte-wmi: add support for B550 Aorus Elite V2 (2021-07-28 12:05:33 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v5.14-2

Highlights:
-amd-pmc fixes
-think-lmi fixes
-Various new hardware-ids

The following is an automated git shortlog grouped by driver:

amd-pmc:
 -  Fix undefined reference to __udivdi3
 -  Fix missing unlock on error in amd_pmc_send_cmd()
 -  Use return code on suspend
 -  Add new acpi id for future PMC controllers
 -  Add support for ACPI ID AMDI0006
 -  Add support for logging s0ix counters
 -  Add support for logging SMU metrics
 -  call dump registers only once
 -  Fix SMU firmware reporting mechanism
 -  Fix command completion code

gigabyte-wmi:
 -  add support for B550 Aorus Elite V2

intel-hid:
 -  add Alder Lake ACPI device ID

think-lmi:
 -  Fix possible mem-leaks on tlmi_analyze() error-exit
 -  Split kobject_init() and kobject_add() calls
 -  Move pending_reboot_attr to the attributes sysfs dir
 -  Add pending_reboot support

wireless-hotkey:
 -  remove hardcoded "hp" from the error message

----------------------------------------------------------------
Alex Hung (1):
      platform/x86: wireless-hotkey: remove hardcoded "hp" from the error message

Hans de Goede (2):
      platform/x86: think-lmi: Split kobject_init() and kobject_add() calls
      platform/x86: think-lmi: Fix possible mem-leaks on tlmi_analyze() error-exit

Mario Limonciello (1):
      platform/x86: amd-pmc: Use return code on suspend

Mark Pearson (2):
      platform/x86: think-lmi: Add pending_reboot support
      platform/x86: think-lmi: Move pending_reboot_attr to the attributes sysfs dir

Ping Bao (1):
      platform/x86: intel-hid: add Alder Lake ACPI device ID

Shyam Sundar S K (8):
      platform/x86: amd-pmc: Fix command completion code
      platform/x86: amd-pmc: Fix SMU firmware reporting mechanism
      platform/x86: amd-pmc: call dump registers only once
      platform/x86: amd-pmc: Add support for logging SMU metrics
      platform/x86: amd-pmc: Add support for logging s0ix counters
      platform/x86: amd-pmc: Add support for ACPI ID AMDI0006
      platform/x86: amd-pmc: Add new acpi id for future PMC controllers
      platform/x86: amd-pmc: Fix undefined reference to __udivdi3

Thomas Weißschuh (1):
      platform/x86: gigabyte-wmi: add support for B550 Aorus Elite V2

Yang Yingliang (1):
      platform/x86: amd-pmc: Fix missing unlock on error in amd_pmc_send_cmd()

 drivers/platform/x86/amd-pmc.c         | 249 +++++++++++++++++++++++++++++----
 drivers/platform/x86/gigabyte-wmi.c    |   1 +
 drivers/platform/x86/intel-hid.c       |   1 +
 drivers/platform/x86/think-lmi.c       |  45 ++++--
 drivers/platform/x86/think-lmi.h       |   1 +
 drivers/platform/x86/wireless-hotkey.c |   2 +-
 6 files changed, 265 insertions(+), 34 deletions(-)

