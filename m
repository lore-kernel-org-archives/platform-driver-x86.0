Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C10CBEB64DC
	for <platform-driver-x86@archiver.kernel.org>; Fri, 14 Jul 2023 13:40:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235219AbjGNNkf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 14 Jul 2023 09:40:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234688AbjGNNke (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 14 Jul 2023 09:40:34 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A2662D64
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Jul 2023 06:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689341987;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yVH76M3F1Q5BCz2IRmb3FK24W3I9UaVN4ZZZThuMds0=;
        b=ck7b+YYsg9sPXyJXhRJpSrE+L5U5VoaXMVuOSex3dbuO0kyBlgU6EekFjcSU8/huUs0Ba6
        5FGopNk5qRkGmn0iJ2lAFfTnk2zodtOwAGN5WnFFX9r5Gitd1ok2OjOBTmlrEODY91TR68
        wzq/fBKryaQqQDk0sfUbOWdGfH0gOtc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-266-SiYh1lqRN_2IcnyzFEeNBg-1; Fri, 14 Jul 2023 09:39:46 -0400
X-MC-Unique: SiYh1lqRN_2IcnyzFEeNBg-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-51df43db167so1284775a12.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Jul 2023 06:39:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689341985; x=1691933985;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yVH76M3F1Q5BCz2IRmb3FK24W3I9UaVN4ZZZThuMds0=;
        b=FThJ4VIa2tY96l2zuEepzoPSjsaR5YIDkiV26AnjvWTB06doXHWuQDv9o2UsIVm0gY
         tqBxiqDIjHRoBpb8jDMOs1vfBEuyFZlv8m8Hl8/GYLGPsqrPrYYhHWs9KTj5Y962jIuv
         SFT8/+ygbIK2omEfF0LLS39cQKQqAZBFUo4zcuUm1AdFJ+kDUH/JA4+E0HpefYDa38hf
         xxMYwDa7lu0U/6XavnRLp8umox02o8q+yaQU6WVGkQUJKCphVZse/4X1u/zDcbTjXOcJ
         FROIxPKC57Sdqx5z6ZzHzrqKKQwWcD8skOpQZt59cvnti6ZN8zjdOqIt8/jWAIPZInwG
         nB+w==
X-Gm-Message-State: ABy/qLYpz6q+Y96RPSamUdm8RC3ieMDKM0WMT5yU6QK3IwNNG65eRDaj
        moTPp8sB6kxi3JVmCN16fX/SX1a+z1b3ZZD/0eFvcS7dFDupNohEmWZy96qqinQpScaeR0sEsRo
        eYopBxmjOQmGMug/nNpBusGGJgk+PxwDd8w==
X-Received: by 2002:a05:6402:61a:b0:51d:7ed9:c65 with SMTP id n26-20020a056402061a00b0051d7ed90c65mr4545940edv.21.1689341985597;
        Fri, 14 Jul 2023 06:39:45 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHLUQO4PwDzja/qIAB8ZflkKtOwJALyQJie/4I4gEyyTxPuWxkW9DSn44UiARnUAw68GsmUHA==
X-Received: by 2002:a05:6402:61a:b0:51d:7ed9:c65 with SMTP id n26-20020a056402061a00b0051d7ed90c65mr4545930edv.21.1689341985280;
        Fri, 14 Jul 2023 06:39:45 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id w22-20020aa7da56000000b0051e1a4454b2sm5739538eds.67.2023.07.14.06.39.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 06:39:44 -0700 (PDT)
Message-ID: <071b639e-2b81-cced-c52e-aaec66a065fb@redhat.com>
Date:   Fri, 14 Jul 2023 15:39:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/2] platform/x86/amd/pmf: Notify OS power slider update
Content-Language: en-US, nl
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        mario.limonciello@amd.com
References: <20230713093312.1233743-1-Shyam-sundar.S-k@amd.com>
 <20230713093312.1233743-2-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230713093312.1233743-2-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Shyam,

On 7/13/23 11:33, Shyam Sundar S K wrote:
> APMF fn8 can notify EC about the OS slider position change. Add this
> capability to the PMF driver so that it can call the APMF fn8 based on
> the changes in the Platform profile events.
> 
> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/acpi.c | 21 ++++++++
>  drivers/platform/x86/amd/pmf/core.c |  9 +++-
>  drivers/platform/x86/amd/pmf/pmf.h  | 16 +++++++
>  drivers/platform/x86/amd/pmf/sps.c  | 74 +++++++++++++++++++++++++++--
>  4 files changed, 114 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index 732b15b392ab..3fc5e4547d9f 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -106,6 +106,27 @@ int apmf_get_static_slider_granular(struct amd_pmf_dev *pdev,
>  									 data, sizeof(*data));
>  }
>  
> +int apmf_os_power_slider_update(struct amd_pmf_dev *pdev, u8 event)
> +{
> +	struct os_power_slider args;
> +	struct acpi_buffer params;
> +	union acpi_object *info;
> +	int err = 0;
> +
> +	args.size = sizeof(args);
> +	args.slider_event = event;
> +
> +	params.length = sizeof(args);
> +	params.pointer = (void *)&args;
> +
> +	info = apmf_if_call(pdev, APMF_FUNC_OS_POWER_SLIDER_UPDATE, &params);
> +	if (!info)
> +		err = -EIO;
> +
> +	kfree(info);
> +	return err;
> +}
> +
>  static void apmf_sbios_heartbeat_notify(struct work_struct *work)
>  {
>  	struct amd_pmf_dev *dev = container_of(work, struct amd_pmf_dev, heart_beat.work);
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 730b22457117..42224e37c8ba 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -72,7 +72,11 @@ static int amd_pmf_pwr_src_notify_call(struct notifier_block *nb, unsigned long
>  			return NOTIFY_DONE;
>  	}
>  
> -	amd_pmf_set_sps_power_limits(pmf);
> +	if (is_apmf_func_supported(pmf, APMF_FUNC_STATIC_SLIDER_GRANULAR))
> +		amd_pmf_set_sps_power_limits(pmf);
> +
> +	if (is_apmf_func_supported(pmf, APMF_FUNC_OS_POWER_SLIDER_UPDATE))
> +		amd_pmf_power_slider_update_event(pmf);
>  
>  	return NOTIFY_OK;
>  }
> @@ -280,7 +284,8 @@ static void amd_pmf_init_features(struct amd_pmf_dev *dev)
>  	int ret;
>  
>  	/* Enable Static Slider */
> -	if (is_apmf_func_supported(dev, APMF_FUNC_STATIC_SLIDER_GRANULAR)) {
> +	if (is_apmf_func_supported(dev, APMF_FUNC_STATIC_SLIDER_GRANULAR) ||
> +	    is_apmf_func_supported(dev, APMF_FUNC_OS_POWER_SLIDER_UPDATE)) {
>  		amd_pmf_init_sps(dev);
>  		dev_dbg(dev->dev, "SPS enabled and Platform Profiles registered\n");
>  	}

My review-hans branch has the following here, so this won't apply:

        /* Enable Static Slider */
        if (is_apmf_func_supported(dev, APMF_FUNC_STATIC_SLIDER_GRANULAR)) {
                amd_pmf_init_sps(dev);
                dev->pwr_src_notifier.notifier_call = amd_pmf_pwr_src_notify_call;
                power_supply_reg_notifier(&dev->pwr_src_notifier);
                dev_dbg(dev->dev, "SPS enabled and Platform Profiles registered\n");
        }

It looks like your branch is missing:

146b6f6855e76 platform/x86/amd/pmf: Register notify handler only if SPS is enabled

Please rebase and send a new version.

Regards,

Hans





> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 06c30cdc0573..deba88e6e4c8 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -21,6 +21,7 @@
>  #define APMF_FUNC_SBIOS_HEARTBEAT			4
>  #define APMF_FUNC_AUTO_MODE					5
>  #define APMF_FUNC_SET_FAN_IDX				7
> +#define APMF_FUNC_OS_POWER_SLIDER_UPDATE		8
>  #define APMF_FUNC_STATIC_SLIDER_GRANULAR       9
>  #define APMF_FUNC_DYN_SLIDER_AC				11
>  #define APMF_FUNC_DYN_SLIDER_DC				12
> @@ -44,6 +45,14 @@
>  #define GET_STT_LIMIT_APU	0x20
>  #define GET_STT_LIMIT_HS2	0x21
>  
> +/* OS slider update notification */
> +#define DC_BEST_PERF		0
> +#define DC_BETTER_PERF		1
> +#define DC_BATTERY_SAVER	3
> +#define AC_BEST_PERF		4
> +#define AC_BETTER_PERF		5
> +#define AC_BETTER_BATTERY	6
> +
>  /* Fan Index for Auto Mode */
>  #define FAN_INDEX_AUTO		0xFFFFFFFF
>  
> @@ -193,6 +202,11 @@ struct amd_pmf_static_slider_granular {
>  	struct apmf_sps_prop_granular prop[POWER_SOURCE_MAX][POWER_MODE_MAX];
>  };
>  
> +struct os_power_slider {
> +	u16 size;
> +	u8 slider_event;
> +} __packed;
> +
>  struct fan_table_control {
>  	bool manual;
>  	unsigned long fan_id;
> @@ -383,6 +397,7 @@ int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32
>  int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev);
>  int amd_pmf_get_power_source(void);
>  int apmf_install_handler(struct amd_pmf_dev *pmf_dev);
> +int apmf_os_power_slider_update(struct amd_pmf_dev *dev, u8 flag);
>  
>  /* SPS Layer */
>  int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
> @@ -393,6 +408,7 @@ void amd_pmf_deinit_sps(struct amd_pmf_dev *dev);
>  int apmf_get_static_slider_granular(struct amd_pmf_dev *pdev,
>  				    struct apmf_static_slider_granular_output *output);
>  bool is_pprof_balanced(struct amd_pmf_dev *pmf);
> +int amd_pmf_power_slider_update_event(struct amd_pmf_dev *dev);
>  
>  
>  int apmf_update_fan_idx(struct amd_pmf_dev *pdev, bool manual, u32 idx);
> diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
> index 445ff053b4df..ab69d517a36a 100644
> --- a/drivers/platform/x86/amd/pmf/sps.c
> +++ b/drivers/platform/x86/amd/pmf/sps.c
> @@ -174,14 +174,77 @@ int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf)
>  	return mode;
>  }
>  
> +int amd_pmf_power_slider_update_event(struct amd_pmf_dev *dev)
> +{
> +	u8 mode, flag = 0;
> +	int src;
> +
> +	mode = amd_pmf_get_pprof_modes(dev);
> +	if (mode < 0)
> +		return mode;
> +
> +	src = amd_pmf_get_power_source();
> +
> +	if (src == POWER_SOURCE_AC) {
> +		switch (mode) {
> +		case POWER_MODE_PERFORMANCE:
> +			flag |= BIT(AC_BEST_PERF);
> +			break;
> +		case POWER_MODE_BALANCED_POWER:
> +			flag |= BIT(AC_BETTER_PERF);
> +			break;
> +		case POWER_MODE_POWER_SAVER:
> +			flag |= BIT(AC_BETTER_BATTERY);
> +			break;
> +		default:
> +			dev_err(dev->dev, "unsupported platform profile\n");
> +			return -EOPNOTSUPP;
> +		}
> +
> +	} else if (src == POWER_SOURCE_DC) {
> +		switch (mode) {
> +		case POWER_MODE_PERFORMANCE:
> +			flag |= BIT(DC_BEST_PERF);
> +			break;
> +		case POWER_MODE_BALANCED_POWER:
> +			flag |= BIT(DC_BETTER_PERF);
> +			break;
> +		case POWER_MODE_POWER_SAVER:
> +			flag |= BIT(DC_BATTERY_SAVER);
> +			break;
> +		default:
> +			dev_err(dev->dev, "unsupported platform profile\n");
> +			return -EOPNOTSUPP;
> +		}
> +	}
> +
> +	apmf_os_power_slider_update(dev, flag);
> +
> +	return 0;
> +}
> +
>  static int amd_pmf_profile_set(struct platform_profile_handler *pprof,
>  			       enum platform_profile_option profile)
>  {
>  	struct amd_pmf_dev *pmf = container_of(pprof, struct amd_pmf_dev, pprof);
> +	int ret = 0;
>  
>  	pmf->current_profile = profile;
>  
> -	return amd_pmf_set_sps_power_limits(pmf);
> +	/* Notify EC about the slider position change */
> +	if (is_apmf_func_supported(pmf, APMF_FUNC_OS_POWER_SLIDER_UPDATE)) {
> +		ret = amd_pmf_power_slider_update_event(pmf);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (is_apmf_func_supported(pmf, APMF_FUNC_STATIC_SLIDER_GRANULAR)) {
> +		ret = amd_pmf_set_sps_power_limits(pmf);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
>  }
>  
>  int amd_pmf_init_sps(struct amd_pmf_dev *dev)
> @@ -189,10 +252,13 @@ int amd_pmf_init_sps(struct amd_pmf_dev *dev)
>  	int err;
>  
>  	dev->current_profile = PLATFORM_PROFILE_BALANCED;
> -	amd_pmf_load_defaults_sps(dev);
>  
> -	/* update SPS balanced power mode thermals */
> -	amd_pmf_set_sps_power_limits(dev);
> +	if (is_apmf_func_supported(dev, APMF_FUNC_STATIC_SLIDER_GRANULAR)) {
> +		amd_pmf_load_defaults_sps(dev);
> +
> +		/* update SPS balanced power mode thermals */
> +		amd_pmf_set_sps_power_limits(dev);
> +	}
>  
>  	dev->pprof.profile_get = amd_pmf_profile_get;
>  	dev->pprof.profile_set = amd_pmf_profile_set;

