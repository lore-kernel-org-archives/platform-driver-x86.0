Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617586;
	b=FS01jL9UiO4JWQXeR6E4m25jIlkxinQXXIhcNfrYcCsCR0kTL0o7y0LmqHXU/etXuDYL
	 4ZlNp1e4U+Zh7YMLdF2ajGlMyrtrkJQUYv4Al+iNwHTsm5vQK75GaSnVDc5daijgZ/lOf
	 WA3KoMgB24gFfdgOz5IH8GRqBcYfw8Gzs0QfqEFrBOhJzcwyzOmUFnucDj5RR6zciPQvz
	 F3nh/EB0bLFG/ixnb8ITv2EcA7IuTZT47YPFYTv+WNvy7uW6UvbaPW+B1ikTaYBM4Lud1
	 J+t+J65iH2UwSikf6PD3e4pnk2DzWmCfuB4f0SpldJUQKAdZDVy+ZKdY2nlZU+fdNoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617586;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8VexOwUS4nB1TRVAfE4qKBfboYevUooTSYEch1IVOQw=;
	b=Km7Lv0p+lkXwSlLGHc66vdubTGWK1zBPBKMqnKf9f2CszapTkerQkzZxzzHbd5PLSLXg
	 FIP+or8uR3gM6fmqdzSNKR6HlP4jogFHQKbY4qIVPo3d17RExrvSCAJeg9OvxHX0Wg5ZV
	 cf++g81ZqNad6VGgE62IU68fa7xuBUt6KKSzKHhHkrlbBmnwkZxNLY8dzRNJyZ1w19ajQ
	 Z2EWa7watmvjDSzkNh9EEKmeVjFu2ZGTFvgPN/hStfVRtSoPXi6/oZOIR0NVhFYdE47KD
	 1jedv7a4IL48hU6OQe9Le3KeZjLGgB+y8PN4sQ+D2+0zE5KeMzf/KZyHylqFTOUH34Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K4P9gBfN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HhmbEf33;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C508E606A326
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 11:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C508E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K4P9gBfN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HhmbEf33
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29ADpV4039441
	for <platform-driver-x86@vger.kernel.org>; Mon, 2 Nov 2026 11:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8VexOwUS4nB1TRVAfE4qKBfboYevUooTSYEch1IVOQw=; b=K4P9gBfNFfYhga8t
	CbQutxvofJsoWF/CvkeWYKvREfH5CcZEasccFLS3yOtqf+/MKUyPQpEO/osDuM0z
	YjyAwJ1nfay16y63LbsIRRkRwjVZ8BPi3qcBiMBSjtPSObrx9Tg3Kyt/a1+4Kw56
	pI/Zafkf7QTAdF/Hl1gyjq8/k84nwQtA6Jb8xgNC4bSsw1CohiQNdtWzKxDXGd6U
	3BQN+0oOiS0EmZNNlEVPPvoXIrFcB8jVcGaVfpwpHQEdTlTxp6NA0FvTQUB2mQBR
	lXWq2GuoXtCjxJpDlpO06hCPYzv0eI36aWpuWzTC9vJe3yjhjQEzY758piT6ZWhi
	ebFttg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph18te5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 02 Nov 2026 11:06:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a06750c74fso2110785b3a.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 02 Nov 2026 03:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793617583; x=1794222383; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8VexOwUS4nB1TRVAfE4qKBfboYevUooTSYEch1IVOQw=;
        b=HhmbEf336abxUMbX+nncxu1QPp/LvR0T07PbzQG1Z72O3pp2wlKY7kAxPbb/JcwkXA
         FOx5T+LqCTTzwMzWmW08nAJW+uksUbaxA/26mBx49NoJeWa3RMkdEYYVvzQDRMvPX/qQ
         Hc8YRZ7rTscMIZV9Xrl19qfYW33IOmBou1lPeKmKKO3VT71R8ZrV508f539iBFmPIQlp
         jF2cW0SIYBMYQghEN0Qx6y0XZHhATufcvy6Fv8/RA0oz3dlDi8E3o+0SOo1etUqGPETg
         8GYTNObaYgwdvua2fvtygcPSZJhHgJ1zaoS3gEYVRNde3RIZPGADjW6TE6l723gzLurs
         0ceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793617583; x=1794222383;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8VexOwUS4nB1TRVAfE4qKBfboYevUooTSYEch1IVOQw=;
        b=GJwLHyZ6+1poRqifg7Y1dWYbvvlYtg1iFAq7hbklPUP/dXm5vuwBDh33DNzO9saKpJ
         BACLt+SdbDk+rqCUdN4sGiNjVRcH+l1uaL1h1OJWmctLXwEHksV7cx5xrTKMM5DwZuE4
         VXj9gDn47kxvIFTWKjEEX9MfmC9fxIZEuSYq9Cev8DpmdpaU8GA7DwQ6OGo7OkjowYMl
         TCLdTIX4XHPmEjs/23/k1F2f2+ThG4lIy8I4vHgNFnkLthK3L7k091biT4CDjtVIk2Jh
         S6Lt0t5VGcs451w6iiVahkAXxwC8cebCxS6mm16CpEmbdrQn7qn+9kYO7ETo6Gy40Uf6
         MHTg==
X-Forwarded-Encrypted: i=1; AKwUvBwOfVBVz5wFikrahn/WDpc5RxAqGazXUbksP23tvYTtR1yLnaywrMySjgjSeGtEc1WuD9/IpoB7Q41+rqS4256t8IuJ@vger.kernel.org
X-Gm-Message-State: APuU4Z8I8kDunyXZiJplXQapAneMCZKD06OUgIZPp3QF9yiCa6AcGl+y
	1O49+H/12tbLRaAZLwg7bAPLZNXzlrIy0mNQOcW5faZOX6Tuf956EJcDu+KANEuNzVsVtuOPCOr
	EZe552HDC56fVCmBygrp9BLBbRBQeYnhmGdmPfLq1Qn/v2G1d81bqemyrf5KuqnlpyumMIhO0XC
	0p
X-Gm-Gg: AYBFou0jq7L9WHLfUHz2CMrykOZw6nwBAQCRHuiaK336J0r/yTdggSalXelI81svqal
	d2VQ4HfN+HsEI/PfH7tT2Xe8rziK030rwqV+g6HMhgn4sISE7yj5lVlYcixbd4X/GWh8R2jcmD3
	P0cFnotrcTn8ZMNY97zpZxI4u7AM/ZPP1jXd3rpGRp8z9PX5UdUJOJSC0ByOm715oGs6BV02zDJ
	iz4APRX0e8W4y2rNSDsYtJAHqiTAy7qK21GnllbEal0gKKIYee3u34ELIxhPNr+JTAC/0vCEel+
	eCFZD+JyHVttwuaxsS3WIXMU+8R3MBAluNQVAyy2zLFMNjdat1qU/Iy4oExs98Lvx2OfpLPlSfs
	sYw2sWq96IB180nSwnAP/HkrcFypPYzFR7ebjJcrSA2l+OnIsC4pACgf56gbdZuYM0AbVzoCIVB
	asnEUwcQ==
X-Received: by 2002:a05:6a00:2d87:b0:886:281c:98dd with SMTP id d2e1a72fcca58-8a9beb61305mr7142665b3a.26.1793617583569;
        Mon, 02 Nov 2026 03:06:23 -0800 (PST)
X-Received: by 2002:a05:6a00:2d87:b0:886:281c:98dd with SMTP id d2e1a72fcca58-8a9beb61305mr7142622b3a.26.1793617583012;
        Mon, 02 Nov 2026 03:06:23 -0800 (PST)
Received: from [10.218.27.184] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad963cf90sm1795605b3a.16.2026.11.02.03.06.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:06:22 -0800 (PST)
Message-ID: <c3de7659-726c-4fbe-989e-148bcd13bc49@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:36:16 +0530
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
Subject: Re: [PATCH 3/3] arm64: dts: qcom: glymur: Add EC thermal zones
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
References: <20260928-ec_thermistor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com>
 <20260928-ec_thermistor_support-v1-3-d9c1bae4cd0d@oss.qualcomm.com>
 <e77c0255-6299-4718-aaa6-04f4366fe749@oss.qualcomm.com>
 <5d84ee1b-a765-4d6c-ab01-ca1a06a0e3d0@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <5d84ee1b-a765-4d6c-ab01-ca1a06a0e3d0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: D3ALYV5LxAVnCOEo0o2bUgFl41l6NRAo
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae86eb0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=7-sR13JiO9-Nskhq_G0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: D3ALYV5LxAVnCOEo0o2bUgFl41l6NRAo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfX2tGhkICJTyPm
 UWH6w/eDyc8hgoutZ6CoKlh8msM+Q/eJgIsE29ylWheYZs8/fX5XE0FgzOdQx4Gj/hGuNg1ww0m
 kFKSz0sRuHGjr8O9yQjvRpfHBlzRFbBlmAcKHYXdJuiopJV8rV3+JeOyzwWrL6Vk9bVuJEPBTtI
 gfyQAmd+k/STbfI5NFk+CKbQ5opG3S00gKgrbxCx4eVQdfjkQ+47wDdqMfy7q92uH/Gr+mMyM4k
 m9UQv5CWU+cPzuQxppNsWHlt9B0WC0A6Xa7kuuosz6zTVMNlsEzrMikGjrHbvr0MyyHuSMhL+7D
 Akp9XKM1m22kReO/ivdc0Lmn2PwoNMaSfCCafiEg2RbFemVsaYOChqQ0na48j3n7UuMy0BsiS0z
 UNxrqvcxil2ZznN5xrZPSA5JX9HWMlMd6dxB0aYmzq29XfLcm3SMY+j3cKzGgxLg8CYjEgYUvLn
 pAkFNNnO5J1U308qZ7g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfX9tqHmvuy11Ds
 WiUafBFXqgEOQsxTrk5Lb86wML8eye7h50hyCxsjERlS37jRcSLq9UpdRV5v9D3xIsfvdFj3PhR
 36yi/mEQazuyW8F1nd818oeAFkjE3cA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1011 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020044

Hi Konrad,

On 10/29/2026 2:38 PM, Anvesh Jain P wrote:
> 
> 
> On 10/20/2026 1:33 PM, Konrad Dybcio wrote:
>>> Add support for back cover, keyboard, and SoC thermal zones through
>>> temperature sensors hosted on the EC for Glymur and Mahua CRDs.
>>>
>>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 45 +++++++++++++++++++++++++++++++-
>>>   1 file changed, 44 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>>> index e27c697e3170..571c98124a40 100644
>>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
>>> @@ -594,10 +594,12 @@ &i2c9 {
>>>   
>>>   	status = "okay";
>>>   
>>> -	embedded-controller@76 {
>>> +	ec: embedded-controller@76 {
>> "ec" is a super short label, perhaps let's spell out
>> embedded_controller
>>
> 
> Thanks for you review, I will rename the label to embedded_controller.
>> [...]
>>
>>> +&thermal_zones {
>>> +	ec-back-cover {
>>> +		polling-delay = <10000>;
>>> +		thermal-sensors = <&ec 2>;
>>> +
>>> +		trips {
>>> +			trip-point0 {
>>> +				temperature = <90000>;
>> This is *really* hot!
>>
> 
> The 90°C trip value was suggested by thermal team(Manaf Meethalavalappu
> Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>). We are open to using a
> lower value if this is too high for the keyboard and back-cover sensors.

These sensors are intended to be controlled primarily from userspace by 
the thermal governor in thermald, through the powercap sysfs interface 
[1]. We do not plan to add cooling bindings for these thermal zones.

Based on discussions with the tuning team, we agreed on a hot-trip 
threshold of 90°C for these sensors.

[1] 
https://github.com/intel/thermal_daemon/pull/614/commits/7f3dd62353e039957e52eeb40c67ec388d543ebe

Thanks,
Manaf

>>> +				hysteresis = <5000>;
>>> +				type = "hot";
>>> +			};
>>> +		};
>>> +	};
>>> +
>>> +	ec-keyboard {
>>> +		polling-delay = <10000>;
>>> +		thermal-sensors = <&ec 1>;
>>> +
>>> +		trips {
>>> +			trip-point0 {
>>> +				temperature = <90000>;
>> Likewise
>>
>> Konrad
> 

