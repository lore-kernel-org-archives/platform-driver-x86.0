Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4527FC00144
	for <platform-driver-x86@archiver.kernel.org>; Mon,  1 Aug 2022 11:35:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbiHALfm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 1 Aug 2022 07:35:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231164AbiHALfl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 Aug 2022 07:35:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E1A066411
        for <platform-driver-x86@vger.kernel.org>; Mon,  1 Aug 2022 04:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659353739;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZS4XncT1qqfuIy/yzMFo9D0stnS0ei7KIGX/L6SnrgQ=;
        b=L2R4zsmDFCdETFVJu6j3gCEINAsHlyxAraGIfH7TY4iVIsBmTx9JP9BAOytoMNK+tE+enA
        7B3nrfgLJZLw10RxN77tCkzLARBdCTxVl66j/J9PZmi4v5k/btjK8RkG+jaY4wL6+n+G2+
        6roSr+HNXAd/srPcEcBxb3XBFyjzseQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-412-oZh0jcGBMne-0MeyCSBs4g-1; Mon, 01 Aug 2022 07:35:38 -0400
X-MC-Unique: oZh0jcGBMne-0MeyCSBs4g-1
Received: by mail-ej1-f72.google.com with SMTP id nb10-20020a1709071c8a00b006e8f89863ceso2878902ejc.18
        for <platform-driver-x86@vger.kernel.org>; Mon, 01 Aug 2022 04:35:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZS4XncT1qqfuIy/yzMFo9D0stnS0ei7KIGX/L6SnrgQ=;
        b=3N3ET1lPoL6PORTKzH9apwpa/Clh6M5aguGnm7LDCKW+iXKSigt5dZiWKDDj9nc6r2
         TsirVMn3/Z7bbLjFyQNi3SyDIUZwP8L6bUXhAsrpgDld4vaew/naSnwpXE6bcbfYOlZP
         dlHHutJlfHL4RX9oXU7HCmWuDX+/rEvOqvO4Of9yQJyNGe2fNeLQxIfoHzY4N66cEvry
         tb/8ehPBIcVhOQGFswVMlV/OGysy8A7gIs6Sa8MwDyCfciyngjoQxpXgaXKfVA6oUo3w
         qvsL+NstbF5TkUjwYPHFmT5IeGLP664Kyof24v8OVyKabJa/kcby75eukzdDmNeqtK6D
         Uhrw==
X-Gm-Message-State: ACgBeo3Iw8OwVhcamEeUTutuSqGrmRDUgr/Ln9HEATi7JRcLKU3T8u3O
        rcfYFQ9Bzj+uSW5DR1Cxpf+Nv/kLtzvGm+8DsboWnb/TzA8l5HgeuVSciR814X/HzyTzIbZidcD
        v5I/Yv6q8J2e7K/vDMOEsm8nQ2ToodROEpg==
X-Received: by 2002:a05:6402:b88:b0:43d:6175:761f with SMTP id cf8-20020a0564020b8800b0043d6175761fmr9143674edb.237.1659353737242;
        Mon, 01 Aug 2022 04:35:37 -0700 (PDT)
X-Google-Smtp-Source: AA6agR50okPubmlq5HEztl7lrB4/u+RT9mizmKOyvB2P7caKtDjEA4h4583/ExXEvDJZzOMqRgTvkQ==
X-Received: by 2002:a05:6402:b88:b0:43d:6175:761f with SMTP id cf8-20020a0564020b8800b0043d6175761fmr9143658edb.237.1659353737054;
        Mon, 01 Aug 2022 04:35:37 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id e11-20020a170906044b00b00730935f959fsm607282eja.223.2022.08.01.04.35.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Aug 2022 04:35:36 -0700 (PDT)
Message-ID: <fff3b4cb-9adc-96da-b3a1-e851243d6cb1@redhat.com>
Date:   Mon, 1 Aug 2022 13:35:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 RESEND 04/11] platform/x86/amd/pmf: Add debugfs
 information
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220728182028.2082096-1-Shyam-sundar.S-k@amd.com>
 <20220728182028.2082096-5-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220728182028.2082096-5-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/28/22 20:20, Shyam Sundar S K wrote:
> Add debugfs support to the PMF driver so that using this interface the
> live counters from the PMFW can be queried to see if the power parameters
> are getting set properly when a certain power mode change happens.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thanks, version 2 looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

> ---
>  drivers/platform/x86/amd/pmf/core.c | 36 +++++++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/pmf.h  |  1 +
>  2 files changed, 37 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index b6006e8ee1a1..4ce69864879a 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -8,6 +8,7 @@
>   * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>   */
>  
> +#include <linux/debugfs.h>
>  #include <linux/iopoll.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> @@ -46,6 +47,39 @@
>  #define DELAY_MIN_US	2000
>  #define DELAY_MAX_US	3000
>  
> +static int current_power_limits_show(struct seq_file *seq, void *unused)
> +{
> +	struct amd_pmf_dev *dev = seq->private;
> +	struct amd_pmf_static_slider_granular table;
> +	int mode, src = 0;
> +
> +	mode = amd_pmf_get_pprof_modes(dev);
> +	src = amd_pmf_get_power_source();
> +	amd_pmf_update_slider(dev, SLIDER_OP_GET, mode, &table);
> +	seq_printf(seq, "spl:%u fppt:%u sppt:%u sppt_apu_only:%u stt_min:%u stt[APU]:%u stt[HS2]: %u\n",
> +		   table.prop[src][mode].spl,
> +		   table.prop[src][mode].fppt,
> +		   table.prop[src][mode].sppt,
> +		   table.prop[src][mode].sppt_apu_only,
> +		   table.prop[src][mode].stt_min,
> +		   table.prop[src][mode].stt_skin_temp[STT_TEMP_APU],
> +		   table.prop[src][mode].stt_skin_temp[STT_TEMP_HS2]);
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(current_power_limits);
> +
> +static void amd_pmf_dbgfs_unregister(struct amd_pmf_dev *dev)
> +{
> +	debugfs_remove_recursive(dev->dbgfs_dir);
> +}
> +
> +static void amd_pmf_dbgfs_register(struct amd_pmf_dev *dev)
> +{
> +	dev->dbgfs_dir = debugfs_create_dir("amd_pmf", NULL);
> +	debugfs_create_file("current_power_limits", 0644, dev->dbgfs_dir, dev,
> +			    &current_power_limits_fops);
> +}
> +
>  int amd_pmf_get_power_source(void)
>  {
>  	if (power_supply_is_system_supplied() > 0)
> @@ -231,6 +265,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
>  	apmf_acpi_init(dev);
>  	platform_set_drvdata(pdev, dev);
>  	amd_pmf_init_features(dev);
> +	amd_pmf_dbgfs_register(dev);
>  
>  	mutex_init(&dev->lock);
>  	dev_info(dev->dev, "registered PMF device successfully\n");
> @@ -244,6 +279,7 @@ static int amd_pmf_remove(struct platform_device *pdev)
>  
>  	mutex_destroy(&dev->lock);
>  	amd_pmf_deinit_features(dev);
> +	amd_pmf_dbgfs_unregister(dev);
>  	kfree(dev->buf);
>  	return 0;
>  }
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 30740a5cd30d..de8dbd5e04e8 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -100,6 +100,7 @@ struct amd_pmf_dev {
>  	enum platform_profile_option current_profile;
>  	struct platform_profile_handler pprof;
>  	struct mutex lock; /* protects the PMF interface */
> +	struct dentry *dbgfs_dir;
>  };
>  
>  struct apmf_sps_prop_granular {

