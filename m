Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B6DCC6FA82
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Sep 2022 14:41:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbiIUOl2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Sep 2022 10:41:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbiIUOl2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Sep 2022 10:41:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A8C228709
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Sep 2022 07:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663771286;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=J3lCGpWWZi2e/axQ6gkQEf9dCXKiSgJHKI2oqN7M62o=;
        b=M7b9Md81V09txB9tgq/dDOqzjYMdumGWed4V0sQeozAspZcbpYjn90aXmMTpnxgx1YW1Ev
        GBCMxq5FKdy4pysgdBLV432bdXprKct+/qR/yeWZzCpFU8q83MwCjf6Qt50H3TLC5wnoTK
        5Ihtsbvj9cPlfBAUV/9Dm3SxtqbiBjw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-297-e73rXUe0Ml6OW4gaRmU-UA-1; Wed, 21 Sep 2022 10:41:25 -0400
X-MC-Unique: e73rXUe0Ml6OW4gaRmU-UA-1
Received: by mail-ed1-f70.google.com with SMTP id y9-20020a056402270900b00451dfbbc9b2so4559940edd.12
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Sep 2022 07:41:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=J3lCGpWWZi2e/axQ6gkQEf9dCXKiSgJHKI2oqN7M62o=;
        b=y8Gn0Uyv6N/jpjzwK+ttwKUB417838JRmraFxL2io/4OefEmZ5QuGhF5CnXFBQnEjs
         X1bmxSVx+0XBFOapKZu4fjoA2jowwGl9SWBlQBjLjXivfLHF9s+YcDr+hq07yYR825Nv
         HZVD08bd5TuNlK8LrwoYKXTh7g1PzQen/Lit48W3cK5V17GZbIDfam/Ud9AF4SbNO9FQ
         pSdXieg4nczFHI7kiPn5pMUQqX99+IMHEL9HJcQuKVf0J8tDRW8064lo1pFqBtHEl0d3
         qF3SOF61y0V97dSTdc6NHXc/CqrpCdTBgycVHioJHQStbOcAzztDVQqXn+zs3aE9k1kq
         YVqA==
X-Gm-Message-State: ACrzQf3rIkGzSUt9FXULZpa4DzAPBTFicpK9HFG7YlL/z+Y1kMd525D9
        n70NZfUYInO2unS7A33AXLgQ6itFPZB3bgg6qh1CmAXQFZFhs6BobE56+YQkvyvU1uJhTX29jTh
        Wk9RkIN9exve5I+sgmYHUEg46stoK3/xiqw==
X-Received: by 2002:a17:906:ef8f:b0:77e:44be:790 with SMTP id ze15-20020a170906ef8f00b0077e44be0790mr21195799ejb.409.1663771284031;
        Wed, 21 Sep 2022 07:41:24 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6gjeTdJsj3eyujLNSo5xo0ZOKKPMCGtON/DcVOdeHCZJzRFCuvxKA9VfVE5tV7c1vEF8iDLg==
X-Received: by 2002:a17:906:ef8f:b0:77e:44be:790 with SMTP id ze15-20020a170906ef8f00b0077e44be0790mr21195780ejb.409.1663771283797;
        Wed, 21 Sep 2022 07:41:23 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id ku2-20020a170907788200b007708635be05sm1433218ejc.4.2022.09.21.07.41.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 07:41:23 -0700 (PDT)
Message-ID: <562f46a2-c09f-ec32-a41c-c8bae62030fc@redhat.com>
Date:   Wed, 21 Sep 2022 16:41:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 2/3] platform/x86/amd/pmf: Add sysfs to toggle CnQF
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org,
        mario.limonciello@amd.com
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        bnocera@redhat.com
References: <20220921102455.1792336-1-Shyam-sundar.S-k@amd.com>
 <20220921102455.1792336-3-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220921102455.1792336-3-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/21/22 12:24, Shyam Sundar S K wrote:
> Whether to turn CnQF on/off by default upon driver load would be decided
> by a BIOS flag. Add a sysfs node to provide a way to the user whether to
> use static slider or CnQF .
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/cnqf.c | 62 +++++++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/core.c |  6 +++
>  drivers/platform/x86/amd/pmf/pmf.h  |  1 +
>  3 files changed, 69 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
> index fa994800692a..34021bb22064 100644
> --- a/drivers/platform/x86/amd/pmf/cnqf.c
> +++ b/drivers/platform/x86/amd/pmf/cnqf.c
> @@ -298,6 +298,68 @@ static int amd_pmf_load_defaults_cnqf(struct amd_pmf_dev *dev)
>  	return 0;
>  }
>  
> +static ssize_t cnqf_enable_store(struct device *dev,
> +				 struct device_attribute *attr,
> +				 const char *buf, size_t count)
> +{
> +	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
> +	int mode, result, src;
> +	bool input;
> +
> +	mode = amd_pmf_get_pprof_modes(pdev);
> +	if (mode < 0)
> +		return mode;
> +
> +	result = kstrtobool(buf, &input);
> +	if (result)
> +		return result;
> +
> +	src = amd_pmf_get_power_source();
> +	pdev->cnqf_enabled = input;
> +
> +	if (pdev->cnqf_enabled && pdev->current_profile == PLATFORM_PROFILE_BALANCED) {
> +		amd_pmf_set_cnqf(pdev, src, config_store.current_mode, NULL);
> +	} else {
> +		if (is_apmf_func_supported(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR)) {
> +			amd_pmf_init_sps(pdev);

This amd_pmf_init_sps() calls is not necessary, this is already done at probe time
when is_apmf_func_supported(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR) returns true.

Please drop this.

> +			amd_pmf_update_slider(pdev, SLIDER_OP_SET, mode, NULL);
> +		}
> +	}
> +
> +	dev_dbg(pdev->dev, "Received CnQF %s\n", input ? "on" : "off");
> +	return count;
> +}
> +
> +static ssize_t cnqf_enable_show(struct device *dev,
> +				struct device_attribute *attr,
> +				char *buf)
> +{
> +	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
> +
> +	return sysfs_emit(buf, "%s\n", pdev->cnqf_enabled ? "on" : "off");
> +}
> +
> +static DEVICE_ATTR_RW(cnqf_enable);
> +
> +static umode_t cnqf_feature_is_visible(struct kobject *kobj,
> +				       struct attribute *attr, int n)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
> +
> +	return pdev->cnqf_supported ? attr->mode : 0;
> +}
> +
> +static struct attribute *cnqf_feature_attrs[] = {
> +	&dev_attr_cnqf_enable.attr,
> +	NULL
> +};
> +
> +const struct attribute_group cnqf_feature_attribute_group = {
> +	.is_visible = cnqf_feature_is_visible,
> +	.attrs = cnqf_feature_attrs,
> +};
> +
>  void amd_pmf_deinit_cnqf(struct amd_pmf_dev *dev)
>  {
>  	cancel_delayed_work_sync(&dev->work_buffer);
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 99be1e6d57d3..44fe30726b62 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -391,10 +391,16 @@ static int amd_pmf_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static const struct attribute_group *amd_pmf_driver_groups[] = {
> +	&cnqf_feature_attribute_group,
> +	NULL,
> +};
> +
>  static struct platform_driver amd_pmf_driver = {
>  	.driver = {
>  		.name = "amd-pmf",
>  		.acpi_match_table = amd_pmf_acpi_ids,
> +		.dev_groups = amd_pmf_driver_groups,
>  	},
>  	.probe = amd_pmf_probe,
>  	.remove = amd_pmf_remove,
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 24dd6fbff24c..097f3f5d33a3 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -422,5 +422,6 @@ int apmf_get_dyn_slider_def_dc(struct amd_pmf_dev *pdev, struct apmf_dyn_slider_
>  int amd_pmf_init_cnqf(struct amd_pmf_dev *dev);
>  void amd_pmf_deinit_cnqf(struct amd_pmf_dev *dev);
>  int amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_lapsed_ms);
> +extern const struct attribute_group cnqf_feature_attribute_group;
>  
>  #endif /* PMF_H */

Other then the remark about dropping the amd_pmf_init_sps() call this
looks good to me, with that fixed this is:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

