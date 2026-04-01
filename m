Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E3243D4F5
	for <platform-driver-x86@vger.kernel.org>; Wed,  1 Apr 2026 13:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775050720; cv=none; b=WfQ4BqvrvR5TMex1O7EPSII74qp3Mn6JM4jm9cEx1TEFL/7tlTeGKcK/9cyEjgrgcofiuPmysukeWhonJhEuPEnWViXNw8KCdnv0gSVtUMLAieSgf/ZhhdiR8Uysc+v+xDGhUUMV/keBWsBIjCI9zlAXzu/QiQA15ij1cvd0oRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775050720; c=relaxed/simple;
	bh=mC4PPi+3kQqx7iVw1yWx+0dxaAz3a6p5xq0I6EDPDrw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=FSDqvkgVyrRr7OQEdMKQeH5O/XNOVBzQcwaqL77w8+6qB8PS1R2JZyBMeAmOAqR5SmIf/8X8ycDq1HWrJ7cGD2IqyhBRtaIeTtNCvyq6XNzIGveICL1In1AKqyU8hJndCI/v6FjkQPFN9OEuH3VK+wZo0gRyIIJTb3lTyZDNOAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H0asddTX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VibouA4g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H0asddTX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VibouA4g"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6319nxdw3364339
	for <platform-driver-x86@vger.kernel.org>; Wed, 1 Apr 2026 13:38:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dCV+ULd+ytCZYkOrcVruW64KxOJ7cl2GO/EvJ1gyoVk=; b=H0asddTXPQHBTG32
	neSDS733k/2kp1lVXrh2HGsfX1iygLae7uQ53tZPlXg0YCdrXxOPq9oyivc0iJl/
	MFz3EEHoLw0aEy/RkcvlK1PzPs7iqxBZU1HGSqruNSIJJXE2sW7J6KieRYOeOpQu
	6Wiyzw5r/TS1NmAS7FWqKEcz5spxJ8WTH2ekQTAAc8lZW+nIZEWMLfKsxeQ2fllJ
	nfsFqriW1BHoEiHhBYLDrcd6tKmJL7MTd62nvoUoetOKwnqSIclyo9nXjDT4F6cH
	DUeVCTLSp53O7zsGaHOMoA4xFfo4A2u6rCM7kUhmdsTVfUT9lPnyMAj1KCTB1Dea
	P5KXkA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8nddkq90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 01 Apr 2026 13:38:37 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6054becb991so826229137.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Apr 2026 06:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775050717; x=1775655517; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dCV+ULd+ytCZYkOrcVruW64KxOJ7cl2GO/EvJ1gyoVk=;
        b=VibouA4gKMyxWTfPXr7SO2gYde3POyMNpV8iVsIk3qEqeoG30cdv6x/3fgyuAhVUF9
         3u0IJoTOjsD5wEHNNl46f6wg3kyd1wjva00jjY5BHIBsBBzuNQ7ftfg06Tkq1bKXjRg5
         HrAcn+DCA0tM1zYc0dSExwDBJif9EvzDgz1DM3LWpEk8wFQAmFkgzMwB67BMCRQEDAMc
         5NmfujgDs5nwlTEVIjx+6azlZAWwL+4V4xZzf07Amg+Krs/efMGyORCa+Vg9luD9gtCR
         RSwnEAI6JV0jCOdvHV9Y6fd4Qr5ColasvRrFIpHZ7qRveByLz3DUVUs8lDu3aEbmMMbi
         dKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775050717; x=1775655517;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dCV+ULd+ytCZYkOrcVruW64KxOJ7cl2GO/EvJ1gyoVk=;
        b=azz8EFX/GiFjkuvbQCCOIs7GEBXZQ9cI2SaLVD8kqWH0bHEJD+ATmzQmQ4VcIQQQPk
         rltI30OD5PP81dzpMy5QeZXfSZXlP3WpIx7Mn+dPkK5FF3OxZznpuarAvrvWnx4zrx6J
         lhx9Eca194OWwNXYid+9dIk2plEvmF8owmGnfIwX695x9wz0+2ut2fpCXhnHosxG230N
         PC+WtrvcRwpLR43E2VoSpmjOn3ueFEixh5Jo75L2BWvPgij8RuNBmEwODQEcGaDM2xuj
         icf2tF5eGVwXtE6E9fOC+NEKG0eKdHAcZqoToeTE2BeNXdZHQiVUtdiy4j1wMj8S3C8H
         WNmA==
X-Forwarded-Encrypted: i=1; AJvYcCW1YK3+bKrC3LbE74PFAaKvZLBEguuOMWkDa/e5y9bYKMp83KCqKiL4hh0uSVFIRgS2li2mjeWSDg52tgeilO/0x7Cl@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs2Q1cL+Eyly1YPcymsAnw0LWQW1kn+eMDjd5TDGfDO6AvokJx
	6/4sfU+YJdbJQPqm5Tv3mqvAlQpBa3URhOeJJyKtKbzyxsJfVtFvjlSbpvj9ZfPGI2+iCM0q3hc
	LJskOVd+puuXzambnCIRk0LRWiArdGPOIHTuCPPqI0f8kblQY1xPi84tGRwEHuX644Pr4QhT8Y+
	PV8BoFkFh2
X-Gm-Gg: ATEYQzyIhTZ0krbAXqP6gOi+QeMTMSny6qOjBEKyAdMHsiI7IIshyWg6az8rw2dQRr5
	AargEjk5Yx18v6qAQ4QDLZbFuIhWdOJYnq55Q1ZokqQt2RsdaZVgaEO4dOgDYWC642urwkju0xH
	26gJvdf4DjlhEveRajClHYiEj3tA5MDhhuNKB5XvLIH+K66qcKdFdnvM6Ty1bW34gZUKExA+4Wz
	LYm4ufBC8YIk8QeuJuiih2IcprmgyxOiQhuzk1vlKExTZvMwHjHhvIITGED0PGkq+vA+b74nRte
	LZjAbm50No2xx/kiAjTdf+eCpy9adlxve/ok39bCqkDeabD1l5fyfrHH0NOKgUS6Lm2Sls9DEXZ
	HWpIJhiNrfcD5yIvSUdeF5hwb6xHtZFjSyhXLoNdJJK0rtjit8CjTlnpQfKVgZ4qyUXb3SXpbfL
	/PgMV5q/M7JagzOKR/U4NOcYBHhwR0LF58wF2hzwW/QeInsW0vL3yZ5EurHrh0s7n65o/LtCK6K
	bFOewbDP1sGXOoX
X-Received: by 2002:a05:6102:5114:b0:605:558d:c7c2 with SMTP id ada2fe7eead31-60567dfaab0mr1252118137.12.1775050716911;
        Wed, 01 Apr 2026 06:38:36 -0700 (PDT)
X-Received: by 2002:a05:6102:5114:b0:605:558d:c7c2 with SMTP id ada2fe7eead31-60567dfaab0mr1252107137.12.1775050716371;
        Wed, 01 Apr 2026 06:38:36 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1e4395sm493829366b.44.2026.04.01.06.38.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 06:38:35 -0700 (PDT)
Message-ID: <b9b66e79-751b-476e-90e9-670ef44f131e@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 15:38:34 +0200
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
 <55510bea-30ff-45f2-b4c7-4a191ff214a1@oss.qualcomm.com>
 <acw8fB6-s3pDYCSH@kekkonen.localdomain>
Content-Language: en-US, nl
In-Reply-To: <acw8fB6-s3pDYCSH@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZfUQ98VA c=1 sm=1 tr=0 ts=69cd1fdd cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=al-jjG9jT3OnI149PLAA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: yUtXvAcmaPgk0Zzfj2c4rXZPFP0sy3dl
X-Proofpoint-ORIG-GUID: yUtXvAcmaPgk0Zzfj2c4rXZPFP0sy3dl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEyNiBTYWx0ZWRfX7XuwVRzMj6gn
 NuvuJHn861aEXXP86LzfaJFaOfmt9CWm6KyBVYpUoORonASiQsMEY69bjqPByl/IHVjZjXCXaSQ
 kjjvhq4aEkH35YEvU3hN5Yt8zLYUZi+3CqTNwhK8h+gcXoqSJmw9TOnx3TBzFd/KY7gVdzvpaVT
 afNVL/POJX0q1i8oIr2bzkpYF5rSA0dKM+RYaUHbqCuRp7aXh23CQUhT8sukawxIeZvilaNDxYO
 ZiP9089m3xkTfUDQ7zHpNuaBVllAzmJm+/fDozFE9x13fruStufERF0FJl17weL48kFWWKBRgD1
 qlI/dsuhZGNPtwVwgN6h89m+yD+ACFGis2Ey/rLkyZeF+zSmUedqPrasxSXopUFKBq7P6UDO20k
 KY3CYGGZhLKFaQw8H2G8cDHp24nwgJ6niYR3M73n5DsM9xS8Wjx35zPR705fHpB/OEgkaoibPBy
 AxbP1Cxe69v0ey+e2Tw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010126

Hi,

On 31-Mar-26 23:28, Sakari Ailus wrote:
> Hi Hans,
> 
> On Tue, Mar 31, 2026 at 12:15:55PM +0200, johannes.goede@oss.qualcomm.com wrote:
>> Hi Sakari,
>>
>> On 30-Mar-26 22:21, Sakari Ailus wrote:
>>> Hi Hans, Marco,
>>>
>>> On Mon, Mar 30, 2026 at 05:12:21PM +0200, johannes.goede@oss.qualcomm.com wrote:
>>>> Hi,
>>>>
>>>> On 30-Mar-26 16:55, Marco Nenciarini wrote:
>>>>> Hi Hans,
>>>>>
>>>>> Thank you for the detailed feedback.
>>>>>
>>>>>> My main remark on the current patch set is that IMHO
>>>>>> the LED name really should be: OVTIxxxx:00::ir_flood_led
>>>>>> since that is what it actually does, strobe is typically
>>>>>> related to flash LEDs which despite the naming in Intel's
>>>>>> side this is not.
>>>>>
>>>>> The series actually started with "ir_flood" in v1-v2. It was renamed to
>>>>> "strobe" in v3 to match the GPIO type name used in Intel's ACPI _DSM
>>>>> tables. But I agree with you that the userspace-visible LED name should
>>>>> describe what the hardware actually does, not mirror an internal ACPI
>>>>> label. I am happy to go back to "ir_flood" for the LED name.
>>>>>
>>>>> We could keep INT3472_GPIO_TYPE_STROBE for the define (matching the ACPI
>>>>> type value) but pass "ir_flood" as the con_id to the LED registration,
>>>>> so userspace sees OVTIxxxx:00::ir_flood_led. Would that work for
>>>>> everyone?
>>>>
>>>> That sounds good to me.
>>>
>>> Seems reasonable.
>>>
>>>>
>>>>>> We really need to get some input from the V4L2 maintainers
>>>>>> here on if this is a good idea, before merging this series.
>>>>>
>>>>> Agreed.
>>>>>
>>>>>> I can even imagine
>>>>>> a default simple mode where the v4l2-core just turns
>>>>>> on the LED when streaming starts and off again when
>>>>>> streaming stops (very much like the privacy LED) and
>>>>>> then in the future maybe we can extend this, e.g.
>>>>>> add a control on the sensor device to make this
>>>>>> configurable ?
>>>>>
>>>>> That makes a lot of sense. The current series intentionally keeps things
>>>>> minimal (just exposing the LED under /sys/class/leds with no V4L2
>>>>> integration), but this future direction sounds right.
>>>>>
>>>>> I will hold off on sending v6 until we have agreement on the naming and
>>>>> Sakari has had a chance to weigh in.
>>>>
>>>> Ack, lets wait for input from Sakari here.
>>>
>>> I wonder if there would be any deterministic ways to find the LED device
>>> based on the sensor. It'd probably require more information via MC / V4L2
>>> controls to allow that.
>>
>> Yes, the int3472 code adds a LED lookup table entry with the consumer-
>> device being the sensor.
>>
>> So just like v4l2-subdev.c currently does:
>>
>> 	sd->privacy_led = led_get(sd->dev, "privacy");
>>
>> it will also be able to do:
>>
>> 	sd->privacy_led = led_get(sd->dev, "ir_flood");
>>
>>> Alternatively we could use a boolean control for this, but I think I'd
>>> avoid adding that now and rely on LED API instead.
>>>
>>> Are there use cases for this LED, apart from Windows Hello? :-)
>>
>> As mentioned for now we could just treat it exactly the same
>> as the privacy LED and simply turn it on while streaming
>> inside the v4l2-core / v4l2-subdev code.
>>
>> This would nicely cover the face ID use-case for which
>> Linux implementations exist to.
>>
>> And then later of some other use-case comes up we could
>> make this a menu-control with on/off/auto values, defaulting
>> to auto which would preserve the turn it on while streaming
>> behavior.
>>
>> We do need to come up with something here, since use-cases
>> like Howdy (Linux face-id) will need it. My vote goes to
>> give it the same treatment as the privacy LED in the v4l2-core
>> for now making things "just work".
>>
>> Alternatively we could document that userspace needs to
>> find the LED and turn it on itself through the LED classdev
>> but that will be painful for userspace to do for various
>> reasons including classdev access requiring root rights.
> 
> That was actually my concern as well.
> 
> Still, if we bind this to the privacy LED now

To be clear my suggestion is to treat it the same as we
currently treat privacy-LEDs (auto-on while streaming) but
have a separate code-path, or at least a separate LED name
("ir_flood" vs "privacy") to allow different behavior in
the future.

> and the LED will effectively
> be powered whenever the camera is streaming,

Ack.

> we can't drop that interaction
> in the future as doing so would break existing users.

Ack.

> I'm not sure if there would ever be a need though.

Ack.

> Either way, I'm starting to feel the V4L2 control might actually be the
> best way to go from here.

I think we can postpone adding a ctrl to if a use-case needing
different behavior ever shows up (which is unlikely?) .

This ctrl can then be a menu ctrl with auto/on/off values
defaulting to auto and auto preserving the on-while-streaking
behavior, so not breaking existing users.

TL;DR: my proposal is:

1. Name the new LED classdev ir_flood[_led] including
   adding an "ir_flood" LED lookup with the sensor as
   consuming device of the LED.

2. Make v4l2-core turn the ir_flood on automatically while
   streaming, just like it does for a "privacy" LED currently
   (mostly re-using the existing privacy LED code).

3. If in the future userspace needs more fine-grained control
   at a ir_flood V4L2 menu control on the sensor with
   auto/on/off values, defaulting to auto which preserves
   the behavior from 2.

Regards,

Hans


