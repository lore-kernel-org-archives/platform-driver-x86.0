Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510E816A395
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 10:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773657952; cv=none; b=I3C4XpLRH+Er7+r5zrZHE0NkNoewe1BiraaTPf/yfHd1JiaXZkOqMfTIooaeziLbHnVbSvylqDfX4GlZ8OROo8vH8U2YtNQqGHcPmGMXYNG4A9sw5rfXxT4p5cJvi9QikDfaRFaTN1lsF94L8VvDlA0O/oLpTD74UBYfb9Jo6DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773657952; c=relaxed/simple;
	bh=TWnwoP+0EcakMiovpZp9RViE9gU5PDyhfdbZuzXwnhY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gPwakXCLTL3Rmnl/+O95H6v8YeC7QTnYgFdUvgHH25adnjAo+4Y75ymql/BNSYQdeD4m79VYbV3ObduYcLhDe2uJad/gRs9pjja+reaGE5OKL3Oy5VidAOuSFZ6E++rotq2MtaY049MRlFJwTEqjOBpn/X7dUcjkP9+j0VVe9NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i70Ufjs1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a5RenbWe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i70Ufjs1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a5RenbWe"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64daQ3777661
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 10:45:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XaA26AW2Fhfmnge/gG67ooXuLzhgqHYCXuLsoFc9UBU=; b=i70Ufjs1WJCxO2xF
	uoc70GEtu0hW/zNPH3VqeFEUpTcjSjB0+kISiRVyu9CGxBG2rXWA0uqFhdOCjUwt
	eaYpfpkfGbdrJbyr0hEW2yPHyigCm5UzMBqnzqeTN0z9OblBrxEGtVBi947FrZeX
	KCzt75KIBiplKpdNvtwndeqLFUNXK6//i4ZzOJm2cCVwN5MB3Q6BA3kl9aGtQAkb
	iEX+1vQlgZ+UEoZjqfwldIw/zFex9Zfj5V2QEK3/IqkgbFQbKLf4+naQCeBlxm+m
	nCbhBwkVmyICqdH5jul/wMCbAfr81h2Yrm0D/+xmKNrPZTGKRtDkCFDzdGOxTDEN
	MbAY4g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0y7w5vb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 10:45:50 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89c5014e220so6091186d6.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 03:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773657950; x=1774262750; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XaA26AW2Fhfmnge/gG67ooXuLzhgqHYCXuLsoFc9UBU=;
        b=a5RenbWeSjdjjkB3d0YRKxcPLSVdMjuENG5hJoc5n8B7BnL46PBrbCbZAbbTsGx3Sd
         ceXsWEEHZmf0PBcISrAzUKLel9JhvnAi0Nuyqt+IYKMDF2+4wP+jjNcOX3kM6ioizKEa
         kiLLCNhAF5qB2pPexIuorCMUDAMUkpsEzHkuM0ZDSzhqVlPv9gYtPJKl9W1OMyNzOHJF
         IONG49NPGWuH6GhhJu2rlk+L8h0aeteH/LNe1T+K3uvNXZyo8TuqV7ziJPG55OokIVYK
         rgOerSPShS+hyb0Rijgbd7z1hE5kzlX0S3CR4NgQ/bFxX22wl30F2EEzLcjDNAubMY+I
         +NqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773657950; x=1774262750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XaA26AW2Fhfmnge/gG67ooXuLzhgqHYCXuLsoFc9UBU=;
        b=RH7uOWeHIBdkESsSb/RkeO2jKdY0C4i434JRzKSu7zRpZiH3ePPwwjRA06KkRyh1pi
         cs9nzTiJncOcFbs8abBrG1HjIGCMB9Op4r+pzok60c1+XQzemPiICzXfET5yxlemio7D
         DOBwd/XjCbZ5oYXQw4G0VWqCEgYvqBqZ4xJ8Xr730x3+ai4KDAs99fnwb8CV0TfkzhiS
         RkP0VbJiLdVHlrvfP82W8fZKLw3r+CuMT8p5fYdKvQFWWztnNdBJsfdg0MHMY0Ft8JXA
         XMVCybFkBqEq25OufMSf5WAOE0SDfDxmzIGdnKR6tFrSJXfsmRFL6/rrCIWbT0cdqmtb
         CBQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZYNl95zjVmThgY6K6CScFAC9or3WNoCgSBV79axznSEg9heAdGY5KnuWVePbkXiUVARCluTuRUqEysM9B6c66K2Cq@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh7Vbey+jVxKiMvFne0G8VZcdhasr5SC4F2gU1ekH2O5mAM0BC
	xZjcvYPrwoCYWDEuMAt4yq1sTVWIaZKYyhbFWIwGo1sUzj1KTej6TFAgNPZVYDOOAF1l6R32vvy
	CH5lAhAcIdKMb8CQgnyTnRezovQB4BRruLJm7z+TAn1TUYqnf7vOz0skj8xesUWYVdR7Bu/1ASH
	Ig
X-Gm-Gg: ATEYQzzqv2+o4028bic50pm6k5sZw27zzZuXk8UZJOVo3/ZrKo1A9yiuljrILSl8igS
	u3WhzepVWsPbVFRCnBUYygHPQdjdLvWpZ4idExbMIUbT5j3YZOcCVh6+xvWd5Ggw9q5H4i2MeWx
	jbO2MXzAi8wcP02In9oXIK0YznQxL7GMv8OqU3BMo558/nojXeoHDsEBoAWHfp6yIUeRGoMPBNx
	1RYWNWC1+Rq4hTXRnmvX7ISGn1NIn/MJUOVDWEfk/NCvv/XnZ3xklfSNEEZ60jTB/u2ta8GmICI
	aghbJhmkc2uLNx6JV5L1B10h7ISRDiJJ/M76OZ2u6TzQBKoChOlPWOebumfy7EvICwWTjwUQff+
	ITldu1B5UJ/8G4ZLjFQYxSOWPMXYr7RDP6NwrmWfhOCwkodYjIKeoELlmdwjLyE6I2MsrPDai9H
	nCU+4=
X-Received: by 2002:a05:6214:4784:b0:89a:4741:2147 with SMTP id 6a1803df08f44-89a820eb598mr118325776d6.8.1773657949740;
        Mon, 16 Mar 2026 03:45:49 -0700 (PDT)
X-Received: by 2002:a05:6214:4784:b0:89a:4741:2147 with SMTP id 6a1803df08f44-89a820eb598mr118325546d6.8.1773657949302;
        Mon, 16 Mar 2026 03:45:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b978eb9d5c4sm432595666b.48.2026.03.16.03.45.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 03:45:48 -0700 (PDT)
Message-ID: <fe0a9c18-67e4-4f74-852d-fc1c8a26bb4b@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 11:45:46 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: x1-crd: Add Embedded controller
 node
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
 <20260313-v04-add-driver-for-ec-v4-4-ca9d0efd62aa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260313-v04-add-driver-for-ec-v4-4-ca9d0efd62aa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OnWmVWaNoiRvtz2vNgnoDScTQVqjef8u
X-Proofpoint-ORIG-GUID: OnWmVWaNoiRvtz2vNgnoDScTQVqjef8u
X-Authority-Analysis: v=2.4 cv=D9xK6/Rj c=1 sm=1 tr=0 ts=69b7df5e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=6SiODLxq02sLjzxsB7oA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA4MiBTYWx0ZWRfX6D9aGR6pDy2f
 cupsaF63Znk+cSwliaWJoc1IK4VmUugevfHXe8adxoghc1ZmDw3YYEFnV+JesfrgB02QjalHkKr
 IA4PJwsg3nuc7T4qYskRcT3XNAKTfYlIsIEW4ij42MGNTGNiD5wsga4bH561A3KMROIeoEztLrK
 ERH6GiJmgzRI6Il/IQss52x0bv7m8qJalxru+h3go4R/qB58fU60W1u3pjz9NTa2v6m9jnMdVgo
 QFTNOZTN00T8Q5WM10hesieB24y5RUqoKtIPj5gt+FqR+HXArpfiVUvsn069aYuu4Flxg5Gdo4z
 f1ILybIQ0as5nwmLdFHSWzw35j2j67UFEB61e74DC26APYdAQ8WNG1Kt7HOfpONCRE4sAvDivMq
 dPDXy5NUYRCzBEjGBAUvszRWmbePcPs6ynBlpuT6bQbyXAbBS/sqPXhRwnTWR+lKydmJ32BjhIZ
 2Lyk4J67S9GOtrXaZmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160082

On 3/13/26 11:29 AM, Anvesh Jain P wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Add embedded controller node for Hamoa/Purwa CRDs which adds fan control,
> temperature sensors, access to EC internal state changes and suspend
> entry/exit notifications to the EC.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
