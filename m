Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A594D09FD
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 10:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405878; cv=none; b=jdlylvoEFf+isa5EdUDVsOaRbg8hiqjfSkIMw98KDts4Snk8vnq5zAs0gkxZIYnjBy/1EXQqGerf7FDYEh1EBYKFUcouWKjVyNfim8tG2nU0dT9+tR67Vu3YaCh3igMfuXMP/HgZB0mj4343iAJwZxHJ+YxOxl8GNvdbJ1+9cNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405878; c=relaxed/simple;
	bh=xLOGKGdR/TkesfS5Hh1P1f17v+nmPE9pRniwwMVSoy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gLrznc7oSJFgYhesMF7Up0Ixtf7Mp9zUUwsr7fC6dJeQYMC/QH55NYwduTTbV5LBhsBfQp0cVDrrs9XMAn4UCpe8zoRqOW4O6ArwtqyyMi8vkos/J752LIe9PlUDWDt3mKCmeSjwaWYTasSKm4om3N6BI3KhV/VckyC6Qc85biM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rmw8KTi0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JUKMl02N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rmw8KTi0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JUKMl02N"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8PDPA2193411
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 10:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RYK1463Om0BeLkjtSbKer/jvmkMwEuX1kL+uNM6n95M=; b=Rmw8KTi0pUVSCpBY
	wiF8RiATQWk60bVp/6dCGSJIy1eEb7SEmXjJhM/T7Ku82wna+2M16RzB7oHjuq9I
	6EBZlQXb+bAbnaQMACOajPSc8TtRZobmWmiNNB6yQWiVu6RA/+QTUKUAwJKbRKSo
	vB+0NY8vnFX0nqkI676eJNB7IdeamuyHa3VJJU1FCBJlK+CoBWZF7I33jluOk2ni
	naStfiVbo6lArR7JOy9y9iJhB0p6t6h6qc5U02bdBMZmxIrPt9B9UofwuranTAEh
	xvTDVLBoxxPGcGDNG624IEM2QfeM/qsWE/eI4/pPRErWn0Kei0r45YawOfQn6RG6
	zwIyBg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5w1a9m6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 10:31:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb1091fffso17542685a.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 03:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792405876; x=1793010676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RYK1463Om0BeLkjtSbKer/jvmkMwEuX1kL+uNM6n95M=;
        b=JUKMl02NjhBSdnR61BxV/Pq5k9dm4X+ftjTyqQV2xXbrJnimRGC6DeHkZGgsKsB2RA
         6vEDtoVJMjjtcFwG0ZSO74oIX1VS/sYO8BU/tGS1tjXTTdzoWJgg0fhMu6Ug/AqLTIJn
         IWtA3s0s6wH3YaqURwLwkeg6OnqOKy7pMxwoE8TGrb9sZKwEL+E4/Y3eiE3TEwlHD7rF
         Bclo2XA/SemRaPfLMCHCiT8O1WRBlwWQTRdq7qi8k4n7DyXJmX3zV0cgCtUFMVS63Wdj
         Je+tElYARyhakV3KGz3CUrmtv1aFXhUpNAogenDRCiSJrAUh17gyagD37gnAprly26+2
         zzpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405876; x=1793010676;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RYK1463Om0BeLkjtSbKer/jvmkMwEuX1kL+uNM6n95M=;
        b=xn8uIFlDjCtA+xYjUqAgZ5YqcGYelTHN+R9sUKuFqGk3KjoduyL2RvtO6pxhNezx5b
         fxn7d4c1XRPXBfwX7rSBFtKXeVmyF3hSCK2VbIukr0OiNzhokNZDVbQQR9/vFUWQqkYe
         X0HHFGMCfMtzzaFN0whyl6zlOnSfMlPmobU2HjrC9QmCOWKLtfeFn3ZgFlpddphq7ukA
         OZxzCDjzsqLoNxlo4ZvCBBR/8SMkt6nWEwPTeYZK43DSLcYx25V01VrHKd+YRs/8P9PG
         DX6U5LIlAkdpP9eOBjxhRg5M3P7TnsBuOuxKgmNsU65SDJAUlNLEWPYvS77EiCl7FULX
         CjAA==
X-Forwarded-Encrypted: i=1; AKwUvBwhOyMaJdWWaxLpVOna+pLBHF8ahFr/HuJzUQsNhH6ceQ8g97m/sU0uVLnrFrcRJuPC/y1g/BhoAlk6Om5lk+aPTeC+@vger.kernel.org
X-Gm-Message-State: AFq9FYK8Xgfftg3aqRzlI5dT2BfM3gzYx1gSmaFJbV3sC4wh0ppywIvl
	iH4xqfllHwHpOmW/3QPqVhT0DfA4bX1jggv7DPKmanJzrcr5VdkugF3jsHz4sRvALOudC0NMWGr
	idlzD1P3HMuxwTV6j7gWjiDHbL9a8cSHK9DgYJogo1KwjxPPGVFDdMOQ7u0HjdZQ1sW89dG1gfx
	y/
X-Gm-Gg: AYBFou0a4wtU7GcF1Fc6KCcb4vY0JE4H7z6S2WaQMGuj9vU2gcbtH2weoDvtXbE0nke
	VtIH7SFVJct3YblFR7tnbKRj7tsVqXuk6yaNbDLwjDCAyeEyrAzxfrlBpgUg8PJHlDcMEBvs5MV
	1shsDQ+w3YQxWyPOtpN3hPrayLNYO8qS32qX505EsU9E78Fo2+4JtujnNYotEioUJxkHBThGSMC
	OOOpYb0fN7lUSEX6Qae/kKiu6GO+PCGrl3tOma3jh4/VaEyi32dHiCP6mnzDAjnVftac4iPBKop
	1A7IHOTWu1WcSIvVh5D19gTQNjd/KEoS1Xk7tPcBbaQKJv+/WNZaPvVq1/6K0hcFF+kQwEaonUX
	+Dy+r613Ey/w7iUuAzEtunw==
X-Received: by 2002:a05:620a:2a0a:b0:93c:61e0:81ff with SMTP id af79cd13be357-93f29b88632mr1364683585a.1.1792405875616;
        Mon, 19 Oct 2026 03:31:15 -0700 (PDT)
X-Received: by 2002:a05:620a:2a0a:b0:93c:61e0:81ff with SMTP id af79cd13be357-93f29b88632mr1364644685a.1.1792405870444;
        Mon, 19 Oct 2026 03:31:10 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091fade41sm343284966b.82.2026.10.19.03.31.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 03:31:09 -0700 (PDT)
Message-ID: <5cfc6414-735d-4df3-868d-c8c3c4a98e30@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 12:31:05 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: arm: qcom: Document Microsoft Surface
 Laptop 8th Edition
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
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
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
 <20261006-mahua-surface-laptop-v1-1-406fc042162a@oss.qualcomm.com>
 <245e5eef-e18a-4ec5-b57c-65e561101351@oss.qualcomm.com>
 <52adff3a-370c-4445-9797-e0b0dde36fab@oss.qualcomm.com>
 <5568fd0f-e412-4f2a-9f1e-729a469da572@oss.qualcomm.com>
 <65f6883d-8ead-4c6e-80f5-81f6857df0b8@oss.qualcomm.com>
 <f624b075-df3b-4862-8231-8fcae7f18d50@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f624b075-df3b-4862-8231-8fcae7f18d50@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfXybxOUcaCNZfV
 KcfqorOmL9nrjs4izuAff2lXvOqSaDl6rgXng4USx7MrrvJ5SaMK7ca0kLL3GnGgyBc8z3mHy+Y
 BPZaGnKhSFqgdqvTIZGhwJNBpFVplcs=
X-Authority-Analysis: v=2.4 cv=KuPYSmWN c=1 sm=1 tr=0 ts=6ad5f174 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=8k6WQxmsAAAA:8 a=-HwF9I-Zzcp5qfXbVEgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX21qSpnABG0w0
 aY7jXkLhXuW9RmTjkjGuPxBr1HNeHixCHS1Umh2xSpSojMVeyW+1AI07RtE9nkCxcrllrKGlpyD
 61LrmioGjhALgvePmjKnjsYpWAqjHo2lhyuiBou0wdFaNbeUxsyWGYlKEtOrpXDXg9UYllD4/HU
 T8ki1StY4+oYUVnddHtfWGiYhiDNENbOT1giZVp9LdwCxO8RtUZhyI/uBTVjY7aeVpre99Biu85
 FAZ1HlkwhJ8o6QF3NA3xXGnQRO8yxw1V7/3bPzWb929y3HsYPCJ5JztrzRKtQKYZRbSFJVltzXP
 D0lyORpn0pzEFsHKlJ4L1qjOMeCCBdGC2OAqe0s8oSXNA5IIAuL20C2kOsEoqf9h+aVRtgRc39P
 Zi0AIwisDeKlmiSMlbmBTHJvbyOpB0sKQQIXhGvTSxhS07Qskvfa/Orwdvo8ZUllPf4JKV2WJct
 C9DmDnb3o4BFtjOY1Fw==
X-Proofpoint-ORIG-GUID: Y6Iv-MtHSkOiJY9lDXxqHcpZgEaPr0YI
X-Proofpoint-GUID: Y6Iv-MtHSkOiJY9lDXxqHcpZgEaPr0YI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190041

On 10/16/26 11:26 AM, Sibi Sankar wrote:
> 
> 
> On 15/10/2026 19:02, Konrad Dybcio wrote:
>> On 10/15/26 2:47 PM, Gopikrishna Garmidi wrote:
>>> Hi Konrad,
>>>
>>> On 10/13/2026 2:09 PM, Konrad Dybcio wrote:
>>>> On 10/7/26 9:11 AM, Gopikrishna Garmidi wrote:
>>>>>
>>>>>
>>>>> On 10/6/2026 3:20 PM, Gopikrishna Garmidi wrote:
>>>>>> Document the Mahua-based Microsoft Surface Laptop 13.8" 8th Edition.
>>>>>>
>>>>>> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
>>>>>> ---
>>
>> [...]
>>
>>
>>> Thanks for checking. The only matches I see are in the MPTF thermal
>>> package, which ships"883ROT13Inch.bin" and "883ROT15Inch.bin". Nothing
>>> else mentions ROT.
>>>
>>> I also checked all the ACPI tables but didn't find a codename there.
>>> The tables are here:
>>>
>>>    https://github.com/aarch64-laptops/build/pull/176
>>>
>>> Following the Lenovo gen8 naming, would something like
>>> "microsoft,surface-laptop-gen8-13p8in"
>>> (mahua-microsoft-surface-laptop-gen8-13p8in.dts) work? I'm open to
>>> whatever you and Krzysztof prefer.
>>
>> FWIW the "gen" naming comes directly from Lenovo's product name,
>> i.e. if you go on lenovo.com it says "ThinkPad T14s Gen 7".
> 
> Official Documentation say "Surface Laptop, 13.8 inch (8th Edition)"
> 
> We have to create a dedicated board file for the fifteen inch variant
> since it is expected to have a sd-card port and another one for 13inch
> specifically to enable ufs. All of them will have only lcd panels. So
> how about if we go with the following?
> 
> microsoft,surface-laptop-8-lcd13
> microsoft,surface-laptop-8-lcd13p8
> microsoft,surface-laptop-8-lcd15

sgtm

> With this is mind it might make sense to create a common
> file mahua-microsoft-surface-laptop-8.dtsi that all these
> boards can import from as well.

If they're sufficiently similar, sure thing

Konrad
