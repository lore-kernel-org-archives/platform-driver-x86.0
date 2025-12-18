Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495DC27B4F9
	for <platform-driver-x86@vger.kernel.org>; Thu, 18 Dec 2025 14:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766067337; cv=none; b=Vzu9Y9nnD7R22X010n7dm41goPqh0Txu77UeIc38+fObl3aa91rSGrVPkoC6Bg+z8YgS+pr1j93hns0OPvTP83LlLID3ZfpjaVm3UVn7SH3zfRxdo+GRf0UPaDO+1ijgmzOtm+FR/AhsGIT2Fac5HjITeocu8xnZumhNy5bvsX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766067337; c=relaxed/simple;
	bh=AUlZo7y3Dg30huPVj+URSjyAVJ4n77mqF8dsg1J3LRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uTm3Kp4pz1Tg3A0SQhN3kFPr+ilbNw1O8/ZYKE2qsTxQ86G2QfUVF91pO6d3ZdBP2hbA2KuvWJIeC6vYE5odUFOaZ0JPXSFKmV+8nPgro9v9Ntw5SjVfA06iVan4V3FzfIwsa+t7jV52QG+JRulFYmntyjHPAXm0ZjCqOsH3YY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hDwRztqx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iIeRoe5Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hDwRztqx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iIeRoe5Q"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI98gou4057276
	for <platform-driver-x86@vger.kernel.org>; Thu, 18 Dec 2025 14:15:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uYqTnOT91m4ng7A1+8x7fNdWtleqwYmaPl3PlqN+ezw=; b=hDwRztqxKISaGMoK
	Gf/dG1ZiXry4Ut02D7xPZxZliCA5o2rPP6mrOrfgywuAbbdGterfOx1VngHkTpAe
	5uf1hoAodELF4k4ZDZQZMTB0eXdpY3kAsX8ETVwJH25vrMuMfNB0fVJLZs9RUkRb
	FJAk4K+mVSQhMO5hdG5dvfEHcWHSAEWXKQO6nSQjHJDNFovy2hGh72VdrQTBtF6Q
	Hn4R3vRKxqSi2Y1T8T+uwGPQGioDrRibn6jO/pp4PHtggIcVKAoYEYaQlnP4VBJY
	gV4emCWXWVUGkIQslXi5A/dzgq8vEkAVLK3udcGNwZ+43P3NJelxm/4QE5EeKeQw
	xRTxhQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3xr5bvha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 18 Dec 2025 14:15:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f34b9ab702so1376291cf.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 18 Dec 2025 06:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766067333; x=1766672133; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uYqTnOT91m4ng7A1+8x7fNdWtleqwYmaPl3PlqN+ezw=;
        b=iIeRoe5QmU434fozzlVhST7CUAHoRI48NpXmDhrkdRftwjL/vsQ7lhfEwsVFacTnBw
         mynXJsvKBnGb1HDcOtXNSxKpE2J9x8GF1ifgaX3kZCs50TWTsug8OrSS/I9eexV5U/TT
         y+fpX2yWSEub62F+FU8q52yWTp6h39AF8l+JkB0jTM7dlMEsXxjnicI2RtwGwSeIJuCm
         jRowIeBOqs8Jiw4yCk3xnM9rrLjMMxt/lA/WbsjwFw8hEWyQKFRKpLJnQBKVb0lEzqxQ
         Itt0c7Mt2uuy55INMWir2YvdK46PCPGZotvL4LsL5kd0uAP2P3VEmEb35Pe4arjp0UWW
         mIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766067333; x=1766672133;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uYqTnOT91m4ng7A1+8x7fNdWtleqwYmaPl3PlqN+ezw=;
        b=aDns4Xj7w+/WcEmXFqoPi2X5d4xMxq+EWnoCgJAWfdQ9eUiR2vhjMvgoNtMiXIxEsA
         omUbJWLvKagzQW+U2XkzumtMaIedgE49EJe5w29vaqE8cpdobRHHpdhrUNZhS+qPRAUr
         ZYzOCKIiizLV4729Co4G2B40ZuCJrnl8yvSO+RwqQnii+geWMgMXn4koQv4sCLfuwtyH
         2/Ji2A8EFd+gKXxVQw4A6da3oOcQi5oLWBkFeWWzImFnQxKtXe1+zQ/54pFCwSYvq+Go
         7FDYdrkuolJQXd12V9evKNWh7QXq7b4rJa+VQNtwI8X8p1OGPcnEa3j+dYx9zTTIeosL
         ghlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEZj7qKHiJZxBGWX78l80BWMdnn72H/ceYxswS+RnzkbF2kIFPIXVkVmVmY1ouJRiyBEzySh2xtmWMhNnHfpEV6Q9n@vger.kernel.org
X-Gm-Message-State: AOJu0Yy45YrF2Mt4bNaB4m7TvEoJws3pPEBQFBnLRafq+m2+daE6KhCS
	N+ojWKPcGCS9jf74lACeedSJjtjh5lwvd2MSTH3AFUGuGAPoOCafOy/KLWnqEFpB6Nsk5N3IGLs
	1FlQncOSrzvOEZ5DLWJx2efUFhjXNn8OuOAcYFCGiOhbcaglBLrlXm2dwzUHxHyiId5C1a9pYAB
	JI
X-Gm-Gg: AY/fxX6zWh6cwaG3iu918HhyEkIZKr/ljDJwUA3R26mJ9yNbCwNRwxpSe/LS2ZrisP2
	8cXMw/UbIh+JctOqhfPp8K9dNweilgBR5gjUBjiPPnfzhgjQAcq+bm8PU6E869jRMlsz4xOLpQZ
	DvNfF3yQW6Cz2JEFQwztoh9FViqyaYy91Gs9yCeRYJ74WafKSdLuN/I4nXdkFelixbS60/A3D96
	fdHC3tPtegnqZXWYix7JYXYWyKD7LnXzKtxoMucDbXRzwTv5zZ/DMo+Ofm9npZTrnaTT0M9UtHy
	Oj7WtjsoVyVbIMCaG1W4Rc1ieZgheJx5/1WYgqFOoM5bDC5qfRRs/MJyYnWec0XPjGVGyWTbOJZ
	+IOjcBbtxgB+aHLAfXxVqDRhGdXcoUb8ZiLzgpSWZp9wtqvEQ3rIQUN+E68wyzVB5Fw==
X-Received: by 2002:a05:622a:1b90:b0:4f1:96c5:b592 with SMTP id d75a77b69052e-4f361189f54mr21475711cf.10.1766067332132;
        Thu, 18 Dec 2025 06:15:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbKcPhLTi95myOrrgVwOR7cxMWFybCHxSy+FkHP4hhMqvQyasR8A0JUNadn/IEP58AaOumew==
X-Received: by 2002:a05:622a:1b90:b0:4f1:96c5:b592 with SMTP id d75a77b69052e-4f361189f54mr21474891cf.10.1766067331395;
        Thu, 18 Dec 2025 06:15:31 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b80230d0e11sm241715966b.16.2025.12.18.06.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 06:15:30 -0800 (PST)
Message-ID: <438a352e-5174-4361-b6e5-6ff5fe1ce0c0@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 15:15:27 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-bindings: arm: qcom: Document Microsoft Surface
 Pro 11
To: jerome.debretagne@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, ath12k@lists.infradead.org,
        Dale Whinham <daleyo@gmail.com>
References: <20251218-surface-sp11-for-next-v3-0-875afc7bd3b7@gmail.com>
 <20251218-surface-sp11-for-next-v3-1-875afc7bd3b7@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251218-surface-sp11-for-next-v3-1-875afc7bd3b7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: FgywV2R5M-XJGDIwv7ucZW1aGrny7Gwc
X-Authority-Analysis: v=2.4 cv=DsBbOW/+ c=1 sm=1 tr=0 ts=69440c85 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=Os-eGSRfLiUiT30J7OMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDExOCBTYWx0ZWRfX/wGWNR4ezJ0L
 JkTibJJBX+gRH++7bg4Xfja2opmCr3zP1UfOeRm7N8IeskTOAF6ja8hONA2AMQfNw7iGJRUTsfO
 83lnM68KnrX8Y7PwY868z2mQYQw03GqcjApE+2Ch1KrRVtrOIg0YsO2YA+4p9s+PkBmmrEbOrfe
 4v59n4rCTbccc0qSI/T2PVtFwdh9VqORXOYmklBp708CkTjU1u+vSxLPP97U8I5rRAxN9xmhoUz
 0gFv2CH1F8dq6A7CLl60vn7xlN+4Cc8hhO8GDvEMN1TwsE6XDVqu9XPc18vP1TvWV2GQSr/LAGR
 AXCvTKQvkiTRgD6nb6SI698OaV4kJxcQHfblDC53tHfsjT0mGi/u87zAxH8Xl3Ha1fCgYnA7QeP
 4e/H4dUCGx9wrEt11qjzgt9gZblcOw==
X-Proofpoint-ORIG-GUID: FgywV2R5M-XJGDIwv7ucZW1aGrny7Gwc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180118

On 12/18/25 12:56 AM, Jérôme de Bretagne via B4 Relay wrote:
> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> 
> Add the compatibles for the Qualcomm-based Microsoft Surface Pro 11,
> using its Denali codename.
> 
> The LCD models are using the Qualcomm Snapdragon X1 Plus (X1P64100),
> the OLED ones are using the Qualcomm Snapdragon X1 Elite (X1E80100).
> 
> Due to the difference in how the built-in panel is being handled
> between the OLED variant and LCD one, it is required to have two
> separate DTBs, so document the compatible string for both variants.
> 
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index d84bd3bca2010508a8225b9549d8c634efa06531..7c99bc0d3aae3dc6e9c08fef0a535e114a3297a8 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -1067,6 +1067,14 @@ properties:
>            - const: qcom,x1e78100
>            - const: qcom,x1e80100
>  
> +      - items:
> +          - enum:
> +              - microsoft,denali-lcd
> +              - microsoft,denali-oled
> +          - const: microsoft,denali
> +          - const: qcom,x1p64100
> +          - const: qcom,x1e80100

As the bot pointed out, this is valid, but not what you want:

This expects

"microsoft,denali-(lcd/oled)", "microsoft,denali", "qcom,x1p64100",
"qcom,x1e80100"

whereas you're looking for 2 entries:

- items:
	const: microsoft,denali-lcd
	const: microsoft,denali
	const: qcom,x1p64100
	const: qcom,x1e80100

- items:
	const: microsoft,denali-oled
	const: microsoft,denali
	const: qcom,x1e80100

Konrad
