Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCF738F62A
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 10:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773656969; cv=none; b=bXaHsPcbHYg2qOb4+sAy2JDjZ6cJyZ1xGQmNBj4HsZ1J7pDNx6ix0Rw5mn1uh5iLDTjT8VRMW4XiQ8Mju3vtFyNPtYxcyV4Pqaw0vKyT7gcCOIQCmqv84iOmYE7r5tGSBpgjuBmFKBiHdPhjFBZxZrbDt63nATKo0sBe94rgDpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773656969; c=relaxed/simple;
	bh=sinyi7GmNx1mY7QcKno1ufbgfnuVSamjAas3mDig7QM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mpz1DmoF7yx1UdAuOXJZ1kW1LVtjXW/nGNySshYt4dC3lq2dIRqSG7wqsUKYkvviqWTX4hOdgdjlr/sgxsrjDyGTYT0sUziBqTN6k7QZsm7vfacrdpDuK3OyFId5W6OWKheTlmLdweHibSh+CaIsafgcUayRl9R6Jimt1712jvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G6aV0x6a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DzasGIe0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G6aV0x6a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DzasGIe0"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64apq3777629
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 10:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1SyIK5mrij/+PqCxigjEeQmg92ExBxvCySG5xA439Ek=; b=G6aV0x6axHC7xP9b
	tEyrqajS9VD7TDEDv43Rb0nvkVZGF8pUrIlc4Zk6ieV+slRyBvyxyW9pWgEk5HUm
	vCbGDH0NTBcDvKXudHf5Cg2+qWymTirlODrBtKKqikT3pI8ASzdydwrzUzTLpNk8
	4QGWWtaZFtoOPK7jTW+jiv5RhLj8uXLvf0B1Y7GnJtzuktWv6869gvsk1/M1fc8z
	vEVplgikeDQ3sdkPrj0ntKHV6itEgXQC6C3tmDW/bMDULWJSPbEXrZi8ywSn8hvL
	BTjHNcXixfDQWcF7RkUpQcX/6m+D/0rf2rogXTnUNZzyk9AfYhzhG1ASe/nvA9M2
	sRe7rg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0y7w46q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 10:29:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd8e89d19bso300038285a.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 03:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773656966; x=1774261766; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1SyIK5mrij/+PqCxigjEeQmg92ExBxvCySG5xA439Ek=;
        b=DzasGIe0+6QtrCv+Qe2vJjiDYVo1WoWyHkAl1hsNzC+jrIYJgC6tary3Auro7vpYG3
         NaqTqBJoiSyPacIBtYDKjtBLV7zDwxY7271ZHOZ2q6+dtbmGyebM+a5KfugzLIv9JS57
         lhNg77AQC9T+jdVB+3rZk+NdDItj9yJqsPdgJ7itItO6Qve0BLhLxLOxlZdDn0ZPxpTI
         jnGSHt/2ueo4sP1jJ8PTV+Ox98b+HA8WU0aILOgNBuXwKMrV0IuYj0HRW8g5+oerycjf
         pv0dFaYqpiWkhG+/xz6/Xgh0dleu4sTAc+UR/oo2xrOPpba9WcJjjQAKixuvZ8FAkJhf
         p+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773656966; x=1774261766;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1SyIK5mrij/+PqCxigjEeQmg92ExBxvCySG5xA439Ek=;
        b=c62+shaT6UtNZjaZhty3OaREtEkZKUY/dp9MmEm/gSj7BBY+ZsFqTyJsO4Bh1u5aKV
         hbPkcTdzeCEtZB7VflyqicE+GcqHjTBEA+Kt7B1s9RsS6B3NeQyCQ8fFSEQJpvzREnTT
         W7Tm6xMmZeKhDHO1FewADg4snBoefm0askcUdEd0kd+8lCg3HCt5we9z9pXbtehK4suH
         JuhGqMdi1qBYK2HjyXN6Fu8mYdTfwEZfuxvR6dAXnGbHzPdn2VqtJ7AElHbUz4TFwNQI
         t9ChBkRW4pNH1RqUNDGK7mrAvOEKgADK3/whMQSKcoRw9JWT/IvLmgr/U/m0r9g2aTq9
         63WA==
X-Forwarded-Encrypted: i=1; AJvYcCXLqSXtKx2PD0bPNZl9PWA1f2N+6y9vWV0jGtlUg0H6IgHeUQOpF1+pFcgnUQC94qgjLU922Ve7hxQqRQTnaBWBU/jL@vger.kernel.org
X-Gm-Message-State: AOJu0YwArxAKRKbv+cbS4hPghHvOsXYzhyNrEg8EBYIPRssbK6b2vvSe
	c7Pcgh4isYBF0vGU+gQ8nLC3Koe5GAsCZdv4+Alrq5j2zzAf2EZ3oDfgcHmoMLLL4bk8LKYayQu
	GVR2C14gZ+VfzEE5/WMdGiA7uCQttcejaiN049Ahk+M8WXjsIoMlwGhNoMzlFORIlU4krA2hjix
	lJ
X-Gm-Gg: ATEYQzyx/IFRU+Th6Oju0gbMTs2+nYmlYgHW9OwZJyRs2dt+7Mxr1cR04rXTv3en/k/
	jIL+IYpl5QhexSsV32dYULiNHkT4WJco6cS2y279ahXk1epF24h9NIDa6aze24ycpxSx0QJqzfZ
	QP0XbUAWEoaDUYGWuX+PnCVLdOdXobOc0zy1Myh/cXzDygwQbRcqYXJcqhbkxrYEbFCgnndlBwX
	Qhwp+qdRS3iHFQEjqrhB9jQfCGJCB/Xtr3eq8zpCLEqQOg+4JvwGBwovKNGHHyjkIxAecBnN7jV
	bPa6Q37awkFJGIzhmdi932AIo9Cryu/33rywhDaCg96BET3t1A+5HtALzKNk4r8ofGrmNsrhu6v
	4MFsYcxQxZD7alWEnZ/Yv0loVeFd4UXVb4pPqRPIorD2k7luLkBU52BNEyHK5TNvZc8BXV4b5Qa
	/MHmE=
X-Received: by 2002:a05:620a:4113:b0:8cd:9828:a7b4 with SMTP id af79cd13be357-8cdb5baac4amr1112216185a.9.1773656966468;
        Mon, 16 Mar 2026 03:29:26 -0700 (PDT)
X-Received: by 2002:a05:620a:4113:b0:8cd:9828:a7b4 with SMTP id af79cd13be357-8cdb5baac4amr1112213485a.9.1773656965884;
        Mon, 16 Mar 2026 03:29:25 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66350d80a90sm4876205a12.32.2026.03.16.03.29.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 03:29:24 -0700 (PDT)
Message-ID: <aaf2c23c-2c6b-45e1-a2a0-096249ea0d44@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 11:29:21 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
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
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>
References: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
 <20260313-v04-add-driver-for-ec-v4-2-ca9d0efd62aa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260313-v04-add-driver-for-ec-v4-2-ca9d0efd62aa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: APTKA_r7MaehKTVowEszhHINY187o_8h
X-Proofpoint-ORIG-GUID: APTKA_r7MaehKTVowEszhHINY187o_8h
X-Authority-Analysis: v=2.4 cv=D9xK6/Rj c=1 sm=1 tr=0 ts=69b7db87 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=sGNizEhdnyv83XcJ-SoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA4MCBTYWx0ZWRfX0h0rAq3gGcZ/
 64uEbewEfH/v71L/E8ITWikM1Fu9CEr/eI8eSpvxpVFT1DVZej7nziiW2XUVF3PEL/zWdLcnSoR
 PTEd73ONk4QaAjmoZvFnwzNZ3fbxvg601PxmVXo1BME/P57+fVlFtAiLUvfjRMHZaG68JnY/4Yx
 gQ0q/oW3/LOe34riR3BnG/eux/6PC59BC8F5A9LFMbJuN19ie/gzlHvcXScPRSeJ/0GuiUo5mfu
 AeAgl7uqxo0mG9eSsKKRusQ+6O7kVh1TMbrMY4qqYStBQShKShDcCkY84rGIUAFaObpe089s6MO
 SilPVq1m4MwKvHWpA8TtIFEuyRM4WVbC7CSzAd/OmeYwnBQ4UdtSqiDcmXc9UW70POv0+BssAGI
 mghp2nLBzr9HOSXMptXrivDx7ECYHJKyTBQjdKBDsGBHG2Djmz4Gfl/NLipXYRdWbcNxGIilk8h
 ULGdwbngx7GdWAwztFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160080

On 3/13/26 11:29 AM, Anvesh Jain P wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
> reference boards. It handles fan control, temperature sensors, access
> to EC state changes and supports reporting suspend entry/exit to the
> EC.
> 
> Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---

[...]

> + * ------------------------------------------------------------------------------
> + * | Offset		| Name		| Description				|
> + * ------------------------------------------------------------------------------
> + * | 0x00		| Byte count	| Number of bytes in response		|
> + * |			|		| (exluding byte count)			|
> + * ------------------------------------------------------------------------------
> + * | 0x02 (LSB)	| EC Thermal	| Bit 0-1: Number of fans		|

qcom_ec_fan_debug_mode_off() documentation only mentions values 1/2
to be correct - is that the case?

> + * | 0x3		| Capabilities	| Bit 2-4: Type of fan			|

What types are there? CPU/AUX or similar?

Konrad
