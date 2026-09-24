Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F08D1FC4
	for <platform-driver-x86@vger.kernel.org>; Thu, 24 Sep 2026 11:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790249603; cv=none; b=F1mrEoTMkL215h9dH6Qb427LZjW6fWxiH2kFTBQH0VTPinA5bAes4vUdRFvV6qfYJLKQpPTmRM2bYOt25+TplOwi5LSvHlcTRCujBBomc+Imwp0M2D5/H+KrUVbGVNZh+dAeAYaa+Uoddh/C9RvXN811vdHiI7HV/frnkbdksy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790249603; c=relaxed/simple;
	bh=wCnUXCK0WZO4NnQlqvBDKz+4inN5YfMZjMTHZjG1y3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fQGQQazCOfvNs4hR8OOciLgJlgW5r54EG6dxSx7xw6cbR5a0VaNQCHLSHh3O3Flxiu9fj9D2IPhOU8Sl+sDP4D/l7Tet3cgzefQZbFNnFmRbBtt++0AS2x5bciQI3TDGEsG538LCRkIogUERhcJqK7QCPSIXQbBv8UVCJfhYLZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IsRFmiJj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MdltRVPw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IsRFmiJj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MdltRVPw"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9Pggk1270209
	for <platform-driver-x86@vger.kernel.org>; Thu, 24 Sep 2026 11:33:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XkseKV+yt4Jy0qKqCZ9EMQvZ
	YwHKUGqrc30BMVfNwi4=; b=IsRFmiJj/bR+E/pi+HBhTPjZtcPG4aSH3W7uzcoP
	1AkmcbvhlkMXrU9Kay6CwMrAeFLak4U+y2UmuPio/SjPY4xngSZGD2+gxEyJemzI
	IJxDUUb0pg97yRRgsPOjhikSH6Onvg4BfV3KHlv/tWZ3OqsFS6g2/uCv1bjjFT+D
	AySxXmdD/nMnXdNkPO0EmCRLd3I3Obagxa2F8Q5ZwOexqslBBci0YU368qbxuLni
	eAzXLAbkdXpUX5F/D7wrCpJj8OHHBajtIXEKMvz+Kl4baXMYgNhzlkbh8Pwc3e5w
	O72MS1DkdNb345i/I79xp9uh/sw8jNmrTNeSATwqQhrjyg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvr90asus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 24 Sep 2026 11:33:16 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7ac2663eba2so1476635137.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Sep 2026 04:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790249596; x=1790854396; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XkseKV+yt4Jy0qKqCZ9EMQvZYwHKUGqrc30BMVfNwi4=;
        b=MdltRVPwKpi7SrLkC1Vp15c3p5Qb5PXhxlSqBq/JYWwkN1xWaj7fCnucm75huW8aDD
         QUvkn9hJjx+mxOPBGlO4Z+EwzVGcmmR3e/9234lMWe7gcVTrS8XyypcJaChAjKyehcg8
         RA3+H+2B60dCEC1suMzQ4H+x5zb+gMTfnyaHD0+CO5S+ApxuM0iYq3w1H2LqLM0jA15A
         LwkMRzEeSR8/Zx06pejKA8T94jXH8Bb5+wAquR+wK1R11rxCb9nz61BjV3w0mt5pKufQ
         kW+vhHC9yjIeNRGw6TXE8siXrbaH02knIGzR0f9bCmSq1jADSanmZiQtPsl8NWU3ZckT
         SPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790249596; x=1790854396;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XkseKV+yt4Jy0qKqCZ9EMQvZYwHKUGqrc30BMVfNwi4=;
        b=CkUIhsNrV3lCyqlBpbvTRlxcJ+fD28v/mhiA7GvSQ9dMWHtSJg0Z64zKCPaK6OkhR7
         FoDyyxf2b2zH67mFtGXEsuINSxTBNqMy5RGtgV+S8ubesN4Zt+bXOsklIFoi1pPeDSgm
         JasKyUu5RZmA5E8r6dEaIE1f5/FTcgM2fdecfEUQhaBYo7MCAi4LuYIPZO3Qx2QYSpTf
         maE9IOv5H7JxmhHXQdrvQYst+0NKF9ncYOR0gHhn4m0UePdFhg2VKyhWMJa8i/Hx21XB
         jLKgIvzLrAWo5F9IGjO5WxZwjy/0jWjG06cT9M5upbHobP69EIzk6whcGyvXyvDWWp0j
         crlg==
X-Forwarded-Encrypted: i=1; AKwUvByJ7/UdvyM408+5rpySIi11Ru230une2vsmXOApPzzi7pFTz9n+4VWrkenFaZ5P2JT2u003tkBQkC5vr8slLzrE6Zst@vger.kernel.org
X-Gm-Message-State: AFuF++mutTOr21GNQvYXmLdY7k14754TXXeFUuXYraRhgbndl2dd4c2m
	qMLmx3u5rpRXwtXF29r8nSho0TlcsZ9N0wj+lzqMV93yUoytAwdnyXPyUQj99tp9nSgR0ClbkJ6
	seN22aCt4Zs19g+6lf4q0ZssklkpqRzPPAFrdF4D1s9Bw/V6qKrFByRWiBy/gBZ8XIiGzMinbKj
	gd
X-Gm-Gg: AYBFou2Boh/KV3Ewa56HEvAfqElNiAcNi6ebaNBH0YKBejXBKfmYKHui60p5TMoGEmQ
	2lhEvnIV2yeghkXH9Jv7Sw7bJ91J4acF9GInRV5aIi6KEGTo31EdwsZdJe7CE/QLu4McY1UfAU5
	JTHBeS7Ir75wKdbgpzDWE3yovmHhKlrSvfptyJ0tLbNzON17AeGDrr6+LewpIQrIwDkX9XcNizh
	S+wqP2EmLNimf3ZfCRI9s/a6c7OCvO4rSwhru5y9c9Tw02tKx5IH+wDrn3vNkiq4sDQ4+Ed6sFE
	ny+smSn6irnPUbt6lhwjtXLsf1p5gKqepc/Xzy7kapgnZBzR3eVRMyfk9ZHfxVG3lgw3CmADIu8
	MCguTLAewxqz/bcw=
X-Received: by 2002:a05:6102:1489:b0:7a1:f7e2:aae2 with SMTP id ada2fe7eead31-7af1e6f380emr1107589137.20.1790249595757;
        Thu, 24 Sep 2026 04:33:15 -0700 (PDT)
X-Received: by 2002:a05:6102:1489:b0:7a1:f7e2:aae2 with SMTP id ada2fe7eead31-7af1e6f380emr1107577137.20.1790249595157;
        Thu, 24 Sep 2026 04:33:15 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868889130sm13762102f8f.37.2026.09.24.04.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:33:14 -0700 (PDT)
Date: Thu, 24 Sep 2026 14:33:12 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: glymur-zenbook-a16: Add
 Embedded Controller
Message-ID: <mkqgu53cyajjjbrvwyqv3vukag643g7x5ypjhzh5vomrd3lsvk@yq4oely74xw6>
References: <20260922-topic-asus_ec-v2-0-0bd923d1b853@oss.qualcomm.com>
 <20260922-topic-asus_ec-v2-3-0bd923d1b853@oss.qualcomm.com>
 <uv52rxc6llmlas45mejbeeriryiozh3v2f2itbvfzo4f2sgazm@ly37763jkftd>
 <8c9777c5-f323-406d-a996-17bd1a5b8946@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c9777c5-f323-406d-a996-17bd1a5b8946@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NyBTYWx0ZWRfXxMt3Sq9dm7Hb
 mr6dpMm0Oxgkc6tjXLAGPPIdeyOm8Xo79uD0fSI9/fGZyE6DpZc0GIwRZ6kdMPrcQPyGDkp5pYS
 ctaeC9n6E1GL0++Z7t3iG2WXzjE6zSM=
X-Proofpoint-GUID: mye6qyhcAgAnoYfJP638t9lufukVGevI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NyBTYWx0ZWRfX3+AmcxX+mG+e
 z2XHtK5ejHHKIpoA2EFQt9ZTMq0TrMK7/Ib9YVMA9gs8kfeBj2CTYFHp6cwABbim4uOqGiOdzMV
 65SOvv8EnvAAfJlMSq0/6TJYDA9k+hAWKyzQV1/+I1o5lhv5E2iW/i417JLwYpGQXxHBeluLq/a
 sCl/6yIgcjSALfd3Ukg5bKyR5XcQMLHHgsWDJqwunqG+SnWbPmblL+SN9qqCmUuHhGNkP2Vne9P
 buiOVr3oxXda4sCMNdRcEJ3UWTf7YdSfK83vO1hfx5tnz7mZV67VUdpEUDLn+wLApHB2eYWTcxD
 MNpGlvm7BsQx5W1lykoTImPBXiJ1/16RLxAhdLl0wzntE4LcYHOyF/Xb3UYT4qDx2sN5SXm/ug4
 7RQuOg87SWXPZDkaEH+2ezroW5ENSaaCdhuVmL+HUGVeEFd7iJ5HxqPeqNTvh5E5KFe9Q1engSF
 2FGaT3RUEc3Z5FV85oA==
X-Proofpoint-ORIG-GUID: mye6qyhcAgAnoYfJP638t9lufukVGevI
X-Authority-Analysis: v=2.4 cv=fMusTpae c=1 sm=1 tr=0 ts=6ab50a7d cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=kDAAnAmS2xGMtcqLAaUA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240047

On 26-09-23 12:04:32, Konrad Dybcio wrote:
> On 9/22/26 10:31 PM, Abel Vesa wrote:
> > On 26-09-22 11:33:38, Konrad Dybcio wrote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> The Glymur-based Zenbook A16 features an Embedded Controller running
> >> custom ASUS firmware (which is loosely based on the reference Qualcomm
> >> Hamoa EC one with a lot of modifications). It provides keyboard
> >> backlight control, additional temperature sensor readouts, fan speed
> >> monitoring and a number of miscellaneous functions.
> >>
> >> Describe it.
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> ---
> >>  .../boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts    | 15 +++++++++++++--
> >>  1 file changed, 13 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
> >> index 40433dc2d6cf..d3356fcd25f0 100644
> >> --- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
> >> +++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
> >> @@ -670,8 +670,19 @@ &i2c9 {
> >>  
> >>  	status = "okay";
> >>  
> >> -	/* EC subdevice @ 0x5b */
> > 
> > So what is on this address then ?
> 
> The driver spawns a secondary i2c device there to service some
> of the EC communication

Thanks for clarifying.
