Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09020C04A68
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Jul 2022 19:51:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231233AbiG0TvN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Jul 2022 15:51:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbiG0TvM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Jul 2022 15:51:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B9D6456BB8
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Jul 2022 12:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658951470;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tBYJ1755brG9zY8h9enQuClVVCU/Wjr83iOQleUbgYI=;
        b=Ue2DiPPkyWb0br3/LlxE7vDUVCXxwJ4GXl65N2Zj+k/nvWw00d20djbV8stsXzArfHmGYQ
        c3O2PpvPbOrCyojWt8dX4fx9nSGSe8iIXoB9zvWBpo5Vjcj4iWQetV0Rov/r5qQ066o9+y
        Ld+OqLqTACiFl7KV3hybTrW8mXhYUc4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-CBNfV3kSPSOWRj8tQlZlDg-1; Wed, 27 Jul 2022 15:50:14 -0400
X-MC-Unique: CBNfV3kSPSOWRj8tQlZlDg-1
Received: by mail-ed1-f70.google.com with SMTP id q16-20020a056402519000b0043bd73ad1baso8661257edd.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Jul 2022 12:50:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tBYJ1755brG9zY8h9enQuClVVCU/Wjr83iOQleUbgYI=;
        b=RVQ8V26FnoYLVk7esFShldgVSIKFpyaMwADUHaQuwE9pDIB7F3u7aNZ4FZ0NTc/uUS
         VyUITvXo33VJfXoT6XONimSImqCFexdPipChFcHOzpzK1Mf7BOiW+JixR0oJRTmYH8a4
         bfWQQb/MCUAQtslTMYkdxuLmUvcNui0NYJL0WvskzFyqCJbY2crb3/EA/kfodjECVEel
         +zE8JECg43yV/jAwcRlaJOM8gOZdVVXAA45w0IfLySDca14V9ZcZgy/swvEbR+BprC0x
         jajZggIubM/nPX5xwPa+rvyNbQirAzjO0JQgA1p+lGpcGwJw6fpmEfnXv9M5qKinlLcA
         38gw==
X-Gm-Message-State: AJIora+Y7rZzIss/skVocmU8630tKc1K1v+2Iuww2kuXKDRYN7McZ50+
        HETDqQhtd4/ADrpP2mzZ8tx+fj3Abmy8xXbzPE0sdYSRgPZ/RSQ6OJXSoy1IW/wTLcchefkbx6J
        cGT9IiozmkauaBZguh00tM8sFBbuvl1tmyw==
X-Received: by 2002:a05:6402:4410:b0:434:f35f:132e with SMTP id y16-20020a056402441000b00434f35f132emr24871788eda.215.1658951412676;
        Wed, 27 Jul 2022 12:50:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1snj9iuqWCw2UXQ8cn0IYqyg/ZArOxEAWSdY3GjmF7cMwM195hEV4QtJVxfSE5adu/L8jzNVQ==
X-Received: by 2002:a05:6402:4410:b0:434:f35f:132e with SMTP id y16-20020a056402441000b00434f35f132emr24871759eda.215.1658951412269;
        Wed, 27 Jul 2022 12:50:12 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id d6-20020a056402144600b0043cc7a3ff7fsm1051943edx.33.2022.07.27.12.50.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 12:50:11 -0700 (PDT)
Message-ID: <06debc83-5701-bd64-5351-147cc545f19e@redhat.com>
Date:   Wed, 27 Jul 2022 21:50:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 05/15] platform/x86/amd/pmf: Add debugfs information
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
 <20220712145847.3438544-6-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220712145847.3438544-6-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/12/22 16:58, Shyam Sundar S K wrote:
> Add debugfs support to the PMF driver so that using this interface the
> live counters from the PMFW can be queried to see if the power parameters
> are getting set properly when a certain power mode change happens.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/core.c | 46 +++++++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/pmf.h  |  3 ++
>  2 files changed, 49 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index b6006e8ee1a1..3d2af6a8e5e4 100644
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
> @@ -46,6 +47,49 @@
>  #define DELAY_MIN_US	2000
>  #define DELAY_MAX_US	3000
>  
> +#ifdef CONFIG_DEBUG_FS

linux/debugfs.h defines stubs for the used debugfs functions when
debugfs is not enabled, which will cause all the referred code
to also get optimized away. So the #ifdef here is not necessary
please drop it.

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
> +#else
> +static inline void amd_pmf_dbgfs_register(struct amd_pmf_dev *dev)
> +{
> +}
> +
> +static inline void amd_pmf_dbgfs_unregister(struct amd_pmf_dev *dev)
> +{
> +}

and also drop the entire #else block where you define your own stubs.

> +#endif /* CONFIG_DEBUG_FS */
> +
>  int amd_pmf_get_power_source(void)
>  {
>  	if (power_supply_is_system_supplied() > 0)
> @@ -231,6 +275,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
>  	apmf_acpi_init(dev);
>  	platform_set_drvdata(pdev, dev);
>  	amd_pmf_init_features(dev);
> +	amd_pmf_dbgfs_register(dev);
>  
>  	mutex_init(&dev->lock);
>  	dev_info(dev->dev, "registered PMF device successfully\n");
> @@ -244,6 +289,7 @@ static int amd_pmf_remove(struct platform_device *pdev)
>  
>  	mutex_destroy(&dev->lock);
>  	amd_pmf_deinit_features(dev);
> +	amd_pmf_dbgfs_unregister(dev);
>  	kfree(dev->buf);
>  	return 0;
>  }
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index a405987ae653..77021ef4bfde 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -102,6 +102,9 @@ struct amd_pmf_dev {
>  	enum platform_profile_option current_profile;
>  	struct platform_profile_handler pprof;
>  	struct mutex lock; /* protects the PMF interface */
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +	struct dentry *dbgfs_dir;
> +#endif /* CONFIG_DEBUG_FS */

And don't forget to drop the #if here. Also note your #if-s are not consistent
you are using:

#ifdef CONFIG_DEBUG_FS

vs:

#if IS_ENABLED(CONFIG_DEBUG_FS)

But since both should be dropped anyways this is not a problem :)

Regards,

Hans

