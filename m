Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BE52BEC49
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Apr 2025 12:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745928581; cv=none; b=CYYxu7YGZeUkEEjSDYqpsSm6f7dgKTAtaAH/2AwWJCa4rpiiS6cm4/4OeWl+F4CjxF5D9bGEeqYr0DmQJ9AB9fT6lpgpAdxPwnAQ+tYFIjt3TsLbRKgoKTYPdJ5zi8kSv9o7Gfqsure36DbaE0Gi3vY2Yo0jWQI993qEXFHG1X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745928581; c=relaxed/simple;
	bh=JI/M3TugvXmROCbZWvHzHoi236mkIUCGUMYXkYi7au4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rxYl0BixOxcOAYzA8Q9g/yYO0bRzL0OYSPemRmFdF+/Fr0DYfdlKuggl5SBiNL4ql0VjAuENp/veU5LgmUem3kU5U8fk9iZ7eOm++2jOALzCAbTGJ9vak+m624olEJCtXeRnghzy7irPDOYmrcyBiJI1XGiRrSb86W54Tv62L1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KkGLmgB1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KkGLmgB1"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TAKtus000496
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Apr 2025 12:09:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yAp0LdgXVQkJihbVytViUFNy
	VYiIbcoCGNDRQ8jMoF4=; b=KkGLmgB1DUQVYWqXwzauECf/oT8pq4VmjVHlEunk
	60PS2gs7/H0DESvhb9ZkWdajJVWYBc8XZJ6+r3VBlX/PrWCpiVFsMOKOjWwsLZ4t
	sXQTvabHEZhXvFjTVeV6ojv0tXyQyMf+4VwIdfW/+cvhKbD2+Cptb0qLFNbYBKOV
	kCgjxc0jZnxjzNKDyp8jynZy9R89u8Wrt01rbIVpNTIlJHDyWm9hQWyDs49ffJbI
	SEEtVDUFdikzuWOxvPwun+mTwUweeuxz304qGFE9FgTXReqbnwaHZSozHf/PX2XC
	DS17DjEVCDPYU9BhBSG7uHOMyzzuv/3KfNKxuKl89G/dGA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qv9mf77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Apr 2025 12:09:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5c82c6d72so962323385a.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Apr 2025 05:09:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745928577; x=1746533377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAp0LdgXVQkJihbVytViUFNyVYiIbcoCGNDRQ8jMoF4=;
        b=wYGiZ9mDotpL4SIc8Kmx07sCqZn4GOl8pkCBeOFqzrtDvKRh9ydhSSiMy66Vp6pFdj
         Gt2q/bvdL8C1QJXzb392eg6WoKlVCdGaybBYWbf3RPaeH54v7n9/zlIu+OrS7MAvB+vp
         mwWFOp1Kp6tzd5l5iZtuw1DGRUfgeQUIb27Z+ok6pvDYtvkab0DnTDfiFBTp4xjmqLs9
         54L37OnvvKTT7l8ooBplcvFxmLh2OGX+xqEwBa9j/6DHMr4lXvHIJQliuynIitiRVFKn
         R0NIVowBXUQMIpR9FvOYm1AcaE73wSrxP5clDaFJAweG+xyQZhd1qHakrCGf783IGOjJ
         Uudg==
X-Forwarded-Encrypted: i=1; AJvYcCXJSxroSfUbFfrqTTiDZKHO+CMYIS3nxy+Tk3/QhG+ZFs4rQ1VNpicqV3yL5EkIUJZu488f1tUCViCvIGhvuWc1dTUa@vger.kernel.org
X-Gm-Message-State: AOJu0YxQZnHwmL/rFfNdT1+eDyVmXNb7z1xZ9xxOr5pM2RJXE5q67ad5
	XM6VB20a8mPBLY7zsPRIylBP7HyWTtkHLZfwVviycmSp8K5HyRcNKV1gh/GX8zuc3EDVS5ldhCv
	FG/rJFdkPwuHnXetkcam3h1oQyXyuYA+/k0D3MMLHzmWUfKiHesK8SSQPMJoz67oUO1DNrE2A
X-Gm-Gg: ASbGncu0b6LsTSKYZsE6MzUBdLJr1Yt7udfKAlhCXGIZVa98eazJM4ZkatTzivh99Rz
	TfAlZ5s7C3Q5M3cK+T8XiZyCDdZIEdch6GRQfdMiuQ/PGdxJ+7zuHs2GTmVj3XmW8yAry+Xy2jX
	vhKdP0bkPuuBr4KrgacaWVr3kvbhopQ+XJuNMp5ytl5XSt46mlBpHYcFWCOwL2PXch+/FgRNp8n
	rCHr+BMQkn1HRo0ksYFLI5vmwC9/BUIbe3dxRTuTvtK4kZ/KvZr0iwJPtYPkmxLMlHT2UuaH9qA
	X9NWcJTsRehVD0xQHt6TJheZDm+5P+2h18xwAksaTkpxWW9QdvGaOOvGcu9HyFpMNGTTDTpZ3As
	=
X-Received: by 2002:a05:620a:8802:b0:7c7:93c7:83b8 with SMTP id af79cd13be357-7cabdd8fac8mr556719885a.31.1745928576960;
        Tue, 29 Apr 2025 05:09:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+WiBW2dMdMKjL5rCtckyag5tI3q0y87zTTMxYAoMUgZTNEX197tRyQ4loVEQ9A423pNGqNQ==
X-Received: by 2002:a05:620a:8802:b0:7c7:93c7:83b8 with SMTP id af79cd13be357-7cabdd8fac8mr556713685a.31.1745928576612;
        Tue, 29 Apr 2025 05:09:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d16a85ecsm24278761fa.72.2025.04.29.05.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 05:09:35 -0700 (PDT)
Date: Tue, 29 Apr 2025 15:09:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Anusha Srivatsa <asrivats@redhat.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 07/34] drm/bridge: lt9611uxc: convert to
 devm_drm_bridge_alloc() API
Message-ID: <lg5hhtncppqy2vreut2z7h36mmnuzn2xhw7asrjmftqg7koaqh@as6jetr3pw3b>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-7-8f91a404d86b@bootlin.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-7-8f91a404d86b@bootlin.com>
X-Authority-Analysis: v=2.4 cv=AO34vM+d c=1 sm=1 tr=0 ts=6810c181 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=P-IC7800AAAA:8 a=iF-wyJFYdUVxq7VKmwgA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: juzbWzQ1eCF2_D6G8ybhcERMO9PP2P7J
X-Proofpoint-ORIG-GUID: juzbWzQ1eCF2_D6G8ybhcERMO9PP2P7J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA5MCBTYWx0ZWRfXxhT4laWvW/kM Pd01/VAUVqn7tRGF2Fogul5X94SFh1d6bG7GLES5XH5oJh2b5DHmqdML8IX4uQoN/yWKsZkBASQ O3hrNpYI3PsauDcu3vsAux203qdNU9XKiW5rDe+XJgIlI8IEkx3EyYcP/FFEYypM4JYsEWllOAP
 na/5uHJdfbz1I0/7c7E7pB+3vZwb83dJK6nFT3lNEjADvDa4G+zp73C8fFYVTwi2ppHzC4jQY0Z 9wrw1lJRp8I38SUH3SIo84bli0/FE/cpydnEaT6WNqxBFvnn+UMUz7z4FJ+Yk2hLAaW8R8HPHi7 52lmRftCaxli1zOZ5i1xFJrsErHU1nfIKLCGL8+u5agyLbXpXLwCu/BFL5litS03ryRilkpGg5R
 Z/Ckz/mFvkdrQBo6ftUw9qCPLmCKbii8qZLOJVYD/yTMChpHNAyn679lZ52ryPs8Jk7SMhlI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 mlxlogscore=719 mlxscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290090

On Thu, Apr 24, 2025 at 08:59:14PM +0200, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
