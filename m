Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2447386C3E
	for <platform-driver-x86@vger.kernel.org>; Sat, 28 Mar 2026 11:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774698651; cv=none; b=u8PRV00j6d0hP0PK8JGpXfqI7UVRgUle1eqXXl8W1DpRDr3HRzS8xWZehO4L2CkmJCiWpERYaqwAkwtsANx0W1LqNdOraTY1ePKCf4Ddv2O1+OW4mL4ztILp8p7e1lZNA3UnGnhsOt85xR2iNjQutyI1QBn1I7ysR7uD+LBzFVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774698651; c=relaxed/simple;
	bh=/dlx7KWj5vhfpEv1MoSZnbLHolNpt373+6+mrG/OOs0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=BXicypr6SPelCpwJHx5Fdakz5jgcUVo8I4cbSQYJXt64JZleEP955i71XG8OYMPM4hfWi5DSNOQuffUltL9XFna4Tb41v2n+hLQNRkBPaFdkmbCpvDg5iAEeQhJv9LQrC4DQmXb/ZZy/9dnAOIdmTLTN6Sp9D4AU+qxdm2kliwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CJjIuppb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jnBZzVUY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CJjIuppb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jnBZzVUY"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62S2Xba42835246
	for <platform-driver-x86@vger.kernel.org>; Sat, 28 Mar 2026 11:50:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dld5selLQ1J9MQ4u6bdHYyqpBvugOu7TPOGeAA3ulRE=; b=CJjIuppbrcqftwQU
	Ao8XLTmwKvWGSULHW447kNmatmu4f+c1hne9c9maOa3xv8o5mo1IcBBsvrm2GV1c
	0+9J2+E0uZgRxjBfGw1FA+KyPAINH46uk9D/7TjoP9LX30h5+EwaApha92gRinnf
	9Sx3zaHTG+d8UziBXtCZWT0aJCOpmKCOjTTmbf4csTBzcKQQ/knLaxldSe3s13rG
	sZES4LN3sXBc+y/pAmywE7B4ZdGCAZgMzCW0dvXoe1Nk3EeBNNeFUsDEcp8aCjz8
	SpOsTnqiqrXOlmr5+j/MjaE63hg04LR4Ej0lwOwVE8QxEZAupOUDAAR8hj8iL5xP
	bmQFjQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d66afrtrh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Sat, 28 Mar 2026 11:50:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5090e08dcfcso84708581cf.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 28 Mar 2026 04:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774698648; x=1775303448; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dld5selLQ1J9MQ4u6bdHYyqpBvugOu7TPOGeAA3ulRE=;
        b=jnBZzVUYG96znZRt5i1iNXSdQbvsmi4aMbyCIfaCosEkaZRjkz2FztEEp8xMhXOmmO
         f5OFkGvl4u7wsYDN/kD0du3DNFj2jgeChbZqjxCVjxcq2torwriFH2fL0QKJfVuSd/h6
         XVzLz4u44kLt/o9KnGic6Xjgut+6TsYO9wKTxaGHl4MTk4H2dQxIr35YkLWH9avW02oi
         CqwRDXbsM7/24P2mejsqxucgr0baEmdyf3ApzoBo0jytT/cUsjBgs0AkraCkN3Zz1ghc
         ZjBVrrHhQs+u7aEY+WirqO99j8kCXijFk3s11hZjwi4BuOH7hic6UR4afHWxd+q3HGmi
         7M/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774698648; x=1775303448;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dld5selLQ1J9MQ4u6bdHYyqpBvugOu7TPOGeAA3ulRE=;
        b=ovpfl3/rhLoXLkW3CEtBg4V4ydcBjLIueNDCwOce0UkmhfA300FYQ+c3ILupifEIdv
         THsHfDELEc0F5SVjADEB/RenC7X/8+tuM5a++vgT4KstEMqHlrqh7ys6z6N35a9mjJpc
         AQ+m5LX/Sop5MrMjJNzuJLqKKFsPzmmd3Be1RRKwMXklXzbijBhsp/6lC34wWzaA9IRD
         N0Q6l59zm+JMuu3PZ9iNfHZOiz3+y91wE5t+KeJW9ewdOH4hkZtFRpZ6wL1pvCKt8ivv
         KbfhPc5rBJtNuHNkBIbNPzzwgpUg+XhtxkLs/hDZfNUvLEP8OBI5VwfrSBUFDNhEoGyu
         l42w==
X-Forwarded-Encrypted: i=1; AJvYcCW0m7DCfw82VN9KFBHsjf13+AI5buYSufmM0oiTjZpOLgSbHC9wTddlFGIVPS9+otqpzXopkzMGgSVgvzAkOy1cnOL8@vger.kernel.org
X-Gm-Message-State: AOJu0YwWhv2YtE+op3G4tQGv8YbqBnHOyrzAfEsP1R3yL5Ad38xtwtrY
	rzT/Km48lBQLy51reKVnMNcl0K0i3mWmfN16xW3ZBI1NVlOFMCe7ZvMibevSi6eo2rMj4Rvs85R
	x3Lz5niZP2yAajisq7GhL29NmCkB1egm8T3cW/xMnViBQ3WkKnw9j7ZhjSNypm1OEqFsczjDz5P
	Es
X-Gm-Gg: ATEYQzynMztSSuDI0GeW95RmUUBO/zbyL/iiPdw3Im+m1zmVefRYlxECnFASoFys16u
	zcRFxjcBFBKag5oAPmcGZ9b9rLinNVQyZqFpb1Msevya/Lwiy2HYIvQg8x2tFX6P5+ap2NY4NUN
	mPwotPHPADdzvfQgInElAFdr2eWH06MCMymV090zqKn8dczek3ZyrrrtqPJ7kfrqsAiyfvZd3Ia
	pzUvEy+X2FBefKBDdaGYLjRTGJy93maYIDhDzy8fjWk35kw4oinxqt4bEYnKsTzq2fnHo0rbVLM
	mFtGamDNilXZOiXUqq84QuL690CWGDRIjanExRqjfJMr8W4C7P0A6LVbPtrfjCkHwMtZPUUPY4h
	uNvYR+Yl0jJYO/sypAmpi6xeidNtwoQXThghs9i24kDyQhIJeirKzbPaCQWhVp4NnI+INjoDp5E
	/Y8vywKuB0gf4EdDFJVSNXMHCH40e0+gl7NSIgI77frA7C3Wh9VFZwZpSxmg0pQS0WY6G41st2c
	05uWEjJyhX8lkjq
X-Received: by 2002:a05:622a:548:b0:50b:34b7:fd62 with SMTP id d75a77b69052e-50ba388e98emr73972301cf.25.1774698648335;
        Sat, 28 Mar 2026 04:50:48 -0700 (PDT)
X-Received: by 2002:a05:622a:548:b0:50b:34b7:fd62 with SMTP id d75a77b69052e-50ba388e98emr73971941cf.25.1774698647805;
        Sat, 28 Mar 2026 04:50:47 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13fd743sm412475e87.21.2026.03.28.04.50.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Mar 2026 04:50:45 -0700 (PDT)
Message-ID: <e0d704f8-180c-4167-90f0-a9052d8f85b3@oss.qualcomm.com>
Date: Sat, 28 Mar 2026 12:50:43 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH v6 1/2] platform/x86: int3472: Add TPS68470 board data for
 Intel nvl
To: Arun T <arun.t@intel.com>
Cc: sakari.ailus@linux.intel.com, arec.kao@intel.com,
        ilpo.jarvinen@linux.intel.com, dan.scally@ideasonboard.com,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, mehdi.djait@intel.com
References: <20260327181959.3528753-1-arun.t@intel.com>
 <20260327181959.3528753-2-arun.t@intel.com>
Content-Language: en-US, nl
In-Reply-To: <20260327181959.3528753-2-arun.t@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bO6f4JWz-B97ME044_lxk3y21JPnYJpO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI4MDA4NiBTYWx0ZWRfX8vAOu4fk9R9I
 3Z4Yo2jJia+uXOndJXEsj+k8OS6HSJxdffFmb+6Swl92AXV7iu7ykihlSIqcyYth8j+x3MwsA+J
 M8EaMjU13xqynexDzCTJCh1fvdP72+C+ikGs5hCuiXuivj06iW+wbmOuxFZjE3vZjF5NycpBOSq
 tBqS3+9ymK/dZMBP2RBm1146IZHxFvFy2P2RPSoaWeUHVUm0pUAXdZ90A9Dya9W4xRD+egt7A5a
 N1WX+ah8Kv1KWVz9ZQn/4SuoKQvV4SytqI/La3zGy8Nwo4PaE2brlRKp4NhmLFPwK2/JFql7Pzg
 RJaSwVGWMz5NiZ96BXlpa22RsqQdZvvwFv95VCOeoNOSoRSxPZJIvOm8lgYI3b+FgdDP7k7hCOs
 ELilQ99bm7hYvU+bHtQpuuEHaniS3/Zdy6kRsH200vKYosHG68bqUHplBAz7AopPK/7M6CcytWf
 vKBqPzzNeoukGicCC1g==
X-Authority-Analysis: v=2.4 cv=KN9XzVFo c=1 sm=1 tr=0 ts=69c7c099 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=QyXUC8HyAAAA:8
 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8 a=MB0jrDmmLyahN4NmXrMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: bO6f4JWz-B97ME044_lxk3y21JPnYJpO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_02,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603280086

Hi,

On 27-Mar-26 19:19, Arun T wrote:
> The Intel NVL platform uses IPU8 is powered by a TPS68470 PMIC,requiring board
> data to configure the GPIOs and regulators for proper camera sensor operation.
> 
> Signed-off-by: Arun T <arun.t@intel.com>
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



> ---
>  .../x86/intel/int3472/tps68470_board_data.c   | 121 ++++++++++++++++++
>  1 file changed, 121 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> index 71357a036292..f0309fd1e515 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> @@ -143,6 +143,20 @@ static struct regulator_consumer_supply int3479_aux2_consumer_supplies[] = {
>  	REGULATOR_SUPPLY("dovdd", "i2c-INT3479:00"),
>  };
>  
> +/* Settings for Intel NVL platform */
> +
> +static struct regulator_consumer_supply ovti13b1_core_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("dvdd", "i2c-OVTI13B1:01"),
> +};
> +
> +static struct regulator_consumer_supply ovti13b1_ana_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("avdd", "i2c-OVTI13B1:01"),
> +};
> +
> +static struct regulator_consumer_supply ovti13b1_vsio_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("dovdd", "i2c-OVTI13B1:01"),
> +};
> +
>  static const struct regulator_init_data dell_7212_tps68470_core_reg_init_data = {
>  	.constraints = {
>  		.min_uV = 1200000,
> @@ -220,6 +234,77 @@ static const struct regulator_init_data dell_7212_tps68470_aux2_reg_init_data =
>  	.consumer_supplies = int3479_aux2_consumer_supplies,
>  };
>  
> +static const struct regulator_init_data intel_nvl_tps68470_core_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 1200000,
> +		.max_uV = 1200000,
> +		.apply_uV = true,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(ovti13b1_core_consumer_supplies),
> +	.consumer_supplies = ovti13b1_core_consumer_supplies,
> +};
> +
> +static const struct regulator_init_data intel_nvl_tps68470_ana_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 2815200,
> +		.max_uV = 2815200,
> +		.apply_uV = true,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(ovti13b1_ana_consumer_supplies),
> +	.consumer_supplies = ovti13b1_ana_consumer_supplies,
> +};
> +
> +static const struct regulator_init_data intel_nvl_tps68470_vcm_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 2815200,
> +		.max_uV = 2815200,
> +		.apply_uV = true,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +
> +};
> +
> +/* Ensure the always-on VIO regulator has the same voltage as VSIO */
> +static const struct regulator_init_data intel_nvl_tps68470_vio_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 1800600,
> +		.max_uV = 1800600,
> +		.apply_uV = true,
> +		.always_on = true,
> +	},
> +};
> +
> +static const struct regulator_init_data intel_nvl_tps68470_vsio_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 1800600,
> +		.max_uV = 1800600,
> +		.apply_uV = true,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(ovti13b1_vsio_consumer_supplies),
> +	.consumer_supplies = ovti13b1_vsio_consumer_supplies,
> +};
> +
> +static const struct regulator_init_data intel_nvl_tps68470_aux1_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 2815200,
> +		.max_uV = 2815200,
> +		.apply_uV = 1,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +};
> +
> +static const struct regulator_init_data intel_nvl_tps68470_aux2_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 1800600,
> +		.max_uV = 1800600,
> +		.apply_uV = 1,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +};
> +
>  static const struct tps68470_regulator_platform_data dell_7212_tps68470_pdata = {
>  	.reg_init_data = {
>  		[TPS68470_CORE] = &dell_7212_tps68470_core_reg_init_data,
> @@ -232,6 +317,18 @@ static const struct tps68470_regulator_platform_data dell_7212_tps68470_pdata =
>  	},
>  };
>  
> +static const struct tps68470_regulator_platform_data intel_nvl_tps68470_pdata = {
> +	.reg_init_data = {
> +		[TPS68470_CORE] = &intel_nvl_tps68470_core_reg_init_data,
> +		[TPS68470_ANA]  = &intel_nvl_tps68470_ana_reg_init_data,
> +		[TPS68470_VCM]  = &intel_nvl_tps68470_vcm_reg_init_data,
> +		[TPS68470_VIO] = &intel_nvl_tps68470_vio_reg_init_data,
> +		[TPS68470_VSIO] = &intel_nvl_tps68470_vsio_reg_init_data,
> +		[TPS68470_AUX1] = &intel_nvl_tps68470_aux1_reg_init_data,
> +		[TPS68470_AUX2] = &intel_nvl_tps68470_aux2_reg_init_data,
> +	},
> +};
> +
>  static struct gpiod_lookup_table surface_go_int347a_gpios = {
>  	.dev_id = "i2c-INT347A:00",
>  	.table = {
> @@ -258,6 +355,14 @@ static struct gpiod_lookup_table dell_7212_int3479_gpios = {
>  	}
>  };
>  
> +static struct gpiod_lookup_table intel_nvl_ovti13b1_gpios = {
> +	.dev_id = "i2c-OVTI13B1:01",
> +	.table = {
> +		GPIO_LOOKUP("tps68470-gpio", 9, "reset", GPIO_ACTIVE_LOW),
> +		{ }
> +	}
> +};
> +
>  static const struct int3472_tps68470_board_data surface_go_tps68470_board_data = {
>  	.dev_name = "i2c-INT3472:05",
>  	.tps68470_regulator_pdata = &surface_go_tps68470_pdata,
> @@ -287,6 +392,15 @@ static const struct int3472_tps68470_board_data dell_7212_tps68470_board_data =
>  	},
>  };
>  
> +static const struct int3472_tps68470_board_data intel_nvl_tps68470_board_data = {
> +	.dev_name = "i2c-INT3472:04",
> +	.tps68470_regulator_pdata = &intel_nvl_tps68470_pdata,
> +	.n_gpiod_lookups = 1,
> +	.tps68470_gpio_lookup_tables = {
> +		&intel_nvl_ovti13b1_gpios,
> +	},
> +};
> +
>  static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
>  	{
>  		.matches = {
> @@ -316,6 +430,13 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
>  		},
>  		.driver_data = (void *)&dell_7212_tps68470_board_data,
>  	},
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Nova Lake Client Platform"),
> +		},
> +	       .driver_data = (void *)&intel_nvl_tps68470_board_data,
> +	},
>  	{ }
>  };
>  

