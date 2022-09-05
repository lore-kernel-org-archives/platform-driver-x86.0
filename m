Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02CB4C6FA89
	for <platform-driver-x86@archiver.kernel.org>; Mon,  5 Sep 2022 08:38:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237807AbiIEIh6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 5 Sep 2022 04:37:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237803AbiIEIhm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 5 Sep 2022 04:37:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3C85501A5
        for <platform-driver-x86@vger.kernel.org>; Mon,  5 Sep 2022 01:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662366952;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=FKWvK74RqhWO5Ba3E7ZgA5XXRtVg9Ah/YW25Q16K5a0=;
        b=jSxIAxVV0kkj/MJ8Lck/VU0Hta1GNnsLoxZHNnviaxwCGwoCD/Qj+HU2XPSYHa9+bPYaqC
        HASyb36uHILCCO4sIXe82P6wRbV8QL/angGzGu/1uFqlrjwhcY+3UPbVhj3+/P1uvLj6AG
        ySSu+87NZJjUJ+7qRiy5UFpzBTls3JU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-671-jRatXV4DMKaMGpP8zsl77w-1; Mon, 05 Sep 2022 04:35:50 -0400
X-MC-Unique: jRatXV4DMKaMGpP8zsl77w-1
Received: by mail-ed1-f72.google.com with SMTP id m18-20020a056402511200b0044862412596so5409209edd.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 05 Sep 2022 01:35:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date;
        bh=FKWvK74RqhWO5Ba3E7ZgA5XXRtVg9Ah/YW25Q16K5a0=;
        b=URaAgtNvxOFBBsPkVU5mL71DM3FYN1reeIktRZJ3czppdTQcmcaaiSozwZijy6r4He
         hWe5a8kUK43iWTa2zdb/tvOeawzXvTX764E/YioAon94yrvkqAAXkiyEhjlrBqgIvBE8
         aYv4sQ4tcD5QPGvuT8SzhH9FJ2JSXdVAXabUGH6PzQFlNtS+UOwSyV2oPouMOilwSG3x
         bRMxBqQaXFkgABTdZC7IXfD/rjGFKS0WZSBqNmDMVJsktUpEc7H1gOusTW8som93/coy
         Q0hBC5Fyhar5dYXbXtuOd4NzBaR/HZIzSpoPj7eicr4zb6+6yt1+DlGWvvM7M51mKfN+
         8QEw==
X-Gm-Message-State: ACgBeo1IoNupX9+DGLj7B6Kjd/LTbFGmlOjW6HDDEZUwVtQ8rnCPdEqo
        vrnOm+/eYXHHl6tXUEynd3MXXhDomT2HjZB1uvKGb5GdaQNp40ewF8CBBWM0csul+y8CL1NRU+H
        mm5vcftvqf5tsj8cyExLVuAxknGpobjtDqw==
X-Received: by 2002:a05:6402:f92:b0:44e:84e0:1d2a with SMTP id eh18-20020a0564020f9200b0044e84e01d2amr3153065edb.395.1662366949023;
        Mon, 05 Sep 2022 01:35:49 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4VBNuR9PQ8/ymdedcVLZvd83Z5BrbBJNdtbcbD4W3JQHoyQWf8ni6TYgJ7xy7xpT4yxIFbjA==
X-Received: by 2002:a05:6402:f92:b0:44e:84e0:1d2a with SMTP id eh18-20020a0564020f9200b0044e84e01d2amr3153055edb.395.1662366948816;
        Mon, 05 Sep 2022 01:35:48 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id ee35-20020a056402292300b0044dde9244fdsm3162245edb.8.2022.09.05.01.35.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Sep 2022 01:35:48 -0700 (PDT)
Message-ID: <261afe3d-7790-e945-adf6-a2c96c9b1eff@redhat.com>
Date:   Mon, 5 Sep 2022 10:35:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] Immutable backlight-detect-refactor branch between acpi,
 drm-* and pdx86
To:     Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
        Lyude <lyude@redhat.com>, Daniel Dadap <ddadap@nvidia.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Xinhui <Xinhui.Pan@amd.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, nouveau@lists.freedesktop.org,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@redhat.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All,

Now that all patches have been reviewed/acked here is an immutable backlight-detect-refactor
branch with 6.0-rc1 + the v5 patch-set, for merging into the relevant (acpi, drm-* and pdx86)
subsystems.

Please pull this branch into the relevant subsystems.

I will merge this into the review-hans branch of the pdx86 git tree today and
from there it will move to for-next once the builders have successfully build-tested
the merge.

Regards,

Hans


The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/backlight-detect-refactor-1

for you to fetch changes up to 4f96b1bc156e7076f6efedc2a76a8c7e897c7977:

  drm/todo: Add entry about dealing with brightness control on devices with > 1 panel (2022-09-03 12:17:27 +0200)

----------------------------------------------------------------
Immutable backlight-detect-refactor branch between acpi, drm-* and pdx86

Tag (immutable branch) with v6.0-rc1 + the (acpi/x86) backlight
detect refactor work. For merging into the acpi, drm-* and pdx86
subsystems.

----------------------------------------------------------------
Hans de Goede (31):
      ACPI: video: Add acpi_video_backlight_use_native() helper
      drm/i915: Don't register backlight when another backlight should be used (v2)
      drm/amdgpu: Don't register backlight when another backlight should be used (v3)
      drm/radeon: Don't register backlight when another backlight should be used (v3)
      drm/nouveau: Don't register backlight when another backlight should be used (v2)
      ACPI: video: Drop backlight_device_get_by_type() call from acpi_video_get_backlight_type()
      ACPI: video: Remove acpi_video_bus from list before tearing it down
      ACPI: video: Simplify acpi_video_unregister_backlight()
      ACPI: video: Make backlight class device registration a separate step (v2)
      ACPI: video: Remove code to unregister acpi_video backlight when a native backlight registers
      drm/i915: Call acpi_video_register_backlight() (v3)
      drm/nouveau: Register ACPI video backlight when nv_backlight registration fails (v2)
      drm/amdgpu: Register ACPI video backlight when skipping amdgpu backlight registration
      drm/radeon: Register ACPI video backlight when skipping radeon backlight registration
      platform/x86: nvidia-wmi-ec-backlight: Move fw interface definitions to a header (v2)
      ACPI: video: Refactor acpi_video_get_backlight_type() a bit
      ACPI: video: Add Nvidia WMI EC brightness control detection (v3)
      ACPI: video: Add Apple GMUX brightness control detection
      platform/x86: nvidia-wmi-ec-backlight: Use acpi_video_get_backlight_type()
      platform/x86: apple-gmux: Stop calling acpi/video.h functions
      platform/x86: toshiba_acpi: Stop using acpi_video_set_dmi_backlight_type()
      platform/x86: acer-wmi: Move backlight DMI quirks to acpi/video_detect.c
      platform/x86: asus-wmi: Drop DMI chassis-type check from backlight handling
      platform/x86: asus-wmi: Move acpi_backlight=vendor quirks to ACPI video_detect.c
      platform/x86: asus-wmi: Move acpi_backlight=native quirks to ACPI video_detect.c
      platform/x86: samsung-laptop: Move acpi_backlight=[vendor|native] quirks to ACPI video_detect.c
      ACPI: video: Remove acpi_video_set_dmi_backlight_type()
      ACPI: video: Drop "Samsung X360" acpi_backlight=native quirk
      ACPI: video: Drop NL5x?U, PF4NU1F and PF5?U?? acpi_backlight=native quirks
      ACPI: video: Fix indentation of video_detect_dmi_table[] entries
      drm/todo: Add entry about dealing with brightness control on devices with > 1 panel

 Documentation/gpu/todo.rst                         |  68 ++++
 MAINTAINERS                                        |   1 +
 drivers/acpi/Kconfig                               |   1 +
 drivers/acpi/acpi_video.c                          |  64 ++-
 drivers/acpi/video_detect.c                        | 428 ++++++++++++---------
 drivers/gpu/drm/Kconfig                            |  14 +
 drivers/gpu/drm/amd/amdgpu/atombios_encoders.c     |  14 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   9 +
 drivers/gpu/drm/gma500/Kconfig                     |   2 +
 drivers/gpu/drm/i915/Kconfig                       |   2 +
 drivers/gpu/drm/i915/display/intel_acpi.c          |  27 ++
 drivers/gpu/drm/i915/display/intel_acpi.h          |   3 +
 drivers/gpu/drm/i915/display/intel_backlight.c     |   7 +
 drivers/gpu/drm/i915/display/intel_display.c       |   2 +-
 drivers/gpu/drm/nouveau/nouveau_acpi.c             |  10 +
 drivers/gpu/drm/nouveau/nouveau_acpi.h             |   4 +
 drivers/gpu/drm/nouveau/nouveau_backlight.c        |  13 +
 drivers/gpu/drm/radeon/atombios_encoders.c         |   7 +
 drivers/gpu/drm/radeon/radeon_encoders.c           |  11 +-
 drivers/gpu/drm/radeon/radeon_legacy_encoders.c    |   7 +
 drivers/platform/x86/Kconfig                       |   1 +
 drivers/platform/x86/acer-wmi.c                    |  66 ----
 drivers/platform/x86/apple-gmux.c                  |   3 -
 drivers/platform/x86/asus-nb-wmi.c                 |  21 -
 drivers/platform/x86/asus-wmi.c                    |  13 -
 drivers/platform/x86/asus-wmi.h                    |   2 -
 drivers/platform/x86/eeepc-wmi.c                   |  25 +-
 drivers/platform/x86/nvidia-wmi-ec-backlight.c     |  82 +---
 drivers/platform/x86/samsung-laptop.c              |  87 -----
 drivers/platform/x86/toshiba_acpi.c                |  16 -
 include/acpi/video.h                               |   9 +-
 .../platform_data/x86/nvidia-wmi-ec-backlight.h    |  76 ++++
 32 files changed, 588 insertions(+), 507 deletions(-)
 create mode 100644 include/linux/platform_data/x86/nvidia-wmi-ec-backlight.h

