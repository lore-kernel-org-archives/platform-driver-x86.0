Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE08237F720
	for <platform-driver-x86@vger.kernel.org>; Fri,  3 Apr 2026 10:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775212050; cv=none; b=ICwzpHrpd4i9Z9rL99A6LxqGL+j1BmXMtvFaMilh/St9IdeW8Y2vqqMKL0jiNx6g1BMNSBL44S9KMxyws1QECo9rYbiycgD+S40HB/nThUKiYayZE4HHwFvEoM6JU9QN3TeLwmQL3wUEFb9WO0RRIrLFckcgEaORhofgRwVJDsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775212050; c=relaxed/simple;
	bh=NuE6ubC5OBpBpgi4ZRheJFgyhAoO0uBmhiE5w1qglSs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=XwM4xB2pHS55NJ6/Bx4x7tRo2Wp9J6tEo9L4rhU+fCX8K1Ixoreln3N25k2iMheZ58eo4XLgAJ31n38J0Gp3p8mC1mgbcNKqUXtacZq8SlpVrJFe1IcuWTxgG7qSjMDOm0aDAwmStmUng8YAFe1kTtJLKr4+FYXJypziw9dyrCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ctz8kXrA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WSNDCKkM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ctz8kXrA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WSNDCKkM"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6336ujaY947644
	for <platform-driver-x86@vger.kernel.org>; Fri, 3 Apr 2026 10:27:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	67Cbv6bBozzrjmoDqWSMuoSXU7QRAu5a2NdofA5VJM8=; b=Ctz8kXrAet9Y+wXm
	XURCQIs/hhXHVZwMmSLjPJQ7shSs7P+1jMSYOa+ol+l2c/YAJdw+MPYXOg58I/bJ
	3E2YJKF7o7ZuLseGfoHZ4JUY4xSISvRC1HdjH7trclQ/yT53hKb9ZRJO2VaV9/W7
	ubtueUGlflg44YDiioJjzrqSyJev1I3kOhTowX7SyqsUHCS7jDIiaXJ7YbELW6np
	OEZnQip+QIIFjHhKWe0IeumvwoG5+IDA7MF+YJ4L70JjsyYMHclzzngfGuHZtgtq
	43SL+IMoqjkM3HDCY3TsBuNq/rxgf4t5B0HZ2coRQjUpXgwMkk0Ln4H96K6qfylk
	nNu6EA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9xwfj81b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Fri, 03 Apr 2026 10:27:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5093a985e21so47055781cf.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Apr 2026 03:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775212047; x=1775816847; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=67Cbv6bBozzrjmoDqWSMuoSXU7QRAu5a2NdofA5VJM8=;
        b=WSNDCKkMXesw4ZA3VftVu0Mmdh90ahzsEnm8Wjtk8sIZprPnV80Hh2B7zoKwgxHfDb
         cuR6WGsn7Ab8iuVzW+h6Q0Rr1IkJGtpPfoUzfKhLrbPWWvvcHHVHUA0FF9L1QErcdYmC
         gK9+v2cUDp0S+Kb5kepYMrjjTfmdIQ/g08PhEnn9/fOcmzNgyYPs3X3QY1SFKcZTgZkT
         6tjsriyv32NbPeC9XWk1FvbeiouX3kEOcV3QKrJJCpbpaddji97qmyV54dHXYpatl8Ce
         SDfPaGpKgMOaN04dDXx0GTAPqG5ALlI+WLiglHx2ijrgko8FFByngegSZlO8c3ZA0Djx
         yuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775212047; x=1775816847;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=67Cbv6bBozzrjmoDqWSMuoSXU7QRAu5a2NdofA5VJM8=;
        b=B1D0oZ/99cQ07mJng1f/k3ADVYGiKNClVa59ymQVU4i/Q24RmOvTEQtUN9M3gXYrHa
         GaPVkpu7+q7m8CrnM8QIgT73jzE0Zdrzqd8RZBg8KmoD8HI14CH6yc3ZQhH3IUPX3hib
         7RJrCUzDwFMfsLologFUh+EmSzH0uIX1khS3diGTNwKZi3yf+lgm6CstHOOn8wOQ0aG1
         A5KMlv4oipu+HjFAB+UxosND1WfNU/eSwzFBUTDYAODm2v1WIqGjbeyBDjoP8p8Hjco0
         Q/yHz9itXvaLZ8yL1KbZ5K1msP7R3X1/QQvYO2s8RYa+oci1TFFykYTNOT1obms7aXQ/
         M1ZA==
X-Forwarded-Encrypted: i=1; AJvYcCW8Ok3Ecs5OelPKWtAtSWOnrm0l+iVYXe7vk+W6oVG26BfzLm49gD2UruiOdxzk9y1UY1MZT3KDwVWl04tA8N7zzLpS@vger.kernel.org
X-Gm-Message-State: AOJu0YwOwbVy7MzKs4sNoZEp1AkuR4OFcWt+Ug7FE0m5su6ThP+a8kNt
	nk4A6G0x0ADmW6se3Pm1ReKLo1s5HncVmDlb6tlpt0WG+onsd/l+ayqNUndWKCKLxECbn9BCFL/
	vvibhQ3vEQXBVqPBuaj0ZfF4xjGC7taQWJPkXJ26mkzE5HsSkqN1mWhyuLK4yDaBuwaaVcRNbJH
	2G
X-Gm-Gg: ATEYQzy+i3ZJZQs7HI008W67qaT8ocMmLHqQhONf3zQ6xSIUUfNdGiE6I68gbTzvePk
	S3taAYPMJqc6zwdXW6i/VYQE76qCHZxwfXRC7SV0mryo5yX+AMyRMUcTO9fgpVxXQrw6Al5BwSc
	a2Hk/whilFFTyD+JbNwtdyoyIBLrtTLiaJx8NLRQkF7wCz1hNlNhfBrPlJbB21yDNmHukZT9MdH
	bknsDKqqju6Ocr+6jOKFnNQF6J1gy9tJQP41uxbC50xMXGi5TlgzFAVcHNEZNhdiz6tD3q7DmYu
	GVyZdLRiT8EsQt+hJIoHJctSrz1jG2P+LsmIzUt4W0dp7zsHSF0/YHEtt7FG4tqK2xEo0IhtI0O
	LONbSoSIT3SltpUsXeiHoCQ09fqELm+B1jbNbRjXSGygpYtdK/SZy7JShxhj1yISjgirf0Ur8s1
	BYnDiwy9ELdjAVfsUv0NAWUMjdQrnZXecJeGUJuWBdpI5Wa4aQUyrV3+VcDSjcpIt2QESAPugoq
	fA1fb7x3shWM8Xw
X-Received: by 2002:a05:622a:60c:b0:50b:829e:44fe with SMTP id d75a77b69052e-50d62a95f68mr36996611cf.37.1775212047093;
        Fri, 03 Apr 2026 03:27:27 -0700 (PDT)
X-Received: by 2002:a05:622a:60c:b0:50b:829e:44fe with SMTP id d75a77b69052e-50d62a95f68mr36996271cf.37.1775212046636;
        Fri, 03 Apr 2026 03:27:26 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e02d37620sm1490528a12.2.2026.04.03.03.27.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 03:27:24 -0700 (PDT)
Message-ID: <f5d79610-892b-439a-8f79-9b8e18007183@oss.qualcomm.com>
Date: Fri, 3 Apr 2026 12:27:22 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v8 4/4] platform/x86: int3472: Add support for GPIO type
 0x02 (IR flood LED)
To: Marco Nenciarini <mnencia@kcore.it>, Daniel Scally <djrscally@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260401203638.1601661-1-mnencia@kcore.it>
 <20260401203638.1601661-5-mnencia@kcore.it>
Content-Language: en-US, nl
In-Reply-To: <20260401203638.1601661-5-mnencia@kcore.it>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oKyArU-KMgeJnMC2nISL9zuiIaJrhy1B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA5MiBTYWx0ZWRfX8npBwcTyNruk
 sDc4dE0ax6OrlaxFW1lr58LUDE2h9Ekog07QENTO6eoD49TOtmSuQiiL6Y5X6m5aBggJhPWOzNd
 yTnqe9fCHtqR9fKvlmA8bB6FElhbAw9KOOpqZpF/VqH9hQdee6PGp8CAgjldp9iMq7T3y+mcjsz
 aXxITNjgjDG0zRX8EV7B1inPYoP1h0SXgjZP6lHgpLV2K4NoEnrSqnEEoTHWia7jGdcXfgV+pQv
 XScvQVm4oEjs717C9o5oyiy1Si4F0avNHNTLLkcZzWf9pWs3/omUcwJiZdv4vAlC8LBAzDnCDX6
 0QGMip4bfU17EghgeuyVWxCULYiQuBBT5scVgs1udIvXasx4t3Imhx9FaEf4pbuVPiBJRgoQhqb
 X8d+d5PccaoTuHW8JJMdk0vlxKE9ngKU+00nfUGb8aytrUrXj2cMw44tGFjT9VZe/fcBiPo7pH1
 TdHMFcuW31sZigBYOQw==
X-Proofpoint-ORIG-GUID: oKyArU-KMgeJnMC2nISL9zuiIaJrhy1B
X-Authority-Analysis: v=2.4 cv=fOo0HJae c=1 sm=1 tr=0 ts=69cf9610 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=QyXUC8HyAAAA:8 a=u9bSReISK_ZUcUW8qfUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030092

Hi,

On 1-Apr-26 22:36, Marco Nenciarini wrote:
> Add support for GPIO type 0x02, which controls an IR flood LED used
> for face authentication on some laptops (e.g. Dell Pro Max 16 Premium).
> 
> Without this patch, the kernel logs "GPIO type 0x02 unknown; the sensor
> may not work" and IR sensors paired with a flood LED cannot function.
> 
> The flood LED is registered through the LED subsystem like the existing
> privacy LED, including a lookup entry to allow future consumer drivers
> to find and control it via led_get().
> 
> To support multiple LEDs per INT3472 device, convert the single led
> struct member to an array with a counter.
> 
> Signed-off-by: Marco Nenciarini <mnencia@kcore.it>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans


> ---
> Changes in v8:
> - Always register the LED lookup for ir_flood too, removing the type
>   parameter and conditional switch-case (Hans de Goede, Andy Shevchenko).
> 
> The ACPI _DSM tables refer to this GPIO type as "strobe", hence the
> INT3472_GPIO_TYPE_STROBE define. The userspace-visible LED name uses
> "ir_flood" instead, as the hardware is an IR flood illuminator, not a
> flash strobe.
> 
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>
>  drivers/platform/x86/intel/int3472/discrete.c |  9 +++++++-
>  drivers/platform/x86/intel/int3472/led.c      | 23 ++++++++++---------
>  include/linux/platform_data/x86/int3472.h     |  7 ++++--
>  3 files changed, 25 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index a45a93093..a675e8f4c 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -215,6 +215,10 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
>  		*con_id = "privacy";
>  		*gpio_flags = GPIO_ACTIVE_HIGH;
>  		break;
> +	case INT3472_GPIO_TYPE_STROBE:
> +		*con_id = "ir_flood";
> +		*gpio_flags = GPIO_ACTIVE_HIGH;
> +		break;
>  	case INT3472_GPIO_TYPE_HOTPLUG_DETECT:
>  		*con_id = "hpd";
>  		*gpio_flags = GPIO_ACTIVE_HIGH;
> @@ -248,6 +252,7 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
>   *
>   * 0x00 Reset
>   * 0x01 Power down
> + * 0x02 Strobe
>   * 0x0b Power enable
>   * 0x0c Clock enable
>   * 0x0d Privacy LED
> @@ -331,6 +336,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  		break;
>  	case INT3472_GPIO_TYPE_CLK_ENABLE:
>  	case INT3472_GPIO_TYPE_PRIVACY_LED:
> +	case INT3472_GPIO_TYPE_STROBE:
>  	case INT3472_GPIO_TYPE_POWER_ENABLE:
>  	case INT3472_GPIO_TYPE_HANDSHAKE:
>  		gpio = skl_int3472_gpiod_get_from_temp_lookup(int3472, agpio, con_id, gpio_flags);
> @@ -348,6 +354,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  
>  			break;
>  		case INT3472_GPIO_TYPE_PRIVACY_LED:
> +		case INT3472_GPIO_TYPE_STROBE:
>  			ret = skl_int3472_register_led(int3472, gpio, con_id);
>  			if (ret)
>  				err_msg = "Failed to register LED\n";
> @@ -422,7 +429,7 @@ void int3472_discrete_cleanup(struct int3472_discrete_device *int3472)
>  	gpiod_remove_lookup_table(&int3472->gpios);
>  
>  	skl_int3472_unregister_clock(int3472);
> -	skl_int3472_unregister_led(int3472);
> +	skl_int3472_unregister_leds(int3472);
>  	skl_int3472_unregister_regulator(int3472);
>  }
>  EXPORT_SYMBOL_NS_GPL(int3472_discrete_cleanup, "INTEL_INT3472_DISCRETE");
> diff --git a/drivers/platform/x86/intel/int3472/led.c b/drivers/platform/x86/intel/int3472/led.c
> index 22d0d6c5e..9b2573cc3 100644
> --- a/drivers/platform/x86/intel/int3472/led.c
> +++ b/drivers/platform/x86/intel/int3472/led.c
> @@ -17,13 +17,14 @@ static int int3472_led_set(struct led_classdev *led_cdev, enum led_brightness br
>  int skl_int3472_register_led(struct int3472_discrete_device *int3472, struct gpio_desc *gpio,
>  			     const char *con_id)
>  {
> -	struct int3472_led *led = &int3472->led;
> +	struct int3472_led *led;
>  	char *p;
>  	int ret;
>  
> -	if (led->classdev.dev)
> -		return -EBUSY;
> +	if (int3472->n_leds >= INT3472_MAX_LEDS)
> +		return -ENOSPC;
>  
> +	led = &int3472->leds[int3472->n_leds];
>  	led->gpio = gpio;
>  
>  	/* Generate the name, replacing the ':' in the ACPI devname with '_' */
> @@ -46,17 +47,17 @@ int skl_int3472_register_led(struct int3472_discrete_device *int3472, struct gpi
>  	led->lookup.con_id = con_id;
>  	led_add_lookup(&led->lookup);
>  
> +	int3472->n_leds++;
>  	return 0;
>  }
>  
> -void skl_int3472_unregister_led(struct int3472_discrete_device *int3472)
> +void skl_int3472_unregister_leds(struct int3472_discrete_device *int3472)
>  {
> -	struct int3472_led *led = &int3472->led;
> +	for (unsigned int i = 0; i < int3472->n_leds; i++) {
> +		struct int3472_led *led = &int3472->leds[i];
>  
> -	if (IS_ERR_OR_NULL(led->classdev.dev))
> -		return;
> -
> -	led_remove_lookup(&led->lookup);
> -	led_classdev_unregister(&led->classdev);
> -	gpiod_put(led->gpio);
> +		led_remove_lookup(&led->lookup);
> +		led_classdev_unregister(&led->classdev);
> +		gpiod_put(led->gpio);
> +	}
>  }
> diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
> index 3ba0d5646..c597f37e9 100644
> --- a/include/linux/platform_data/x86/int3472.h
> +++ b/include/linux/platform_data/x86/int3472.h
> @@ -23,6 +23,7 @@
>  /* PMIC GPIO Types */
>  #define INT3472_GPIO_TYPE_RESET					0x00
>  #define INT3472_GPIO_TYPE_POWERDOWN				0x01
> +#define INT3472_GPIO_TYPE_STROBE				0x02
>  #define INT3472_GPIO_TYPE_POWER_ENABLE				0x0b
>  #define INT3472_GPIO_TYPE_CLK_ENABLE				0x0c
>  #define INT3472_GPIO_TYPE_PRIVACY_LED				0x0d
> @@ -31,6 +32,7 @@
>  
>  #define INT3472_PDEV_MAX_NAME_LEN				23
>  #define INT3472_MAX_SENSOR_GPIOS				3
> +#define INT3472_MAX_LEDS					2
>  #define INT3472_MAX_REGULATORS					3
>  
>  /* E.g. "avdd\0" */
> @@ -126,11 +128,12 @@ struct int3472_discrete_device {
>  		struct led_lookup_data lookup;
>  		char name[INT3472_LED_MAX_NAME_LEN];
>  		struct gpio_desc *gpio;
> -	} led;
> +	} leds[INT3472_MAX_LEDS];
>  
>  	struct int3472_discrete_quirks quirks;
>  
>  	unsigned int ngpios; /* how many GPIOs have we seen */
> +	unsigned int n_leds; /* how many LEDs have we registered */
>  	unsigned int n_sensor_gpios; /* how many have we mapped to sensor */
>  	unsigned int n_regulator_gpios; /* how many have we mapped to a regulator */
>  	struct gpiod_lookup_table gpios;
> @@ -162,6 +165,6 @@ void skl_int3472_unregister_regulator(struct int3472_discrete_device *int3472);
>  
>  int skl_int3472_register_led(struct int3472_discrete_device *int3472, struct gpio_desc *gpio,
>  			     const char *con_id);
> -void skl_int3472_unregister_led(struct int3472_discrete_device *int3472);
> +void skl_int3472_unregister_leds(struct int3472_discrete_device *int3472);
>  
>  #endif

