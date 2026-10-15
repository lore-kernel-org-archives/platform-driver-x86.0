Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093B651E444
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 12:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792068435; cv=none; b=ZTfdJhhL6LGyTg45CoKbnbg4ipms+V9qkGB0x+LbBxcgwX7sxQOetkYhh5Ow6H0FPZ3bgpW5cK2e8qs32IduUVGpgG+hwmFC2LlENg1MKH+/1V1tB1lSGkkCj9V30+ksGbdr6uiggaC0KK9cGMyWOIpn4jrDKsyZlRj2adPAjsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792068435; c=relaxed/simple;
	bh=NvtJIWZ0/wm4S5ZIwddjTQHskoaL8sTa1pMVe2+X+Zs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F527Oj2Fx0s9qxgYmZuUhkCyBUbuFPtB8Cp8VrHSYXFmTpgO9QRpZP2485N8AoYhGGakUEiplJB6wS/IM0hPISOp1ocJBr3gLNTnGkkcHssvoaqWZq10wYZnATylKMQcB77p7KN7XmcXl8uHgP6rNZCw7RLfEOk/53tWrpPvuI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DOCppP58; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FKAJwDPh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DOCppP58";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FKAJwDPh"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jgPx1955846
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 12:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HpfO9Gqu9uFueM3NL3ptgyrxDHq1TmvbTG15ptsawcI=; b=DOCppP58g9XesA42
	IzTA/UW5or2UmvB9V4Pr89taVGK8r8vfLoATAnO983XeXGrD/ffWQHZ+XnZYtCCC
	zZhuxOs6AouPCZTKqywEr+t3LsB1cRQITcKYU2Haqq9ljE9hAwb9gevOsOoER43E
	Ehun5k3qu99pCMXurt6wTdLjGVWrbF2WitXGEuR0BAbGtBlCYuLZ9etz/uFjQo8a
	f2fMx1FJ3C2hUyhiCfi9lILVoGWAlz6BfDcP6VssNrZ7A7XtdZIvqrhYjJ4wUccP
	2ElQ+h0/WnshHtdcYh4UAHG3g5TDFByvsl4X0m+fZpUiOkr8eiCOc1gnhmw9Xp87
	6SmC6g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakdetx4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 12:47:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e818ca61bfso19855775ad.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 05:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792068431; x=1792673231; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HpfO9Gqu9uFueM3NL3ptgyrxDHq1TmvbTG15ptsawcI=;
        b=FKAJwDPhVE11fa9HOh0o7ZEnf4WWNxiUqKrHxv8Fy3K3Enswt54ZVF6NTII+uHU68w
         mv4qOEG9GkMnbMcUvr/y198//fcPF5V6mGgk4qDnQqZT3wXz4jjOuYFnBWswTtD4vuY1
         ZfEejp3k/Y+yJoyrmDZt9SKTaeROhGhbS60IdH94oFGinjHbpB5xlTXo+XSbIyQyaQQY
         yngmpCgCWW3GJXWH9z0YCVybJKKgEW1wO1SYyX6gVM2duToVVo2qqWgMwwpvbvLBfBKF
         BuOCuDzOWu9iQvdcGuZdLqKQgYS/tgRnaLv81BylCSdDPPyIj2m8L3Ot0u654xlfVVUV
         4LJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792068431; x=1792673231;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HpfO9Gqu9uFueM3NL3ptgyrxDHq1TmvbTG15ptsawcI=;
        b=jI2xLODshkh0Qbt1zr5s/IEWHSC3QwVTmVmFwhtwXEVgUtkVV6jBAGHFPzk+VW7PMw
         RatKCV984NyoKOvchh9mTim/JtqI/QgVlZWuSoJemhCkzATrvMquk7pD1k2aAwgrz3a5
         20x9joFbwImJ4bv/wak4M0lOgZw1cc6t+8p8upL83Sw9bIzKcpSGp5wAI64gOU7B/nU4
         /mbnEdIq/aryhN77J34Cn8kPvaifSNi+fqcjX2LW4PBPLHS+e+ONOkFvcc32Ww6r7sIM
         6oS6nb8k4BwbkF4CNIz17RJvZ8XzZXNsU2iJPFcWZqK/CG6EEAIbIy8Y5Vmyi5hyvYnP
         8OZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxiKD99WAyQSz6NlOJmZ/wn2xZLIwoVunadYjwlomwROYF7uFYYhgw9YqBZR5ZFkgV9fd5ou7sWmC/l7kfdkqJ0RZH4@vger.kernel.org
X-Gm-Message-State: AFq9FYIfRaU9cWuXOkvke/JfoGZX/nv2Lpik6oTTV0Hedm2vVLfN+/Ua
	rwHok1iCjLx+RHdhmJn1cthx0nWomSl0EBDltrdSz9wEPKHBFoAkzva61Lb1/1FUipJGgLbmfhN
	ScHH7ifNU/5/i5tq3bgusUt7Vx04zJcALn3W80FU1SHuHcmL8urVeXqRv4450wk4ZHSDAqPfU7s
	tt
X-Gm-Gg: AYBFou3Jt88KN5JAM0ds7RX4nnBiags7oAuN3jLDLVsQJVhQQ3xM52DtiXft4TgpDz5
	4amW2ZsS82qbolKrsgsjulaFqMe0M0P0IMz4iHZYFDamrPHjUPRmRIdrmMNeQoTRLZv02LELALA
	773EdJQviyA1K3y/dNU8A+x5poc42wvqyK79CximTaIpu5m9XBigqIJmZTo8j39yWI0DNoJHHn2
	105BBZ8wDqKHvpgLqqLCxNAhUw1oHV8ZNjnqpakGkfQaJ+HAjFUtF+7KnY5I0WZ41a0Klat4JsU
	ln8v7h8KhjvE+AYWPhQc4fPuIypruqYV48YU4JFqQsia7lhTr5Yt/YpvRxXkbZsfZnHKrjI1teS
	m2+zK68ajBW+ZS5o8BnEKxfMtNeZECVikm0QfP2meZd158qS+qFWEZM2XjZRkF2zlaj+LexnwXw
	l8PMAoFZPDb4hWApNlogBHtATt1A==
X-Received: by 2002:a17:903:903:b0:2df:8b09:93bb with SMTP id d9443c01a7336-2e842aaca0emr153739645ad.10.1792068430818;
        Thu, 15 Oct 2026 05:47:10 -0700 (PDT)
X-Received: by 2002:a17:903:903:b0:2df:8b09:93bb with SMTP id d9443c01a7336-2e842aaca0emr153739435ad.10.1792068430276;
        Thu, 15 Oct 2026 05:47:10 -0700 (PDT)
Received: from [10.149.81.110] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cb6sm81962855ad.60.2026.10.15.05.47.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 05:47:09 -0700 (PDT)
Message-ID: <5568fd0f-e412-4f2a-9f1e-729a469da572@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 18:17:01 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: arm: qcom: Document Microsoft Surface
 Laptop 8th Edition
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maximilian Luz
 <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
 <20261006-mahua-surface-laptop-v1-1-406fc042162a@oss.qualcomm.com>
 <245e5eef-e18a-4ec5-b57c-65e561101351@oss.qualcomm.com>
 <52adff3a-370c-4445-9797-e0b0dde36fab@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <52adff3a-370c-4445-9797-e0b0dde36fab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OdENnRTY c=1 sm=1 tr=0 ts=6ad0cb4f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=g9vuQ9wz1Of9mYxFF6EA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: hnSAZZG3SrohECFSZ7bgaq6EDDUoC9fp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1MCBTYWx0ZWRfX+jdM+fsW1zem
 VlTJ7hLgE48H6IN/KEGB2QjdwU3G2uNlMyU3GXK7/PwdQS9FQ2YHMNeqoFLOYIgNIXjYBiHY7MZ
 LfWLCiCWjnljDBKJfhOudXt4YhhJHuPVD3ec69l07dc4WkWrjLvK9uNNVvSVBxw5uLH13/xK8i8
 6N7otOCyRH+Qmusc0SqiVsGK+46zOZkDC475wKzKS38fosU2w4qQxvfpAczoQXpbXJ3/ABTjbNa
 2ZzUcLgpkErkMNENV3XHZCgZC2QzvkS9zBAfddb6dkhx8wHzl65c29JzTjJvcKlB5pO1oVedytc
 Xb+wGPAKfcVm7YTtySuHHr2RaTyLrO5DEsRMHKJ71Lt6lTgrhRXRR8d6IbKfQ2MY0YrUyc1xmnJ
 7k53I3vJ9KUhRe2jQs/PVZBIiQ4OfSWSMzhe2fr7QxgZDINhUappSceGsCq9bfQiobF3uJGzoQz
 P1bXduIsNPpCZxEsLtw==
X-Proofpoint-GUID: hnSAZZG3SrohECFSZ7bgaq6EDDUoC9fp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1MCBTYWx0ZWRfX+nW0aa9929QZ
 oYD9Mja28Bti+zxA5jeSE5dDBnaRtSRklAgxpbd9kRV3AjYXKzboHL6ykzD7oFiEYQ7HDEwgjUZ
 A8buUueSS8Dmh4cr+4GQok9wocs9t20=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150050

Hi Konrad,

On 10/13/2026 2:09 PM, Konrad Dybcio wrote:
> On 10/7/26 9:11 AM, Gopikrishna Garmidi wrote:
>>
>>
>> On 10/6/2026 3:20 PM, Gopikrishna Garmidi wrote:
>>> Document the Mahua-based Microsoft Surface Laptop 13.8" 8th Edition.
>>>
>>> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
>>> ---
> 
> [...]
> 
>> Before review, I'd appreciate your input on the naming.
>>
>> Surface Laptop 8th Edition comes in three sizes [1]:
>>
>>    - 13 inch:   Snapdragon X2 Plus (6-core), UFS storage
>>    - 13.8 inch: Snapdragon X2 Plus / X2 Elite (Mahua), NVMe
>>    - 15 inch:   Snapdragon X2 Plus / X2 Elite
>>
>> This series adds the 13.8 inch model only. I named it
>> "microsoft,surface-laptop-8-13in" (mahua-microsoft-surface
>> -laptop-8-13in.dts), but that clashes with the real 13 inch model, which is a different board (UFS instead of NVMe) and will need its own DTS.
>>
>> I couldn't find a codename for these, so I can't follow the Laptop 7
>> scheme (romulus13/15). Could you please suggest the naming you'd prefer
>> for the compatible and DTS file name? I'll update it in v2.
> 
> I can't find any. The LLM suggests the 13.8/15 in codename starts
> with "ROT" based on the INFs.
> 

Thanks for checking. The only matches I see are in the MPTF thermal
package, which ships"883ROT13Inch.bin" and "883ROT15Inch.bin". Nothing
else mentions ROT.

I also checked all the ACPI tables but didn't find a codename there.
The tables are here:

   https://github.com/aarch64-laptops/build/pull/176

Following the Lenovo gen8 naming, would something like
"microsoft,surface-laptop-gen8-13p8in"
(mahua-microsoft-surface-laptop-gen8-13p8in.dts) work? I'm open to
whatever you and Krzysztof prefer.


Thanks,
Gopikrishna
