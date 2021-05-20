Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ACDAC433B4
	for <platform-driver-x86@archiver.kernel.org>; Thu, 20 May 2021 12:39:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF46C61163
	for <platform-driver-x86@archiver.kernel.org>; Thu, 20 May 2021 12:39:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238336AbhETMlO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 20 May 2021 08:41:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38645 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234963AbhETMlG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 20 May 2021 08:41:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621514385;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=ppo7V3Qys3eQxLvvu4Zddp5SmlJNyQzN/cEgnfzul74=;
        b=EkM8IKmQXa7vC8Sas0uO3yhtuGvCGCEIH4VhTTUbxvzfOlZKtDxq53tAbih5joMa3K+AKM
        R6HSPcD2sn+1/iVqzp+Z8V/mtu6G4RIFis71narr8rp6MX6ntE7dEt3QMoVc5AO8o6owTN
        QstZxRHrewJFK+YgUWQm+gFzOcSCERk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-Y7ZhtoomNS6y0_cRK9jlig-1; Thu, 20 May 2021 08:39:43 -0400
X-MC-Unique: Y7ZhtoomNS6y0_cRK9jlig-1
Received: by mail-ed1-f69.google.com with SMTP id n6-20020a0564020606b029038cdc241890so9432989edv.20
        for <platform-driver-x86@vger.kernel.org>; Thu, 20 May 2021 05:39:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=ppo7V3Qys3eQxLvvu4Zddp5SmlJNyQzN/cEgnfzul74=;
        b=SrsRKdE59kkCa+qojuSM3qN8m1DgqBxorewHpQQ2NFcfdLp9grJ1BAZ5j+Sl9kTSJF
         kzxxb8v9NzaJyMjGIp9upEY1yW3uk/tr3hKx4KDPk+bpLFEEqeuF7BtWBkdEOF7j/OLc
         F2RhHhDfFhq3XnqOhRZ05yptAY7YEal6ROlLkKm1+87UfoAUx6GmJPD7x+yekiO3Nd9N
         euDQxUPAlNgGFpMMor33OxvpP89xhYRjxzbIyeUJV0HZKu/oYt3rB0dzsExRn9XnUEPC
         5zVK/r6sBAAR2VJwesb2w47TC3D1MF/fe0AQsusKIjtU1qdir2OgbtOs2bPjL/5iiHDs
         9A4Q==
X-Gm-Message-State: AOAM530u2Hc99sovmmX6eM9CbmalJ2FWWWhHMvlSmOWEO68K0JwgSQaG
        WLiWDTPjVk51AHvL+ox69xMmUvwz+AJc8Sb9ohir8+0Nj9GFI8AZaOVMO1aH4eq55YU33NcbGaL
        yuvsY03oPWuo3gJhroD+r4AZ5gqLo/yzHGaGOeOL+NeQ/SGtAaoL0gEBjki2XxmzK0CInL8PcHZ
        RjYom+KqbXzw==
X-Received: by 2002:aa7:c7d5:: with SMTP id o21mr4830899eds.166.1621514382027;
        Thu, 20 May 2021 05:39:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHbAh8QGZb89Mj942QW8kEi/CSiFEBWF0G+KFE7p3dHTrtL5u/Ulfu7QIA4tACHoiFztKKPA==
X-Received: by 2002:aa7:c7d5:: with SMTP id o21mr4830866eds.166.1621514381668;
        Thu, 20 May 2021 05:39:41 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id t14sm1325506ejc.121.2021.05.20.05.39.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 May 2021 05:39:41 -0700 (PDT)
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 5.13-2
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org
Message-ID: <ca5ce35d-c5d5-1803-cbb7-b47a5f44e535@redhat.com>
Date:   Thu, 20 May 2021 14:39:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Linus,

Here is a set of bug-fixes and some model specific quirks for platform-drivers-x86 for 5.13.

Regards,

Hans


The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v5.13-2

for you to fetch changes up to e68671e9e1275dfdda333c3e83b6d28963af16b6:

  platform/x86: touchscreen_dmi: Add info for the Chuwi Hi10 Pro (CWI529) tablet (2021-05-20 14:11:03 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v5.13-2

Assorted pdx86 bug-fixes and model-specific quirks for 5.13.

The following is an automated git shortlog grouped by driver:

dell-smbios-wmi:
 -  Fix oops on rmmod dell_smbios

gigabyte-wmi:
 -  add support for B550 Aorus Elite
 -  add support for X570 UD
 -  streamline dmi matching

hp-wireless:
 -  add AMD's hardware id to the supported list

hp_accel:
 -  Avoid invoking _INI to speed up resume

ideapad-laptop:
 -  fix method name typo
 -  fix a NULL pointer dereference

intel_int0002_vgpio:
 -  Only call enable_irq_wake() when using s2idle

intel_punit_ipc:
 -  Append MODULE_DEVICE_TABLE for ACPI

platform/mellanox:
 -  mlxbf-tmfifo: Fix a memory barrier issue

platform/surface:
 -  dtx: Fix poll function
 -  aggregator: Add platform-drivers-x86 list to MAINTAINERS entry
 -  aggregator: avoid clang -Wconstant-conversion warning
 -  aggregator: Do not mark interrupt as shared

touchscreen_dmi:
 -  Add info for the Chuwi Hi10 Pro (CWI529) tablet
 -  Add info for the Mediacom Winpad 7.0 W700 tablet

----------------------------------------------------------------
Andy Shevchenko (1):
      platform/x86: intel_punit_ipc: Append MODULE_DEVICE_TABLE for ACPI

Arnd Bergmann (1):
      platform/surface: aggregator: avoid clang -Wconstant-conversion warning

Barnabás Pőcze (1):
      platform/x86: ideapad-laptop: fix method name typo

Hans de Goede (3):
      platform/x86: intel_int0002_vgpio: Only call enable_irq_wake() when using s2idle
      platform/x86: dell-smbios-wmi: Fix oops on rmmod dell_smbios
      platform/x86: touchscreen_dmi: Add info for the Chuwi Hi10 Pro (CWI529) tablet

Kai-Heng Feng (1):
      platform/x86: hp_accel: Avoid invoking _INI to speed up resume

Liming Sun (1):
      platform/mellanox: mlxbf-tmfifo: Fix a memory barrier issue

Maximilian Luz (3):
      platform/surface: aggregator: Do not mark interrupt as shared
      platform/surface: aggregator: Add platform-drivers-x86 list to MAINTAINERS entry
      platform/surface: dtx: Fix poll function

Qiu Wenbo (1):
      platform/x86: ideapad-laptop: fix a NULL pointer dereference

Shyam Sundar S K (1):
      platform/x86: hp-wireless: add AMD's hardware id to the supported list

Teava Radu (1):
      platform/x86: touchscreen_dmi: Add info for the Mediacom Winpad 7.0 W700 tablet

Thomas Weißschuh (3):
      platform/x86: gigabyte-wmi: streamline dmi matching
      platform/x86: gigabyte-wmi: add support for X570 UD
      platform/x86: gigabyte-wmi: add support for B550 Aorus Elite

 MAINTAINERS                                      |  1 +
 drivers/misc/lis3lv02d/lis3lv02d.h               |  1 +
 drivers/platform/mellanox/mlxbf-tmfifo.c         | 11 +++-
 drivers/platform/surface/aggregator/controller.c |  3 +-
 drivers/platform/surface/surface_dtx.c           |  8 +--
 drivers/platform/x86/Kconfig                     |  2 +-
 drivers/platform/x86/dell/dell-smbios-wmi.c      |  3 +-
 drivers/platform/x86/gigabyte-wmi.c              | 38 +++++------
 drivers/platform/x86/hp-wireless.c               |  2 +
 drivers/platform/x86/hp_accel.c                  | 22 ++++++-
 drivers/platform/x86/ideapad-laptop.c            | 13 ++--
 drivers/platform/x86/intel_int0002_vgpio.c       | 80 +++++++++++++++++-------
 drivers/platform/x86/intel_punit_ipc.c           |  1 +
 drivers/platform/x86/touchscreen_dmi.c           | 43 +++++++++++++
 include/linux/surface_aggregator/device.h        |  6 +-
 15 files changed, 164 insertions(+), 70 deletions(-)

