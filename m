Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280E12D0C84
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jul 2026 08:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783411710; cv=none; b=YTkNrVwmrWiyBce6BrZMIV45M9RmWGYo/3xfBjYG5CrhFd0/vsiljYLXyV4jHLuj7NshKmEuUFmHMwplWFhfg6QIKUNB9okic6X6M1lGJwhs5FXmW735YeGNGjkLIAlVb5hyxpJApT/6NJTywRxDKnXBqkg8pymAEJNOgRnj6JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783411710; c=relaxed/simple;
	bh=A2SY17CAeZ/j2znh/Nh29scTgcl8twuNHXIs5ZQBXac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZCJXT8SScjWU/+M5BRe6FwX6Z0sl+/vUNgyLE79uW2crLCMt57kwOVXurNi+IeH9ok8+TkficC9X9AsXeNUnYckMIeU925me1yHUVltDfjq66xqt8Ve7Mbke8NXSVLnWq/aqCdmeZbaWNmY1ivZEs+47qXTqxIlhD/grJ8juquM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JjChqHs/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZbZD9G4H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JjChqHs/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZbZD9G4H"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6677BZti2936276
	for <platform-driver-x86@vger.kernel.org>; Tue, 7 Jul 2026 08:08:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TNCFc4M275i5hqwVvMbqgQb+aYFA0UWni3Igt//9OC0=; b=JjChqHs/Y0ehLuj9
	+Ek57vIafHifloHM5Kj5V7Q5pLcWdKiLeC8D1eR4Xlto8WqLlt1PDw8LV2h81EhT
	w9NfbePsgKMT17eiwjHJQwcxdjKjHH2tWczk+AY5U7Br3/8XRCpZfl8vr/DL2hzT
	ovFeczrWWTfSiJUJ1cUPIbogrRfhfPmNLtJItBIjU15L/Edt4cXG9TamUStaHpSt
	Xm5oT6/NDi6KP3t4FTfLvCja+AFrh/UoRRurLs/0MWH0GHKoOlymRQo8CS5/x6/K
	namP9jFL8NamLaKj7qm3x20gwxEUq5Ukwe2n9TEqv6d6v/MfchaF47CrjK2h0sb3
	YD/F2Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vun070v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 07 Jul 2026 08:08:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0199faafso43956861cf.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Jul 2026 01:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783411707; x=1784016507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TNCFc4M275i5hqwVvMbqgQb+aYFA0UWni3Igt//9OC0=;
        b=ZbZD9G4HNYGNP7CDGb/4z5JJlIshgyJYP/AZYJpe3ZK1UoaFvnjBi6acRo9msvdr7K
         q3ss7Rda+CPvXK3PtCQlVR/BUaXNlCen8ukTiApEhDbz8WYI2LpufyB/pVW9xkh8NBxc
         jB6oej8pLrmUPkvfbritqudR2xfTTu3nPqN4LX95LjR5M8rm53hhWotPh2ka9Gb8vbPW
         maKKcbIdvIY+gme/Kwhi74Lxyyug/kNMZ3nc3GRcARbYl/dlJlbVCItuJ2Sb7i7x7y6V
         kViHV2AvF3NlBHcVs7egfGUas1TDSCmVP86RuJlCGHGbtQaMlS9A8RlexBFotakgGybV
         lMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783411707; x=1784016507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TNCFc4M275i5hqwVvMbqgQb+aYFA0UWni3Igt//9OC0=;
        b=e5jATlr/GQllSOEyEJbZDADVhVAVcRcuzghzzy+0bI2qWu/wcfCzNhvzl1dFsek/uc
         jpmimFrbmZFGykBKqG62aXr7+VL32dfi34NqNDdFtswH7XvdYHpdYcBWhm3gAeIeUXrJ
         LmbJiaBfkrvIsA9//ztecc24K++L2YlogEhjrXIA7Mz9UiQJLT8EPQNkkMUOCi5K+DES
         WUWYdXDxAeh+F40Twx4WEdv4gdkd9Yx9w8PvejB6Dm5RkJ4NyQw2OfYusDsNYngeMWiG
         tQcAlEYucAJ4Z7H4L2jpWkxF1c+Cjjv2eZ375FnciaLEQcR3X3PER3GXQ7Y91IyL6MwE
         V9ew==
X-Forwarded-Encrypted: i=1; AHgh+RrqU6vckRS/sIlXErA1T8JdV7sq15Y62hstjCUXRtoTjvcl3l9XmPQ1uqzcyoBdDsONIEsIKdbeWC01N4gg38sgZx3l@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyx75L8pchN6npGpMnGmiWeHSpwvLv0PZ72VsmIFh12pNMl0BB
	9GS1mthxR63q43CaHXojJuEzrPPi/KY+wBkdSbMZ80ubmspGznaJou77AongjKPHNPFops2iWmt
	vDgsSdAD5NPOFcpTexd7AD99YIXHIxQOKDxhq2O6WAlYrDZHg5hy3/eg/OxKO8ndAW9+oLBpUf9
	J5
X-Gm-Gg: AfdE7cm7K80GQUQ5SQEqZQJq5dR4EpIiu5WYkSykKr7zsw7eMq/w/3EchFstI9R42kG
	j2IMsI7kt/nhDj40jn0VBhJ1brFiOMSCOiMPPNGpbXME8ZgfFsLgidyxZWtBH/3/781JjmkBgv6
	2VaVjz9Hzibe3ZGqRgw2Ki2rCs5L+d1AOAJ2W5hKGmRB91kTkCqhFYMHSq8gYzEf0nk789aNJW4
	c/lv+PS7G+b1sw/+6sQtuYUAx/QuyAILYKBPoTAcDMoMeKYSO29icXzQAi2zGf9zjMnzCuF06JM
	6iLik8Pl7IEhoZ3zmeqQaKd1HbSJt4NFm4jjEP2b9bJZEXFvSjOXoWqmRKMAgJ5jQ+iyviCRFHk
	YdCu/ziyKG5Vl6UgE9tCOb714D9DBnef+jR3A3BYrHRrqwkAx4ultChinT1aSQafoSQ6N5PlJoA
	==
X-Received: by 2002:ac8:7c49:0:b0:51c:1132:c800 with SMTP id d75a77b69052e-51c747a137dmr43719841cf.19.1783411707387;
        Tue, 07 Jul 2026 01:08:27 -0700 (PDT)
X-Received: by 2002:ac8:7c49:0:b0:51c:1132:c800 with SMTP id d75a77b69052e-51c747a137dmr43719601cf.19.1783411706797;
        Tue, 07 Jul 2026 01:08:26 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039b126sm31391476f8f.24.2026.07.07.01.08.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 01:08:26 -0700 (PDT)
Message-ID: <8d579153-efa5-4c8e-acae-87f3bdfbfc24@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 10:08:25 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: embedded-controller: Add Lenovo
 ThinkPad T14s thermal sensor provider support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
References: <20260706184648.35613-1-daniel.lezcano@oss.qualcomm.com>
 <20260706184648.35613-2-daniel.lezcano@oss.qualcomm.com>
 <20260707-armored-azure-terrier-4dc3d3@quoll>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260707-armored-azure-terrier-4dc3d3@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA3NyBTYWx0ZWRfX5Dh9gTX+Rzny
 Lk2nipi1j4xkPkPB7kDHWhtDQ+LfXcTkZ6471MQItHvHubLVAo5BnvYBvJwZx9Iar2WazN1b4g4
 mOyL5uQjCvpAzTuRtKk7rLDnrsJuxlg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA3NyBTYWx0ZWRfX2T2DS0ralFJM
 mJ2v23aslbtMlM3yK6ERbAAZ44maVmy7dKseITeRLHBfHqvw4L04GmC+E9HuEls8obc6Y4qXIQo
 rqVLinWc5x59uOk2NmFnvNFmKaMbGZy2+k7LbOafgPZEpEtKVahy7+kdtAmPHy/nFufRKAhxeJV
 rXqH14XPN0R+Qf0c4OiZ5Jyg6tXX7QbZ1XSBZ+QRcIgkjUOuRlTGdCAzCXHM26gUZvE+SlumAW7
 zJf1ol6WIs4XT3GKzHrSV5pZ9ZeoMTfkqp6EX2cus5QgsdvyIHECufb/OKPS2A7VyxsdAqNOLlo
 zTtijL9Uk6N8yJWnna6nAz901U+pnSczk4D++XpYv6IukiypCILn6Bl3Q61uXwDWeGUjP+UNWmw
 xP8hGQXyYfLXkjQnh/pEvSMof7auFFFLYTP5NY/PEfcHdbPs7UHIKExTKLciER9R8X5Vek2AXqH
 lpxScS4KGQAORp/Ey6g==
X-Proofpoint-GUID: bzqFkE8Q5Kbw6seZXahygqVAVemj5ioV
X-Authority-Analysis: v=2.4 cv=N+IZ0W9B c=1 sm=1 tr=0 ts=6a4cb3fc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=dgN5xaoR74Ub-rSnYJMA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: bzqFkE8Q5Kbw6seZXahygqVAVemj5ioV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070077

On 7/7/26 08:38, Krzysztof Kozlowski wrote:
> On Mon, Jul 06, 2026 at 08:46:46PM +0200, Daniel Lezcano wrote:
>> Document the Lenovo ThinkPad T14s Embedded Controller as a thermal
>> sensor provider by adding the '#thermal-sensor-cells' property.
>>
>> This allows the EC temperature sensors to be referenced from thermal
>> zones in the device tree.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>> ---
>>   .../embedded-controller/lenovo,thinkpad-t14s-ec.yaml         | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
>> index c87ccb5b3086..0d049979e35b 100644
>> --- a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
>> +++ b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
>> @@ -26,10 +26,14 @@ properties:
>>   
>>     wakeup-source: true
>>   
>> +  "#thermal-sensor-cells":
>> +    const: 1
>> +
>>   required:
>>     - compatible
>>     - reg
>>     - interrupts
>> +  - "#thermal-sensor-cells"
> 
> This looks like ABI break without explanation.

What would you suggest ? explanation or removed from required properties?
