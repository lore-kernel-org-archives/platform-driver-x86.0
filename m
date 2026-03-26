Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDA31B532F
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Mar 2026 05:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774503058; cv=none; b=q40RpPml2baNFOxr78BvjSF0F7cdVqGgD5GVEhdTliZoXry6/I+KqhUMteaiEl1JZptrZU/nw87sQxwWGdzrVuZH2nlDRBHfkn6x8tVWIrdFRsELcWt+TaQ5V1+qcnCn/NRQkrsqBwPWp5AkngbLcsrqXjxlAQeEhpCDetlQpvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774503058; c=relaxed/simple;
	bh=Dq7SR7mf0Ly7LwIQCtz2LyQdIOgoABM6QUbDgADI9yw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qqe1/tQC6zOvKbPGvsMx7QbvzqLhM6MeRbZuylWRUG/mWDvPwWZZRYfJ42ozGmF0VcNaj7EGkdk9Hi1z/Fsya5yHRe4Qn8mbhJ3zw6HyVqSAHmhpTK4+p1u/D1/0xiCqTQPndwouKIRrzFlj++mZqHNdBFjbQkoYsIDkki/CU2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ih9+RDyB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YXyMbfge; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ih9+RDyB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YXyMbfge"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PLP1hd1060702
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Mar 2026 05:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gMXKWgO455kPcPMgxpEMZpFQL6OheNgUeaCwfhrzN3Y=; b=ih9+RDyBz0zclr9/
	BO4Oktg+F80XpIqcJQz9vmeFNVhig373WCPVNLXmpCkmIhB78HaQJuMx9d3pRG+k
	oQOy2oKgYhCQLNO3fA2aR/QpQXEZdNri/3WG/rVyh0D6lfxAnGm+Rk0pkSIDDWyL
	bVwAX2WSN22PJA4sq0W8CXkx1ltJCeJxfogIATbZH0F26AvuFNRIxFu1EUoVWJiu
	zuTlo0OATSVxDY1zrcdi+fsdffqkJXhotEHkjm4zYqSvXMuCjGIwi5U0QbhU9033
	WnUdhlFjy4vJOBE2jqkNhq8WwUpbE+mPVPsPL+2IQHEw/T9iPJyJhUTXoQ7kbsyZ
	axOj5w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4qkss78u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Mar 2026 05:30:56 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82c8768a704so34595b3a.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 22:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774503055; x=1775107855; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gMXKWgO455kPcPMgxpEMZpFQL6OheNgUeaCwfhrzN3Y=;
        b=YXyMbfge2d9pu2ohCplLneDPZilk7SEBOZXSqGV49BexVNNvUz/HxSezfRzWEPjX+g
         ZFxX8Gr/9YviE0sQaFXa9LI23XMENSJLw7H0cIdsF++IgQ6g7MzCFUN9EB4G6pf1M1AI
         TW2aSL32vbphhvUIhCV4aQPxnzR8OYPq87wQdaNeS3LAqUmB2VLl01EF2/1Ay8ttIhbW
         GwVWpNS37018/P3l3jD7QdcVmggr0m8UqehxNWNwxsVoiAS0gt9Qlr+0eUOPenDNHjjH
         tcrlBZcFpFE/Ld1arNQsh4s7X3WSItljJY01aXQGmW958uiwxATjPF2xh1CX1geQGVxm
         IGEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774503055; x=1775107855;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMXKWgO455kPcPMgxpEMZpFQL6OheNgUeaCwfhrzN3Y=;
        b=aY78uAaCRyc36rNybuGN/+UqBqBsvP2MeiW3aR1JwBQT61pZ3nY2vNhhZ7daGK8Ve8
         jirbXrIhQDLF+8dul6w6rzOZykCnFvdC3lqB4IMpLEZFay+iIpAivO57ZPd6uy3NImA/
         4Jfred4RZMf+4DaNPh4zD11xZmsXLBEmbVmzfiO9E099zQ/zRbaurYvSLvg2lEBzQzE0
         gzjRfbwlxYSTE1qUr0j7htDH1x3wooLla7uHSI35acaeVH6tyvtrk8e6qYTrb5dm5igV
         7k1KK7bLIkpDEsrFQWnuFjGecW8gdKm5eOoY10IczB5EIky3eNr2grxTWNcWyG/6z4YH
         WF1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXWD08g79YTrme44vNoP3jpmW1Kdh9xLB26R+znxunlWqnH+HsZH4W6bM2FHqhzdFd7wWEeTrp5inIWQwYlMc3aoN8+@vger.kernel.org
X-Gm-Message-State: AOJu0YxMo8IgIE7q8yMaV6WN/uHo+Mrtu/AIjlxrf8ZkbKTHvZE4Wbho
	Vo2skzrfHyWaNuoNoU4uVE33FeVQtX7IpmgO9jV+nyQskAcEcDWX7XJQWY4TO9CLnq23KxE1kEH
	saF+8Smdusn/CeRY010HQfD9wTT/C5wlZq2QFL+0FGUxIlAtKuqhTTzwASzKnPbW02isHIGm1iC
	SV
X-Gm-Gg: ATEYQzz+N8eU7mwdoDtu0ENOFLiKlniGQ2iJWSDVHn/NyEXsz5CNAWm26ofKKhWvSGr
	PzvI2dKD6O4Z2NYcMx4+d4f9rrjshPYdcaLqYXulMTNFxpj6foaRL6MPebO8eh3Sw4f83xnCAmS
	/FrtdF7fXT6DvUinZRbFccaPAs930ExmlqaI+CJuxe2EAlDHRFERX5rniz9cK7uEiwUX1KF07Td
	GO3weo9bZfuLHuAzjImlmqQTMSrLIpUgNi9QL7lbzYjulYkEDDHPU8eh14rLB2gNbQv0NrH/sFj
	5MW3era2FG10XOQYhBadEpp1HnT9wnKe3QLhQ4jPmooeGomXSv27fKio7JSmaAxqNpALN/x+BTT
	Qjlgw+ujrc6GE9lIIV0mVT5NbV/27VW8PlFQXHvnhfZxf2lbwieFj5gQa5IeGsnaqjynwtlkIGq
	H/NSvWqvnd7ybGE/0jrqMRaJ9BDJj0L4Q38g==
X-Received: by 2002:a05:6a00:1c81:b0:81f:5238:5560 with SMTP id d2e1a72fcca58-82c6ded3a6bmr6338202b3a.13.1774503055584;
        Wed, 25 Mar 2026 22:30:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c81:b0:81f:5238:5560 with SMTP id d2e1a72fcca58-82c6ded3a6bmr6338176b3a.13.1774503055118;
        Wed, 25 Mar 2026 22:30:55 -0700 (PDT)
Received: from [10.79.196.200] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d3bf324sm1637749b3a.40.2026.03.25.22.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 22:30:54 -0700 (PDT)
Message-ID: <35a6600d-c2bc-46af-bf18-07f13038ee8e@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 11:00:48 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: hamoa-iot-evk: Add Embedded
 controller node
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260325-add-driver-for-ec-v6-0-a8e888d09f0f@oss.qualcomm.com>
 <20260325-add-driver-for-ec-v6-5-a8e888d09f0f@oss.qualcomm.com>
 <95d9636a-63cd-4691-8d72-c1bb59c605f6@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <95d9636a-63cd-4691-8d72-c1bb59c605f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA0MCBTYWx0ZWRfX3qlvH0CHA0Ws
 nZzmcQEvBKLAZR8p8OXZUWCfvpy/EGTbecDOjzd8MwNRdiTP16MoQZfNDMYptIa/pSCkKA1P1FB
 J7NBUPmoUMsdxQX7qyvHLeiwXfJ1u7vD+gMAQ39Racgc5luXo3GJwDEVh4EIMP5VMur44yewOco
 NNV3apE7ZD9y62jt/a5P6QLn4y5lWgkHqObxNC7RbGhUnFiCD+vpIgf4I9zXCAjH94z9+oe4Ph4
 PHIOuPfXpwA0HCVjFB5FN7/dVkyG4dPMPcQ5XwzjggsVrnc+JItmegWcnN/ucW1+oPm0i86APwq
 mNd1hFWklhVJ5+1OSzYIWdI7esHEkHkaaa9D/qnxARjc4BlJPN0Oqu8gz1KGQ09sXCOf25A0Koc
 zGa07CXfvf2rgnybHpoDQZxXp1rax7N2QdfDsUGcSedvkqWCTv1kAQlwJBOkZ1McNnL6rZTi0OM
 3adzzyBS1hE+QcC1hvw==
X-Proofpoint-ORIG-GUID: iJdqBS-DsDoyNNU_98Q_pdZlorER0l7I
X-Authority-Analysis: v=2.4 cv=eOMeTXp1 c=1 sm=1 tr=0 ts=69c4c490 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=HFQO31-wg_kNNkEnh5UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: iJdqBS-DsDoyNNU_98Q_pdZlorER0l7I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260040



On 3/25/2026 5:50 PM, Gaurav Kohli wrote:
> 
> 
> On 3/25/2026 5:09 PM, Anvesh Jain P wrote:
>> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>
>> Add embedded controller node for Hamoa IOT EVK boards which adds fan
>> control, temperature sensors, access to EC internal state changes and
>> suspend entry/exit notifications to the EC.
>>
>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/
>> boot/dts/qcom/hamoa-iot-evk.dts
>> index 460f27dcd6f6..a0d2ccf931ec 100644
>> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>> @@ -831,6 +831,16 @@ eusb6_repeater: redriver@4f {
>>           pinctrl-0 = <&eusb6_reset_n>;
>>           pinctrl-names = "default";
>>       };
>> +
>> +    embedded-controller@76 {
>> +        compatible = "qcom,hamoa-iot-evk-ec", "qcom,hamoa-crd-ec";
>> +        reg = <0x76>;
>> +
>> +        interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
>> +
>> +        pinctrl-0 = <&ec_int_n_default>;
>> +        pinctrl-names = "default";
>> +    };
>>   };
>>   
> For Hamoa iot evk board, i have also tried and cooling nodes are
> reflecting fine.
> Please feel free to add:
> Reviewed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Tested-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>

Thanks for testing. Will add the tags in next re-spin.

-- 
Best Regards,
Anvesh

