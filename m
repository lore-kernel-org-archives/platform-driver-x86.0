Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053A83EAC8A
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 13:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778506807; cv=none; b=dxkKTelmjcfhxG4KVOZRUWt5dGYko+04jXzo1PSc85BAJ8HyQOE5A4l3Dl+Am1bC/xx0OGTzg41GVGwwITKohShRHF9fvs0p5/9BOt8D+gSoQmmdKTA4PExjwrv7miUK8omDPYGoZowUMbwTT031uFakyGI9pRPC1al2ZGV7g0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778506807; c=relaxed/simple;
	bh=k8vpbv6E0xaQeIphwi1YwpaLutso5pMe/mHkN2I68go=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h6+52d8vrYTVaBZeiLg2itF8XI8hzVQXuPvrEjeu6K/Y9Vby2jiK2LiVAThi+hMvYhl/cYY2Gspy9sXDCwtYXByZ6rCxYD88hX43WXHIqiVdf881TKu+Ol7u7drbZ35qSAWmZ0McZq6uY7SiFVxE45A5q1qH6wkH5jFUUefPJa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Am/abfV9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iGmhIlxr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Am/abfV9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iGmhIlxr"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BD3e8K1258762
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 13:40:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xFVVJzGZ8bN9c3kBkqw5uWj0
	pG+/dcxhTA6OGEfyeis=; b=Am/abfV956P/01FZ7bqDmUs+y/wxZGsQIMoqwfjC
	NNoutIMej6mDJ9wvjVMwEHkFcC6b6RgIDdHGj4/LGW7uKFzRcL4ju5F9SoLKn5Y+
	v19638QGlDolqfD11LDmge3mnY1ixtkAson8V5PhBd8P9XvR8NGIeYZg5oIzIdl/
	CcQEXvoDTOxO8ayZkRq1jwRSNDU/U3wNOmotRk5egu14JNj0dmpKAuKJaMy42ta1
	y4eKIv6bKjvqs5cIVmjFuki4vNFghhD2V8xQQkI3KC2H4FLOz48pmX7Sb5O2zNbH
	kEboSxI/YLh5ip7vzGWyCy44I7fpUpVTXQUIXkbszrbJXw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3ag21bu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 13:40:04 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6312ba5c81aso2441593137.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 06:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778506804; x=1779111604; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xFVVJzGZ8bN9c3kBkqw5uWj0pG+/dcxhTA6OGEfyeis=;
        b=iGmhIlxrmtZLpxH1+Em/g7MwbHObKK3jU5Cxt47t6b69U4p4nkcYCJ46L3Nny//pH9
         sqt06e3se/eK3otFNj4UvZOOzsTHxjxwyEgR0k0Wcr6Ovt25+BAyzRZ1j0mSUrBVJ6M+
         7RxQFTNAqV+uaUPdDswHNq1vTwDouyikLdnr3kSt0VI/e61rkNVK6ciXkKLvicEAM1nV
         Sg3BAimeguWbfO96P7RYAbOXcg7UkWHAuLjdmPxF31/r1brPDIEWGKa18udMRFENvrqI
         YtoW8F58tsvuJJ7eVWIvF3ASxeOJch0BRXWFKpjXw33496dOsOxkudhlDq1VFED0drRy
         Nc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778506804; x=1779111604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xFVVJzGZ8bN9c3kBkqw5uWj0pG+/dcxhTA6OGEfyeis=;
        b=hkWHbOKxO0INMhcM53fdB2X0D+0dxXAjZNLUEfZgKb0j802apppEsRvOuAvd0roOfQ
         jRjpXaFboG3wB9Uu9dN/yJdt4jCyw7xs4vvMa4eAvUWlHYKJvqlsE0uAmCjqqcTDdDKa
         Q6TJ/dBa6JFKZ+rUOzAvjsyKy5MoK4F2ZIQ9UpRGSTieqKQwD4dDOS0N/pAbZG8v3qAR
         IXVZKz2WcYotxdcmd+SznMoAYJMHhBp+lUyJoUk4ZiNdYjjgL9JSbyKN/5NC3G/fcT7L
         WYon7aGjVEHpyvby+FeAM4/NaP4Tt0scihkCFdOI5LalfpwdE8H1Q/0nWRX0L6hhV0Wf
         ZFAQ==
X-Forwarded-Encrypted: i=1; AFNElJ99z6AiGAYKX1BqXjLC4kouAJB1XZV+m+D6f/EKL248rFtbO68DXLbOB4GEb+/06PwW7d8LrMxUEYswNRgWpv5ByM0I@vger.kernel.org
X-Gm-Message-State: AOJu0YzvgtZSuZbhYclJBJxjUt+4HAFrUq8zuQdE6e+q/hojteoX27Cb
	InyEL9fD6/JN8BmykPXtcNpQMDkedIOOuqlLy2D0aR4J288GY3YFxZUgegPT122+/DGrQIadTUx
	9s5oUzmsARAaIVb+951JjqnoppWyRYwwajAvCV+4NcwFnoLbe2uCd3HMTCaoqKnGvUZMETjS/OC
	A+
X-Gm-Gg: Acq92OEj4QDr0A3anNm5tmXBtgZRvSyVFXQUIFWqpVD+wEnpWSQOne54hXN76/oZ3vt
	DkHuD8Mz6V1u3RztjG8iyL5d6eR8vRZsvR9RBc4CJy50YNqWIGCmfUeMo4hW7TNYHLwdUjUBHkT
	meFQVpO6Cz19MXHa42en7ptzM2c/Yii4uDkYLRNkEOVQAZNbRLorr3r3u1TwY5FLJZS53oENe/2
	8y3MZGdV7rN2UQLjj530yRsm9fOsxMQjoz11iF+vDLodxV41ixFB5UkmahLBxwARV9MUWyribCA
	nhTaAfZGPpQtQficIgJN3YE28djSCte6WOwoIrz0xDxAw+ncQtlArCh5Bjh3Dr50JKmixn19nQ6
	ueTUDjVDA8WFHeM0Q0vWQCfFGuQ2BXfDBp6DPjPnjPNA0Y1lDPlJvNFarDBrEXLRr3Ery/FXnVG
	AaBpxp8BttSPk6Bssf4TyfsAJ5sLJgJBuiX30=
X-Received: by 2002:a05:6102:5091:b0:632:a3f3:914 with SMTP id ada2fe7eead31-632a3f30b8fmr3055837137.7.1778506804275;
        Mon, 11 May 2026 06:40:04 -0700 (PDT)
X-Received: by 2002:a05:6102:5091:b0:632:a3f3:914 with SMTP id ada2fe7eead31-632a3f30b8fmr3055820137.7.1778506803769;
        Mon, 11 May 2026 06:40:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8c0c22b70sm1360848e87.81.2026.05.11.06.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:40:02 -0700 (PDT)
Date: Mon, 11 May 2026 16:40:01 +0300
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
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v8 6/6] arm64: defconfig: Enable Qualcomm reference
 device EC driver
Message-ID: <f3frppcx66vctnnbuogszv3caissgqrnon2kpj2rpdmlpufo6y@vrlgjgisxubb>
References: <20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com>
 <20260427-add-driver-for-ec-v8-6-702f74e495f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427-add-driver-for-ec-v8-6-702f74e495f7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: b_eBT5qIf1GWUR5urO5u3_Jqpr8Qp-NB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE1MSBTYWx0ZWRfX7MIuYqLmzXjH
 QU8devgORnHYnPT+3HATLmgVGgOVFIqBEkkJU+yw8UVoeLv3QQlEa2xXvr1Rxkg2w/cj5pjO7Tz
 0eraR0K8vTnKNap3wTnC7Bt4XnEowNdAl1KiZ1kg03aKAHnICbon3vWiyMRiz/scXW/WX23a/3d
 6rO+2wtoR6J2RHnHxcbYihKzfkHwxvHFBz4f5XEVNFgfnQyrLrFSkJkd8takC7MvTSDuC7GJzfM
 64QPZa+NdsI9B6Zn3MQl/s36Dg6RD238ytp77/h6i5MciJRerdDYEofXu4Cire1izdBr/7SXpMK
 jpMMMm2mRodOFe0JhtbsV1SaW0841WJzyDxEQXKf6UUa6PJxCUVa4NkIKM8XOMohSjFfKdS5fDb
 hlpHHFDUrLe0PTGxFB7oELsQjcbmh36wNM9AtX/J5qt4x6Z1ZkVQeSNvKFR43LXkzWiL0rBpD89
 YNfFqCvvpyf0WifFNrg==
X-Proofpoint-GUID: b_eBT5qIf1GWUR5urO5u3_Jqpr8Qp-NB
X-Authority-Analysis: v=2.4 cv=NODlPU6g c=1 sm=1 tr=0 ts=6a01dc34 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=8EeM0g2abuOJCfGMYRMA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_04,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110151

On Mon, Apr 27, 2026 at 03:34:57PM +0530, Anvesh Jain P wrote:
> Enable EC_QCOM_HAMOA as a module to support the embedded controller
> found on Qualcomm CRD reference devices such as Hamoa and Glymur.
> 
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
