Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0BA4035AA
	for <platform-driver-x86@vger.kernel.org>; Wed,  1 Apr 2026 13:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775050567; cv=none; b=sx/u3Rzd5K7we7umCABJXszI306LNOqLi8TYzVcxiOKbdmwVSQJUm+WWlC5LTtpTVJhcfvcJub9LMagK0Iacn+cSaUm2psiLmN0n16JQe3dqcCE1CrFvJ/jrq4ok+qY833CSdWat2KTc2G5/EOSIEN33WmRE/iBb9N9gnDJu+7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775050567; c=relaxed/simple;
	bh=ti4R8oexXn+OJA745yjlFiW13FWx9mVLKg0pKebToC0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=SMG2bFVT/3hm4qK6hNFfQ/ZTtuqctT9+OUaK/QS28cJzGHtsrXqmmH+74brGDKUyP8zBTn/92ZMQ2+iUA+lQ8l3vCC0dyYQBrNvqYRSMZSyjlXh29w0l8BqcJU6s49GMzzdRfntdpDi83xVhO8ZZ2iFHGiJ1WKonQF9KjIRUFS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OKdevTQy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BjrsA7ac; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OKdevTQy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BjrsA7ac"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6318o68X1459470
	for <platform-driver-x86@vger.kernel.org>; Wed, 1 Apr 2026 13:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	65IFvKQl1RiHWZxxj4dKFyqz3g4kOpQxBtNIz2Ud1s0=; b=OKdevTQyxjHUoLSz
	rE/9RuX/Cv0NcBt3sXkwE7nXLFmo3HmG9RvoMVAQq4A+fRaMXHtNBp7oEqf1Gja3
	DKTzwypJipNZrjNY1lS+SbDPZ5cGcJUWPn0SWpLzVgVY5WKc215U92XmFAbYj4UZ
	KjMh1szzdFCsUz8CMLSDptruI61wD1LknkAgluoPhJXCiygYIDYuxooJJvQ5xmmx
	zOYr4z4/LjKmDwF6fjSKe9ED+DqoKhbsaH3q250MyeDHfMBpqG4ni1gApmr76fbq
	IvelJ4Q8RPZg0FKjD3w3aSauS1pUdUoVAj4C1OxD5S3cJI/O89x0sT6Oc4UnKmT2
	E9dmZQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8uhg2fe6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 01 Apr 2026 13:36:05 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6054a2563adso3263979137.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Apr 2026 06:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775050564; x=1775655364; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=65IFvKQl1RiHWZxxj4dKFyqz3g4kOpQxBtNIz2Ud1s0=;
        b=BjrsA7acXpNWtbnp8t4Q9tDBvSvnG1j4B+tXANm1BKtsbyRbRHga3UubHaFwCwQzcw
         RsL1xESRa+xEcJEJ2FC5CovfD0/0bE5d22/l2FyRE7uW47LQfiJ4CU3BJ72f0yKWQjR6
         VyLhAOPUsTaMzKx8BgFwQG4tfsgsj5ZXddJFXSFg5mGrdOdRqj01kYWrkvKwj2MxspCA
         N1jcfP5/xNRn2aX3vzlwi24S/D3hej2aRKtbOReXscx3gim2v50KqKRST+3p7xMuDwo5
         n07UgDVdj3zLcXhL4BZve75ZpyHC4nH/cyhG5wgBkHFp0FEzSW1CsUSbwKa2s2y73+wz
         tF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775050564; x=1775655364;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=65IFvKQl1RiHWZxxj4dKFyqz3g4kOpQxBtNIz2Ud1s0=;
        b=F0ubvs2H7hWSp68ZvL9ttIl5DQr0votTZESC2udyoLvpvLAOgjlxq2uShJrA8FWklo
         ykHgZL/XYNfVTOXZdoSw5mM3AHlhHtFanoYfaQDJ6zzrCuk7lp+Lsj47RExfBr4rdmqv
         QlWnPejMhTiyUAJ3S2Y3k3pWwsvel9lbCK6cyA/30P6rcLYkAxmnoRWHPIUJ6lmG3CuR
         ksjno2EaOd0sR35vL3asJO3bWPGslDWvR9TjGuLAfb/R/l3/HftM4fAZP1b8Clvyrijt
         8LM9xVjhnpwnKSLz3ZwAyC9hrREfyv3LhB19eAh9boGv4IyWdAB2Lcqa0wTVvsyoxYNw
         Aq2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWYRZygR/sG+eNiFOBW18wlnH0DhPIuABT7KucbTV+xZDiBAUrSf9+w+v8tq4GMY0pXIoV4fjKQFc1QLP1L5HP4vlRw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw25Az/p36PmStgpO6GNjBfU0qJQ6mjghIb7qqUrznjuNkwqpjv
	tqv1IU24TqZHzlMKnT7bMDGRgSi4typMZ7Rg6gQj0xloDJPwboU0iSZlAbXudE+3PcvlArk5ADv
	YCmYnV3hhOfeiB7FZW8lzvlJ6Ay2okI17iApROLH8pi6Slsby7B+7uuMbZCVeVHZRRpNHkyNBwt
	o+efbH/IpL
X-Gm-Gg: ATEYQzzI/piJ1qk91fzVKgynJXrbpm2OAII0XEqK0iBJi60pzTd9VLNzDotUD2ijt13
	zG/PzHcsil5KgH6aqycM8ScYY71O/AU2aLJshE7vhwN2VLM72OlxijQhUtMY23EJZWsvPDpyNrq
	oACvZeUd5w9TdPYDEFzrxT66IaIPB9Xqs398fF38JFW63sKCjHUJM1eMsbIaysspx2pRbRCr8Gp
	H4e9uFjb2sN7Vb6u4zSZbUCuM51Xl92cOQCNyiv2eiQ471R4dqpRnA8Ujky2Wm2OyzA4eBy+wQL
	YvoETgBfE0oVbyUGc+MqnNptiCTJQ/6edjW16LnTZfHL/iumjkXHwYkhHuwelhl3EVwYIgeMnVe
	3J0g2AIINmntS8id15VwRarKMpPVKF3ELHW7V+vZ4xy4QJ1/qM81RgfxaQr2Et5Ay8+CDZyzOED
	rSlFL4c+n8BN8GvrWAccF2nGKyQiBg6V6PUbHPvFhOgq+FVJsVmMJytY+dOZiGnK+86Pnftrm72
	e6eOY27dcnwZeYH
X-Received: by 2002:a05:6102:5494:b0:605:6615:d9dd with SMTP id ada2fe7eead31-60567d42645mr1456978137.3.1775050563920;
        Wed, 01 Apr 2026 06:36:03 -0700 (PDT)
X-Received: by 2002:a05:6102:5494:b0:605:6615:d9dd with SMTP id ada2fe7eead31-60567d42645mr1456958137.3.1775050563411;
        Wed, 01 Apr 2026 06:36:03 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae24d6bsm510260966b.6.2026.04.01.06.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 06:36:02 -0700 (PDT)
Message-ID: <7dbd37c3-4a5e-4577-bff6-ed0826b489ac@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 15:36:01 +0200
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
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Marco Nenciarini <mnencia@kcore.it>, Daniel Scally <djrscally@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <ab0URIrzZPsYjWrM@spark.kcore.it>
 <20260331075204.1567624-1-mnencia@kcore.it>
 <20260331075204.1567624-5-mnencia@kcore.it>
 <bc5c4cd6-e026-41d6-ad49-aeffb949f7fb@oss.qualcomm.com>
 <acuoEp_aH_su0q2H@ashevche-desk.local>
Content-Language: en-US, nl
In-Reply-To: <acuoEp_aH_su0q2H@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEyNiBTYWx0ZWRfXwYSyhBEIOedy
 8ra5ZA/sgPfpbR3l5zaTKcDtUrHFcMaO7qyCaHhYzO0uM8vAkEG2rakJ5ZYj5H4xEVJNkVm7uw5
 PVuAEQYOw0nMAAq0RgKd1v+9ZXGEmKVnwrn7PBYgrGvr5QaRTd2WI0Qagw459TDKeJ3kn5BOz14
 emBvo3AwhdcTN3scuF85P+k6APpxMF5dhl9HuWD8kRJLLuCF6MWOMrEILNBnGJ5Ys9oANF2vQ2H
 Cj6ZOrAt4SgOmtCeLF+jzjtepm/D/SMxybvWnCt3icsXCurlmylMQ8F1O7yVDjt+Nokmk8NP11m
 oRfKFN1IN7p7bWMJcQX9bAHAW5Vsk69ZBmT22iGdjbuXuWHEUnNreLbmmnIPfJCTya06XFWKeOL
 zig7UcfHueKyK0RhZ0D9QU1VYZgT2r0GCpET0f0MBzw3ePOYWb/QZ2+yZWjILQMtLmgdmH1FKgr
 btGhkTzNT/4cSSvmjpw==
X-Authority-Analysis: v=2.4 cv=YcawJgRf c=1 sm=1 tr=0 ts=69cd1f45 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=PhDHjK9OYLvGxpwDl6MA:9
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: Jyi5WytwIK4nYPsTV8mUM_Ms53VO4Gd8
X-Proofpoint-ORIG-GUID: Jyi5WytwIK4nYPsTV8mUM_Ms53VO4Gd8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010126

Hi,

On 31-Mar-26 12:55, Andy Shevchenko wrote:
> On Tue, Mar 31, 2026 at 12:36:28PM +0200, Hans de Goede wrote:
>> On 31-Mar-26 09:52, Marco Nenciarini wrote:
>>> Add support for GPIO type 0x02, which controls an IR flood LED used
>>> for face authentication on some laptops (e.g. Dell Pro Max 16 Premium).
>>>
>>> Without this patch, the kernel logs "GPIO type 0x02 unknown; the sensor
>>> may not work" and IR sensors paired with a flood LED cannot function.
>>>
>>> The flood LED is registered through the LED subsystem like the existing
>>> privacy LED. Unlike the privacy LED, it does not have a lookup entry
>>> since there is no consumer driver expecting it via led_get().
>>>
>>> To support multiple LEDs per INT3472 device, convert the single led
>>> struct member to an array with a counter.
> 
> ...
> 
>>> +			ret = skl_int3472_register_led(int3472, gpio, "privacy", true);
>>> +			if (ret)
>>> +				err_msg = "Failed to register LED\n";
>>> +
> 
>>> +			ret = skl_int3472_register_led(int3472, gpio, "ir_flood", false);
>>
>> and then here instead of having 2 almost identical cases just pass con_id
>> note please already use con_id here in patch 3/4 to avoid churn.
>>
>> After changing that in 3/4 you only need to add a single:
>>
>> +		case INT3472_GPIO_TYPE_STROBE:
>>
>> here to make it also handle the strobe/ir_flood case.
> 
> We would also need to recognize need for a lookup. Either keeping
> a boolean that needs to be initialised into something like
> `type != INT3472_GPIO_TYPE_STROBE` or turning back to switch-case
> for that in the callee:
> 
> 	switch (type) {
> 	case _PRIVACY:
> 		lookup = ...
> 		led_add_lookup(...);
> 		break;
> 	case _STROBE: // no lookup for now
> 	default:
> 		break;
> 	}
> 
> given the nice and neat caller side I would move to switch-case.

Why would we want to not register the lookup for the ir_flood
case too ?

Elsewhere in the thread we're discussing actually controlling
this LED from the v4l2-core which will require the lookup.

And if that does not materialize the lookup still does no harm.

Regards,

Hans



