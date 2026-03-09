Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263CA2EBBA4
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Mar 2026 10:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773053519; cv=none; b=Uo8QuYHsb16lyzuk+Oa3YLV4kuVfkZcld1Fp2N+K9tXDHMbpUgOhavpDmvQKsbMJej0GwIQkbYUCcaKdValXTq7QMnZDHThcVx5RI+p5tsejvHl/pwt2Db2SvTK33BJeFyocrujqpH3CacaLzZ2e6IeFWXKAcoqLebljr73r2tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773053519; c=relaxed/simple;
	bh=Uyatg7jYdLH+dz9BKcMrBo73IYn9xt/IAQZ4UWxi8ag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uc3oRWoFzxvA8tXnZOTsWei2PyQqu1xTH4n5rCVlHGXnxTuIHq6fxDWbfP8AVOmxu52rg7FBpr2FuxEgerrK2Z9BdJ4EDPrsi/PBjexedJDJHctnjBRq7QV8QlxzEowA3b3TEweExaotPAMPFnXCESg91lEeEHUhbyfUgZakscA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O7fq2pYT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eUFudLs0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O7fq2pYT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eUFudLs0"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6297mTkI2798716
	for <platform-driver-x86@vger.kernel.org>; Mon, 9 Mar 2026 10:51:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4mKFMEgxGg2tAs5QNXTAVvhLuUyFSnfWBYIFIYGINQ4=; b=O7fq2pYTp0/nngie
	bm+8nlA2wDVptpio5ybsAK4s4AahMyxrgqRHo0xaz1oT4IpDQtqKQpi4OdjI+1BF
	jrciEFefEPXxvvhNGHIk7vEbjL7QAc/p9J8tPtU95bEJidOlLtOglfI+eKz1ZphY
	ASTUkYKqbQeaVxN3soiie2TUi2UuQ5IFMAZ+2A7M9HJscJpArx0Fmr6UUiiADpoH
	wB1r3HMpipMvjEpjLbWdAZY4RjzTSb6DmrqSR9FbHLKA6X5A7xLBSlKlGGuKTmGQ
	egbZOcNtZSPuvu0p0Y5kOJHArMYOUki3R4LNCpzi898PJ9OPxuO11U9pXRMjfxSc
	9esuxg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9qewdd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 09 Mar 2026 10:51:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3597f559e70so5863973a91.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Mar 2026 03:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773053517; x=1773658317; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4mKFMEgxGg2tAs5QNXTAVvhLuUyFSnfWBYIFIYGINQ4=;
        b=eUFudLs0Ut/ynoq5JFbkTHmxsnZG9j4IYmM+g/vlRIRb+8OxQc1OMh0gSnWV6c1NiK
         JLXMWylTREShQwJBiENWSq+Aq+7vcxmHgbOhbKubEH+9+xn6acWqWmpOiLSnLJ5fPnUu
         ryDvJKQ0iuQQJZrI3/mNb0fPLMhCJVpQgPMnIYnjUAqSqo4SXVj96+k4tA24IE1jBLhV
         eNHJYVECeDE1yLvwJWtNTJkdkjRnhSd0F2PN7l5kwBGGzmK7mwk6cW5E94jWd6s6lrIM
         VqAywDLisZhN3H2V29hZ+pnh6wKjycNY8cWiA6jb2Fh/sjI8KEben3vlrdBsNacbp4tU
         WsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773053517; x=1773658317;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4mKFMEgxGg2tAs5QNXTAVvhLuUyFSnfWBYIFIYGINQ4=;
        b=nEB/USmMGuy7xZUZOvamenrWiq1Pf6nUxtZRhaBi9Yb5Ej7rOztSVLD5yWKyhiAlq0
         wlTkegJ36jjVJ1au3SdZTBGHCmpIJO4zDcLx2D7GbkWOshZmtQHknv0J3BpyQTi9FlBC
         K2F/v5p5RHtuErIERCeuKrwLd81OdrmHSHXW+yTZGjxULUeQ7LQmrx/yynW9eXmEovbm
         7GQMheIodFKtUh57F40riCUN1GJs+pJxhF89tuGEwjxRr8ZygtpJfxcF/4q1i1tUWq/f
         Ptsio1+q/zjjgAJSStO7w94p8XGVsdXCeWRk7HqRt888RyzBc0k3kB91Jgx5sNMeYFp8
         YNRA==
X-Forwarded-Encrypted: i=1; AJvYcCWax+oZ5wgHH/jSW2bqLYksyIxxnQhlh8RNrYBlgkjqEKCy5cQ3dGXtlMCPeuExtst88PkNNtBOWU6VoHoAl8btkxg4@vger.kernel.org
X-Gm-Message-State: AOJu0YymiA48fscIblXv3N0s05a+8IQKN9jjBjoLIduy1Azk+8rPmuMi
	D6+OiKO9Z8e5N9aGhE/rEwdy1X7bxqMOpWtL1fc75n667UtyADId1t4VtuHlV1hTsvpunllXkru
	2xskzoDLLkJmkO9xD5C43MmgS78L1kuU888bHdZE2M3Lqg2PXI5pMTU9cQQnX+xzqRwENBiqbCl
	aF
X-Gm-Gg: ATEYQzziolgr/dcMMWkqwCS/+i6cyINw6WrHk4TtyX70e+3M0+hEiDzWfqPd/kCvLjp
	sUm9S/Ze0E2PlMFnfc7usQe7YoAWLFpQ3F7duuoJ1OzyhLGIe3ZQJpIONYkSryBzoUpvGczz13w
	d+EH6pOPQ2L8bcEbJcXh0N6nB9LKwEQuB8AwLejymX6IIFJ9Xp1Ff+0pewptedsiYAqEVVSnxEu
	3STlfO+TNF58NoTCdKc5OYzv7FTgsWULpxMxXgEa3JAxyDTcLWj+iHm2xp4E+dpLlkEYpHLt0xi
	kAXztha3SQBhgssJndkHa2mr5SVxGjunfXOUH+/69qwdlncE6kZq4nnSVROITKQrgvrs7jQI5so
	Ve3iZ3z1LZn5+pizIArvhNlrtxpqvTHk/gw2wimfirO4yg/eLlN6Urx2Jjg76fU1aiqv6uWO3LK
	D0/kwDyunTDTRliP76kic4CPab4314nDNbIxHKkqE=
X-Received: by 2002:a05:6a20:548d:b0:398:7a05:f0b7 with SMTP id adf61e73a8af0-3987a05f0d0mr5545672637.58.1773053516723;
        Mon, 09 Mar 2026 03:51:56 -0700 (PDT)
X-Received: by 2002:a05:6a20:548d:b0:398:7a05:f0b7 with SMTP id adf61e73a8af0-3987a05f0d0mr5545652637.58.1773053516239;
        Mon, 09 Mar 2026 03:51:56 -0700 (PDT)
Received: from [10.190.200.237] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e0acde5sm8494350a12.7.2026.03.09.03.51.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 03:51:55 -0700 (PDT)
Message-ID: <ad3485df-5570-4631-9d6e-2f0b90a47235@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 16:21:50 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/5] arm64: dts: qcom: x1-crd: Add Embedded controller
 node
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, bryan.odonoghue@linaro.org,
        ilpo.jarvinen@linux.intel.com, hansg@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com>
 <20260308233646.2318676-5-sibi.sankar@oss.qualcomm.com>
 <20260309-festive-prudent-ibex-f8b601@quoll>
 <ff241b01-c7f4-433b-a822-c5cd14e3e696@oss.qualcomm.com>
 <3eaceb96-003b-47d2-9ae5-bb676dde0240@kernel.org>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <3eaceb96-003b-47d2-9ae5-bb676dde0240@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RlEjFL-wLPXSTtC5QDfBcA0Nfr4XgWJP
X-Proofpoint-GUID: RlEjFL-wLPXSTtC5QDfBcA0Nfr4XgWJP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA5OSBTYWx0ZWRfXyBokQ2OuMycb
 bogpk8MLMyT3zY1yf9sho7oXmIdHiTCXZA58FwZfqW0158doXgQ4AEV9cGXqpeQwF5UiCacNu75
 R2VbwvmETv4qxvq7rzsRPlFryKj/cZHAFANAN/aLDtR6x4Vd5cZ2DVITCFSUts7SDcC5yFMBEUA
 jW4UwXAxy9TzqoGPqCA4EnryspCKL+YQnjoCOvpADo6QNj2GNXChj87rTsAXs+M2O76dqr4CauH
 CbSSKOShoIuKduGd+vsn858YuOStZOzbl7eadWsX7F6qYj7Q3ZIwu3W3sDH6RZAlEIL580M9h4g
 8172D4eSzQeyaBmGtyaGwklWMtI8MDK2cXOzzvT51n1T1UcDe2fLyBLaNqKS+FV2Vb74UTXH+NJ
 p83InnMMsrSCJvC1YOmEQGoNkJ6mRILCICtrC6Hd79QU+wJ7hp3YOun8MBcxaevCPu/k1IQgfNT
 PxzLbxPRMOJv/eC64fQ==
X-Authority-Analysis: v=2.4 cv=dcqNHHXe c=1 sm=1 tr=0 ts=69aea64d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=J0bc_HPAM6LSsZCXcSwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090099


On 3/9/2026 2:39 PM, Krzysztof Kozlowski wrote:
> On 09/03/2026 10:03, Sibi Sankar wrote:
>> On 3/9/2026 12:55 PM, Krzysztof Kozlowski wrote:
>>> On Mon, Mar 09, 2026 at 05:06:45AM +0530, Sibi Sankar wrote:
>>>> Add embedded controller node for Hamoa/Purwa CRDs which adds fan control,
>>>> temperature sensors, access to EC internal state changes and suspend
>>>> entry/exit notifications to the EC.
>>>>
>>>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/x1-crd.dtsi | 16 ++++++++++++++++
>>>>    1 file changed, 16 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
>>>> index ded96fb43489..29a1aeb98353 100644
>>>> --- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
>>>> @@ -1042,6 +1042,16 @@ eusb6_repeater: redriver@4f {
>>>>    
>>>>    		#phy-cells = <0>;
>>>>    	};
>>>> +
>>>> +	embedded-controller@76 {
>>>> +		compatible = "qcom,hamoa-it8987-ec", "qcom,hamoa-ec";
>>> I don't see updates to other x1e boards, thus my arguments from v2 stay
>>> valid. It's wrong to call it "hamoa-ec" since only one Hamoa board has
>>> it. All of other Hamoa boards apparently do not have it.
>>
>> Hey Krzysztof,
>> Thanks for taking time to review the series :)
>>
>> What other Hamoa boards are you referring to? The series
>> mentions that the driver and bindings is meant for Qualcomm
>> Hamoa/Purwa/Glymur "reference" devices, so it only covers
>> CRD and IOT-EVK. It definitely does not cover all Hamoa boards
>> boards like you are assuming.
> hamoa-ec compatible implies that and that's something I raised in v2
> already. You need a specific compatible.


Hamoa/Glymur reference devices can have different EC MCUs
depending on the SKU. This introduces the need to deal with
possibility of quirks and bugs introduced by these differences.
Hamoa/Purwa CRDs and IOT EVK runs on IT8987, while Glymur
reference devices run on NPCX498/488. This pretty much was
the rationale to make the MCU part of the compatible. Anyway
I can keep it as qcom,hamoa-ec and qcom,glymur-ec for now
and add specific compatibles when we upstream those boards?

>
>
> Best regards,
> Krzysztof
