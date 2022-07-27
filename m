Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55F2EC04A68
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Jul 2022 20:36:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbiG0Ug4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Jul 2022 16:36:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbiG0Ug4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Jul 2022 16:36:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 43352140C3
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Jul 2022 13:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658954213;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2ILyzDOXnpz3AWUFYlZfCFD00dhlPVsj5gsxJ2gGN2k=;
        b=iQfOoXkUQSVcONs2Y90qYxrdCKWOtYELFNEe3T4XF0jb7Y8q0vaiOz2QTEEStSPcl/ceOm
        ymiuNyjU7P6wGgHfbpOyQZ+rOBO3t8xLTMXkSinKleB8v+PhkTk5KL2r6tvf4Q7ejquvp/
        s+fQ+F+1r9jztjpwY4xdBLcQQP2Z2dM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-aWtlpFC7PC2GriENHIaCmg-1; Wed, 27 Jul 2022 16:36:47 -0400
X-MC-Unique: aWtlpFC7PC2GriENHIaCmg-1
Received: by mail-ed1-f70.google.com with SMTP id x20-20020a05640226d400b0043c37fa024eso4699315edd.12
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Jul 2022 13:36:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2ILyzDOXnpz3AWUFYlZfCFD00dhlPVsj5gsxJ2gGN2k=;
        b=Tczk6x4ybucsMmBWFb8WPK2yFGitJ7JLXRzzvWEXZB3E7WY8iqk/MOu4k/WDDtUwti
         MYS+qn0uP1PJ+zQeo7nPf/gbWdOZ+WvxZg6Ji4+M/tCLQEE01PXeR8DQQ2kPmrBnT3WH
         jUTdNp5v29MFbYDDtzHRH5PEoehNrQaYKi/UDpd1sR8cj80mpSULea4H0k7KcSdIFkjK
         jGceHiQ8zHpylPCqzhQ4F/IJhqAn+XwuKbSyXlVb4m8BQ7wy1nndqFSppGvePi59AnuW
         GWhIs3FLuPH61mjXQpEre1BxGdM3/xAwGBGA7affXk6VyEW5Phqafvt/5rDckfd0I6CF
         kdFg==
X-Gm-Message-State: AJIora/fCysGAIHRSAZrs1cB7Zj2ydljWZbg6G6JpB6ZqbsQrzd2JFjT
        wOLQlsrJq4nSvYdIlHtHMKu0AELrK/rWpyf8PReRWD9JVLrvRGTkzDTxqOx6MuCB87GKetHiUGU
        KL/IqMZAS0O+83oBJZW7eXlOJUpsxSipY6A==
X-Received: by 2002:a05:6402:524e:b0:43c:4a02:8043 with SMTP id t14-20020a056402524e00b0043c4a028043mr10453408edd.65.1658954206549;
        Wed, 27 Jul 2022 13:36:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1smmTcrUUmxrRXY7Byg8z5JbXGcOd08ywW19uWy2lske7QvzyuugPhBbz5wnXXN5jOxqqCp5g==
X-Received: by 2002:a05:6402:524e:b0:43c:4a02:8043 with SMTP id t14-20020a056402524e00b0043c4a028043mr10453392edd.65.1658954206189;
        Wed, 27 Jul 2022 13:36:46 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id g2-20020a170906538200b0072b1bb3cc08sm8102671ejo.120.2022.07.27.13.36.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 13:36:45 -0700 (PDT)
Message-ID: <4617d561-4ac2-1ebd-b55f-56461c24ae57@redhat.com>
Date:   Wed, 27 Jul 2022 22:36:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 08/15] platform/x86/amd/pmf: Get performance metrics
 from PMFW
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
 <20220712145847.3438544-9-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220712145847.3438544-9-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/12/22 16:58, Shyam Sundar S K wrote:
> PMF driver polls for metrics information from PMFW to understand the system
> behavior, power consumption etc.
> 
> This metrics table information will be used the PMF features to tweak the
> thermal heuristics. The poll duration can also be changed by the user
> by changing the poll duration time.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/core.c | 57 +++++++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/pmf.h  | 39 ++++++++++++++++++++
>  2 files changed, 96 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index ff26928e6a49..c6fd52c46818 100644
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
>  #ifdef CONFIG_DEBUG_FS
>  static int current_power_limits_show(struct seq_file *seq, void *unused)
>  {
> @@ -98,6 +103,30 @@ int amd_pmf_get_power_source(void)
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
> +	platform_profile_get(&current_profile);

This can simply be written as:

	current_profile = READ_ONCE(dev->current_profile);

Avoiding the need to add the platform_profile_get() helper and allowing
the dropping of patch 1/15.

> +
> +	/* Transfer table contents */
> +	memset(&dev->m_table, 0, sizeof(dev->m_table));

memset dev->buf I presume, not dev->m_table ?

> +	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
> +	memcpy(&dev->m_table, dev->buf, sizeof(dev->m_table));
> +
> +	time_elapsed_ms = ktime_to_ms(ktime_get()) - dev->start_time;
> +	/* Calculate the avg SoC power consumption */
> +	socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
> +
> +	dev->start_time = ktime_to_ms(ktime_get());
> +	dev_dbg(dev->dev, "Metrics table sample size time:%d\n", metrics_table_loop_ms);
> +	schedule_delayed_work(&dev->work_buffer, msecs_to_jiffies(metrics_table_loop_ms));
> +}
> +
>  static inline u32 amd_pmf_reg_read(struct amd_pmf_dev *dev, int reg_offset)
>  {
>  	return ioread32(dev->regbase + reg_offset);
> @@ -191,6 +220,34 @@ static const struct pci_device_id pmf_pci_ids[] = {
>  	{ }
>  };
>  
> +int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
> +{
> +	struct smu_pmf_metrics *m_table;

Using a local variable just to use sizeof on it is weird,
please drop this.

> +	u64 phys_addr;
> +
> +	INIT_DELAYED_WORK(&dev->work_buffer, amd_pmf_get_metrics);
> +
> +	/*
> +	 * Start collecting the metrics data after a small delay
> +	 * or else, we might end up getting stale values from PMFW.
> +	 */
> +	schedule_delayed_work(&dev->work_buffer, msecs_to_jiffies(metrics_table_loop_ms * 3));

This work relies on dev->buf != NULL and on the DRAM address being
set, so this schedule_delayed_work() must be moved to lower in this function.

> +
> +	/* Get Metrics Table Address */
> +	dev->buf = kzalloc(sizeof(*m_table), GFP_KERNEL);

Use sizeof(dev->m_table) here, this is also what is used in
amd_pmf_get_metrics().

> +	if (!dev->buf)

Moving it lower also fixes it still running when existing with an error here.

> +		return -ENOMEM;
> +
> +	phys_addr = virt_to_phys(dev->buf);
> +	dev->hi = phys_addr >> 32;
> +	dev->low = phys_addr & GENMASK(31, 0);
> +
> +	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_HIGH, 0, dev->hi, NULL);
> +	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_LOW, 0, dev->low, NULL);

Are dev->hi and dev>low only ever used here? It seems so, in that case
please use local function variables for them instead of storing them
in the amd_pmf_dev struct.

> +

This is where the schedule_work() should be done.

> +	return 0;
> +}
> +
>  static void amd_pmf_init_features(struct amd_pmf_dev *dev)
>  {
>  	/* Enable Static Slider */
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 1e9e2e498d15..8f318ff59c2e 100644
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
>  enum amd_stt_skin_temp {
>  	STT_TEMP_APU,
>  	STT_TEMP_HS2,
> @@ -120,8 +155,11 @@ struct amd_pmf_dev {
>  	struct apmf_if *apmf_if;
>  	enum platform_profile_option current_profile;
>  	struct platform_profile_handler pprof;
> +	struct smu_pmf_metrics m_table;
> +	struct delayed_work work_buffer;
>  	struct delayed_work heart_beat;
>  	struct mutex lock; /* protects the PMF interface */
> +	ktime_t start_time;
>  #if IS_ENABLED(CONFIG_DEBUG_FS)
>  	struct dentry *dbgfs_dir;
>  #endif /* CONFIG_DEBUG_FS */
> @@ -158,6 +196,7 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
>  void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev);
>  int is_apmf_func_supported(unsigned long index);
>  int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32 *data);
> +int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev);
>  int amd_pmf_get_power_source(void);
>  
>  /* SPS Layer */


Regards,

Hans

