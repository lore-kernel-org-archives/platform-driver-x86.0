Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA59A30C62E
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 12:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774441264; cv=none; b=H+Ezc6/2B3kGBZl7mV7WCcotWgcE/J3sX4C48LwL9xitWFrXY5IU1xVu6jcO0pSgFNI0OjHFOYcFxdIYYY8F7MQCk2ntlllhPVWQQHx7yo2PnoA6RH+z/VWXHsXFPsYv62gzlXHZsPxjX9QcX+6KT9kXGwZI8qO5VmO5d2jmzLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774441264; c=relaxed/simple;
	bh=CASlOad9Jz3rR8JWN7C8Lo7+MS2Ekj1KXi5ZFFnLDNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZOVdP7HE+hfF3QbIaGxnPBGf05QR5VVDGRzxgJ09B6SZXRhoU38oHgH2XsQqkIKJ70PyGFp0NdtnG8ztqGNNEqsvXtzHFY2Ynz5tGFGhBsJb3kJFnLy9Tcirw8f1HIlb5Hbeyt73/5uQawMZo0cXyWOkik4MOob5i1LRo00ory0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V7GGU5ZR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XRdJBg85; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V7GGU5ZR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XRdJBg85"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGBUX721274
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 12:21:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ij4ktEkghVXMujOAQpvP2x/I1y36LCkTpjVnnIT2MWs=; b=V7GGU5ZRS3OyYkDd
	Wy1M3r6SIDNq1O4jYrFdCwfNdDQCG+n0/6DEkZ/FjGIGKeRVZziiZn64/z9F8zAP
	WBC2RiIuPTICWoVbKk7ewZBbu4+TmAI61tiQeWxb7y4KThD4a1/SeOFskXJpZwlt
	TXIfSlI4Qf1hFM2mIGNM37umA/BhdZxjEug8rrYl/G2omLbbaMPlIhr1GKS715fC
	2rKCztLmYLZtMuBG8XAwkwp7B28iZXppapNjOd3YMS9r1oiodphIBo+6S7O7dZEF
	00r+2CbNk3YKxK+1Rx4RNQa9QSus4P0bk7uxfsivZDcPsxeeRv1P2DkrXG5heD7G
	8WlA4w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dm2rfbk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 12:21:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2adef9d486bso65765665ad.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 05:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774441262; x=1775046062; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ij4ktEkghVXMujOAQpvP2x/I1y36LCkTpjVnnIT2MWs=;
        b=XRdJBg85mkKR2f58VaAQhqKkm5QioOvsxLq1rPGijiPFAO9RC8uB7Nf+y/ynH6ge3i
         2+G/xI43/DkZSXbZ5GbzesweHU0YNtKVWtDeiOIfbsrGJFPOSbqFBFPoBczYxVD0uMer
         s+OnUofQz4vNZHiJcCFzcccoL86xnM/vy5iUiPtsdaJG7ag5LIX4pv3Q+D3swEVy5GWf
         gEpOLexJClg7Qj2na2faL9dZtmTQEYm+gbl8TnZjbtTBMgMYri0BpfEuQixyeANW4lad
         MtisJ20WGhDS9h2D4bySR4zsTiJvD+k22MwLZfwUnipZPGH36wY3lSWyJCGoPFrxnFpE
         0wPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441262; x=1775046062;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ij4ktEkghVXMujOAQpvP2x/I1y36LCkTpjVnnIT2MWs=;
        b=KK/GJp20bA9htzgN5qVCxkAIpBWb2v//owp7XtbXKMconVALuLFTYx60WIHBhunTc3
         bITKq+2NwV3rcyoOycjAAowXr6MCMfXx//7A3BaqZ7NSJKaw+z8rO1V5Vu7wvn7nVFFt
         pMl31GBAhAnWr6O4DIjWsNY3Wn/HEWobR2V72laOPJgNo9/+pz+kXzEks9G3FlXACt99
         wJI0MmMouRCTfYrc9h8tB3mo5cBTwxGXNQRXCSDKdZq3JQc5CUqM4El0jPwuRMzKx7D2
         bxQXLhoiN10utrLzIgt6dtW3Em24eXRt+8G39sw0h1zAco6N3gUkZkBNYYD3K5X6+bwL
         U/Tw==
X-Forwarded-Encrypted: i=1; AJvYcCXlzkd2PmpugFBdvkpZbjV7Ow9yA2C0TuhGoIetelcgU9HSAB1g+byQXonqHXv9UVcRn9I6V1JHudg9Jzg2KpaZijQ6@vger.kernel.org
X-Gm-Message-State: AOJu0YzU3SE8bNXlsBWKCty/oAKBsBR0vA87Iwwa5VWh8TWAh8xcFSa1
	4oIb/IDILW1O8Y+9LkddkeV8JNRXVZ6qN1zmAWoTPJ0N4ffxVlEf3LBmGK4YuMNHI8USFBhAE+L
	chfVHjLcfcCtDZ0qjohTr37cRA9xtWU+s09htSxzOYOY2UzrOVAntq/NLWpdY5W07mxkSHfqXp1
	YY
X-Gm-Gg: ATEYQzxK/OxM1fVYyaILamxGaK39xkDZ087DCifSkVMAa7A8swOEDdzNZpB86kuYpvn
	fu4OFTFCdu/HQiv8fDCVNgOeNKPgLQoDP6W/cTZsTCuaZSh9u6AGlKLSTEyhd4CxtlTf3CDDGjS
	GcVQDY9H+khZSLqkOfErHrpDhghXqotHzt9Y8f7q0lmXAAGNDmwG0Guy21KzMX9C7b7DDGO5GaL
	kpdiapK3O1RHUKKM44Q2w932Avec7KTZulk5SnfpMCPhmaYm2b87ZFwYO2Qpulo5y9t4cn1nlH9
	mE6k6g0Q+umBoJ9VSkqfYUOd0eTss9FIqDz1mbf4mnfJD32zqoVxAnpvlxzhhtvJCU50sIVm6Nv
	cz8pAGFHiYsx6NGQL0jzYi2y7AW4nNHfkx8mviMsskRCxRY348K6k
X-Received: by 2002:a17:902:da91:b0:2b0:6e4a:1c1c with SMTP id d9443c01a7336-2b0b0a1554dmr38685835ad.19.1774441261484;
        Wed, 25 Mar 2026 05:21:01 -0700 (PDT)
X-Received: by 2002:a17:902:da91:b0:2b0:6e4a:1c1c with SMTP id d9443c01a7336-2b0b0a1554dmr38685575ad.19.1774441260987;
        Wed, 25 Mar 2026 05:21:00 -0700 (PDT)
Received: from [192.168.1.19] ([106.222.229.24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0835161a0sm221170325ad.10.2026.03.25.05.20.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 05:21:00 -0700 (PDT)
Message-ID: <95d9636a-63cd-4691-8d72-c1bb59c605f6@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 17:50:54 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: hamoa-iot-evk: Add Embedded
 controller node
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260325-add-driver-for-ec-v6-0-a8e888d09f0f@oss.qualcomm.com>
 <20260325-add-driver-for-ec-v6-5-a8e888d09f0f@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <20260325-add-driver-for-ec-v6-5-a8e888d09f0f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4OCBTYWx0ZWRfX8HESnfHBriIj
 UGOqVWpNANnj2dtnjWEXFt4kxMQnJ7/yHY5Ib3Y8C4BEBSFJKZ2eY18P3fIzeE5cUg6aKS1OMit
 +Fog2/4WmKqxrp/XZEtFQSAZYpqIHAlYABEx6hgTLatXn55nWXVPX5FAAbdmvv6H+5uhpk5z858
 0wHvbCIIgozv38WnPn/T8R9jFEXus4lUf4tT5Q1YflG03G2WzvMKMINF6J7wcbUYzNoUFEqpfGP
 fg0IXsNYCI6gMBrTNs65p/f+fWhfvewi2RydQXZKbKj8b0lS2Dw2gVlv0ovgOIIm7Vc3Q+fqkaF
 wMNrhzP3Z5gIxZv0LmdetenjmjEFUAFoLLNBro6b4bFiBeN0jDEydhNqEpn5EE2iuGoRYew0lZ7
 RfXCKQrro3/z8e9f2EpFqNoGSPo7ncCp/WAz3oo1/lJjmSmVSMi9+glI3wnV+2KxqVIf7IKK17v
 fpKfHnKz8FaKbTT2/QQ==
X-Proofpoint-GUID: kjFHphNnrSxr6-vFFpTY3nEadK2ewY10
X-Authority-Analysis: v=2.4 cv=Fo0IPmrq c=1 sm=1 tr=0 ts=69c3d32e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=EBd7WcfsMYPMwvoCMWz0vA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=v9AdQsT0JroIR-EB4BMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: kjFHphNnrSxr6-vFFpTY3nEadK2ewY10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1011 spamscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250088



On 3/25/2026 5:09 PM, Anvesh Jain P wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Add embedded controller node for Hamoa IOT EVK boards which adds fan
> control, temperature sensors, access to EC internal state changes and
> suspend entry/exit notifications to the EC.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> index 460f27dcd6f6..a0d2ccf931ec 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> @@ -831,6 +831,16 @@ eusb6_repeater: redriver@4f {
>   		pinctrl-0 = <&eusb6_reset_n>;
>   		pinctrl-names = "default";
>   	};
> +
> +	embedded-controller@76 {
> +		compatible = "qcom,hamoa-iot-evk-ec", "qcom,hamoa-crd-ec";
> +		reg = <0x76>;
> +
> +		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
> +
> +		pinctrl-0 = <&ec_int_n_default>;
> +		pinctrl-names = "default";
> +	};
>   };
>   
For Hamoa iot evk board, i have also tried and cooling nodes are 
reflecting fine.
Please feel free to add:
Reviewed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Tested-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

