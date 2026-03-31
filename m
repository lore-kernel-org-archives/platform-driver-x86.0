Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588343A782B
	for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 10:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774953394; cv=none; b=iN9ztAxDjR/p2eAKxaqp6rNOJyJYynK9auCgAKy/cKb6GS1Evrol54t/Q6ZhoFkZnpfNSkyCVodYPorrxxJqOvSSSTHpv4nRpFbEFefKy/XIPmIQPl6rlDVc0Dr3nVkhVGU6q6hisPDH3I2oTxx++l44VzoA/xL5WS9yN6/v1wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774953394; c=relaxed/simple;
	bh=Box598rh/thmCuI0N1IWxk5SUIutfXkAMwOau5TW3F8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Khtw2PcxWkn5aRLqzeHA1uRWhX9jgVS2F4ZMNdn0HUbB6szJLmFfJNLsMw7+ChvvLahlWkOo0wZ8/vnKhrVh2TbkjkCFHelWuVGMCBheWcOtN4jcwIx3lo53vNITPE//c1/gAZ8Ui5wmlCHM8/2ceiPIjgxe7gXazYERF/SdaD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O/Q+NsvO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XAjdtdN9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O/Q+NsvO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XAjdtdN9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V8jsqI2049373
	for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 10:36:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bAWXwTW339Rg9wjnldRmxivFSUe6mWDpCp5k+4b19YQ=; b=O/Q+NsvOpr5fPo2H
	JFtNQYc0eyoOcqOuR5nRKcPftucKA6RGfdFdhlDie3R6mRqqIqDGXpgGFIToYMma
	A6iM6QrX0k6T9HzNJyLOrX7ljCstvctcjqeiJa4TDGUariCk3s0wtrCQwD8nzqLR
	a1752LcwroAr4m8/VHOMMcb0XCCXKNxCiCTB4oQdzTCGvuEOi2WzNiVdDSjQfbgp
	QQ/6pWNPvDAss0tW6qCfavh6VfE9p8w6Ffe51903ObWXv92obrZ/L3qFFMwk6Who
	GfvufB4yN6zciBZUYj1f+C1jDA6P6Ovs6pBlht6uQuJ80cUrzQ9DjNfdX/oRtHnp
	BDm1EA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b1yreb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 10:36:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b2cbe7223so180507821cf.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 03:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774953391; x=1775558191; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bAWXwTW339Rg9wjnldRmxivFSUe6mWDpCp5k+4b19YQ=;
        b=XAjdtdN9kfAiGfEVOzTvHy0oTbud/8cu+2pXPrlUbpnSEls+yHRttZY0aHq0yGS/Ao
         nqTeg3pW3zZcYCxUWceadx7IiE/wv14ciaGQwNmDMxRvERBmykuz2uRFFi1SeIdCy1u6
         27KLh5AbeA6NhLMV0H38OnplimE3GwSI1xvcXNbbCI9RiCNf15Aa6uv2pmsTf9pHPGND
         Zqg2GH5ZkM74LtiL7mVVWhT/agJUYPzeufydSpllVFPkhrDtbrA3ARJpFMCzeR9CaL2x
         JTB+r3J0AirzaxFPCWejf/WTXmEiM/dccMC3qjUrXUReYkUu/59Np1RHE5T59atleGKN
         fzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774953391; x=1775558191;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bAWXwTW339Rg9wjnldRmxivFSUe6mWDpCp5k+4b19YQ=;
        b=BzDzKzIIS5bsYDQTRTu7AirAJQ7GCqs42i5SXdrOINS2zZuHcYOkb+mYDrD60oXmcW
         08G7jD2hBCHb4T4jMLJ5RITIQvsy4V21oRkXUGUjPjGvAntjqVLTivY/199DXkP63M2M
         qp933p7lPEb1NGHzzJ6Br0bql7lhJBa6LtZPWR7jkjNCoCWbEntVMiclVcR8xgxv3Dpy
         RHiykqnR3mEBUcseXp1H3ip2vHBzvgcAHQQg/oQvuUqViuCAB+J0hpixhzzQ9tn630Fr
         BeEjd2sV4XdPd2u3sDOlqKZcj/VE6lxHd7va0Vh0Q/CIXdFBRUsVJKWt8xbrSQ9bnehd
         Nm4w==
X-Forwarded-Encrypted: i=1; AJvYcCUUqYzgU9sKO17z3yy23H5pfuePJ6cmPSvmpyPBEsrnHm0cRjweSUT+hktxdfVl6SYQ1pFIpizK3c4MY1PNgsPW9TzB@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjz4EocyzLICi6E+WPthN/99PAxoIGhxvObZa2QPnsg0+ZSzPv
	K6uWClFCsCcJ5IA7EOQ45PhKUEYOPdfxnPBjFDbxvb2VMijb1E2YlY82U+3uPHx1BtkRmLgNJ0C
	/L5ijHIR4E+D7ai4fAa28wAWxwxJDLVzIILPW270C06PthpJEyzgyL2vTCrcr93J6eJfRCY+nLX
	T/swpgXj3Q
X-Gm-Gg: ATEYQzw5lOvcAHLx/9TGZq/Bv+TJt57tqm9aOC9qwyeXHkiLYUVR2yK/IyPBjmND+fu
	Qu+TvvhmvfcKLSQOHxn0cFxhg7vlduLYeNmcCFcROJ1tz1L/IupxAZhpHw8P9vFTz1Eq9NchNnT
	smmhP+WRcnDu1sFk7Cdd9J7hnMqMU64XwmPJT6qu/f7gg7swCIEbgTDyRaAczzkpq1zGV6QQf58
	/kM7JZ7eSejbXVqRaqs24kPrfHJWatmIX9Be8QBBJYtSNJGe4Fppc0AEYcR53hhPZrTMEAadL3Q
	TYTDgi39vUu/ZHL66ogo27cMyDHWdr1+orzRNOzyXMw3B+dElVY6LI1V62VFjfrrGRh07YnnZV2
	tL6aweMwzImuahu7p9OyezhuBzTgSqNORA9Jqor76su4blzF42dVI5cf33M9ewjDmxZXpMO1FuS
	X1iaJU/WRaqILN1vE5J1zaaro9nMqKSKtYEBgFw+dnN1TQhHnj+7QEIRdu00+zh1Sl0v+I8cdoO
	OFhSOSnkMNyvnMT
X-Received: by 2002:a05:622a:5cc:b0:50b:3876:b0e4 with SMTP id d75a77b69052e-50ba38fc39cmr210089631cf.43.1774953391387;
        Tue, 31 Mar 2026 03:36:31 -0700 (PDT)
X-Received: by 2002:a05:622a:5cc:b0:50b:3876:b0e4 with SMTP id d75a77b69052e-50ba38fc39cmr210088901cf.43.1774953390528;
        Tue, 31 Mar 2026 03:36:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b76078a28sm3379288a12.22.2026.03.31.03.36.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 03:36:29 -0700 (PDT)
Message-ID: <bc5c4cd6-e026-41d6-ad49-aeffb949f7fb@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 12:36:28 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v6 4/4] platform/x86: int3472: Add support for GPIO type
 0x02 (IR flood LED)
To: Marco Nenciarini <mnencia@kcore.it>, Daniel Scally <djrscally@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <ab0URIrzZPsYjWrM@spark.kcore.it>
 <20260331075204.1567624-1-mnencia@kcore.it>
 <20260331075204.1567624-5-mnencia@kcore.it>
Content-Language: en-US, nl
In-Reply-To: <20260331075204.1567624-5-mnencia@kcore.it>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qWDzZvJuGlGzPBoFiBwN_HrnpuexcjtK
X-Proofpoint-ORIG-GUID: qWDzZvJuGlGzPBoFiBwN_HrnpuexcjtK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEwMiBTYWx0ZWRfX+0y4wcNkg9eo
 DXOWTA91HOkYvBYa1P8+OORLUERWMtvxIjxre1237OAhPtBl+NcQcjSgsy5o6dWjMUVRl9WUDqL
 xRP0TjkbGrWP9fgBFpauSM5INuUIZ48nBe6apV+UH7Cm1uHCuukyykbGLpxZhTFYvQSwZUY5ylE
 zBAj9fc8aCgOhL59evWrJnFbDVT4lP9bWmoXy6SNIW799FcvJXfLfLw8Y4QjAsvtXkP6ogIBy7n
 5V8AqTlRWxHO4uawhlhGdu91SE7nt0Q+3sJA6u3YmbAClEicN1MPmEfyrkyXHvrCiyyefXvOG+F
 FdTaipBGxBb4EdMLFGX/OLWAEU1eWXmLFo/zntJnknWnXphCGt1Bo88y7IPOy9PlSbFJXUQfOt2
 Wj6HUT7xxjxJFRKNlufqeRnOOmTNdXIK/DKApR45dV7smRLkaV19yRU7cZTaqjnyPFFztzcodI8
 sZXMUHWU3wTSeb+PAWA==
X-Authority-Analysis: v=2.4 cv=aJT9aL9m c=1 sm=1 tr=0 ts=69cba3b0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=QyXUC8HyAAAA:8
 a=ZOcNPuYV5xZNwL5pR2IA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310102

Hi Marco,

On 31-Mar-26 09:52, Marco Nenciarini wrote:
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
>  drivers/platform/x86/intel/int3472/discrete.c | 16 +++++++-
>  drivers/platform/x86/intel/int3472/led.c      | 39 +++++++++++--------
>  include/linux/platform_data/x86/int3472.h     | 10 +++--
>  3 files changed, 44 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index 57c3b2c..78111e5 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -215,6 +215,10 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
>  		*con_id = "privacy-led";

How about changing this to "privacy" (this is only
used internally really, so we're free to change it).

Note this should already be done in patch 3/4
to reduce churn below.

>  		*gpio_flags = GPIO_ACTIVE_HIGH;
>  		break;
> +	case INT3472_GPIO_TYPE_STROBE:
> +		*con_id = "ir_flood";

and here keep using "ir_flood" / keep as is.

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
> @@ -348,7 +354,13 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  
>  			break;
>  		case INT3472_GPIO_TYPE_PRIVACY_LED:
> -			ret = skl_int3472_register_led(int3472, gpio, "privacy");
> +			ret = skl_int3472_register_led(int3472, gpio, "privacy", true);
> +			if (ret)
> +				err_msg = "Failed to register LED\n";
> +
> +			break;
> +		case INT3472_GPIO_TYPE_STROBE:
> +			ret = skl_int3472_register_led(int3472, gpio, "ir_flood", false);

and then here instead of having 2 almost identical cases just pass con_id
note please already use con_id here in patch 3/4 to avoid churn.

After changing that in 3/4 you only need to add a single:

+		case INT3472_GPIO_TYPE_STROBE:

here to make it also handle the strobe/ir_flood case.

As an added bonus you've already named the new skl_int3472_register_led()
parameter con_id, so now that will nicely line-up too :)

Regards,

Hans



>  			if (ret)
>  				err_msg = "Failed to register LED\n";
>  
> @@ -422,7 +434,7 @@ void int3472_discrete_cleanup(struct int3472_discrete_device *int3472)
>  	gpiod_remove_lookup_table(&int3472->gpios);
>  
>  	skl_int3472_unregister_clock(int3472);
> -	skl_int3472_unregister_led(int3472);
> +	skl_int3472_unregister_leds(int3472);
>  	skl_int3472_unregister_regulator(int3472);
>  }
>  EXPORT_SYMBOL_NS_GPL(int3472_discrete_cleanup, "INTEL_INT3472_DISCRETE");
> diff --git a/drivers/platform/x86/intel/int3472/led.c b/drivers/platform/x86/intel/int3472/led.c
> index 39466d4..e7cd144 100644
> --- a/drivers/platform/x86/intel/int3472/led.c
> +++ b/drivers/platform/x86/intel/int3472/led.c
> @@ -4,6 +4,7 @@
>  #include <linux/acpi.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/leds.h>
> +#include <linux/list.h>
>  #include <linux/platform_data/x86/int3472.h>
>  
>  static int int3472_led_set(struct led_classdev *led_cdev,
> @@ -16,16 +17,19 @@ static int int3472_led_set(struct led_classdev *led_cdev,
>  }
>  
>  int skl_int3472_register_led(struct int3472_discrete_device *int3472,
> -			     struct gpio_desc *gpio, const char *con_id)
> +			     struct gpio_desc *gpio, const char *con_id,
> +			     bool add_lookup)
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
> @@ -42,22 +46,25 @@ int skl_int3472_register_led(struct int3472_discrete_device *int3472,
>  	if (ret)
>  		return ret;
>  
> -	led->lookup.provider = led->name;
> -	led->lookup.dev_id = int3472->sensor_name;
> -	led->lookup.con_id = con_id;
> -	led_add_lookup(&led->lookup);
> +	if (add_lookup) {
> +		led->lookup.provider = led->name;
> +		led->lookup.dev_id = int3472->sensor_name;
> +		led->lookup.con_id = con_id;
> +		led_add_lookup(&led->lookup);
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
> index 5213911..7366a25 100644
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
> @@ -161,7 +164,8 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
>  void skl_int3472_unregister_regulator(struct int3472_discrete_device *int3472);
>  
>  int skl_int3472_register_led(struct int3472_discrete_device *int3472,
> -			     struct gpio_desc *gpio, const char *con_id);
> -void skl_int3472_unregister_led(struct int3472_discrete_device *int3472);
> +			     struct gpio_desc *gpio, const char *con_id,
> +			     bool add_lookup);
> +void skl_int3472_unregister_leds(struct int3472_discrete_device *int3472);
>  
>  #endif

