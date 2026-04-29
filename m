Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E8E3EFD00
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Apr 2026 11:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777461609; cv=none; b=XWvmRWEugjeaRevXfw3vsjRejSXqbCtPeqgfX+qcQG0MYiQyB9F8eYZ3J44chYQliP+kRZ4Ffzg3OaoSKU2dvXRWaMmMrQNdr4hEZGNGv7C7EZAHrj/Xvj8JjA8uVzeQrEaY6v7/Y2W8+WpMe2QF7DXhTTdlRFJDam+XVY6V7r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777461609; c=relaxed/simple;
	bh=HycvfdCnGv/wFbxYr1QdrjLugfIpfHuxGvOoLjUxsuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YNh5jxT4K5qgm9ng6RajBNTHaZbiKpjHnJsbjNuR9hT3p09XdtjxjlQZx52ah0bUfvtAKCLW9TNSmhzbTl2pUtnGNOy69V6qC6dSrHZErVgMvPRHC8wtjUxHeJYhat62HpQqc42SWo0ChY3Ld5W/KpD2u3lwbLmHKT/bXHAp3aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kogCp32t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jF5jMVYS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kogCp32t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jF5jMVYS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8pvjb1728671
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Apr 2026 11:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NSnqrdTwbXVr0DvCnsiHkAWhdNfmazKdA5tEfbIpEu4=; b=kogCp32tkCuf3wln
	B8qDaexLRVQkRsgO/8WI9aIOGdb2Gz3juE37tXLhTGVw7zOudy9w4Yn4Waqq6sTe
	9ZfhxmoJanAE3unnbbyydo9La4omPts3XUugtxE1dzQGZl3IMO9xsL9pUCoBDVsh
	UhOQRbNueY1nULK0eyoXH9RFEyeErHehBNMa+/CM7aDwshCizcFKkSj3mkn+B1Pb
	BoJl3IdPPN2SfofoH1rQfWy+CpQ3plr/VGLKuF9tkES/YK8p6UYJCl/RUNSvf7MT
	xHH8OlHsVk7cH/u/ZqZuZe6Bn+bY9JhDuO+9zgzy3MlDEosA1Tj/K8GPRwoPm/7I
	/RBlYg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4due5krrvp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Apr 2026 11:20:07 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b4678c6171so117290655ad.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Apr 2026 04:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777461606; x=1778066406; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NSnqrdTwbXVr0DvCnsiHkAWhdNfmazKdA5tEfbIpEu4=;
        b=jF5jMVYSzNUbTlUgsNwdv6il+5qSAt0UknXBtEug4Xe3Z7uLX29lRbbE3C8vkwYHdd
         m0XpecyYIOAFLrjN3ORfu84H6fh8+zwUajgWVj1S66mpJTn8zXSniUy35hZqBFWf2r6I
         OFXv4id3+wiHIQP4qzpjzhO5b4EP5OljBUYVHR2IAkNNH72KlQakNt2k8WuBrYV0xMwy
         vGaSta8D1eVRGAcLDxsjXGoUOEVeKK9Zv29v4jK7hlSv5PlDzh4i0TIhUX5Aa2dETQ0N
         dtgmJ8Y5zHdH4Q7Pc9g7gYokozFxeT66HQUjQzzC6OcsZW/OrqKEm5cHE1PwYZt0AITs
         Qc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777461606; x=1778066406;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NSnqrdTwbXVr0DvCnsiHkAWhdNfmazKdA5tEfbIpEu4=;
        b=oxyWQMjCoJwGcAG4I8iWa1vBJkh0KytDq6lWAenF0z0h03L79ih+NMEnfacwAhp71T
         TjFQkocKHlvd3Bu8PGysAodeQKl/CilUGpxTB2d1s7+6r2/7c7lhAfK3c43xRCtXmRZP
         CZ8yNaxi7QSFdQoCEgAewqvH8vWHElD5SxBnYt0hOVkxMPXEcQFzXcXfSz7bKWx4DKKT
         OFFn4TOR5ehhJ+Es8dK0dBxpaFDXKB8biMPZywN/Tsfcx167JYEGZPGi03TOn9Y3LdZl
         zYF1wznTxlYbRjgRF1oTISZ0y4JTLqq+aamWk7EH6zaEs9yYvm4Y3QIwIOR0u2YlQXuR
         l8Dw==
X-Forwarded-Encrypted: i=1; AFNElJ+YBbhcVSsR5MGPAl8RnTOHsrwvSu7MTKYhoevnJB8pJ6Nk10DK0Q6vRXRQI9GMfPh6616/tSN5/bW/7+H1hf7lGxVW@vger.kernel.org
X-Gm-Message-State: AOJu0YyfghasPb781Nyq3Espb0FWXjlgtRuV0DkUY39KDSOWoaiIqWe7
	fnr3g1g8YK/kYYJNKEGAyk2U8d1noy4DLSnAduDPAIVHfBGMh4jWSXCCA2OG7xTKFhRfmdjbTKF
	+Qm3E7I22y8IbIw7yP/K+VmdhyC4sjT1R3DC+mQpD2YdGwPBgbv6adhO5/bUfRHNBQyNirptCfJ
	ij9RwVypYb
X-Gm-Gg: AeBDietM480niIeTD+Eyuopw9SyAEEuFfZSjIMzxXXJCrzM1/PKM53HVO27jnhvzawO
	pSyhl4p7syQ2YyRis1/p7Yd+VfrvBex6GEHt6CDI9JID2GF5RQg/B49oHFsyX9+kwL+auWhALPv
	BZScBznQuGfvGjvk5BXSStkw04heWtozQJ2CKHTEzYTQ6GZpNfKcfjciYbYJHH1AwwULgIZWK2i
	vNZDNhKL1ox09HmFODUjeAFB7qD1X26x9ipzKJXVGuNc900kOXDw0KLsNYa0Pne7BGbFWPbOlA6
	xlk+cGRNRpGwsgKaOFHyWVT5KehzQ2HxgD+3vhg524gaNn/l0xz6IJZ1CC8qMM2iaem700Y1Lvd
	ZaWSvtSBTSqAhqZSLSjjT1bV88iTGe2WTga0tUszfPgatuWaaqSYlDqh7HDPYQVcMHt7hvdXHXz
	yipGhJCv62UCVLkPJIZf5jPKzAD5Pfw1icneGvdYKMMy2pSmglWtM=
X-Received: by 2002:a17:903:3848:b0:2b2:4d36:7ba with SMTP id d9443c01a7336-2b97c03f4d7mr69948845ad.0.1777461605936;
        Wed, 29 Apr 2026 04:20:05 -0700 (PDT)
X-Received: by 2002:a17:903:3848:b0:2b2:4d36:7ba with SMTP id d9443c01a7336-2b97c03f4d7mr69948585ad.0.1777461605458;
        Wed, 29 Apr 2026 04:20:05 -0700 (PDT)
Received: from [10.190.200.117] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98893f209sm18554265ad.52.2026.04.29.04.20.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 04:20:05 -0700 (PDT)
Message-ID: <02b672be-d721-46b1-bf40-02d0c6cd0870@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 16:49:59 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 6/6] arm64: defconfig: Enable Qualcomm reference device
 EC driver
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com>
 <20260427-add-driver-for-ec-v8-6-702f74e495f7@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260427-add-driver-for-ec-v8-6-702f74e495f7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDExNCBTYWx0ZWRfX3zDF/8ZbtVZU
 k3GEOleQGbXdQhKcdsda3I4fEbWMadNIuv+a4ZObMIo/NEm14GgHoUXIHuzGNkuJYKr5d8FhLFs
 cI1Z48DCeJheE7qZrtHYWQasxI22kA5kQCjHD1El1LUmvwFAjUUdF7zpTMvb8Qg4tRpb99u8qJV
 cwSw9SJhGeecME5zNbuRPa41fbpsX75jUWRdtowfc1AkeSmlOec7+vYnLAcPl93ZbZpp8IVKhDy
 nBHFB3ldFvK2wiGQqEnTcd5p0l90/VJX5hww0bFndzYyiP0LVkVG7/Xs7p84vY0OlCu6O/QeIwy
 YKlU/GY+To8f1b4C82GxU4+KNycoFDLl81KK7RaVJg6OdPbjkzpf1nXcuH5Npavcq52JTtS53ro
 RMvGYle8Dv/SpbCa5a9Gxs0GOyuCWPpyT6zenTmJgLrgCA73/DEm3Sx9oQYUO2gUumHcno0+dGY
 5SodkPbYBXTchO6bqfA==
X-Proofpoint-GUID: FYcZyxJlbQQXE--xY9lzcJDZrZPt-wam
X-Proofpoint-ORIG-GUID: FYcZyxJlbQQXE--xY9lzcJDZrZPt-wam
X-Authority-Analysis: v=2.4 cv=CL4amxrD c=1 sm=1 tr=0 ts=69f1e967 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=8EeM0g2abuOJCfGMYRMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1011 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290114

On 4/27/2026 3:34 PM, Anvesh Jain P wrote:
> Enable EC_QCOM_HAMOA as a module to support the embedded controller
> found on Qualcomm CRD reference devices such as Hamoa and Glymur.
> 
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index dd1ac01ee29b..c48fce61d738 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1440,6 +1440,7 @@ CONFIG_EC_ACER_ASPIRE1=m
>  CONFIG_EC_HUAWEI_GAOKUN=m
>  CONFIG_EC_LENOVO_YOGA_C630=m
>  CONFIG_EC_LENOVO_THINKPAD_T14S=m
> +CONFIG_EC_QCOM_HAMOA=m
>  CONFIG_COMMON_CLK_RK808=y
>  CONFIG_COMMON_CLK_SCMI=y
>  CONFIG_COMMON_CLK_SCPI=y
> 

Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
