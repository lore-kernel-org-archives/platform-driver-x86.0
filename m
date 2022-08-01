Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F644C00144
	for <platform-driver-x86@archiver.kernel.org>; Mon,  1 Aug 2022 11:38:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230503AbiHALi5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 1 Aug 2022 07:38:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230458AbiHALi4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 Aug 2022 07:38:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7669932EF4
        for <platform-driver-x86@vger.kernel.org>; Mon,  1 Aug 2022 04:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659353934;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Xe1HEQxdGCZhqg1wffptyu2TclpRHG5d7C99z7mGIns=;
        b=WqbB/2SGESNCLfkT5MLwRKfbHSHnT+vfbb4dE12sypcB5HYOIcqd6YBK/kfRdP+MXvbXAq
        npDPPmo8hH8+9nXyPNxKae0+0UkA+8Q1Ax2N0KONTgqQr/meFWtGPKC9YNqbp1hcO6XdLl
        KHca9AR8HrHnmrU6apYUSPK/5PJLDWQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-fZa2PfmTO_m2stYUMKnd9w-1; Mon, 01 Aug 2022 07:38:53 -0400
X-MC-Unique: fZa2PfmTO_m2stYUMKnd9w-1
Received: by mail-ed1-f71.google.com with SMTP id c9-20020a05640227c900b0043ad14b1fa0so6983363ede.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 01 Aug 2022 04:38:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Xe1HEQxdGCZhqg1wffptyu2TclpRHG5d7C99z7mGIns=;
        b=c70TiNc4kdL4I/c8hY6m3KU/CrG5jeJJ3juj+m3gS7lPsEnJG/UzFGcvlKK/Mdj6n1
         5XXF9ElYIW/y/WQKcLsRtlEDPkpTDmzrYEXoovfHG0+As7cRVh6q8JYqqo3mkmApqxjj
         K4r04JvUGztJhIhmFTOfsCDjp2Geilr+P+ZB8J5du8qom3vyNswUV03lZ8TW/1BjGQj/
         hJgjZ9JMxJ8vCpGw2/qfHDGKlzikVsDurN5u2FXsQXewpWR7s9fEys0YG8ESrNjqmsk6
         0VI4k2/qQMvLSRV2Luk44tpmKjxcGMOFzQIovSHXdp1QYw6xzAU0ez9/tOWFQqF8p0i4
         eRJA==
X-Gm-Message-State: AJIora+Z6C4AOzbAjH9380n+Oh09i2Y8RhH38XGUnk5HCdfRHzBYQwQk
        7BOSbr0cM12jvrCVTZg+7C5jVVYzED+76HzYombJuI/fZSkdUHhzbQyY2RmVQU3pYTa7F8f9FNd
        OCeLrd61T/Ea4XYZ06J3chH0gjXS68Z/mwg==
X-Received: by 2002:a17:907:a05c:b0:72b:347b:4f59 with SMTP id gz28-20020a170907a05c00b0072b347b4f59mr11922904ejc.764.1659353932165;
        Mon, 01 Aug 2022 04:38:52 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t0pl7e7AH6DIUy+MWfc/OUCpMQIuDZtFObXc9VWZa7PZeYbFQIlU901y77BB5Zuc/aT9V+ZQ==
X-Received: by 2002:a17:907:a05c:b0:72b:347b:4f59 with SMTP id gz28-20020a170907a05c00b0072b347b4f59mr11922884ejc.764.1659353931751;
        Mon, 01 Aug 2022 04:38:51 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id x22-20020a170906299600b0072fa24c2ecbsm5087525eje.94.2022.08.01.04.38.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Aug 2022 04:38:51 -0700 (PDT)
Message-ID: <b41344c0-86dc-e275-ccb6-7210f1bb83c8@redhat.com>
Date:   Mon, 1 Aug 2022 13:38:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 RESEND 05/11] platform/x86/amd/pmf: Add heartbeat
 signal support
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220728182028.2082096-1-Shyam-sundar.S-k@amd.com>
 <20220728182028.2082096-6-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220728182028.2082096-6-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/28/22 20:20, Shyam Sundar S K wrote:
> PMF driver can send periodic heartbeat signals to OEM BIOS. When BIOS does
> not receive the signal after a period of time, it can infer that AMDPMF
> has hung or failed to load.
> 
> In this situation, BIOS can fallback to legacy operations. OEM can modify
> the time interval of the signal or completely disable signals through
> ACPI Method.
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Still looks good to me.

Regards,

Hans

> ---
>  drivers/platform/x86/amd/pmf/acpi.c | 42 +++++++++++++++++++++++++++--
>  drivers/platform/x86/amd/pmf/core.c |  1 +
>  drivers/platform/x86/amd/pmf/pmf.h  | 10 +++++++
>  3 files changed, 51 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index 41abd8680d8d..58e4893edea2 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -114,6 +114,26 @@ int apmf_get_static_slider_granular(struct apmf_if *apmf_if,
>  									data, sizeof(*data));
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
>  static int apmf_if_verify_interface(struct amd_pmf_dev *pdev, struct apmf_if *apmf_if)
>  {
>  	struct apmf_verify_interface output;
> @@ -134,6 +154,7 @@ static int apmf_if_verify_interface(struct amd_pmf_dev *pdev, struct apmf_if *ap
>  
>  static int apmf_get_system_params(struct apmf_if *apmf_if)
>  {
> +	struct apmf_notification_cfg *n = &apmf_if->notify_cfg;
>  	struct apmf_system_params params;
>  	int err;
>  
> @@ -144,17 +165,26 @@ static int apmf_get_system_params(struct apmf_if *apmf_if)
>  			return err;
>  	}
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
>  	return 0;
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
>  	acpi_status status;
> @@ -177,6 +207,7 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
>  		goto out;
>  	}
>  	pmf_dev->apmf_if = apmf_if;
> +	n = &apmf_if->notify_cfg;
>  
>  	ret = apmf_get_system_params(apmf_if);
>  	if (ret) {
> @@ -185,6 +216,13 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
>  		goto out;
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
> index 4ce69864879a..6c1c5a89fe71 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -279,6 +279,7 @@ static int amd_pmf_remove(struct platform_device *pdev)
>  
>  	mutex_destroy(&dev->lock);
>  	amd_pmf_deinit_features(dev);
> +	apmf_acpi_deinit(dev);
>  	amd_pmf_dbgfs_unregister(dev);
>  	kfree(dev->buf);
>  	return 0;
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index de8dbd5e04e8..f546062a10a7 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -17,6 +17,7 @@
>  /* APMF Functions */
>  #define APMF_FUNC_VERIFY_INTERFACE			0
>  #define APMF_FUNC_GET_SYS_PARAMS			1
> +#define APMF_FUNC_SBIOS_HEARTBEAT			4
>  #define APMF_FUNC_STATIC_SLIDER_GRANULAR       9
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
> @@ -99,6 +107,7 @@ struct amd_pmf_dev {
>  	struct apmf_if *apmf_if;
>  	enum platform_profile_option current_profile;
>  	struct platform_profile_handler pprof;
> +	struct delayed_work heart_beat;
>  	struct mutex lock; /* protects the PMF interface */
>  	struct dentry *dbgfs_dir;
>  };
> @@ -126,6 +135,7 @@ struct amd_pmf_static_slider_granular {
>  
>  /* Core Layer */
>  int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
> +void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev);
>  int is_apmf_func_supported(unsigned long index);
>  int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32 *data);
>  int amd_pmf_get_power_source(void);

