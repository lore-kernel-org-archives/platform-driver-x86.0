Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4023248AE35
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Aug 2026 16:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787157717; cv=none; b=Hh/pJyTviMD4aAcFDrStJ8OXbGISjhmjcqo5hhY66pJpoMW/FADBEZfgMBmSDMRvM6IpvrfBakqE4QoHxSi0JWfmNHbDkARxVd4upXHAaQf430b3xPrTFRnLS1NKxRsjSwXmajhp7NORhXM1Hq937dBFC0uKulT/TOq5SkuP0eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787157717; c=relaxed/simple;
	bh=HP7cwLLH8dW1t2oc1FU0NkBsNtWJfCQQ6Q9W9x3ZuTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CoimE7tNbeEn7h5DjSShejRkPY/6k6ue8pt7MeeXgtuGmYlmLpbzrL3+qXXeVgWI/p91LzgcJjm3kqvmCxABKx/bv5zLPbFlK9YLb4biSf8DSxfdlIurDK2GfSIT8YM6kzREwM2bpSk1r4WrOczNdAJVy0DtuH/gxBpcTd0k7+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lpWoeYVn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V4dGOo3H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lpWoeYVn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V4dGOo3H"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF1B3O3869656
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Aug 2026 16:41:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H8r6EYyPEhzz3zHgDtbwiTb8LdJaEzXX4pw4FkanEG4=; b=lpWoeYVn6V6Yaws3
	xVINMntCwiN2mufWU3rLvai6ixE20n6QtNm4+CuLL4wh7L+oSIzD2dN7E+IwtpKs
	sbz4+k1hxwTbRDnVWrfGXhBmlzZf7ggNYuPJsKwTb2O8TbCwqU0WDNLYI22yDN4W
	ky9uePOFhFr3M71TyyPGOXyTMpzY5hAvg8XbE0P5YF+uo8SlnXlaWMnkfaIm1JNG
	dPo4ar+ybqpb3W815U9CIAR7bYCBb5pMFKQL9ZKKlBbs0KXfx7duY+GFxq7FI96z
	A9CZo1TbaZDYMOmhSo+eRhLQR9mi0zIgxwSB2WF88nJkP+b9w5mL5G8j7xh3q/RH
	wrEaWw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5ervgjmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Aug 2026 16:41:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52b4e315000so4004671cf.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 Aug 2026 09:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787157713; x=1787762513; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H8r6EYyPEhzz3zHgDtbwiTb8LdJaEzXX4pw4FkanEG4=;
        b=V4dGOo3HY+YpQfI0AUWIfzXLJuHXJAnpvcIm1PbQ9bRADJ3s11rSE55BijackvbXFC
         MUwGzXqaBvxXf1o3fYo65QaltKdS+5XgOsmlxaocbC0fp1aDfbTQFt2CnobKGFv6Rw3k
         nBtT655qGhgS6H5TbC0Rk7SH33grwxtg9HLS6MPHbhuIeUo3nHQODSANdzhVRZBJWkOU
         tYYsik/YNUFqTpXpSfDDTOeXpPZBaivJNCMqUpEAXtKIQ3lFQA/ZOEjV6KRVOu9599qx
         BqTv8R1zpTukRd6TwAJ+vSyw1a6lgPDfjFNXjgxGcelgPrFU4Nh6i5cIuql0b5C1dXJ4
         8G7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787157713; x=1787762513;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H8r6EYyPEhzz3zHgDtbwiTb8LdJaEzXX4pw4FkanEG4=;
        b=XsvTr+sLqSKsEbMpZ/mTQ8+dTFLVUoc1zgcOCjZmqiAuHmmN/v+Bs8w1tzovD2fhy2
         bWeGIIl/Ybl8d8xiaMcfeAV2cBmDB5RTyVL0Bx5z/DZOoUW9AJMbEs5NX/wmjN5pfjEL
         RQ6WV6Uz63ANIIm3ghcK58WwiG0DZzyFp5raVfRAcbdb5+yPJqKuPP1e/PcEE1SNZ6wZ
         i4/XZy7vUy0YLexHTS1tbdaQA8+avlg33O1guvjOuXVtENlfQYVq93fuyYI1ZMeCEXCU
         qWS7IiAY8uY1rhV5Aokftd1hDzBe/Sgp4BOe0a4EJpWyWjJUnSotakBxQF6smKzcWJx3
         me4w==
X-Forwarded-Encrypted: i=1; AHgh+Rr3AaF117g8R27x+FmpkD8EaxwAcct1rVnpefUUte/jSaShu6FO6uCmcBxSU2fgglCbou8FZKUxiP1aeh545JSvEqN8@vger.kernel.org
X-Gm-Message-State: AOJu0YwL9khEg4wNgP05jS5eQh/U49nyS5eDlyTGMJLwVx9nxWk62mqf
	EnK4lbMYHHggDE9L+HEIp1bTttzVmw4mfAkHkhrBeH5pWqWRKhB0CGkmktfR3/bE4llT29s2PJr
	GjBHnxuM/U5TbHxIpffRxsKUlOdg4aKWTqpgPSYpzkAtBF0v7LTImzdF618PjUy5HadX+VLV7r+
	qM
X-Gm-Gg: AR+sD13SKwUBrytZi/myDuXYjRMXKxYO7dXRYeKRFew1q9NqjJC/+M4nlD4CkflAfnT
	lCinT+BAbDlfme0AZXnQlpqknqHa1Clahg3TPybyZ0x8cAO0hbuubaZkAe1DmUDPCMRzoMCXr31
	wBt4u4fZNx219zUtEjwKNpIN1OiTm0V8XELe4ewrJYLMPr+LQZHPWZgcrZu2vB4UI4XJJK4EMXD
	0/l3FvYTnQKtALtGCLSOpANzC3B/z5q0BrY6L/2D91/iXx9Lqmg4OOeS8l7vKTpPu2adVq2Qrnw
	fNzfBqOqwg+2MdY8XdSe1kM08qGPdCo3/H2zTlJKY4YgEZIUSmS2WbNsyqsdYjsRHWIG9ORgTzD
	lb/T2tHjsPrRoeyT2P6c1lbt8
X-Received: by 2002:a05:622a:593:b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-52dd606a2e5mr42413791cf.4.1787157713035;
        Wed, 19 Aug 2026 09:41:53 -0700 (PDT)
X-Received: by 2002:a05:622a:593:b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-52dd606a2e5mr42413251cf.4.1787157712489;
        Wed, 19 Aug 2026 09:41:52 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c7a8204sm105374566b.19.2026.08.19.09.41.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 09:41:51 -0700 (PDT)
Message-ID: <ed3dc2dc-69dd-4b48-a5c6-47ca72cfee05@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:41:49 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] platform: arm64: qcom-hamoa-ec: Add fan RPM query and
 LUT calibration
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
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-4-771abd65ee1a@oss.qualcomm.com>
 <eb8731e2-6cc5-49d1-a746-3c81563094f0@oss.qualcomm.com>
 <96411e0c-f357-40d5-81f8-14523836280e@oss.qualcomm.com>
 <3fa15948-eb8b-4f3e-af90-5b88fcc44d75@oss.qualcomm.com>
 <46f53628-ea22-42e5-8de5-a2a76b6360a8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <46f53628-ea22-42e5-8de5-a2a76b6360a8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: M7TU9AbXK5fxj3-B9dcmHleZx7KtfgTp
X-Authority-Analysis: v=2.4 cv=VZ3H+lp9 c=1 sm=1 tr=0 ts=6a85dcd2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=GwNM78hDF0K4Zjgp8RMA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfX7ju0mnOcyOK+
 +Fzm54vis7NpogfENZI5Fj4q1UeQp+gr7BKkjQxGJzFEuMcYU7Q2oo0GN1ZEmu48fvmabd8b1Sy
 8YXfzlB3/ejTvbnExYbdTHaygyN3AYQWZjRbfKhkK5IgLdHfB9dGi3+12CZaHp/dtWYisfGygGy
 v6SMUDUtPq99oMdyB1wgTTWEeZI7G3X6iYhnlLfQuL5VtRgzHIDzdLwpkj/jhVcc9zIhb6+p/b9
 h6u+0Ma2pwgO6+wpg22GBOBm8hyS1QBGrzZKgNcSg7vfgkabGeRkl4pPdae9yl7wQBJTuqlNVPs
 kpoN8K7dN4TF9cSNyJG7QCqIYMv9xYfpJSG32YqGF7U9JaW6aE5nW2bjnio+z7hrtCsWou4aXgL
 VdI/pCKwbbE15QbpJOAKIM7WTnWlik2PWsd9TFpEcQF9wYh3V2k35kBUk1xSI43HzFBb9w+Okxs
 YqqEqmMl+zRDJ7pHdQQ==
X-Proofpoint-ORIG-GUID: M7TU9AbXK5fxj3-B9dcmHleZx7KtfgTp
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfX/RA00SyqMgoN
 Ls4uoQSqjZaKBZndf7OUB8P+T67AZ7KVTe6CyBT3fjJk0ik9byUVsWNH0mJ6gFMZ5s8Z3+W3t+G
 LwYSCnuotcLjvdfwlwd72Wz19jdE+TU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190130

On 7/31/26 8:25 AM, Anvesh Jain P wrote:
> 
> 
> On 7/30/2026 10:38 PM, Konrad Dybcio wrote:
>> On 7/30/26 8:35 AM, Anvesh Jain P wrote:
>>>
>>>
>>> On 7/29/2026 4:37 PM, Konrad Dybcio wrote:
>>>> On 7/28/26 7:44 PM, Anvesh Jain P wrote:
>>>>> Add the EC command definitions and handler functions for querying fan
>>>>> RPM and programming per-fan LUTs (lookup tables mapping SoC
>>>>> temperature to target RPM), and introduce a raw i2c_transfer()-based
>>>>> transport for the two commands, since their variable-length,
>>>>> sub-command-addressed payloads don't fit the smbus block-data model
>>>>> used by the existing commands.
>>>>>
>>>>> Fan LUT geometry and temperature breakpoints vary by board, so encode
>>>>> them in per-compatible qcom_ec_lut_config data selected via
>>>>> device_get_match_data(). Add configs for the Hamoa CRD, Hamoa/Purwa
>>>>> IOT EVK, and Glymur CRD ECs; IOT EVK boards share the Hamoa LUT
>>>>> geometry but are bring-up platforms without a calibrated fan curve,
>>>>> so skip_lut_set suppresses the LUT-set command on those boards.

[...]

> 2a. The EC's LUT storage isn't persistent across reboots, so we'd need
> to cache max_rpm on the driver side instead to skip recalibration.
> Initial probe after a fresh boot would still need one calibration pass
> either way.

Are you saying that without this patch, we could be in a situation where
the fan simply wouldn't spin because the LUT would be null on the EC
side? Would UEFI not do it for us?

> 2b. cur_state already reports RPM-derived state via the cooling-device
> ABI. Is it worth also adding PWM hwmon on top of that?

We have to deduce the RPM number, whereas IIUC we can query the PWM
state (if not, then there's no point)

Konrad
