Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333EC339856
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Mar 2026 09:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773047025; cv=none; b=cjlXc3TF6+TmwVd1kUF4AluSJ5UM+/LXiEZAxaw3Vw23cp2RE3UmxX8vR68JUNC31XW66eY3DhHlQ2SgNs+C7E/3GS6Mck2auSOmI0UiffdQCPO2hTRxZG/oXXAELzkhDvAjS+KWSHjTC+QW3i5US9F+PFX75085tf87Ciqvtbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773047025; c=relaxed/simple;
	bh=8fUvoibV26HMwm4SZo08XfvSd2z8XvjOMt5GVhz9Rts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jKgLyVnqtZ00OWJt4wpXCzj+FvAv/d4LpjIu1olwFbupNfQC9sEb1myX722NayJJt4KFkNnr/loxs38vTmILdDWFgxnOm8Pvl5ONdF49S5jXhfU46C+IgphQLLsuivvpPJJ8PksQSKZ8k1GX9Pe2hK4TFTF1yZwJ35uUXfG4lfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XdbrpCNu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NywW0NjC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XdbrpCNu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NywW0NjC"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298WEs13773310
	for <platform-driver-x86@vger.kernel.org>; Mon, 9 Mar 2026 09:03:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LFgh6PWkU285cJ6bI3mPDffcunh/9afis7R4F55H8mM=; b=XdbrpCNuJ186PiNB
	U0A27Tm9S312pqZ48fIR/jd+5bmvTCwpnVA4VZKct8jSLQwQvhfF8yPXPwRMG2Ev
	5u3JHaO8BKiEpliFW6YnHzgqpsD4RPaFQExFAMIMcJ1P3T5bQDTmSX/LxElP2nRD
	mMDq61Nvqo4YlM4DZnjzHJZn/6dUeL+LBsleDpcfFqihFIXzT6RKG8Hnl4LJRKdJ
	RqpjCR67Bkz3Sp7tdrSTKwv19K5jqLZ2Lef6ae9fZLpni5N8nAbwSL8zy3IZJ/Ld
	r1oiVMFQ/4N5MoSTRGEop/a+UoXQnchTOsIK2CqVej4q2Tv81IKfqB39rkg1Zxil
	XToGrw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsa83um-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 09 Mar 2026 09:03:42 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c739120475fso2449320a12.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Mar 2026 02:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773047021; x=1773651821; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LFgh6PWkU285cJ6bI3mPDffcunh/9afis7R4F55H8mM=;
        b=NywW0NjCE0pWyeYq+d85CaPVbnHzOcKUf2l6FoL4XoDYhz9+znn3gOuJxDLYERA2Aa
         7wUYbiFma8L4bnzqRzlXAXioHrPylAF2WUb5pD08tyo32Z5VCpimF6hb/nMbhXAXWi6+
         D4EZI8TeWycLON7SfuU8yD7izGbCaH72zkXviktFvZIkfh7LmvmYC+irhKKQK5EEbx47
         FJA9D3gTuYbtVto/eZqz++qil/O78gLk+/I+XG0Dk91cLWDeusprBEeYdu2ZHMkqIqSL
         89/9Bl4bSVm3ieJw+GE1MCG2xrbG4LR/6yN5alnSd4aLVasCQU1Nwj4U1QFjjTItNwbP
         MDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773047021; x=1773651821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LFgh6PWkU285cJ6bI3mPDffcunh/9afis7R4F55H8mM=;
        b=s3EY9ndYxjccKASP1kgOwwR3U3J8oTPea0xCiggU/NvI9+6TG/4VyVZnpVUjxbUm/R
         LcnfIJb5/wDKkuOJKg04x3WXe1JiDIAc2NoKoZx5Qc7/abTuUIHnE06Tz/iBXoQbAo1s
         KtLoaymxV6/0dgjK2ehvLDWrU4eS9uIUfuaxyJQkJv+8NFUHS3q1iXvkdGYyRUIiBqne
         L0/VN8XfGqQeGK7uLBf6CBWE0EmdGRYaOSXTonN4QHyutfRMFWSLh2f4QH9IzsxLjSz6
         q8MOnzED4cd7E9o4DetH7ogajSS6Fs7vIt2nhKmlDlppSjeJ77AEIaz8ztm6V3KMy1Pe
         3sMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnhhn0vn25z5QtHrhUcxOJcFIYkJrkfYeBPggJuyVdngMJMyj0c8L1aIjmrwnYO9OEZ6pe8FK4lYz0IoVDB1D1K0vR@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0XlUByuam7Jzuus1vW3s7W1PflF/ZP/OlDX956waBFVgo7n0w
	YZFrRCZ2/31DOUXTWlQf1LYnM19ygRuqTFNqOa2H3j987Eb02/d7Dsgt8Rj38kWVw8axEMGI/4G
	7oOhCNNlGh+bVUOTPbUxX4gee+2CPrYb4Wd/iw/xUcGzMDG4PZiyALftrDnVrd/prgo0nI3cKTl
	6G
X-Gm-Gg: ATEYQzykH2qB0AWQlyFEMewyX+QwRETxNDIpmUsdgEZ0iaNcXfuyxzimY9j1pRkUd1m
	CSzlzcmAVFp3v5OkEVPSuqTodOH0jPwoa33GHNpFMgsPxIEeAjpie9WtTfeXliQ55/ikvJm5Mgf
	EeX3kE6dP2+eV/g9+QDwHa0KvD55vCuqnFycomk4PYIgRC54/LhQcFqYoZ0g5mvjgtwDNRy+2iD
	G+DS7s/VFPj2f+5NSbwNM+RYM8/JC3bpcsld4nzelBXZmNSW3ZsQZVsFc7NCRiVxi8lNkt1+16i
	1jEVg70yNYLEn4p31wfgAREOCppkejiy4nNyRtZNReDVZn3LP0WXpxrsX2Yl4a67XZcoB7UP67/
	KGX2y28WXtsGJFGX+xjf02oYGQDw8SfgO61RT3taDLGnb26fBbBuColELNF8rjbEyLRHgQyKGzV
	y2VblW4e15kxisPEo9Xd85QhR+NMhztECORk5lHdU=
X-Received: by 2002:a05:6a20:c786:b0:398:a216:2425 with SMTP id adf61e73a8af0-398a2163a0dmr435087637.65.1773047021028;
        Mon, 09 Mar 2026 02:03:41 -0700 (PDT)
X-Received: by 2002:a05:6a20:c786:b0:398:a216:2425 with SMTP id adf61e73a8af0-398a2163a0dmr435038637.65.1773047020367;
        Mon, 09 Mar 2026 02:03:40 -0700 (PDT)
Received: from [10.190.200.237] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e194f74sm8523530a12.30.2026.03.09.02.03.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 02:03:39 -0700 (PDT)
Message-ID: <ff241b01-c7f4-433b-a822-c5cd14e3e696@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 14:33:34 +0530
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
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <20260309-festive-prudent-ibex-f8b601@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ucQ-W9NBb-soW_Ta5gEjZRKiMYuBpsRS
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69ae8cee cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=PRai1pm7VL3AQe0GFXUA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA4MyBTYWx0ZWRfX2MdNRPq2D20t
 lDc+6vTUQFHPQrCwi1TIkC/3JsAGeykc3JQK2Tc8jHBSM93bNKEbNXfvM3riVNRE442gIWCnGys
 d+V1PmoP926BgI5wt8bbSX45eYpuExebVEoZrX8uU5FwgSeeLfT8iwzMSoduIf6yMZFSGpPMPDu
 l8/4Jc0llK+qIAT9D4QgtIU72kgEpI/pcJUUzSvLrb890pTUFKfpHAox6an4hdeOf5wfycbCgQR
 aYH3r1/19aR6cM3H7YeScaQ+VI6Rzh5vKJ41uBpPG4PoeZByQeikuiaGgvMTsfz/rfK6D0xP1nT
 7DIWlkeaSKvy9J5e0M4O3bJzvVGEjM9z5mnSFz78sEVHyW+NbjyLe5eE+DXl+GIlb263L4+g/SG
 /LHJosuZIbq5AFh0diBeby+vNslFtEpCUf2hAOXOXO7MRbzb0Y8Q2Edk2MQS1LXx4gydJr023Q+
 +ge4houONjb8STq9fzw==
X-Proofpoint-ORIG-GUID: ucQ-W9NBb-soW_Ta5gEjZRKiMYuBpsRS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090083


On 3/9/2026 12:55 PM, Krzysztof Kozlowski wrote:
> On Mon, Mar 09, 2026 at 05:06:45AM +0530, Sibi Sankar wrote:
>> Add embedded controller node for Hamoa/Purwa CRDs which adds fan control,
>> temperature sensors, access to EC internal state changes and suspend
>> entry/exit notifications to the EC.
>>
>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/x1-crd.dtsi | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
>> index ded96fb43489..29a1aeb98353 100644
>> --- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
>> @@ -1042,6 +1042,16 @@ eusb6_repeater: redriver@4f {
>>   
>>   		#phy-cells = <0>;
>>   	};
>> +
>> +	embedded-controller@76 {
>> +		compatible = "qcom,hamoa-it8987-ec", "qcom,hamoa-ec";
> I don't see updates to other x1e boards, thus my arguments from v2 stay
> valid. It's wrong to call it "hamoa-ec" since only one Hamoa board has
> it. All of other Hamoa boards apparently do not have it.


Hey Krzysztof,
Thanks for taking time to review the series :)

What other Hamoa boards are you referring to? The series
mentions that the driver and bindings is meant for Qualcomm
Hamoa/Purwa/Glymur "reference" devices, so it only covers
CRD and IOT-EVK. It definitely does not cover all Hamoa boards
boards like you are assuming.

> Best regards,
> Krzysztof
>
