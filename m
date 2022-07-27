Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 173A8C04A68
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Jul 2022 19:53:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231322AbiG0TxT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Jul 2022 15:53:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbiG0TxS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Jul 2022 15:53:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D225956BBF
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Jul 2022 12:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658951597;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xcLMRXwK8/7cEH5f62p8MWEzH26R8IEg12kPdRVAuSI=;
        b=gq3JKcJG5tUeRxBA7dNzP/4ZZqUZwM6s2Wa52eM5xagXxy9HKAfKPWg7+MngAlRHityOaQ
        oSDU+RR1JLkT6qyM1XdbovXu6U8UKDX1Sn+sd6z0Ym3mneqKTmmBgszBsDMPeIsfvoMowf
        jYWB8+GZ71xFgoSgnmgqGy/RSjUpSU4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-VHNtf22jOd-Z4Fg7aBuzqw-1; Wed, 27 Jul 2022 15:53:15 -0400
X-MC-Unique: VHNtf22jOd-Z4Fg7aBuzqw-1
Received: by mail-ed1-f70.google.com with SMTP id o2-20020a056402438200b0043ccb3ed7dfso949322edc.22
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Jul 2022 12:53:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xcLMRXwK8/7cEH5f62p8MWEzH26R8IEg12kPdRVAuSI=;
        b=c21V2SXz6Cfl6vPlIXMffw3hZPXxbU+NAF8hI0oK8QV5ltq5R5cKIar0bLM9/WJHdQ
         fb4ZyDJ3+NzVKcEK/MeAhqhHWsuWE7prq2u7FC+DozvNJ5MnixAYhWVUzEY79H0Tblci
         Zkt0qgY13EANRmIad7WGqu1Gx12lsh9XOHY6dKAMrWmeIAplF+b284awFSzsGqQy7MEK
         KFtSRXYvvjY1yoLuRAdS+zb+SsOEYnlWhW7vwyrowk4YRrky8SH6XCGzyZ4w0Q2/JrFq
         ucqeoQV/eih7T9Ptmn1gfCMv/F81qW62Ixr6ZVESTDDyAxHTD99Yu5uA26OOhi1jL4Q1
         ogMg==
X-Gm-Message-State: AJIora9ORB4RuzyQzGHXx/7KSO1EYaDCe2xU0i97fgCo7PWib85Q7UR1
        Iii1AGIQex2kD+kDwRANqNpKy658So8PdaRmpSoiUnKIQWfYm4pwLnQ0AXoJ/l6KGvxISknLyeX
        6xLIORKAyUXxVRgcTxLr2VK/fS3/rAOYlNw==
X-Received: by 2002:a05:6402:240d:b0:43b:c41d:b0e0 with SMTP id t13-20020a056402240d00b0043bc41db0e0mr24289506eda.318.1658951594412;
        Wed, 27 Jul 2022 12:53:14 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sETbgbmJLr8MjFkA3+OaVP7E0a7N3vIONEuhYuNmlKeXeblvkYXs4whPAs033Yu7v1vBoQjQ==
X-Received: by 2002:a05:6402:240d:b0:43b:c41d:b0e0 with SMTP id t13-20020a056402240d00b0043bc41db0e0mr24289480eda.318.1658951593897;
        Wed, 27 Jul 2022 12:53:13 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id e14-20020a056402088e00b0043ccd4d15eesm792378edy.64.2022.07.27.12.53.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 12:53:12 -0700 (PDT)
Message-ID: <191776ed-8d45-cd62-89f5-ff20e20b2b40@redhat.com>
Date:   Wed, 27 Jul 2022 21:53:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 06/15] platform/x86/amd/pmf: Add heartbeat signal
 support
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
 <20220712145847.3438544-7-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220712145847.3438544-7-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/12/22 16:58, Shyam Sundar S K wrote:
> PMF driver can send periodic heartbeat signals to OEM BIOS. When BIOS does
> not receive the signal after a period of time, it can infer that AMDPMF
> has hung or failed to load.
> 
> In this situation, BIOS can fallback to legacy operations. OEM can modify
> the time interval of the signal or completely disable signals through
> ACPI Method.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/platform/x86/amd/pmf/acpi.c | 42 +++++++++++++++++++++++++++--
>  drivers/platform/x86/amd/pmf/core.c |  1 +
>  drivers/platform/x86/amd/pmf/pmf.h  | 10 +++++++
>  3 files changed, 51 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index fd5ab7a116f0..60ffc9ba4adc 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -97,6 +97,7 @@ int is_apmf_func_supported(unsigned long index)
>  
>  static int apmf_get_system_params(struct apmf_if *ampf_if)
>  {
> +	struct apmf_notification_cfg *n = &ampf_if->notify_cfg;
>  	struct apmf_system_params params;
>  	union acpi_object *info;
>  	size_t size;
> @@ -120,11 +121,13 @@ static int apmf_get_system_params(struct apmf_if *ampf_if)
>  	memset(&params, 0, sizeof(params));
>  	memcpy(&params, info->buffer.pointer, size);
>  
> -	pr_debug("PMF: system params mask:0x%x flags:0x%x cmd_code:0x%x\n",
> +	pr_debug("PMF: system params mask:0x%x flags:0x%x cmd_code:0x%x heartbeat:%d\n",
>  		 params.valid_mask,
>  		 params.flags,
> -		 params.command_code);
> +		 params.command_code,
> +		 params.heartbeat_int);
>  	params.flags = params.flags & params.valid_mask;
> +	n->hb_interval = params.heartbeat_int;
>  
>  out:
>  	kfree(info);
> @@ -159,6 +162,26 @@ int apmf_get_static_slider_granular(struct apmf_if *ampf_if,
>  	return err;
>  }
>  
> +static void apmf_sbios_heartbeat_notify(struct work_struct *work)
> +{
> +	struct amd_pmf_dev *dev = container_of(work, struct amd_pmf_dev, heart_beat.work);
> +	struct apmf_notification_cfg *n = &dev->apmf_if->notify_cfg;
> +	union acpi_object *info;
> +	int err = 0;
> +
> +	dev_dbg(dev->dev, "Sending heartbeat to SBIOS\n");
> +	info = apmf_if_call(dev->apmf_if, APMF_FUNC_SBIOS_HEARTBEAT, NULL);
> +	if (!info) {
> +		err = -EIO;
> +		goto out;
> +	}
> +
> +	schedule_delayed_work(&dev->heart_beat, msecs_to_jiffies(n->hb_interval * 1000));
> +
> +out:
> +	kfree(info);
> +}
> +
>  static acpi_handle apmf_if_probe_handle(void)
>  {
>  	acpi_handle handle = NULL;
> @@ -179,8 +202,15 @@ static acpi_handle apmf_if_probe_handle(void)
>  	return handle;
>  }
>  
> +void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
> +{
> +	if (pmf_dev->apmf_if->func.sbios_heartbeat)
> +		cancel_delayed_work_sync(&pmf_dev->heart_beat);
> +}
> +
>  int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
>  {
> +	struct apmf_notification_cfg *n;
>  	acpi_handle apmf_if_handle;
>  	struct apmf_if *apmf_if;
>  	int ret;
> @@ -202,6 +232,7 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
>  		goto out;
>  	}
>  	pmf_dev->apmf_if = apmf_if;
> +	n = &apmf_if->notify_cfg;
>  
>  	if (apmf_if->func.system_params) {
>  		ret = apmf_get_system_params(apmf_if);
> @@ -212,6 +243,13 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
>  		}
>  	}
>  
> +	if (n->hb_interval) {
> +		apmf_if->func.sbios_heartbeat = true;
> +		/* send heartbeats only if the interval is not zero */
> +		INIT_DELAYED_WORK(&pmf_dev->heart_beat, apmf_sbios_heartbeat_notify);
> +		schedule_delayed_work(&pmf_dev->heart_beat, 0);
> +	}
> +
>  out:
>  	return ret;
>  }
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 3d2af6a8e5e4..ff26928e6a49 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -289,6 +289,7 @@ static int amd_pmf_remove(struct platform_device *pdev)
>  
>  	mutex_destroy(&dev->lock);
>  	amd_pmf_deinit_features(dev);
> +	apmf_acpi_deinit(dev);
>  	amd_pmf_dbgfs_unregister(dev);
>  	kfree(dev->buf);
>  	return 0;
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 77021ef4bfde..504e1ae79706 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -17,6 +17,7 @@
>  /* APMF Functions */
>  #define APMF_FUNC_VERIFY_INTERFACE			0
>  #define APMF_FUNC_GET_SYS_PARAMS			1
> +#define APMF_FUNC_SBIOS_HEARTBEAT			4
>  #define APMF_FUNC_STATIC_SLIDER_GRANULAR	9
>  
>  /* Message Definitions */
> @@ -43,12 +44,18 @@
>  /* AMD PMF BIOS interfaces */
>  struct apmf_if_functions {
>  	bool system_params;
> +	bool sbios_heartbeat;
>  	bool static_slider_granular;
>  };
>  
> +struct apmf_notification_cfg {
> +	int hb_interval; /* SBIOS heartbeat interval */
> +};
> +
>  struct apmf_if {
>  	acpi_handle handle;
>  	struct apmf_if_functions func;
> +	struct apmf_notification_cfg notify_cfg;
>  };
>  
>  struct apmf_verify_interface {
> @@ -63,6 +70,7 @@ struct apmf_system_params {
>  	u32 valid_mask;
>  	u32 flags;
>  	u8 command_code;
> +	u32 heartbeat_int;
>  } __packed;
>  
>  enum amd_stt_skin_temp {
> @@ -101,6 +109,7 @@ struct amd_pmf_dev {
>  	struct apmf_if *apmf_if;
>  	enum platform_profile_option current_profile;
>  	struct platform_profile_handler pprof;
> +	struct delayed_work heart_beat;
>  	struct mutex lock; /* protects the PMF interface */
>  #if IS_ENABLED(CONFIG_DEBUG_FS)
>  	struct dentry *dbgfs_dir;
> @@ -130,6 +139,7 @@ struct amd_pmf_static_slider_granular {
>  
>  /* Core Layer */
>  int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
> +void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev);
>  int is_apmf_func_supported(unsigned long index);
>  int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32 *data);
>  int amd_pmf_get_power_source(void);

