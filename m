Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9615C32ED25
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Jan 2026 16:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769702555; cv=none; b=ajOqD9gScFJ6FZYmzmbM4CmjQbG5ZpipQZM9FtON/8i1rCQLHVuKCzprUfs9N61BV6yqz4JVIxbb7Jw79dxZ6h8SO5k1ZTPL63w16BPI/Xw9twuJ8RN5zoyUjIwYJKmlOcyjRTTKHLTiurCg1os2ij9wZ0JTuqON9lZMx55NyFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769702555; c=relaxed/simple;
	bh=08QOlsqCxUff6qhLn0jxifoWLp0ueQPzXmuxRrlcNZo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=MlTrnywy+1ZbgNxmtGkhwfDDbVNzYVG/4wCguaZdB/CXgzHnAoui/4+YQulpALoGkA8P+XJ/9QFDT/gOUQa57spx3rNk56cWiKXX/SqIirae897usRRmIeRaJh0i+J8Yh/UClMaxdI6EKn9aPoE8JP8/9IpYt1nsXAAakhbmYUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JRDQB4sX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UAuVofg9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JRDQB4sX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UAuVofg9"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TG20Jk3733050
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Jan 2026 16:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ifaldSceYXKqfedw+8k2x6L1CWZ3ZSA5wfqYD2Rqqs0=; b=JRDQB4sXr1W07rLA
	aj1QTOe612Q47r2cLU2LLh4yQCWULk3MjzbLP+BzHbTFjvsQmUyR641VpWGTFu8J
	WL3jG+7kiiot51any4FMBmn26WbRu4u3/8m0NPfQ3buTz/gni8oJX+ZEYq/QOnH3
	99ZZnp8PmLjFAPZXxZV0V8KSix9NB43oEPNY1ukhNA9lx4qP3+Wfl2xXrVERM3gx
	yeVKWMsJxWk1ixMjp5IIQZnPv++fftRKippEyPBZzBSTo+UeopFKDlqVa6/cCslq
	hK5uZ+6YphWrq84ZmD8SDi4NuhQRyhrScT3/34m/KmJXDzMoefBoykrlErxmWKCP
	vSkb2w==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0aqd80aj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Jan 2026 16:02:32 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5635edf78bfso3015273e0c.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Jan 2026 08:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769702547; x=1770307347; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ifaldSceYXKqfedw+8k2x6L1CWZ3ZSA5wfqYD2Rqqs0=;
        b=UAuVofg9DdBKDdAHjy08TRY/eKoLqif6DgaxGxjmo34S3nVA2sZWcQIdmH2xc+T2KA
         t8Ppjml+FLT6ebrIk/8tQhoDc8JT8JYy2gEOf4Lni7jQBNkRgAJcDYA1vjw+2ZMyr7eD
         fT0VyxkhKcn05PvhmiX+SiIfK/jUzhJCIkB0YJC5CEfu0laiEWGpFPn3LJAASGtW/k3J
         7aqCtn9K/XyEtq9UOwaVB/EetaQtGpgM4+T+PDSOSVjgPpqXKB7joprWBcpvQY2DLSuT
         hfUqchuUvuAjUcR8F9YJPg2az8Y+V7ZGW0p5+KlmI4nhf+0KoMsFUdKYuQ/KWvrZ+PTq
         fptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769702547; x=1770307347;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ifaldSceYXKqfedw+8k2x6L1CWZ3ZSA5wfqYD2Rqqs0=;
        b=E9eiXECDxE4Jf9YyNNfCqoNiV2Enid9Y2lWLxdTlB86eExPJhTHsKzooZhb8ZPHBxw
         NxwFfyd9rbPdA8Uq5tOvLhgzjbJxP0hi9O+elASfFNp8SodECjCglgLQtTwIBJuv3OgA
         FGAsmSB1e5Ita5ADrZ5VboIuCiFqxs/4Qy+IU1m7emun0XF/XSQNFLMuG9cMxMbCr1oA
         CQVcsOJTJqqmR20EbjI9A9ObOAmhO140Eo4qC/kGAsAVJqGcS3/WBmJXwpL41nNA0aoe
         DYp/aXnYAKaUn9dp2HwYaaGJHERCGD1ReNTqBzJq5RRjQzDqLXOUH2XBsuz90psw5V4o
         nf4A==
X-Forwarded-Encrypted: i=1; AJvYcCUNdshkPjLTbZI4oU2xN+V/hx3vDRmr5CTC6A8C9WA4o3mWVi+X5edeEgiE0Ou++QcLWhjrlK8Pn8zsSpZr1m/7hrcu@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9Ta3zZBBSWyT13J3p/6L6BYLT2nzTzyLfN81HJO7+Bgp3V0HN
	rUxIitZdTewn1d0HD5srvuhVsDRtNrnQH5mPdqjXyc4siDt/DeFc9q3iyml4TJwPNMgHgcSG125
	YMIxjxlQ7xMlbvRqA1UHy/SZfSZk2ud3opw+8pT5WFtXugkCUjJuQMelEyVheJgwdghbLa8cO5E
	3W
X-Gm-Gg: AZuq6aIUja/APrBbL47zUqGupwDGpEd2RlD+xx4Vv9Ci27TlwW/TmBVcsBialf12fpX
	M4ba+JaIU7D6B+eoB94VKpKlVm0PjZWptjUHMsMSWlYpNJz6CfEbInKP1aceKeqpqm+kwbWjb4g
	AoOZnfOG1F4iUamVxEfSIh+V6g6UHO3odM6KDXbSJbAFAELaCqiBKvRxHM6C4PO4K2pbGmcgAyq
	kulVMTDtKR3hKr73OttnDwK/oWvwHDx4i1pyBV0aV2O3opq9EhmTV+XLMHejlhPqk1dcDvu20A7
	TOYrvBinSK0kKY8Rofthjo4WAxCIgJAc7ttv/tC9R/7tL6WOgpfMCAFsc7ydsBwIUDzlUnv7S8g
	jzIIM3gBxDN+avzaHO1bRljv45kiVsc4ilDP2YmgS7LUAIa+2J+YDNrGyVHmbEqp+M/BE5WQRKN
	iM53jdwTmyz4MDMM1wpjIcDDgpBrwoJD8JQi86dKJwqTnvSuyWoIZ9qcDkAXy1No4sKDVdq9fjj
	QXF
X-Received: by 2002:a05:6122:ca5:b0:54a:992c:815e with SMTP id 71dfb90a1353d-56679502f80mr2719325e0c.8.1769702544258;
        Thu, 29 Jan 2026 08:02:24 -0800 (PST)
X-Received: by 2002:a05:6122:ca5:b0:54a:992c:815e with SMTP id 71dfb90a1353d-56679502f80mr2719240e0c.8.1769702543451;
        Thu, 29 Jan 2026 08:02:23 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b4691d15sm2978663a12.19.2026.01.29.08.02.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 08:02:22 -0800 (PST)
Message-ID: <62f3302a-a78e-4f31-bba5-fd289f3e27f6@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 17:02:21 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: add DMI match for ARC 11.6
 128GB HD
To: =?UTF-8?B?UmFmYcWCIMW7dWNobmlr?= <rafal.zuchnik@gmail.com>,
        platform-driver-x86@vger.kernel.org
Cc: linux-input@vger.kernel.org
References: <CAJ10sVKe+kV3erD-cYREV0g=r6biKm+OatPJFHncnyrYDp8wiQ@mail.gmail.com>
Content-Language: en-US, nl
In-Reply-To: <CAJ10sVKe+kV3erD-cYREV0g=r6biKm+OatPJFHncnyrYDp8wiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: qMYNwaUl90Qn2cAPj3L6mh417k6TuRfV
X-Proofpoint-GUID: qMYNwaUl90Qn2cAPj3L6mh417k6TuRfV
X-Authority-Analysis: v=2.4 cv=GNAF0+NK c=1 sm=1 tr=0 ts=697b8498 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=-8iU96UmxKHG3qEprpsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDExMSBTYWx0ZWRfXztPkDv84oiwt
 BrArXJel7OhVBtJ8NXZ3inpBjJ/NzmYGx58iVlQ2hrE55eNeNa9a2xoPZhNpo7W/8N1ejgBnyQc
 NKTbIksp8N2ePghDW3/TTLGZLgPFacgDiY/ZSXMlyJMwYRqWkWVh4ukOo0K1LhZs+JLiReWLnjp
 NomuFiVTtwUxpA2tqFvVTSr/Cs9/QNXWqa3PTuVaH+K6e4Jh/l9jVP9eY6jZL6wmbyzCQitih6o
 6HxNpW7nduWk2Gabxmwd1jYnXYveC32vRg/T3+bmqTeGVvlpg6l7xSfJL1z7sBPMS0Z5gvhmZPZ
 +oM634dv13949biKsqdqKy5PYQcKlmHmBcj0zmkm7rJvDDa8GjwheXrpvPvQkIx/ygwuKeuKkC+
 1N/SP9vqp0BWz334HAUZ3INl9U/n8H0ru7nCGk14wDEwJI+XjH6UHYdYhvidqRk2+k21SJHowRX
 LT3gVhdLpwnF5fBiEqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601290111

Hi,

On 28-Jan-26 00:52, Rafał Żuchnik wrote:
> This device is identical to Techbite Arc 11.6, but ships with a different
> DMI_PRODUCT_NAME ("ARC 11.6 128GB HD").
> 
> Without this DMI match, the Silead touchscreen reports an incorrect coordinate
> range, resulting in partial and wrapped touch input under Wayland.
> 
> Reuse the existing techbite_arc_11_6_data for this model.
> 
> Signed-off-by: Rafal Zuchnik <rafal.zuchnik@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans




> 
> ---
> diff --git a/drivers/platform/x86/touchscreen_dmi.c
> b/drivers/platform/x86/touchscreen_dmi.c
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@
>      {
>          .matches = {
>              DMI_MATCH(DMI_SYS_VENDOR, "mPTech"),
>              DMI_MATCH(DMI_PRODUCT_NAME, "techBite Arc 11.6"),
>              DMI_MATCH(DMI_BOARD_NAME, "G8316_272B"),
>          },
>          .driver_data = (void *)&techbite_arc_11_6_data,
>      },
> +    {
> +        .matches = {
> +            DMI_MATCH(DMI_SYS_VENDOR, "mPTech"),
> +            DMI_MATCH(DMI_PRODUCT_NAME, "ARC 11.6 128GB HD"),
> +        },
> +        .driver_data = (void *)&techbite_arc_11_6_data,
> +    },
>  };
> 

