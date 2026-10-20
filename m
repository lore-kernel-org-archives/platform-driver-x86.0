Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483410;
	b=oJJ3mz03bBmkLxVgkYTIYzhQLrtu4DwcZ5IbvB5mqpfLzXUkU9sq0hTOHmP4K+Q164A7
	 UEgyk0IzutC7Y2As8F61nHCEkOLaGUsMk8zebi0waUDrpd7W3neRY1z2OF2DNtmiCm/ZT
	 EO8oUXvN9HRM28HnjhbUj7pG0wp2BZM5pLsrbqBkrtgfYG8SiIBYlwxAPRqvg6WD+2DkK
	 j88R/AlnFZqlEm23eBpsgMADkIKI/uWFVv8kQCSPxMs/ghAuh/6n+nRpfzRRHr+OXgQa6
	 FoHZlZbABZ9PJ9eeTndqiSL9s8Y4tOJ/o1NUlV1y1qBgZO7sZj0aeVR1ZireirtCZrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483410;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=f29Q3ZfnBob9EdezqKkkesN/jdQEI8id6w6S8zkChjY=;
	b=o2y2ilICcct8cSFieIN+kpVRb5tOnn71ZklDT0mjpX1J3o16URHeeUPyVhSnQVzVd/lt
	 EHbVHxQbT3kM9FYXmSnm7R411yZdAP7GiuS/8p0fxrLg4WSFr3q//9u8ZRwh919I1G+Cb
	 JBncHGhHHkGPeac6Pbo7bPP+rL6wt9xa+HdSk1d7Bf4NPJfRL9iz/bE91fi/QmNkbF2c4
	 qiOVI2xZgWUs7Pd9EB3tgs41f5hhjzKHFU8piDkK0wJhz7R19o2xkcA3SMoNtv+2we3fb
	 t0tFZShJPwxGXUNkvj2lmRNJfI3FYccWisXfK8vZkWyyCaaMQeiQezG7nT4XztoC0wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AwIW49qS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BTM13FI6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E442606A31B
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 08:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E442606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AwIW49qS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BTM13FI6
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K7kNbO1025998
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 08:03:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f29Q3ZfnBob9EdezqKkkesN/jdQEI8id6w6S8zkChjY=; b=AwIW49qSYs4fGCDL
	VwFeNJDN7IHzBkHSnFSTpR8xzs+O9CbaFMAA6TXvDlQxZZ+5VrutOEkGYwc09Yi+
	ynaGEduK5MdNSy6n44A68TTi5B4TTaVVrs1n1AyBlx0z95x2z+IYVdo5PFQY4pp3
	wvPwf9tC6NpfcbVjId4CC+TV9IPERa3TeoD3ZNgyaDf7Pwx94LoEUZ5AI0Aux8bg
	wWNla66lhwhxS/kc0mBuE7tLF8qPeMr2EiG1WRXTfTq56NcKD+j6T3JfJYBToBKK
	b9lzH6uVC7Pp5cjxt6uRAps7kBC5mxQqFQZh3Lajh7VRGLzmikUPwI1NiXXgzjri
	z3/3SQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n1hqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 08:03:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53568f05f8bso9248701cf.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 01:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792483408; x=1793088208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f29Q3ZfnBob9EdezqKkkesN/jdQEI8id6w6S8zkChjY=;
        b=BTM13FI6vea4IUxugnlDG9mkcUkS8BUPfsNqYG/ri9eAcHTj02/pAQkGzu8MO7lsGT
         KSWIs1dMF1Eqe3tcEJrhoOlABbzUkk29QWQ5lXc0PSr2QVPUcGBv9zjmr7jf3drBv74U
         EAzvQp4GTEZBZUMFCs0500siN6ELeABfsUGO1KEoloN1mDb1D59uOihkVDnRtSu5oLUq
         n/5XuojABfn3LbowhRumj2cFRZu3SElnTiIqbKyyVADhYiG1wRWjppYLX6VT16WP25lz
         flkFXfRaQzSk09adM3L6eXM4DjhDpZ3MeggKWdiWcKrXnKgTtkm4rNwbYWdhflIg8lbj
         3llA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483408; x=1793088208;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f29Q3ZfnBob9EdezqKkkesN/jdQEI8id6w6S8zkChjY=;
        b=L9uwI4cfTg6SxR4U1fgas9ndC7YplJJHAxLGuTR1Ur6DXLoXPd9DzIRGigUDajgyu3
         kUBqv/7IRHLdWAB6mOsGeIjFG82eSUSmRESdSDo4ykPmBHkmpmTao4lVnCsv9kN9N4fH
         gZ8e+m9RDIFVuYJbfvbhJqXafHGexaGXpvO9QrNAh6MqlwR1H1wS7v7bT9jZyO5I+4IW
         byVRaxzdAoFyP0Ohk/eL8APIpH3hPWgDn6m5wJ++aXrgHcuyZ+q5qU9rQWi/MMiruVPo
         ErKlmFvBdleZ7pdBw6VMg24r4Mp3Rnp7X7mz204odG8cSHV3q5ikfJ7PiXW3qV9sLC7e
         o3Sw==
X-Forwarded-Encrypted: i=1; AKwUvByAXJk5Amv4nGSgbWUoKsWB9mMQDoxyNiy+KczVhXMFkP2Rpb27TIQ1B/MAPZo75AcJ+aFUYC3+BUS9t6hUnLSd5Kr/@vger.kernel.org
X-Gm-Message-State: AFq9FYJaxH3ZOCA2Lif2ud8e+uCJ3FjYevWfbzCB0PE5tIbwzeF092Mn
	SEjVC2ZJbQ/I/kKywoamqxOibm3UEd05IL3LhjMt6Lch6sdljNxp4ZIWwWpc7ihkG3htmrxPU2o
	RAJO2AWoiO2F1A5WvVWjyOFrJSPe1Q/3Sv5HhOM4wTN2Hduw+v6phLULw8GLWizy+lOuotzlueS
	IsIaUc/gUq
X-Gm-Gg: AYBFou0+oLSYpiE5ZBcLCcPIqAGT7XlaLCIvhAOFmwY361jzSqaIdUIjSPOOiG4mn7X
	IAWCViYEEC+Wbc+ayZIQrtDD5lch3+E2tL35AeqQEKIqTn4d2gl2dCvARN7f3Tz/3MFvUcJi6GN
	+zhJe3AkLkPgQ85Mvs+c+u6HKohOCSgDsoTx3isk8xchreEsdVYMyTT6ztHZGVTgbQIjsCQpOp7
	NrjAYX+AX88CL3+GztOh8qoR6LuvE5CkMrQjNorGIagQhbodFBOgOMihBSqaljbbiewDXE3lq5t
	FFMcoMQ+Afw9ZyLCKkzUA3iihQmvhiqtTw0pj7+JNxRvpvWQHpZzPK4mhMODa8cNnA/M+M6rXOZ
	5YPhKsjAsU4A0h1ut33kCgQ==
X-Received: by 2002:a05:622a:1304:b0:535:496:56ab with SMTP id d75a77b69052e-536459e2a4amr180281621cf.0.1792483407739;
        Tue, 20 Oct 2026 01:03:27 -0700 (PDT)
X-Received: by 2002:a05:622a:1304:b0:535:496:56ab with SMTP id d75a77b69052e-536459e2a4amr180281231cf.0.1792483407204;
        Tue, 20 Oct 2026 01:03:27 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c0402sm460634166b.61.2026.10.20.01.03.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:03:26 -0700 (PDT)
Message-ID: <e77c0255-6299-4718-aaa6-04f4366fe749@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:03:24 +0200
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: glymur: Add EC thermal zones
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
References: <20260928-ec_thermistor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com>
 <20260928-ec_thermistor_support-v1-3-d9c1bae4cd0d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260928-ec_thermistor_support-v1-3-d9c1bae4cd0d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Xsg7AQTrugmCdiGoUy0aY-2UyOXH4OzT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMSBTYWx0ZWRfXySqTDp1KHgbM
 hTjRx9CmgPgpkC4Upah/DKen2vYXUCVFhj8EdUNNP7NBp2Pq8NpCy5/KRPIuY11bhWoSUYLSngY
 QE4pUQqy1FBMXa9Hs0x4odysE7CZVSQ=
X-Proofpoint-ORIG-GUID: Xsg7AQTrugmCdiGoUy0aY-2UyOXH4OzT
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad72050 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Nmv2DHgxKDD6GQ1_MrcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMSBTYWx0ZWRfXy03IA4SpnLek
 Hz6uzQvSVH7xrt4RqGlih740MVMgivSLZKABnjEbTbrhzYGPUhSqcEvZE3Wm/B80dJ+EWE7xtXl
 UZykbgZYkp4mRoaZDt4UvAG0S8hDkQHsW/6JkMkT+v1fLEzIm14Sm+TbxiCvlleQVuuykhiVhhe
 Go8QWiucBLhV5Sie2IjGoIuqufSvsAuu6LDcwD2kBo3NcKU5+Cqpx+AHwdjsDcr8IISU7mBJYi8
 NFW/27ZLHXi4PIL+B9/dJOgrUWdSmajyvRhA0TzKa//OoQmUNyJorvoKYQtptKOsm522aOu0L0V
 MjqmJIAA9wPBXbgRuzP4H5yJdkXpCLagVD1N4iSVlk+zJ83W28TPI6i7Ip/jVAKoq1fmBVA/GwF
 mogYGXJ3T5PCcy0ePN2tE5cl2Ia/zwh6z0ET3PRLk75MEvGrAJtvQs3KxmMvGv0F01aFj0u+XLo
 vkwJ4Fz8oTq4cDDzSaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200031

On 9/28/26 8:36 AM, Anvesh Jain P wrote:
> Add support for back cover, keyboard, and SoC thermal zones through
> temperature sensors hosted on the EC for Glymur and Mahua CRDs.
> 
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 45 +++++++++++++++++++++++++++++++-
>  1 file changed, 44 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> index e27c697e3170..571c98124a40 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> @@ -594,10 +594,12 @@ &i2c9 {
>  
>  	status = "okay";
>  
> -	embedded-controller@76 {
> +	ec: embedded-controller@76 {

"ec" is a super short label, perhaps let's spell out
embedded_controller

[...]

> +&thermal_zones {
> +	ec-back-cover {
> +		polling-delay = <10000>;
> +		thermal-sensors = <&ec 2>;
> +
> +		trips {
> +			trip-point0 {
> +				temperature = <90000>;

This is *really* hot!

> +				hysteresis = <5000>;
> +				type = "hot";
> +			};
> +		};
> +	};
> +
> +	ec-keyboard {
> +		polling-delay = <10000>;
> +		thermal-sensors = <&ec 1>;
> +
> +		trips {
> +			trip-point0 {
> +				temperature = <90000>;

Likewise

Konrad
