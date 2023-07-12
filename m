Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B923EB64D9
	for <platform-driver-x86@archiver.kernel.org>; Wed, 12 Jul 2023 14:48:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231921AbjGLOsZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 12 Jul 2023 10:48:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232073AbjGLOsV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Jul 2023 10:48:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 501E71992
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Jul 2023 07:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689173257;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EIuzB3x3+itiPANCeMD8GY8b1oc0WBnANtFmR+T6S8U=;
        b=LaFYtPsalA7KttDJafvebE0XNJPy7ZVDc7DCe3g+kr47CuojIWKdO0e5OCe7AE+c92a/p3
        P2oBpAaZgS/HW474RBj2o6ziYCA8Tj0ObObfEYnFjgBUWxFkooofQcbvxzsEaTQ7nd2Q5G
        EGlzF7amjHp/N+fI21zPwBL0Lq2P15c=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-106-U4IH9cTKPcadf9kqtvGhIA-1; Wed, 12 Jul 2023 10:47:31 -0400
X-MC-Unique: U4IH9cTKPcadf9kqtvGhIA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-98843cc8980so455273366b.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Jul 2023 07:47:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689173250; x=1691765250;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EIuzB3x3+itiPANCeMD8GY8b1oc0WBnANtFmR+T6S8U=;
        b=k+rfBobDpT6ZgQM1xq/uM3t8XphBxRtZWVysInlDzrfbF+sCmfC8pDzx7cbwdm9eId
         MTsPSpdp4dJuGVCq9E7UN2ufFyEQwmYJwHkRmA3bEqHssOpDq1rNLhrALOwDC2yfJYU0
         WXLPVhHfwZOTgVJgNfTqBWN7WWIIjzfXyha7xOCF2s6A1Wxf5FO13kNgMEP7gsBo55yk
         Jx67V9eQFdYocqh4MY/9jzqFiB8P5WF25c8PkKU4om9pfAcsPd7XjX8KZdfjW9uIwFd1
         J0wFolz9T652RrjsdOK0+I7nGHe8Acc/7u6Qk6BHGmU4rOhupQq9XuS3Jbc0BHkChquF
         zS2Q==
X-Gm-Message-State: ABy/qLaB0S6Yz+W1Ch5U5mcDfPNZmzXns/5Ze7mdxBf8Ohs0P4vX9KhM
        ke2uzpcKSGDEXbYi/Ydz6AgwvuTaiQeR1XTSBgQ2v+hZwxuEIl65dWS4wwYft00C2gnqYnCH393
        hF2wMAnHVR5b53x42/+8cWqw1WxW9kIRiYQ==
X-Received: by 2002:a17:906:af65:b0:994:34a2:8724 with SMTP id os5-20020a170906af6500b0099434a28724mr242711ejb.52.1689173250194;
        Wed, 12 Jul 2023 07:47:30 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGaWvX/O8w27SGpuJdmu612qxbMowaKIYLZTLJgaTMD9S3lDFGlByoIHJEs+K1fptL66r0HIQ==
X-Received: by 2002:a17:906:af65:b0:994:34a2:8724 with SMTP id os5-20020a170906af6500b0099434a28724mr242695ejb.52.1689173249925;
        Wed, 12 Jul 2023 07:47:29 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id m27-20020a1709060d9b00b009932337747esm2643633eji.86.2023.07.12.07.47.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 07:47:29 -0700 (PDT)
Message-ID: <7ad305d4-3acb-1447-bdbe-077c83972978@redhat.com>
Date:   Wed, 12 Jul 2023 16:47:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 6/8] platform/x86: asus-wmi: add safety checks to gpu
 switching
Content-Language: en-US, nl
To:     "Luke D. Jones" <luke@ljones.dev>
Cc:     corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, markgross@kernel.org,
        jdelvare@suse.com, linux@roeck-us.net
References: <20230630053552.976579-1-luke@ljones.dev>
 <20230630053552.976579-7-luke@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230630053552.976579-7-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/30/23 07:35, Luke D. Jones wrote:
> Add safety checking to dgpu_disable, egpu_enable, gpu_mux_mode.
> 
> These checks prevent users from doing such things as:
> - disabling the dGPU while is muxed to drive the internal screen
> - enabling the eGPU which also disables the dGPU, while muxed to
>   the internal screen
> - switching the MUX to dGPU while the dGPU is disabled
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> ---
>  drivers/platform/x86/asus-wmi.c | 50 ++++++++++++++++++++++++++++++++-
>  1 file changed, 49 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 821addb284d7..602426a7fb41 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -645,6 +645,18 @@ static ssize_t dgpu_disable_store(struct device *dev,
>  	if (disable > 1)
>  		return -EINVAL;
>  
> +	if (asus->gpu_mux_mode_available) {
> +		result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_GPU_MUX);
> +		if (result < 0)
> +			/* An error here may signal greater failure of GPU handling */
> +			return result;
> +		if (!result && disable) {
> +			err = -ENODEV;
> +			pr_warn("Can not disable dGPU when the MUX is in dGPU mode: %d\n", err);
> +			return err;
> +		}
> +	}
> +
>  	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_DGPU, disable, &result);
>  	if (err) {
>  		pr_warn("Failed to set dgpu disable: %d\n", err);
> @@ -693,7 +705,7 @@ static ssize_t egpu_enable_store(struct device *dev,
>  	if (enable > 1)
>  		return -EINVAL;
>  
> -	err = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_EGPU_CONNECTED);
> +	result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_EGPU_CONNECTED);
>  	if (err < 0)
>  		return err;
>  	if (err < 1) {

This seems like a stray and undesired change. I'll drop this err -> result change
when merging this.

Otherwise looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans





> @@ -702,6 +714,18 @@ static ssize_t egpu_enable_store(struct device *dev,
>  		return err;
>  	}
>  
> +	if (asus->gpu_mux_mode_available) {
> +		result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_GPU_MUX);
> +		if (result < 0)
> +			/* An error here may signal greater failure of GPU handling */
> +			return result;
> +		if (!result && enable) {
> +			err = -ENODEV;
> +			pr_warn("Can not enable eGPU when the MUX is in dGPU mode: %d\n", err);
> +			return err;
> +		}
> +	}
> +
>  	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_EGPU, enable, &result);
>  	if (err) {
>  		pr_warn("Failed to set egpu disable: %d\n", err);
> @@ -764,6 +788,30 @@ static ssize_t gpu_mux_mode_store(struct device *dev,
>  	if (optimus > 1)
>  		return -EINVAL;
>  
> +	if (asus->dgpu_disable_available) {
> +		result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_DGPU);
> +		if (result < 0)
> +			/* An error here may signal greater failure of GPU handling */
> +			return result;
> +		if (result && !optimus) {
> +			err = -ENODEV;
> +			pr_warn("Can not switch MUX to dGPU mode when dGPU is disabled: %d\n", err);
> +			return err;
> +		}
> +	}
> +
> +	if (asus->egpu_enable_available) {
> +		result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_EGPU);
> +		if (result < 0)
> +			/* An error here may signal greater failure of GPU handling */
> +			return result;
> +		if (result && !optimus) {
> +			err = -ENODEV;
> +			pr_warn("Can not switch MUX to dGPU mode when eGPU is enabled: %d\n", err);
> +			return err;
> +		}
> +	}
> +
>  	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_GPU_MUX, optimus, &result);
>  	if (err) {
>  		dev_err(dev, "Failed to set GPU MUX mode: %d\n", err);

