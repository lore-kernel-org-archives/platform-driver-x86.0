Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C9A9C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Sep 2021 09:18:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 758FF61185
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Sep 2021 09:18:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234268AbhIPJUB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Sep 2021 05:20:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49327 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235130AbhIPJUB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Sep 2021 05:20:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631783921;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BxuVKtUlDaFUG4H+2VGQ6PdHS8H4rBQUK+ujOp0M+sE=;
        b=KgWOep5WH64WdV8xmkYAY271srJ/VVQlZn6Z0vbiCYmq550RJq/MPr70z51+k6D2+S6cde
        lekztj/AokaOHto3HjhOksT8LMXpm+QLQ/ZBrDfJukHtSuBiZ9b/g5HmEoCkRG7FXs1t6U
        5QoKUhQsrQguioFw69pVPmy24SwlN5U=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-oVDh45kAPri72UZhvY6AHQ-1; Thu, 16 Sep 2021 05:18:39 -0400
X-MC-Unique: oVDh45kAPri72UZhvY6AHQ-1
Received: by mail-ed1-f71.google.com with SMTP id e7-20020aa7d7c7000000b003d3e6df477cso4696124eds.20
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Sep 2021 02:18:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BxuVKtUlDaFUG4H+2VGQ6PdHS8H4rBQUK+ujOp0M+sE=;
        b=SItxC73vv9wuOaBZN9mAGbDkL0HXwVNAP3oguCPwcJQkfb/fmw6W443BEqW7rTLQML
         W7Bum+ZvjXZSFr7nTvhgphWrMx5OqZG3V4OI6NPmDqWnzhFjYE5TZ2yT9F2kVy8mMtBd
         xdFAWJZFYpvu1C0Sr94v3CF1YPtyKXmYZMyBB5zYUWS8gbstzyFHbLTgegrugJQsJb52
         Cf1AeiTMykWq9SuGp+NhqDM9ziugLAvgwUPnHSd9wSXWv2wXsPxIepPGPdOOV7HKoQ49
         ASguASP/bao616mcYRRksDteohEOjrS86D8D/JbWZJS/AOwirY+ucw6c22bvDhhnrQdK
         q/TA==
X-Gm-Message-State: AOAM531jYhF6NW2BRfpRF5xN2KHGLLZNeqB8Nma7aK7f8B1/cOSi83kS
        oMIL+37qrCkkbBqqb2ZAKvClb/FhoB7lrQSwCm37Wr0xlYvAK5bXm0loQGK0EgmAs8WA6pQGKDf
        szzVVrVcnaPy5yliKvZDH4K6K+gmpUwm24UNhSPE3HVnEc2I8zBLDBNAGwnbD5LKruvQBTBRwXo
        IUYVUeP+CZJw==
X-Received: by 2002:a50:eac4:: with SMTP id u4mr5311858edp.259.1631783918425;
        Thu, 16 Sep 2021 02:18:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBxGhwgZ+p+AAUipTHABsxp3m4Q9Z2JORjhomLKqYO8ZZzbfaD/T0oFzceJG04yiR7rP4ZlA==
X-Received: by 2002:a50:eac4:: with SMTP id u4mr5311810edp.259.1631783918003;
        Thu, 16 Sep 2021 02:18:38 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id f2sm957490ejl.90.2021.09.16.02.18.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Sep 2021 02:18:37 -0700 (PDT)
Subject: Re: [PATCH 3/9] drm/privacy-screen: Add X86 specific arch init code
To:     Jani Nikula <jani.nikula@linux.intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rajat Jain <rajatja@google.com>, Lyude <lyude@redhat.com>,
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
References: <20210906073519.4615-1-hdegoede@redhat.com>
 <20210906073519.4615-4-hdegoede@redhat.com> <87v930x5s3.fsf@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <11b286c0-994c-f179-baf2-830949a0862c@redhat.com>
Date:   Thu, 16 Sep 2021 11:18:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87v930x5s3.fsf@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/16/21 10:51 AM, Jani Nikula wrote:
> On Mon, 06 Sep 2021, Hans de Goede <hdegoede@redhat.com> wrote:
>> Add X86 specific arch init code, which fills the privacy-screen lookup
>> table by checking for various vendor specific ACPI interfaces for
>> controlling the privacy-screen.
>>
>> This initial version only checks for the Lenovo Thinkpad specific ACPI
>> methods for privacy-screen control.
>>
>> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/gpu/drm/Makefile                 |  2 +-
>>  drivers/gpu/drm/drm_privacy_screen_x86.c | 86 ++++++++++++++++++++++++
>>  include/drm/drm_privacy_screen_machine.h |  5 ++
>>  3 files changed, 92 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/gpu/drm/drm_privacy_screen_x86.c
>>
>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> index 788fc37096f6..12997ca5670d 100644
>> --- a/drivers/gpu/drm/Makefile
>> +++ b/drivers/gpu/drm/Makefile
>> @@ -32,7 +32,7 @@ drm-$(CONFIG_OF) += drm_of.o
>>  drm-$(CONFIG_PCI) += drm_pci.o
>>  drm-$(CONFIG_DEBUG_FS) += drm_debugfs.o drm_debugfs_crc.o
>>  drm-$(CONFIG_DRM_LOAD_EDID_FIRMWARE) += drm_edid_load.o
>> -drm-$(CONFIG_DRM_PRIVACY_SCREEN) += drm_privacy_screen.o
>> +drm-$(CONFIG_DRM_PRIVACY_SCREEN) += drm_privacy_screen.o drm_privacy_screen_x86.o
> 
> Would be nice to avoid building drm_privacy_screen_x86.o altogether for
> CONFIG_X86=n, and avoid...

Right unfortunately AFAIK I cannot write something like:

drm-$(CONFIG_DRM_PRIVACY_SCREEN && CONFIG_X86) += drm_privacy_screen_x86.o

So this would require adding a (non user selectable)
CONFIG_DRM_PRIVACY_SCREEN_X86 in Kconfig looking something
like this:

config DRM_PRIVACY_SCREEN
	bool
	default n
	select DRM_PRIVACY_SCREEN_X86 if X86

config DRM_PRIVACY_SCREEN_X86
	bool
	default n

Which is also not really pretty. 


>>  obj-$(CONFIG_DRM_DP_AUX_BUS) += drm_dp_aux_bus.o
>>  
>> diff --git a/drivers/gpu/drm/drm_privacy_screen_x86.c b/drivers/gpu/drm/drm_privacy_screen_x86.c
>> new file mode 100644
>> index 000000000000..a2cafb294ca6
>> --- /dev/null
>> +++ b/drivers/gpu/drm/drm_privacy_screen_x86.c
>> @@ -0,0 +1,86 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright (C) 2020 Red Hat, Inc.
>> + *
>> + * Authors:
>> + * Hans de Goede <hdegoede@redhat.com>
>> + */
>> +
>> +#include <linux/acpi.h>
>> +#include <drm/drm_privacy_screen_machine.h>
>> +
>> +#ifdef CONFIG_X86
> 
> ...ifdefs that cover the entire file. This can be a future improvement,
> though.

Thanks I would be happy to do a follow-up patch if we can come-up with
a better solution which we all like.

For now I would indeed prefer to move forward with this patch-set as is
because it has been rather long in the making, so it will be good if
I can finally get it upstream.

Regards,

Hans


> 
>> +static struct drm_privacy_screen_lookup arch_lookup;
>> +
>> +struct arch_init_data {
>> +	struct drm_privacy_screen_lookup lookup;
>> +	bool (*detect)(void);
>> +};
>> +
>> +#if IS_ENABLED(CONFIG_THINKPAD_ACPI)
>> +static acpi_status __init acpi_set_handle(acpi_handle handle, u32 level,
>> +					  void *context, void **return_value)
>> +{
>> +	*(acpi_handle *)return_value = handle;
>> +	return AE_CTRL_TERMINATE;
>> +}
>> +
>> +static bool __init detect_thinkpad_privacy_screen(void)
>> +{
>> +	union acpi_object obj = { .type = ACPI_TYPE_INTEGER };
>> +	struct acpi_object_list args = { .count = 1, .pointer = &obj, };
>> +	acpi_handle ec_handle = NULL;
>> +	unsigned long long output;
>> +	acpi_status status;
>> +
>> +	/* Get embedded-controller handle */
>> +	status = acpi_get_devices("PNP0C09", acpi_set_handle, NULL, &ec_handle);
>> +	if (ACPI_FAILURE(status) || !ec_handle)
>> +		return false;
>> +
>> +	/* And call the privacy-screen get-status method */
>> +	status = acpi_evaluate_integer(ec_handle, "HKEY.GSSS", &args, &output);
>> +	if (ACPI_FAILURE(status))
>> +		return false;
>> +
>> +	return (output & 0x10000) ? true : false;
>> +}
>> +#endif
>> +
>> +static const struct arch_init_data arch_init_data[] __initconst = {
>> +#if IS_ENABLED(CONFIG_THINKPAD_ACPI)
>> +	{
>> +		.lookup = {
>> +			.dev_id = NULL,
>> +			.con_id = NULL,
>> +			.provider = "privacy_screen-thinkpad_acpi",
>> +		},
>> +		.detect = detect_thinkpad_privacy_screen,
>> +	},
>> +#endif
>> +};
>> +
>> +void __init drm_privacy_screen_lookup_init(void)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(arch_init_data); i++) {
>> +		if (!arch_init_data[i].detect())
>> +			continue;
>> +
>> +		pr_info("Found '%s' privacy-screen provider\n",
>> +			arch_init_data[i].lookup.provider);
>> +
>> +		/* Make a copy because arch_init_data is __initconst */
>> +		arch_lookup = arch_init_data[i].lookup;
>> +		drm_privacy_screen_lookup_add(&arch_lookup);
>> +		break;
>> +	}
>> +}
>> +
>> +void drm_privacy_screen_lookup_exit(void)
>> +{
>> +	if (arch_lookup.provider)
>> +		drm_privacy_screen_lookup_remove(&arch_lookup);
>> +}
>> +#endif /* ifdef CONFIG_X86 */
>> diff --git a/include/drm/drm_privacy_screen_machine.h b/include/drm/drm_privacy_screen_machine.h
>> index aaa0d38cce92..02e5371904d3 100644
>> --- a/include/drm/drm_privacy_screen_machine.h
>> +++ b/include/drm/drm_privacy_screen_machine.h
>> @@ -31,11 +31,16 @@ struct drm_privacy_screen_lookup {
>>  void drm_privacy_screen_lookup_add(struct drm_privacy_screen_lookup *lookup);
>>  void drm_privacy_screen_lookup_remove(struct drm_privacy_screen_lookup *lookup);
>>  
>> +#if IS_ENABLED(CONFIG_DRM_PRIVACY_SCREEN) && IS_ENABLED(CONFIG_X86)
>> +void drm_privacy_screen_lookup_init(void);
>> +void drm_privacy_screen_lookup_exit(void);
>> +#else
>>  static inline void drm_privacy_screen_lookup_init(void)
>>  {
>>  }
>>  static inline void drm_privacy_screen_lookup_exit(void)
>>  {
>>  }
>> +#endif
>>  
>>  #endif
> 

