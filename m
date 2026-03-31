Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B2F3A875B
	for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 10:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774952161; cv=none; b=nrIkZNh27DngFeJ19qq6S2TJPFwEiZFive+OXlRm7rYwLDG4v5pfHuQ+GE3qbg8f5W9dbUliRZMYiF1wGRZKjtg82d/2Ulit3V+emlQHeeEN0a86TnEiQev3qtm+Ut8oTGDN+JvNtJtryXy17Tb5zOth0ZtPm3G3iSJUfzocJjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774952161; c=relaxed/simple;
	bh=K+0wcCmfHut6YFXb2lwHSRx9sP1xg70q/oq95edTjUc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ke8ZlOSpSa2hGibzKq8xu+LUp6Fg4vuZIvGemNmTThGCKFQF6lA1d1ZUxEG+5BrcvwgfDrenyQDaAnWdLmpgXegucjwc55gLIHoj8oD9L08NOIt4eB2u+pUhDQdQZQ2EjizzaMWoYHjKOgy7/XYYqMFDSyVF6VhOzbvRawmzwcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m3jiMkLr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KqK17S9k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m3jiMkLr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KqK17S9k"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V8AudJ058040
	for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 10:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sBShzvQgF/OK4CJre7PtXkN5npZ3FfgWdgXoXo6IYrY=; b=m3jiMkLrr28ImmuC
	4iDqSTMzw20VdmJ71B7burfbADJ7EsAeQvtsHM/lIgM2LKAiBMeN1XFyHCycCY4+
	ggBeU2ND5XMBe8S9h4CS6wQvdP0ffVA89TWgmt+TSConh+3fcPKSqYF2b3X3PSCf
	nHzLCiZ/O+YYBN450rHBuAGLuqohNxB5yYPdBLfoVaBFk7n0DseaNN5DPC7ysl4Z
	sptpw1XqUvbqtyqaSNsHoW+hrhNEy3JUrgatVB+x2aKImCGTgsqhc6RngAJavAbB
	C7Fth2Sm+deG/Snn7HAp+Wwo3K5SCImSmvn9PA2ciUVYR2v2MCHb5IlV/MDS8NR5
	6Cff1w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8ahkrhj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 10:15:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b323c43fdso32823091cf.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 03:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774952158; x=1775556958; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sBShzvQgF/OK4CJre7PtXkN5npZ3FfgWdgXoXo6IYrY=;
        b=KqK17S9k1Bjyz3wlKUKbs2KzvBogLGV5tF4z/+XAkSaLTV88F4W4f32zgH0OMO5dD0
         up58Sycb/GOcZ+8U22/5jRB5R9f2N19T7iKzleoSrIPQSuHzZ3X/wM1hOe1NF3KP/Zye
         FcUAveSjzMdn2GrhJ/mbcR7TEtSysXVR3z1g2wY1Z7Nwfh90KRTT4CPbjGXVSCj1h23V
         YLB57gokyyoMIQ6AirXaLW4QiSjdkJkPD6xE55tJfTsimYcYf1gdCoWddeEoAxcAVAiZ
         YoYW1vb3KsFsIT3mkl4ZGBnEQNUUV3UI/RjQ/dU08/u37ms3kCObs4ET7kImdeb58CO7
         Bb0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774952158; x=1775556958;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sBShzvQgF/OK4CJre7PtXkN5npZ3FfgWdgXoXo6IYrY=;
        b=Ue7bTg06XeBtaPWpUSDdYuasw1cORYntVIFxBl5VJA4muJe9+TvGc5S9UUsEnK4tGB
         s/OkrMIMSE12FEM2ntIwl35OEmlII4hKJZQ6616/W75Q/MeU2j1AncMBGZLQqtkFF7Ku
         ZOaknTaMsLDkPE0brUwKsAhsNWn6XLKKhOQ7ZTPAJRnRADuOGDTJG2TRhjFd9wOXHoEe
         V3M+zGTAedJOvdhTKUZi/rulLoqwC6qdJRacTjGnSHhnvrzylePVFwvKKcX4gTCQex2C
         90m0d9K/4zuohMuV70T9+njSLNMJV7RbRJskCIfn3mpXUw8je7cGrRjaLYEB0VbKEkbR
         hrQg==
X-Forwarded-Encrypted: i=1; AJvYcCVL3j2lQorqtRg3x2qSnkuANO2UrhdI7sk8mk8lpmx1a2j3AOsyzRLuQVfRfMdflO+7rdy36tiahCS8IR4nwVERZfd9@vger.kernel.org
X-Gm-Message-State: AOJu0YxAT1wE1tXFKkE0sBLMB0UT2rUts4WjHJ8QfiiulNgAtJi+B3wD
	TDCgN2ZeFVvL/xgS4GBkAoPKOVbVG3k9RGedw+KGukJ/4SQNL/V90Jm4FFle7wIb1etO+U33osn
	2HKvlUPREFrzPrst++ibnHh1C3watlNq1GKIGDslEjEezqG3P9M9aeu2ohIxB5piuXbPT3XGUAf
	Xl
X-Gm-Gg: ATEYQzwl+5IDdRDcOrZ7MjoEOtQgGVv9N8t+XM4fcn/YjZoYUVTO8stuiXY5U/Faauw
	Hy3tk05WavRw2sFqHEBbVH4bu9qWpb+9B8Pbao0FCYjH1ZP3Ay3Gp/BqILSLuDEMSJS2peTbi7U
	77sShIKKl8YLRmZEJov7h0f1L8bTWjOavGK/u+jXax8qjQVBNBLea8FG3WExqrQ0htiNTj0Fu/U
	3jac8U2g+3u5ZhOKdECwngSlyQcw1oVXuNyOuFGyVt/Qn6+OduxBcZfc/uMi8o6Ayt04CGE1+6u
	A4fR5PhzZCvPUkplGCWivGlnCaiZDwnP6YRz6+npB8RMlCef/q6EtJXCTvinO4CZCYS3HHhFRXc
	ykoSEisrqFAzCdJjIhj2R2R+sPwDrw1Cbk48KPDvih2sTspzGqbkDg8wWq/CAtP+vRcscx4vqTG
	oK9QxptMgjVQq4j2btcTAmcfw84btf4RSu4a5BZq6q3L7w1AlBUjY5irVoWSRVNOyAdmb5UXC0w
	VnuVD4JrxweOdq/
X-Received: by 2002:a05:622a:4015:b0:509:1579:7c3b with SMTP id d75a77b69052e-50ba390216fmr220716281cf.51.1774952157983;
        Tue, 31 Mar 2026 03:15:57 -0700 (PDT)
X-Received: by 2002:a05:622a:4015:b0:509:1579:7c3b with SMTP id d75a77b69052e-50ba390216fmr220715951cf.51.1774952157554;
        Tue, 31 Mar 2026 03:15:57 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66c07ab15basm1345132a12.17.2026.03.31.03.15.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 03:15:56 -0700 (PDT)
Message-ID: <55510bea-30ff-45f2-b4c7-4a191ff214a1@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 12:15:55 +0200
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
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Marco Nenciarini <mnencia@kcore.it>, djrscally@gmail.com,
        ilpo.jarvinen@linux.intel.com, andriy.shevchenko@linux.intel.com,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <ab0URIrzZPsYjWrM@spark.kcore.it>
 <20260327181031.1489365-1-mnencia@kcore.it>
 <76baf0c3-4c1f-4169-846d-5c74dab69a18@oss.qualcomm.com>
 <acqO62_87TM4UZMI@spark.kcore.it>
 <06317144-d652-466a-86e9-da2569a1acf6@oss.qualcomm.com>
 <acrbTBh8KsHmtJN5@kekkonen.localdomain>
Content-Language: en-US, nl
In-Reply-To: <acrbTBh8KsHmtJN5@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA5OCBTYWx0ZWRfX93RvDLhw6JRD
 3BkHE6uvFODcLUOcRo8f2BsxzTSLBp9x4NBmd06/4fkTqtbiJeohlI6eNIAV8FpYc7+pRpR9MHn
 QNGg/GEF9kFYJ20tVypS6QzlnvQTuS42ov2X/O9esDBr0oX4L6E9iXgtLiFqX36aOsZnh3x7VxW
 lDCC7iZlsbuLGdO098aJrjXCL496vgf0pUhhaYLBhCho22hRk7aOXVTf18IIPgEyPvNFf2TVZ2A
 Wk2kQLFWCIFeY3poJgYwmOIgP3gW9EAa+3cx/BuXAHLf1YHldAYqPRAAAV48LDmeUlX/M3UHjrM
 UJpxl11GIuY80YLzYHlXEh3kxBHFgOU5wJuV5QY9mBbE13Hz/34KN44ojwxiXlNvemIBnQh8fNJ
 OBLZlbDsOsZHQhAne+F1LUK7BTlA/zhe1TvEl/1p7wXnBdLTFbdrMnMJQc9w/4fjGeu8118DtCi
 z/wla8hWLoerTJHaxvg==
X-Authority-Analysis: v=2.4 cv=K4wv3iWI c=1 sm=1 tr=0 ts=69cb9ede cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=BXj6raveOS0NqA4VA5cA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: _1ZrV-NCjezq2jrxixLEt9_73JKSpraQ
X-Proofpoint-GUID: _1ZrV-NCjezq2jrxixLEt9_73JKSpraQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310098

Hi Sakari,

On 30-Mar-26 22:21, Sakari Ailus wrote:
> Hi Hans, Marco,
> 
> On Mon, Mar 30, 2026 at 05:12:21PM +0200, johannes.goede@oss.qualcomm.com wrote:
>> Hi,
>>
>> On 30-Mar-26 16:55, Marco Nenciarini wrote:
>>> Hi Hans,
>>>
>>> Thank you for the detailed feedback.
>>>
>>>> My main remark on the current patch set is that IMHO
>>>> the LED name really should be: OVTIxxxx:00::ir_flood_led
>>>> since that is what it actually does, strobe is typically
>>>> related to flash LEDs which despite the naming in Intel's
>>>> side this is not.
>>>
>>> The series actually started with "ir_flood" in v1-v2. It was renamed to
>>> "strobe" in v3 to match the GPIO type name used in Intel's ACPI _DSM
>>> tables. But I agree with you that the userspace-visible LED name should
>>> describe what the hardware actually does, not mirror an internal ACPI
>>> label. I am happy to go back to "ir_flood" for the LED name.
>>>
>>> We could keep INT3472_GPIO_TYPE_STROBE for the define (matching the ACPI
>>> type value) but pass "ir_flood" as the con_id to the LED registration,
>>> so userspace sees OVTIxxxx:00::ir_flood_led. Would that work for
>>> everyone?
>>
>> That sounds good to me.
> 
> Seems reasonable.
> 
>>
>>>> We really need to get some input from the V4L2 maintainers
>>>> here on if this is a good idea, before merging this series.
>>>
>>> Agreed.
>>>
>>>> I can even imagine
>>>> a default simple mode where the v4l2-core just turns
>>>> on the LED when streaming starts and off again when
>>>> streaming stops (very much like the privacy LED) and
>>>> then in the future maybe we can extend this, e.g.
>>>> add a control on the sensor device to make this
>>>> configurable ?
>>>
>>> That makes a lot of sense. The current series intentionally keeps things
>>> minimal (just exposing the LED under /sys/class/leds with no V4L2
>>> integration), but this future direction sounds right.
>>>
>>> I will hold off on sending v6 until we have agreement on the naming and
>>> Sakari has had a chance to weigh in.
>>
>> Ack, lets wait for input from Sakari here.
> 
> I wonder if there would be any deterministic ways to find the LED device
> based on the sensor. It'd probably require more information via MC / V4L2
> controls to allow that.

Yes, the int3472 code adds a LED lookup table entry with the consumer-
device being the sensor.

So just like v4l2-subdev.c currently does:

	sd->privacy_led = led_get(sd->dev, "privacy");

it will also be able to do:

	sd->privacy_led = led_get(sd->dev, "ir_flood");

> Alternatively we could use a boolean control for this, but I think I'd
> avoid adding that now and rely on LED API instead.
> 
> Are there use cases for this LED, apart from Windows Hello? :-)

As mentioned for now we could just treat it exactly the same
as the privacy LED and simply turn it on while streaming
inside the v4l2-core / v4l2-subdev code.

This would nicely cover the face ID use-case for which
Linux implementations exist to.

And then later of some other use-case comes up we could
make this a menu-control with on/off/auto values, defaulting
to auto which would preserve the turn it on while streaming
behavior.

We do need to come up with something here, since use-cases
like Howdy (Linux face-id) will need it. My vote goes to
give it the same treatment as the privacy LED in the v4l2-core
for now making things "just work".

Alternatively we could document that userspace needs to
find the LED and turn it on itself through the LED classdev
but that will be painful for userspace to do for various
reasons including classdev access requiring root rights.

Regards,

Hans


