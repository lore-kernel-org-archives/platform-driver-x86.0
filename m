Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1D79C00140
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Aug 2022 13:12:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233831AbiHBNMu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Aug 2022 09:12:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232503AbiHBNMt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Aug 2022 09:12:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 939F02737
        for <platform-driver-x86@vger.kernel.org>; Tue,  2 Aug 2022 06:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659445967;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PWYrZPA5xm+hewzjD6R/93SQ808DG8KkX0PhRoLlaF0=;
        b=i7IZ0jdwhaXwKtSWziIRi6OT5w772rXwxN/kQY7VFQz2huP+j05jLTe0BPv+WLff1YlVHG
        uXx3LI+kIQ6OzBq37+rBKfRrmW9r7XfogomDVse/vyc7H4QqANPfYzbp4bBiP9ZqV4CRcy
        rnkuHPFXShm5V3fS7Qnt7Jp41xBhJm0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-TeBNn6RROHaz-DNJJ0NO0w-1; Tue, 02 Aug 2022 09:12:45 -0400
X-MC-Unique: TeBNn6RROHaz-DNJJ0NO0w-1
Received: by mail-ed1-f72.google.com with SMTP id q18-20020a056402519200b0043dd2ff50feso2559031edd.9
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Aug 2022 06:12:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=PWYrZPA5xm+hewzjD6R/93SQ808DG8KkX0PhRoLlaF0=;
        b=OPm9EmnG0QtkDexemp6D9I24L/tyN82B5TjWY7Xgz6UWw+xXl013e0W9R6opFFw+KU
         yAJtoZnLSgmJBalbGuDkTToV27KQ3UkYfpbBwGx4El2WwE4P4yyArETtA5ylBq3EphAo
         w/WHeDp5ndtE9xz7mNC152y9fnC29d+IGA8cdCHv46HC07KHM9lpA4bgNaRDg+QHsyv8
         eFScoET82RMKpd2M0n8k843pqYbU7PBSz44lfJylNjFdvqEQKwggdrpss2oI6j4qjwYB
         NXN8q/lNC0WzDEqfa4V/+tbG5dEJwSmi8uGT+HTSV62mNqK8o9HrxAjW2ahHPT8d4agz
         DYtA==
X-Gm-Message-State: ACgBeo3+TjrUJry5+NtZH6NPCqX/33v3cjES6dpWFtMIfCoy/geZjHmo
        3hiiH5ZDJqGMewx5isU/AO7v5r7nvvGQN0sLvwsP4lWF7OJ97LnmK7h53UZmPBKDJswtWWOZdy1
        meYr2EjDbL/1M2nUN0dfWlMpxrKgIaQPYuw==
X-Received: by 2002:a05:6402:1e8c:b0:43d:db52:78a8 with SMTP id f12-20020a0564021e8c00b0043ddb5278a8mr5328551edf.324.1659445964389;
        Tue, 02 Aug 2022 06:12:44 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6Sy2bUObe3Rl5B8sMx5gexOZ8EeiTsXepfbK8W1fHu4SCGwsKr3D4L8UVMjUIHmk95CKRI/w==
X-Received: by 2002:a05:6402:1e8c:b0:43d:db52:78a8 with SMTP id f12-20020a0564021e8c00b0043ddb5278a8mr5328530edf.324.1659445964158;
        Tue, 02 Aug 2022 06:12:44 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id f26-20020a17090631da00b0072f42ca292bsm363670ejf.129.2022.08.02.06.12.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 06:12:43 -0700 (PDT)
Message-ID: <0c6c70fc-4299-d498-80d1-210804272a59@redhat.com>
Date:   Tue, 2 Aug 2022 15:12:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 07/11] platform/x86/amd/pmf: Get performance metrics
 from PMFW
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220802112545.2118632-1-Shyam-sundar.S-k@amd.com>
 <20220802112545.2118632-8-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220802112545.2118632-8-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/2/22 13:25, Shyam Sundar S K wrote:
> PMF driver polls for metrics information from PMFW to understand the system
> behavior, power consumption etc.
> 
> This metrics table information will be used the PMF features to tweak the
> thermal heuristics. The poll duration can also be changed by the user
> by changing the poll duration time.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

> ---
>  drivers/platform/x86/amd/pmf/core.c | 52 +++++++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/pmf.h  | 39 ++++++++++++++++++++++
>  2 files changed, 91 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 87a1f9b27d2c..762f769bf7ee 100644
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
> @@ -88,6 +93,25 @@ int amd_pmf_get_power_source(void)
>  		return POWER_SOURCE_DC;
>  }
>  
> +static void amd_pmf_get_metrics(struct work_struct *work)
> +{
> +	struct amd_pmf_dev *dev = container_of(work, struct amd_pmf_dev, work_buffer.work);
> +	ktime_t time_elapsed_ms;
> +	int socket_power;
> +
> +	/* Transfer table contents */
> +	memset(dev->buf, 0, sizeof(dev->m_table));
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
> @@ -181,6 +205,34 @@ static const struct pci_device_id pmf_pci_ids[] = {
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
> index d40613a30ed7..42e4a5f512c0 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -67,6 +67,41 @@ struct apmf_fan_idx {
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
> +} __packed;
> +
>  enum amd_stt_skin_temp {
>  	STT_TEMP_APU,
>  	STT_TEMP_HS2,
> @@ -105,6 +140,9 @@ struct amd_pmf_dev {
>  	struct dentry *dbgfs_dir;
>  	int hb_interval; /* SBIOS heartbeat interval */
>  	struct delayed_work heart_beat;
> +	struct smu_pmf_metrics m_table;
> +	struct delayed_work work_buffer;
> +	ktime_t start_time;
>  };
>  
>  struct apmf_sps_prop_granular {
> @@ -138,6 +176,7 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
>  void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev);
>  int is_apmf_func_supported(struct amd_pmf_dev *pdev, unsigned long index);
>  int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32 *data);
> +int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev);
>  int amd_pmf_get_power_source(void);
>  
>  /* SPS Layer */

