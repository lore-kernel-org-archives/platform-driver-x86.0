Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E37D3E717D
	for <platform-driver-x86@vger.kernel.org>; Tue, 14 Apr 2026 14:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776175947; cv=none; b=jryE6MxBs7vO69vWGGKI4cJtevgw1xgGIqAOR/ZIUEKIhUVTzXYwo0NFPZii3kI++dilkbcS5Y56xv4C1GewswlMMZz1oVLyXqAYbDKSOF9ZKnKcGe3fFHX4aCTRNaRbshRyxDLnE9R7sKNLPsglbAPTSQqJAER1R34p71261/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776175947; c=relaxed/simple;
	bh=o3EVBk8mY+1bKgUj0lLzcwLTpgKFyLa2LJ1AJZKVGIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fwZZAz/LoeddwwwKqDq0CfdMWBOdBZ9//Y5fNYYFLXSPeopOBlNy3IJ1xBPCm/oY4+5jQvzY14WXHrNm6ElvFFkn/svmNR0H2ky4sxNWUjwRPnesipgRQI1x/qVtMWSBqtUfhjswZYtIIMKCGURAlx6VpwLek5XvkQ0wMfej+PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=go8QWPNO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SC6eJfWx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="go8QWPNO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SC6eJfWx"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EA44Gn029994
	for <platform-driver-x86@vger.kernel.org>; Tue, 14 Apr 2026 14:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ToFpVHJZk/lUK9UX1+SEAdhDulwgtbUtp6ILgHqAeZ4=; b=go8QWPNOH6CjlA7R
	IcndhXDMKBYnqA00x224TTRgRz0xrvXM8dsPV2vBEu0KLrD0YXPSptEdC/+inPoU
	yDdn8x7o2+wvebgEzQ5SwqtSpSqoSYdg3md0kHEooakQvON4eDKkhr9pBr0hAkhj
	gfUDyAw8EMgIkyjEhdqvQfuFPXO56mGntYePCP6MIM9UEy/SVFDob2o/LHXapIIF
	28/6yWRSTASvH7AwPXxqsMgUBC+QF5SGLtQi/JQnWQ9ZdOfyVIuoNeX7ficrFKL4
	9+aY0K/noHFqZXh7PfGRA93RiXmOCo5tRQXab3slEjjDU3Qk9+FlX7dbelrh3Ptw
	cbauSw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhkgmgs5k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 14 Apr 2026 14:12:24 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95192ee0b2bso202505241.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Apr 2026 07:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776175944; x=1776780744; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ToFpVHJZk/lUK9UX1+SEAdhDulwgtbUtp6ILgHqAeZ4=;
        b=SC6eJfWxfsAa1C71EwP3l1Bu7+jt5BNk7VX2yAy77B7R/5bmEUkMtlgjA+6jEFct8W
         kSNiSBK9Tm2SMb6uKpiJvRmctC2X3L0Fo+peJlMDQzA2Wqj+o3XrfW6lB7jUE4gwnTt2
         hWj+rOnMaQrKnmoPbTX1evyB+tq5mzKk11/7vNYYwX4/lxeOm/UEfhrQHc9K/HN4QsxE
         cTWNVloMJ+gR0M+A6BXh1rLqeHmk88UwG0ePY7N/+KdsQT1pIdxIMA8RIqSBh324aGBf
         hI1KBjVBbsJ6OfPEIQdVvrQG9dFYCYhOnu/QEoAYlxnUPAwXND0SxvSW+KB3aHqL7u8s
         A2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776175944; x=1776780744;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ToFpVHJZk/lUK9UX1+SEAdhDulwgtbUtp6ILgHqAeZ4=;
        b=Km5nVnGPEfD3TIg8CkKJQa73V4xefxu66EIQtzb10KFe4Oua/hDaZzEOyou/Ywy97N
         kVtmkT1iYbXTbW3qES3nbK01OdQ/UO4cJ4agl+bz0o9ly4qXODA21nr8TR5E0z+PfQiY
         hW2Xl8SFd9FwlHyRckv6dPDaiLt5nTBb79+GIJWPi+9MBPzdS+xgd6TMqs+DnUpHhy8j
         5VWkKIXT7hVeCPdeYPpbjjHbeeC6tWjj+UQj/OrIszf5Lp7JTKyzrHEBee7bVPWTSiF2
         AbeH+B/HGjHU9NOhKLRJKRwEQ6IrmkNn3UQafniZuDVbCf8JRACpzf8eYF/9QcDHLy/a
         O2Eg==
X-Forwarded-Encrypted: i=1; AFNElJ9MLKje78yuwiSTfyqrzmZ+HXSDA8fabvip+B+Ynf6NmGnCrL85BXhXYM1uTp74UhpES3E2FaznMJh4yTjbUnT9M8eJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzgFKoaH+37kjyJL5Tj6MK9X/vGYrLZgX6UkZafZOle+WwJxeds
	dIKgStBIHMdQefk6EXuCDUrXmrZRzERyR0xibXf+FK4fSrrD9Sbev9T+Z2OKDJfK0K7WH35NhHJ
	Aqlmv8Shu+KY5qKtui3FgHi1gbn8OTCV91NxWL82e9PGmIN0xRdpVoB1DZpIppTYnn0m7DPgu44
	8U
X-Gm-Gg: AeBDiesRI0vdKtXDh/vPu/fg4GlBVG5pIRV7LWy7BgsoMEeSE7IGgDYlxgvANelbef5
	QB7pvherUz6x8nIql8T7aeTG3W5yoRH47lDMx4S+Q8oVkXpT/XnDsox5xBmD/cpiG/wcTeduQwS
	+aVE4vyGZx4Qj2LcPSZt0CHqMG8dO8mARMUe8rSL8M4XSyN0sgYDc1AOm5t7ur3wuvFwL9IeaTj
	rI8kYj0NIelJXGbHZ3ZjMZK5YRND3DoqjER8j4htUMAhW1pOl/IzQEk1kArPSrckKPknhOTgJYx
	9V026bAjx3yMHAnzasCBfkCoZsBxnZzQcoFJ2bRByZTEFTyZAZOiGZpgTk6tAm3dK5edOWwyqHu
	APLeUzuMdD9U8dGrP2CScJWmB+zCsVCWU8p/48cfc1PMC+iJgmX6Nis+eJTtJasshRWX6XJ7yqv
	/9osK7OmFgPVEyOg==
X-Received: by 2002:a05:6122:84b:b0:56f:5b59:5226 with SMTP id 71dfb90a1353d-56f5b59611emr1685458e0c.3.1776175943806;
        Tue, 14 Apr 2026 07:12:23 -0700 (PDT)
X-Received: by 2002:a05:6122:84b:b0:56f:5b59:5226 with SMTP id 71dfb90a1353d-56f5b59611emr1685414e0c.3.1776175943213;
        Tue, 14 Apr 2026 07:12:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6db92792sm393171666b.0.2026.04.14.07.12.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 07:12:22 -0700 (PDT)
Message-ID: <38233a55-d313-4ad1-ad5b-b33011f2d345@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 16:12:19 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: x1e80100-dell-xps13-9345:
 introduce EC
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Tobias Heider <tobias.heider@canonical.com>,
        Val Packett <val@packett.cool>
References: <20260404-dell-xps-9345-ec-v2-0-c977c3caa81f@vinarskis.com>
 <20260404-dell-xps-9345-ec-v2-4-c977c3caa81f@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260404-dell-xps-9345-ec-v2-4-c977c3caa81f@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDEzMyBTYWx0ZWRfX018mZEnnDmPr
 JprYdtCGb6iav/kgZwBQQb7+xAW7JxQstXCxUvRYRDnEPcFj3hNEpqPJLTnRdlnrhUOLoCr0dMa
 oaCuY2BMU9BDc4tusQcGhNcCrgOeUr7pY4koGlfYm47eQVQMsENn8So5gO5kQhDva3i6jpacpRx
 SMQxAH+XQOPWYwT8xXKcgmapnfVBIzHzAkJ5pLqnrZMIlYLZ5z3rzoHttfHkGaJ+I+Hw+Ba5vfi
 FWyrVSYHELnyjd+FadCogBHbBeC3KMgX/XIIY8EAkS3kMUaK6Nhmr8hCVw0nLfuRZ2/XsnpvSEX
 ZxZpKONSnT+T/JgcByTGrst7gb87tbdNBRi9ip31NQBlQ4k8TujaLoZffBoa1G4WPNsMgMB5L1X
 Pn9bBvMm1sEHdMFiG0Xwyx4/VMs6NurxIZYrF3Cq1lgn4YIu8Hq3p0t2W1WSK4Ac9yb5WLm0WAu
 JxHUPIZtZjdeHUkoDPg==
X-Proofpoint-ORIG-GUID: P4MrEEZ_dbXGwYeTRmAgWavfhk8OgOfK
X-Proofpoint-GUID: P4MrEEZ_dbXGwYeTRmAgWavfhk8OgOfK
X-Authority-Analysis: v=2.4 cv=HJLz0Itv c=1 sm=1 tr=0 ts=69de4b48 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=I76Qk8w-AAAA:8 a=BDX-M9UYCxStvK4FQfUA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140133

On 4/4/26 2:55 PM, Aleksandrs Vinarskis wrote:
> Describe embedded controller, its interrupt and required thermal zones.
> Add EC's reset GPIO to reserved range, as triggering it during device
> operation leads to unrecoverable and unusable state.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---

[...]

> +	ec_int_n_default: ec-int-n-state {
> +		pins = "gpio66";
> +		function = "gpio";
> +		bias-disable;

Did you check what Windows configures here? bias-pull-up would be
customary for active-low interrupts (although there may be a
separate PU resistor connected too)

Konrad
