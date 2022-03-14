Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A1DC433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Mar 2022 10:44:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238614AbiCNKqA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Mar 2022 06:46:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238577AbiCNKp7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Mar 2022 06:45:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E8D9A11C1D
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Mar 2022 03:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647254689;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZoVQ0AXVr8aG/HH9D2u9q26FwHvM2Hm8c8iNh5koFjU=;
        b=Dko/0lZNj9up0DE8q8yFup9MG7T0nwS2jeHxq74SeYM/8PeJGuA+6b4zv9Tyth6ZplzIQA
        4LZRAdVoKNeVvHhsL3p4ouUgXR5ulwd5G+2szIjFTG8mrWHZftkZeyLwYGimjG5E3gjRJ7
        8y7mNoTK4q1YhDPn43bch2j5HpGhlhQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-1R8Q0wvbPBm6t-_8tFfjkg-1; Mon, 14 Mar 2022 06:44:47 -0400
X-MC-Unique: 1R8Q0wvbPBm6t-_8tFfjkg-1
Received: by mail-ej1-f70.google.com with SMTP id ga31-20020a1709070c1f00b006cec400422fso7719061ejc.22
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Mar 2022 03:44:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZoVQ0AXVr8aG/HH9D2u9q26FwHvM2Hm8c8iNh5koFjU=;
        b=UYau0ret3vNn/jCHxCvAd+XheTppZW2uCA14QdjwXcP8zt4/kBaR829Pa/06bnaWTS
         p/XuOeyiKi9KfIg+M7UAMFnj2XJuoinvclKaKEli8fJUUbFhiOO3eLggNMWMf6vrVs5Q
         sFixc0OHXYyaZCOr13rmeG3dTItbgXXN3JM9pcnIQA1FInZPXbGE9tiLuTuiYC15Lq20
         HHKwInOVhI8nN6rAkv4KGzRHqnR06tLVDXD0SCgIK8pvRHm/EeARs2o8InWx2wliz7yv
         q8yfEsOW6ZxvnSv/7gEd8exBKS/gto0DxgQJ/u4TUbBH7o4zLhjuEe15gYsfV8czp9KL
         oNPQ==
X-Gm-Message-State: AOAM532KntJJ+ffVg35InAGSZtza95/K6yeY0r4vP1TSE36QDfYKuGfs
        DfBjbwQI5BnCL/EFpc3ZitdAL5QKCZXrXsMfm3einUMN/8i/hYn0l5u4+fQkijhR0qYdXOf90Ck
        e9Y5lb6ZZqpbUGRKGSDgrph5BHDFM8udRog==
X-Received: by 2002:a17:907:76f7:b0:6d6:e922:3cd with SMTP id kg23-20020a17090776f700b006d6e92203cdmr19061440ejc.386.1647254685876;
        Mon, 14 Mar 2022 03:44:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxL9Vhx1pBIwSY1Fo03zWd+yYWUe/OaF8RDFoiSQaFdsUT5MZioEL0ISmz//OoeeBeF6kz+NA==
X-Received: by 2002:a17:907:76f7:b0:6d6:e922:3cd with SMTP id kg23-20020a17090776f700b006d6e92203cdmr19061427ejc.386.1647254685610;
        Mon, 14 Mar 2022 03:44:45 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id p24-20020a1709061b5800b006da6435cedcsm6564093ejg.132.2022.03.14.03.44.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Mar 2022 03:44:45 -0700 (PDT)
Message-ID: <c9448644-917a-76c1-b9c8-ef3aa08c57bd@redhat.com>
Date:   Mon, 14 Mar 2022 11:44:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v5 3/4] Fix 0x05 error code reported by several WMI calls
Content-Language: en-US
To:     Jorge Lopez <jorgealtxwork@gmail.com>,
        platform-driver-x86@vger.kernel.org
References: <20220310210853.28367-1-jorge.lopez2@hp.com>
 <20220310210853.28367-4-jorge.lopez2@hp.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220310210853.28367-4-jorge.lopez2@hp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/10/22 22:08, Jorge Lopez wrote:
> Several WMI queries leverage hp_wmi_read_int function to read their
> data. hp_wmi_read_int function was corrected in a previous patch.
> Now, this function invokes hp_wmi_perform_query with input parameter
> of size zero and the output buffer of size 4.
> 
> WMI commands calling hp_wmi_perform_query with input buffer size value
> of zero are listed below.
> 
> HPWMI_DISPLAY_QUERY
> HPWMI_HDDTEMP_QUERY
> HPWMI_ALS_QUERY
> HPWMI_HARDWARE_QUERY
> HPWMI_WIRELESS_QUERY
> HPWMI_BIOS_QUERY
> HPWMI_FEATURE_QUERY
> HPWMI_HOTKEY_QUERY
> HPWMI_FEATURE2_QUERY
> HPWMI_WIRELESS2_QUERY
> HPWMI_POSTCODEERROR_QUERY
> HPWMI_THERMAL_PROFILE_QUERY
> HPWMI_FAN_SPEED_MAX_GET_QUERY
> 
> Invoking those WMI commands with an input buffer size greater
> than zero will cause error 0x05 to be returned.
> 
> All WMI commands executed by the driver were reviewed and changes
> were made to ensure the expected input and output buffer size match
> the WMI specification.
> 
> Changes were validated on a HP ZBook Workstation notebook,
> HP EliteBook x360, and HP EliteBook 850 G8.  Additional
> validation was included in the test process to ensure no other
> commands were incorrectly handled.
> 
> Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

> 
> ---
> Based on the latest platform-drivers-x86.git/for-next
> ---
>  drivers/platform/x86/hp-wmi.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> index e9aa05c26a40..e76bd4bef6b5 100644
> --- a/drivers/platform/x86/hp-wmi.c
> +++ b/drivers/platform/x86/hp-wmi.c
> @@ -329,7 +329,7 @@ static int hp_wmi_get_fan_speed(int fan)
>  	char fan_data[4] = { fan, 0, 0, 0 };
>  
>  	int ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_GET_QUERY, HPWMI_GM,
> -				       &fan_data, sizeof(fan_data),
> +				       &fan_data, sizeof(char),
>  				       sizeof(fan_data));
>  
>  	if (ret != 0)
> @@ -399,7 +399,7 @@ static int omen_thermal_profile_set(int mode)
>  		return -EINVAL;
>  
>  	ret = hp_wmi_perform_query(HPWMI_SET_PERFORMANCE_MODE, HPWMI_GM,
> -				   &buffer, sizeof(buffer), sizeof(buffer));
> +				   &buffer, sizeof(buffer), 0);
>  
>  	if (ret)
>  		return ret < 0 ? ret : -EINVAL;
> @@ -436,7 +436,7 @@ static int hp_wmi_fan_speed_max_set(int enabled)
>  	int ret;
>  
>  	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_MAX_SET_QUERY, HPWMI_GM,
> -				   &enabled, sizeof(enabled), sizeof(enabled));
> +				   &enabled, sizeof(enabled), 0);
>  
>  	if (ret)
>  		return ret < 0 ? ret : -EINVAL;
> @@ -449,7 +449,7 @@ static int hp_wmi_fan_speed_max_get(void)
>  	int val = 0, ret;
>  
>  	ret = hp_wmi_perform_query(HPWMI_FAN_SPEED_MAX_GET_QUERY, HPWMI_GM,
> -				   &val, sizeof(val), sizeof(val));
> +				   &val, 0, sizeof(val));
>  
>  	if (ret)
>  		return ret < 0 ? ret : -EINVAL;
> @@ -461,7 +461,7 @@ static int __init hp_wmi_bios_2008_later(void)
>  {
>  	int state = 0;
>  	int ret = hp_wmi_perform_query(HPWMI_FEATURE_QUERY, HPWMI_READ, &state,
> -				       sizeof(state), sizeof(state));
> +				       0, sizeof(state));
>  	if (!ret)
>  		return 1;
>  
> @@ -472,7 +472,7 @@ static int __init hp_wmi_bios_2009_later(void)
>  {
>  	u8 state[128];
>  	int ret = hp_wmi_perform_query(HPWMI_FEATURE2_QUERY, HPWMI_READ, &state,
> -				       sizeof(state), sizeof(state));
> +				       0, sizeof(state));
>  	if (!ret)
>  		return 1;
>  
> @@ -550,7 +550,7 @@ static int hp_wmi_rfkill2_refresh(void)
>  	int err, i;
>  
>  	err = hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_READ, &state,
> -				   sizeof(state), sizeof(state));
> +				   0, sizeof(state));
>  	if (err)
>  		return err;
>  
> @@ -639,7 +639,7 @@ static ssize_t als_store(struct device *dev, struct device_attribute *attr,
>  		return ret;
>  
>  	ret = hp_wmi_perform_query(HPWMI_ALS_QUERY, HPWMI_WRITE, &tmp,
> -				       sizeof(tmp), sizeof(tmp));
> +				       sizeof(tmp), 0);
>  	if (ret)
>  		return ret < 0 ? ret : -EINVAL;
>  
> @@ -660,9 +660,9 @@ static ssize_t postcode_store(struct device *dev, struct device_attribute *attr,
>  	if (clear == false)
>  		return -EINVAL;
>  
> -	/* Clear the POST error code. It is kept until until cleared. */
> +	/* Clear the POST error code. It is kept until cleared. */
>  	ret = hp_wmi_perform_query(HPWMI_POSTCODEERROR_QUERY, HPWMI_WRITE, &tmp,
> -				       sizeof(tmp), sizeof(tmp));
> +				       sizeof(tmp), 0);
>  	if (ret)
>  		return ret < 0 ? ret : -EINVAL;
>  
> @@ -952,7 +952,7 @@ static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
>  	int err, i;
>  
>  	err = hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_READ, &state,
> -				   sizeof(state), sizeof(state));
> +				   0, sizeof(state));
>  	if (err)
>  		return err < 0 ? err : -EINVAL;
>  

