Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548813806D4
	for <platform-driver-x86@vger.kernel.org>; Wed,  1 Apr 2026 09:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775035151; cv=none; b=TGTV+KT9z28RsyXuQOQKYtY0Ei6miUHghSHJPgnCeu6rbVEzA3jnitRJRloTIzIB3zzQMGuRIs0Fmm238gqAoj7eTnQlsYdx6iV3bzN93vZwd9HNa8IXXUqCRK43N58nOVfJ74U7LW6iPBFxZrEdf64SSzChdy2VDzHMbNDrSHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775035151; c=relaxed/simple;
	bh=mxFI3JYDZcuOP5+ZuhPs0a6U6SGrGkPOvDAyzxjAwHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lS+0f5In206GEXAPGV5wT63zi1o/f9nG8RoQv7ZQjPKgpKOSl/FuzgLfWNvA+I7GIy28oF3EwQwI3zGhP9dzuOxfPEfUGAiRyPjcFJ5FzHrRkc+H6oBG9GAgb7ItKaSLRdpJHpMdukh3jc1hLI4kFD2Bi+3pWo8MSG+U4GWpvl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j031HHt3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R8BaDYuk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j031HHt3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R8BaDYuk"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317Wb9E3081358
	for <platform-driver-x86@vger.kernel.org>; Wed, 1 Apr 2026 09:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QZZ+XwdibV8de8xaJKuLCkQwSZcD03UD8+K/TkNkfxU=; b=j031HHt3tB8/jo9k
	xb99RzalIlu1EbFKvZjtF5Vs7/nqpgiYLekrEB3/ziU37A+DAG36B2aGRXA/sxci
	nTmGLISHInH+DfxJ0BdSNZiJ17E6aAp6FgMrcIu1VV252ld0+aN6lNxw3SfrnRsu
	zsshCW7IGHwddIcawFtAmDIxh4XXZqTzxad1MAkTZPrZbud5Hgvhz4g8V1RIMIls
	jtLFzXHgPFaAmwCQ8TaP1Tsnu+IobBXTa1Joefj70LE55BKS1MYsBkMXaRA6l9MU
	9MB/jOPZMbsVXp8VNZdTU5LGwZZedDYqT1GBwkRGoSvPzHQGyjWO8NxxHwmF4ci7
	cuCvBw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kdku9ct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 01 Apr 2026 09:19:09 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89eadc12c84so19396576d6.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Apr 2026 02:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775035148; x=1775639948; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QZZ+XwdibV8de8xaJKuLCkQwSZcD03UD8+K/TkNkfxU=;
        b=R8BaDYukvptyd9zNbTGJHx/CqsRHbzgmTPAKFFyUUSV/Zy+mT0s247IfWIDIlKoS9M
         DcyakoNAWbM/sRkAt55Zskxu8DWar2Id/l5tvg6+yG1tYBSTY/tFJ/KdgHquCdnbXtl+
         iOxYZXiKs/z42fnHTKBMEXuXkQCPKiqOGJgBpjHjcwybWqs/p7pobq+xjZw8xme2Geo0
         yBfyKFkY74/31jf2kHUZfp7lnsKXMFg2kYgF+6CTWAra1K+vkNoED/acTlPpVoLheFWi
         34ITVNujJ5q5KmPUlvuTza6kY6XPgvLD6bcKgOxB2zf1q1gsOh21/sboRjMPp9NNTYwg
         is9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775035148; x=1775639948;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QZZ+XwdibV8de8xaJKuLCkQwSZcD03UD8+K/TkNkfxU=;
        b=P6pf2Vx9lpwXZfb7SOXFrBhJYfDrVvcdrD8TaxHZUPLEF8reoStItpBymJEOr9zNpJ
         wke5pYtcdxiZq/DCO3JeHtlnR7u+8dFeAR49nSaPdf6SkYwu5hkSphKiZPpwdCskwRC5
         UR/cqZX4w9q9ticRciLpzjseneiLEncxpBayOhgsAAHe4L75mC/I6aYMHmeAOSd+tQ1h
         KJJqH8u2PzoYksuuYs5ce0Ewopg/3DwFSLzbG5uKbUBpquC0xH6NTESg21925Rmoik4J
         Bjft+ec+5rS2jryMEL4ULs5IZu92AfnjDiKu/00KShbaFfAmPMu8eqLB3jDxv56F61I3
         TuOg==
X-Forwarded-Encrypted: i=1; AJvYcCWENkjhlS3w764Nwui4S5c/12yZt9hl7Qnb9Jt0nLo3S7ezyFwrYB4yoyRz8pYNAtnFmUJzpdX1IuZcPuN1dJBFMJzj@vger.kernel.org
X-Gm-Message-State: AOJu0YyNkSzJRn4yemppGPaCeM2hRipg12YajWEyWqXkE7QR0bwyhMTg
	auhhzySWKmeQX1Bv8ydALJX4Qr1YpUfJEJgKSUFDfHHXDdFRXFvUVJdMrjY9JEGk8kDqNve4jQs
	lQYl4eUfkL5QW9aNqDOvkRxUzwsjBQ+9Y7TXQrmbuyOfBrk8WO8WG+vQNEYZXbwMW1min0KPYfK
	yb
X-Gm-Gg: ATEYQzwaFsma/eD3+IFSfDClBI4Ew+qGuEiwRIaS4uQrhrrmzFVHotg5nucKsPx+lK7
	bh8YupCw3nKNpru2efPb16Z5szNmoi7WK/rpeTk8+QOTp2xQdyDqtB6kXnHIdt9j9IMDbz4jzZE
	QPvpORKQahiJkQWwayU9JNIp5a70n1G0FD2Kru2KqcvP5ZaiSZumJSX3+5Pq3TuAwYQ4ql8tUS1
	/cVtNOeK/pru0Eo1wDvBXUks9uw94o5OX9m7810wNOAmG0K6bWn9Df5hPxSgHaLYYpOjQEAOtOV
	+X3eC4OVhB9ywO6Ey6l9gFZKfOUwGghM2u9C/xN6v97j9lTDIgACEDKthw0WJAp2pijRd0KLY8z
	YGeSCGEJMHTuRIGpKDZ9dVgdFOgodu1MhbxA4bswdxbP80hF7nbwzI6DS0Xpi1mPZ03Xecr2aSN
	dbrN4=
X-Received: by 2002:ad4:5c68:0:b0:8a2:2cc3:2764 with SMTP id 6a1803df08f44-8a436f0bb5emr29305476d6.1.1775035148293;
        Wed, 01 Apr 2026 02:19:08 -0700 (PDT)
X-Received: by 2002:ad4:5c68:0:b0:8a2:2cc3:2764 with SMTP id 6a1803df08f44-8a436f0bb5emr29305226d6.1.1775035147829;
        Wed, 01 Apr 2026 02:19:07 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c836d3f31sm30513071fa.3.2026.04.01.02.19.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 02:19:06 -0700 (PDT)
Message-ID: <69db89ba-c917-42f7-81c9-180cb40a738e@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 11:19:03 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: hamoa-pmics: define VADC for
 pmk8550
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
References: <20260401-dell-xps-9345-ec-v1-0-afa5cacd49be@vinarskis.com>
 <20260401-dell-xps-9345-ec-v1-3-afa5cacd49be@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260401-dell-xps-9345-ec-v1-3-afa5cacd49be@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA4MiBTYWx0ZWRfX7K4OrE5zg/8V
 iAQ6mDVWmuTQeNsJG+UjbRagxiSJn67fXycKJLLh4XWj+JwGGCMxeuQApZ2fBXESSJgDQO954v3
 NuD4PCYQ3v21zj0hXclGmgqi6MUUoZeeDr52lcRfhmJ7pVWCgrGhjJ6ygEpDJy/bFhbK77X+xuL
 obWsul0ay0Q2BqDHBIzsWoChcCuEWjoyxXCmOOl6MNT5J9UrDNQiBYBw/i6KPZMp5yblGFZtvQg
 YWdUqCmylk5mU7N15Ld6HJf0EZShYRtgb5KrOoV630NTU8+KzdyLQDbe9Uq50+gc5CXnL2USr0A
 jc8QgjLJMWPRCt0YiwsU7DCh8j8tPiZf2no9WKw5QRjpu/iWIV64vMekrNGkJUNeY/bsk5rgWQv
 oz+/Ujh0m131mKzwc3N9TTbhJQazLcnMv1zmimLznqPVcUy1tgvPx8tyvDZ3sB36XIs/POitz/m
 KMX24T7G+iffCp8W67A==
X-Proofpoint-GUID: ppjxCqvuh_zmDyBqD_ia6WQm7sxUnSbw
X-Authority-Analysis: v=2.4 cv=YsQChoYX c=1 sm=1 tr=0 ts=69cce30d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=I76Qk8w-AAAA:8 a=QS8LOOcwU1t-5uVszdkA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-ORIG-GUID: ppjxCqvuh_zmDyBqD_ia6WQm7sxUnSbw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010082

On 4/1/26 9:33 AM, Aleksandrs Vinarskis wrote:
> Follow pattern of pmk8350 to add missing pmk8550 VADC to hamoa.
> Register address of 0x9000 matches example schema for spmi-adc5-gen3.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
> index 6a31a0adf8be472badea502a916cdbc9477e9f2b..58c0dd3ccca70bce3424f83bfd5a52b1fef35c2e 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
> @@ -218,6 +218,17 @@ pon_resin: resin {
>  			};
>  		};
>  
> +		pmk8550_vadc: adc@9000 {
> +			compatible = "qcom,spmi-adc5-gen3";
> +			reg = <0x9000>, <0x9100>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <0x0 0x90 0x1 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x91 0x1 IRQ_TYPE_EDGE_RISING>;
> +			#io-channel-cells = <1>;
> +			#thermal-sensor-cells = <1>;

You can probably add the DIE_TEMP/XO_THERM channels here directly

Konrad
