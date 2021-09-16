Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46796C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Sep 2021 08:51:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C77060F25
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Sep 2021 08:51:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235141AbhIPIxG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Sep 2021 04:53:06 -0400
Received: from mga01.intel.com ([192.55.52.88]:13284 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234268AbhIPIxG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Sep 2021 04:53:06 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="244894422"
X-IronPort-AV: E=Sophos;i="5.85,297,1624345200"; 
   d="scan'208";a="244894422"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2021 01:51:36 -0700
X-IronPort-AV: E=Sophos;i="5.85,297,1624345200"; 
   d="scan'208";a="545444144"
Received: from djustese-mobl.ger.corp.intel.com (HELO localhost) ([10.249.34.120])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2021 01:51:11 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rajat Jain <rajatja@google.com>, Lyude <lyude@redhat.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Pekka Paalanen <pekka.paalanen@collabora.com>,
        Mario Limonciello <mario.limonciello@outlook.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Sebastien Bacher <seb128@ubuntu.com>,
        Marco Trevisan <marco.trevisan@canonical.com>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 3/9] drm/privacy-screen: Add X86 specific arch init code
In-Reply-To: <20210906073519.4615-4-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210906073519.4615-1-hdegoede@redhat.com> <20210906073519.4615-4-hdegoede@redhat.com>
Date:   Thu, 16 Sep 2021 11:51:08 +0300
Message-ID: <87v930x5s3.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, 06 Sep 2021, Hans de Goede <hdegoede@redhat.com> wrote:
> Add X86 specific arch init code, which fills the privacy-screen lookup
> table by checking for various vendor specific ACPI interfaces for
> controlling the privacy-screen.
>
> This initial version only checks for the Lenovo Thinkpad specific ACPI
> methods for privacy-screen control.
>
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/Makefile                 |  2 +-
>  drivers/gpu/drm/drm_privacy_screen_x86.c | 86 ++++++++++++++++++++++++
>  include/drm/drm_privacy_screen_machine.h |  5 ++
>  3 files changed, 92 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/drm_privacy_screen_x86.c
>
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 788fc37096f6..12997ca5670d 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -32,7 +32,7 @@ drm-$(CONFIG_OF) += drm_of.o
>  drm-$(CONFIG_PCI) += drm_pci.o
>  drm-$(CONFIG_DEBUG_FS) += drm_debugfs.o drm_debugfs_crc.o
>  drm-$(CONFIG_DRM_LOAD_EDID_FIRMWARE) += drm_edid_load.o
> -drm-$(CONFIG_DRM_PRIVACY_SCREEN) += drm_privacy_screen.o
> +drm-$(CONFIG_DRM_PRIVACY_SCREEN) += drm_privacy_screen.o drm_privacy_screen_x86.o

Would be nice to avoid building drm_privacy_screen_x86.o altogether for
CONFIG_X86=n, and avoid...

>  
>  obj-$(CONFIG_DRM_DP_AUX_BUS) += drm_dp_aux_bus.o
>  
> diff --git a/drivers/gpu/drm/drm_privacy_screen_x86.c b/drivers/gpu/drm/drm_privacy_screen_x86.c
> new file mode 100644
> index 000000000000..a2cafb294ca6
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_privacy_screen_x86.c
> @@ -0,0 +1,86 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright (C) 2020 Red Hat, Inc.
> + *
> + * Authors:
> + * Hans de Goede <hdegoede@redhat.com>
> + */
> +
> +#include <linux/acpi.h>
> +#include <drm/drm_privacy_screen_machine.h>
> +
> +#ifdef CONFIG_X86

...ifdefs that cover the entire file. This can be a future improvement,
though.

> +static struct drm_privacy_screen_lookup arch_lookup;
> +
> +struct arch_init_data {
> +	struct drm_privacy_screen_lookup lookup;
> +	bool (*detect)(void);
> +};
> +
> +#if IS_ENABLED(CONFIG_THINKPAD_ACPI)
> +static acpi_status __init acpi_set_handle(acpi_handle handle, u32 level,
> +					  void *context, void **return_value)
> +{
> +	*(acpi_handle *)return_value = handle;
> +	return AE_CTRL_TERMINATE;
> +}
> +
> +static bool __init detect_thinkpad_privacy_screen(void)
> +{
> +	union acpi_object obj = { .type = ACPI_TYPE_INTEGER };
> +	struct acpi_object_list args = { .count = 1, .pointer = &obj, };
> +	acpi_handle ec_handle = NULL;
> +	unsigned long long output;
> +	acpi_status status;
> +
> +	/* Get embedded-controller handle */
> +	status = acpi_get_devices("PNP0C09", acpi_set_handle, NULL, &ec_handle);
> +	if (ACPI_FAILURE(status) || !ec_handle)
> +		return false;
> +
> +	/* And call the privacy-screen get-status method */
> +	status = acpi_evaluate_integer(ec_handle, "HKEY.GSSS", &args, &output);
> +	if (ACPI_FAILURE(status))
> +		return false;
> +
> +	return (output & 0x10000) ? true : false;
> +}
> +#endif
> +
> +static const struct arch_init_data arch_init_data[] __initconst = {
> +#if IS_ENABLED(CONFIG_THINKPAD_ACPI)
> +	{
> +		.lookup = {
> +			.dev_id = NULL,
> +			.con_id = NULL,
> +			.provider = "privacy_screen-thinkpad_acpi",
> +		},
> +		.detect = detect_thinkpad_privacy_screen,
> +	},
> +#endif
> +};
> +
> +void __init drm_privacy_screen_lookup_init(void)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(arch_init_data); i++) {
> +		if (!arch_init_data[i].detect())
> +			continue;
> +
> +		pr_info("Found '%s' privacy-screen provider\n",
> +			arch_init_data[i].lookup.provider);
> +
> +		/* Make a copy because arch_init_data is __initconst */
> +		arch_lookup = arch_init_data[i].lookup;
> +		drm_privacy_screen_lookup_add(&arch_lookup);
> +		break;
> +	}
> +}
> +
> +void drm_privacy_screen_lookup_exit(void)
> +{
> +	if (arch_lookup.provider)
> +		drm_privacy_screen_lookup_remove(&arch_lookup);
> +}
> +#endif /* ifdef CONFIG_X86 */
> diff --git a/include/drm/drm_privacy_screen_machine.h b/include/drm/drm_privacy_screen_machine.h
> index aaa0d38cce92..02e5371904d3 100644
> --- a/include/drm/drm_privacy_screen_machine.h
> +++ b/include/drm/drm_privacy_screen_machine.h
> @@ -31,11 +31,16 @@ struct drm_privacy_screen_lookup {
>  void drm_privacy_screen_lookup_add(struct drm_privacy_screen_lookup *lookup);
>  void drm_privacy_screen_lookup_remove(struct drm_privacy_screen_lookup *lookup);
>  
> +#if IS_ENABLED(CONFIG_DRM_PRIVACY_SCREEN) && IS_ENABLED(CONFIG_X86)
> +void drm_privacy_screen_lookup_init(void);
> +void drm_privacy_screen_lookup_exit(void);
> +#else
>  static inline void drm_privacy_screen_lookup_init(void)
>  {
>  }
>  static inline void drm_privacy_screen_lookup_exit(void)
>  {
>  }
> +#endif
>  
>  #endif

-- 
Jani Nikula, Intel Open Source Graphics Center
