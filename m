Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8203876DB
	for <platform-driver-x86@vger.kernel.org>; Sat, 28 Mar 2026 11:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774698659; cv=none; b=rOI6YXoL3AvkizcMk2Brv2GOMzwTCzbD3E1GCuY4hJqOIoSh8NrTGxwx9IESWBdioTuSBv/TnYe+gnPhEz9icQ5XqqV6Z60+SMvAMMc6+qcnkXDkpSJJ1lLyTyjl2hNtBG6l/uvjvNZRGgK7F+UWMey4khiQm4VThIkdxS1gWpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774698659; c=relaxed/simple;
	bh=Up//hhG0696JmAxIGi/oSxsbJptPFaBbmBi5ckha8nI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=jKlvCts577LfCowiE6rBIVKXiDlN+yt2d83bPCqpND8FwOBgp/3ZzBojKfPfDr7z46ZH8maceVqzIMCIOkQsopRIPVHv1tq8Mmxoih5I0vt9yNxg3EbdzmXErqSWIMOQnO1AQHFiYN5A6XsIYYCtWCF6LfFLUTmxgy6v7BmQIsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pOW4+0Ud; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DNf7f/hI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pOW4+0Ud";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DNf7f/hI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62S2qSDW567090
	for <platform-driver-x86@vger.kernel.org>; Sat, 28 Mar 2026 11:50:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cTOEDIdadR9NY2s5utxfMTdX+RrkzpRF504F8Vo5aMs=; b=pOW4+0Uda6vhJtWo
	9YKt33dDBUQwQ25Dx0JtygOmBEHdmnY4ogxqwzGoaFkd6fqwYg49S+Q5nB/FGxhW
	QUxJvFNj8WI5C2XPIzL1uiFh3ZGNl3iEN3AbtMqsNBd2mfGOIwncjSqZo4Gu6m8T
	E+bwDv8Ik10VNxcQ4H4GC855Ig6VkIGWYsxO92zdNyPMig49VDQtIScmuPXPCzvj
	6wZjyJzn8DpByWSBUCnnkVeeDmKq8G0bMVZ4z4W8TeZdDFiNeOsoayG9RC5LhgOa
	A8m0gDspmPBa61xo8QYdccMqprGSB4Ac8qlHVaECOAQU7A/MuIaVC+7AjgBqVzj6
	saQsRA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d66jwgspt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Sat, 28 Mar 2026 11:50:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50937cf66b5so145286501cf.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 28 Mar 2026 04:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774698656; x=1775303456; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cTOEDIdadR9NY2s5utxfMTdX+RrkzpRF504F8Vo5aMs=;
        b=DNf7f/hIlohmFJ5nE7SyK4aE1wWh4mpG5bDdvE42Q/xfPQCyHFp2GJ70kF4tu8U/TR
         ZSn44c2F/78mksPy/deQS59vPZtROelP557JOnS+klBK2jxyaTSHzodbk627cnwk3ZGZ
         8OM/5BP7blbcm+8ndMnd+ZsazFpP9jpYqZJ9Q4ZPL9iS38VkhgwnLMx+mzDYJTLPBjBa
         PCq2IrmELqpjyNXjoNkbLdfrvrZKKjul12W9jQEQTbXc8nt7iDhfTLYVPqgTXz0aGQDx
         YRfjSGkzj4Ph+qRkQ4Wrl5LabDGQZBctUOzfoD6UfgyILXyLRjLDE9FmrfToAwIDNeb8
         u4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774698656; x=1775303456;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cTOEDIdadR9NY2s5utxfMTdX+RrkzpRF504F8Vo5aMs=;
        b=REoGUPN8CyyYamFK0qEQlY0iQpMiStWSlQlMw7EmzGzdtX5uMrtd/jDQ2EBXlIVzjn
         da5hppnO8xsXZi0lyQGw07F7qLrDcfR0ljZL2fiBEPofmnOIoQswCxDTsIOgoyUlWAdG
         trx5pfDaMRuGL6mCVPoVYTuSePWDdxT+ENWTtw/FyqrKUm36QIohfpgezKRtaZhk3ZA1
         8RN4cSHQ3HfWU0uHlYGvDradRUvjHE9ReoMSM9tg3SkC+gEL55jwtt/XXlB4IUE8roar
         FmHbiJvds+spCAqgVVmRXrMfHaz5yVJ0evNGn1Bj71JCTBJ/ax6ANW+NUnbomPsM28jO
         perQ==
X-Forwarded-Encrypted: i=1; AJvYcCXV7E4VBjFQMY93yORIL+lBto7hIIaKFpCn+NnDxdOEjwYPZmReFqGcVCoZXYZ0lIEe+GrXLOzM+xqjURrViHt4pzfK@vger.kernel.org
X-Gm-Message-State: AOJu0YxsUFskOc/7QbPsTQB5p4xr2phi2WEzDef8QjzKFbt6eIufFZZJ
	0dwOGNa1bbsAD3nW69ywWPL0Ytc/EKrh5JLm7IzZtcmE9CQPyUeCZ3pLtmCEIKZF4hoI0aSuZ8C
	OR92BS/Y1hwO76BRbwe40owTnUEJi6EK4aNYYVYi/OG5g09gKptgp8oSz7DPmLvtwr4RxBZujh+
	Vo
X-Gm-Gg: ATEYQzwITNDmtrxy1i+9dKDE2VbqN3N/lSksc8B8U0dvbXnT6siE0YGiChBOsqG/h2G
	xYLLoNyi8ErHkQ2rbJZQdIAsXJIi/hjV8m4t33HRny5sQhGwJ7CQbc0Wl/3pehEeENo12hQy3df
	+rgkuqKhTs0C6w+WR5f1RxDLgnGOUUGE93NV8bLYTahWUQKLDVUgTjjYHi7GVuXaz+ush6v6CWD
	mKbzqqm/eZP1MActLv3BG3Gh1z1wPVp192K0uXENfCsFqSw+nRiZ2/1/4VbHPiSGCowqALJ/XOm
	JvyhglqepSn/Pl9f2vJ5gexIgrXwAel6wiOtRAzc4Dz6fOVqoNn413Ok91EJE9OvRFkZOTbZAcJ
	Nu0BiD/Goih/+pD2PaUSsVtwkaSoKXGa6GMtNghxuoOE6vq1m+PGAUoHjs5X1P76Iyxq3o47xOR
	pGO0ktWmza/8r0SskkRT4hownK/KVBQpkT4CP2JYTizzWx2jiaZOgcD6NrTpEncQCIukZyAJGmh
	zJgLQSZITwMuvS/
X-Received: by 2002:a05:622a:88:b0:509:4342:9980 with SMTP id d75a77b69052e-50ba38ca28emr79365721cf.33.1774698656299;
        Sat, 28 Mar 2026 04:50:56 -0700 (PDT)
X-Received: by 2002:a05:622a:88:b0:509:4342:9980 with SMTP id d75a77b69052e-50ba38ca28emr79365501cf.33.1774698655918;
        Sat, 28 Mar 2026 04:50:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13fd743sm412475e87.21.2026.03.28.04.50.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Mar 2026 04:50:54 -0700 (PDT)
Message-ID: <3bc9fb28-b567-40da-a80e-548c2ea7f207@oss.qualcomm.com>
Date: Sat, 28 Mar 2026 12:50:53 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH v6 2/2] media: ov13b10: Support multiple regulators
To: Arun T <arun.t@intel.com>
Cc: sakari.ailus@linux.intel.com, arec.kao@intel.com,
        ilpo.jarvinen@linux.intel.com, dan.scally@ideasonboard.com,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, mehdi.djait@intel.com
References: <20260327181959.3528753-1-arun.t@intel.com>
 <20260327181959.3528753-3-arun.t@intel.com>
Content-Language: en-US, nl
In-Reply-To: <20260327181959.3528753-3-arun.t@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I8dohdgg c=1 sm=1 tr=0 ts=69c7c0a0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=QyXUC8HyAAAA:8
 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=9jMZ81aJ1KEQurg9zIoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: V76-XmdyM2nF_dDaiigRq3DxMXRwB5iZ
X-Proofpoint-ORIG-GUID: V76-XmdyM2nF_dDaiigRq3DxMXRwB5iZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI4MDA4NiBTYWx0ZWRfX81xQwDi/ibGz
 KFbKI4LptTPMIu4FRM4+zpC8gQ0a//Kufz6i7uJXPHIgBXdliZLWWQy4qfnW/IdAtBIa2tHP1vI
 V2OvfH3Uw+RsmlmHVf5yG5NXz4F1dKuXhNDyWMQx6Q1caGAAv1BtcFlCGc1Jqd7fmVC3ojceaD6
 WblLjTzm4NhOf1VddgwBIN4HMw90+1gD1u/JFUge3Fu7KreRVYrSf1VX0mNYGc+vhGUC18trMN9
 urdsHHExx6KqXgFc0rKj3ySJ7ROSVv4NKs2wpQImt8tkTaNeamyzo+D7SmFAudB4rza8djqWBsJ
 qXSOrgbGucWIeSuccAYkG1BtRIIJoKUBZOn8VSzTvXp2TqjPCTxJXQcfOLQFKVqxRS8PUcyFYrr
 wPGEoplzH8Hn0Jw3dmx7rjC9l9mvjc7eerbw6V8iP5zqbj1nDlT9KP/cRUJJP4sSek8NiTU/VFL
 rMyp2rlocFSjc77HiCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_02,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603280086

Hi,

On 27-Mar-26 19:19, Arun T wrote:
> The OV13B10 sensor driver currently handles a single regulator called
> avdd, however the sensor can be supplied by up to three regulators.
> Update the driver to handle all of them together using the regulator
> bulk API.
> 
> Signed-off-by: Arun T <arun.t@intel.com>
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



> ---
>  drivers/media/i2c/ov13b10.c | 47 ++++++++++++++++++++-----------------
>  1 file changed, 26 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
> index 5421874732bc..b0d34141a13a 100644
> --- a/drivers/media/i2c/ov13b10.c
> +++ b/drivers/media/i2c/ov13b10.c
> @@ -8,6 +8,7 @@
>  #include <linux/i2c.h>
>  #include <linux/module.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-fwnode.h>
> @@ -699,6 +700,12 @@ static const struct ov13b10_mode supported_2_lanes_modes[] = {
>  	},
>  };
>  
> +static const char * const ov13b10_supply_names[] = {
> +	"dovdd",        /* Digital I/O power */
> +	"avdd",         /* Analog power */
> +	"dvdd",         /* Digital core power */
> +};
> +
>  struct ov13b10 {
>  	struct device *dev;
>  
> @@ -708,7 +715,7 @@ struct ov13b10 {
>  	struct v4l2_ctrl_handler ctrl_handler;
>  
>  	struct clk *img_clk;
> -	struct regulator *avdd;
> +	struct regulator_bulk_data supplies[ARRAY_SIZE(ov13b10_supply_names)];
>  	struct gpio_desc *reset;
>  
>  	/* V4L2 Controls */
> @@ -1194,9 +1201,8 @@ static int ov13b10_power_off(struct device *dev)
>  	struct ov13b10 *ov13b10 = to_ov13b10(sd);
>  
>  	gpiod_set_value_cansleep(ov13b10->reset, 1);
> -
> -	if (ov13b10->avdd)
> -		regulator_disable(ov13b10->avdd);
> +	regulator_bulk_disable(ARRAY_SIZE(ov13b10_supply_names),
> +			       ov13b10->supplies);
>  
>  	clk_disable_unprepare(ov13b10->img_clk);
>  
> @@ -1214,14 +1220,12 @@ static int ov13b10_power_on(struct device *dev)
>  		dev_err(dev, "failed to enable imaging clock: %d", ret);
>  		return ret;
>  	}
> -
> -	if (ov13b10->avdd) {
> -		ret = regulator_enable(ov13b10->avdd);
> -		if (ret < 0) {
> -			dev_err(dev, "failed to enable avdd: %d", ret);
> -			clk_disable_unprepare(ov13b10->img_clk);
> -			return ret;
> -		}
> +	ret = regulator_bulk_enable(ARRAY_SIZE(ov13b10_supply_names),
> +				    ov13b10->supplies);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to enable regulators\n");
> +		clk_disable_unprepare(ov13b10->img_clk);
> +		return ret;
>  	}
>  
>  	gpiod_set_value_cansleep(ov13b10->reset, 0);
> @@ -1475,7 +1479,8 @@ static int ov13b10_get_pm_resources(struct ov13b10 *ov13b)
>  	unsigned long freq;
>  	int ret;
>  
> -	ov13b->reset = devm_gpiod_get_optional(ov13b->dev, "reset", GPIOD_OUT_LOW);
> +	ov13b->reset = devm_gpiod_get_optional(ov13b->dev, "reset",
> +					       GPIOD_OUT_LOW);
>  	if (IS_ERR(ov13b->reset))
>  		return dev_err_probe(ov13b->dev, PTR_ERR(ov13b->reset),
>  				     "failed to get reset gpio\n");
> @@ -1491,15 +1496,15 @@ static int ov13b10_get_pm_resources(struct ov13b10 *ov13b)
>  				     "external clock %lu is not supported\n",
>  				     freq);
>  
> -	ov13b->avdd = devm_regulator_get_optional(ov13b->dev, "avdd");
> -	if (IS_ERR(ov13b->avdd)) {
> -		ret = PTR_ERR(ov13b->avdd);
> -		ov13b->avdd = NULL;
> -		if (ret != -ENODEV)
> -			return dev_err_probe(ov13b->dev, ret,
> -					     "failed to get avdd regulator\n");
> -	}
> +	for (unsigned int i = 0; i < ARRAY_SIZE(ov13b10_supply_names); i++)
> +		ov13b->supplies[i].supply = ov13b10_supply_names[i];
>  
> +	ret = devm_regulator_bulk_get(ov13b->dev,
> +				      ARRAY_SIZE(ov13b10_supply_names),
> +				      ov13b->supplies);
> +	if (ret)
> +		return dev_err_probe(ov13b->dev, ret,
> +				     "failed to get regulators\n");
>  	return 0;
>  }
>  

