Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9741822FE0A
	for <platform-driver-x86@vger.kernel.org>; Wed,  1 Apr 2026 13:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775050930; cv=none; b=dk6CK9fDuP8RjuvCMYbdX3Tuyhf9beZbc17PLk46UX2fVDin4tTxFp36ydDCJRS2ciHIb3t6rEAWtn8frX/7nwQGqpe2+RBSL5yRIdrcqRxVUAbd1ToSCS8KcKbhmEa3iLVIhRKv8jvIdNw5pxltv5gstTrWjaBcyyhqLL+7S7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775050930; c=relaxed/simple;
	bh=DfEumEcHPWgL+MkO2sPHvHb7A5VtaF6BUwkH+E+tsus=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=c9Af0Xe8Qsucf7Ip25JQb1zMIdrNLqWldVjD3SIRVyu0tbg8+Ioh6rDCKQVq63c5l7XDpCXI2X0Xku326W2WB8VULZJiILM5pLDDSw0VGz0+n75ORTYjX9E9PF5BFwtfiiX2gx9U9N8Dna6Mk8QsGsT25Jh+FINtJsVeu+hnS8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T9PoLbV6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pc/hRZTO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T9PoLbV6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pc/hRZTO"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631ADBlh1579362
	for <platform-driver-x86@vger.kernel.org>; Wed, 1 Apr 2026 13:42:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zPsA3Q171swQOBI/h37M3J4jz6iFi0suBOFIOE7z8cU=; b=T9PoLbV66KzrD6el
	jXFnybeQG9GzV/6HR/kmPMd/MYHCBWYIph81+aZe+22OeQiXgWKFZWE2qsyV67ut
	Wi2tFbkLHx2EqxVp3YMXhSzLEPDngiBwYQ5ck2Cf7HR8Q4Z4VEBsdn9Wu6foNJQu
	UG95oTmtDNji1/i+ZOb4xIOGNHrbMXPBd4fGXGk3bTP9leLLOg5RbXWhkA0Q0Z24
	9O/d4rvV7KUJkhcBd4c8QZAL1s5BcuxFwsMI7WDaJnW0+hxfqfKI5mb0wc/fRmFH
	zl/WkoONS5JuN/mmV5c8sVOgM3YVwRsbuwd2aGTxtxXtxgLJLaro98m9FptHcWtt
	GWJb4A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8mr2uu7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 01 Apr 2026 13:42:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b781542c1so162103091cf.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Apr 2026 06:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775050928; x=1775655728; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zPsA3Q171swQOBI/h37M3J4jz6iFi0suBOFIOE7z8cU=;
        b=Pc/hRZTOv6v2jKrQgM9RCzhT6czD7kUAnsW/WmIM0z9DOtXiTMx1ujTrirO/7fcGyA
         cmDqshrsycDFIDgwS3s70d6tx/9Rfk4KRGP8Z6h6nRUzoNecOSH2h9BSnU4eKz8CMaqC
         2HG7SdEiiQHHmHlQHfsT4wGTYDA9uslkPc0/00X9GNI3XM6uDR/FkpS6a+dzqAS/rs1D
         HgQVVYp8UpcxwkYZQDRvB+EHsVD5ypDgVnevzLA5BMq++HgfR+OvXzEt6YgW8jM1BchA
         FtdOqzmNaV+J+cmVLp94LTvUvYLlqFgSudIaWMhP7oy7AAfpVG+q5hcZ4zbTHr+iYgo9
         Sskg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775050928; x=1775655728;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zPsA3Q171swQOBI/h37M3J4jz6iFi0suBOFIOE7z8cU=;
        b=glGfeUn4DiRmMzp6QYoMTMWGdaNud/sDlOf93QJkmK6VA+yAs7tp1Z4reFTqeUG628
         AZShOAawIsCsOcVNjTPjeJYym8+tzUIT7iVoSMPtFW6HdVv5iV3A4rPnMHuDC25OUht4
         1bfvtJ3B7YoCJ3K4OmS4RYNm6uN9zIprlJKLBb6/cTL/5c+aGBMxNwRdeLUSg0C3ipkQ
         7KTI4r0/epX3JQMYI3VUrOo3J0FljHqojqHPHb6GoHS1QweV/XEXgyPLsNSRC/Yt3KJR
         7h871VqZtb/uIK7TTniwA/q0pkj3j1rBtu+CQ3TfL6bj+rEHnTkYBNclwWAPQIvnC1pt
         qM9w==
X-Forwarded-Encrypted: i=1; AJvYcCVm9iQ6AUgLAVtK08KDOB/S6qa5As6yCHjwGGXtj3sLXS0fq8AyaLmHd9AYU04css3hJ0rDhxseh1M/63Bs9bwD6svt@vger.kernel.org
X-Gm-Message-State: AOJu0YxP14UikswcOmo43nsDoVrkwAKOOH0j2eraxtupu9kGXE3QjYCl
	q+heISTLgqq7iTahrclM0NpILywmfN5n/sb+DP62SR5+VS3bOlenw7Vm9X1oNTt/2yP5ky7h/P7
	ogGqks/7o+ZQ5De3s8JJxD8FDIN51TfppFOFhuy+oV85AHztF+17XS+51gHSxNGfT0kRgNQecQO
	p/
X-Gm-Gg: ATEYQzzcSE++aJHsC7mlNgj1wMi1uqwOKTaF/TKU6P9zDWNd6Jut2p1aRCNFkH7vv6+
	zbNTpgvewd51YCcb6EmarmwG94jaX2LIAXIIh+uePARe+lNXnpD0FHAgVaBeBy3wDNq94vlfKiK
	U99Ng2SY/P4RIEnb7OgvyDil2YJPYwYCWMg/+brHBbNwWMMk4KMPgcwDFT5F6J3NpZjwNUg2tQ1
	CwvQlo3xeyUI4TWR/tm6LGBjC0KSu4aELHqqKJ3rMiiNvsFG9N2BeGeic/6qXPw+Tyx8KOzwmyF
	XDeoVbT3xiccTtHM4CShWvGEM0Af1xMpu6AUWdNqBtJFtH2tj0dw7fFtICpXpOl1mgkuCMzts2O
	B6wP6jMPCzz0ISXBxRezsIJRVki0NucA6rQ/UcboyNIqBl5v1SstY9nrMbSO/5dzZ5mbZDGaDcz
	PJtmF6d1toHKZdEmKICM+Y4RwZxds388/wAmHLqqfFusXlrxadeX+9BQhc1N8UhS/a+U4uYffj3
	9zyNcfe7s3DBZPf
X-Received: by 2002:a05:622a:149:b0:50b:3831:417f with SMTP id d75a77b69052e-50d3bce364dmr46889451cf.45.1775050927597;
        Wed, 01 Apr 2026 06:42:07 -0700 (PDT)
X-Received: by 2002:a05:622a:149:b0:50b:3831:417f with SMTP id d75a77b69052e-50d3bce364dmr46887961cf.45.1775050926217;
        Wed, 01 Apr 2026 06:42:06 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae25b08sm511343466b.7.2026.04.01.06.42.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 06:42:05 -0700 (PDT)
Message-ID: <7ed69d2e-33d5-4fba-9792-e49fc7f9b3bc@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 15:42:04 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v7 2/4] platform/x86: int3472: Rename pled to led in LED
 registration code
To: Marco Nenciarini <mnencia@kcore.it>, Daniel Scally <djrscally@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260331134443.1573053-1-mnencia@kcore.it>
 <20260331134443.1573053-3-mnencia@kcore.it>
Content-Language: en-US, nl
In-Reply-To: <20260331134443.1573053-3-mnencia@kcore.it>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B+O0EetM c=1 sm=1 tr=0 ts=69cd20b0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=Vci6ddSaGsASmk0u3isA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: G9ep7FRYV9rA7IswYEUSumtnKfQCgm_u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEyNyBTYWx0ZWRfX+vMAlKa2n2qo
 Riz/Kdiu2nvu8OCDAAuV7M/mSz62KBRCwps/ET1moiTNk7QrfYNe1EDn24e6QA/TM7zSuz2LF9y
 V5ZreBgHHafeZtHl/0WXS/YkjEDmOBb/eRn/a0DHc+tWYX8UkfPQk7KfpC4AJ3GwcltQ4jqq0J2
 064jvhj3hiJrcvAjMs7EYINyJxS9b/47WvsZWNr8EGjRMffVkPdwJXbs7aDrQeViyJBzNjFB5eP
 4Sr4I8cHjGAUY6HIyfs/d9T938xLO4V5c8Gdn1UhY7J1amZoqruta/zMD28Hj/qn+9WhUk6wZlc
 FowBhF8ChGdsXDrIOEU8YH58BLjLN2FfpjPfwKbMFGu2PsXB4IpmWAdvjoLoOtWuyKMbuAu9NDg
 oxsmEovCpxocKr6AV0twBIqM61SPavzOkiCueBWuVq8xMud+Ho5iTozoeoBy/hjdpasCHJztIjF
 4Hep9h3EDIKHOxen+sQ==
X-Proofpoint-GUID: G9ep7FRYV9rA7IswYEUSumtnKfQCgm_u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010127

Hi,

On 31-Mar-26 15:44, Marco Nenciarini wrote:
> Rename the privacy LED type, struct member, and functions from "pled"
> to "led" in preparation for supporting additional LED types beyond
> just the privacy LED.
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
>  drivers/platform/x86/intel/int3472/discrete.c |  4 ++--
>  drivers/platform/x86/intel/int3472/led.c      | 14 +++++++-------
>  include/linux/platform_data/x86/int3472.h     |  8 ++++----
>  3 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index 1505fc3..cb24763 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -348,7 +348,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  
>  			break;
>  		case INT3472_GPIO_TYPE_PRIVACY_LED:
> -			ret = skl_int3472_register_pled(int3472, gpio);
> +			ret = skl_int3472_register_led(int3472, gpio);
>  			if (ret)
>  				err_msg = "Failed to register LED\n";
>  
> @@ -422,7 +422,7 @@ void int3472_discrete_cleanup(struct int3472_discrete_device *int3472)
>  	gpiod_remove_lookup_table(&int3472->gpios);
>  
>  	skl_int3472_unregister_clock(int3472);
> -	skl_int3472_unregister_pled(int3472);
> +	skl_int3472_unregister_led(int3472);
>  	skl_int3472_unregister_regulator(int3472);
>  }
>  EXPORT_SYMBOL_NS_GPL(int3472_discrete_cleanup, "INTEL_INT3472_DISCRETE");
> diff --git a/drivers/platform/x86/intel/int3472/led.c b/drivers/platform/x86/intel/int3472/led.c
> index 35abad9..fe412cb 100644
> --- a/drivers/platform/x86/intel/int3472/led.c
> +++ b/drivers/platform/x86/intel/int3472/led.c
> @@ -6,17 +6,17 @@
>  #include <linux/leds.h>
>  #include <linux/platform_data/x86/int3472.h>
>  
> -static int int3472_pled_set(struct led_classdev *led_cdev, enum led_brightness brightness)
> +static int int3472_led_set(struct led_classdev *led_cdev, enum led_brightness brightness)
>  {
> -	struct int3472_pled *led = container_of(led_cdev, struct int3472_pled, classdev);
> +	struct int3472_led *led = container_of(led_cdev, struct int3472_led, classdev);
>  
>  	gpiod_set_value_cansleep(led->gpio, brightness);
>  	return 0;
>  }
>  
> -int skl_int3472_register_pled(struct int3472_discrete_device *int3472, struct gpio_desc *gpio)
> +int skl_int3472_register_led(struct int3472_discrete_device *int3472, struct gpio_desc *gpio)
>  {
> -	struct int3472_pled *led = &int3472->pled;
> +	struct int3472_led *led = &int3472->led;
>  	char *p;
>  	int ret;
>  
> @@ -34,7 +34,7 @@ int skl_int3472_register_pled(struct int3472_discrete_device *int3472, struct gp
>  
>  	led->classdev.name = led->name;
>  	led->classdev.max_brightness = 1;
> -	led->classdev.brightness_set_blocking = int3472_pled_set;
> +	led->classdev.brightness_set_blocking = int3472_led_set;
>  
>  	ret = led_classdev_register(int3472->dev, &led->classdev);
>  	if (ret)
> @@ -48,9 +48,9 @@ int skl_int3472_register_pled(struct int3472_discrete_device *int3472, struct gp
>  	return 0;
>  }
>  
> -void skl_int3472_unregister_pled(struct int3472_discrete_device *int3472)
> +void skl_int3472_unregister_led(struct int3472_discrete_device *int3472)
>  {
> -	struct int3472_pled *led = &int3472->pled;
> +	struct int3472_led *led = &int3472->led;
>  
>  	if (IS_ERR_OR_NULL(led->classdev.dev))
>  		return;
> diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
> index b1b8375..7af6731 100644
> --- a/include/linux/platform_data/x86/int3472.h
> +++ b/include/linux/platform_data/x86/int3472.h
> @@ -121,12 +121,12 @@ struct int3472_discrete_device {
>  		u8 imgclk_index;
>  	} clock;
>  
> -	struct int3472_pled {
> +	struct int3472_led {
>  		struct led_classdev classdev;
>  		struct led_lookup_data lookup;
>  		char name[INT3472_LED_MAX_NAME_LEN];
>  		struct gpio_desc *gpio;
> -	} pled;
> +	} led;
>  
>  	struct int3472_discrete_quirks quirks;
>  
> @@ -160,7 +160,7 @@ int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
>  				   const char *second_sensor);
>  void skl_int3472_unregister_regulator(struct int3472_discrete_device *int3472);
>  
> -int skl_int3472_register_pled(struct int3472_discrete_device *int3472, struct gpio_desc *gpio);
> -void skl_int3472_unregister_pled(struct int3472_discrete_device *int3472);
> +int skl_int3472_register_led(struct int3472_discrete_device *int3472, struct gpio_desc *gpio);
> +void skl_int3472_unregister_led(struct int3472_discrete_device *int3472);
>  
>  #endif

