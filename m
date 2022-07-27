Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60599C04A68
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Jul 2022 20:52:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230046AbiG0UwZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Jul 2022 16:52:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbiG0UwZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Jul 2022 16:52:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5F6A75071D
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Jul 2022 13:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658955143;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FzDI56maoJN/D8p4GaLW8Pwo0uqMVrnlEqnsUfjM8C4=;
        b=a3YqGy3WCkpO2q8LTRp8MXrlxhrzCXbbuPqMtvJJbluFLU5Ba8no+YYOpnhoQOloOJH9cD
        iMf5WeOzXMoUk8fSthy+oi6PY8Sjkx73jIum4bjgMmu4Qgx69ZaYLMvbA4xtpbVo0h4tEH
        zFeMSoFKCrKrFXFT8KuQFiTPN3qX49Y=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-149-k6KbRX_aNdyxhRLKEdJSXw-1; Wed, 27 Jul 2022 16:52:20 -0400
X-MC-Unique: k6KbRX_aNdyxhRLKEdJSXw-1
Received: by mail-ej1-f72.google.com with SMTP id hr24-20020a1709073f9800b0072b57c28438so5356588ejc.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Jul 2022 13:52:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FzDI56maoJN/D8p4GaLW8Pwo0uqMVrnlEqnsUfjM8C4=;
        b=NX3qFiTNeCa/ECET5oSyMjsXXs6SUw5bs8WrBzGMkbUdouDGS4wm4ixHS3vSkWtKQl
         3YvRkPYXX5fzixXO0kzlgR6Z/VS/APfeqxiJ0ge+r8vHyZv4B9jxk9IgzvKBVVGoXL5E
         XsMF2WopquLGOP1FZNMGB7+ABa8uzf+pjLX3h/m/0C9l7lekvH4DNEM6k9i6xgVeh6X1
         Dejq2b0S+kK4/ruZxu/u7Vb51K9q02tB5RUjEt6Cnnk0Fi0eLHcLTe18/Za4M7zM3TKA
         Uv7UGmTkKyspGe7zpW695eNM5eJVZPMTlQz546xmciljFw1iqQ6nhdbaCWM+uJC3kGnP
         3n2Q==
X-Gm-Message-State: AJIora9+o7Ro0Cl1T0dEJ3p/F5acTACaabd2yYXNAlAzY3VB2976k0m/
        kAL8Cgeu3wz9dWv0foL7fysmKOnNwobKhLQmppmVtIG/F4gCcZeTeoiuD3dNgBnLYuybINGmpkc
        y9YN50xzw/8ql+3d+FVQ/9NVE3DxYFR/Fmg==
X-Received: by 2002:a05:6402:4511:b0:43b:a182:8a0a with SMTP id ez17-20020a056402451100b0043ba1828a0amr24966374edb.410.1658955139142;
        Wed, 27 Jul 2022 13:52:19 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ujq1eZxcRHmQPIJiJ0qH3lmWt7J9tQtrg2kLuknIUWMUSjM1qRM4RT/Yd97DrVbpARa8od0Q==
X-Received: by 2002:a05:6402:4511:b0:43b:a182:8a0a with SMTP id ez17-20020a056402451100b0043ba1828a0amr24966365edb.410.1658955138989;
        Wed, 27 Jul 2022 13:52:18 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id 10-20020a170906210a00b0072b33c0a831sm8107252ejt.17.2022.07.27.13.52.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 13:52:18 -0700 (PDT)
Message-ID: <85479b1e-08d2-49da-f9ba-894594270113@redhat.com>
Date:   Wed, 27 Jul 2022 22:52:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 10/15] platform/x86/amd/pmf: Add sysfs to toggle CnQF
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
 <20220712145847.3438544-11-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220712145847.3438544-11-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/12/22 16:58, Shyam Sundar S K wrote:
> Whether to turn CnQF on/off by default upon driver load would be decided
> by a BIOS flag. Add a sysfs node to provide a way to the user whether to
> use static slider or CnQF .
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/platform/x86/amd/pmf/cnqf.c | 52 +++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
> index 8c6756faab25..2b03ae1ad37f 100644
> --- a/drivers/platform/x86/amd/pmf/cnqf.c
> +++ b/drivers/platform/x86/amd/pmf/cnqf.c
> @@ -302,9 +302,59 @@ void amd_pmf_load_defaults_cnqf(struct amd_pmf_dev *dev)
>  		config_store.trans_prio[i] = i;
>  }
>  
> +static ssize_t feat_store(struct device *dev,
> +				  struct device_attribute *attr,
> +				  const char *buf, size_t count)
> +{
> +	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
> +	int result, src;
> +	bool enabled;
> +	u8 mode;
> +
> +	result = kstrtobool(buf, &enabled);
> +	if (result)
> +		return result;
> +
> +	src = amd_pmf_get_power_source();
> +	pdev->cnqf_feat = enabled;
> +	if (pdev->cnqf_feat) {
> +		amd_pmf_handle_cnqf(pdev, SLIDER_OP_SET, src, config_store.current_mode, NULL);
> +	} else {
> +		pdev->cnqf_running = false;
> +		mode = amd_pmf_get_pprof_modes(pdev);
> +		amd_pmf_update_slider(pdev, SLIDER_OP_SET, mode, NULL);
> +	}
> +
> +	dev_dbg(pdev->dev, "Received CnQF %s\n", enabled ? "on" : "off");
> +	return count;
> +}
> +
> +static ssize_t feat_show(struct device *dev,
> +				 struct device_attribute *attr,
> +				 char *buf)
> +{
> +	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
> +
> +	return sprintf(buf, "%s\n", pdev->cnqf_feat ? "on" : "off");
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
>  }
>  
>  void amd_pmf_init_cnqf(struct amd_pmf_dev *dev)
> @@ -324,4 +374,6 @@ void amd_pmf_init_cnqf(struct amd_pmf_dev *dev)
>  	/* update the thermal for CnQF */
>  	src = amd_pmf_get_power_source();
>  	amd_pmf_handle_cnqf(dev, SLIDER_OP_SET, src, config_store.current_mode, NULL);
> +	ret = sysfs_create_group(&dev->dev->kobj, &cnqf_feature_attribute_group);
> +	kobject_uevent(&dev->dev->kobj, KOBJ_CHANGE);
>  }

