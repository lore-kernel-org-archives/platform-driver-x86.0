Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C036D3E8C45
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 13:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778506818; cv=none; b=YB1h1T514EwTLAuaU+kNH2yCqOUZf2ABuHRcdR+f1msEKrlghfNjE18AOm8QTEFjz0lRNE9kmE1WoemWya/Ll/FckY7rkJy+PVOAQL9P8IjY65vz+Ws2S607cHTYn5XSYANsKnyQvD4XleDyZTiQo4gPiGoT8fdqQ5WzoEaRqrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778506818; c=relaxed/simple;
	bh=iv7kN/9CexyaXWUNLh2lz6maV1d9S2gQPdpq0kjz0Mk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OPDgV8iTiC+lREDO3lG97M1fwUV98VYoc+Sa0ZeA+Lx0KMpw6Vp/uBAGaKp5Qt86N0Pn9AZ8QmyWvqxwoJ8DHCXAXeAuMT+eq6JJV6huAXwDPu/202WoZB/fqIv5XfYewrEIJS3mWQgdhNEw/XHWFSNzSSGWVmst/cNq4ev7adk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R4htGWLe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iafbDEC7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R4htGWLe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iafbDEC7"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BC58Cw1108950
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 13:40:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5N/UX/mU9KJ4wGcjR1nq8tug
	EB70qgQL0Zgb5R0yn0E=; b=R4htGWLe7Z3fNK+VGKp3RVMO//4Gq54CK1c7eXZu
	aUxeBYhdujeIgdFC4dx1rPLM9sHWS/IrRKfyGxfAR9K27yFtSdhQZ7U0Gv/vogoZ
	lgKFPJUuOTr1e+6o5ZzO58MDZEcMJV0y7zVQvmxYOwAgTC2NXfzLxkQ+XCKqUQBy
	6XIKD67zwyFzmOp/zpJqmNQPA8BTEgOtPenJIpMAxDlKuBCyWFCbYJbgzcGLgKxT
	SxsPGZ5rDXjwhXf1pwpMqhBL5jOdGuiAU51tsK1/XBGCd7yaGSrjGfZ6B+ARd8E+
	Yy00iNOt/nR7x4q1DLdGTnk+ejgMisK2OqSAy0R+/nIfiw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3esr8b9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 13:40:17 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6312af106fcso5785252137.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 06:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778506816; x=1779111616; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5N/UX/mU9KJ4wGcjR1nq8tugEB70qgQL0Zgb5R0yn0E=;
        b=iafbDEC7IGqavh8QWvvSyBaJVNgv/7kgRDCJvI8nfYLfyr+SNcMcmKvEuDEdHSe1P5
         jcAFVoTZ8oKD1d73hMwS9TtNSsrSFhTSfc8Y/+lfxnEO0gkOIxd7KaoJ1mTms3i4Mi9c
         2HKGSY+DRgLT3+XAA5L/rlxkPSIGzbCE11kj4zeYRI3kjGH+rXPZ/E15zXkaCEPXqFwx
         SkmqF4OZGuau1EBXGni3IwS5/1dCR5Kem1d35/M7g5hlioy86nbZNNEnvKr7ifAcMjd/
         nX6urkJbRZAdTToz1QofrDLBuEn6Ovl6NIMkB22LLZkJWfSY0wJH1Q7a1oEbamYHCklz
         baDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778506816; x=1779111616;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5N/UX/mU9KJ4wGcjR1nq8tugEB70qgQL0Zgb5R0yn0E=;
        b=AEcPxdFmHpoCL3xs73nKkwyOdsRuu1FEDTiLKzBZQvYSejBZCXEA/TAw6g0Kiyom6w
         ZlCGzpk2RKsmrz+GCDPxGGDbE1+ojuZTTNsLofI2BRmk25VOuzAJ+GnGLYRS9VOZFJAO
         pZ3ubA2y5iCUIMubYsACtORrOXpZu2+5sokuoYHtMRoxmxoWx4/7a/1qpbKiXyx0eTsP
         +ZAR+fnR6DrIlmeAlJTl+IVcrcblDJUaq2YnNrcby3fQ424jdfSOjibpv42ptDhAieNP
         ckzwjF02bZfncawZqv6pnmkQiBhuNjx0+RnhBMZoj3+hEI2+A+U1/QacuNCatuIcaNh8
         U+zQ==
X-Forwarded-Encrypted: i=1; AFNElJ95vFqCBtuF5q8vZI5pwUIPzqY14prqr6L4gn3dzCnPY9FLRulBncDvw0cYBPrsAT6Jo2RcNc3C+GnBGWrCeE+//R2I@vger.kernel.org
X-Gm-Message-State: AOJu0YzDhjk5RxAS4cLqcXMX91XcqhG4/boCmmcPKZq4ykOCDZhfN32G
	WZS+abZvrF7mfpi2TvulqQAIH7yXbhHhvF6/tlxYzvd5WhDThNs0qwU7PBzTeJxUdVfZ5JN8vMB
	mcCGDwQpqP00Bp4SFd4M604ujyk5euqisrwjZoh8Ly2O5lpQJwm2JrgHNSTqgLwFY88ahfK9q25
	rg
X-Gm-Gg: Acq92OHoRYPQX5j9TT4Rxkq102BMnfwQ2Jou+q2uWub9NAnJtFJ1OAn530K2v3iG6vX
	VCI/bK2DjQsj9cDytiUgeAL90Xrpge5+gDnoO3KaVg82HZ9EFoQiNbJ/9veoqittdoVIhvO+xm5
	J2t4szvpdDNSpoUHm8jKYbLbZQI8HfFyUE1pB1A+jC1u4nJHEoEPRuA/dlTvXqItMIT8IhX6UtN
	YYGjaj2wH+sosS+cJNq5AsLmVyx3e5xsXUojTGiaxRFnyG22Z5LbJMnq/aVdosHhYwxN7zjWRZe
	luTZmWxtIjuzPZGfOyONBuCkAas4zzvhnVfh0bfFCDniwVe1VciaHNSjF0dm+tXDyC9eg6Jo/tL
	mB0DwlIolz/i1BYvh5mk2QmQzvEC69W7FkZ4q12WMOC/rJh4pegBnoI4yHmSYcE/Y78l84WBHdK
	VxFV2Ns0+bqDmKlNTxhEM2dbOHfleVkVYJATU=
X-Received: by 2002:a05:6102:580e:b0:631:41f9:ffa2 with SMTP id ada2fe7eead31-63141fa0939mr6281627137.29.1778506816050;
        Mon, 11 May 2026 06:40:16 -0700 (PDT)
X-Received: by 2002:a05:6102:580e:b0:631:41f9:ffa2 with SMTP id ada2fe7eead31-63141fa0939mr6281603137.29.1778506815171;
        Mon, 11 May 2026 06:40:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a956b2a1sm2652329e87.78.2026.05.11.06.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:40:14 -0700 (PDT)
Date: Mon, 11 May 2026 16:40:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Subject: Re: [PATCH v9 6/6] arm64: defconfig: Enable Qualcomm reference
 device EC driver
Message-ID: <lep27mjuw2kv642s2gvlmbro6zad2vvwt36x2va7v3juoq7lzc@b5kxiy77oqgo>
References: <20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com>
 <20260511-add-driver-for-ec-v9-6-e5437c39b7f8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-add-driver-for-ec-v9-6-e5437c39b7f8@oss.qualcomm.com>
X-Proofpoint-GUID: gofjc9JTEChKVO32we3PhNBSKJ6TD39o
X-Proofpoint-ORIG-GUID: gofjc9JTEChKVO32we3PhNBSKJ6TD39o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE1MSBTYWx0ZWRfXzxW/fhSqzUjf
 eUwzshh5NxbKrWVIgyMhrLmFq8FWcTVKgBAiHW77cqxDlHKKDEGMC3a3K6rISv9VgIfVUmWqssS
 xiS8R9U1Ggrght5OzgqbHBU1ehZhAvHMyN4Kqal3rekNgIoREU47xpIlONpbnhq+g45pWhAlFGH
 HC5LRPbtqlMXbgATWj008U253+4j2XAUxlHeBCzkWo9wbtEk7ZfzbTHrTubkNmLB6fRntTwNeG0
 PV4pCHaSlOed9rR3IJDZ6RU1Xsaina9qVEbG4vxfBmC4EAA3bt094BFSGTAsiGZptBQAUb3Ovgb
 5aO+9OuUb+LGWjcy3/F00e4BNuE63bYhWVA6FYEeHLMcvvzSW67mNeusk/rvw3Us5cOFNB0yUV2
 WsbbTT0ZapHDfgaiyki7Pav66PT+JjFH8QbW9l3xgfDdBsV6tYHvj4iXAcfGsyrb45dACabEzY7
 nikoRHsmkjX0nhtDGwQ==
X-Authority-Analysis: v=2.4 cv=G40s1dk5 c=1 sm=1 tr=0 ts=6a01dc41 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=gxucJjpxkCO_kLWZwBcA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_04,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110151

On Mon, May 11, 2026 at 06:13:24PM +0530, Anvesh Jain P wrote:
> Enable EC_QCOM_HAMOA as a module to support the embedded controller
> found on Qualcomm CRD reference devices such as Hamoa and Glymur.
> 
> Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
