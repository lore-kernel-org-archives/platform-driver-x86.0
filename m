Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F742E5B02
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 10:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790676506; cv=none; b=QH7hikA8NLdHoiNCT2Rqvg/MxfSlGMcAeCpvnjf9UsL0ZAt4lmOqlvccNLLk8Zo48hp22oORhPMfsDxJj1fNMraZNCn+aH9w5fWxCnA+0gP1r4oLHHyjjR3wRM99SdxZYYTItmhq7+bBcrgNWts58SOhxgydIU/Hlit2pK5P3eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790676506; c=relaxed/simple;
	bh=vNUuc8jLi0AHoFh021MS5/u+VB4q5gBEF9MEa7jPgE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j+7bnRJgF79arKpH8XJNPSzwl71UvXlh8v8vdb7mgtCK0+J9FAHoFdDxyfMDWGbkdagw74FPZz84fQEPwmgPGTylY2K4gc+nsT25csrC0WkpaC79uohBunPtou9weP8BAPRod6JvQYQDnunP48s/uQexNo4Kw9U41zjzZNEoh6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JpXcaoh3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XE51FU6a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JpXcaoh3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XE51FU6a"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7U4Xt3834005
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 10:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uukd8v4aAC48bOKnaS4x4SSv6x0RjUGZIvkn8X4xX5s=; b=JpXcaoh3lO/O3j+x
	/VTLyyhJ412SkrwiEiXtPqbhnbk9R5s8fFi5V/9KQgjEtojcqO6etg0XhwSfBBec
	q+vUgXY4jODAYA6k5/1RIs+IUPzvL5uq5IYCbmCpNottNBImUZ1A2YAj6jwMUPuK
	h/CVr27SdOZJ50ZfsE272GqV9AzD+gT3hA5dbuxutMmHAQ/uHoTBygka6sCp/ios
	kyfd7VYQ+vK4dYGAQKuOieU66e99jxiPliFngb+PalXD/NErol21sCpiTYxvS1K+
	rXKvn3yeqRpsPKmBrhddnmRm3BjTvtJ9Hwx9liBvpZqLm9Kl3N0WyYBtdGqDdQ7D
	BYn3aQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h01vkj6v7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 10:07:59 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a4a0017549so899372a91.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 03:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790676479; x=1791281279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uukd8v4aAC48bOKnaS4x4SSv6x0RjUGZIvkn8X4xX5s=;
        b=XE51FU6ayHFgW2icoBCtrMHw/xvDhPxu2TBwh//ix3LSeeJ5ODVTfB9rDHHB2UFW7U
         XKVyFBVe0gY6hLqWFHK+wyQRicw3uqVtM6LTkY52NKEWTgEsYfFlnGx53HGCO1sQEQIG
         vpMpa4svcLapS3CjjeMZzBrkHrpqQ/3PnIUtmm93KphLJPkkyrx/i1Ar2lG2qco0GroG
         8YQACVDKsmjhuruvIhk+XriDYi8HEL089PkyvZWaMTr+79jgQyffvfvKjHzUeP5wqo+J
         pyzPXYftHxIKW/yIJb+pk14TFIPF0TjcQLC7eJcOv+oS0GQTGtu8d7AmMelzOdWjOi06
         dgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790676479; x=1791281279;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uukd8v4aAC48bOKnaS4x4SSv6x0RjUGZIvkn8X4xX5s=;
        b=SmPk/K1Y1SsiZlLfrow/p8dBZtY5KKd36AHCFx5HN7Rd6JF9BB7657ACLAEbH5hyas
         U/acCr/T9z9EWbQ1Ah/dhJthyAWNeGE2vhZJhHu2FsoRTVqKImD45dN+SjL3M8nqN1MU
         wabX3ymPN8LX6zgekDWDnb8YSG+mz9sRFXpzfPnEemMST3MqidaNMBBo863aTylaJSx/
         gODC1M8AbuWUZ14nH9EQX3uG6tZx7/II2+HArj8+dJlzBRGbrrm3VOva6nv83ZXJuTOR
         YdEOvXdtRO9tvpAl8DQ7yA63eMlSG9JwArIchX2KyuhLTLgNCKTz0AYX0zMztfpHC4p1
         i7UA==
X-Forwarded-Encrypted: i=1; AKwUvBzd3BAgXYYzZfb6bSssUO1GVfn+J21IpbGZXpWuePgCwFGg987dLocRLSXe/gLG5l9zTsln5VlmunTAOExa6Oc3QBl/@vger.kernel.org
X-Gm-Message-State: AFq9FYLYQv/QEQTbNF4iJJrHM69na7gQbV8fZqD7BQc4TbQ1dX6RDUCp
	Irrv7Sio8POaNXS7/vBaHh/Djtlh+FxuGi1ipwraNZrXoqijSrJwSLEWl4fudwaoHnZAgwNxrCI
	BooIZKg8W+hdRgjmZQ3avVqJ71lh3AqhIf9SoC0s8Hg9XWgXE23T3zjsqgDx810UEFJa6V1/7Of
	ED
X-Gm-Gg: AYBFou1L4azq92OkqAnzazs7ntRKw6pAnCk/2Dx08gWJMXYDxAW6k6wxuvDv+s9rLrH
	QR47akfY4uhqhaw3KrkGhrAlpwULoL8uV31qRs7hoQZiwDnV58iepOn/cc8U8+amxnWFItKtTXK
	BNVrwSdlUaZAdyjYoC1XPk5H0DaGYgqfGRuhzsFnhbr5dCesc27pGljlwf4nRoBJ00f7u/nvk7b
	/oejKzxzDcrCfl5VoK3+MYV++gfQUF07upWhgqP6zUNg2jWduXWUy0Wcv9W0EBD6CYc7CHGB3Mn
	x98j2jmw9pyf2frjKTTOR3vMIPLnNbaJkr61aFtjYl/mTfD16Cxe5HNTTOcfLSLOnnTPyk8AmhF
	1S1MbXnHE0XzCeHQfNiZBAg+M5UwZyokZvC8woOvf9OQkMKaAQFhruwKFsW/7sjP3EJfeClMebI
	xxAiaWAZYetvKK
X-Received: by 2002:a17:90a:51e5:b0:3a0:a83d:dd0c with SMTP id 98e67ed59e1d1-3a0a83de3c6mr8184032a91.17.1790676478704;
        Tue, 29 Sep 2026 03:07:58 -0700 (PDT)
X-Received: by 2002:a17:90a:51e5:b0:3a0:a83d:dd0c with SMTP id 98e67ed59e1d1-3a0a83de3c6mr8184015a91.17.1790676478241;
        Tue, 29 Sep 2026 03:07:58 -0700 (PDT)
Received: from [10.79.116.124] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a49858c123sm5582977a91.3.2026.09.29.03.07.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 03:07:57 -0700 (PDT)
Message-ID: <23a709ba-2175-4770-96f4-0b09ca9f0a98@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 15:37:50 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: glymur: Add EC thermal zones
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20260928-ec_thermistor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com>
 <20260928-ec_thermistor_support-v1-3-d9c1bae4cd0d@oss.qualcomm.com>
 <20260929-cherry-seal-of-current-bc1b5c@quoll>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20260929-cherry-seal-of-current-bc1b5c@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0MCBTYWx0ZWRfX/zlnWaYMmB7S
 GLoDZ7WVmU4twk8aFp5erPbAc2NssYJ0di/mSdUPF1d1g+FFBOn/yAOjNKXbyJx4jvs8bjyVUdH
 /hon9z0HHQiMhWtaw1I23dMIBwbdC3V3Nc/ggZvnko48zmhSSZ99UZtR+CWVyF2/bZnPTVOMx0Z
 0/6M2F+EFYkRKhNUTr/dWY/T0Ly3ZHsIsiFEOo/MeH42a20h2ey6YIUL7Z0SwkI/3HpVAhaPr/t
 QaI/N8mXARNYoeNAK0G6Ghrid0n82fOMU7HMpRUYqXAOD0OsAalsB/Ia2SZ4xS9DSUIKs6xmWUk
 BhEoDDn3n+DTLTEXxzHfMvxxcArmHYUathKhthXrVIYcIQ6v5k0Hr29SVNiSVBS+fqUiGHpAJzs
 //pdwQDtqShDhPd7ntfGlZvPbf4BaNKQ/ETlz/Pn4el/+jjte2UJUQ7aKi4DClMdA+d4s6GMq/H
 +iKYSVm+Q0AzxQBFY/A==
X-Proofpoint-GUID: msDFz8qRYAxQl8ea3ixyXLhC6EWPzU46
X-Authority-Analysis: v=2.4 cv=VcVir1p9 c=1 sm=1 tr=0 ts=6abb8dff cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=WLWG-EKfj2tKRMqETdEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: msDFz8qRYAxQl8ea3ixyXLhC6EWPzU46
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0MCBTYWx0ZWRfX5vL8RJDtmXON
 S+7i7IUjtnZRYFhI1LEfiXVQgCX3fY1ZFkprZQtpeppB8E0ONq+31w0SwjPCoKOUnQwlNSy2dHQ
 /2+QwONckwHHusHt/of6hKLOFbhTy5Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290040



On 9/29/2026 2:26 PM, Krzysztof Kozlowski wrote:
> On Mon, Sep 28, 2026 at 12:06:39PM +0530, Anvesh Jain P wrote:
>> Add support for back cover, keyboard, and SoC thermal zones through
>> temperature sensors hosted on the EC for Glymur and Mahua CRDs.
>>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 45 +++++++++++++++++++++++++++++++-
>>  1 file changed, 44 insertions(+), 1 deletion(-)
>>
> 
> It does not look like you tested the DTS against bindings. Please run
> 'make dtbs_check W=1' (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
> for instructions).
> Maybe you need to update your dtschema and yamllint. Don't rely on
> distro packages for dtschema and be sure you are using the latest
> released dtschema.
> 
> Best regards,
> Krzysztof

Thanks for the review. I will update the thermal-zone node names to
comply with the schema and make sure to run the DTB validation with
updated dtschema.

-- 
Best Regards,
Anvesh

