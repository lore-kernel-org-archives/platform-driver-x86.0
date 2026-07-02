Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDBE477E24
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 Jul 2026 12:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782994661; cv=none; b=pcVRRup3d0/qeQy8Ih+42wGLYzDU3ogmKKx/AQl5vi3gxhRPuU2uwM49CTs87/ImW2sBiKuHNC6eg3D0MaK7LG5K/I1GCqG4kxYTe3drU+CkraI2HErxuJpaMeJ+4xYP8Ys61LeXz9YEUwOzu82/JApUSwxm5oD90i6R7ujjzVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782994661; c=relaxed/simple;
	bh=d2zjVFisejDw5DlWK3026+2i4XLfiQgYGnyp8NqtcPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QXbrMjf5so9UeyZAy9hcLt3eJSUzZjiM+Yza+ix4MEwnuGArBZMbnsfFLiJ+hXUrzWPFYfXbtViS9rKol+rz2zgbey7MbudKcbGlWwjJI/daa+g9AnwTNQ6K9zqZ2fL/S3Hyf2UhRfYYjjp9ebXGJ8br381UL7EZRvtwTFe7Yaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k/7bB8IL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b1H3iuTJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k/7bB8IL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b1H3iuTJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629KKS94115146
	for <platform-driver-x86@vger.kernel.org>; Thu, 2 Jul 2026 12:17:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xgLLk6Qbqh+v+ks65vVMnB0B2zxHQjGcUHKVyyKq4iA=; b=k/7bB8ILtTDhbbU+
	q/jbwd4Ps+xgqOjcsez/it8MIa44mRiNh03RNDg+3t824EkvbbLt9A3v3UD4dbLE
	ssra3Hs3MkmNwczHwFX0jO86vm4DHoU3WzVFwAOEN53E+OA0DauuAtiIT/LrOTCt
	4ftFjypqoD/H7SPlkJRGGbJ2TnGYKNH5GBLsyNLuQpsN3M3rx1ffRMYQ96QNJ/Ib
	FZhmndeor/IuBW0f5ljHCmclwQkVajnNoKO+NKuaXdoqbP3MA/437fgxSJw7uD1K
	iPtdVLhU2E3Ly3j1HpDeuLIHSB21e8rBJwO/JrGaxsdWL/cqap9UKTZq33QT5KMY
	dFM8Lw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n940ny6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 02 Jul 2026 12:17:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfe75b7dbso4643431cf.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Jul 2026 05:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782994658; x=1783599458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xgLLk6Qbqh+v+ks65vVMnB0B2zxHQjGcUHKVyyKq4iA=;
        b=b1H3iuTJRjEcV2KD+gpqTKfT3QlVRAIXsduUOCS4ojpuOdGVx1g3td532a0s5WInp7
         2jUvWxaheRZ2+oxzIeqdM4Kkuy7nJMNm7ul+X0Ebm7sf8XSUikUaGr/K9p2HluOqDT1A
         y37SP6hIOXCXJUu9ucQbTbz0Z3RVadWo/5ytXP4rY8RuySJb8MEkEjrWAFmoTuedNEvt
         j6w+3qdLttWex15pr/I8QZJqBbCwA9J/WbED7P94K+U9Rjx5ij04idx8jAP4mdiL5KtK
         DGLlsSBHeUZ1nlbWlyIu+smbAQF9iDjw0E1TciUoNpODEHMDRKtxi1tvwl7o15/nIE0O
         koUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782994658; x=1783599458;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xgLLk6Qbqh+v+ks65vVMnB0B2zxHQjGcUHKVyyKq4iA=;
        b=f68lkxpg9hCOVTsBKSn+gRerq3Q6l5O2nQ0IxHDR9xZOr0em5EzNS8Sp7J19l/lHhC
         4UkFhvdqfkLfNRBXoV43JAVPxoyA+f2/2H3TUrKvft3UUBGVTO7cHpL5Kgkrd8ZFporG
         qtdUKh4cwNB6YFv4n5o59MyiG6O9g076XEOwYpGMFVJXx6AdhUVpHQNfVN0c+xO8I3Wr
         NO6k7vh7shSaQJHO7fEyOLjcGpenjX2Jlq3V7AmIutd+91RZ1XXy7TmGOr3wJg2gJKJG
         aghoP3BCyySEY99s5FOLZ4C7RN4XwNIjlaBboeaqbsvDHKQ1SjVNrFsns0P6MfW2LbnC
         owYQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Fkyv26qqD+5lsI8s7fdlj5tL2/HJSy4rk9jSDYiS/yKaqnpePBfHrte7xV0y20YstIifmzEDr1SC0Yd0SKn/hy1co@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2ulOZxBm6fRNdZlFsQc3aQPm8oi8sppc3ld6G75EYPTfqC33v
	jaKcCAWjiXUcyVrJsoecdl6Q+gXfQiri525SR+UmeovzNh9/4xgXGrTKLpdg7JK2l2Ci8h/wRcv
	Yuna7451Wd3WiP2qpAg38IhG5iORv8jSJTLisvGpcw/EhxprltYDVvdxFmZU06YvVHUF86WHC4u
	l0
X-Gm-Gg: AfdE7cmlwkXtZ/hTvChrP9sc6YH2WCAMo2f8Ze49t9osM5IY/GI5CDXXNpxGiVReXko
	36bqVAla5kAce9rZM+jHq8aRrqvmxDEcCD83g4TWe8P/QXGIS+lV+Xg2FxUdCxTOkssKTdEMs90
	isrnwbxe00VzDMQjj+pvqqCUOlNrChv/7gY0sygNeT8Ddrix4j2tUX0F1tWykMSFfhFT15Vi5PA
	tx/QJWgXwPLqYxF+6+gyAe7HFtAeK9zSAR7FjfP3PsZ/A+aaT5oFwlB9ZnK2Jnika18SZBpu/Hs
	4b1ozE98GG+0z5s0RQY1GzgeGfjIZwSCF4aVwHW12E5T/tM35W3dp6KH/yo9GmAtT+XKGHrm6XQ
	a+iWrOlfZvQcVHDhc+jtNgAMKHG9+nlnAIHI=
X-Received: by 2002:ac8:5a86:0:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-51c26a5611bmr48830431cf.2.1782994657841;
        Thu, 02 Jul 2026 05:17:37 -0700 (PDT)
X-Received: by 2002:ac8:5a86:0:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-51c26a5611bmr48829951cf.2.1782994657207;
        Thu, 02 Jul 2026 05:17:37 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6091785sm122892566b.16.2026.07.02.05.17.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 05:17:36 -0700 (PDT)
Message-ID: <6bcfcd62-d831-4262-9ce9-66e12a72b3f2@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 14:17:31 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: x1e78100-t14s: Add thermal zones
 for keyboard skin and charging sensors
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, sre@kernel.org,
        hansg@kernel.org, ilpo.jarvinen@linux.intel.com, linux@roeck-us.net,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260701103714.22583-1-daniel.lezcano@oss.qualcomm.com>
 <20260701103714.22583-3-daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260701103714.22583-3-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEyOCBTYWx0ZWRfX5N9EWr0nUdO6
 GO03exkjIzmt0a4v5u07ze4wqPde9k3qER7nLYvCwyXBvnXNhpzFEaUoWuTi44PyuHs/f6EHG3L
 ye+sbE0CU+inbGMvkP1GMdUhN19RT/z+bzTI+CKvd1tlk01kPZAxZCNKcRjxuXy2TpbYJMgkvKM
 7zaS/mLrlYP2m4628tXdeCgbqp8dgiVj3IQpSDq0rC6y3KCJ+7D7W51ETBMx4ROVVK704hAw3DC
 jzJMC2IaKYhjI0fQ0R3/oKYp3jOeldZWFy0mS/5VzLLlDV44z2KCUDnYl1OxxX2pT65n8hZKcDm
 Lh89MBJrJUGX69MdR4V2QKqchtQYYLqrpTDS81C6y9YOy7tjPPGhk8q7rLSGoK555cLh9pDDHWM
 NTl1DvXBery4bzteYCiPs4JB+XVOumrjGa7niOgxLWr/VpG5q+vL5xsrWXHIzHq+s7lehbLTQtA
 dbkGCOR8rgUtN6Sc4Qg==
X-Authority-Analysis: v=2.4 cv=Lv+iDHdc c=1 sm=1 tr=0 ts=6a4656e2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=4cq-bv2Ru7092N9bbaEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: y340VW-vijDm-3BGSHF0SomZzZtEo-Mf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEyOCBTYWx0ZWRfXwbETF1cYeT+o
 bVUoWr+rMRfA3nvv/f/N8/HxWqMZdEj1bDRt+iKe/f8z4Pho8ZqrzWP4uf0MQyqbB/nEEpd4wqY
 H0yfyREZBZoqOYg7dRsoFl/BjF++w9w=
X-Proofpoint-GUID: y340VW-vijDm-3BGSHF0SomZzZtEo-Mf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020128

On 7/1/26 12:37 PM, Daniel Lezcano wrote:
> The Lenovo ThinkPad T14s embedded controller exposes several platform
> temperature sensors that are already used by the firmware for thermal
> management.
> 
> Expose the EC as a thermal sensor provider and describe the keyboard
> skin and charging circuitry sensors as thermal zones in the device
> tree.

[...]

> +&thermal_zones {
> +	ec-keyboard-thermal {
> +		polling-delay = <5000>;
> +		polling-delay-passive = <1000>;
> +
> +		thermal-sensors = <&ec 1>;

Do you think it'd be worth to add dt-bindings defines to avoid raw
numbers here?

[...]

> +		cooling-maps {
> +			map0 {
> +				trip = <&ec_charging_psv0>;
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
> +			};
> +		};
> +
> +	};

Stray \n above

Otherwise:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

