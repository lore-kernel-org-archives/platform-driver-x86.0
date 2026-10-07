Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D265C4AD7C7
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2026 13:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791379427; cv=none; b=XAlWvaMJS3mzA15xHxveR1d28EahRuU/WFvWpLicnfneRv3w1+V5MuXiyidDvRrGYgxyFTT5AHGx/UGt0EevaCCtFz+PSAAVj1AzprMXvJHTQ6aW0AkScz/vNDmKUAIB00W72HR6AtI+u+FvbKToqaq5mZmsUTJ78F668zDRWuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791379427; c=relaxed/simple;
	bh=mQsliMn1SLv97iUfP+osd1J6vLUHUvKgPR541ZNY6lk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KuvX8322KNWOzLsffEBEfP0B48FAz0OgaWlNIhdP8wLhx4GTuf59sSWXvtwAWTTXRPablq+Vn4kbHQb1aOoBu2vB4J8pEYkIuCP3Q8FhAoBjmZsMpQ0xqKX4WuI0x89DX01oDKvrK+7AVBtyUAZlrkljTdsXpMl89TcvTpzqyb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jyN6id0g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kvL4SPIE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jyN6id0g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kvL4SPIE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BVCfO3198234
	for <platform-driver-x86@vger.kernel.org>; Wed, 7 Oct 2026 13:23:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=od/ltRzE348gH+PAnRq5JK25
	RMcjNc/ilrPe7ahtxwU=; b=jyN6id0gSsAnxV6VXP5219pJfa0SnX9aV4tRRPrS
	wLSN9cfqHQS+uSh6c1HCJYp7Swy6KjdA7sFRQVDHnuL48ZS/5q/jeLk3G17mYJqt
	VEJTwcUQLYDrj36WugDVjVkE6hDTq04bBsU0jlzAoko9Fhv4PLWolNo92ljYjVoe
	HWX+ngyykneVl52olGUhIf8AjicMlqHwRERG+c6r2aNKkrjabMu84yizbMLurIIB
	1wSwLFydOCEYyfpgvU0+k4JyMBz03KhSsSHGnjyIsi1Mn3Ba3KfCwmVcYa9L3gF9
	U48zluwhnddUC4j/S5WEcfwHWXoWJ+4eR/E66a3LS7OZ6w==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c1s2bj1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 07 Oct 2026 13:23:27 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7bf3a6cf1c8so3381595137.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Oct 2026 06:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791379407; x=1791984207; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=od/ltRzE348gH+PAnRq5JK25RMcjNc/ilrPe7ahtxwU=;
        b=kvL4SPIEueft8aug5RxfbV3PAkFLkKFTHZAWuuvVt+UxcSSxLMHBPgmvWHh+FF19G1
         m/C/abKsqE5AvH0yec+bR7tBX4uoD9LArBUwU5iAww9Rla1sAaERMLrbpLDxD0wVgyPa
         uK8iTP9aMW+tdYYz0K7eL0P/sQHsQFMdTFt0FWH3RenJvjMm0uMPDGya5nPsMBcsY/1M
         qJnbsxbEAPgIp0zS7AFHu/Bqp3mJ7TOIWvtWWI+2EKEIjMzu7P3dx2LtId3yT0Ym6kaX
         S5LUkuGz+889OrqzpHPU7h85yFoCyCr5tSaKlOXqJUvipREUt40LOXb1VWC4QIzSiUY0
         4bxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791379407; x=1791984207;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=od/ltRzE348gH+PAnRq5JK25RMcjNc/ilrPe7ahtxwU=;
        b=el4VjMLMqBcBM5Xo2etZtVwj7GIp0pnJzdekT8C+BmDDqTRbdVQaG3jtf1eGd4Lkgk
         LqgSZWVU3YDkd5+T0uiI60WxiaySPGxfokr7WACA7BrRlmrFflKRFu5LJUhETIO9zCoy
         r/aRWsLn5Ubum+JTWjlgU6d7ZUKlABXaF0jcI0/BSQepHL9kVuSocCQ1e0qiGnCkAg97
         ExetUfEZtl/4qZZxiByMTNWdR/kwytCQfvwKKoQL7IKEIu6bPN1Bi+fTT8EPmXBqwZzB
         51Q0cxaXelhNcZooL8XglbfYhnFoUX2W+Aan9fxu0c/ZYrj1NkfD2jd1qo6AFKXnivuP
         s5GA==
X-Forwarded-Encrypted: i=1; AKwUvBwCpgt6NJbRSCCS97cjGDI1VhfsmPm63SUdzBIyw9lR1O2qvWSZU8kbGxBZQs38PFdXvi1nCK0YRmY9hdK7xEo8FtFS@vger.kernel.org
X-Gm-Message-State: AFq9FYK27zDPTG8r41zCRG7N+ifipduIrHuOVjNRL2HJGD0ff5Zy8sDy
	ipQ7jC5npWKz9n4iGfrkKSLI52L1DQZ1gJYGwMqPLte83C8uU3mufnXKuYQtjGdxqMLp3Su+eRG
	gbaAako6QRBhJAovTv0JeKuTOdG8N+hdStGbqeYcTDfb4NCyhGxqzYuAOt2Ii1oigpzVa2FhQYv
	33
X-Gm-Gg: AYBFou0P4HPI5dty7hqlkyNpoN+A2wl5qReA9vLuo61qMG1PUGC8OllJ1L5DquLUZPF
	XCebPX1hCSECrVzezSFSVlFf+IHRD2rBoUjTD2Isg5nG/ImIbYENApPvemOzRhcU2dFvXMbm+tz
	2vL4g8a8nt+THrzcLbueW/b87WSkwH8oQz0CGhlcpxzVhnhcoLiL7HkGFOVCg6K5/32f3cWz+7G
	7Ws5CgntTmf+9Bq6zgZqXo7HmS8lH6yu9iZ+yrpv5NWqFzHkAbjU5Y4hZwZhDclGwg9RbkDChIa
	ts/RtTwJKTx46sDtN9q+GCXP7RC8eEm+wxu+nIJfWX7Z9sFSMkKPBtnmOmucy+y+u81EOiCW050
	HkmyYIyPjWzPQMFgXmGMuRXDBOG7B65Y8cNGMAd/5mg4B2gDQqE9hVqLEXoydrQ5BLvj6CYVkR9
	gUShFoSsE7mROS
X-Received: by 2002:a05:6102:5088:b0:7c3:1898:e8e2 with SMTP id ada2fe7eead31-7ca3890b52cmr688228137.13.1791379406732;
        Wed, 07 Oct 2026 06:23:26 -0700 (PDT)
X-Received: by 2002:a05:6102:5088:b0:7c3:1898:e8e2 with SMTP id ada2fe7eead31-7ca3890b52cmr688194137.13.1791379406242;
        Wed, 07 Oct 2026 06:23:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcd308255dsm29300e87.35.2026.10.07.06.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 06:23:24 -0700 (PDT)
Date: Wed, 7 Oct 2026 16:23:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/5] platform/surface: aggregator_registry: Add Surface
 Laptop 8th Edition
Message-ID: <zgg4st367m4s7gfttvmt7hi4khx5haw4436hmde72mu56xyft3@t4fxnw6c7jlm>
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
 <20261006-mahua-surface-laptop-v1-3-406fc042162a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006-mahua-surface-laptop-v1-3-406fc042162a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: KQ4u2kkUr0PktSZhp6_-oj1NGcs338GN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA1MyBTYWx0ZWRfX8cn/DSlQJFKA
 WLKVIZ2bBjiL9myGImIccrNbUfnueJ3HgGg9NywjTXBBma7TjRd0yVng8OASHpISxhlWKFcrUbM
 uH/aAUCOwTwD9iDQwEHBQKyZ+XL1rrKqABB+iYUjmKEwf9SicxLfg4DTwiVh5ZYcosFeeolOjUF
 +AmFueHgQzAxLJKXuuKr4xxULfXm6/dJdz7Q3CHa0ViDrh2io5W98V9MzSUWYxTQcfAtMg5vCaM
 t9z4C6lpgCdQKbdCKCIadgAl/+JhvOdWEjmrEoGD/quHWDenIwFOMB2uG3heLHa+7WsyVvKHVJb
 FsL2MqtCF4sfFLJsuYNlcAjahNBlguljb7pgBQtLudX9rI79GutB9yFqt34+0hLH4pMFkXd46Y1
 Sz5u82RshXMnznuhT/Hkun9a0sgw5PN8zA3VOFp6XiEcykmWGP0jfZL5K3CfIKgYwALm2Uv+lSD
 1zrn6Nc480myyxVJcvQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA1MyBTYWx0ZWRfX1u3FTBtgK2Be
 KgqhxeMfM60yXHTL1Qx7hQysdAO5L0LrkHG/Ffg7QbnHi2e3WSHo3inm0n//Atn6f4wJDpEbvV9
 Qj/1Qd1sPhIYzcQKocKfTYjclaYXCj8=
X-Proofpoint-GUID: KQ4u2kkUr0PktSZhp6_-oj1NGcs338GN
X-Authority-Analysis: v=2.4 cv=NatzRGD4 c=1 sm=1 tr=0 ts=6ac647cf cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=lafGyRzbQaP5-a-rDggA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070053

On Tue, Oct 06, 2026 at 02:50:29AM -0700, Gopikrishna Garmidi wrote:
> The Mahua-based Surface Laptop 13.8" 8th Edition exposes the same SAM
> client devices as the Surface Laptop 7: keyboard, fan and platform
> profile. Battery and AC status come from pmic-glink here as well, so
> the Surface Laptop 7 node group can be reused as is.
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>  drivers/platform/surface/surface_aggregator_registry.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
