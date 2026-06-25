Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC35F2D0C63
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jun 2026 13:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782393622; cv=none; b=uiBEdiPZ5/gjRzpyj/yUj+/AJGLqnadAIvihXkPiOgxUe4tLOBqOL1/sm8wEdLPlc0RKKwhjoSCV8/VEpSEdhTlxxuRE7MDLwJN6H5cUhT2WphZtKT7PqCfthsXGqiD4GCGeVr9J3YXJhDpZQ7q65h2IaqB7OF6kcUa1z383oP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782393622; c=relaxed/simple;
	bh=hVd/9vBlCbyUh6zt9JM7gQXmP2qyxhw6kvFctofIbA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rCYn1CSFfnGhptguelfk39x3+fgrLOi1Dp/0kcFc48/DwoXUw4j6aY3kCur44lloMv47aGukRvvpUG9oUpUdW2BRvNkC8r/8AQQsbLmJcH6Tf9SBRh6oSkHPHlVbmikjIu1GOaJZpQ5kJa3HKGGaMfHXijnQlw62StmBM6uQ4wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bKLgbtVx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=atcpNZN+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bKLgbtVx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="atcpNZN+"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9jv9P3078245
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jun 2026 13:20:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GjQjuigvKFd+Z+gtUv1havxbgca7I7GsAQ/BjMMTbQk=; b=bKLgbtVx0zgQeLSv
	RG1K0NCDSfXhwbVrQCu7661cFTEtJXNLKoLoiURkPowe/nqyPIwyo00TJRxo51s8
	HHQ2uiLRacNOz/oBMAzEh2/6tII4Vc5P2n8D3ySTeQrSpD1PXG6aJVQsZqSbDwuZ
	zL2Ufs/1h5DdLyiCCpQXALBFA7Rb+RfsDYq9QrHLVmSDKuN1gk6rGa6/tScSbuWg
	+oiY3ycPk2u2i8bHvNfUGdAa0BEkwfz8pl/Z42rg58DoXDmisvjPf4F3bfPv1hy3
	EtN771a5eopr8Bsi3rVECixyuDK2Bx1x9UzrhsEOLiFEPaH9dZ+MrZtC4SQ+DxXs
	v9midA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0yynsa2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jun 2026 13:20:20 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7346c850ec0so514357137.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jun 2026 06:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782393619; x=1782998419; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GjQjuigvKFd+Z+gtUv1havxbgca7I7GsAQ/BjMMTbQk=;
        b=atcpNZN+8lkAjt0PwmUuwTWJPnUEvnXZnOUbuPt2k4hV7h4B7iFeI+Hp10efe4cNpB
         b2aOcSwfIvprWhrFhRuGcFHVrME12y0xgXn2YsnxlwX8bQA34xBT5iwZsMa7oUAcJsy8
         /jUoWv0m210v+tHSuAJQjMjXfeJfoVXhLsjO+GzlP1HP9RWJ88gUROKCmVgZJNhkyIzD
         Kfs52xGjcU803NuVZuARZ94vonSisJSwN41LF9m+ww/go59/xc4mFQx0JnKde/6FVGFf
         /ACJ/L/FZDmRfppL6ZdwrSbwMdh5o275ulw8Tg4kgMShFS7Vt5G34HPgCN48CKzwJJ1D
         wm6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782393619; x=1782998419;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GjQjuigvKFd+Z+gtUv1havxbgca7I7GsAQ/BjMMTbQk=;
        b=AFp+Y/v5qZj0j0GIXFUXWcGpjMYQhH7IhPHOUo9sVj0dRMy+g//sVKQo80xG8xuhCv
         EQ3C9T0T5LKg6Q8+R2W48KKZxLial0PH3joUCD6u/Drhqlrj01mEosjCh1cqsNjojmIt
         gXaYZKTe8LaNHI0euZtewWFTi7I45Bos7bQ0c8nvnSWegbwiHx9rf6lLZ1PYqZJ0aIpd
         nsXMqrwLPJo01QZpCL8PVb2m3c0E4VrRhovgiGIsJ2xSnQlGBo55lifT4UdZzIpryk6A
         SO0U+5TWQw47FsBHHDEwuQ51lsOEIjAJBF9IXqc5n2JMjoucOL8dnMYZYnT3/vWtWnQ4
         1HNg==
X-Forwarded-Encrypted: i=1; AHgh+Rrk69pF3+EWq51muvoATJifjD8NofpCeK5mO98pC+ZfH1hQ1CRSX5Yej3q+XQFZ2qPwFtOye76EGUn7SgV5YXRVWUxv@vger.kernel.org
X-Gm-Message-State: AOJu0YyX+6TU4MfmnewXFuOfQuizWWAs7OhirrV60N8Ee6WgmZYRuI21
	kTAekNCog+Ijon/xqSkco0WBNN/M1h0mpZ+cFZ0OS9WNcaiBLEl8shG1vq4lMwHPSSjDBcHU6RZ
	QxE+ORb4XAOJZ6tVN/A1aucs7jrqd4390JxqKcfsKF1HYNYTIHxyBVxQBVBTRYAo4ufHkA+Y7Xf
	7X
X-Gm-Gg: AfdE7clF63jOPQMB2/SFg50x4obi0Si8qe9vbPYF/snXrLvmB41SoH5CY9ZlefyFcGA
	0wi4KocBu/VS9+deJpXmGiEIvZeKBu0Zxt3IWf34ONKDRmFESYL9ETbMq1LilC0l9UsnJrTECFn
	br4vHmI24/nGZKLBgGM0asQNzAgamKbdzFkHQtaTqJk9V/CyaspPkLTPv8sJxWDrF0sQY7Wjd0t
	z8OZQ+My2bwcXIPCfb3Na3aw0t02Siez8pMC6EjVpBT9oyxoplWcCBfdRlJZ2jSN+4SF+g6xarZ
	kID2uIzSxJnNx28LR1j4zqGeyyfhPaYN1Tx4OCWuX7tWSCu8cjNm8TcD+4+Z6RjoldFHnwk/aMQ
	Y1YojMtYgMavfLHFLUYgsm1D3JZgtKcbtPn8lW0GxAy/AV2AKvDqTLUmea64zXAVxneNR6ls=
X-Received: by 2002:a05:6102:80aa:b0:650:94b2:b209 with SMTP id ada2fe7eead31-73433e36b9amr1057818137.4.1782393619057;
        Thu, 25 Jun 2026 06:20:19 -0700 (PDT)
X-Received: by 2002:a05:6102:80aa:b0:650:94b2:b209 with SMTP id ada2fe7eead31-73433e36b9amr1057791137.4.1782393618631;
        Thu, 25 Jun 2026 06:20:18 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:fce5:aedd:3ea4:36f? ([2a05:6e02:1041:c10:fce5:aedd:3ea4:36f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c221d93cdsm19126758f8f.18.2026.06.25.06.20.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 06:20:17 -0700 (PDT)
Message-ID: <638eebb6-c03e-4071-8aad-a5da30ddfe3d@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 15:20:15 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] arm64: dts: qcom: x1e78100-t14s: Add thermal zones
 for keyboard skin and charging sensors
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, sre@kernel.org,
        hansg@kernel.org, ilpo.jarvinen@linux.intel.com, linux@roeck-us.net,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
 <20260624210825.264454-4-daniel.lezcano@oss.qualcomm.com>
 <ea233160-505d-496d-a321-dc23e7f69d80@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <ea233160-505d-496d-a321-dc23e7f69d80@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDExNCBTYWx0ZWRfXzTLItH2OvJCf
 iqVZ7Pi7nwI2BAvblLfEvpL78lKiK1IJac6wUfix5APW2YhiA/cZJwGCpYB/kK9GquJ8+FAAHg/
 KS3Q1nBwMx5N+hVn837sjQX0rjY/R15AChypnOa+Sexe3kiMFuvcFmJJGJf5vpjZnGDrKDulj0p
 k7RBrONn0twZ8/lUfzepXqMrFd4c68eqNt8szftFCREMyvMP7eIQNBF4+W+TxNfhWVG5YL3RRio
 QvtO+oZpk57JqGNmxC95+Kmi9F4ffPdww7TIuES7KE5iqG3SPBEIhVgV9eEFNLkvAvuGA6lX2ro
 npRYtEssooD8MZqmzUAlr30XGLQmmiZs9udgSyOqi4wbszLBbMq9FLClHdVQcgs8rMGIxYz9r4u
 xDCssF2/3E/FYB7fv28gcSKbSph8YMlPHtlyeE7XNDinO63Q5A8BWAZIa+K4V72e5SlhJt22N4m
 L/JL/LRRHUxLMantVLQ==
X-Authority-Analysis: v=2.4 cv=aoyCzyZV c=1 sm=1 tr=0 ts=6a3d2b14 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=jUCef7gqdSedP1EdzSYA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: jrHh8ibGXlburoAvvWvccDHHmbqFW23W
X-Proofpoint-GUID: jrHh8ibGXlburoAvvWvccDHHmbqFW23W
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDExNCBTYWx0ZWRfX07+k336mZzWo
 BeP2ViPC9/ui8twOCtmuv9i2xz562n/HvfSUi94NXwcNrCPMHmPw2f/Q/jrO6j0wDL5Q3lf42sp
 dqcrbsK+hNFErGKveNBuZ7iEy77fvXU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250114

On 6/25/26 13:36, Konrad Dybcio wrote:
> On 6/24/26 11:08 PM, Daniel Lezcano wrote:
>> Add thermal zone descriptions for the keyboard skin temperature and
>> battery charging circuitry sensors exposed by the embedded controller.
>>
>> Expose the EC as a thermal sensor provider and define two thermal zones
>> using the temperatures reported by the EC:
>>
>>    - a keyboard skin temperature zone with passive and hot trip points,
>>    - a charging circuitry temperature zone with multiple passive trip
>>      points and CPU frequency mitigation levels.
>>
>> The charging thermal zone progressively throttles the different CPU
>> clusters as the charging circuitry temperature rises and triggers a hot
>> condition at the highest trip point.
>>
>> This provides thermal framework integration for the EC temperature
>> sensors and enables platform thermal management through standard thermal
>> zone definitions.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +	ec-charging-thermal {
>> +		polling-delay = <5000>;
>> +		polling-delay-passive = <2000>;
>> +
>> +		thermal-sensors = <&ec 3>;
>> +
>> +		trips {
>> +			psv0: trip-point0 {
> 
> "ec_charging_tripN", please - these labels are file-wide, so it's
> better if they're not overly short
> 
>> +				temperature = <55000>;
>> +				hysteresis = <0>;
>> +				type = "passive";
>> +			};
>> +
>> +			alert0: trip-point1 {
>> +				temperature = <63000>;
>> +				hysteresis = <0>;
>> +				type = "hot";
>> +			};
>> +		};
>> +
>> +		cooling-maps {
>> +			map0 {
>> +				trip = <&psv0>;
>> +				cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
>> +						 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>> +
>> +			};
> 
> Stray \n above, might also possibly want to throttle the GPU.

At this point, I don't think GPU throttling is needed

