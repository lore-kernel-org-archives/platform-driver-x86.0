Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E5748A8D7
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 13:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785330019; cv=none; b=eBCCkG28hp+03KlWToIib/aqnwBTmdEzgPTnxSZuP6DtA12Q8oKmVvtXueYgOy5s60N18xrU39+PfW+ilqXqbRUUx3eggFkBEOVDGC4QI5SrVUAYBEWOD0BmPOVtVIK+5Q1HBnvWcBfoUe6cvUUlnHWx9wwJzTz/gyqfEEvCazc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785330019; c=relaxed/simple;
	bh=usS5ZvvfleDq+b5anpht/xfqW4DM0ICjkN/d+9cZryU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ny05M7H+G0vAVAAJLtgpiq4bxro3JWYdP8kDsj6nUzvtElZhPiiZ1FJgHV+Gbyd5dJLLZjSMj6nCZ2Gq11tvT0etF7cg1La8OlpvTDm99/UQ9JgaUODs3/SyueAdmaHHfBu3h6Xkou1WUSIOPZVAQQMVe4I+j06jRLDTPxnt4mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZFdJTcpg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MDCIw6iK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZFdJTcpg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MDCIw6iK"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TBXKxt1847284
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 13:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FQuLxiXgQrlaPB545yvWNYECiZsH/JayHHgnDnwTqzo=; b=ZFdJTcpgwPRxl7yL
	GUep+UFfx4OkU4ya/iL/f5lq1nQ2+2oIlYOaxsILHmY+DWypk3UOJ9jUCQomIJ8Y
	8xlfw2rQodH9Dz7G63unP7WtdOfJ/RHEVSnixemkcc/OnsqRwyre9+h6TeB9zgm8
	ZPM+BBmFUvQoAhaeqLwzSx7ffJdP03kA9v7F764Kn4vjU0TYqHJMPKy3ihlkwIgW
	AtlA7c8eWnZAzU9+NXNCcsATvpMIwbzZcC7XtenbsYwu4tKv73nOtFcZjFztuLLx
	0MBU9HHxwnXh1Jwj4YxpZwqNbQkuR9xAnTX5lkGt+xtvlTjR1OZ/SFMUT8EJYc/D
	JL67cQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgrcgadd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 13:00:16 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c89704da8c7so1400459a12.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 06:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785330015; x=1785934815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FQuLxiXgQrlaPB545yvWNYECiZsH/JayHHgnDnwTqzo=;
        b=MDCIw6iKN2P8wU18zg/xJ47jx1ktlKc9o0e6Wr2xQuy3hHUsXd0VOGkDRNY/YUBX4J
         tSX64ssYiWI3HNfbnr54Ls7B145iigc0iCWNDlsjRO7kN15Loee6lHiVuqGzs5LI5WvJ
         koniOC4O/B2mS5GyFHdrZeHqzf9BwZegWq1lAloxr/aQ5/zBWNFsSAOkdTrzidjVhvhK
         yXldY3WjYVpbFBqCCZtfKzOVuRPHrvV/sw7Nk4PQWxRCuEPbA63mnV+vR2tiqynAD0E9
         qnsV34NEMkhM5c3DVIzflw02J/HyL1V9Lm0vvi0eOwJuyFzkmAY5SjhmX/rDq6DOCdaD
         dXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785330015; x=1785934815;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FQuLxiXgQrlaPB545yvWNYECiZsH/JayHHgnDnwTqzo=;
        b=olsHa+uO0kyHYKfOixHOx/PvDGab7nGxIHXNomYnDI+pfkQycUBuDD6SPe3hiTfrR+
         t3gMKd5t2433KlTqFYXv2bDJbcc31P442KVa0EFSUKyC7WuEYg5cobn59n1ip/Hh0UvG
         pjlF8p2h7EeYh5s8g9BiSq69EmLa5ooZAKLjNL6z9lvBJuLijJ/86321yGXndTQFvf3j
         URK322i16PKveB/+wdTubhBEOcaY0yevnjiqO2lJl5evkcVNFaV8QW2px5TglN6HUkDU
         shNZy3r6gjuTPK1elauqdkXby+8Kf0EB+MUTNaEgPi+MVrLB3VjJMyiMBWDaIbwYBeLl
         pSUQ==
X-Forwarded-Encrypted: i=1; AHgh+RrZWpZv9b04ZRBuRK+JHlUg6doLMutjMscVaWDX0m8AmdMYZ5RYPfI1B1IwKSv5QKXmQqre0N7w7b62ePJKuV9WFvOY@vger.kernel.org
X-Gm-Message-State: AOJu0YztryKsBnHDvBq8qBjjlkxIv6OrAFvngVH7FDSumq3uu0jsXpAr
	9T1BL2yQaDJ3Sv4fUDz8A1/bMFQc1IE7OhLAPwg/T2VcYJPLYARHVvyjN56iXhA4GRzGokESV5n
	4Rh84w3uZwcILwouAKCxs+/aT1Lf3mjG+PoGtspXZqLn5bP08sc78JwMvbGibcOcSOT/ZN5K0E8
	B8
X-Gm-Gg: AR+sD13fsDhwXcHObxPfcQhNxNxC+rnRzyeieRsyplMW0MwcY3QHWfUVNwoFRtT+W7Y
	3mhgViNNFq5UrVtwNmXEtAxQRuFM1uHOrak439++TzuC04wdlwa3YGRYFmhAVrgBziSzNkFmqXR
	v+qzctTv6GtfkGyEw4z8brfaPeJ/cExNJDEq303ZFyysiDjXhyQyJEz4zRnYSRjH1TFFe5N/BD+
	wCnRxjL7iNoQ09qyRMqlmzDlDXA8frJf5J1nbW2YcTIvyoyQNUhx+1A03IRKyTev/8p4m7LgevQ
	3+ZMaehHDJftRvqqumn5IyWZ2MCfJd3AX7HD56tLu/6Dg6slWXsLQRgSDeMmp0o58/2Eu4te2W4
	iI07bFh52sU2il8287p3xubh6VYBLI5suEgDHReBOG1U3mkg/T1Fo5iViuPB0NuDxtn6BW5pYZ4
	6VAOddottwkYBz
X-Received: by 2002:a17:902:da8c:b0:2cc:7e4a:bcc5 with SMTP id d9443c01a7336-2d015d48a03mr68747735ad.32.1785330014680;
        Wed, 29 Jul 2026 06:00:14 -0700 (PDT)
X-Received: by 2002:a17:902:da8c:b0:2cc:7e4a:bcc5 with SMTP id d9443c01a7336-2d015d48a03mr68747205ad.32.1785330014098;
        Wed, 29 Jul 2026 06:00:14 -0700 (PDT)
Received: from [10.149.71.180] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a1586esm11028135ad.12.2026.07.29.06.00.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 06:00:13 -0700 (PDT)
Message-ID: <587a9ac1-dd81-4f88-ad6a-c9cad03ac0c2@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 18:30:07 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: embedded-controller: qcom,hamoa-crd-ec:
 Add qcom,tsens
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-1-771abd65ee1a@oss.qualcomm.com>
 <b7a45a38-008f-45e1-b138-91ca34704bde@kernel.org>
 <d1af3fcb-f2cd-4e37-b1b1-d8caff984c84@oss.qualcomm.com>
 <e9dec9e9-afcc-45a1-9d52-2c4ff34958a0@kernel.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <e9dec9e9-afcc-45a1-9d52-2c4ff34958a0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sS_OJppXLYQ14EPmR58rexZo5l-eKvyA
X-Authority-Analysis: v=2.4 cv=Id+3n2qa c=1 sm=1 tr=0 ts=6a69f960 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=88PRl8AvwKtk7Un-c6EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: sS_OJppXLYQ14EPmR58rexZo5l-eKvyA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEwNyBTYWx0ZWRfX2X0kOTGYULSj
 rh6D14UjAWrR6OoV8s2Fa3AmwbS/OHzU7b74Fyz8yA1rIXyf8DGyyknVJ0irQNzwVqp4Wn9YhPp
 NMhEXe7qwVNqR1zS/DJHYCPyBUTmsYM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEwNyBTYWx0ZWRfX4JqIquXTPfgi
 5xeIJR7ehaFzyuTXunwUPTyG/rViIFns90HCrUVJin4VxsxavL2yGq+lbSN2hA18tli6RxmMQ1O
 utPuKFDZuOzyqr6LMAsMwxYHHW9hSnTCGmbrDqrXZdiAaJMsZuOAPAMgF5OzdopQdCj8POJZAj2
 59+ngiGtz+JTQ3Ek2xFmbMEYROlGqxFoH8GlOmbJkIGR5lTEypeXhSLnCuahx7lo0feDsELY6vi
 qUwmQHrHHBAVP+ltMUxsh45wrw/P1fJy2bmtjaKGiAIwM1qdsbtJCvZNn5dWChsShXx6m3cFA6y
 twMkbyF8O3twTms1ow/6nFezfBLwrs+AFiG5ubmPtmxgCVwwB9eF6I5UhfwaCIjTWyWAzzrt6rl
 D44++zgE6cFOWufcpcrmMm6iWBBdbH1K5nHsd9Vwi/ea6oUvW+FricCBgv5u7GKXKp3BauMgYJL
 TWB+I1HyjcougT8wV0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290107



On 7/29/2026 6:02 PM, Krzysztof Kozlowski wrote:
> On 29/07/2026 13:54, Anvesh Jain P wrote:
>>
>>
>> On 7/29/2026 4:38 PM, Krzysztof Kozlowski wrote:
>>> On 28/07/2026 19:44, Anvesh Jain P wrote:
>>>> Add the qcom,tsens property so Hamoa-based boards can list the tsens
>>>> providers, and how many leading sensor IDs on each, whose readings the
>>>> driver averages to compute the SoC junction temperature reported to
>>>> the EC for fan control.
>>>>
>>>> The generic thermal-sensors property has no standard semantic for
>>>> selecting a range of sensor IDs from a provider without enumerating
>>>> each one, so a vendor-specific phandle-array with an explicit sensor
>>>> count is used instead.
>>>>
>>>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>>>> ---
>>>>  .../embedded-controller/qcom,hamoa-crd-ec.yaml     | 31 ++++++++++++++++++++++
>>>>  1 file changed, 31 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
>>>> index c07483aa5937..ec809fcd03ab 100644
>>>> --- a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
>>>> +++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
>>>> @@ -33,11 +33,40 @@ properties:
>>>>    interrupts:
>>>>      maxItems: 1
>>>>  
>>>> +  # A generic "thermal-sensors" phandle only identifies individual sensor
>>>> +  # IDs, and thermal zones are a Linux-side grouping of those sensors, not
>>>> +  # a devicetree concept the EC cares about. What the driver actually needs
>>>> +  # is raw readings from a contiguous range of leading sensor IDs on each
>>>> +  # tsens provider, averaged together, so qcom,tsens pairs each provider
>>>> +  # phandle with a count instead of enumerating every sensor cell.
>>>> +  qcom,tsens:
>>>
>>>
>>> What is the point of having internal review and then IGNORE that review?
>>>
>>> NAK
>>>
>>> Best regards,
>>> Krzysztof
>>
>> Krzysztof — for context: I did move to thermal-sensors after your
>> review, but Konrad separately suggested keeping just the provider
>> phandle instead of enumerating every sensor cell, since we only need a
>> leading range per provider. qcom,tsens was meant to combine both
>> suggestions, not ignore yours. Happy to instead just go with your
>> original suggestion and use plain thermal-sensors, enumerating each
>> sensor — let me know which you'd prefer.
> 
> How does <"thermal-sensors" phandle only identifies individual sensor>
> and this phandlel does not? I see absolutely no difference thus you
> duplicated the property, which I EXPLICITLY asked NOT TO during internal
> review.
>

Fair — there's no real difference in shape, qcom,tsens is still just
a phandle plus an integer cell, same as thermal-sensors. The only
thing that changed is what the integer means (a count instead of a
sensor ID), which isn't enough to justify a separate property.

I'll drop qcom,tsens and go back to thermal-sensors, enumerating
each sensor ID explicitly, as you originally suggested. Will send a v2.

> 
> 
> Best regards,
> Krzysztof

-- 
Best Regards,
Anvesh

