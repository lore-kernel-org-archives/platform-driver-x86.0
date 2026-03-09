Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81970396B91
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Mar 2026 11:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773057058; cv=none; b=aswHQ3FOvRD06uEXRqhTTfxzq20KGoxkiN2pMqZNjCDSCK0+rhtlSwdPegneRT3+4CqsOiEZ9Equo2w9kqKP5pJrntwdOnVBMgWvClW4DkwbSaisV8+z1ncksVzwg2c7cvHMrBm/qIY3+qALXUSGZ7OOCsEYeMiKVonn+6LblTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773057058; c=relaxed/simple;
	bh=gdS0gqGNiwWSo+4CeDh9fQXFy2YDnqC735xMDz3QJdc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tcu6uBu2hn/1JSL1Ta6OmbJ3klWDoALjPcn964gcsN9rIg5y+X80tc1wNygT7G0IUyyiVRlPfkFkA8ILhYtdYa639Ovu55apOEQSwwchqHVqAW38/3ZZQ3msWZHb5jjHL1Ewxn8iKfGYglbfIr2emfg297saS/wzT+1p+wqgLyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KOkPXvm+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j900N1OI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KOkPXvm+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j900N1OI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629AQaMP1588151
	for <platform-driver-x86@vger.kernel.org>; Mon, 9 Mar 2026 11:50:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nOL8Dcw9YEEUc45YVucYAxGOEglvK5BjjZVMuVDFBLc=; b=KOkPXvm+9fENc9ux
	Lqjho4ykhlFxV5EOayRevSRHgusNHMWnL8jskqrHHy5e539OnKYTlyTXH3q2b1nT
	6r1K1Q1OCxo5aqKD9dlA0bjld4EQoRFeaa5CZYC7t8cphygHGzcx4tNkpU3lOieq
	IgktGVFuLUmtBifkqrrxHlxY6ZfvWqp/Akw1Y87bDkuBNDYwVpB82WvkzLBsp7t4
	CYnR7lKfGBCbdrpnkNYxcFF1jNIKrZQrso8Od4B/ZTqRuhG44yF74IY27qn+Rc1w
	lfV8qwILMI/buPValigyXm+0Aa7H+OcOsyifo5WgLTCQrBhzLJoqly95KubLTCER
	biGyBQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csqcy9c71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 09 Mar 2026 11:50:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3598007eb74so43077054a91.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Mar 2026 04:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773057055; x=1773661855; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nOL8Dcw9YEEUc45YVucYAxGOEglvK5BjjZVMuVDFBLc=;
        b=j900N1OINRu6D34E5/+1jf9enTt0/fdkeaM14xNEFaDlStcKKYDuEuym+ZnBEl8Cjl
         LbBTAfUPO/VhOWtzAnEKBzsU97/W1zpIMvw2MgisnPqo/IAwb3nsKY+Pw3AaSHgksVkk
         OD/+uetRD6Q7oKO39Jssd2Frjfczh3jqhVSR4OTlSgR7JcHOMoakNTsawktcuovC4LY1
         z3JGxO+iFPsL9oPWvaGfbvJpQBUvBD0jGb4m+tuZF+u5e5q1ycnrMFTeZ5xjHLh6DMXM
         wylCSgk5wNaDMZMa5rjFLaOj9yil3lxpNN1u4MsD90BxFazblmFXlZCXLxZUNHwsyOK9
         TmFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773057055; x=1773661855;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nOL8Dcw9YEEUc45YVucYAxGOEglvK5BjjZVMuVDFBLc=;
        b=bEt+OPerQYlrjby0E7MZ1nRJknpMA7mtd5kB3vPFfwQ2AcHAN1gDp7SdFmDcDZZ648
         o0ZpuphqZRoE13h/a1IU/nT3l18zYZxS7V0RGmOIIJUmC3Shsx/82flVYVJQ9yzafCZD
         zReyXKNIw0Q9HbBvkaHkTwPw8pgkiOyaDFRklwDkM8xZz54gJKNfbxhW5Dv3AJkBxIFK
         LH/w3Nh6YS+9OgSgcIhvvkiekhw2XLCnErR7NIU7alHG0kJqEXpirza9u2eEvxI5DyH6
         ic+ws/GX8p97C3KRFieap7NrRF3Tve6hWsgJisG81cjgAGhBqpirinZaeLdMvVf5aoZD
         6JOg==
X-Forwarded-Encrypted: i=1; AJvYcCU/UwdZogadMA10ocl0Nn7mv8eoMyJ4r+yOHdxnJG4LiTMpbN+LuJa1NdYfYDkfkejAvV/xeUYV96U1Pw7a0kC4GzBM@vger.kernel.org
X-Gm-Message-State: AOJu0YzG98u+0UwLH3roijff1HKtlndD/HZUJIGGzbRduLrC+aeMs/KG
	6wDZSdFstfc/9dVLitzxt3X2Y7X0PO5mbVMCWp7xjgEANHrtmTh1rKUVNqsM/MfqCr8657AWUKj
	Qr3Tz3ZvcGcr3QyR18XOB9lPFNhbe6pg4y1WnZd9Wag/2kXbH6w8dwT8ed6nKJqi3NJpEmdM3Cv
	IF
X-Gm-Gg: ATEYQzyNxDBAALFeKBoOzYGxGUyjgrsBl6oTxmkd1m21Ai7cueIQUbHZE+PHFwc9UZ2
	q5/rQ31nj3URz50UgfPJmSB6CjJ3ui2MjJf9hRGlTysrAZjP1QLkTGl6UqmSlBPUfdw1ywa4elN
	6cFDJuexiDzPLUTAMQMFWltSru28e9aQRcRwKRHNzWKe8JxtThZYwswhNR5ltObi8ZlRRQzxslx
	fDwsoroyLosC+XsRRBelND+PZjGMzREmUyXWVvCAltrIE62f8yPpRGhRVkNOQbzgD66gLaz7yxh
	OCBP4sz9VjoW2aFmCiOvIWbMmuHvZAVcwG6hHbjxPmiDVA4HowyIlGKMI3jza+K7Dk9EsuUzhMF
	qxzbV8E9JAqJzeTf3NIt9gkzujrgbM0c1rf03EgVsN0YobhvbOhI+uhIOVptOrhFGUOp8WfEUF9
	6S4EjESHV5WRsutbxzDFhwfmv4DYlW2elVMuPfaS0=
X-Received: by 2002:a05:6a21:516:b0:398:9662:1114 with SMTP id adf61e73a8af0-39896623794mr2471000637.8.1773057054687;
        Mon, 09 Mar 2026 04:50:54 -0700 (PDT)
X-Received: by 2002:a05:6a21:516:b0:398:9662:1114 with SMTP id adf61e73a8af0-39896623794mr2470968637.8.1773057054068;
        Mon, 09 Mar 2026 04:50:54 -0700 (PDT)
Received: from [10.190.200.237] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e0a70f9sm8981068a12.6.2026.03.09.04.50.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 04:50:53 -0700 (PDT)
Message-ID: <5f70f652-5ee5-4b58-8020-88e0d93295a7@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 17:20:48 +0530
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
 <ad3485df-5570-4631-9d6e-2f0b90a47235@oss.qualcomm.com>
 <441a72fc-b81b-4fb6-b032-867752b3c773@kernel.org>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <441a72fc-b81b-4fb6-b032-867752b3c773@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwOCBTYWx0ZWRfX6X8C5EF/AmEt
 emxEbkMNySaoPkOXSazDO5VWXnHFJNvAZz0+jdq2zIlxyDJajUFISfdqCMI1Y1a387L6YZkl4Ia
 E4iLI1+g+XIYryPBQ7q2ofY2/Aze+9+Yt3gf+8G/Q1g0UOFxvLcJx8DNiU7jP4H51vGZC+xUf7m
 Yry1bRRVEkhlYw7jkPyVIWm9fp0jkJWCgrXIpBr998fD3WEz/fFD/OD9M3bLtYiDyksv2WTbfOE
 Z0vmHJJnTtAyZ9MqJh/w68MW3zWIlzeyJA8EtK2pmBgVeDhYxCBcdFa51tCtESzrtnZN63g3Lzh
 0sTLKxHuOcQSx3l3vIiIbk6jwoxu42nyJ21AGdhxSPPCQVeqYlsSFD8tzn0oRfwj63vCYCMf933
 /N9mFwOEspkEPguvpSXyE3TYvsnUcqeQd1mhC3xV6jII07ebLNNu0hG/4TfQwAfk6Mg/Sms872M
 KmF/x4iyT+BbV1W+P+A==
X-Authority-Analysis: v=2.4 cv=QJtlhwLL c=1 sm=1 tr=0 ts=69aeb41f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=JKISxpa1xdn5d-WQYaAA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: WW_fx7xHPPCO_kr2gG_m03tbO27hzNjK
X-Proofpoint-GUID: WW_fx7xHPPCO_kr2gG_m03tbO27hzNjK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090108


On 3/9/2026 4:23 PM, Krzysztof Kozlowski wrote:
> On 09/03/2026 11:51, Sibi Sankar wrote:
>> On 3/9/2026 2:39 PM, Krzysztof Kozlowski wrote:
>>> On 09/03/2026 10:03, Sibi Sankar wrote:
>>>> On 3/9/2026 12:55 PM, Krzysztof Kozlowski wrote:
>>>>> On Mon, Mar 09, 2026 at 05:06:45AM +0530, Sibi Sankar wrote:
>>>>>> Add embedded controller node for Hamoa/Purwa CRDs which adds fan control,
>>>>>> temperature sensors, access to EC internal state changes and suspend
>>>>>> entry/exit notifications to the EC.
>>>>>>
>>>>>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>>>>> ---
>>>>>>     arch/arm64/boot/dts/qcom/x1-crd.dtsi | 16 ++++++++++++++++
>>>>>>     1 file changed, 16 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
>>>>>> index ded96fb43489..29a1aeb98353 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
>>>>>> @@ -1042,6 +1042,16 @@ eusb6_repeater: redriver@4f {
>>>>>>     
>>>>>>     		#phy-cells = <0>;
>>>>>>     	};
>>>>>> +
>>>>>> +	embedded-controller@76 {
>>>>>> +		compatible = "qcom,hamoa-it8987-ec", "qcom,hamoa-ec";
>>>>> I don't see updates to other x1e boards, thus my arguments from v2 stay
>>>>> valid. It's wrong to call it "hamoa-ec" since only one Hamoa board has
>>>>> it. All of other Hamoa boards apparently do not have it.
>>>> Hey Krzysztof,
>>>> Thanks for taking time to review the series :)
>>>>
>>>> What other Hamoa boards are you referring to? The series
>>>> mentions that the driver and bindings is meant for Qualcomm
>>>> Hamoa/Purwa/Glymur "reference" devices, so it only covers
>>>> CRD and IOT-EVK. It definitely does not cover all Hamoa boards
>>>> boards like you are assuming.
>>> hamoa-ec compatible implies that and that's something I raised in v2
>>> already. You need a specific compatible.
>>
>> Hamoa/Glymur reference devices can have different EC MCUs
>> depending on the SKU. This introduces the need to deal with
>> possibility of quirks and bugs introduced by these differences.
>> Hamoa/Purwa CRDs and IOT EVK runs on IT8987, while Glymur
>> reference devices run on NPCX498/488. This pretty much was
> None of these answer my comments from here and v2.
>
>> the rationale to make the MCU part of the compatible. Anyway
>> I can keep it as qcom,hamoa-ec and qcom,glymur-ec for now
> No. You cannot add a generic compatible when you claim it is not even
> correct - "different EC depending on the SKU".

https://lore.kernel.org/lkml/1336e1c3-6ee9-4a19-976b-0bfdc02fc8e6@quicinc.com/

The explanation mentioned ^^ was the motivation
to have a extremely generic compatible as a fallback
since the firmware basically implements the same
exact specification.

https://lore.kernel.org/lkml/def949f2-301d-4edc-b303-0fbe02a18c3c@kernel.org/

I'll stick to your suggestion mentioned ^^ and use the
following compatibles instead:

qcom,hamoa-crd-it8987-ec
qcom,hamoa-iot-evk-it8987-ec
qcom,glymur-crd-ncpx498s-ec

I'll continue to use the hamoa-crd based compatible
as the fallback since they implement the same firmware
on different MCUs.

+properties: + compatible: + items: + - enum: + - 
qcom,glymur-crd-npcx498s-ec + - qcom,hamoa-iot-evk-it8987-ec + - const: 
qcom,hamoa-crd-it8987-ec Thanks again!

>
> Best regards,
> Krzysztof
