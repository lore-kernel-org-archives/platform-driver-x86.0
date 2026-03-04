Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D517B23EA80
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Mar 2026 09:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772616774; cv=none; b=pPem7tZmZ9PVIxFxz5oBX1YyoW2M2a22AiZw2ubJjYTXBWoVZ//n9dl3YsXS50EjFCSUdKW/nm9LVB3LF6tmhg+e/4s9FpURN5gWGi2FaCJEM0cTKnzKXjmBhVQJZkgjRXO5FOh5oCTF/PerObl9EZ4Rt+5a6pfYYWBD932dNAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772616774; c=relaxed/simple;
	bh=Z/eJE9wFLrz8E+sUg7CGHUvq6+8QleCiP7NDH8UwBIY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=VEmRdcy9ZqHMsdpZNs6/+a5R6Ez9iUNU6BbpdjEjA32bRpktg0NjzPjQmspkDKLxaZNHrXOpfpVWDeVeOP9pGrOWgMz6QEq1cr2C7qpPgxxZDSZYr5Kxyrx8583vNhtIYPn1MS/N6Arhon1/+8ps3DzGhbwTYgNHkxL24ktnnEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dDo55Ke0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TirpKM9g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dDo55Ke0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TirpKM9g"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SVtA631908
	for <platform-driver-x86@vger.kernel.org>; Wed, 4 Mar 2026 09:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bx3wpMkjZfdqRG0nPg8aof67AqNz/1s49xLwUjoGMng=; b=dDo55Ke0HYDMNGzK
	+Jd7adVzH9AX56D2xTbafJZMtcDuD5PGwkIkzA6vZMc2IbTDxxxgk82FDLqwC4qs
	Sp45f9qA6q1a8fVr9UkP8uros5vORMnWQkbiN4iGy/Ddri3/kaQg8VlDCXEfT3Jp
	lfvCp932loKgmRCSloII/3AVCV9relFNZp2W0CALOlwanIlTXv6xXBxSpn81neoX
	pH+IbzrPc4HNcCNqJsWij9UuKM84ma9gdlTjRwaZSPsjpshjK+2k4BkKvqmHTFc3
	+xHnFNn8C8PNpNbKBlibogvyS1I4dRucwMm/4bjsqKD7Xh7iKoVv5tyxpYrx5RsT
	i0o/0A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvtucfpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 04 Mar 2026 09:32:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cbb8040f48so4724893685a.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Mar 2026 01:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772616770; x=1773221570; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bx3wpMkjZfdqRG0nPg8aof67AqNz/1s49xLwUjoGMng=;
        b=TirpKM9gKYGT6qKkkWcx967quXrlmoDWK1Ooe7bHj6LzwAUKwGVSgrwuT62o0vWSZG
         L71lC9n2I5ehd/HkKN+R9juRBLVt5EDmYQcpfVU4hsdoFynCboEaaLxBZRlxGrWeg5W6
         tIRoHIbbfAPuLQVoARnmjyBw6uNRrpuZe+94enYMdKhPmUirTMQiayzYGBHZKvBRjZbD
         bVEpRIb7ZlozFj0MiufGwidMhh2kiT3Cb/tZ3KvalPOToR0JKHqIaUFYHwukn8qIrH38
         dNOiOn/VBU7vWjatPyEWaWjJFOJtaBtRScf6+qSQXm92/a2Ny6qaN2HR+U25taQUQmvv
         nKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772616770; x=1773221570;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bx3wpMkjZfdqRG0nPg8aof67AqNz/1s49xLwUjoGMng=;
        b=sVVuHeICT+BIC91Qe9rhUOOufGL2jAPYLD1BhLjOU6YenRV5Dkawh9w39nb8V3ETJ+
         t+aEoBpCgnkOXWMbCgCTeggjAnC/3Vvy9qj/zIH5LHHA6m6XPOTn7RUJtfgZ/MEiNl1d
         a6Jj5s2//qYFEjEwls4ShJ0BnfXDgD/VBHBpnX8C4r4mwQ+lt7jEQsNunc+wQhNXHovx
         sq9738pql7I9cH+nelLy6BrtFFOs2hGKkzoajVOm+j3SWIJND0Ra8oXI3wgmBz64MUek
         kyvg9fybXFRrgPThJWQ68sx/eRTxEJlte25oV425X4lMEXgGHwJWDlg1RI8HbPSSd3VU
         DLcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJM/t96rtP57OC/vDLfqIZAGLiHFYDREPrdd+/i+o2iCQ/EZHftd1KRsdLozbA/GPhu3LVJIRIRW9J6FPgm788f1MR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5UNTYvqvftwFexsbsxxebDbaCuIH3i7lFjGNN5acDPKWZEo/s
	8PTLhai5zMgznnW5BrJJQrVebIoZkxUFJDN8gnGpWT7Y+zSlhMuoSd2PEcV1US/9p1oAUCHuvM7
	lSQph8fl+u5nUDl+p+rlcEp2XTvXC/7izDlT4coh03ojqLbrtlQzpES/FreVkGvtTNnjkH1DWmB
	Nu
X-Gm-Gg: ATEYQzzWN8mSp7wCImyeFSQKEbgbBPDrm9MNJkHiDAuf9YDCkA3DeiK1ax26cABUxLp
	QC9vTesJJ7Q4Fmm9r/8s/hpHGyZ+vcuPzsQIXa3vNRhu61Hh3dYaMn6yAOKbMkusAt70DWm2SFz
	AVqg7gcCXF3IgwGgTv4vGXFvywz4JtrvtIk817iG4olwy3fuB+1fBA8VnEvu73DAEF9Ezwc+Jn5
	Xz/OX8ZhaK4Z4XkqyoL2aKCCnZyVcausTjssRiNK/V++eaxIcudaxoeZchZ4Jyfs8QxJfcAWDO1
	l4Vts0FK9qramYJvf6Sxv9s3ztUChABHjPEP6vf5nYyFGimjgTDKMDSnJSyb34NF5q91VqIIDjH
	kbfRo3z+ZZZSQf7ASQtErA7I72SAAR+HVChbtfufQMdNla1Oy9PuDrJP5zniQ8M9nWsOZfD8NWa
	8AiXqOod2B77n3u4ATbiUQ6/FjlPYLSsXb08/T4Zf3oDNu9fqIod6Vjg1eVQDAkS31gzB1M/oWg
	wLZLC3XD3TQyNH3
X-Received: by 2002:a05:620a:4406:b0:8b2:e5da:d317 with SMTP id af79cd13be357-8cd5afac71bmr157119385a.54.1772616770414;
        Wed, 04 Mar 2026 01:32:50 -0800 (PST)
X-Received: by 2002:a05:620a:4406:b0:8b2:e5da:d317 with SMTP id af79cd13be357-8cd5afac71bmr157117085a.54.1772616769914;
        Wed, 04 Mar 2026 01:32:49 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-660bf4d8249sm1168978a12.17.2026.03.04.01.32.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 01:32:49 -0800 (PST)
Message-ID: <66ac63ff-7369-4683-b802-5f5d30f3f530@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 10:32:48 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH v3 1/2] platform/x86: int3472: Add TPS68470 board data for
 Intel nvl
To: Arun T <arun.t@intel.com>
Cc: sakari.ailus@iki.fi, sakari.ailus@intel.com, sakari.ailus@linux.intel.com,
        arec.kao@intel.com, ilpo.jarvinen@linux.intel.com,
        dan.scally@ideasonboard.com, platform-driver-x86@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        mehdi.djait@intel.com
References: <20260130092431.2335363-2-arun.t@intel.com>
 <20260302174644.1258718-1-arun.t@intel.com>
 <20260302174644.1258718-2-arun.t@intel.com>
Content-Language: en-US, nl
In-Reply-To: <20260302174644.1258718-2-arun.t@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fCLeuR4MMjB16tBldr8-4G067uShPctD
X-Proofpoint-ORIG-GUID: fCLeuR4MMjB16tBldr8-4G067uShPctD
X-Authority-Analysis: v=2.4 cv=A75h/qWG c=1 sm=1 tr=0 ts=69a7fc43 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=e0fhDsDLZYdukTk1vE0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA3MiBTYWx0ZWRfXzHXsYk044Wba
 KA+cmt7WvJcZDwpVxYlZBLnyH5CYW1xMqZJKtLDx9NuQRypM0jRwTWqyylQ++hWccVnNttIJTap
 HAg4zGCAkVgvxZEUNs6mJsKj+T35p/ejcZOH0yAPNwGPX3EzhrPQtk+uXgqqGppftlJngysskTG
 lJaipkhwNp3BhuMkwRAlxykjDAES1uDVZ6c42zSpwssXm1J6HbYd9/ueIPrGUxcuQGdokOtr7/z
 ggZPtqLCIKlIMy+41wpg+mu5pvJnuf9KRuY++zAIaWWliRAz9j91SPWViuHSA9zciy7G49vadDk
 NO9ewGVxDuWxw5X2T+Xuh4BifG/zpoDP393Z2N3yGIdw2Rezg8SzVAVv+46D+hZUKVG88fV1J9p
 RY9SGLIbuZg94NBOCYj+rwJ1ZgVrQNkpmpDiDq5r68yCpumOmQ3sG+FhdGB/j/0Gw3sRffStWCf
 OpwWszFyY24Bm0Yv42g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040072

Hi,

On 2-Mar-26 18:46, Arun T wrote:
> The Intel NVL platform uses IPU8 is powered by a TPS68470 PMIC,requiring board
> data to configure the GPIOs and regulators for proper camera sensor operation.
> 
> Signed-off-by: Arun T <arun.t@intel.com>
> ---
>  .../x86/intel/int3472/tps68470_board_data.c   | 150 ++++++++++++++++++
>  1 file changed, 150 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> index 71357a036292..1efc0f8e9ba8 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
> @@ -143,6 +143,34 @@ static struct regulator_consumer_supply int3479_aux2_consumer_supplies[] = {
>  	REGULATOR_SUPPLY("dovdd", "i2c-INT3479:00"),
>  };
>  
> +/* Settings for Intel NVL platform */
> +
> +static struct regulator_consumer_supply int3472_core_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("dvdd", "i2c-OVTI13B1:00"),
> +};
> +
> +static struct regulator_consumer_supply int3472_ana_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("ana", "i2c-OVTI13B1:00"),
> +};
> +
> +static struct regulator_consumer_supply int3472_vcm_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("vdd", "i2c-OVTI13B1:00"),
> +};
> +
> +static struct regulator_consumer_supply int3472_vsio_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("dovdd", "i2c-OVTI13B1:00"),
> +	REGULATOR_SUPPLY("vsio", "i2c-OVTI13B1:00"),
> +	REGULATOR_SUPPLY("vddd", "i2c-OVTI13B1:00"),
> +};
> +
> +static struct regulator_consumer_supply int3472_aux1_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("vdda", "i2c-OVTI13B1:00"),
> +};
> +
> +static struct regulator_consumer_supply int3472_aux2_consumer_supplies[] = {
> +	REGULATOR_SUPPLY("vdddo", "i2c-OVTI13B1:00"),
> +};
> +

I only noticed this v3 after replying to v2. As per my comment on v2:

https://lore.kernel.org/linux-media/0f2502fb-20cd-4638-8428-9a9eb5318147@oss.qualcomm.com/

this is still wrong.

Regards,

Hans





>  static const struct regulator_init_data dell_7212_tps68470_core_reg_init_data = {
>  	.constraints = {
>  		.min_uV = 1200000,
> @@ -220,6 +248,82 @@ static const struct regulator_init_data dell_7212_tps68470_aux2_reg_init_data =
>  	.consumer_supplies = int3479_aux2_consumer_supplies,
>  };
>  
> +static const struct regulator_init_data intel_nvl_tps68470_core_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 1200000,
> +		.max_uV = 1200000,
> +		.apply_uV = true,
> +		.always_on = true,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(int3472_core_consumer_supplies),
> +	.consumer_supplies = int3472_core_consumer_supplies,
> +};
> +
> +static const struct regulator_init_data intel_nvl_tps68470_ana_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 2815200,
> +		.max_uV = 2815200,
> +		.apply_uV = true,
> +		.always_on = true,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(int3472_ana_consumer_supplies),
> +	.consumer_supplies = int3472_ana_consumer_supplies,
> +};
> +
> +static const struct regulator_init_data intel_nvl_tps68470_vcm_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 2815200,
> +		.max_uV = 2815200,
> +		.apply_uV = true,
> +		.always_on = true,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(int3472_vcm_consumer_supplies),
> +	.consumer_supplies = int3472_vcm_consumer_supplies,
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
> +		.always_on = true,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(int3472_vsio_consumer_supplies),
> +	.consumer_supplies = int3472_vsio_consumer_supplies,
> +};
> +
> +static const struct regulator_init_data intel_nvl_tps68470_aux1_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 2815200,
> +		.max_uV = 2815200,
> +		.apply_uV = 1,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(int3472_aux1_consumer_supplies),
> +	.consumer_supplies = int3472_aux1_consumer_supplies,
> +};
> +
> +static const struct regulator_init_data intel_nvl_tps68470_aux2_reg_init_data = {
> +	.constraints = {
> +		.min_uV = 1800600,
> +		.max_uV = 1800600,
> +		.apply_uV = 1,
> +		.valid_ops_mask = REGULATOR_CHANGE_STATUS,
> +	},
> +	.num_consumer_supplies = ARRAY_SIZE(int3472_aux2_consumer_supplies),
> +	.consumer_supplies = int3472_aux2_consumer_supplies,
> +};
> +
>  static const struct tps68470_regulator_platform_data dell_7212_tps68470_pdata = {
>  	.reg_init_data = {
>  		[TPS68470_CORE] = &dell_7212_tps68470_core_reg_init_data,
> @@ -232,6 +336,18 @@ static const struct tps68470_regulator_platform_data dell_7212_tps68470_pdata =
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
> @@ -258,6 +374,23 @@ static struct gpiod_lookup_table dell_7212_int3479_gpios = {
>  	}
>  };
>  
> +static struct gpiod_lookup_table intel_nvl_int347a_gpios = {
> +	.dev_id = "i2c-OVTI13B1:01",
> +	.table = {
> +		GPIO_LOOKUP("tps68470-gpio", 9, "reset", GPIO_ACTIVE_LOW),
> +		GPIO_LOOKUP("tps68470-gpio", 8, "s_idle", GPIO_ACTIVE_LOW),
> +		{ }
> +	}
> +};
> +
> +static struct gpiod_lookup_table intel_nvl_int347e_gpios = {
> +	.dev_id = "i2c-OVTI13B1:01",
> +	.table = {
> +	GPIO_LOOKUP("tps68470-gpio", 7, "s_enable", GPIO_ACTIVE_LOW),
> +		{ }
> +	}
> +};
> +
>  static const struct int3472_tps68470_board_data surface_go_tps68470_board_data = {
>  	.dev_name = "i2c-INT3472:05",
>  	.tps68470_regulator_pdata = &surface_go_tps68470_pdata,
> @@ -287,6 +420,16 @@ static const struct int3472_tps68470_board_data dell_7212_tps68470_board_data =
>  	},
>  };
>  
> +static const struct int3472_tps68470_board_data intel_nvl_tps68470_board_data = {
> +	.dev_name = "i2c-INT3472:04",
> +	.tps68470_regulator_pdata = &intel_nvl_tps68470_pdata,
> +	.n_gpiod_lookups = 2,
> +	.tps68470_gpio_lookup_tables = {
> +		&intel_nvl_int347a_gpios,
> +		&intel_nvl_int347e_gpios,
> +	},
> +};
> +
>  static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
>  	{
>  		.matches = {
> @@ -316,6 +459,13 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
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

