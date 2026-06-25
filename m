Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716F23D903B
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jun 2026 11:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782387411; cv=none; b=qTRbF+B+TcatwTv0PYy6lD4RUO6sTE1AXu7ChGZPhtWba0zznzE5GUqoUxXk7cDybBXIhGjKf5YjXs+xFv2Vx+QpuvScbNGkiOQTlkVusq34VYi3zbMLqSVjqwSOKcyLqAOi2pGLZ+8Kt7hzFcwateEYcyNmdxbiyukm6VjlUq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782387411; c=relaxed/simple;
	bh=EKoghlk8RH2zNWov+Ldx9Bakuy2XIl3xFyMtc1/ag+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ft4clnt3FowIBFF8IbJ52H3uGwBSdRbojn/hIfLrOu5CsY7ygZLMk2jipEphb3S76tzm07wrG+YVf20GgP1RTVUdGuPpZ6MSYkXSd9bWxABtCfHRPtv3S6Rkv711hgWVP/DeA0Y6tqyAaIaJNlEChANbkE1r4Y1YpRv4zO58Euc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X2gd777n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WtpATyup; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X2gd777n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WtpATyup"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9jvwW026137
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jun 2026 11:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WVY/1XuYxAJzExKXdHQeGSKvfHtqz93hoztP85UA33I=; b=X2gd777n8egnysoz
	xelcUMjWxePk5DhDwNcAZk/WsoU7MGigh7XE76wS3sA9ohFY5KTFd6MACOV/mrny
	iv7u9KBsa2bl1NI/oLOhoOw0Vqp//8tlizfWLCidjcD14MhY5xG+WZcmKx37CzkO
	yqFt84dhhTY2Wt7JHNOf7VvG+9GU9DjKVGD4GZxDMKQct5Vd7NbGusMzUGY1gqNK
	2XeEXfcDqf17zhnIb6E4Lf3rcGnOy/cLftKGXq80H/iKbMiukCDyW1KJHFyjm+XC
	bSIY+sJW7htd6od9SreojJ8QKtHRj7iGCyEMsNSIWERiv+QyjhyA4Zn7bYt0+pwL
	+UppEw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0tspt5ge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jun 2026 11:36:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5198e72249dso2019641cf.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jun 2026 04:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782387408; x=1782992208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WVY/1XuYxAJzExKXdHQeGSKvfHtqz93hoztP85UA33I=;
        b=WtpATyupeDwKW4nuq5eBTjOvmO5zFM96eME5bohugOJxnHJHYnNf2dign71pS47Lx/
         NiXU2zPcBwY2cRBh92cn3d1jXTxp/hQCwPaf0+9H2+eLRs0nVqt/a5dEDp5rp6J08c8K
         ea+LGb+B8o3bitp2xJbai08dFPsYN5pADQMpJPUPyrnq0cliYcSoYAnu2ymTYohT9+UM
         uaAT4xpyKaojUxLeVAQo5kZOs5jPVoy4Grj2kweVQihcTfdOfhtqz+4YNzGKGVuv0wUN
         D8GTDhZmqZMFtjdLaHIywAazfBVzF0nhkFk/tK/ORJaOg5+MNuXmS4C6m6Kx/VYgh8gG
         Pl/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782387408; x=1782992208;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WVY/1XuYxAJzExKXdHQeGSKvfHtqz93hoztP85UA33I=;
        b=QYsn3VE1T/BtSLFtSchAR4zrW5CPjDX8Al4FYSGa6XIJQCI/wJJqF2cIy5E95c3tfb
         Kp2u6JnL+SjQBv0t8Q/SwhbqZiAA0KbVAqJM+lw64+PbX+CYLFBZ9rWoSXQFfvS3i7WU
         VhrU0mtLwF55aSkhA71IxDwqPG+b99l0NlLdYAoCq3wVD/KP5THmDIFZ/saFCR/rG9Us
         BnVuRsuHuWuRCXRd/8f05ch+NFkbaunYw7QPiWHsqvF62V4gWpLiYUTtu3Hys98h/oOY
         OwpG7jsdlIL7gRZK/HDfwGfIYSSUggUnMINWNA3qGsR6r/YUPztOmyNrBAw040zmizDc
         YkXw==
X-Forwarded-Encrypted: i=1; AFNElJ+z7ocDl1Fq/apI46hdGtuMQCMd0lIgI1jZuehgOprGBqDSmejibRofTtmRckeBNRIse9n1kfH8wdcAvZjoTk+6+Hda@vger.kernel.org
X-Gm-Message-State: AOJu0YwCmKOCInrvk0LlYTe5Xmq0F2ufAobVpOYH67Q93t8e9PFAGGXU
	ZBKGDYb6z/g2JOux/THRy2qt26e93LSI4beJrmt8FSrK3H7peqoX3aIc4sdu6McbkrLMezbm7NT
	t+2ldhL94W+1lnnq9HdqfcSf0ftEvqcl4shagC5w9O0l+53P7gAd1dYPlRUyVb6ZIT5UjVQ6jSa
	77
X-Gm-Gg: AfdE7cn1DBX2e26D7MAzBUh4M4JkJ5QtGDiTwTmYCm0VjwxmFKI+t8ND2alaw1meDX6
	Vpas9PMkpCW3Blolc53dZx8kmR+d3HYiKGBKF8lGi1jT8drzK0OpJfZzgeWHgQwFCBQdld1Po4j
	fOUj4gBQoaetOcqrR8XGk1QR5VN6jpoYsVOFN5nwQF9bMzQv9Lo15heJ6zEPo85RxrAGMwuZ+ml
	7mC4vNNZLF0iekDYZ77P2mpZlF6q1bUhZZKPH/KiWs9L4/yD+NwzhmU6ULwzaQfmeA6NvCvBFDs
	Ar+5PCbvs32O7NDHydEX+oA+CrJ6+96DrkFpNKm1dE2DNsuKYT6wMZTP0jTp3Q3NlM/jz3Hpdw0
	rfzEKpSXJ4CbbJOj80afi/q8MdvrVrdDrKN0=
X-Received: by 2002:ac8:57c5:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-51a72a47ba5mr15818761cf.3.1782387407664;
        Thu, 25 Jun 2026 04:36:47 -0700 (PDT)
X-Received: by 2002:ac8:57c5:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-51a72a47ba5mr15818501cf.3.1782387407280;
        Thu, 25 Jun 2026 04:36:47 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbed6c78sm161489066b.60.2026.06.25.04.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 04:36:46 -0700 (PDT)
Message-ID: <ea233160-505d-496d-a321-dc23e7f69d80@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 13:36:44 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] arm64: dts: qcom: x1e78100-t14s: Add thermal zones
 for keyboard skin and charging sensors
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, sre@kernel.org,
        hansg@kernel.org, ilpo.jarvinen@linux.intel.com, linux@roeck-us.net,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
 <20260624210825.264454-4-daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260624210825.264454-4-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OL8XGyaB c=1 sm=1 tr=0 ts=6a3d12d0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=68P_60IqByrghkTM5uUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA5OSBTYWx0ZWRfXzT0kjIlKOKgd
 u7cD8Fr1bSYwdydRseN7ChSfDXiKow7IYj+jgfc5rbpxmbSb7io35HiYX41cNpalxUpCiQDN0mu
 UhQ8m7twYB23uFZ7L2O5pe46+oHe/YihWi70KDawbuK1mJt16MfG4AlNuhdDq/Ax1x3cFlZ6j6K
 Q37jJEvsiczNAqmu/Yi8puep0sx8a4jpRWinDG1GmkQMxxppz9cD4aOi7AyXh7PU5Vclf60UhCa
 WXS+F7Q8j0mR6MOr15WqRObY47A1NHcEh9Se8YNQzAWDRtoDG73aW39BsVYvFD4CI646xlWBiSa
 AZ/feYZgxrpituAsVe4KS8+/VuCQi4d37oBw3vZznc3zr1O4TqjB1ScvVAtQRR0BhmU/zy1ICdU
 1SCM90qNakvi30f27kArtRa0BlcbWdOWKpc50sDlKvJSt4FMeHO3sQwy8RqLwSxIvjAJ353s64U
 X1fRb+WO2BvGm1faaqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA5OSBTYWx0ZWRfX6CnZ/lZO0MiO
 5YGnEQnDBkIMki3+knu0sGjpUlOcmszqEwWYJciY3p8Lm+A+fEie04r197bcmFfVFrSq66MZfoR
 CtGPJNMBKx8Hh5wFWBxSDZClOnzGVro=
X-Proofpoint-ORIG-GUID: QDwC9VEZ6hR94RIn0ssyFLTcYYY-vNTd
X-Proofpoint-GUID: QDwC9VEZ6hR94RIn0ssyFLTcYYY-vNTd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1011 malwarescore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250099

On 6/24/26 11:08 PM, Daniel Lezcano wrote:
> Add thermal zone descriptions for the keyboard skin temperature and
> battery charging circuitry sensors exposed by the embedded controller.
> 
> Expose the EC as a thermal sensor provider and define two thermal zones
> using the temperatures reported by the EC:
> 
>   - a keyboard skin temperature zone with passive and hot trip points,
>   - a charging circuitry temperature zone with multiple passive trip
>     points and CPU frequency mitigation levels.
> 
> The charging thermal zone progressively throttles the different CPU
> clusters as the charging circuitry temperature rises and triggers a hot
> condition at the highest trip point.
> 
> This provides thermal framework integration for the EC temperature
> sensors and enables platform thermal management through standard thermal
> zone definitions.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---

[...]

> +	ec-charging-thermal {
> +		polling-delay = <5000>;
> +		polling-delay-passive = <2000>;
> +
> +		thermal-sensors = <&ec 3>;
> +
> +		trips {
> +			psv0: trip-point0 {

"ec_charging_tripN", please - these labels are file-wide, so it's
better if they're not overly short

> +				temperature = <55000>;
> +				hysteresis = <0>;
> +				type = "passive";
> +			};
> +
> +			alert0: trip-point1 {
> +				temperature = <63000>;
> +				hysteresis = <0>;
> +				type = "hot";
> +			};
> +		};
> +
> +		cooling-maps {
> +			map0 {
> +				trip = <&psv0>;
> +				cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +
> +			};

Stray \n above, might also possibly want to throttle the GPU.
I don't know.

Konrad
