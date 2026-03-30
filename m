Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5003D16E9
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 13:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774877024; cv=none; b=QA2AO8DiEkL4IXJi6AI1drwrDQfRzWQQGOyB3FlNXtHJayiylI0sklG8vV/zx0nT2S2UIrIvtWxbpJkAobtBn4+e0aa1C/Vu2YBQ8CxZ8zAwgMhHXDCFGidceBOwklYUgokgqzElIx2+gJlS6KsKix/OGewIK2DCu20/1koSbYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774877024; c=relaxed/simple;
	bh=ccwAPDLYGQjPtdl31RF4Fw66TPf6AcwS3tgxgEGqTFE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=UsqVeqMlYxzHbweo9XbAoP9bPv7ly/5KUInkx2fArtHbFlr1f/TRfLL4g8Klhl1jwjhGyqnhQYKrdN7wbdBWPzobvoTBwaKF81vkxepKJIO7JmgB5RRadBGyxgvBpnUvvapauQtt+wMC4vM2LghJu2O9KLwmMr8J2rJWUPUiNUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lUS83M+N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SlvE1aZN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lUS83M+N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SlvE1aZN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UCcX0u3195192
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 13:23:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iYA7phhPY60G+xOMhDYSfTUyTczEmcMQWXzCL/xJY1U=; b=lUS83M+NksSBa4tx
	o0W4HtH85mEdsqFbWEiarFqdEetz1J8lRvAWyFI3wy1mvcsRJAejb6QynzWNgvLQ
	Iahki+qCjU7W81kSV+Jq7Kh/TqxIHr2rP8Jm0wzEzV/QSi8Dak9198JSUbPnQ+3W
	lxcz4fWSY4KH5IPZUAX5fB8uo57xgXejR4TM3LrLscuE3XfDf8YAqEyHKt3woffY
	xKKLrC3dwSFqpZmQC4VtvFD0nGgXswwCoHj12nbbpF2DGj+++22Q6VkB5k6MJei/
	lgG+olcDmepxeLaK418Z6Bv+7vfW14be4mM2uILoZBVg9RKA5IMdZYu40b508Arc
	rPlF/w==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7sbwg5cy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 13:23:42 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-953c062b2bdso1675956241.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 06:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774877021; x=1775481821; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iYA7phhPY60G+xOMhDYSfTUyTczEmcMQWXzCL/xJY1U=;
        b=SlvE1aZNTMB5haRdk37YFTpTu3owmcuBIrpPibxuRcqCBcjnIVm3tlTYUyEoFj9J66
         WMYDs+j2YA6yH5Ka4nUtzt1NKQPzQ352tzp1/uC2ligo5iq3IdHfKpf+HQ8S5Uz9R3Yd
         CuDbBMQutu690/3KAqAz8feK1cHS2wtwcLvIxKG0QvWA1YlVlvntclmI8alwHCOGihLK
         +R6KimhGbqXVIy67wShZC2zIugPXQ3yRe9C3rfwy4jBW5fKJsyk7GQBPjf8BRmsZ9Ms7
         BkXdM7+msNpvelxdC87CthosUrempilqlBwz+EU0b8WBRf3HKVcwdR91Zq6BCk96Dg5B
         HqEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774877021; x=1775481821;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iYA7phhPY60G+xOMhDYSfTUyTczEmcMQWXzCL/xJY1U=;
        b=jwqFrqo4dvN/zyUNViYbm3igq3CE8vPykdjRCmkJrPvJv0kvupoSG4mLseq2j/yFpX
         CEkvK9r7NhL1v/8dw9LygkxrMlwmaWhCKMPox3qyZBjpOIiNLydfpskEByUWFy8vdMMr
         AsG+wuWfRGxOcySxnqWg6a3LR30tJhb/6eWdR37nbzbiOLE988j5LXEKmJD1IRq83GGx
         XwT0iThFQR/Df+/kyIWpkdx6/IdT1TsfsvkvCG4CehjV37Gg+LHb+kStHppGgIVoZKmd
         19fXgPt3u/NIHMafQSVUB/JaHQeD/yMfpayntcfCHThEfpOr7K5/HspMOBpX3+z3AiwR
         94+w==
X-Forwarded-Encrypted: i=1; AJvYcCW/QpTZxKB3GWTRs0dyQ31AiDhpTpl/YqecgoJCDpLamuApwbjW9NiKHUTqSbHvZdBb31ADbJb7Z0KETRpyqpWILHbd@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9ZzXawSDYJ3gSbbksym03TmNL3y+ad/3eOV18Ufh4vZjO+d0i
	dQSi85wQUH1893MfcHDZJxFtc7WtwBLIieDuHNagNl3YX0bV8Evtp6uyJ6JEKt1jZLB38NiMtR0
	VYNn5quHQzdw9wMDAARupPgf3eWz1fQEHFBLr8PyuQWKe6sgWctTpiBmeLhfUkPhZtjEePQ3x+o
	Gq
X-Gm-Gg: ATEYQzzXnljnCNm/v9c9KnZOrdeMBL0ZbPqPiKOyl/Q3R0EAEyTyVubPO6xPN5+QSOk
	LTRW+jkfuAuQQyiRD8GRJGtOQX7OUZZjLj/cAfKDvN3BjZJcYVkVbm8wqPwUvQO0ZwHloCeWxAK
	AHmgCZhuD2r4VGVXhSEJksKifhWMkLlBflTa6WwbOm7qTgrmgKEfUyUZqy3nuSvA9/zmlKaxTz5
	p4bGI0+EwGAXwq5TjsbgWeuJ2QSHwXE1f2EaQMJOTFrhqgvUqtwAvRXkKyLS3a+f+TDdgA7h9pU
	kw5ARKzqcomaXGQRkLV9PUkI8Nn7KEzTKvHmVPJV4OApjt+lnDBbnwQmtvK2uFQ92HtGTw7y/+S
	x39GpTGMIRXoM9o5peTD2/cacoNdNcJajkWpPwEDYt43fgwuTC+4t33VQw419e/UI7BQo112imA
	0t0DgJBLIkTMDyuYa1A+J/H+O5niR6Io3bMtfdoD2Jtc2sJsZWzx46gjrOIQZUDgzIkWFOWhR1Q
	F6VvFckcs4xo7Ew
X-Received: by 2002:a05:6102:c53:b0:5fe:c17:a2aa with SMTP id ada2fe7eead31-604f903dd39mr4885651137.5.1774877020929;
        Mon, 30 Mar 2026 06:23:40 -0700 (PDT)
X-Received: by 2002:a05:6102:c53:b0:5fe:c17:a2aa with SMTP id ada2fe7eead31-604f903dd39mr4885602137.5.1774877019233;
        Mon, 30 Mar 2026 06:23:39 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae269ddsm291601666b.5.2026.03.30.06.23.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 06:23:37 -0700 (PDT)
Message-ID: <76baf0c3-4c1f-4169-846d-5c74dab69a18@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 15:23:37 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH v5 0/4] platform/x86: int3472: Add support for GPIO type
 0x02 (strobe)
To: Marco Nenciarini <mnencia@kcore.it>, Daniel Scally <djrscally@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <ab0URIrzZPsYjWrM@spark.kcore.it>
 <20260327181031.1489365-1-mnencia@kcore.it>
Content-Language: en-US, nl
In-Reply-To: <20260327181031.1489365-1-mnencia@kcore.it>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: e9BuCDwBTVsYrXwvAKC_EMZrfDvwUG-4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDEwNCBTYWx0ZWRfX7srEPsKK65j8
 +2UAzsPXlaF5bAzIkxIn/f59nIOGWkGNO4/NAT6WAtYK/UrZsdcG6NHaOxno3OumiotXaaSlqts
 JT7ND5UNDsP7sWTgI35e+5NCMM8HrkBbQj1yP2+ywefg1/sJxPF7f2L3TzJzTPlvFuuXzVZPNxB
 A1airOgCbh77/z170DfW+RqeSKqnRyfAt4QeiRxLWRux/Zfbm/Uw623lqKjKYw3p9GzawLaWUUm
 qkuuO7B+nKW+83h/JkxRVGalt3R3jonv0wRpBLPtTgkMevLhZXzzd41IPPy+rrBmJVpliGMBCa3
 d9XI3aJYpobZVmxZpqtQiRWJp2UkpLR4LLrCtkBxhhtrjNbT34FF7zypDqUBc/B6BCRLjh09tt8
 vpiB8CNgzhmEwLUNRinMlO8HJ3zbkLARKupMzmb0V/5Y7iic+Px45ZZk0txkMdlmlcZ9K5l/K+L
 zqdmDgOrm6MLhqm2WIg==
X-Proofpoint-GUID: e9BuCDwBTVsYrXwvAKC_EMZrfDvwUG-4
X-Authority-Analysis: v=2.4 cv=TIpIilla c=1 sm=1 tr=0 ts=69ca795e cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=BJLo64b_egJAlfqrI8IA:9
 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300104

Hi Marco,

On 27-Mar-26 19:10, Marco Nenciarini wrote:
> Add support for INT3472 GPIO type 0x02 which controls an IR strobe LED
> used for face authentication on some laptops (e.g. Dell Pro Max 16
> Premium). Without this, the kernel logs "GPIO type 0x02 unknown; the
> sensor may not work" and IR sensors paired with a strobe LED cannot
> function.
> 
> The series first refactors the existing LED code (patches 1-3), then
> adds the new strobe LED type with multi-LED support (patch 4).
> 
> Changes in v5:
> - Swapped patches 1 and 2: local variable refactor first (on pled
>   names), then rename, per Andy's suggestion to reduce churn
> - Dropped enum and lookup tables in favor of simple function parameters
>   (string name + bool has_lookup), per Andy's review
> - Multi-LED infrastructure (array, counter, has_lookup) only introduced
>   in patch 4 where it is actually needed
> - container_of targets struct int3472_led directly (single line)
> - Used C99 for-loop variable declaration in unregister loop
> - Renamed LED from ir_flood (v1-v2) to strobe (v3+) to match the GPIO
>   type name in ACPI _DSM tables and align with common camera
>   terminology for IR illuminators. This rename happened in v3 but was
>   not documented in the changelog until now.

Thank you for your work on this.

Besides Andy's comment I've no comments on the code itself.

But this does expose a new userspace API in the form of
a e.g. OVTIxxxx:00::strobe_led LED class device.

We really need to get some input from the V4L2 maintainers
here on if this is a good idea, before merging this series.

Sakari the discrete (GPIO based) INT3472 power-sequencing
sensor companion device for the *IR/monochrome* sensor on various
ipu6/ipu7 lists a GPIO with type '2' which according to
previous patches from Intel translates to "strobe". Strobe
suggests it triggers a flash, but in reality it seems to
be an on/off GPIO for an IR flood LED to IR illuminate the
scene when using the IR sensor.

Since this is just a LED on/off signal exporting it as
a plain GPIO based LED class device seems to make sense.

For now this patch-series really does nothing other then
making the LED show up under /sys/class/leds . I think
eventually we will want the v4l2-core to do something
with this, like with the privacy LED. I can even imagine
a default simple mode where the v4l2-core just turns
on the LED when streaming starts and off again when
streaming stops (very much like the privacy LED) and
then in the future maybe we can extend this, e.g.
add a control on the sensor device to make this
configurable ?

Regardless of the exact way we want to deal with this
on the V4L2 side an important question for now is if
it is ok to export this as a OVTIxxxx:00::strobe_led.

I believe it should be, but we really need your input here.

My main remark on the current patch set is that IMHO
the LED name really should be: OVTIxxxx:00::ir_flood_led
since that is what it actually does, strobe is typically
related to flash LEDs which despite the naming in Intel's
side this is not.

Regards,

Hans






> 
> Marco Nenciarini (4):
>   platform/x86: int3472: Use local variable for LED struct access
>   platform/x86: int3472: Rename pled to led in LED registration code
>   platform/x86: int3472: Parameterize LED name in registration
>   platform/x86: int3472: Add support for GPIO type 0x02 (strobe)
> 
>  drivers/platform/x86/intel/int3472/discrete.c | 16 ++++-
>  drivers/platform/x86/intel/int3472/led.c      | 61 +++++++++++--------
>  include/linux/platform_data/x86/int3472.h     | 14 +++--
>  3 files changed, 59 insertions(+), 32 deletions(-)
> 

