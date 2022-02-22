Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A89A7C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Feb 2022 16:22:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbiBVQW6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Feb 2022 11:22:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbiBVQW5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Feb 2022 11:22:57 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C2753985AB
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Feb 2022 08:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645546947;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rH3KhPQ5CQNPunsWJjNZRkr5GRYQnjL4cEYB1mz3YgE=;
        b=dlvKxU69V16hsxUIjWH80uaUuP31VhW9gvU/oO2T5umw+OqQ1dvm0DYSx3cYsxFNfUwaC8
        oMn7foXq6cv7kjGwgXPmHrq9fXSmO2L0K6CFP+zt+Olzndu3fb2ZWqrakK8cK2gsi0DweP
        J8PX90ziW84DJmhKYhPqn+rQ0pVl8Vs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-QjakKFJxNeKeehsRZ2aFUg-1; Tue, 22 Feb 2022 11:22:26 -0500
X-MC-Unique: QjakKFJxNeKeehsRZ2aFUg-1
Received: by mail-ed1-f72.google.com with SMTP id g5-20020a056402090500b0040f28e1da47so12278926edz.8
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Feb 2022 08:22:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rH3KhPQ5CQNPunsWJjNZRkr5GRYQnjL4cEYB1mz3YgE=;
        b=w5jzo6wIfpPC+2jU6av6sSroHynULMOCKU1NCcl6Rd5UFR0uCKkAOClckc6PuI3XVo
         7ovQ8CvFEMnVVUxRWCo0GCkF9Kp1kwB1qGGJzZfap860ZvfazIG4MoOcyDLVJeyK19Yw
         Edkw1+ywPd8sLyFltpxFOH9996hglcPJBRgftTWje2A/hmWhcCCr6+0XJKqgjaDzFY5R
         iISsdNpFvc3gKiAjKbcwIxvw91Cf2sCYSr84wmywFJPiaHa27prs7t3y8ny2oR4vEUN1
         OeTiJpApFVmIIE+UIy0sxS+NozRKXDKUZuA5ToqBjiS82U3w32Stb1B1c9HC3F5H9zby
         6JJQ==
X-Gm-Message-State: AOAM533FVtfYBrTqoNXGjqhVSWbHNItvdMBisomEgwc+zP/IlWFtOk8r
        vYzAnW9om2W88rg8G4fMKCLkgCS91kkWgVR9UXfv4krD4JEFforGjbToUK8fR8we8IMfVo7IzTJ
        oipJfo8YuQef5zH9A8sLSA134RZZL4q1SNA==
X-Received: by 2002:a05:6402:742:b0:410:a427:3634 with SMTP id p2-20020a056402074200b00410a4273634mr27381195edy.304.1645546944695;
        Tue, 22 Feb 2022 08:22:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw/eh6bl6nbxjfNSFNiFKQzg1ZxmIUGwe4BpgteNkA8Jz7Ig7F4bIN1VUpjGAunQrfLD3SNBA==
X-Received: by 2002:a05:6402:742:b0:410:a427:3634 with SMTP id p2-20020a056402074200b00410a4273634mr27381176edy.304.1645546944454;
        Tue, 22 Feb 2022 08:22:24 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id x12sm10048656edv.57.2022.02.22.08.22.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Feb 2022 08:22:24 -0800 (PST)
Message-ID: <4f2b4a16-8572-ee8f-d507-707fbd51c3e6@redhat.com>
Date:   Tue, 22 Feb 2022 17:22:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 2/3] Fix 0x05 error code reported by several WMI calls
Content-Language: en-US
To:     Jorge Lopez <jorgealtxwork@gmail.com>,
        platform-driver-x86@vger.kernel.org
References: <20220218160907.3422-1-jorge.lopez2@hp.com>
 <20220218160907.3422-3-jorge.lopez2@hp.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220218160907.3422-3-jorge.lopez2@hp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/18/22 17:09, Jorge Lopez wrote:
> Several WMI queries leverage hp_wmi_read_int function to read their data.
> hp_wmi_read_int function returns the appropiate value if the WMI command
> requires an input and output buffer size values greater than zero.
> WMI queries such HPWMI_HARDWARE_QUERY, HPWMI_WIRELESS2_QUERY,
> HPWMI_FEATURE2_QUERY, HPWMI_DISPLAY_QUERY, HPWMI_ALS_QUERY, and
> HPWMI_POSTCODEERROR_QUERY requires calling hp_wmi_perform_query function
> with input buffer size value of zero.  Any input buffer size greater
> than zero will cause error 0x05 to be returned.
> 
> All changes were validated on a ZBook Workstation notebook. Additional
> validation was included to ensure no other commands were failing or
> incorrectly handled.
> 
> Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

So after this the only remaining callers of hp_wmi_read_int() are:

1. hp_wmi_notify() case HPWMI_BEZEL_BUTTON
2. hp_wmi_rfkill_setup()
3. thermal_profile_get()

Where 2. looks like you just forgot to convert it since it
does a hp_wmi_read_int(HPWMI_WIRELESS_QUERY) which you do
convert in the hp_wmi_get_sw_state() and hp_wmi_get_hw_state()
helpers, suggesting that it should be converted in
hp_wmi_rfkill_setup() too.

This leaves just 1 and 3. So IMHO it would be better to
fix hp_wmi_read_int() and if 1. and 3. indeed need the old
behavior convert them to call hp_wmi_perform_query() directly.

Regards,

Hans



> 
> ---
> Based on the latest platform-drivers-x86.git/for-next
> ---
>  drivers/platform/x86/hp-wmi.c | 64 ++++++++++++++++++++++++-----------
>  1 file changed, 44 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> index 544fce906ce7..de715687021a 100644
> --- a/drivers/platform/x86/hp-wmi.c
> +++ b/drivers/platform/x86/hp-wmi.c
> @@ -442,7 +442,7 @@ static int __init hp_wmi_bios_2009_later(void)
>  {
>  	u8 state[128];
>  	int ret = hp_wmi_perform_query(HPWMI_FEATURE2_QUERY, HPWMI_READ, &state,
> -				       sizeof(state), sizeof(state));
> +				       0, sizeof(state));
>  	if (!ret)
>  		return 1;
>  
> @@ -477,25 +477,37 @@ static const struct rfkill_ops hp_wmi_rfkill_ops = {
>  static bool hp_wmi_get_sw_state(enum hp_wmi_radio r)
>  {
>  	int mask = 0x200 << (r * 8);
> +	int ret= 0;
> +	int wireless = 0;
> +
> +	ret = hp_wmi_perform_query(HPWMI_WIRELESS_QUERY, HPWMI_READ, &wireless,
> +				   0, sizeof(wireless));
>  
> -	int wireless = hp_wmi_read_int(HPWMI_WIRELESS_QUERY);
> +	if (ret < 0)
> +	  return -EINVAL;
>  
>  	/* TBD: Pass error */
>  	WARN_ONCE(wireless < 0, "error executing HPWMI_WIRELESS_QUERY");
>  
> -	return !(wireless & mask);
> +	return (wireless & mask);
>  }
>  
>  static bool hp_wmi_get_hw_state(enum hp_wmi_radio r)
>  {
>  	int mask = 0x800 << (r * 8);
> +	int ret= 0;
> +	int wireless = 0;
>  
> -	int wireless = hp_wmi_read_int(HPWMI_WIRELESS_QUERY);
> +	ret = hp_wmi_perform_query(HPWMI_WIRELESS_QUERY, HPWMI_READ, &wireless,
> +				   0, sizeof(wireless));
> +
> +	if (ret < 0)
> +	  return -EINVAL;
>  
>  	/* TBD: Pass error */
>  	WARN_ONCE(wireless < 0, "error executing HPWMI_WIRELESS_QUERY");
>  
> -	return !(wireless & mask);
> +	return (wireless & mask);
>  }
>  
>  static int hp_wmi_rfkill2_set_block(void *data, bool blocked)
> @@ -520,7 +532,7 @@ static int hp_wmi_rfkill2_refresh(void)
>  	int err, i;
>  
>  	err = hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_READ, &state,
> -				   sizeof(state), sizeof(state));
> +				   0, sizeof(state));
>  	if (err)
>  		return err;
>  
> @@ -546,27 +558,36 @@ static int hp_wmi_rfkill2_refresh(void)
>  static ssize_t display_show(struct device *dev, struct device_attribute *attr,
>  			    char *buf)
>  {
> -	int value = hp_wmi_read_int(HPWMI_DISPLAY_QUERY);
> -	if (value < 0)
> -		return value;
> +	int value = 0;
> +	int ret  = hp_wmi_perform_query(HPWMI_DISPLAY_QUERY, HPWMI_READ, &value,
> +				   0, sizeof(value));
> +	if (ret)
> +		return ret < 0 ? ret : -EINVAL;
> +
>  	return sprintf(buf, "%d\n", value);
>  }
>  
>  static ssize_t hddtemp_show(struct device *dev, struct device_attribute *attr,
>  			    char *buf)
>  {
> -	int value = hp_wmi_read_int(HPWMI_HDDTEMP_QUERY);
> -	if (value < 0)
> -		return value;
> +	int value = 0;
> +	int ret  = hp_wmi_perform_query(HPWMI_HDDTEMP_QUERY, HPWMI_READ, &value,
> +				   0, sizeof(value));
> +	if (ret)
> +		return ret < 0 ? ret : -EINVAL;
> +
>  	return sprintf(buf, "%d\n", value);
>  }
>  
>  static ssize_t als_show(struct device *dev, struct device_attribute *attr,
>  			char *buf)
>  {
> -	int value = hp_wmi_read_int(HPWMI_ALS_QUERY);
> -	if (value < 0)
> -		return value;
> +	int value = 0;
> +	int ret  = hp_wmi_perform_query(HPWMI_ALS_QUERY, HPWMI_READ, &value,
> +				   0, sizeof(value));
> +	if (ret)
> +		return ret < 0 ? ret : -EINVAL;
> +
>  	return sprintf(buf, "%d\n", value);
>  }
>  
> @@ -592,9 +613,12 @@ static ssize_t postcode_show(struct device *dev, struct device_attribute *attr,
>  			     char *buf)
>  {
>  	/* Get the POST error code of previous boot failure. */
> -	int value = hp_wmi_read_int(HPWMI_POSTCODEERROR_QUERY);
> -	if (value < 0)
> -		return value;
> +	int value = 0;
> +	int ret  = hp_wmi_perform_query(HPWMI_POSTCODEERROR_QUERY, HPWMI_READ, &value,
> +				   0, sizeof(value));
> +	if (ret)
> +		return ret < 0 ? ret : -EINVAL;
> +
>  	return sprintf(buf, "0x%x\n", value);
>  }
>  
> @@ -609,7 +633,7 @@ static ssize_t als_store(struct device *dev, struct device_attribute *attr,
>  		return ret;
>  
>  	ret = hp_wmi_perform_query(HPWMI_ALS_QUERY, HPWMI_WRITE, &tmp,
> -				       sizeof(tmp), sizeof(tmp));
> +				   sizeof(tmp), 0);
>  	if (ret)
>  		return ret < 0 ? ret : -EINVAL;
>  
> @@ -922,7 +946,7 @@ static int __init hp_wmi_rfkill2_setup(struct platform_device *device)
>  	int err, i;
>  
>  	err = hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_READ, &state,
> -				   sizeof(state), sizeof(state));
> +				   0, sizeof(state));
>  	if (err)
>  		return err < 0 ? err : -EINVAL;
>  

