Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE49C6FA9D
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Mar 2023 14:41:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbjCAOlU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Mar 2023 09:41:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbjCAOlT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2023 09:41:19 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 686354393C
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Mar 2023 06:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677681612;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BUe84QSOVYverBpq1niZlZhICIXFK69PLbV0XFl4JEU=;
        b=G0lDtyJvBNYX56skDKwy94BXXhm2hdHqR5efEyfzgs2X0L+3buAKEFEKFwq+YwslccVr16
        sKZFva4GxWywnG2w6gQ1L1smdCgX7154JA8931sKwJ70STT1taCTS2edGCvzx24MhzLBCZ
        4BIUZXkyTIc4bXPYIgOJF7GygtPsPHo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-604-tUhf8HqxODuCtsCVNSnj4w-1; Wed, 01 Mar 2023 09:40:11 -0500
X-MC-Unique: tUhf8HqxODuCtsCVNSnj4w-1
Received: by mail-ed1-f72.google.com with SMTP id p36-20020a056402502400b004bb926a3d54so4265309eda.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Mar 2023 06:40:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BUe84QSOVYverBpq1niZlZhICIXFK69PLbV0XFl4JEU=;
        b=xCwIuIcdbYX9yxe7YKV7YtCed21Ol8+Cs70VPveVCHliY7LSwMEKCawugnQx6FUhZ+
         A2ZqAaUEzR0OcWcqqZ8afo+CqVdW/tmlUuZnowUHkvRB7cmewGafUPy1MvdIHoVpvA+h
         5ZLr8f9disXTpVyWh7wQORlPv1m+wdyPNOqbgwjsaedKk4BAMvkxBqCe2TD0pUDVlfax
         3PDHQJ1pyoKwy2YbqEv5V8ZglelKHEaCz37Ays6MT8NcHk7dbH/9t29JwhayXhPAQDNq
         xfYRdtJFBk/yHaWmFYzVohuUoSy5t26P8V0h5pb4M4edz53X9wWQ08+4bcOoUxgvLwYx
         D0Fw==
X-Gm-Message-State: AO0yUKVEbCO/Q8R1eK2ZPY8eHFh/topPUxQGj6YXb3dI+74KQh4ccmAO
        UVXCiro2pfN4lunS2abdwM1rQd7KYv0yeG7uoBUG49Ytz0JuT4ElM9vSYa1tLHolNwz2ng4V0ZE
        soOED4UhFyg21DdIXQ1WiA2zzOayevbox2cCKsBE=
X-Received: by 2002:a17:906:7388:b0:87b:7c1d:e02b with SMTP id f8-20020a170906738800b0087b7c1de02bmr6791852ejl.36.1677681609834;
        Wed, 01 Mar 2023 06:40:09 -0800 (PST)
X-Google-Smtp-Source: AK7set8rY5wbw5ky+nn2/yCUAwhQkuYV4x9SsI264LFcCqMzD7Rt9yOQXfbo87zvMm1VEOUGhw1GMQ==
X-Received: by 2002:a17:906:7388:b0:87b:7c1d:e02b with SMTP id f8-20020a170906738800b0087b7c1de02bmr6791830ejl.36.1677681609509;
        Wed, 01 Mar 2023 06:40:09 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id kd5-20020a17090798c500b008c0b8dd4cbdsm5873065ejc.112.2023.03.01.06.40.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 06:40:08 -0800 (PST)
Message-ID: <bba19fc3-0cbc-7829-6721-7d84ac4d9136@redhat.com>
Date:   Wed, 1 Mar 2023 15:40:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 12/12] platform/x86: ISST: Add suspend/resume callbacks
Content-Language: en-US, nl
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230211063257.311746-1-srinivas.pandruvada@linux.intel.com>
 <20230211063257.311746-13-srinivas.pandruvada@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230211063257.311746-13-srinivas.pandruvada@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/11/23 07:32, Srinivas Pandruvada wrote:
> To support S3/S4 with TPMI interface add suspend/resume callbacks.
> Here HW state is stored in suspend callback and restored during
> resume callback.
> 
> The hardware state which needs to be stored/restored:
> - CLOS configuration
> - CLOS Association
> - SST-CP enable/disable status
> - SST-PP perf level setting
> 
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> ---
>  .../x86/intel/speed_select_if/isst_tpmi.c     | 21 ++++++++
>  .../intel/speed_select_if/isst_tpmi_core.c    | 49 +++++++++++++++++++
>  .../intel/speed_select_if/isst_tpmi_core.h    |  2 +
>  3 files changed, 72 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/speed_select_if/isst_tpmi.c b/drivers/platform/x86/intel/speed_select_if/isst_tpmi.c
> index 7b4bdeefb8bc..ef39870c9829 100644
> --- a/drivers/platform/x86/intel/speed_select_if/isst_tpmi.c
> +++ b/drivers/platform/x86/intel/speed_select_if/isst_tpmi.c
> @@ -34,6 +34,24 @@ static void intel_sst_remove(struct auxiliary_device *auxdev)
>  	tpmi_sst_exit();
>  }
>  
> +static int __maybe_unused intel_sst_suspend(struct device *dev)
> +{
> +	tpmi_sst_dev_suspend(to_auxiliary_dev(dev));
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused intel_sst_resume(struct device *dev)
> +{
> +	tpmi_sst_dev_resume(to_auxiliary_dev(dev));
> +
> +	return 0;
> +}

Please drop the __maybe_unused here; and

> +
> +static const struct dev_pm_ops intel_sst_pm = {
> +	SET_SYSTEM_SLEEP_PM_OPS(intel_sst_suspend, intel_sst_resume)
> +};
> +

Replace this with:

static DEFINE_SIMPLE_DEV_PM_OPS(intel_sst_pm, intel_sst_suspend, intel_sst_resume);

>  static const struct auxiliary_device_id intel_sst_id_table[] = {
>  	{ .name = "intel_vsec.tpmi-sst" },
>  	{}
> @@ -44,6 +62,9 @@ static struct auxiliary_driver intel_sst_aux_driver = {
>  	.id_table       = intel_sst_id_table,
>  	.remove         = intel_sst_remove,
>  	.probe          = intel_sst_probe,
> +	.driver = {
> +		.pm = &intel_sst_pm,

And use:

		.pm = pm_sleep_ptr(&intel_sst_pm),


Here, this is the new #ifdef and __maybe_unused free way of dealing with pm_ops.

Regards,

Hans


> +	},
>  };
>  
>  module_auxiliary_driver(intel_sst_aux_driver);
> diff --git a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> index 9eaff90bb649..e173167085ea 100644
> --- a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> +++ b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> @@ -229,6 +229,10 @@ struct perf_level {
>   * @status_offset:	Store the status offset for each PP-level
>   * @sst_base:		Mapped SST base IO memory
>   * @auxdev:		Auxiliary device instance enumerated this instance
> + * @saved_sst_cp_control: Save SST-CP control configuration to store restore for suspend/resume
> + * @saved_clos_configs:	Save SST-CP CLOS configuration to store restore for suspend/resume
> + * @saved_clos_assocs:	Save SST-CP CLOS association to store restore for suspend/resume
> + * @saved_pp_control:	Save SST-PP control information to store restore for suspend/resume
>   *
>   * This structure is used store complete SST information for a power_domain. This information
>   * is used to read/write request for any SST IOCTL. Each physical CPU package can have multiple
> @@ -250,6 +254,10 @@ struct tpmi_per_power_domain_info {
>  	struct pp_status_offset status_offset;
>  	void __iomem *sst_base;
>  	struct auxiliary_device *auxdev;
> +	u64 saved_sst_cp_control;
> +	u64 saved_clos_configs[4];
> +	u64 saved_clos_assocs[4];
> +	u64 saved_pp_control;
>  };
>  
>  /**
> @@ -1333,6 +1341,47 @@ void tpmi_sst_dev_remove(struct auxiliary_device *auxdev)
>  }
>  EXPORT_SYMBOL_NS_GPL(tpmi_sst_dev_remove, INTEL_TPMI_SST);
>  
> +void tpmi_sst_dev_suspend(struct auxiliary_device *auxdev)
> +{
> +	struct tpmi_sst_struct *tpmi_sst = auxiliary_get_drvdata(auxdev);
> +	struct tpmi_per_power_domain_info *power_domain_info = tpmi_sst->power_domain_info;
> +	void __iomem *cp_base;
> +
> +	cp_base = power_domain_info->sst_base + power_domain_info->sst_header.cp_offset;
> +	power_domain_info->saved_sst_cp_control = readq(cp_base + SST_CP_CONTROL_OFFSET);
> +
> +	memcpy_fromio(power_domain_info->saved_clos_configs, cp_base + SST_CLOS_CONFIG_0_OFFSET,
> +		      sizeof(power_domain_info->saved_clos_configs));
> +
> +	memcpy_fromio(power_domain_info->saved_clos_assocs, cp_base + SST_CLOS_ASSOC_0_OFFSET,
> +		      sizeof(power_domain_info->saved_clos_assocs));
> +
> +	power_domain_info->saved_pp_control = readq(power_domain_info->sst_base +
> +						    power_domain_info->sst_header.pp_offset +
> +						    SST_PP_CONTROL_OFFSET);
> +}
> +EXPORT_SYMBOL_NS_GPL(tpmi_sst_dev_suspend, INTEL_TPMI_SST);
> +
> +void tpmi_sst_dev_resume(struct auxiliary_device *auxdev)
> +{
> +	struct tpmi_sst_struct *tpmi_sst = auxiliary_get_drvdata(auxdev);
> +	struct tpmi_per_power_domain_info *power_domain_info = tpmi_sst->power_domain_info;
> +	void __iomem *cp_base;
> +
> +	cp_base = power_domain_info->sst_base + power_domain_info->sst_header.cp_offset;
> +	writeq(power_domain_info->saved_sst_cp_control, cp_base + SST_CP_CONTROL_OFFSET);
> +
> +	memcpy_toio(cp_base + SST_CLOS_CONFIG_0_OFFSET, power_domain_info->saved_clos_configs,
> +		    sizeof(power_domain_info->saved_clos_configs));
> +
> +	memcpy_toio(cp_base + SST_CLOS_ASSOC_0_OFFSET, power_domain_info->saved_clos_assocs,
> +		    sizeof(power_domain_info->saved_clos_assocs));
> +
> +	writeq(power_domain_info->saved_pp_control, power_domain_info->sst_base +
> +				power_domain_info->sst_header.pp_offset + SST_PP_CONTROL_OFFSET);
> +}
> +EXPORT_SYMBOL_NS_GPL(tpmi_sst_dev_resume, INTEL_TPMI_SST);
> +
>  #define ISST_TPMI_API_VERSION	0x02
>  
>  int tpmi_sst_init(void)
> diff --git a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.h b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.h
> index 356cb02273b1..900b483703f9 100644
> --- a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.h
> +++ b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.h
> @@ -13,4 +13,6 @@ int tpmi_sst_init(void);
>  void tpmi_sst_exit(void);
>  int tpmi_sst_dev_add(struct auxiliary_device *auxdev);
>  void tpmi_sst_dev_remove(struct auxiliary_device *auxdev);
> +void tpmi_sst_dev_suspend(struct auxiliary_device *auxdev);
> +void tpmi_sst_dev_resume(struct auxiliary_device *auxdev);
>  #endif

