Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11571397
	for <platform-driver-x86@vger.kernel.org>; Fri,  7 Nov 2025 08:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762505141; cv=none; b=pFZ4/Cc/4VSQDeDuGGpt4sNGwg/hQDt2ZtBEfRTG15ygzMlbc1/Nsf5y/B9Jo/Cpq4BWBLcz2t6LQq7VZO+/b8PER4+/gpfZKv87eJ+6L4KUttDgXWEItsUKrxdwfKzpbNVv2N1VK2SFk5i7fdoF0kuR+gS7uWAog/lL7euAK8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762505141; c=relaxed/simple;
	bh=RKIGS9KO0vrK2ZX9kbsgi19599kVH40TuOoD/FFjBG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Og0HimTkxEiVeyz+JUbeIIPU4Ljv0AJFMRZ3dHMalaQErTVuLfIX2JY1F3zHy9fCE6hH/nZgWUPpA5O/t2FmqYUS/9RBvT2MY9j98KxH/yxmbhlh96xLwboAXOQWlbbhg3N72MuenDpR4tOIXugPwNRdNL559mfQiJ6sO7KGqQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j9VKSGL5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OlyvRjR1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j9VKSGL5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OlyvRjR1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A75FrUO568156
	for <platform-driver-x86@vger.kernel.org>; Fri, 7 Nov 2025 08:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QgS5hwRfj2mxPLEmin/RQvyBPkehj/tTh/N9o3Q2CaE=; b=j9VKSGL5ldNhCJw0
	IDsem0Fzr4SZuyQvM/h+H2DD1w1AXbGzSR3pIfo38NsMeard3DiozlihvbgOA8mk
	E6iXrhmwPw+FvmJt6QIA33bRR//xSA+t/4krdqjLlTv+Ktsev+bV4kYprelpwNdF
	GRGMArQuSTUJWlqAla3WFLSuaGWvjhBrDvToC7CMXn0vN+J1xQZllcYOCXarce4g
	qBJRGRQBgZLrKak5prqU40NrNsbZbzxGb2YBYOhfRhU9EAFl2akC7pCJS1EFpvvT
	BJycTnz7G1RABrBE0q3f8B1E86f9WqOUQCb0IEp4y1Fp73PNUYDuiP/x9QZmB2cp
	h7FEuw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a905qj9y7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Fri, 07 Nov 2025 08:45:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b22253132cso18509185a.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 07 Nov 2025 00:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762505136; x=1763109936; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QgS5hwRfj2mxPLEmin/RQvyBPkehj/tTh/N9o3Q2CaE=;
        b=OlyvRjR1scUYpx0elK70FcvgNMsie2yqvTd3JwwCuBE6dO62ea16VBAw0G77yqywR0
         dCUP77sIHzROUTTuAw+6EMYLSnGwju56++KGde2FpWJBxgTTokydpK/oDODseafWfOSc
         qJUaQQ+6WyvpKr8lttmje/A5nTuOQsfIsXx58yFLST7keYVteYCErxPMXDTihtYbUP+L
         HwSWh1+lulyJHT4qirOJGpgqRoi7VGigqZFzx9CThrsChR8LwdUIaNrsYStJbuu7QYhB
         thwfY50m8ogp5dvzknQUseJdEq/cVLfLkwTWf75rlnM+cLBjoMalZkgIOVOtMqugmQO9
         K7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762505136; x=1763109936;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QgS5hwRfj2mxPLEmin/RQvyBPkehj/tTh/N9o3Q2CaE=;
        b=FqewbqfsUuzTQFuVAqRl1jJE3/3DZwLSQous/M/n/GDU/vOYNSZogh0G4rkr9VI014
         smCdblC2wp/n6Zy4JL00NRSOqO+l9hwFU7ryhiEiDwUDGPycG14upFCNdNpA/t1eq1gF
         ma3jJwPqL1H4B8pVezYPsDQpUn6lZOn+BzbCvFJa8KnFYUEIkGFLoEQXRwEd/Gcyiixb
         9+uWxTTmaacirpBrx1SwfASTt7ZwNIbP1zAwHayOdDQtdx9e2kysKukOTvDvVegjXnRq
         9EeXMsia29Vm675ZLgGuEZ2JcsW+Lhp+61AfyIZzGqb2gAGExYxJg/LBZAf3tT32yjwH
         iK4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZ1zN2dzINh0fUvO9fyZ+Soe+tsXoWG6MBmG2cvcuDB516GMsaGtDyNcsCrtyw6C2Xqqxr0vRks+ctJIywJfGKXEaJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu9XIA8I2OTPM0WrYqtYlfQEW15nCUur8Q1IZ8g3Ipo7nL8yv0
	LK6XhiC6t/zaZ39GpbhbMg6KkWudH8jIyA/FQhnmQl2uT+sdnp/0JU+/jidxaj1lCtLKdkc0mDb
	fdFUKreQdAT7XL+mQOGO3OFInn+Ebp9M274TWYlQY5+U5CFGWtIdbZqjazf7gUgjKb19kfjUGLs
	Z0
X-Gm-Gg: ASbGncvy8MrzVqAoOGuSAfrAeRaUX51fgibBpCBhmxze0vcPZNKIFmtYtHMNMY08KQb
	j5t/5cwJWRaThaTGGRW0g7/LWTy5anBzPy7tAvlPLbS4iWT+Jyo5et+hKGhLC8wksd6Va1UcKeD
	Y4os9EkJlugP+1cNZ0ItLXaLB4o7j+twVkM38BX8x5PlTegi5aye2vsS9YAluc7RdgNEs9te246
	aGQpXBHCWZ32CTuHBnAt8/zKN8KWs3jlshDH+cHyd5TFAgsst6ja+njTLLmaAtMJ69rvcp/5kln
	lBR7YpQbXQk0g/DrnoMiFJyiJ/tik+Rg5V+mw0IHZYi3QC6ndVNl6x5tiyTA86BRxjcFS4ND2kF
	XkoJDkNtgQ/xkHWDIZnQu+gFvj4/ynChmzWIMXK880yxjTuWXq0lqrKgm
X-Received: by 2002:a05:620a:29c6:b0:8b2:fea:21ad with SMTP id af79cd13be357-8b245325b1cmr200936785a.9.1762505136553;
        Fri, 07 Nov 2025 00:45:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvBCF3YyaLzOcN+aoUwXSd+qKgBVW+y3iV9o0DDasJiaqAVotNnEsYQ0f5UYACwqcVlSpGpA==
X-Received: by 2002:a05:620a:29c6:b0:8b2:fea:21ad with SMTP id af79cd13be357-8b245325b1cmr200931685a.9.1762505135491;
        Fri, 07 Nov 2025 00:45:35 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97e563sm184419466b.41.2025.11.07.00.45.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 00:45:34 -0800 (PST)
Message-ID: <c7065cd8-9819-4af1-a346-4daaa4e306e9@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 09:45:30 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] firmware: qcom: scm: Simplify with
 of_machine_device_match()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Thomas Gleixner
 <tglx@linutronix.de>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
 <20251106-b4-of-match-matchine-data-v1-7-d780ea1780c2@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-7-d780ea1780c2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HsxJMiiLTEPsRzaf3Bp0rVp4XH1iq2yB
X-Proofpoint-GUID: HsxJMiiLTEPsRzaf3Bp0rVp4XH1iq2yB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA2OSBTYWx0ZWRfX6YyVtJ/p/ArV
 LyNSWe0b2walIcsP+mL5dprFIRtnPfLamHZ/KDHEkr2Vhw4Ig+VCUzojH1T+UbDHdF3RkE4JOKJ
 xQjdwZIFF073w2kNWd3g2VlBboMic2uym0cb4/DtBiI89xA1g+oRLkA53Dk1B6GFKp2M/KTDn/y
 wobwGiZegPxFQaxQjRBNRNXhHWOQeBrjxyfHwJfh8caKtdxrVyXenzFu2xauiGbXprJdItpYTVo
 k+5cZyHM1njU9OvK52T1QM/z54r76Dr4L/8yxGbDFTIXGhRJ4robmPLtWdcc3DFuftJo1HLtXxF
 StsggyWA32xEQGQ24CXQrMWfmQH7j0t5hnzEno1S8FCHyZQBGwWyJoTtwzTnh8oB9V3pObeNh8F
 76FSukEjwYA4geb9dTq5hj0gCsNhew==
X-Authority-Analysis: v=2.4 cv=D6lK6/Rj c=1 sm=1 tr=0 ts=690db1b1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=TYptV6U4Xydj_hDeH6gA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511070069

On 11/6/25 8:07 PM, Krzysztof Kozlowski wrote:
> Replace open-coded getting root OF node and matching against it with
> new of_machine_device_match() helper.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
