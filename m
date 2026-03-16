Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D64A390221
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 10:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773657978; cv=none; b=lJn0uBeKPB01M0vun43D6TOxWJoOvtg1CQ/W87vItMHIdM9dwb8FGB6z7GrZwHFKzp5EnSMCX1iUrazQD/iz/01DUTjYEnxuBGB6vV7N8PTImQhztI1gxd8+acSug51jgHczAJPG6sig351O+OU54NIjW2342OzOAIyWMdexmo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773657978; c=relaxed/simple;
	bh=DgAHaLVHniG/WjFij6KMeMEX9c6SKoxg85r4WlIblWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P7KBDfBdWe9MOgquuiP5A0KCQX1kDYIQEfs5mxzlD9snISnklKpi0qAza3Je75GI755qnFeNO4pjYlAtQbPQC+C+FiV6V54pyp2ujhpaln40e8Mq/vA5FOiEkd55JjxlzsVstdBok0Hf6sERyd/cPq3VCx7gQ1448ejy/VPbhyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jlKCBiIy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KHp77+Ib; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jlKCBiIy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KHp77+Ib"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64hPN1724715
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 10:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WWI/FuuLoSUa9DlTie+QQdxxsAoZVVJdRrfTJfeNm3Y=; b=jlKCBiIysl51YLGH
	27fuL33C4KFqBKtYESsdPdzJNxJd3AA+kTNnzcBvHr1RIMyqMuVSVTiMXLBYu3aB
	U4Zv/GCKJ4G1y1udQN5hvHBLvhuvYH0juOOBHUbGZ+beXYpPeuHf1X5vjWTqO39H
	b5tmdrw40JOIbuWNzSvZ8IuvKhPYhM+VULCrpeqv6UvEi2vcABVquJG7bwc206uI
	OKgVVvG4hXt8K4+TybfTm+z8V2AKLZLA0asH2J7ZXF7ps0dXhF5g1UGZ2SsBiaYR
	qS/Q7M/iwKUF/KGvjMZUBvrY5tvKEFyM8I0bvGUnEpLsVhFzp53q1z9RVHM5uLLX
	tJY3gw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0udn6gk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 10:46:16 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89c49436edeso11243356d6.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 03:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773657975; x=1774262775; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WWI/FuuLoSUa9DlTie+QQdxxsAoZVVJdRrfTJfeNm3Y=;
        b=KHp77+IbgRJ2jckWulubBoAbPbetgvwODCXTLrl3T/dwcsFxOY8o5kzzHb2sSZc4KY
         pXZaST2OIchwx1qMwQMuMWbSOcGIs4TQPKDVKTfOPvwTtesnp3XxmQd2iYjdjMhvdWDn
         ab7pgFb2Qyl3qHVuF58T+3mK46wu5uiyUq/Dtt08qbgPwE9fLWhOpmhZyDQdMg/aKa3Y
         uWOCYlHLVxGGhMLccdCdgb5IK78R4qglR3WivySKmpwedWgeX2rcVWJQGYCAO5MiZ8zN
         zaH3PmP9Cq2p3cuDyyG9lgk6oVix8g8iHxkuU/iF7u229keAzaHR19n/dfg3RnKcsnNW
         7Rcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773657975; x=1774262775;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WWI/FuuLoSUa9DlTie+QQdxxsAoZVVJdRrfTJfeNm3Y=;
        b=Nk3mZA/nye7dRxCQjA+y/QOCtwncWpqTauSO/WFI/ZO/Xfwqah3bXEg9vQdYYjCmTV
         e6/A+WsJ8QUPqTA4vHrOtyAou4+oRuuqR4bJxXB5iG0+igoMFoddIaCuLmxKtTbTAJdl
         /NXnB+ygsF6JXmuZ+WjRBXK08ZetyXu4CHaN60feZv0Ic2DtQTSmDAFTYOG4NCemSsj4
         +U1d3eZGOPNfjpaJuUE6ZXNwcEHJOkOisG9OllN2ByM8/LLn/ZG7VwzVqgGRIEzSKDii
         zliI4wq4vLOpD73bdBgE5qw7XnfRLwQHxRWa4cAeI/LLt8KY6dpMKIQyNcs/wdeXpJZD
         Fr3w==
X-Forwarded-Encrypted: i=1; AJvYcCVkdmCpkpu2mGpoM9J91LCl+Zkx0AqMuFn//ZdnE3kuHt/1bEzHrvn2l1EM1S+gkUCYEhUgoXWFcO0Xqok8ZhG4ewaq@vger.kernel.org
X-Gm-Message-State: AOJu0YyuAaeUeLYvrTe2l1gudm9pF3VeJx4x5+c7mMJOUenkgDbpp4PP
	FgQhLCcZiEq9iJCGRXrXmfvZSqRIp4UyFYGx6VMxFiXRpOUGfYj8nrzYxkpECR3ObcjRd7f74EU
	/GB+7XAZh3KanWHrt5WM6XEy21IrZToi1UYvKHEDYqwhsy4E07q2fWgBUkTbywjfEXaryflTkrR
	y2
X-Gm-Gg: ATEYQzyVdKtlZzEM5ZhcgLDYdhubEu7T/oSBAhnQ+WQA+TQ6Ur2HTBpy4CSRjSeyNcl
	M7qxezj9kUs1IFrEE4RuJ/zUZy0Ht/JDAd6/F2y4LGPIjo7NWuA7xRBu0pYE41dGurwwbeYyFlA
	BHQy+JTDvrUIypcJxRMofsWMQwoNJEhrex/9xc46uczuStPmNkfIjcOrBFwS/2q9uhm0bX6pM2d
	BkSIksJ7Mr+UYiRG/o7/FqdSOEI9ZjTzaCTuS2cmK8nLXaJbq8o9WIlZZH843Eb+liX5kPBZUS3
	hWYbBzuWSpoF+O84SG0DmJu0hUWDezoPYOA2gRZVjc2hfDV0L5WAPbZsaBgipE7RKgK3V5KYQxk
	6ODG3Xd+LbCND6bfyYI8XoThKDLpLLuVp89qfv9TIXa8L6uJUFMU4nM+PEL/n4GTaaYJD15Y/oI
	E7sPA=
X-Received: by 2002:a05:6214:4e14:b0:89a:4449:ac0f with SMTP id 6a1803df08f44-89a81f51a27mr126893856d6.4.1773657975638;
        Mon, 16 Mar 2026 03:46:15 -0700 (PDT)
X-Received: by 2002:a05:6214:4e14:b0:89a:4449:ac0f with SMTP id 6a1803df08f44-89a81f51a27mr126893626d6.4.1773657975123;
        Mon, 16 Mar 2026 03:46:15 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cbf9028sm542193366b.19.2026.03.16.03.46.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 03:46:14 -0700 (PDT)
Message-ID: <0aa28dd2-c5ff-4286-bf58-b7a9e7f3ad73@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 11:46:11 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] arm64: dts: qcom: glymur-crd: Add Embedded
 controller node
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
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
References: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
 <20260313-v04-add-driver-for-ec-v4-3-ca9d0efd62aa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260313-v04-add-driver-for-ec-v4-3-ca9d0efd62aa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BJ2+bVQG c=1 sm=1 tr=0 ts=69b7df78 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=BYiauv21-j_JhOubGf8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: SO8LY0x_jItob2geV91SUp4yMza9GUt-
X-Proofpoint-ORIG-GUID: SO8LY0x_jItob2geV91SUp4yMza9GUt-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA4MiBTYWx0ZWRfX00Nskmisd0jF
 +0riviZ/BiJPk9cgzLKkh5w7fpzD2G579k39GHDK9yhA8X0EAN9wFm4ImVgI1MAkmZk5bZN0EOj
 UJiljNTpUCf2ZOculE0+andoZJoL1D7imAnhBjDpSUQ5NveULaHqFhRu+WmpaU0WTJLeb3dx4LO
 WPtV5TwyNXZbQtT6kP+1WrufeL0sebmithsL/5nmkHPtsScqf0IRudwyuSC2mxxaYSO+hjKz66b
 b+maltMKqvITEaUCxxIcNVTROXjCBiEOSS6ZjifklWRI8MKIKJSJKQHity6utBRqDEPw5raV7Pz
 zhqfg6DM92sC+w3ExsMJbDnGiPG2QEoxwESZpiwl5e2410VZAqnCLJM21KlmW/112YPUuPB0yFH
 MFBfP9CjsgKSbtXaLQiNfAuZFMkBRAlfky+nrosDx/B6tacANPKQUe44yqO8M8ohk35B4bXGbLa
 1dC1K6nYL6/BRuwdRmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160082

On 3/13/26 11:29 AM, Anvesh Jain P wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Add embedded controller node for Glymur CRDs which adds fan control,
> temperature sensors, access to EC state changes through SCI events
> and suspend entry/exit notifications to the EC.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
