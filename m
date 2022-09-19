Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE06C6FA82
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Sep 2022 10:48:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbiISKsr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 19 Sep 2022 06:48:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbiISKsO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Sep 2022 06:48:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE9832B63D
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Sep 2022 03:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663583869;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LurvLky4hxiQS6y/M1AdQvdK8qetSsgFhPKox96ywdw=;
        b=jMUtclGv0ZBW8+I9C3G08KCVwzU2ewYr0ZywUOw7UKfFMr42TC5vUi6RiNLw4BF3K6XY/m
        j2YvhMaKLLYBydthmCxTzZnQNOuibSf1uyKqyYihMKFWUlMSx/l1p7W3/t8ww+ZyH8SIu9
        au2Oe71EOwsiMAit2+hY4VRD8+Qc7Hw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-19-cnw8VjRBOZWvG2cvxQM7aw-1; Mon, 19 Sep 2022 06:37:47 -0400
X-MC-Unique: cnw8VjRBOZWvG2cvxQM7aw-1
Received: by mail-ej1-f72.google.com with SMTP id gv43-20020a1709072beb00b0077c3f58a03eso8190379ejc.4
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Sep 2022 03:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=LurvLky4hxiQS6y/M1AdQvdK8qetSsgFhPKox96ywdw=;
        b=g8PFUqdynra2ADzYFIZuXif4Xpwg2hdxDIy1l1htS1T7jux3LQf/59OJ/7FOG0Vjfr
         73u9cZgnI8OH4T9DkjGf21Ovdj4V4aUiwowhZxkAGd0qNZvAL+4N7kesk+y1BVDThhP7
         AKtPAGkl5d32p4giBB7IgZUtkGmmNf9LpyFyDye6LdRj+ewo6UFu/KaX2NopIL269gmU
         YQP0mop4dUGfS5YIlqW3bE+1HSePR+mUhzWbS/3zclu7P13h8snNKWTEFF1/pPpUgP3p
         gKfgWfFItwtfJpzz2lva1EVMBpE8Xvsj7xPsLejoBXIOgM2Ecu00ed3vdN+6h9IJGg6A
         YD0A==
X-Gm-Message-State: ACrzQf3VzKoE2JINLBKrWmSmzN+53aBpWcXd8ix4BqCqwCLxKpIfU/OI
        xT2C/tVykNDjE1PHu1IPAM/RYf0RQ60glyvUDgnaFf/6u4r20Y3nWBpLXRsCe8e0GSdQv4olnkq
        fQdVLsKUq2XUqS9Q1tawRmEAC1ZK5t2o/ig==
X-Received: by 2002:a17:906:8a6b:b0:780:ab37:b63 with SMTP id hy11-20020a1709068a6b00b00780ab370b63mr10467995ejc.365.1663583866513;
        Mon, 19 Sep 2022 03:37:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5N0naVITTXy/kftNsUaNi04Cs3ZZSm1stexk5aOsgLImmD1QeTr6F9NUor3fDSO5e9d+myzQ==
X-Received: by 2002:a17:906:8a6b:b0:780:ab37:b63 with SMTP id hy11-20020a1709068a6b00b00780ab370b63mr10467978ejc.365.1663583866323;
        Mon, 19 Sep 2022 03:37:46 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id j27-20020a170906279b00b0078135401b9csm2701478ejc.130.2022.09.19.03.37.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 03:37:45 -0700 (PDT)
Message-ID: <f34c2f79-1d2f-5968-7a81-03b4fd580ff6@redhat.com>
Date:   Mon, 19 Sep 2022 11:37:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2 2/4] platform/x86/amd/pmf: Add sysfs to toggle CnQF
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        bnocera@redhat.com
References: <20220912090641.111658-1-Shyam-sundar.S-k@amd.com>
 <20220912090641.111658-3-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220912090641.111658-3-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/12/22 10:06, Shyam Sundar S K wrote:
> Whether to turn CnQF on/off by default upon driver load would be decided
> by a BIOS flag. Add a sysfs node to provide a way to the user whether to
> use static slider or CnQF .
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---1
>  drivers/platform/x86/amd/pmf/cnqf.c | 57 +++++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
> index aebcef778a0b..8d0c1eff1659 100644
> --- a/drivers/platform/x86/amd/pmf/cnqf.c
> +++ b/drivers/platform/x86/amd/pmf/cnqf.c
> @@ -294,9 +294,64 @@ void amd_pmf_load_defaults_cnqf(struct amd_pmf_dev *dev)
>  		config_store.trans_prio[i] = i;
>  }
>  
> +static ssize_t feat_store(struct device *dev,
> +			  struct device_attribute *attr,
> +			  const char *buf, size_t count)

I don't like the "feat" name, why not just call it "enable", or even
better call it "cnqf_enable" and drop the extra cnqf subdir in sysfs?

> +{
> +	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
> +	int mode = amd_pmf_get_pprof_modes(pdev);
> +	int result, src;
> +	bool input;
> +
> +	result = kstrtobool(buf, &input);
> +	if (result)
> +		return result;
> +
> +	src = amd_pmf_get_power_source();
> +	pdev->cnqf_enabled = input;
> +
> +	if (mode < 0)
> +		return mode;

You have already set pdev->cnqf_enabled here, while you are returning
an error. If you return an error then no changes to the internal state
should be made, so please move this check up.

> +
> +	if (pdev->cnqf_enabled) {
> +		amd_pmf_set_cnqf(pdev, src, config_store.current_mode, NULL);

This is missing a "if (dev->current_profile == PLATFORM_PROFILE_BALANCED)"
check.

Also amd_pmf_init_cnqf() will call:

	amd_pmf_load_defaults_cnqf(dev);
	amd_pmf_init_metrics_table(dev);

Only when the BIOS has things enabled, so if the user now writes 1 or on to this sysfs
attribute then cnqf will be enabled but none of its limits / other settings will
be set so it will be very broken in this case!

It seems to me that:

	amd_pmf_load_defaults_cnqf(dev);
	amd_pmf_init_metrics_table(dev);

Should always be called on systems which support cnqf. As mentioned in my review of
patch 1/4 Please use 2 separate cnqf_supported and cnqf_enabled flags.

Also this function should then never be able to run when cnqf_supported is false,
as Mario already mentioned you should use a is_visible callback for this.



> +	} else {
> +		if (is_apmf_func_supported(pdev, APMF_FUNC_STATIC_SLIDER_GRANULAR)) {
> +			amd_pmf_init_sps(pdev);
> +			amd_pmf_update_slider(pdev, SLIDER_OP_SET, mode, NULL);
> +		}
> +	}
> +
> +	dev_dbg(pdev->dev, "Received CnQF %s\n", input ? "on" : "off");
> +	return count;
> +}
> +
> +static ssize_t feat_show(struct device *dev,
> +			 struct device_attribute *attr,
> +			 char *buf)
> +{
> +	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
> +
> +	return sprintf(buf, "%s\n", pdev->cnqf_enabled ? "on" : "off");
> +}
> +
> +static DEVICE_ATTR_RW(feat);
> +
> +static struct attribute *cnqf_feature_attrs[] = {
> +	&dev_attr_feat.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group cnqf_feature_attribute_group = {
> +	.attrs = cnqf_feature_attrs,
> +	.name = "cnqf"
> +};
> +
>  void amd_pmf_deinit_cnqf(struct amd_pmf_dev *dev)
>  {
>  	cancel_delayed_work_sync(&dev->work_buffer);
> +	sysfs_remove_group(&dev->dev->kobj, &cnqf_feature_attribute_group);
> +	kobject_uevent(&dev->dev->kobj, KOBJ_CHANGE);

Drop these 2 lines (see below).

>  }
>  
>  void amd_pmf_init_cnqf(struct amd_pmf_dev *dev)
> @@ -316,4 +371,6 @@ void amd_pmf_init_cnqf(struct amd_pmf_dev *dev)
>  	/* update the thermal for CnQF */
>  	src = amd_pmf_get_power_source();
>  	amd_pmf_set_cnqf(dev, src, config_store.current_mode, NULL);
> +	ret = sysfs_create_group(&dev->dev->kobj, &cnqf_feature_attribute_group);
> +	kobject_uevent(&dev->dev->kobj, KOBJ_CHANGE);
>  }

Manual sysfs attr registration like this is known to be racy. Please use
the .groups member of the driver struct instead to let the core handle this,
combined with an is_visible callback to hide the attribute on systems where
this is not supported.

See e.g. how thinkpad_acpi.c does this.


Regards,

Hans

