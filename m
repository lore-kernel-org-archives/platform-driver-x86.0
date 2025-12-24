Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E7F3271E1
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Dec 2025 09:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766569480; cv=none; b=fUFlqYEEUYjxG++vMIeaE9I1z/xbkctmAUJSLU+uW/zyUqLjurdiVoSkgWVDN4RI0ev5BTOdIuU3PNpDLT0ny0Zpd32nx/D53cFxOkBcZB8q7ctr+6S+UJCS5hw2MJGj9vFA5CY4fQ3NXruLTI6ROvdIBsiAX98gC/NTEZ0POAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766569480; c=relaxed/simple;
	bh=tlec59c7vzI12AdpQO5MvuW2XJ692+QIG1D25DoEfbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XDb+1ZiPox5uxnbtKXTEx6PWb3tDM3h4JN3UDsCPN3Lhm3M0lMgtbJAJuRH1DdRvZqUFUI8a8Vb6tO1FsXA7D2vTOUJS/l5yaamBkTxdRq0olP0EpCVY1ZGrXQutY4lbx6TrY5yqAozdipIhkMDPyfSGTFtCboP1ywOSzTrNhI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DCRQI818; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jwTSVLzX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DCRQI818";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jwTSVLzX"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO184rD1599723
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Dec 2025 09:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j8bMJPL5URsN9kC02yIvSGN59PPsUlvnLYy8ovug86Y=; b=DCRQI818VJNfhxvy
	vcwkm144QAC59iKG/n+dX/NEbry4V3bERWVgC63J830y2+IxplKJu81zvnBHVDr+
	YYxhtg3kBdrboHCwaF+Y+tHK3Xt0I2PwdEh92WqpOYFYGxANzU3pp7MnexhOL9vB
	SeFLB5G2ArFIq0saOFNc9u62sZiisH0/kXKVrEHEcas05swDUkddohEtr2op6gHR
	Y9gYRKW04/BN6XURT2F+bDBQv9FdNKyU9ds4H0NdtAyOdSeGhhDW/K7/9J/tc5qo
	Mbn1zfc7sK5GIFF7U/jCnzwbFzxqQlbYEkvQuTyz8fxGqGUZhESpB3ziQe4ZvS6B
	buSDfQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8683h79d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Dec 2025 09:44:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4edb6a94873so112451431cf.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Dec 2025 01:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766569476; x=1767174276; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j8bMJPL5URsN9kC02yIvSGN59PPsUlvnLYy8ovug86Y=;
        b=jwTSVLzXCtJalP3udR5mbXxnAjnorYa5Myv5f7+8Xdud/ohFVomOqmVIssbkANHNmV
         RC1pI9DTvhsLOjv8XjUU4q53i7mkVn2+i8YnJ1sMDaodqpa7AkxP8IL/0DwTsAG4tHAr
         opjxOXReumcVg0oe1525dHXIn0Cl8Zoih2Gmxsv3woflisSGSomKIukD0cyfIWDLNijc
         Isx2FiNcUk8oP2WZSdo00lVGCvtOLxv8Bz48zT8US8ptEaw2ZoKadG2duivaJXb43ElO
         mC74B/gSKzFAqGinl0g/tzsdq+aRtdf1aj36Ekli5omknfS8OBEoK/ZvIG+FkxQ3Har6
         kUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766569476; x=1767174276;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j8bMJPL5URsN9kC02yIvSGN59PPsUlvnLYy8ovug86Y=;
        b=hSw3q8FE+aW+ZTe9IPwApaoaLaPA5Ukd3Nnhk8/Ek7RfRuLvNYLoaGNfA7Ed4crVBG
         3zp/uKP/R99GfdlNIJWRcKOlhiIJpXOVPeO12bJbnT7rlzBpg0OdN6/8rdAG85NceP/B
         dXRXJe1sRdmBUf4MRgxeIrvSXUlBvNztNrOJBUkU0hvUqOrMHDYE/9ZpIItO95HtA75N
         A2eU+urqmTG5xHDBDoSBTKLlDfB8eu1sWrXW53CsNzKfpauHpwz4BLWMKZVibwRvkErK
         nigAowA2PrFC0/u1D2hbCVoSqPJU9nrM2eG7j2LxBSVkMuxx0VTNvO/U3sSt0YxrjeIL
         YF1g==
X-Forwarded-Encrypted: i=1; AJvYcCVac3+B/dDb/5WvfuGEXnzm5q7Q4gW2qG7gKemz+F+2NT8vilHMCa5X0PpWX6glqGF8tqS8M1jIIR5vZogzA+LZzvLO@vger.kernel.org
X-Gm-Message-State: AOJu0YwZzrEYJUJmk31SQnUYK8JMHu3aWX6XNebLdw+aLdmUWfNr8iov
	m/rr/krkJpnuAKL3+FxeT/b7ahxkv6RBsrDcEknIa2UYDIYnq27ccQPOcUadplZu2oTauclBOzF
	0+0SDdcX6SijQkcRSlzA0EOeZEb0I9BmfyDuZkWSoVi32aUOCuZ5UGjxtgGBOAA7t+vXbohqixX
	Go
X-Gm-Gg: AY/fxX4LDLJkfh3w5ZoveK8vcpM6ZWLa5/Dx8ietPq3irdqC5tEIkKVSgnnu0JrKU/y
	wtwgKHmfkfA3Rd/25+adAb6qrLgAlMFI5yhQzprgJyzfFGMAoyQAiEZfB1eI5lTd0Lyf4FEaE/y
	kITnSHbmh1hsFEAPwqvVuOt1gCZvXDa0BOOvyNSD/N82fhaCN4zcboAWZ8T68CDMiQhOQl2hgMA
	ZQHDB69UjBvyywicPKA5KbaZ82lBnSuOn/ZbOnLcovhzoV1wYzBNK3GoUDKKJPTc9QtkyVZki4s
	D8rBHergbiQ6OFk0S5vtl/qxpr5wosD/HG62t4tbsHmRcRFzeR+MOiyZGDF8PK5a5sinEEF5O+C
	O0yrZhFpX8trzQ/yvy/zDhg==
X-Received: by 2002:a05:622a:1aaa:b0:4e8:aa11:5869 with SMTP id d75a77b69052e-4f4abdd77c5mr248981531cf.70.1766569476167;
        Wed, 24 Dec 2025 01:44:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEkNB3ACPi/FO+hv3JoHsZTBX5MuwuJtcjQ11szAJg+HHnPlCeIsNXx5g1+5A2cYrPCZrtUkA==
X-Received: by 2002:a05:622a:1aaa:b0:4e8:aa11:5869 with SMTP id d75a77b69052e-4f4abdd77c5mr248981161cf.70.1766569475653;
        Wed, 24 Dec 2025 01:44:35 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab257asm33694829f8f.38.2025.12.24.01.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 01:44:35 -0800 (PST)
Date: Wed, 24 Dec 2025 11:44:33 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: jerome.debretagne@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        ath12k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Dale Whinham <daleyo@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 4/4] arm64: dts: qcom: Add support for X1-based
 Surface Pro 11
Message-ID: <qptvyecgevfbknaepnyplv2543wojt2cgj26kdsaaytnt6r3rk@kko2bjurdbyp>
References: <20251220-surface-sp11-for-next-v6-0-81f7451edb77@gmail.com>
 <20251220-surface-sp11-for-next-v6-4-81f7451edb77@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251220-surface-sp11-for-next-v6-4-81f7451edb77@gmail.com>
X-Proofpoint-GUID: eQncPYszdirMrVlCP0G4IcI9JK7lv2JI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA4MiBTYWx0ZWRfX4oi8LpeO+GRV
 IVmz9rA+FnHg9JzF2OrK1cCf3XS8WTrr8T2Y8xmEvzQbV30/nzOW3oDWsykv9Dq+aGqU4BKDm22
 PdOKA9X1vys1/O4R1vFWxhpA+/G5DtsHx1k16ePeA96Vq9+1+kYM4nvxM7xWZovhAqJSc3u4DS7
 8tUoDvtej2m7j3PQ6uu4BIdqjA5V1nZ1/lPUlEOQfFkCwZKl5XXhXuMttmJVPgE4RnMEZPUJDQL
 MvSX51oiMB4p8cIEywivq2MTD6frpaL8zggl5XoZeTcCtepy9DcZ+US2EPLVvPiA5YrE74Y88A6
 B0L+bNgBaDseG3asizjrtXgGtYwmII8FCQ81v5eOyOiSwpvsKxP25ar6a9j+1ko4OqIQMABIgV/
 5GXv15oaTdKJUW2sAFp+afPV2bTOgspSVGPJP+8GLpKscuKCkAueJJbdDiQg09QBgmjTotv86hT
 INHdf0VbBog82lRj5eg==
X-Authority-Analysis: v=2.4 cv=HqV72kTS c=1 sm=1 tr=0 ts=694bb605 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=8nJEP1OIZ-IA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=GlChVbD0Fj_pvowmbuwA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: eQncPYszdirMrVlCP0G4IcI9JK7lv2JI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240082

On 25-12-20 16:26:32, Jérôme de Bretagne via B4 Relay wrote:
> From: Dale Whinham <daleyo@gmail.com>
> 
> Add device trees for the Qualcomm X1E and X1P-based Microsoft Surface
> Pro 11 machines (codenamed 'Denali').
> 
> This device is very similar to the Surface Laptop 7 ('Romulus').
> 
> Use a similar strategy to x1-asus-zenbook-a14.dtsi so that we can create
> x1e and x1p-specific flavors of the device tree without too much code
> duplication.
> 
> Hardware support is similar to other X1 machines. The most notable
> missing features are:
> 
> - Touchscreen and pen
> - Cameras (and status LEDs)
> 
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
