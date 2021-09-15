Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61EE3C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 15 Sep 2021 21:12:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4BA7460F8F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 15 Sep 2021 21:12:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233051AbhIOVOR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 15 Sep 2021 17:14:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50972 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232274AbhIOVOD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 15 Sep 2021 17:14:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631740363;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ztaTSSh2XyMIxLKcfUEMRsL1SM5pP6oaQc/cGjspv6E=;
        b=fsNQr8ixdvW902j1VFxLXaAeLu+E9CC2qNB0ZNfOIDTukYXV0nxv9QqFJsQJXXh9MuIqlk
        LNozyq3dZWQl5EuJXNrg0Js8WRVmwMgNQ7i9XB9bDRDbgm7K/pO8+1p9FFCU+Xod8R9equ
        o89tVqZhESrvRlI1vzGSUn54EpdfEQU=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-u0Rn9zCwN3u8esTwtouEtQ-1; Wed, 15 Sep 2021 17:12:42 -0400
X-MC-Unique: u0Rn9zCwN3u8esTwtouEtQ-1
Received: by mail-qk1-f200.google.com with SMTP id v21-20020a05620a0a9500b003d5c1e2f277so9398208qkg.13
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Sep 2021 14:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=ztaTSSh2XyMIxLKcfUEMRsL1SM5pP6oaQc/cGjspv6E=;
        b=VZAtUU9b9c4/y2yybMxEmx6PvLmrkhnOC0NE8X/K4dZbE8pJqpEaJnxeiQRxYYM4KJ
         /4j/chckys9J4fZz4ShPQgsmbB/KIKg8+NGvPwfnwEcFU6jjCZ68IsbxIyR5ZT9waUCx
         zGnySj2eF0rgar1etqrK6MYhWlJMbEG2FxFt1lCY9J5/syH5zhHkrXnweE5qP/YENFK9
         TbveXx4RNctXKBMr5rLDNytHH6TRSpLbhxs0MdUn+S0sg+WKb6ciW864S9Cbuzpn7Q3W
         fOczhZqShZXmaSMuAZ8+KAo7GZTRoNbScDyrL2zB5f2afDwkMN5bnBdcOg2bFGqHMvgh
         tKXg==
X-Gm-Message-State: AOAM5316v4JnGMdIaWwjfbS6UdXqdPSGq8bUt+RYXgUQTBgyWjk5Lha7
        0O2DItu5081smlmlNaC2Q9mbybp5vEB1R2PpWMNhCQbRicf76Ea8XVvVMLnvZtxiEA2vAst39r0
        suM7+VVGac3Wo7TKgmIFP2Mz45vFls3YWEQ==
X-Received: by 2002:a05:6214:387:: with SMTP id l7mr1978259qvy.18.1631740362114;
        Wed, 15 Sep 2021 14:12:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPITxYBjWa5zyX+wpFjDWfNzNlOnZPkx+q623qbE3sktoD4mTGRlKk5f7+ZAiElykpCVKq8Q==
X-Received: by 2002:a05:6214:387:: with SMTP id l7mr1978244qvy.18.1631740361922;
        Wed, 15 Sep 2021 14:12:41 -0700 (PDT)
Received: from [192.168.8.206] (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
        by smtp.gmail.com with ESMTPSA id o12sm752839qtt.94.2021.09.15.14.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 14:12:41 -0700 (PDT)
Message-ID: <ddd8ba1e22adb6fd536c9d72384a30bb9c945997.camel@redhat.com>
Subject: Re: [PATCH 0/9] drm: Add privacy-screen class and connector
 properties
From:   Lyude Paul <lyude@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rajat Jain <rajatja@google.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        Pekka Paalanen <pekka.paalanen@collabora.com>,
        Mario Limonciello <mario.limonciello@outlook.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Sebastien Bacher <seb128@ubuntu.com>,
        Marco Trevisan <marco.trevisan@canonical.com>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org
Date:   Wed, 15 Sep 2021 17:12:40 -0400
In-Reply-To: <20210906073519.4615-1-hdegoede@redhat.com>
References: <20210906073519.4615-1-hdegoede@redhat.com>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

OK! Looked over all of these patches. Patches 2 and 4 have some comments that
should be addressed, but otherwise this series is:

Reviewed-by: Lyude Paul <lyude@redhat.com>

Let me know when/if you need help pushing this upstream

On Mon, 2021-09-06 at 09:35 +0200, Hans de Goede wrote:
> Hi all,
> 
> Here is the privacy-screen related code which I last posted in April 2021
> To the best of my knowledge there is consensus about / everyone is in
> agreement with the new userspace API (2 connector properties) this
> patch-set add (patch 1 of the series).
> 
> This is unchanged (except for a rebase on drm-tip), what has changed is
> that the first userspace consumer of the new properties is now fully ready
> for merging (it is just waiting for the kernel bits to land first):
> 
>  -
> https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas/-/merge_requests/49
>  - https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1952
>  - https://gitlab.gnome.org/GNOME/gnome-control-center/-/merge_requests/1032
> 
> Having a userspace-consumer of the API fully ready for merging, clears the
> last blocker for this series. It has already has been reviewed before
> by Emil Velikov, but it could really do with another review.
> 
> The new API works as designed and add the following features to GNOME:
> 
> 1. Showing an OSD notification when the privacy-screen is toggled on/off
>    through hotkeys handled by the embedded-controller
> 2. Allowing control of the privacy-screen from the GNOME control-panel,
>    including the on/off slider shown there updating to match the hw-setting
>    when the setting is changed with the control-panel open.
> 3. Restoring the last user-setting at login
> 
> This series consists of a number of different parts:
> 
> 1. A new version of Rajat's privacy-screen connector properties patch,
> this adds new userspace API in the form of new properties
> 
> 2. Since on most devices the privacy screen is actually controlled by
> some vendor specific ACPI/WMI interface which has a driver under
> drivers/platform/x86, we need some "glue" code to make this functionality
> available to KMS drivers. Patches 2-4 add a new privacy-screen class for
> this, which allows non KMS drivers (and possibly KMS drivers too) to
> register a privacy-screen device and also adds an interface for KMS drivers
> to get access to the privacy-screen associated with a specific connector.
> This is modelled similar to how we deal with e.g. PWMs and GPIOs in the
> kernel, including separate includes for consumers and providers(drivers).
> 
> 3. Some drm_connector helper functions to keep the actual changes needed
> for this in individual KMS drivers as small as possible (patch 5).
> 
> 4. Make the thinkpad_acpi code register a privacy-screen device on
> ThinkPads with a privacy-screen (patches 6-8)
> 
> 5. Make the i915 driver export the privacy-screen functionality through
> the connector properties on the eDP connector.
> 
> I believe that it would be best to merge the entire series, including
> the thinkpad_acpi changes through drm-misc in one go. As the pdx86
> subsys maintainer I hereby give my ack for merging the thinkpad_acpi
> changes through drm-misc.
> 
> There is one small caveat with this series, which it is good to be
> aware of. The i915 driver will now return -EPROBE_DEFER on Thinkpads
> with an eprivacy screen, until the thinkpad_acpi driver is loaded.
> This means that initrd generation tools will need to be updated to
> include thinkpad_acpi when the i915 driver is added to the initrd.
> Without this the loading of the i915 driver will be delayed to after
> the switch to real rootfs.
> 
> Regards,
> 
> Hans
> 
> 
> Hans de Goede (8):
>   drm: Add privacy-screen class (v3)
>   drm/privacy-screen: Add X86 specific arch init code
>   drm/privacy-screen: Add notifier support
>   drm/connector: Add a drm_connector privacy-screen helper functions
>   platform/x86: thinkpad_acpi: Add hotkey_notify_extended_hotkey()
>     helper
>   platform/x86: thinkpad_acpi: Get privacy-screen / lcdshadow ACPI
>     handles only once
>   platform/x86: thinkpad_acpi: Register a privacy-screen device
>   drm/i915: Add privacy-screen support
> 
> Rajat Jain (1):
>   drm/connector: Add support for privacy-screen properties (v4)
> 
>  Documentation/gpu/drm-kms-helpers.rst        |  15 +
>  Documentation/gpu/drm-kms.rst                |   2 +
>  MAINTAINERS                                  |   8 +
>  drivers/gpu/drm/Kconfig                      |   4 +
>  drivers/gpu/drm/Makefile                     |   1 +
>  drivers/gpu/drm/drm_atomic_uapi.c            |   4 +
>  drivers/gpu/drm/drm_connector.c              | 214 +++++++++
>  drivers/gpu/drm/drm_drv.c                    |   4 +
>  drivers/gpu/drm/drm_privacy_screen.c         | 468 +++++++++++++++++++
>  drivers/gpu/drm/drm_privacy_screen_x86.c     |  86 ++++
>  drivers/gpu/drm/i915/display/intel_display.c |   5 +
>  drivers/gpu/drm/i915/display/intel_dp.c      |  10 +
>  drivers/gpu/drm/i915/i915_pci.c              |  12 +
>  drivers/platform/x86/Kconfig                 |   2 +
>  drivers/platform/x86/thinkpad_acpi.c         | 131 ++++--
>  include/drm/drm_connector.h                  |  56 +++
>  include/drm/drm_privacy_screen_consumer.h    |  65 +++
>  include/drm/drm_privacy_screen_driver.h      |  84 ++++
>  include/drm/drm_privacy_screen_machine.h     |  46 ++
>  19 files changed, 1175 insertions(+), 42 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_privacy_screen.c
>  create mode 100644 drivers/gpu/drm/drm_privacy_screen_x86.c
>  create mode 100644 include/drm/drm_privacy_screen_consumer.h
>  create mode 100644 include/drm/drm_privacy_screen_driver.h
>  create mode 100644 include/drm/drm_privacy_screen_machine.h
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

