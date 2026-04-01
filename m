Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0121B43D513
	for <platform-driver-x86@vger.kernel.org>; Wed,  1 Apr 2026 13:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775050822; cv=none; b=tTt6GGA3Lu4zlnsT3ETjAl07Z0P2ZFG2LcMjx4xhVoVQQADKskk8R9Gb7B7/0tmciHCEF6x4YZDwK87JYLFxQv462RRgBKMlFeu4z5fsQVPyn/I39/6sV6jv/Q75TW0c8qnMNyNoEdmDXqg5I6Zu3iSbp0HTTbXKGveNVMVrKKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775050822; c=relaxed/simple;
	bh=9iOVrvbYPx8fhep2nm2L+EuNTESDaX8/Cht1uHcBxss=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=tBHDFNbMSOnKdJ6bfTRJ1VEMvxbwhQmWNzpuX3+lLjm+o790ESazsKH248l65c+QbYurPpNEtQNQhp+xLYE8PxIcSskmaAxwnRztLmHatDgu1aEcW1UYAlux7Kiy0f7bzCkqxfhUAN5ClojY9hRLjAsXCjYaegonBwbx9xat42I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lHhpY8l8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mwu5Uip7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lHhpY8l8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mwu5Uip7"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631CuDMF1578309
	for <platform-driver-x86@vger.kernel.org>; Wed, 1 Apr 2026 13:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ETzltGZBe/j3Wn8CJ8O+TPdUG2zbOnmbap+JHViLiSk=; b=lHhpY8l8urpllSbv
	g7FwxE41Tc/DXS1+yaLei+vWMCPsyj8SHDSP2+0nYSODVqdZKQbJepu+1VQD9EyT
	o+VlDfdnzBzqfPTtEVpS8txaFZ8yf53qDN1j8q3DaoIkeiQkpeb0wXMJL6ut+egs
	+TcI0/ekN3VDNJTcTxjVtcZ+YNsqYDtVwzRXbUfgzz8EtQrhjnAt9+AJtEe5ig11
	SIgsOc6yKyXpHoqa92xDBvfwx7c279evmhtwWr5USKWJctayQXJ3hOKlb+d+2CBH
	Yw9N+wkidiHwf5TWbcV+f5/eJqjoOn8fXQEo+6pjNLdqRybZUiXiR25Klj8UK4Xq
	JAyzZg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8k6kvaxu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 01 Apr 2026 13:40:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5093b92f327so215223121cf.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Apr 2026 06:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775050818; x=1775655618; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ETzltGZBe/j3Wn8CJ8O+TPdUG2zbOnmbap+JHViLiSk=;
        b=Mwu5Uip755V9ltQLqocqfFk38C/Nfa9stBXcV8EeYpXpTz9lKCFDLmS/xDV2AvOjht
         aV36NAv2Z4lrLN/5E0QDDF7HBrGMFZHbqHxLiri+U76xJp7H9oR83dY2KCAycqAF8mq6
         PJCa264UxDH2dPZD8vD44AFtKT/xUaaVXJQNkFaaFLiq4GPcSLYIdjHXdWGO3oFuQC9q
         NZmqG2mE1K7bYR7wCHrvcOhFHZsVwhZILwZh7+Mi8XGRGFT/TqIcGBrqO02YVQWKieTq
         uY5mUzz1MsM3tgphjNaONqcXuLg7yEEc3mCJdTGXyjIeJJpE2PU7ASmAmZFiVhrWXAfJ
         E/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775050818; x=1775655618;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ETzltGZBe/j3Wn8CJ8O+TPdUG2zbOnmbap+JHViLiSk=;
        b=Amb4yIh4EjRlBz9gNTBvH4tniMd9l+5ttQyHftX2U+RjDr4E6gFJp8HlJOXFBKb2Bx
         kv4EuTRVgue8EE0qQlUO33/UTWPI1fg0PxIvesXXETtG8eefTWQwArNDiDhd3VCaqZ0q
         /KkKAjcVCMgZlgHojVbifl5FqXFDBVLE6V96jkRyzQzRZeKfYJv0kp3AWYxF88NCwFos
         fZqb8GuDvtoiURavpCeXbqDEbrxO4rkYfTTH0Slcfbqp4oHplg4LGHBAVysQzNcjkMom
         yRQDu9Yn2zrHoiRfPjrKtg3UvZp1Wnta/Uc75xM+2rkYdwBt17IIAv2M07Yfxy+geAHD
         7h7A==
X-Forwarded-Encrypted: i=1; AJvYcCXUm/mG0U/3TKmymyKkoxSlh2jf7kdtWbLHDwjR/rH8TI6c93S+go+WqKx41doPbNYm88LY81DLnbMrx7VsrpnSZUyC@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq/vMLya7w0QjkYKwZqhCLnZ81PCyq6dekIEs7GYoi2pVsazB1
	mAPQl+7mQg3S7gIc6gKSCRdRG4I4rOke9KLumdGP5pcW1wHnU/EUQsqVwbOSR+7avRv3Krdjdhw
	WN0VjlUwAsJpYyjYqADmFNKProhIg2eimY437XIVC1ITvrajPiWTv78Hkh1wbfxo2Hnh2sIVtQe
	lV
X-Gm-Gg: ATEYQzw/5Ra8RTn2Ry923376vvHEIuz7YzQzkKoIOaaHTsjxkd3QLGr4DN5mMsurWT6
	Gx5Nee2z8bJZjd/qIScbhMhhNhBz06/w03q6DBH+V4y5ISKyz7fYplTQpbc/1COD7FBoESG8s5o
	Eap6/chH63w/4sGGXTnB4f5AS7KGOy/gGQUz6AYs4zM6PnSnEXy6hw65GrNq/dxNxus/o+rKXRa
	SlMuS+GA+k5rFvudz7HZy4lOV+5hKg2B2axwtI5zlmEOygG6ZexrTVMe++MXMML2SCf655wjY0r
	pHzplYc3AAMxRUv2immtk0CFEb2eO2r21pEajq8eMr+PJM3KSV83ysn2wEqr57jLRPTl2pYlHjM
	O5aP+O3/cP8jLOI9z/khILRBiA41xup7Dw/BjztTxkM9wxrOyzIvx2RUcpBpByBBvsw3Xnt4101
	T6cA/V8TBiWyIQtX7Q1ePIrb6RhJct1YWxE49/0gtFLyw0Y1BySc5GFQwz2JOIrxEhNunFaExmz
	6GvAcqbdzIgOs8z
X-Received: by 2002:a05:622a:647:b0:509:473e:2a12 with SMTP id d75a77b69052e-50d3bd08bc0mr49378421cf.48.1775050817872;
        Wed, 01 Apr 2026 06:40:17 -0700 (PDT)
X-Received: by 2002:a05:622a:647:b0:509:473e:2a12 with SMTP id d75a77b69052e-50d3bd08bc0mr49377651cf.48.1775050817235;
        Wed, 01 Apr 2026 06:40:17 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1e3aeesm518222966b.48.2026.04.01.06.40.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 06:40:16 -0700 (PDT)
Message-ID: <ae7ef22f-c418-42a5-a058-a2b26dccc799@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 15:40:14 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/4] platform/x86: int3472: Use local variable for LED
 struct access
To: Marco Nenciarini <mnencia@kcore.it>, Daniel Scally <djrscally@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260331134443.1573053-1-mnencia@kcore.it>
 <20260331134443.1573053-2-mnencia@kcore.it>
Content-Language: en-US, nl
In-Reply-To: <20260331134443.1573053-2-mnencia@kcore.it>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bfJmkePB c=1 sm=1 tr=0 ts=69cd2042 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=dBtFkiEHmeEwI9ekeOUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEyNiBTYWx0ZWRfX/veFCIlsn8U/
 OVFtmAjiVqgaL4tmJ1wjyAkVtP88rqiQQpS8HF+qFQYmVROYvkciPNZz340aNQAI2OXxikTzTvc
 pw2osHdlIXULn1lldEgIrnKslBvrrzO0X263xvqRkFUQBW22BDm+Mh5g6BH4zcIak7LfFeerP8D
 LLyJtxiw/M8eVTNMmohaWmMSEJ2Yr4TK/NtQHpw12SlotzKrr6CblGOoMc6pyyUiG9kKKKJ0ltf
 5dZOgVQj1oj7gi3iNVardU/h2RaLNzkvHC9Gc+Lfla1mL61SAKq9XpEhRY2+iGnIm03qi1G4Mbf
 M3WqmICk6s9Hpx6Su+vnr2XZo+TGN9uUDqcttR9OKJppSZsVBS640YuOp/X/u2Y0GVL8fjYGpNS
 +je/8HzAAYNTI3qPpq8grn2Re5MF2LYsRWeAl1Kjo+hCp40XHTZXVDqfs+xUROgxTEOYrwg6Ayn
 rE52Qyg7HQRXikSEtIg==
X-Proofpoint-GUID: yfwtSlbvMp7AoOCpCBUektzidDn4xeWz
X-Proofpoint-ORIG-GUID: yfwtSlbvMp7AoOCpCBUektzidDn4xeWz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010126

Hi,

On 31-Mar-26 15:44, Marco Nenciarini wrote:
> Introduce a local struct int3472_pled pointer in the LED registration,
> unregistration, and brightness callback functions to avoid repeatedly
> dereferencing int3472->pled. In the brightness callback, use
> container_of() to get the int3472_pled struct directly instead of
> going through int3472_discrete_device.
> 
> No functional change.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Marco Nenciarini <mnencia@kcore.it>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



> ---
> 
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>  drivers/platform/x86/intel/int3472/led.c | 43 ++++++++++++------------
>  1 file changed, 22 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/led.c b/drivers/platform/x86/intel/int3472/led.c
> index b1d84b9..35abad9 100644
> --- a/drivers/platform/x86/intel/int3472/led.c
> +++ b/drivers/platform/x86/intel/int3472/led.c
> @@ -6,55 +6,56 @@
>  #include <linux/leds.h>
>  #include <linux/platform_data/x86/int3472.h>
>  
> -static int int3472_pled_set(struct led_classdev *led_cdev,
> -				     enum led_brightness brightness)
> +static int int3472_pled_set(struct led_classdev *led_cdev, enum led_brightness brightness)
>  {
> -	struct int3472_discrete_device *int3472 =
> -		container_of(led_cdev, struct int3472_discrete_device, pled.classdev);
> +	struct int3472_pled *led = container_of(led_cdev, struct int3472_pled, classdev);
>  
> -	gpiod_set_value_cansleep(int3472->pled.gpio, brightness);
> +	gpiod_set_value_cansleep(led->gpio, brightness);
>  	return 0;
>  }
>  
>  int skl_int3472_register_pled(struct int3472_discrete_device *int3472, struct gpio_desc *gpio)
>  {
> +	struct int3472_pled *led = &int3472->pled;
>  	char *p;
>  	int ret;
>  
> -	if (int3472->pled.classdev.dev)
> +	if (led->classdev.dev)
>  		return -EBUSY;
>  
> -	int3472->pled.gpio = gpio;
> +	led->gpio = gpio;
>  
>  	/* Generate the name, replacing the ':' in the ACPI devname with '_' */
> -	snprintf(int3472->pled.name, sizeof(int3472->pled.name),
> +	snprintf(led->name, sizeof(led->name),
>  		 "%s::privacy_led", acpi_dev_name(int3472->sensor));
> -	p = strchr(int3472->pled.name, ':');
> +	p = strchr(led->name, ':');
>  	if (p)
>  		*p = '_';
>  
> -	int3472->pled.classdev.name = int3472->pled.name;
> -	int3472->pled.classdev.max_brightness = 1;
> -	int3472->pled.classdev.brightness_set_blocking = int3472_pled_set;
> +	led->classdev.name = led->name;
> +	led->classdev.max_brightness = 1;
> +	led->classdev.brightness_set_blocking = int3472_pled_set;
>  
> -	ret = led_classdev_register(int3472->dev, &int3472->pled.classdev);
> +	ret = led_classdev_register(int3472->dev, &led->classdev);
>  	if (ret)
>  		return ret;
>  
> -	int3472->pled.lookup.provider = int3472->pled.name;
> -	int3472->pled.lookup.dev_id = int3472->sensor_name;
> -	int3472->pled.lookup.con_id = "privacy";
> -	led_add_lookup(&int3472->pled.lookup);
> +	led->lookup.provider = led->name;
> +	led->lookup.dev_id = int3472->sensor_name;
> +	led->lookup.con_id = "privacy";
> +	led_add_lookup(&led->lookup);
>  
>  	return 0;
>  }
>  
>  void skl_int3472_unregister_pled(struct int3472_discrete_device *int3472)
>  {
> -	if (IS_ERR_OR_NULL(int3472->pled.classdev.dev))
> +	struct int3472_pled *led = &int3472->pled;
> +
> +	if (IS_ERR_OR_NULL(led->classdev.dev))
>  		return;
>  
> -	led_remove_lookup(&int3472->pled.lookup);
> -	led_classdev_unregister(&int3472->pled.classdev);
> -	gpiod_put(int3472->pled.gpio);
> +	led_remove_lookup(&led->lookup);
> +	led_classdev_unregister(&led->classdev);
> +	gpiod_put(led->gpio);
>  }

