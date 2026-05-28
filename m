Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E103F23C4
	for <platform-driver-x86@vger.kernel.org>; Thu, 28 May 2026 13:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779974370; cv=none; b=BvBTeJ9D7ClK1Xji9VYBV6VVM5S22Gzh8HOgS6jxPgsRZJLUh/Wcst+F1q2T3DcKR9hX17+m8EFPzhrblZ6hIutri2hv/q3aO4cz8bPei+Koker9iZ0GVr5UQs4nMIEQve1aPllQnwFgs9Wb6MceABs0Jt4PL3Zg00THPBZnWFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779974370; c=relaxed/simple;
	bh=4B4oHoxKwPUBj7bZ04rWd+Qm3aCpRupCIEC4hFxTaDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YWYUeMsNwqNj9N+0wLUqiVxGsiTAyWshhP+5bTbzOBjTliTVSXYfHwt+5V1WHuudwCzPOKXEOMwWyA4WAjdovebZEnHQOyNXpLDd+suZjfRgiK+C0Eq2MagSePk4pnbJPkaCb2nyXL1TrYNHUmKwcAdhitne69T18NKONaV4U8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R5iYKOAc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VY4xVWRk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R5iYKOAc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VY4xVWRk"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vZjd4031409
	for <platform-driver-x86@vger.kernel.org>; Thu, 28 May 2026 13:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4useIf4eLqCZe5bOXRzatW9D
	bQChiyEdf+RF+QCQ5+Q=; b=R5iYKOAcT3bwEKJ+H6PZicn2pv4zi5WVmalWCqob
	iEyQidn8MrLgEbbDDAsSdNhXbVom3hP0oMkE11LHOeGrdxlU7DKFKy2Ka66d0Gcy
	eef3wV4J1RRAAZT75YIgF8PSbXw0uQuY7Dbg/Kx05jCSqf6plZ+Le37onO/P0hmH
	ZyeyicVDAsHdUqyPiwwMq36LENgNEawsBQZJZDwMQOU+qnkEvfI89sRObgpj0hes
	xp9IFpouHSyoZyvVOFDu1indYYt9vnAAikHid1LvTtYEOji3sZnAsuEJre/+UGI/
	yyRC6Qmr5qmjixQePXJkgSHFlSh95RztRMgLOugrDjWXXg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y4ttrj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 28 May 2026 13:19:26 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-575590529a0so22943446e0c.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 May 2026 06:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779974366; x=1780579166; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4useIf4eLqCZe5bOXRzatW9DbQChiyEdf+RF+QCQ5+Q=;
        b=VY4xVWRko8nCif4VnqVarrds5W1RZNlQWEp5GOMKaUWJEO4x2QQGiOB5pDM8hqWjDT
         4spXt/3G6jTZiGTbyr4zaeya3SFNeJN+bSKpsgaLoK5kqlhnm9979fyZt2nIaGzYTE9W
         psUuqov3S6q3w5xB32WoHZF4+ygr2cqQ21sJ6JZkD0z3OZq/UCroAdPJCukEKnvAK1a8
         sr0iSAoNsy3/RLj1650sK9r+qUE/1wEkOm6OLPbUDWtnAFi0PKUuVhF5fIV+eARCWWYI
         PoM5Gz9tBPDNpe/GYQkKfOyj6993SJJQN4E410vB/R4revhPp4NdSwCXVzTu/2DxV8XA
         dm4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779974366; x=1780579166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4useIf4eLqCZe5bOXRzatW9DbQChiyEdf+RF+QCQ5+Q=;
        b=UpSR2XLEF5u624BmPA5GrJ1ES0dS4Ugt2Pf780CbBRqVGWz8BG6UH0V8ZIx2h5Vxtb
         K/TicB0Azt6VVEoHCCdYvwZe0j3LC81Y4nVGhkmvmfZlbxBUQsy/J76gF3d5KlvDciW4
         LRDsKU1KX9O2F+RO2lnp88KnfJZymXoHdNZn2g4pO4ug0qzjT3VXGS3667tYYdI2gSnH
         /sCIWwmmX5rsvEUGc7Tp9g2w4nPy9iCPLKpqh9RY88LgaEIJ4TFcj27Za+oTd8rPPzYO
         75haJIkz7Ryq92w6b8m+16KDYgEuj9gKPywMpQKj1Oi/lmRALHsp8l46yAWXvK0urTBL
         e3Ag==
X-Forwarded-Encrypted: i=1; AFNElJ8mY426VpHd6+me62Cfom5Q6a/h8ERikLFul18T0KvQST5xN6ngr2Uz9YzWZ7wUcY8a1rXVojvPKSILRYbI/SpPtf0O@vger.kernel.org
X-Gm-Message-State: AOJu0YznfuRtlVe/FttW3G53IgOV86T+x4Tzrs1VNUOSNVv4cmI2Q845
	I+JDqFV7gJkRWZZZEhV+3YqB0cjsEH8JAPOHGsTxgN8DtFm/yCPNkOofhQsHAlpnUigrDzYhL9y
	KDiyvCcQfV5bpWTky0j88/jWf7li3VeNjpsqu30yOIjHBoNqEm5KFgmXWOKsfjMWVpAXxnHacm4
	Z9
X-Gm-Gg: Acq92OG2TEHJLxrkX49FQ35IW+qaE7IG0T6PQScimwukSwld+KujgUvEUeIvf2fzt7/
	dktcRaWZasYlogCRiwcdjNoqso13sOVZBOyNNHOxQK9F7XO11QiZiFQ+ziE9XvU1YoqoBeDpR0w
	tMRIlTjmbx1c4nQJXcqJfL8T4sCsQ82e4ZbgFqEHMidES6tH/P0L2khIV30DYEjd+jZtqcii24X
	AgifThVad5QiSAxMkmfemyYSJvTQ6eIxIdn93hpq1wdaghXPn5/ve+oM53ewvz8XyxK7vWvaJxN
	WjB/tK1UILgPVKiPM5u0e5Ho31ipgMBnD+5UZKAQFGkaxO5yh5gW+/mGr7HDEIqqOIimAhIHhzT
	7A8O2jDB2LQM9dIRTtpUSThhpqBSgxCg7P2jHh0hbXp8EBTX9ORmlJAhiGjAnQrRVZKZ7XTyCmQ
	ordP5JMvcD4s1Q7OsmgGgnjwETJE5cNaw2PKoaBWiw4E6gYw==
X-Received: by 2002:a05:6122:1d13:b0:56c:3a57:aee2 with SMTP id 71dfb90a1353d-58660c8bcadmr16307644e0c.6.1779974365784;
        Thu, 28 May 2026 06:19:25 -0700 (PDT)
X-Received: by 2002:a05:6122:1d13:b0:56c:3a57:aee2 with SMTP id 71dfb90a1353d-58660c8bcadmr16307589e0c.6.1779974365298;
        Thu, 28 May 2026 06:19:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa463312b2sm1891842e87.62.2026.05.28.06.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:19:24 -0700 (PDT)
Date: Thu, 28 May 2026 16:19:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>, davem@davemloft.net,
        neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, jikos@kernel.org, bentiss@kernel.org,
        luzmaximilian@gmail.com, hansg@kernel.org,
        ilpo.jarvinen@linux.intel.com,
        Douglas Anderson <dianders@chromium.org>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: Add Microsoft Surface Pro 12in
Message-ID: <q2ffaqisybasi6nfciy4iel44kwxaiqkzc2fv2bo6omrsodbpg@mghuize6kwco>
References: <cover.1778822464.git.harrison.vanderbyl@gmail.com>
 <8ac29ee38ba80a3fbde8bfe43b74b9b936b31cb1.1778822464.git.harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ac29ee38ba80a3fbde8bfe43b74b9b936b31cb1.1778822464.git.harrison.vanderbyl@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEzNCBTYWx0ZWRfX6iEEsKiX37n/
 DcHhVM6+peMHWpiV07tHE+vMxGJ512JcG7k7eAK0rqeNuGXNwvwnnHWwm1SXlDDZ2+GRLJ44Py8
 9kOxVHWVpPGSzg1KojfPWs5odQkAliUEoFuGN9HOy1uhs7zsqd1Z84cgPOIcyiq98pDxhlalHFU
 YrLfL/0LyPPpRVTsYLyrsHY1K0ROq7BrVdhpId+61CJyb6a4XcRaZb+Y3/x5vqbhzGu+DQVnyJM
 hrzLu8+rpXTc5FcyjVMxowaQL64CInuC6Fh2WhGszRXZ5+sXnqGc+eaLazP8UA9M/3vAwhbnpM7
 9ZMWtd2IWhF0zqwrGyf8gziotO3ZZxza5eafvWzwj8L1FWWXvfqa2FKLLrUyTlZCRGWGwetE3Is
 +/99HTSF9Lm+aP0ax8IBSo/nyFmwscE5D4nWt2eA/GggmVd1+3jbV5y2l5wFAo1ii3WSv/Yu9jq
 EdVX/5C14EeMrvyWAfA==
X-Authority-Analysis: v=2.4 cv=feidDUQF c=1 sm=1 tr=0 ts=6a1840de cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=NJ6gOXVS0vVz-tHME-0A:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: Df9qm6ghP-Ft2mEdjtVjCy8p-LpaJr7G
X-Proofpoint-ORIG-GUID: Df9qm6ghP-Ft2mEdjtVjCy8p-LpaJr7G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280134

On Fri, May 15, 2026 at 03:41:52PM +1000, Harrison Vanderbyl wrote:
> Initial device tree for Microsoft Surface Pro 12in
> 
> Currently supported:
>   - UFS
>   - Touchscreen
>   - Pen
>   - USB 3.2 x2 (DP Alt Mode)
>   - Audio
>   - Wifi
>   - Bluetooth
>   - CDSP
>   - ADSP
>   - GPU
> 
> Not currently supported:
>   - Accelerometer
>   - Front, Back and IR cameras
>   - IRIS video decoder
> 
> Tested on Surface_Pro_12in_1st_Ed_with_Snapdragon_2110
> 
> Signed-off-by: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |    2 +
>  .../dts/qcom/x1p42100-microsoft-sp12in.dts    | 1201 +++++++++++++++++
>  2 files changed, 1203 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-microsoft-sp12in.dts
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
