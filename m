Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBDA295DA6
	for <platform-driver-x86@vger.kernel.org>; Wed,  1 Apr 2026 13:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775050991; cv=none; b=gX3bPYoX8KZWe6s9vSW7dHdbEaJapWK7A4LPegAtEN71GmA+v7WIhEbNH03SzNPa6ZKn8ElA9kV3jHNpdgjGW8ANicA1nP1j5i+klGRrZldOgrWDuGZrRgQss5s4j2gIaieSmZBizGX14ktczUGXlirbqIfAFreAlgTAbRYvb5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775050991; c=relaxed/simple;
	bh=D5jgMbHxDHIY7t+7Yd76DHHd2gJyUxeQVkjNoDrvzBA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=eUmibAGc/Vsti9zA887mXD5DAXW9AuwnMYmKpWftw+fFfBZ9kM8aR47VE2tCDglb9ti5AgF75PqCWtBzjsq/E10ZZlh7uQERE6Cutejupl5cwgMHYyP5VeRRWjKIeFtcav4v316gyrSNFSbykQDOdY4YlSyCtSqr2NiPRW/Ntvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UdKO355r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PxGP24Br; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UdKO355r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PxGP24Br"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631APatk3363191
	for <platform-driver-x86@vger.kernel.org>; Wed, 1 Apr 2026 13:43:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hUIPVjcWlrcf6XYVPDTiF+ZRk5nhSaJ5YYjvOx1mYdA=; b=UdKO355rh/57I8dR
	+/agpc0bD4V2kbFg6tS5S+f58vBdQq9d+47ZCh1lsfrhtYG5UtvBmAlbNMMn8tth
	rct3hPJD7A4C/IAeSdm426THw1WgItTCWFdFAxJ3cEZz8/W1DFGY/YsdqZZyGb1V
	a4ddRioHJtYM+iFohv0NVNlQ6HQL2rGMB1dUJGRPZITY5T12c3tpvD1tlNHyujoS
	draB1M5XtKs0v06RYbeLo1Nh18KjksZMbpqb/HT/bsUD2s0z5MmkkImZPoo3Dd4h
	id8PuiCu19DhvW6oAmT5naC1VCsNl3ysSa/ea6vOpTZlKCQefWiIiQGMXX+2rhbX
	I3XVkg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8nddkqrg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 01 Apr 2026 13:43:08 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4ca7e7c2so175347481cf.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Apr 2026 06:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775050988; x=1775655788; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hUIPVjcWlrcf6XYVPDTiF+ZRk5nhSaJ5YYjvOx1mYdA=;
        b=PxGP24Br3ZY11Q7WWlgPZGn51SsrrUk5s0seGSD2jisei0juQNOeoyFTVlsLkRi7wt
         WiM1XCOSnLw7LXyVUL/dlp3vF79vGX4D/hXWy9psX++ipMwuOE6ORQxHFAl7sJTA7VDB
         19YFU4U6xc2JshUaPyfR7hsASfUUIAB7Vg6JuDNa1wuM0QbMkhG8baOM+zHr1uX9KHmi
         f7TT1Nrztoi7n0cJ7nGJakUjD57fyiVcAKcMB+7QZLeoD5pCqETyh/w2QytO6HsGaPA0
         HfVJ1krsROi2TZ+eUisqOsiQ/7Dpt9wnnW3Kpv8LWKV566I8j2yuL4EoORdsWb/oZG18
         H9pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775050988; x=1775655788;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hUIPVjcWlrcf6XYVPDTiF+ZRk5nhSaJ5YYjvOx1mYdA=;
        b=PpEe1epAZBQP9c5/i4AKhnLOkE0TUkPQx+MaC+5GSZZzqafVDxJDo4dOPtnKPUPQwI
         jonGN64ycDbv/40ya/fUthRDhv7bb9/Dl3tMrxGNpYKBi/UfN5tXZkck7gSzM4+m9k86
         ceGpz8kp5UjnsFPvj19+2HZxrvlaUo0jDnddfxKr5XHATutMFwH6UACcht2RXTP1FRPN
         K+sAD+99VaDi0IW1vh6jDhK2WDHaOaGO54SIAoOpjnoF0bkXEtBhK6zRNLP1pzhYdV1q
         uVvmPRqoxKUu8TTMTDEtneOwI5peObOUglCyUU4nnnxUhW8EkluFIbj0iNqyeNy/8Q8F
         B5Ng==
X-Forwarded-Encrypted: i=1; AJvYcCW953PFc7D1eu1qwRabrcce4wsL/IZPGDszfXOFtyZt37xfGenlk0JQPF4clxLmQjQNxTTQ2Wgcog8OiESBOy++8sTd@vger.kernel.org
X-Gm-Message-State: AOJu0YyN/6XccYY0kFh0wZblaFQJaKTBuLQ7uDbjbpAlch1u1zu6tD2Z
	ATkwkNHVz5m9uLOJPBsuWZS90mHrV09/LqOeaUbP0Bzve3eiQd9QRSQ1Bq8OhGgS5wOkxoy7+BC
	FyNUQcaIm0sYW7ZBPEPjlD8HlN6truIV/8jpeL0MXt5U9+oon9kG4wFmYGI4GbNzejM9/XqPFu+
	oL
X-Gm-Gg: ATEYQzzKOaNUQPT6zfi6RMkNauGDxcKBxSgN06RwTu+UPkYAEqdCLcwAKtNa6NJHx86
	JJiPAL7LqFl/ZKjjpQ1AFm01jds/eu52ruLQqXURc9tqVoRw/t+RwfWiw24mi8rjo4QUnGBXo6X
	JIz10FaUmEaZO+DQF4pQjtJ/iUAfGIr4CRN/PhsBnTZh3zOKC4rpJr9v9MBKw9d2I10hOsbf3V/
	4zmahdLHVkDt3qa75a73tpzfbEZra30FdYbcej9S2gq1O2oRCGQk3XMHlzpXfxlaw4sxrphh/EE
	AlzGtICiepXGdjuhX0ZCQV+OdlODumsQaTPO62TQs1p2B9ydxw3yh8zyDM7RSZCBIUI8tPuniDN
	EZzr0/rHqAZJaaVvrGDbfullABaYKu/xo9bghN3xAp7znVPRNMSV4fvjAPWja4Qvv8DMsd4u5Px
	uH/6gaHLoiDKAZ2hagbXaKYSLltiQSryXXFJZT1qC+k2ZFhEi2PjPJR8Y5ShIl9c5ku0sv+W9Fw
	56kRbhts18V7O/s
X-Received: by 2002:ac8:6f0d:0:b0:509:764:2f02 with SMTP id d75a77b69052e-50d3bd4efb7mr45810081cf.45.1775050988100;
        Wed, 01 Apr 2026 06:43:08 -0700 (PDT)
X-Received: by 2002:ac8:6f0d:0:b0:509:764:2f02 with SMTP id d75a77b69052e-50d3bd4efb7mr45809311cf.45.1775050987443;
        Wed, 01 Apr 2026 06:43:07 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b72978cf2sm4570353a12.8.2026.04.01.06.43.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 06:43:06 -0700 (PDT)
Message-ID: <e2102cf7-e507-4a37-b066-e013a910d49a@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 15:43:03 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v7 3/4] platform/x86: int3472: Parameterize LED con_id in
 registration
To: Marco Nenciarini <mnencia@kcore.it>, Daniel Scally <djrscally@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260331134443.1573053-1-mnencia@kcore.it>
 <20260331134443.1573053-4-mnencia@kcore.it>
Content-Language: en-US, nl
In-Reply-To: <20260331134443.1573053-4-mnencia@kcore.it>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZfUQ98VA c=1 sm=1 tr=0 ts=69cd20ec cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=QyXUC8HyAAAA:8 a=-tpAEyCbxdYnABoJukIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: WlyAhCMVkyFVxX85hMRpQrihsZGKGTtl
X-Proofpoint-ORIG-GUID: WlyAhCMVkyFVxX85hMRpQrihsZGKGTtl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEyNyBTYWx0ZWRfX19lBuPmLKIDr
 rtBxGKX8K6xK39NKUcebrfNryYc4+1ww5h09nwoqIcJubsPnYYM+e/1rNXZt8aTEDQHoJRO6Mqj
 OxmmaNekvrghm7nCj3REcTcqe/9Q9JwZHmHIDJwasiW+UFNOpV2dlMnxgJLtfCus2rV9u/y/ogB
 qbV+TzxrZFiQDsV6EYApgFoD4S351OQbaax9nCIl/mhexMlyljq9HsJ7zvy5M8GxAAvuMXfWQBw
 rrxLSYhfitvjyvNNy12W+TP89AX0NERwSAeLtESunML3LMGGZh7s2bVObyBvCjHnSyq6XSkzD9+
 Vdw4aDYVuDIbhwkiW8gO61nbx7ZI/VEz+tc3ebCy8mOV88Bv++BFLskzp54gX4WgQDg9/ngr3bb
 esRrLttWSFHcdP/AJbRbUZyRfFbQXDXYJLiuaAx1oJEwhdm1MpCHTc4apyHcQUJTjFG8Z9Tykco
 wbLbJ8iqyAaD6/9ml4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010127

Hi,

On 31-Mar-26 15:44, Marco Nenciarini wrote:
> Add a con_id parameter to skl_int3472_register_led() to allow callers
> to specify both the LED name suffix and lookup con_id instead of
> hardcoding "privacy". This prepares for registering additional LED
> types with different names.
> 
> While at it, rename the privacy LED's GPIO con_id from "privacy-led"
> to "privacy" in int3472_get_con_id_and_polarity() and pass it
> directly to skl_int3472_register_led(), reducing churn when adding
> new LED types.
> 
> No functional change.
> 
> Signed-off-by: Marco Nenciarini <mnencia@kcore.it>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



> ---
> 
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>  drivers/platform/x86/intel/int3472/discrete.c | 4 ++--
>  drivers/platform/x86/intel/int3472/led.c      | 7 ++++---
>  include/linux/platform_data/x86/int3472.h     | 3 ++-
>  3 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index cb24763..a45a930 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -212,7 +212,7 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
>  		*gpio_flags = GPIO_ACTIVE_HIGH;
>  		break;
>  	case INT3472_GPIO_TYPE_PRIVACY_LED:
> -		*con_id = "privacy-led";
> +		*con_id = "privacy";
>  		*gpio_flags = GPIO_ACTIVE_HIGH;
>  		break;
>  	case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
> @@ -348,7 +348,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  
>  			break;
>  		case INT3472_GPIO_TYPE_PRIVACY_LED:
> -			ret = skl_int3472_register_led(int3472, gpio);
> +			ret = skl_int3472_register_led(int3472, gpio, con_id);
>  			if (ret)
>  				err_msg = "Failed to register LED\n";
>  
> diff --git a/drivers/platform/x86/intel/int3472/led.c b/drivers/platform/x86/intel/int3472/led.c
> index fe412cb..22d0d6c 100644
> --- a/drivers/platform/x86/intel/int3472/led.c
> +++ b/drivers/platform/x86/intel/int3472/led.c
> @@ -14,7 +14,8 @@ static int int3472_led_set(struct led_classdev *led_cdev, enum led_brightness br
>  	return 0;
>  }
>  
> -int skl_int3472_register_led(struct int3472_discrete_device *int3472, struct gpio_desc *gpio)
> +int skl_int3472_register_led(struct int3472_discrete_device *int3472, struct gpio_desc *gpio,
> +			     const char *con_id)
>  {
>  	struct int3472_led *led = &int3472->led;
>  	char *p;
> @@ -27,7 +28,7 @@ int skl_int3472_register_led(struct int3472_discrete_device *int3472, struct gpi
>  
>  	/* Generate the name, replacing the ':' in the ACPI devname with '_' */
>  	snprintf(led->name, sizeof(led->name),
> -		 "%s::privacy_led", acpi_dev_name(int3472->sensor));
> +		 "%s::%s_led", acpi_dev_name(int3472->sensor), con_id);
>  	p = strchr(led->name, ':');
>  	if (p)
>  		*p = '_';
> @@ -42,7 +43,7 @@ int skl_int3472_register_led(struct int3472_discrete_device *int3472, struct gpi
>  
>  	led->lookup.provider = led->name;
>  	led->lookup.dev_id = int3472->sensor_name;
> -	led->lookup.con_id = "privacy";
> +	led->lookup.con_id = con_id;
>  	led_add_lookup(&led->lookup);
>  
>  	return 0;
> diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
> index 7af6731..3ba0d56 100644
> --- a/include/linux/platform_data/x86/int3472.h
> +++ b/include/linux/platform_data/x86/int3472.h
> @@ -160,7 +160,8 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
>  				   const char *second_sensor);
>  void skl_int3472_unregister_regulator(struct int3472_discrete_device *int3472);
>  
> -int skl_int3472_register_led(struct int3472_discrete_device *int3472, struct gpio_desc *gpio);
> +int skl_int3472_register_led(struct int3472_discrete_device *int3472, struct gpio_desc *gpio,
> +			     const char *con_id);
>  void skl_int3472_unregister_led(struct int3472_discrete_device *int3472);
>  
>  #endif

