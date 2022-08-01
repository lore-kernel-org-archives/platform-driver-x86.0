Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5612CC3F6B0
	for <platform-driver-x86@archiver.kernel.org>; Mon,  1 Aug 2022 11:55:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232458AbiHALzM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 1 Aug 2022 07:55:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232360AbiHALyi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 Aug 2022 07:54:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 21CAA3DBEA
        for <platform-driver-x86@vger.kernel.org>; Mon,  1 Aug 2022 04:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659354658;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=w76NxjtK8fx9M/xyJuyBpZ2FK6rx0SlmhssKeHK6Auo=;
        b=J2D88Nd2SuHo2G1CLcw7UV7kj+E8+dH8nIQWozy7C9vsPfkOQwB9Gopa7ww0B8t//jGIaz
        go0tuLS6hc55OGR2uIV5y+2s8z2qNHB/VFqQRh/l9zwhDuKN4Y+HTtIhmGRHJeHliBBKi0
        NrvQ1fBQupSzy/lwpb/d2Ib20pp5vHE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-DIfkU5RgO86J_9FUq5bG4g-1; Mon, 01 Aug 2022 07:50:57 -0400
X-MC-Unique: DIfkU5RgO86J_9FUq5bG4g-1
Received: by mail-ej1-f72.google.com with SMTP id sb15-20020a1709076d8f00b0072b692d938cso2898018ejc.10
        for <platform-driver-x86@vger.kernel.org>; Mon, 01 Aug 2022 04:50:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=w76NxjtK8fx9M/xyJuyBpZ2FK6rx0SlmhssKeHK6Auo=;
        b=EU157ZBfWdkqq6lbaZYn/6lKy9ww6ercEJo/aZTHUvNNZjePPg7ttfP3O2okOGWG5/
         +8nLOReYIqXCFCMURa831sigQp21H1scAV8RBqmXhzcNI14TSgnxgmpnGmhjEhpt5isi
         D+jb6FLmxT4XRPMtTXwywxeXSsm7t3loJooAWcuMKlMecbNE2X1VIElnsUYmIE31kh3+
         S0yDM4W3ccGvS8IPwAGCpgwkUxBngQ/nzs0XSrEM09wTXr/MyTW9katw5B+irZmqHWaH
         8NXCnRuA3AyorSAtmYNwlcqJVUsj51bT5GLetbWeFZ8eaE0AdCIcbFzTFkPxT0wT62G/
         fNnQ==
X-Gm-Message-State: AJIora/n8Xdqwb0s1dQivuNLkihHCEUgNQlMD7fmfIF/QGbGHwkLh84G
        gfG5zPf/53bO8PSg70WxrXRIyeokCw4cvEpP89dWspl3QC74/iFHj0cI+o4VP9bDO6Q03XN2Y0+
        +EfJiD1fe/0P7cdfaVHGkgGc3UxSxWEnZBA==
X-Received: by 2002:a17:907:3f9d:b0:72f:4645:1718 with SMTP id hr29-20020a1709073f9d00b0072f46451718mr11695525ejc.317.1659354655881;
        Mon, 01 Aug 2022 04:50:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s6YlGf9KayyuJix/nkjTuq6ugkXks5CMH+5s3p6JlkbWPOavc9ZLDvjqStgBuRR/ELo+4T8g==
X-Received: by 2002:a17:907:3f9d:b0:72f:4645:1718 with SMTP id hr29-20020a1709073f9d00b0072f46451718mr11695510ejc.317.1659354655682;
        Mon, 01 Aug 2022 04:50:55 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id x4-20020a1709064a8400b0072f2ed809casm5090842eju.49.2022.08.01.04.50.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Aug 2022 04:50:55 -0700 (PDT)
Message-ID: <0c24cafa-58a8-c770-7b62-39ab7f4d3c48@redhat.com>
Date:   Mon, 1 Aug 2022 13:50:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 RESEND 07/11] platform/x86/amd/pmf: Get performance
 metrics from PMFW
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220728182028.2082096-1-Shyam-sundar.S-k@amd.com>
 <20220728182028.2082096-8-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220728182028.2082096-8-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/28/22 20:20, Shyam Sundar S K wrote:
> PMF driver polls for metrics information from PMFW to understand the system
> behavior, power consumption etc.
> 
> This metrics table information will be used the PMF features to tweak the
> thermal heuristics. The poll duration can also be changed by the user
> by changing the poll duration time.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/core.c | 56 +++++++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/pmf.h  | 39 ++++++++++++++++++++
>  2 files changed, 95 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 6c1c5a89fe71..ede4eefc33a4 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -47,6 +47,11 @@
>  #define DELAY_MIN_US	2000
>  #define DELAY_MAX_US	3000
>  
> +/* override Metrics Table sample size time (in ms) */
> +static int metrics_table_loop_ms = 1000;
> +module_param(metrics_table_loop_ms, int, 0644);
> +MODULE_PARM_DESC(metrics_table_loop_ms, " Metrics Table sample size time (default = 1000ms) ");
> +
>  static int current_power_limits_show(struct seq_file *seq, void *unused)
>  {
>  	struct amd_pmf_dev *dev = seq->private;
> @@ -88,6 +93,29 @@ int amd_pmf_get_power_source(void)
>  		return POWER_SOURCE_DC;
>  }
>  
> +static void amd_pmf_get_metrics(struct work_struct *work)
> +{
> +	struct amd_pmf_dev *dev = container_of(work, struct amd_pmf_dev, work_buffer.work);
> +	enum platform_profile_option current_profile;
> +	ktime_t time_elapsed_ms;
> +	int socket_power;
> +
> +	/* Get the current profile information */
> +	current_profile = READ_ONCE(dev->current_profile);

As Mario already mentioned current_profile is no longer used, so this can be dropped now.

> +
> +	/* Transfer table contents */
> +	memset(&dev->m_table, 0, sizeof(dev->m_table));

You are memsetting dev->m_table here, and then 2 lines down completely
overwrite it with the contents of dev->buf. As already mentioned in my review
of v1 do you perhaps intend to memset dev->buf to 0 here ?

> +	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
> +	memcpy(&dev->m_table, dev->buf, sizeof(dev->m_table));
> +
> +	time_elapsed_ms = ktime_to_ms(ktime_get()) - dev->start_time;
> +	/* Calculate the avg SoC power consumption */
> +	socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
> +
> +	dev->start_time = ktime_to_ms(ktime_get());
> +	schedule_delayed_work(&dev->work_buffer, msecs_to_jiffies(metrics_table_loop_ms));
> +}
> +
>  static inline u32 amd_pmf_reg_read(struct amd_pmf_dev *dev, int reg_offset)
>  {
>  	return ioread32(dev->regbase + reg_offset);
> @@ -181,6 +209,34 @@ static const struct pci_device_id pmf_pci_ids[] = {
>  	{ }
>  };
>  
> +int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
> +{
> +	u64 phys_addr;
> +	u32 hi, low;
> +
> +	INIT_DELAYED_WORK(&dev->work_buffer, amd_pmf_get_metrics);
> +
> +	/* Get Metrics Table Address */
> +	dev->buf = kzalloc(sizeof(dev->m_table), GFP_KERNEL);
> +	if (!dev->buf)
> +		return -ENOMEM;
> +
> +	phys_addr = virt_to_phys(dev->buf);
> +	hi = phys_addr >> 32;
> +	low = phys_addr & GENMASK(31, 0);
> +
> +	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_HIGH, 0, hi, NULL);
> +	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_LOW, 0, low, NULL);
> +
> +	/*
> +	 * Start collecting the metrics data after a small delay
> +	 * or else, we might end up getting stale values from PMFW.
> +	 */
> +	schedule_delayed_work(&dev->work_buffer, msecs_to_jiffies(metrics_table_loop_ms * 3));
> +
> +	return 0;
> +}
> +
>  static void amd_pmf_init_features(struct amd_pmf_dev *dev)
>  {
>  	/* Enable Static Slider */
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index b6501a68aa4e..49d3232ee2e0 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -84,6 +84,41 @@ struct apmf_fan_idx {
>  	u32 fan_ctl_idx;
>  } __packed;
>  
> +struct smu_pmf_metrics {
> +	u16 gfxclk_freq; /* in MHz */
> +	u16 socclk_freq; /* in MHz */
> +	u16 vclk_freq; /* in MHz */
> +	u16 dclk_freq; /* in MHz */
> +	u16 memclk_freq; /* in MHz */
> +	u16 spare;
> +	u16 gfx_activity; /* in Centi */
> +	u16 uvd_activity; /* in Centi */
> +	u16 voltage[2]; /* in mV */
> +	u16 currents[2]; /* in mA */
> +	u16 power[2];/* in mW */
> +	u16 core_freq[8]; /* in MHz */
> +	u16 core_power[8]; /* in mW */
> +	u16 core_temp[8]; /* in centi-Celsius */
> +	u16 l3_freq; /* in MHz */
> +	u16 l3_temp; /* in centi-Celsius */
> +	u16 gfx_temp; /* in centi-Celsius */
> +	u16 soc_temp; /* in centi-Celsius */
> +	u16 throttler_status;
> +	u16 current_socketpower; /* in mW */
> +	u16 stapm_orig_limit; /* in W */
> +	u16 stapm_cur_limit; /* in W */
> +	u32 apu_power; /* in mW */
> +	u32 dgpu_power; /* in mW */
> +	u16 vdd_tdc_val; /* in mA */
> +	u16 soc_tdc_val; /* in mA */
> +	u16 vdd_edc_val; /* in mA */
> +	u16 soc_edcv_al; /* in mA */
> +	u16 infra_cpu_maxfreq; /* in MHz */
> +	u16 infra_gfx_maxfreq; /* in MHz */
> +	u16 skin_temp; /* in centi-Celsius */
> +	u16 device_state;
> +};
> +

Since you are memcpy-ing this from memory read from the PMF,
you should use __packed here.

>  enum amd_stt_skin_temp {
>  	STT_TEMP_APU,
>  	STT_TEMP_HS2,
> @@ -121,6 +156,9 @@ struct amd_pmf_dev {
>  	struct delayed_work heart_beat;
>  	struct mutex lock; /* protects the PMF interface */
>  	struct dentry *dbgfs_dir;
> +	struct smu_pmf_metrics m_table;
> +	struct delayed_work work_buffer;
> +	ktime_t start_time;
>  };
>  
>  struct apmf_sps_prop_granular {
> @@ -154,6 +192,7 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
>  void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev);
>  int is_apmf_func_supported(unsigned long index);
>  int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32 *data);
> +int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev);
>  int amd_pmf_get_power_source(void);
>  
>  /* SPS Layer */

Regards,

Hans

