Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7B6299943
	for <platform-driver-x86@vger.kernel.org>; Wed,  1 Apr 2026 13:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775051170; cv=none; b=S9yosYiZ5r6AmxZFVLBhKnhfeRP3XRaYWGlWMax76fYsxzciXiUv8KXJ1ZAJF3hxUWZZZjKx+kJjY7ZM/U/saEyKOmJKTJzBnuNRZxdi3HRWusok6Pro2pbIYiCe1rWsjqc/ih3gmHSTrzDyOFeYnuqUZG0MDvDntOZIqkBARi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775051170; c=relaxed/simple;
	bh=HyXNNCRGML8cjGpHK3BSnLohfd0D+PhWhMxB9LEKNSY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=BeGudfdpNeCfuWZpxONqEqR5uUjN2miO9Dn5NsrLT5ijhmMD1iR+rAh0aW1Ti4DVkCJtPC1xKELBc3xgUvhWM+eFO6CGJKL0Zrnr6KHdcp/JK1u7/Q6PA+KfIOjYb7WU9MVzxPgXcQ67HVHn3gPdldmD8koFPSmGyc+JhCL4xjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cb/VU7Ji; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wpn5UZ+1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cb/VU7Ji";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wpn5UZ+1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631C4kce2398159
	for <platform-driver-x86@vger.kernel.org>; Wed, 1 Apr 2026 13:46:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KZQAG0a1liNgA6sZePOKR1pfETeW8evsNPKkmbu/ylA=; b=Cb/VU7JiKiAagL8n
	F4i/e+P7g0qX9AcJ2Qofgd01QBcoP1ySgqFSC6+eoQk0t1HmhNpxi6TPSDPF5PZV
	NYtos1+urZ+TCnHdGrTklZDFbvd/eNa0wCQC0OLnM4pd8rKjx1bpGv2BQPKxqe0z
	TKDei7KRn/uDWViY9aCIEjNdyEFVjfNUBHuPRkeK8DU0J7IvXx5g6Nd62eGfeWBs
	rwF4MuJ8bW9M8KB8VMzf3IQQp3j+EVcUt6Qmse1EEq/Mk7cCTtnSueIlRS9WjtVL
	8Y6l5JdvP16otAijufKJgoMsjo95OEWjQ/253BAv0h37fcpkL3n900W0cIKupnqq
	T0ytlA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9324gc9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 01 Apr 2026 13:46:08 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b6f869676so147618021cf.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Apr 2026 06:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775051168; x=1775655968; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KZQAG0a1liNgA6sZePOKR1pfETeW8evsNPKkmbu/ylA=;
        b=Wpn5UZ+17QNdtmHaMmImEjiaE7UNf5Ijh532W8GihBbaPKZxkm275yJZgtghXFYXEM
         59VXZwRQv99XgOHIUxrMYF5iQltlYDKFwu/OnkooVBxwavZ2+hEq1cn1/heW9Skfe9fE
         UR3Oq5t+m/uKliM6hUhsuBFu+Ket5Z4iEkKQemoXFjEKwqozXut+00YtXyWFaVxi7kMf
         LUbvHVQU8MCYDgscEaCHjquKyvzZMfcj8Bm0rzVY/+4sK/xgRt1HEEfqy2w/Zf72M5O1
         eY4ujbOpnAAfaNIsCVBpcZqNORmVtNz4Ou6ovvx6klTCLeFf8fa/U6kCxjqslBgAWQVv
         uqhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775051168; x=1775655968;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KZQAG0a1liNgA6sZePOKR1pfETeW8evsNPKkmbu/ylA=;
        b=JaNMVopzkVsxRIT0r7s7t0+KVTEgpaubMYDiv0O0ul41sm1DFJca+6Lq6lfQRN6qm4
         Lplm8KCqetOtn2CkOZqVKxjiLZoX2bgodRdeHe3z/ECIWXxPziWEaF6uSFoGGfF/A6X+
         iQ7TzoLq4gKq5qKHzaImb4VB3sEL86TfPAvjl8AMo6kkTo6WYj7lDxpkJeCfsm9RT9fc
         MTBhm/1yPqwaBpP5IUS35bzwBQkShjahU705ebHOkGv2MjXhokGYHVVPDoRDJNybQFOb
         QOlc8AiwbwXKAGThLS71IE7lvQpBtJ997DcLZPVjHebfGK9HvWDrIRchdkBDpYmilavN
         8ypg==
X-Forwarded-Encrypted: i=1; AJvYcCVyvyvVj+rQ5CDNNsD/JdoqWkz6EMYLSpcULdGZxMCkqZZeAt/QBv3ICc3ZvmSYq+58VhVCElrkP+6TBQJLL7gnTcsB@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz6j6I4JvsYJEvLFtgTsEq05ZU6QBDY6WlRPG2928LM5+1Msvf
	Y5yvyR+Rk88Ij7jE0ALTanBtGnBvOIkf4Sv0U07bRiG+WXRqgCv075J69rgu6qzgQzYSKvMJO5+
	WtIbnWgyCERtJujH2+47j+tFcO3SajYWjHBD7QmW+Sv92Q0qY79m6VQKGs92S0+jX9UXRcU92j/
	zW
X-Gm-Gg: ATEYQzzdhcXaEtSKhtVgP5i88GknPbnp8gp+/OdpHzGIPi7dFrKRSIcGQwsgDw3B1ND
	B0fzFoQnRO8EBUoiRkhSKnQ7D6jSdz5ZkKc9QgF4+ndGCCULkupCtb6e2Oe5h0QuFYLWl3J8HOG
	FUcnbdth+7xCzNkg76pXEgg3z73hPS5mFkW0oAGsVGOuikQadkpwRRs4bFwdcmqMCzM0L0Sga/k
	abPhOBeJEuuSE6/0VVnPZnBvFUtsarr90bwVcfZQA0wsJQ6tPIPvxUSuW3qB/1EswdJJnbe6lvu
	Cfvuq2J0qVxdA9jjkbMCimDbpHv4i7CA+ZvKzxd7GU3NuMVUzL/rTnHAPOjzoSDuHGoMIjkca4W
	8CqP+YvO9w0rji16SYCcu+mpQ5pQzK29l0s8mzGajCZHOT21821hPOIoFdedT8HP5rHpBiaNJwY
	zE3OHv1zwmbd8bOvdYqBvy/l2B7TKxg3Kz++s9baDBhGQthW33/dSSWb0WwfgBUiC4ZtXH+Kl6S
	2ASvAUVeEhpzBjE
X-Received: by 2002:ac8:5785:0:b0:50b:6b21:2a63 with SMTP id d75a77b69052e-50d3bbf70e6mr50268491cf.29.1775051166993;
        Wed, 01 Apr 2026 06:46:06 -0700 (PDT)
X-Received: by 2002:ac8:5785:0:b0:50b:6b21:2a63 with SMTP id d75a77b69052e-50d3bbf70e6mr50262661cf.29.1775051159096;
        Wed, 01 Apr 2026 06:45:59 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c091331e0sm138654166b.8.2026.04.01.06.45.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 06:45:58 -0700 (PDT)
Message-ID: <d549c7d1-9928-4de2-ad5d-cd4efb68ca6b@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 15:45:57 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v7 4/4] platform/x86: int3472: Add support for GPIO type
 0x02 (IR flood LED)
To: Marco Nenciarini <mnencia@kcore.it>, Daniel Scally <djrscally@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260331134443.1573053-1-mnencia@kcore.it>
 <20260331134443.1573053-5-mnencia@kcore.it>
Content-Language: en-US, nl
In-Reply-To: <20260331134443.1573053-5-mnencia@kcore.it>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _BweKzlJOQt2eSOw_Dd7WgsTlnkoUoXQ
X-Authority-Analysis: v=2.4 cv=TKBIilla c=1 sm=1 tr=0 ts=69cd21a0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=QyXUC8HyAAAA:8
 a=aJ6TJXTELhPfMk9pao0A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEyOCBTYWx0ZWRfX2IZb6BcnKDFe
 QilkUETMLpZVgOBi7U15RYiujdGxIYVsJIQ0rm6u3f4t2eaGhN1Ug2hK/QWKGgCYhgTHrSNu5gV
 y2f9HVfn42d2Rhkpc34Y5c6I3Rt2ICIQcZa1W/Wf83iyEfsQ9gpVaudiWO2vYXRIghBK1WAGJu4
 9lUVQ8rD8hbOJvt0256aMM1kk9gIRJ7a6dLMmbLtLmo5ltwcERfS+3VHmDFoqk71B/ACoQmhsfN
 hBqwWNUQ1YZjYF1oJsZKu8XmXrvATrtwI62HHtLSXwBbw16SR+OINR9YbZP5V1Ta88Xos2ZzNmQ
 d8BFBvDBOy6JMmCIFojnvt70OuU25B9j5Sol171JRUA3LKHTEMxpgBxLBu9rsRidinJVl2fXYzm
 x3iA/oXiZOwB4BsWYn6pFzFi9wrlbkExdFuEnDPuJoomAaRQEVbPeXDhYlMrOTAxkldoskY7xHT
 pBIoIxZk4d1TxBW/04w==
X-Proofpoint-ORIG-GUID: _BweKzlJOQt2eSOw_Dd7WgsTlnkoUoXQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010128

Hi,

On 31-Mar-26 15:44, Marco Nenciarini wrote:
> Add support for GPIO type 0x02, which controls an IR flood LED used
> for face authentication on some laptops (e.g. Dell Pro Max 16 Premium).
> 
> Without this patch, the kernel logs "GPIO type 0x02 unknown; the sensor
> may not work" and IR sensors paired with a flood LED cannot function.
> 
> The flood LED is registered through the LED subsystem like the existing
> privacy LED. Unlike the privacy LED, it does not have a lookup entry
> since there is no consumer driver expecting it via led_get().
> 
> To support multiple LEDs per INT3472 device, convert the single led
> struct member to an array with a counter.
> 
> Signed-off-by: Marco Nenciarini <mnencia@kcore.it>
> ---
> 
> The ACPI _DSM tables refer to this GPIO type as "strobe", hence the
> INT3472_GPIO_TYPE_STROBE define. The userspace-visible LED name uses
> "ir_flood" instead, as the hardware is an IR flood illuminator, not a
> flash strobe.
> 
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>  drivers/platform/x86/intel/int3472/discrete.c | 11 ++++-
>  drivers/platform/x86/intel/int3472/led.c      | 44 ++++++++++++-------
>  include/linux/platform_data/x86/int3472.h     |  9 ++--
>  3 files changed, 43 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index a45a930..438b2e3 100644
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
> @@ -348,7 +354,8 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  
>  			break;
>  		case INT3472_GPIO_TYPE_PRIVACY_LED:
> -			ret = skl_int3472_register_led(int3472, gpio, con_id);
> +		case INT3472_GPIO_TYPE_STROBE:
> +			ret = skl_int3472_register_led(int3472, gpio, con_id, type);

As mentioned in the v6 discussion I believe we *always* want the lookup,
so we don't need the addition of passing "type" here + and we also don't
need the part of the changes below which deal with having the registering
of the lookup be conditional.

But maybe wait with sending a v8 until the v6 discussion with Sakari
is done.

Regards,

Hans



>  			if (ret)
>  				err_msg = "Failed to register LED\n";
>  
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
> index 22d0d6c..2888844 100644
> --- a/drivers/platform/x86/intel/int3472/led.c
> +++ b/drivers/platform/x86/intel/int3472/led.c
> @@ -4,6 +4,7 @@
>  #include <linux/acpi.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/leds.h>
> +#include <linux/list.h>
>  #include <linux/platform_data/x86/int3472.h>
>  
>  static int int3472_led_set(struct led_classdev *led_cdev, enum led_brightness brightness)
> @@ -15,16 +16,18 @@ static int int3472_led_set(struct led_classdev *led_cdev, enum led_brightness br
>  }
>  
>  int skl_int3472_register_led(struct int3472_discrete_device *int3472, struct gpio_desc *gpio,
> -			     const char *con_id)
> +			     const char *con_id, u8 type)
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
> +	INIT_LIST_HEAD(&led->lookup.list);
>  
>  	/* Generate the name, replacing the ':' in the ACPI devname with '_' */
>  	snprintf(led->name, sizeof(led->name),
> @@ -41,22 +44,31 @@ int skl_int3472_register_led(struct int3472_discrete_device *int3472, struct gpi
>  	if (ret)
>  		return ret;
>  
> -	led->lookup.provider = led->name;
> -	led->lookup.dev_id = int3472->sensor_name;
> -	led->lookup.con_id = con_id;
> -	led_add_lookup(&led->lookup);
> +	/* Register lookup for LED types that have a consumer driver */
> +	switch (type) {
> +	case INT3472_GPIO_TYPE_PRIVACY_LED:
> +		led->lookup.provider = led->name;
> +		led->lookup.dev_id = int3472->sensor_name;
> +		led->lookup.con_id = con_id;
> +		led_add_lookup(&led->lookup);
> +		break;
> +	case INT3472_GPIO_TYPE_STROBE:
> +	default:
> +		break;
> +	}
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
> +		if (!list_empty(&led->lookup.list))
> +			led_remove_lookup(&led->lookup);
> +		led_classdev_unregister(&led->classdev);
> +		gpiod_put(led->gpio);
> +	}
>  }
> diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
> index 3ba0d56..f14032c 100644
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
> @@ -161,7 +164,7 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
>  void skl_int3472_unregister_regulator(struct int3472_discrete_device *int3472);
>  
>  int skl_int3472_register_led(struct int3472_discrete_device *int3472, struct gpio_desc *gpio,
> -			     const char *con_id);
> -void skl_int3472_unregister_led(struct int3472_discrete_device *int3472);
> +			     const char *con_id, u8 type);
> +void skl_int3472_unregister_leds(struct int3472_discrete_device *int3472);
>  
>  #endif

