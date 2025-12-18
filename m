Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AB8314A7F
	for <platform-driver-x86@vger.kernel.org>; Thu, 18 Dec 2025 10:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766055260; cv=none; b=YZhHJHOd66qaW12i8yzgwpaKuZIJN3TGsvTBs2gBDyf/M1LlNN6Uld/89H/7biMx2hmfjlrqtam6OAuk331E7V93mc6Tu8BzTPkMruaZjkGbnDPiS1bs+x8dCNw8ibfnvj7XSxMbhrBViek+Q2FTmmqsbtFcTZ+sBghIcGPAVfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766055260; c=relaxed/simple;
	bh=wolOtR5gbMuHGYPn7isX6pVe+I4UdjJqr+mzUnQuzN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uoOrQrcsMfwaltISXGz+xztBYuDYw/+E7cauesgU4lxC6UzWSR6SpH7Mk6cMBcHzXvtsZEDZks+DJd5QUBafWvIWOa7uGLfTN6lzFHUd23FgoK5ZNusdR3tfOVOFs4mnfZOkWrYiHZ4OisZcHBsqqGVycEfb0nHqCmlUK7CYshk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BaMvMObl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SYShmxd0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BaMvMObl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SYShmxd0"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI9A2gb4057296
	for <platform-driver-x86@vger.kernel.org>; Thu, 18 Dec 2025 10:54:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ULiMr+jjQf2IPNeanbk3DLBorGWRLoXxf7JiGDZ0X0I=; b=BaMvMObltxpjlJX2
	hDi1lnh+3LRntbDrAOg4JzxnEtNIasX/GHrqSFO+6PEWprty46vErmrdjMQ+0R+d
	PB6dMSyhsXsOkkIbRyZN5NF2qNh1XM0D9CleCOljN15BesCsdrMWuoPmygi2uKmr
	Ft7+V5RzUDdGWtmok/tlpi00lFdyIc58mdQug/iwF4CS9X0UaOjuIB4sQQ3xWjCb
	Gy+qX89KVMfYKr4/GHEFEhTBP9LlIxbD5MafnUxG5e1BWN4PNk2oKuSPL7hydyiy
	u2DEGsYL8IcAXZC+RoFjU+IH52kpMAsyPMwvvOcppYFYD1UasINp/jkJoSIw90ZB
	1oZrXg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3xr5b9yt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 18 Dec 2025 10:54:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b5ff26d6a9so9561585a.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 18 Dec 2025 02:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766055257; x=1766660057; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ULiMr+jjQf2IPNeanbk3DLBorGWRLoXxf7JiGDZ0X0I=;
        b=SYShmxd0AQryYG17CrlT+w4uBYw0j1sqT0T4l2hgwrnCT+IAWqwgbu/wkrJDHpR/Ya
         yafOkWwEVPD84uyflDEEqflSE8AYlvL2zo6SY5g0RaRY1SHlsX2kXP1jKUrV9JFc3JyR
         0PpRiV/OIZiOzaNbip7y/TzNcs+hWYkDYnwZms1z5vn/W8jE6djhIQZoJzjnmiIsQo++
         TdWNi0MHaJoeJS8WbjbFNDdo8QfEfB75myExKLqhp8ZnevHg7yuCyq+2F/JosFFMCuWi
         atTdyBAUKAMj3P6qd1H3TqPMEjfZ2lepfo/XoA7EPxKKZabOMWIqoIJQiE5R1DZZAutF
         I+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766055257; x=1766660057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ULiMr+jjQf2IPNeanbk3DLBorGWRLoXxf7JiGDZ0X0I=;
        b=vIHgWNDDuvjkkNq1iJMuUIC/9yMgRhYHehll6wGbggpx3KuhwOJ60HJ33IajzTPWxW
         uaEnB2ttkzdYfzopoXMF/g4UTH8c/oWD+xrw3FGtnzDkFbFHWLP1JcFGatMWwx7jF7pa
         2ovpWM6FJD2S9UzBasjXIEzB6D+ur24Kbi7pDMRM1/OTjO9cb4melwWhVtUivT3a6D31
         lwZKopgSTRM26YEHK3e8p554VeOKxJx5+go6ZacMgTOdr01Y1+vu6jrnnqDtUvub3zHf
         Q/73904R3N2EM9a0s9P8smGNJgrlhMK1NWUgYRt0lfMmiGlyVZz4MXWSMcOmG2ePf4Uk
         uZhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmDXwIk3SP/U1edyfwt730oNaj9IcmoVKBiZtYGhaSgsdwvOe2RXrreSF1U6qYj34MtdXTEy1pf3czOkjDmi/BuY29@vger.kernel.org
X-Gm-Message-State: AOJu0YyNJwYa2Sn4IzixSE/N9lFBh/IoOfuDF9pZmfWuv75XsFlXzr6g
	Ri+Lt93ZFPVv93aPvHehdeYjbGofILHQrxA+rsqU64KEEItq1oTy97G5TznX19ess5NDLlY6pqY
	0UZERLWh3T1h4PyEK986dd5YOb0znF5mCHnnynOJA3iToHmuUXqp6VPbRk4iIMX61b7utZWLYJg
	a1
X-Gm-Gg: AY/fxX7SmMBKd7ZzhNG8vm8CP9gb+HYhNxuyxE0dTAX8mSNnwr0mU17N1FKKIslQGC+
	nBrHmKO07+juBlsWHnE4pdkASzQ/tXsbv7cmAOKm6FdAkMc/R/ME0EMGpEzVZhs48QASPaB9fW8
	Wrcx438kQ/wj0TzE/2QgnNXdkoly+PlA7g/HHITOuiz4aJBEI9JV2cW5kCNZgXThvDnLvqmEmoI
	b5x69qYjqTdHcP20EgDJHtdpRYV4n0Gds9ffqojSnIHCrQfmqa0lAVMIUjgHBKFvKOdvsG6lFOh
	Bid9R9c5MIZDaEnvj7n1Qyx2y8n0LB3bmZBuOTG6KtBwv9G3qoU7HuZ0WR8BSSwH3mcQ2rH2B2q
	YgfRLB7yBZnt/Icr2gie2vtgdl13t7lAjSoEy4p2zvTdNa7svEYexTPzs/kUxsWmNDQ==
X-Received: by 2002:a05:620a:4441:b0:8b2:e177:fb18 with SMTP id af79cd13be357-8bef2b6ad2fmr173839085a.9.1766055257310;
        Thu, 18 Dec 2025 02:54:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFg6rD4FG+ZdEpLvSxXB7VPKfet2cJMu4WCkxjwUL9ypB7KXsrgvhhdJxlHfMC+UTosSE+weA==
X-Received: by 2002:a05:620a:4441:b0:8b2:e177:fb18 with SMTP id af79cd13be357-8bef2b6ad2fmr173836085a.9.1766055256861;
        Thu, 18 Dec 2025 02:54:16 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b585b52bbsm2367565a12.6.2025.12.18.02.54.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 02:54:16 -0800 (PST)
Message-ID: <4491e009-0071-4130-9e1a-29145314e349@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 11:54:13 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: Add support for Surface Pro 11
To: jerome.debretagne@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, ath12k@lists.infradead.org,
        Dale Whinham <daleyo@gmail.com>
References: <20251218-surface-sp11-for-next-v3-0-875afc7bd3b7@gmail.com>
 <20251218-surface-sp11-for-next-v3-5-875afc7bd3b7@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251218-surface-sp11-for-next-v3-5-875afc7bd3b7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SFSIcey3-sfLROHgCS0y3v6-mouzkERF
X-Authority-Analysis: v=2.4 cv=DsBbOW/+ c=1 sm=1 tr=0 ts=6943dd5a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=T6QFUigfjUT3ERtuJAUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA4OSBTYWx0ZWRfX99VzbtSdmmjb
 A39PfgZ7DgbnuS4ksNM8ID8Mi3qiRK4nfjf/uRgX1xA/p+d4nJbMTQwyFaVGWV3YnRCzyH4hFiY
 MrJN0jNloqcIoy1yA/qBxMwdtznh5kpOtg1Vct+Wj60diCGbzEsfrwg13N93oarcwHGHrImF1Lc
 Qc1oOzT1iUgTMgmlGk9rVn/OmWCXVerEx8WMScJ/GHOFUHLbuPUaP64bk/BGOs0rkWsL3sOHh+9
 ErMRQFCbwCJE23QtdobG6aiZyGRtokFHEB/7wFSBbQHTbbsiE8m2XwR1SDZ2FESN6h4mAmfa05r
 /7X9NNMTZZ/96W9YtbE4vx/cpw9W4VhV9bgFpFuw0d1DiW3HcqN3O5Snqz/BuW2kBZueF7yciCP
 Boa1OfannImwBkb2itOC+svHwgfIkQ==
X-Proofpoint-ORIG-GUID: SFSIcey3-sfLROHgCS0y3v6-mouzkERF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180089

On 12/18/25 12:56 AM, Jérôme de Bretagne via B4 Relay wrote:
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
> Tested-by: Dale Whinham <daleyo@gmail.com>
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> ---

[...]

> +&i2c4 {
> +	clock-frequency = <400000>;
> +
> +	status = "disabled";
> +};
> +
> +&i2c5 {
> +	clock-frequency = <400000>;
> +
> +	status = "disabled";
> +};

A little bit odd to leave them explicitly disabled. If they're useful,
enabling them makes sense. If not, removing the reference seems to be the
way to go.

With that taken care of, one way or the other:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
