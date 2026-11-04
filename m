Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781453;
	b=FUqcrkunlBKGCNVBF27xuAVkReWxtJZUFSYMA+LA+Rw2Jz2oEVfkMqya3TYoXqphPTzF
	 ZJi6YjzimVwiAoJKWTQGCURs1sI/dPJ4goOAT7rGppWDIviRKBFYUDp45MQWOivWHFh4p
	 0CjUb4kAiJSaM9pQmnUuqQrPJEmzhSWNAczUz5o/NeX9PFTl81bW8M0gXhKLDeRUegQBj
	 ryOc9+dbqCRRYS0kBRkPxmRaWmLZfVca86T2NROCqg2QG7gQ4NwhOyTfywVXst+NCMiXl
	 JjD24WcxVkp6rB8ntcDbznXEDdvmyVxxbvYubqRpRPc3n2okICCg+xOKx+QIHccIFnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781453;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KVKN9kg/Uqv6XDovB+Zs1e25cxjcx32C++i9N3htlzs=;
	b=AQa5l6e2LKIZpM3ick2qm2LHyQ/VujmtPLDCoJ/qf0rEtepglGzYsOq0LogEBJTq6los
	 lOe5MfNvRZO1MB6OYVClP6vLTxEQKHBy+EhGWcg9vsoQ5uXUk63ZKyBXIavkql4vsUt52
	 auC/hIAKlblLzpGh/O9gbcinzlEVUuDA0vZJiZWXyzB4NmaokSo/a1QJVMfXqBc0Majhp
	 wbszsE6omEjfct2i7re786263waZkvTp1ttWxEuiWqhqu6RZOSLk06BKXGJGGV9ADeLhk
	 fbO9c88OxWR7bw/ArV301PEfvKPJowvOwsAO/g+gOIjFq4o0mwa6Wyb/9j0unlDqB9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZklL7L7Z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SR0beHqp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B42606A326
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Nov 2026 08:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1B42606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZklL7L7Z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SR0beHqp
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48L0Eh1274965
	for <platform-driver-x86@vger.kernel.org>; Wed, 4 Nov 2026 08:37:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KVKN9kg/Uqv6XDovB+Zs1e25cxjcx32C++i9N3htlzs=; b=ZklL7L7ZCWzQ2sZv
	tFpS+HVTme9ImWkasA4By92hM/ckOxk1UZQ8dB8KKqny2rV56YPm02nuXkapFpa0
	/93w5AX3YB6/kSHOCKGY5PMWQinMs4bkaFtqyLBeykadLqLEb+0GHIvAN4/XKl42
	7maxi98XZ4EyhRQc+FU78lpXJr//wyijsjg8MJ2trwdY8N9o3d5RJ8rKw/TUYhfN
	touLwV6tCFBe12u0myVNKQR2g1hIOMZBpyE5Jhu+leDxLqJSWcbAdFm6J4ihWtLx
	HZNV3xfDGU9p6alhIBG+iplWJVDNRx9hMh7P4NMH+uGiFC9OmsYdeEKEshaHsiR1
	+N0GzQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhypm1qw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 04 Nov 2026 08:37:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-536708d1a3eso1382721cf.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Nov 2026 00:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793781451; x=1794386251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KVKN9kg/Uqv6XDovB+Zs1e25cxjcx32C++i9N3htlzs=;
        b=SR0beHqpbclrsxfec93AMxzw9QKXVpjS1WpzP218AT5Xj97T0x+G+ypmj3Va7cZ1kf
         ZLgqtCK+apakHbojRjXVq2AdVQ2eZy7YnfL/XyyJQgEuFkAup5HZKe65T+KaGMi58ouo
         oOKVe0XBEKHuo27jOimkkcS8+vrv65ABsmRNyDDkKvbygb8MxlxCmm1viHvgIpu06TxX
         y7kvH0OjSsDp5pt9StUfaYprediGs5fDEwf/z1pXcr8wXRbKfAOrCMsjL7VkeDGaLKFg
         u78OhaU+74FfVgF90IIg7vwee8Eu5cKIx7yh8L+o3K6cTCktIvl/+/0c/YHa4cIJ2SV+
         K0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793781451; x=1794386251;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KVKN9kg/Uqv6XDovB+Zs1e25cxjcx32C++i9N3htlzs=;
        b=hpum++nzWbKKq2A2FYA+OimGK2U8oMByznGKGR1gdcmcMqZ3FEpSiEZN3bXk4NZlXE
         b5WcqA3BLp9t9VY74G8qJd2G8ERtZ7jSl3p16+e/ArZ5AXnlaFqpSzwa+mBMreU/PYeJ
         JB91RT3ZBDeqwKo23JuQGKdwcVvKe1ZNaeN9jM+zrZJHTlmvX1oTyLAcnpspOEd31kOq
         IYN8x1bVhJ4DCdan+JZy/EyL2q89MFutdCJrAtQVtx3OXc/m6anFlsxX0sbHEo4f5tF0
         rfjZ5lo62j4Q3bdbNE13MPt6EWFrtsybV6BOop4lsTV9sH4QjPiRMrmxPOBuNvzLN3pD
         6iLg==
X-Forwarded-Encrypted: i=1; AKwUvBxiaH+c02RWgeuC+8Lj4AqBPZTmGBLzjbAUfmNXr2+6ICduxF6gZ31L1SIbFV42pchOT3pkk5S3TPTfGm1uIp9iCTOY@vger.kernel.org
X-Gm-Message-State: APuU4Z/+7lhxKH3Iz1zPbgvdENoyZjyx64HWzryrPVSDjXQ7plseo+BG
	EFnjP7DLf2H7Kvctae8PU14dRCeiJeJf3XvvjexRMeuzYlu0pW7nkYPcvz323Ycmz/k13C8+UcC
	dNbYpgVfgFFNJYhs4gn6sTj/s28QVPTBHPA4GDQipEozj3B9ZeCb4XdSiOSrbG3V42TbLX0o5Lf
	QN
X-Gm-Gg: AYBFou1o/f0Di3fTBvmheeEH+3c8wbZNHhhfgEsqajzg6Fb8URyuLDoHiKNM46x55WT
	6IlrM3iNxgqbPUXF3FE+YTwVBkA33SZtVQmraEAvxxZUL2Pnt7PHrW9rTMJ/fGmq9CJbwW5d3Rf
	58UVUzV0LVECBXYqCLdwpme1HKLnLj9DALZbOdsKgzo5BtR+PZ2vYd9LVAp71KK9n9YnZ/qgeCh
	BDkF9Faf2TpcSy/MblSlS1XD5AK2C9tWhXram++Z02k2LtBhRWQrD3qnjvcrL5Uznc83+a/Nm29
	o5uSG71L4/dS+2CurYAPsMSw2Mx32Oo+thA3UWOd249jvWQYw1VS0+hjnWG4JcenDwtZ9llGfwg
	VIVSwpFh3Dg8zOeP6sjEkxtPkI2Q6CTpaMBzMsjHG+tUNJ8Rj/8NNngZ7j/q2el2PfQTN
X-Received: by 2002:a05:620a:cd8:b0:944:12fe:c8f1 with SMTP id af79cd13be357-94421367ed6mr2481150885a.0.1793781451217;
        Wed, 04 Nov 2026 00:37:31 -0800 (PST)
X-Received: by 2002:a05:620a:cd8:b0:944:12fe:c8f1 with SMTP id af79cd13be357-94421367ed6mr2481148285a.0.1793781450641;
        Wed, 04 Nov 2026 00:37:30 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55abd5569sm538339a12.5.2026.11.04.00.37.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:37:29 -0800 (PST)
Message-ID: <a759d346-3fea-4a01-a80f-de354746a288@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 09:37:27 +0100
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
Subject: Re: Kconfig dependency loop LEDS_CLASS -> EC_ASUS_GLYMUR -> THERMAL
 -> POWER_SUPPLY -> HID_NVIDIA_SHIELD -> LEDS_CLASS (was Re: [PATCH v4 2/4]
 platform: arm64: Add a driver for the EC found on ASUS Glymur machines )
To: Mikko Rapeli <mikko.rapeli@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-yocto@lists.yoctoproject.org,
        Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
 <20261015-topic-asus_ec-v4-2-af6305ffcb10@oss.qualcomm.com>
 <aursRfQRr0AOL1Oi@nuoska>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aursRfQRr0AOL1Oi@nuoska>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNCBTYWx0ZWRfX0BEODejenVgL
 +NPtElUYaKJq3Lz9AvL59/Fyz3T25bhQqMJbEvSlEtFH4pw9h9/Iq3x/MMYkUf3jiIEHQof2kfv
 czwd6I3GJNoPtnzeNW6LjN/pfOo3UQ8=
X-Proofpoint-ORIG-GUID: 0A41NdMqYFVii3Aql9QOGGDe5hMIcaMx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNCBTYWx0ZWRfX32HgibUHI5Ki
 ij7uKA2MNgbFI9ZSxc2N3HFhVzRYZuz9y69ZEdVVlfmQq3uKWt5Lovo46nwdQqvawiKLWVFKGCF
 N1VpYrALkdpVzdR0KqyvEU9dsfNBOy5ytJpybmqLgKeLv5Da7twd+jQVxBAkv3RK9oi/+a4/4ew
 jmDZjyeMZrm2hA+sUi5uIN6Na2IcCOol7gVvC7wDnTVE9s1JsDtw+BQf5KKB/Zk28YTZLu6gnLn
 YY/77ZgGdFdtVduSqflLFZADQ61rl3AZa1AKWUM6RbX16P4CJ800bksxv/qXT6R4GxEVnMfjZSf
 iSGp6Vx/QNoYlIrC8RseBRnOKUllh2zOt4EHwbF02jqmgeTS0e6GNCyvTUo+UeXmDsNoUtpxSCK
 dd275Zh7rYsV/Jz1HbaiO7BefCglAAbyf8I/+EaFcXGvUWBkbTvUaRUWOaDKBX6B/aJZxZXyU+n
 CsXGCn1N6thQh1t06LQ==
X-Proofpoint-GUID: 0A41NdMqYFVii3Aql9QOGGDe5hMIcaMx
X-Authority-Analysis: v=2.4 cv=T94Z3PKQ c=1 sm=1 tr=0 ts=6aeaeecb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=WnbzyOWOUeW_Ihyr:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=iGHA9ds3AAAA:8 a=dNOK39mv2ItteVrz7R4A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040034

On 11/4/26 9:26 AM, Mikko Rapeli wrote:
> (Adding linux-kbuild@vger.kernel.org, linux-yocto@lists.yoctoproject.org and
> yocto kernel maintainer Bruce)

[...]

> With this new EC_ASUS_GLYMUR driver in 7.4-rc1 there now exists a kconfig dependency loop
> in arm64 builds:
> 
> LEDS_CLASS -> EC_ASUS_GLYMUR -> THERMAL -> POWER_SUPPLY -> HID_NVIDIA_SHIELD -> LEDS_CLASS
> 
> In Yocto distro we use additional tools[1] to check that kconfig elements in fragments actually
> get applied in the final .config etc and one of the checks is for dependency loops which now
> fails with 7.4-rc1, full log below[2].
> 
> To me it looks like EC_ASUS_GLYMUR correctly depends on LEDS_CLASS and that enabling this
> driver by default on arm64 with LEDS_CLASS is correct. And also HID_NVIDIA_SHIELD correctly
> depends on LEDS_CLASS. Thus I don't think the drivers are doing anything wrong and thus
> on the Yocto kernel QA check side the dependency loop check should be relaxed since they
> now can exists in the kernel tree.
> 
> Do you agree to this or is there maybe some way to remove the kernel side kconfig dependency
> loop to and from LEDS_CLASS?

https://lore.kernel.org/lkml/20261029021330.460192-1-haiyuewa@163.com/

Konrad
