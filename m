Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44653CBE6C
	for <platform-driver-x86@vger.kernel.org>; Wed,  1 Apr 2026 09:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775035256; cv=none; b=CFlWAuISdvJZm5kl2BN8SyiZ+ays9gmJnw+blgAjX9s1nW8Mx/plrYrjj12sVeYQDY3nqaIvrCWOXDJItBPGUKeHz05QSbmsJREicNN9+U2avBvERBUHs+3uaoB4rakcwpyO2vy3Mn9V2VIsq9RTIOq5D0tBUMgwh9nJIV1S0Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775035256; c=relaxed/simple;
	bh=DGtvIpbiWD7ytTqar1h4W/k/GUYAQhsU+yvPvBppFgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H7SfiMO+ErkzxUhQLQ6Bp7UF/scz1RvJaThArrhJDoLLoQra5tjn3SF+wQGui6JtWk/2BUXXG1rmVuBKMCMuQSgDsQecyOGEKgpYgMKCQPaAKR/8vMn+XkQuM8UheZOUI25m9nI/LU5JvBV9PuxJ9iCfI7cJ6o1GQjrf3RuUKM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VhrPv9Ky; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TBWJpMS3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VhrPv9Ky";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TBWJpMS3"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317F26d4107118
	for <platform-driver-x86@vger.kernel.org>; Wed, 1 Apr 2026 09:20:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rd6i6PS13zNbPN8wfoARw23Hz+l/0tkOZmobKVqMN0M=; b=VhrPv9Ky/buoEFuf
	vjdJOy0Z0aAS90fBmY/VcagFtYl4sj3rcq3R0A/FNIf3X0JHVudK+b2YPftaqLrR
	ZZ6td5Vfk1QkvRaExzvXiK2BwY1/G7HdV5gEOKLJOUafkSQqEgXZYCf9kB3HbaG8
	wY2HsuahYCqEn8t0QlWGDYBl+8dgeLPchC7JsJgglGtMuU22swLI/M2v90AjweGO
	aphOSNAhrEt9TaVGMbubpzJnydinZLq/x5HSKHUfsY9FtuK2gMMzWp2Ls1GLqDEq
	I5DEdnhuJbmQsxBlbEsrR0nmXK8BTUNmmb8AN3UvItkb94XjUarCHT3H/GKN3pFJ
	3YsY9w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8xt90h6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 01 Apr 2026 09:20:53 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89f48d009c8so13698556d6.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Apr 2026 02:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775035253; x=1775640053; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rd6i6PS13zNbPN8wfoARw23Hz+l/0tkOZmobKVqMN0M=;
        b=TBWJpMS3Hd7tSdnrENgWimGBOEkGbGXScDfEPP0Mr1RB1EEKFQRgaZb9rOzX/h41TX
         oNciIIlODAMQQEPEuw1zYMHXR2mClh2IZHcVvgutR64kNqH+k0SR5czIIJB8kHgExlyO
         7TifclXBXaWQ9JzJrgt35P33ODjEN0SpNCUY0PMfDq0yY9XCp1CJ+QYm1OWtGzeQ/kUx
         742+Q27dlSUGQaxeDQtWfDhOC5tBrTecLo1B+WdcVYVgJYMIU218z5CMbgsdKiPAYGqw
         oTyuYptMTR0az/SxOS/GGXEqGo/jFitRemq9GJgh7FPVwNHcjqFWsO4z6MpVOB41Vydy
         KV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775035253; x=1775640053;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rd6i6PS13zNbPN8wfoARw23Hz+l/0tkOZmobKVqMN0M=;
        b=Ti9gBOp6TFWgYQu3zYPq/8m433WIC+P410VKe8NIa0MjJCPFnx1XPNM9ppClRyXe00
         7bwWYcJQ7/tBK4MEV1qOLHQ9zSlbc6FAl2G9cPpX7DFgBVKqD35W535tcMikJkpfWXmX
         0452LBIeVw/pVAk7Eudws40bpqweQrq87iH59qUCDgP2UC7dpz5Co6uFqSNGN2P5Gext
         ieHmGBa8WGUSamCQphKq8zKczR/hHnm7Kyyp31bp7FPeRso3tJavtJdsxDNzIa+fAbcA
         e5UwgQFQY06rLt9VVwuAvdxBju0DYu0wQPIqfq0hfq7ksorUiMK4ytmpEMq9eV18iAtV
         TU7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXkPOff8bMXth3EcYamR/r6pwjAuS2Kves2nbiPfdQ8eWIDfQn5/vJ7QIr4JTKrCgpLY6owvZXjqB92rrl2q/Vqy+Rc@vger.kernel.org
X-Gm-Message-State: AOJu0YzSEovTE7iOGrhyXK7AEoeAugHXXhRjFS9H0+qoWcDgG2dl+mhd
	GzymXfqj2YCX1uWnMWO9EMR3Gu9EVg5o4o0fu0mq1oKlYxRFkv7Tv8Sk3ARifq4oG6SsTOAo1qB
	1yfR3XcM09pi6PztHhaNsFTqWBsTgmaWWnbcnuNHP+NKANt++9dLIdaCV5f3zG9J1UBwy2uPJk+
	Of
X-Gm-Gg: ATEYQzwVlGwndP9gec+ek5Hs9vshRvBrkimw3XxiogHUTSUvgIL5bFROOwjW2f7zYzd
	45L1NJkeXbMd7KhylMEI+FPmKT5ArRm6G6VjLmFVKMdCH6odwiZJ13hKnKtXZsXMgPP1G+C+lN1
	QnyZ6xW8RtWo3GsoYAzQKHC9sCHCzLIJxB+dlzm2JcXXbtavzc5WfX9NXNsUp79s061MuDJ0YrM
	cjgYdcf89nulrPybY5jAo5aq8kwHvXigYAVIW8LhGrxFdo0OXE6GgevtS+fzzrGbPn5llSeeog9
	NvpuA5l3QOn5Vzr457lwWiS+YibR+UTtrQfoJIO5TgZcFWeMVcnAH7AiDPDu+ubp19sE9JTMgeT
	6E5RgqzepfhmHknEb8sstV95365ORm0FwD2qeKezfZxMA7I0sy4WCzCueyuIfi2Nz8ZK+r9b9o0
	J+lVw=
X-Received: by 2002:a05:6214:c2c:b0:89a:575e:ec01 with SMTP id 6a1803df08f44-8a436d10877mr30371046d6.1.1775035252932;
        Wed, 01 Apr 2026 02:20:52 -0700 (PDT)
X-Received: by 2002:a05:6214:c2c:b0:89a:575e:ec01 with SMTP id 6a1803df08f44-8a436d10877mr30370816d6.1.1775035252445;
        Wed, 01 Apr 2026 02:20:52 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae51ef5sm491498966b.18.2026.04.01.02.20.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 02:20:51 -0700 (PDT)
Message-ID: <e9826e27-da9e-4cd5-b368-be3e56f62072@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 11:20:48 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: x1e80100-dell-xps13-9345: introduce
 EC
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
 <20260401-dell-xps-9345-ec-v1-4-afa5cacd49be@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260401-dell-xps-9345-ec-v1-4-afa5cacd49be@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zv7dmhY3_KK08tthN2a5Qq2Dagqj0iEw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA4MiBTYWx0ZWRfX3fjV1V/CZw1i
 E2Ur3BuRNfH01LtCYQ9td4U+xOmqEsX0mcgCjfUeiYhE9elDS99KjxyXYXD+eZHhskblyxuN92u
 JXQc9wBOR3uA5H7xC0q9vsR94+ZjiJ8/OVvn6lOWHI0UP35sbsiQXmBN+S7/9tzcR9a1h8qzqXz
 zEE4LvUdhOI174zw7R7HfWBuaNWErFT2uQlXhoCNHqrCHSAztD+XKd9ra4FRWI8NBs8pQVLVq3T
 y+9qnWvgogeXq9vKoADB27pnqabxtwfKrkgFkVZ6jgOlUJi14RmQCv/gERmXLs1zEoW5C03qPZ6
 x7OSZr4EJny8u/PYRfzn/+s9bcEpH3/Ap49+1TxinZUJ5aOpHMLDFbjxkX8KuiZqFDSUP91MFs+
 Xb9sy0zvwRJzLXv1J77tzYE/qKT2bCjesj5Ijj7yPn/+KKRIebm2UtOwdlX7bEdXQfvQQG+0VoO
 0EvB6SDFOG9fdA7Xi2Q==
X-Proofpoint-ORIG-GUID: zv7dmhY3_KK08tthN2a5Qq2Dagqj0iEw
X-Authority-Analysis: v=2.4 cv=PoGergM3 c=1 sm=1 tr=0 ts=69cce375 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=I76Qk8w-AAAA:8 a=JKr7C61JAH-ZL2TGNHYA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010082

On 4/1/26 9:33 AM, Aleksandrs Vinarskis wrote:
> Describe embedded controller, its interrupt and required thermal zones.
> Add EC's reset GPIO to reserved range, as triggering it during device
> operation leads to unrecoverable and unusable state.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---

[...]

> +		io-channels = <&pmk8550_vadc PM8350_ADC7_GPIO3_100K_PU(1)>,
> +			      <&pmk8550_vadc PM8350_ADC7_GPIO4_100K_PU(1)>,
> +			      <&pmk8550_vadc PM8350_ADC7_AMUX_THM1_100K_PU(1)>,
> +			      <&pmk8550_vadc PM8350_ADC7_AMUX_THM2_100K_PU(1)>,
> +			      <&pmk8550_vadc PM8350_ADC7_AMUX_THM3_100K_PU(1)>,
> +			      <&pmk8550_vadc PM8350_ADC7_AMUX_THM4_100K_PU(1)>,
> +			      <&pmk8550_vadc PM8350_ADC7_AMUX_THM5_100K_PU(1)>;
> +
> +		io-channel-names = "sys_therm0", "sys_therm1", "sys_therm2",
> +				   "sys_therm3", "sys_therm4", "sys_therm5",
> +				   "sys_therm6";

nit: one a line please, without a separating \n between x and x-names

[...]

> +&pmk8550_vadc {
> +	/* sys_therm0, around DRAM */

another nit: I think repeating the name set in the label in each comment
is a little excessive

[...]

>  &tlmm {
>  	gpio-reserved-ranges = <44 4>,  /* SPI11 (TPM) */
> +			       <65 1>,  /* EC Reset */

Is that a "this may not be accessed" or rather "you can, but it has dire
consequences"?

Would the EC driver/binding benefit from having a reference to that pin?

Konrad
