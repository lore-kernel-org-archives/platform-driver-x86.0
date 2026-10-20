Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504892;
	b=0sR87AFNIx1DpDXdg6DJ7nkRNSR7MxfTDTQspTQSewsmtcVOVsNUIH5TW0PPEOU7aCYT
	 m8uz+vc7m97V4CPb2jU40IrrN8zngLYamUKqlWCGAWCZSgCnO/bfjtfNB/+hJ59eoSNll
	 WVzX8m5F8kjas95Bf9dfldUl44NrVflpyHj2XnUvdP5colbXDlptQIC09QGxXnu3nZ6oT
	 Yv0/GKzfWt6Tvt6PjeiPc7zhWLkFHcgGI+B5TU3F8ZNujEhukWBWkYyWavJK0o43hGrFN
	 vuZ56XWsL5Otx77LEiBehUZx6/Vk7761PAFBlDwkZBexNXslkG7EMIRbn/cUsGDSbmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504892;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=H/IoJEoYhSTAQbIuolZNm4zMxhN1TVHU0cu+DfJKWZ8=;
	b=JqkrXotUoItpMlLSItcm6RsCpdgurP5UMjYgT4o5m5fK2wcwxw/OuBlEMneehZtrfzmC
	 Gn+dK4JgbSbyG117kuxLtoAMurPUEuz9ZGJjTR0i9PjOLGkc+MP3x3t3ImaquJVnHPPBv
	 uFGLxWc3XA3y/SnKxBTKayXWiC8LSNtRkcIdJMMHC3vf7/UBnlKyIioHjJCuGatm9F1++
	 ZRGUlGe8JZ5rjhBV3um1u5RNiHTe3DE4CiWGoF3Ak6gd/pYilVDGlcK0QMWbrUPbJjKUB
	 GTzN3VWyqf9yb4uemnP/m/X9yop/lmo4ExSJYryI3txPEK3S9BKQS8GUlAQmI2i6YAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QqNYPlK3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fdfUd8Io;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EC3606A31E
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 14:01:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9EC3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QqNYPlK3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fdfUd8Io
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KE0vod1843486
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 14:01:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H/IoJEoYhSTAQbIuolZNm4zMxhN1TVHU0cu+DfJKWZ8=; b=QqNYPlK3iN0DZizd
	jG0edZTjx7AzM9Os37g5vfDpBPvpa8eoDAlkhL1XjwDuuhMIqcNii/gyGtdwC/dQ
	Duk9HhdRrssaJfnje4WOWusbTT6Zmdui7At6OMP33f8My2X8pf+YHPvjyHHMu74p
	0D9kZah66xD02sxC6KjzHY+DSYSj+h/9IX/WxZ8+5w5WXQ68LdBo9WW3O++6WJLL
	v0lxxwZGQ3j5cdgIESu2jNP0/qPscJ+UR5AZMgQMVl/HOK+Pt59CEaJLeeaVOY1n
	P0q7/AsDmIO+thg9Ozh8C5zEQYCap0qgnY9K9CHb5Wh8k3uUrZs/fWPCInw5aVBG
	7L/tDQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2sqy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 14:01:30 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9909853d264so36637241.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 07:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792504890; x=1793109690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H/IoJEoYhSTAQbIuolZNm4zMxhN1TVHU0cu+DfJKWZ8=;
        b=fdfUd8IoEMG8upHkv9XsdZXrVJxhfAxxy6Pp1K0peZIFDXic5NBPMGRXPMV2Cwu4Kq
         gDvqnNhkAwM91i4aGRk7rhqX07Vbxqpjni+IY483Yw2BkDq65VSICqy2epTx0ijhxsxw
         q+j2nU4ApG3jTXvdHRRnv2xY0n0VCC4retSi3VmWO+GVz2tBHJ6EW2PUc3lIzzSL+Aj2
         NPdy3f5Yo2iNHE+y9pWZlWls+0G0kRjHIhs42I2T2VTZk9pIDxNgw9uaZCts/AQJW+si
         cwpfCBoqTghOe3fx6m2Y5o2VLF3r5o+bnKZir3vUYBqsOth2o9GtJkiiD1gVZ/S1mb/B
         oLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504890; x=1793109690;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H/IoJEoYhSTAQbIuolZNm4zMxhN1TVHU0cu+DfJKWZ8=;
        b=OBeOZCMoq3uWm5g+YRRAlz91JvlvuWm3Q/8D91Slm/ZcSzG2zkzziaGxUYo/x0PEcc
         7Ulm4/LHzJJDsX55N/m9ttYi7xXIZKxVzwCPeQ9GsGEv1a5xUZS7yOxjrbUkymq5xWe0
         +BOKCB7ms/B/MolgF2Lz+M/ev6z9p6JulIyMrrZk5mCFft9PfxzbCvsOf2aUn7xpxz77
         jsrv232HOsglOmoH+C1XvwRfAaEGsHENBZN7Rpbu0wbSSuJU9G9tBPW3VpCgscSd/505
         hjmF5YCOqUIDGo6g+Z1rLAm25m+aUeHNyPooohjlC2VX3Yqd0EBR2GlOdaGRbNpOLcJi
         an2A==
X-Forwarded-Encrypted: i=1; AKwUvBwgnJHINAm0sqQsTchChAf04O+KPNhDxQj4S1/NuoPVQkzp5RCENC/bIT8i2qjuTf2gESnkmD3mpVNaSW4U5iXZDrES@vger.kernel.org
X-Gm-Message-State: AFq9FYJ49sTBjkxUzBoYt5yxY0apkXS//QSXyRcDVtd6jHBHe8SA/JGc
	dNI6RRrgilYIx8EcbLjGwuqBLySlWkBVuKH8GN1T4p655coGYlLdMPW5mIUjtZP4HTLWU9hDwiG
	oDCjlDDMnmj2s1Yjv6ULHjzFgSi3I3tDMg75MYX7yDqKJQ01jKyUvkSyBxGaeyxF/vfmFaDwWx/
	Me
X-Gm-Gg: AYBFou3DgA/uoHWwCREZ7Fr1k5OW9nYnIXfc7RdGSIUYAgZWtjHBLuctOjUx/LmtpbO
	PLSCfB3dJ5fb/+yS0C5yubOmyrQOwnTfuHyffaaogbMYpi1J9NPJD2JZ3AT0F2vcP3N0V8JUMeQ
	rhEggQoJYh8tyXtEaridXdnuJ9q2hhMRrShtncSdAY3+ykVL253TUN0wmpYtq9xoXqD82xG27dB
	UqLlmC8zAOcsOW0OhY9pvXCx1uUixG55bA9MpMBoYuyrfzAkhJFPHFpyfeNJT5yVrtyC6OUgr2h
	1KgAokLYGwp7zi4i30eTfnDoXtVuuMk1C/8l15tL/AP7f/SI1DyO5o0dpET1dtTvnHt7pnJPN9/
	XO75NQ6egGcpQFeVv8FGK4w==
X-Received: by 2002:a05:6102:2907:b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7cc368e81e9mr1651128137.2.1792504889510;
        Tue, 20 Oct 2026 07:01:29 -0700 (PDT)
X-Received: by 2002:a05:6102:2907:b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7cc368e81e9mr1651074137.2.1792504888917;
        Tue, 20 Oct 2026 07:01:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b0f75sm5333722a12.13.2026.10.20.07.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 07:01:27 -0700 (PDT)
Message-ID: <ad849e0a-5ee8-4df6-a679-ffd44c2972b3@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 16:01:23 +0200
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] platform: arm64: Add a driver for the EC found on
 ASUS Glymur machines
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
 <20261015-topic-asus_ec-v4-2-af6305ffcb10@oss.qualcomm.com>
 <ba7830c7-9ad8-6695-f543-c4c419aa9133@linux.intel.com>
 <e4cec04d-2c66-4900-940c-d7d3d245cc64@oss.qualcomm.com>
 <f97000c4-496d-0ce1-318a-1df5c0de804b@linux.intel.com>
 <3fecb67c-81b2-6e6f-889c-01425090321f@linux.intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <3fecb67c-81b2-6e6f-889c-01425090321f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1S-zX6PEQKOdwydaub3N4fyMcjaqpXSh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NSBTYWx0ZWRfXzxhwJiuRunpj
 ma1A6WpbmbJ1v8qL6h8NsFjBTpC1S7x87cO/faLIkKTwLk4jBA42+6bKMl6iHzRhk6J60mDlu3Z
 V1If/a/0x29A+gUHy5qRfcxRWp+VGew=
X-Proofpoint-ORIG-GUID: 1S-zX6PEQKOdwydaub3N4fyMcjaqpXSh
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad7743a cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=WnbzyOWOUeW_Ihyr:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=SB7vGQqGIbRnJ8eduEoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NSBTYWx0ZWRfXw1qFXfc/yi0S
 GLMAm3QVFnD0vKJ3IcasiictcS68gYVsq9TgFIc+/tSTlEJPyJV/riRLdgQziMsNnOWyRIAbBmF
 b9ZhPdHQBMSj4rXadSZyi/5CrBCQHunkJH0M3g+JAgsb1aTcKb1lUxqjSUrX/xIHcIXGSkA5BTr
 UxSq8vDCtH/tmcpLLURtSjcR6ekooacQN0zSvN20B3KCYGn3X+SvIsYmSIdat9/2sG06SuyHADp
 qKwl137sbnyMVwxJzIe4kc5e6mexR+t+8feEERh4A9jiKxAH7IpW+sm4tpUFGVeshyPys0brAke
 GR3zZKruTrLLRwZo1Gu3V8KGN/OWj708orfB5CWBqS3wnQP1HYRDhuw9Xv1+5l+/H78HocEqTgg
 Bbhh0GEdvhiTVP+M2itTKEWzXxFZpo2kpfH1drMdE5UK2CZ4Ugk24mymDf2H/r6Umzm0pUt/uF2
 ASz7mAMMs4gPHl+CkcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200055

On 10/20/26 4:00 PM, Ilpo Järvinen wrote:
> On Fri, 16 Oct 2026, Ilpo Järvinen wrote:
> 
>> On Thu, 15 Oct 2026, Konrad Dybcio wrote:
>>
>>> On 10/15/26 4:24 PM, Ilpo Järvinen wrote:
>>>> On Thu, 15 Oct 2026, Konrad Dybcio wrote:

[...]

>>> Yeah I know. I still left it in deliberately so that in case anyone
>>> wants to audit the format here and compare it to the DSDT it's more
>>> obvious that this wasn't an oversight. Do you still prefer I resend
>>> (or maybe you'd like to fix that up while applying, which I don't
>>> mind either)?
>>
>> We can keep the member there but I'll change it to {}.
>>
>> I can try to remember to fix these while applying (I'm good in 
>> forgetting though :-)). But I at least try to check all the comments made 
>> to the last version.
> 
> This patch 2 has been applied to the review-ilpo-next branch. The rest of 
> series will have to go through some other tree.

Thank you!

Konrad
