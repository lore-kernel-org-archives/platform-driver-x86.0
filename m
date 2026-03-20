Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063A03AF677
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Mar 2026 12:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774010152; cv=none; b=urV6yphqRGfTGEs+UH1C1UbGfZ3MRk/AmR142WEdrA/rufe5AwNCqV+NM/f4eSfcabv8Bq3WaDoUUGRF+K7MIcayfXZdzXgS7nvLK7C8Ho/+S8ADZbjsp39jmoHl/tD6F2lqMo78BIfn3Y2yWKQX4iAM4DU4P6iVpLNZ0XjDy5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774010152; c=relaxed/simple;
	bh=54lHMsjHOrn9V4A7TThSTPvE5/wouaGjwwzAXvEcwUU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=T6/ry6zKh07WkH1PpZOVSuXe61IWTRJ9UBa1kyzUGW7NBuJsETQSRgdZ2lEXUyjK9mZ4vkWB4XRQPuYj8P1F5i+P8l8VX45QLgsbZ2QjBGgjGfvrzPj2RvHjFaZ8E+q8zWGTpVkxhWK5SLLVknt3YNHfPI3BaX5v6+VKK4++m98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aYnc1ANe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AtgfCV+9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aYnc1ANe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AtgfCV+9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K2XhsL1692054
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Mar 2026 12:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wsK9hAD/QyzioqCaRhacmU1DRL9xXeb+JzkPagHOWcw=; b=aYnc1ANeAvH3zQrL
	nZXw+xKE8NyKO+ov45AVCgseCBNNDko0LGdV/ynt/23l3AzKpCaRRiqyzWxAsxXP
	ntkVH3vsm8cyTZao/1o6kvNnXcMI0iCS82GFdOdq9MPSPodyvRDoUEjwnA+6RHLl
	VilB3Ivdx3ymsS/D2qt46bZLgmriVyA/SsHTdo0wRTZMyP12xFrRhlF9ZJsS2Fqd
	RL8yf7hrXtjCZdBxS/hzyfeG8mr8XVlkTcXlPe4nQe5ZfyAedCMUacCK+9u7/73e
	K6pYW5t0G+zqymRCQ6Efu57U34FP7hj40SByBkzFuBzpklksUMFAOh4HspIOuQJE
	Scnzdg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0s5d1ym0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Mar 2026 12:35:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50917996cfaso134112961cf.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Mar 2026 05:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774010145; x=1774614945; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wsK9hAD/QyzioqCaRhacmU1DRL9xXeb+JzkPagHOWcw=;
        b=AtgfCV+9d8Tw72XflyEbWGIjO7aglQO/bX0EAoCUHqgTsOFBZqHv75wovh1B9L8X7Q
         NvGpI0uhY9kdAIvDG5ckS4+UVNW+bE1yTJDGF1HcEmRGwefIys/1J4ywdOlYBcoK8S0O
         7+WfIYFk466LWa3rSW6HkhkAaMUgX/CJzMbi10gRplWuN97McENFIlESAVTYwtRBvytJ
         RQOXdnYTIgDGoveje/Yruu7UWT1558SJqhah8LrpaN0QxC5qDzgtZhEDGvoqHrKCDSzz
         OtmUam5e0yzGI9wMMetbz0/0921fGEcRZPh4wQMiJqNGd9DG+Q7ycvdu2B2wBtO/ZcfN
         bzIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774010145; x=1774614945;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wsK9hAD/QyzioqCaRhacmU1DRL9xXeb+JzkPagHOWcw=;
        b=s+O1fjv0Qe87GLQpsNNAmmmDwATuOhwESGekl48R9FteUHh3uz1kMU1couxrIpxIRy
         4H8bnfbfz5JOUX2ntL+cSBaQT+AdAy/+BhbFz4Aq1kRCvujJmU+DlgOS6WcB/ZTFHJsv
         E3Bu4TlP4Hzjic2svHTBgK2pSmfFzePc7afktj6j674MZhu2YddqV4xz0eIBpRvMct3d
         3CtVJIHgS2a49jNMtrpxHJlNzvtDicNCkah3oO6E5EWiE2S4OTzvCiZTOT1a947XKpA8
         lLpa5wP8Pbahi05k4ScoENzGPckksKwD50kfCauN1U8Wg8ciUwpihqzEb4awZOAJs1J+
         WKDw==
X-Forwarded-Encrypted: i=1; AJvYcCVrpVYtNbVhNirWgeuLTmTaz88CAlWnzjiy9H9CEFNLggNgwg2mjjP/3NqzLFY2iMeQhoxTUlUebbNC6jz8AlfDldN5@vger.kernel.org
X-Gm-Message-State: AOJu0YymtyaaRcPnIfNx7ovP/90xchquvgcWY0xmuNnNluP8VaI1ChR4
	WWozB7mEOmLuZx9tcLYJUjWTZsNLPllBL3xb4YS2aX23Pv4FZX6mYUzXEQdiEzRb4WNQL4Er6Jg
	v3mI3xpqIeBeF/jMUKqaUSxvLMCNcqVK+5+sYkdKsnexiYEExLoz2cApeWEdklV6cACeGnV+wF6
	BA
X-Gm-Gg: ATEYQzxSBBNoNPQqMcG4T0+vr/9a1jaenknljLiuCutQjgLv9wAgYptFMhFARjEsHgM
	u7/4CNNVUQ0o1azjoC+HFiOGoEGT0vcrO2n2LmEyegIr3O/fgkOqo/JsqkAN2umwn2p5CYOdMdp
	FiceGkxbvRYq/xkW+bQ2xwuR6EI71aoIHMzWLa3kZ4qFq4v2U//xROrVIx04kw2XwBpIRyb4J1E
	G71vsRURQbJCEhTC8Dd9WRLc1W+PJBpctFCN3zEQC7apAYzF36zTsnhrmyi2k/x8Otdjnu8Q7Zm
	XiT6V9BemXx6kerdhfwoPQ+TM06t3sk/Th+zflBzEmwK6r3zFTDxXtm/ADc5cyjEcsP73gHce1p
	L5aRFruK9pm1/cXIRHO6Q+nh7qb2qdltYpMCgw+dqOxoMLZGnseQEbxoJ0iLGlxx3E6Nf4cOQCq
	5RSgcQBQEPybmMmGfX2/Py0DSvYwCUCyprgNc3JVqXuA6v0Lk6XDquwvJZKsdAEmsxji/8SzlHD
	4tyGqaddiMosdDm
X-Received: by 2002:a05:622a:14f:b0:509:1009:e79d with SMTP id d75a77b69052e-50b37544f94mr38962721cf.55.1774010144589;
        Fri, 20 Mar 2026 05:35:44 -0700 (PDT)
X-Received: by 2002:a05:622a:14f:b0:509:1009:e79d with SMTP id d75a77b69052e-50b37544f94mr38962281cf.55.1774010144084;
        Fri, 20 Mar 2026 05:35:44 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335ddfa1sm153471166b.32.2026.03.20.05.35.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 05:35:43 -0700 (PDT)
Message-ID: <dc1a1031-ab02-49b6-865c-a8cd3a86ed7b@oss.qualcomm.com>
Date: Fri, 20 Mar 2026 13:35:42 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH] platform/x86: int3472: Add GPIO type 0x02 (strobe)
 mapping
To: Marco Nenciarini <mnencia@kcore.it>, platform-driver-x86@vger.kernel.org,
        linux-media@vger.kernel.org
Cc: hao.yao@intel.com, hdegoede@redhat.com, sakari.ailus@linux.intel.com,
        andy@kernel.org
References: <ab0UvRdDpvZBiNsC@spark.kcore.it>
Content-Language: en-US, nl
In-Reply-To: <ab0UvRdDpvZBiNsC@spark.kcore.it>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: L7CBkGcYrAHeqf0XxDoq6pjIxoQxcg8v
X-Proofpoint-GUID: L7CBkGcYrAHeqf0XxDoq6pjIxoQxcg8v
X-Authority-Analysis: v=2.4 cv=CqCys34D c=1 sm=1 tr=0 ts=69bd3f21 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=xNf9USuDAAAA:8 a=danhDmx_AAAA:8 a=20KFwNOVAAAA:8
 a=ymfDR22bKki68zKXmREA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDA5OSBTYWx0ZWRfXzU8vc6nOuRVc
 QIcliAN7HzhX1mJOyzolOx9Ku8iyIfIgStCFG7r9lnC2/Qdu3VNkrsW5c+NbcXdVSwj7R/O4ZSn
 +eRGCYtFVjWiQ6J7ghQCUkBWe5Kes/ZNuiWZ4kz2hXONPo2L1zEwZBZKoRfEYPbbkpkJIgnkV5s
 Qmt57ejPkqHd9X+CJA8elMzBcNG5IW/sv97Kz2YKx/vgWYROWmg1oynr+hn7o0A1sVVXle4RhqT
 3SvCijRMtoXfaN3edSdV8jvlQ2gpne43obDHtHyYUVBrd986hSgMp7u8cHKLRrEwvn0lphRnS6H
 Z329wg/IgSPU2zjhptcfijfpXqgkSrr6RJaQJ2Z3gfjmb+fVWG908v1s7SGgCQped7oALn8k7vV
 fHTJ4hGfsi+XI/ekGOStWx3EDm3k8v2WsZgkmSaOCRMtQ7hcJV7+lPfgNi7Cx+oYFC2KNuhc8AQ
 5bpL6mkjsHBGDhjGdLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200099

Hi,

On 20-Mar-26 10:34, Marco Nenciarini wrote:
> Some ACPI tables on Intel Meteor Lake and Arrow Lake platforms define
> GPIO resources with type 0x02 for INT3472 camera sensor power control.
> This type is not currently handled, causing a "GPIO type 0x02 unknown;
> the sensor may not work" warning and preventing proper sensor power
> sequencing.
> 
> Map GPIO type 0x02 (strobe) to the privacy LED handler, matching the
> approach used for similar illumination-related GPIOs. This is consistent
> with the original proposal by Hao Yao [1].
> 
> Tested on a Dell Pro Max 16 Premium (Arrow Lake-H) with OmniVision
> OV08F4 sensor connected via Intel IPU6 and Synaptics SVP7500 USBIO
> bridge. With this patch applied, the int3472-discrete driver no longer
> warns about unknown GPIO type 0x02, and the sensor probes successfully.

The strobe GPIO is typically used only for IR sensors (for Windows Hello)
and the  OV08F4 / ov08x40 is the regular color sensor.

Did you check with your latest working setup that this patch is
necessary at all ?  I would expect (other then the warning) things to
work fine without this patch, you likely have 2 INT3472 ACPI devices
and the one throwing the warning is not used for the OVTI08F4 sensor.

The GPIO with type 0x02 seems to control an IR flood LED to IR illuminate
the scene when the IR camera is on. As such mapping it as a privacy LED
is not really what we want.

Mapping it as a LED makes sense, but we should give it a different
name. So add a name parameter to skl_int3472_register_pled() and
rename the function to skl_int3472_register_led().

And then for the existing privacy LED pass: "privacy_led" as
name and for the type 0x02 GPIO pass: "ir_flood_led" as name
parameter ?

This solves things from the int3472 pov, but is not really
helpful otherwise.

Arguably we do want to turn on the ir_flood_led on streaming on
automatically like we do for the privacy LED atm. But just using
a different name gives us flexibility to allow more fine-grained
control in the future ...

Sakari any remarks from the V4L2 side here ?

Regards,

Hans




> [1] https://lore.kernel.org/all/20231007021309.9332-1-hao.yao@intel.com/
> 
> Link: https://bugs.debian.org/1130114
> Link: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2138991
> Cc: Hao Yao <hao.yao@intel.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Andy Shevchenko <andy@kernel.org>
> Signed-off-by: Marco Nenciarini <mnencia@kcore.it>
> ---
>  drivers/platform/x86/intel/int3472/discrete.c | 3 +++
>  include/linux/platform_data/x86/int3472.h     | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index 1505fc3..39ca60b 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -211,6 +211,7 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
>  		*con_id = "clk-enable";
>  		*gpio_flags = GPIO_ACTIVE_HIGH;
>  		break;
> +	case INT3472_GPIO_TYPE_STROBE:
>  	case INT3472_GPIO_TYPE_PRIVACY_LED:
>  		*con_id = "privacy-led";
>  		*gpio_flags = GPIO_ACTIVE_HIGH;
> @@ -330,6 +331,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  
>  		break;
>  	case INT3472_GPIO_TYPE_CLK_ENABLE:
> +	case INT3472_GPIO_TYPE_STROBE:
>  	case INT3472_GPIO_TYPE_PRIVACY_LED:
>  	case INT3472_GPIO_TYPE_POWER_ENABLE:
>  	case INT3472_GPIO_TYPE_HANDSHAKE:
> @@ -347,6 +349,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  				err_msg = "Failed to register clock\n";
>  
>  			break;
> +		case INT3472_GPIO_TYPE_STROBE:
>  		case INT3472_GPIO_TYPE_PRIVACY_LED:
>  			ret = skl_int3472_register_pled(int3472, gpio);
>  			if (ret)
> diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
> index b1b8375..85adeb0 100644
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

