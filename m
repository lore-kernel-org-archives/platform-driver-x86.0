Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C671F20E33E
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jan 2025 12:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737634785; cv=none; b=vGt2c1lmozu7RLZTMDIFQvwJUeryfdKYv+6OjjsElRGAZWLGSSuK+Y188ETICsos2rUqBzsynPJosLMmXOzQf6f6bfAJKTTZ/62EXFCRzOOItg25Y3/jlJyb+e6CTtqkT1QUwntWs2/NOcDc9dL1a/tb+h8wiLY9EpEu8EkxO8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737634785; c=relaxed/simple;
	bh=k2NKAdYzXBEQPbHp1TZCEi86re+Y04PGu5jH/Pgq7Xg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BZxloVveL7Y2xVhw1KdETmgscPRzgEYM5oy93I5YmfmsXY3SqG5WMSK8dJFPPdF7fb0pnlbsSeJr1w15/BCshKy4pWsdZXprdZM6FrHm2OJAcquS96OrgNFYoddW2/CZtHeG31GFlVzrDinCMkyOKzBlWn3tUPuHKG2fMaJdn7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d8SBvdIN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d8SBvdIN"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N6Vlx5008823
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jan 2025 12:19:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J9CPG/hVBu7eJ/PuvKIffPx7v08z1gelltnc+QQ273Q=; b=d8SBvdINUqctG+Ap
	O3+KIQ77cXm7+n7FdgyW5oj77lj/B7kGynP3NA+TbnmdSC52psyDl3Gkdt8o/v/z
	/7YYXNL4VLw9JGMwLm1O6eC8EaMRMFtWUm98x8XmYq97oaOtku0+M/e1TSyLwY3v
	WpusiGx9nvkLoNAmNpvrdyIfuTNVxQYufEIoLsp/U8mqC2sj2Xah7h4t5k++tlGW
	cyIrX5/5y8Gw2lrF1oRowA/2DB6pR7oL5I1eerdP8mS5qsZyaBA7nvEGniw/We/l
	0tJzoNAP9Zyz8OAu/ZRlh0w76RxdvS13YnoJwcPVpGj9Bqz9kWwOpN+VZsNJiX6K
	jf8E6w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bgk1gsyg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jan 2025 12:19:42 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6d88fe63f21so1948776d6.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jan 2025 04:19:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737634781; x=1738239581;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J9CPG/hVBu7eJ/PuvKIffPx7v08z1gelltnc+QQ273Q=;
        b=CVPiJjYdQznhOfvkbsQZckPO0gfsTKtXSw3J3sf64kLsXQBDQLKBTjTcnGPKB9OiOZ
         GQYJgDh4x1GtF1jqt48uX3BhLs7fB1nahB9nWrK3uhgSeuMs8NjAsu0i00qdWT2UIufv
         NZFdr5jRuyFljgUAB92aKBiSYN64RmHrRaUzjn97dIKZO9HNHfEXbEHdah6D5iy3xpmz
         Z437vrw8rIn94OskPzRalgncCGNfze/52GDgz9h7qV9w4vk7ZdqdaV5Beanl+cfdVODs
         txGPhPs1DRPXWm5iEYJ33gbq120gz/Fnkq34D3nd6IlcVcN8vFC8s+56RINi2eWbIWiF
         VauQ==
X-Forwarded-Encrypted: i=1; AJvYcCVb9o/glIEepoyp0Kr5OI5zvWbERE2GAIYhUJwmPqpHzNutrEGQ3Cgmqz9VboPvCJE7l5YRRsYD9QLXDec2dPG1GpDO@vger.kernel.org
X-Gm-Message-State: AOJu0YxhbawnaZPd+Tx4NYkKNLdGRoMlwOrsDxM5QrGJd3dUih5ILgLg
	cV3yuyOi3LGaCX+2dl9BGq5cE0x+BzAJ7TtM2jH5f0SN9VqONUbKwwklS63agSv3qvTbb8BBL9b
	40lsR77EYwa3GYMZ8Izr6KIVW/bsY0Y66cRJkNLu83gsCPGaqUUIKtFIig7J04ypZHO4/cy4g
X-Gm-Gg: ASbGncsZUNKcHd/GbhHHkG1qMwzR7JcXqF9AsMxChYcssdnp7STdzmBy1p7lG7Di86O
	CIk/kEGrUpVpvMIi/9olHjHqsC4an4CCEKJFcHYvMeUm114x9X8//U0sqTQB9hwfn2W92Hvzjyk
	cewgzETiz6CR+2xeH/ZQIrzPcc3kvefratVPsQVIJPp4FjUM4CCshfgdrYnvJmmipdTDAGLtJja
	I4zN8xDEdpSFjpDBhEI5q+M43ye3zEBlku4uDzXlPmnrsOjtAtNgVOquE+OMQRTjL2YZyFJPUFB
	Ba+oJjiSj1Y1ynyyclGzFEoxy1GFoztKapYHhRzItnkoLcte
X-Received: by 2002:a05:6214:2427:b0:6d8:99b2:63c7 with SMTP id 6a1803df08f44-6e1b21db9a7mr125795216d6.9.1737634781432;
        Thu, 23 Jan 2025 04:19:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFL9S3Cn6Xh1m8u1IJrR1ZW7VnorjrOrlsJRo8NPVU0jyMT1h/6dueqAdo7fGzvWSJ3efppQg==
X-Received: by 2002:a05:6214:2427:b0:6d8:99b2:63c7 with SMTP id 6a1803df08f44-6e1b21db9a7mr125794946d6.9.1737634781138;
        Thu, 23 Jan 2025 04:19:41 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384f87d70sm1079289066b.142.2025.01.23.04.19.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 04:19:40 -0800 (PST)
Message-ID: <94ccb2c6-d68b-4bb6-8eaa-7ff72f575ab0@oss.qualcomm.com>
Date: Thu, 23 Jan 2025 13:19:38 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: gaokun3: Add Embedded Controller
 node
To: Pengyu Luo <mitltlatltl@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250117140348.180681-1-mitltlatltl@gmail.com>
 <20250117140348.180681-4-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250117140348.180681-4-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3LVxUngGOl2UFzqLEU5hDEg3zv4IWg_x
X-Proofpoint-ORIG-GUID: 3LVxUngGOl2UFzqLEU5hDEg3zv4IWg_x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_05,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=973
 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501230094

On 17.01.2025 3:03 PM, Pengyu Luo wrote:
> The Embedded Controller in the Huawei Matebook E Go is accessible on &i2c15
> and provides battery and adapter status, port orientation status, as well
> as HPD event notifications for two USB Type-C port, etc.
> 
> Add the EC to the device tree and describe the relationship among
> the type-c connectors, role switches, orientation switches and the QMP
> combo PHY.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
