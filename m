Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC878449B3B
	for <platform-driver-x86@vger.kernel.org>; Fri,  4 Sep 2026 09:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788515106; cv=none; b=cj1FwKn+WkjyRew9u5n5nPpANzAVrXVf+Zuh3KoUFZAONu9pH0p0/i2U5zabkQzmXgzJvF0jYmlrv6ZYA44E1/tM8p1+Qi90U0YlE4c2g1SU1Yq9JGPyDMxM+cRhxBbxettuoBV9UHXPxlRbJGtsoeJCcem9kO5qrEj24niYDIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788515106; c=relaxed/simple;
	bh=zVrsOBbUBsqRW8lZE59vCWEnEi6cLmNkhdl/0iaYt6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KfFXaXTmYIZS10ggYD0YzCTzyzIvW4YM4S1gDp6mYNCthwlD0tTrKxlvrUpPu0H73G7wDSDC4CIby+GbVlNDiSZMeL0AnE+p9aK58MZFT1s4Bh2neUTEEDkBkYzvXCQz07TR0nE5H6o/FgmTeCFMZBAN4FN9UlAuTgdx7W4QZS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I+ylvqLL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HlT7wDXP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I+ylvqLL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HlT7wDXP"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847mnPB2351565
	for <platform-driver-x86@vger.kernel.org>; Fri, 4 Sep 2026 09:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+8D5YW4aMjYqkv07n5OIFJYINICm6DBJu2yq9WVbe+8=; b=I+ylvqLLLLgJPGX0
	J4MRCr1bKezTgXDYnj6VwxvaI14kiNq83vRgzc2OZShwpLAt65CC7bWQOOG4NDhS
	eZDowL7tahOXy4y6LgcF/EBMEnjEtcI+4wxlhPEYGTBZEqqQwJhmIqgOf4C7NQ6w
	13d6QSs7uQCmoydDb8q7HwMz2EHLEBg1XbPDTy0M5TkenpgtSw7PcoF9AvcoIqg6
	787fNoKGjFPZEYr1yGKEQLGxwd6Gxy/M6zpeDaxACjYUWemAJxPxU7h8rTYogyvt
	tXa5KmElgYFevjgXUEq4TNcPaI67wNgCiYMwiyUkTQNo3f0u8C++t8KAmwBa61/G
	9jC7Og==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp1fh50d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Fri, 04 Sep 2026 09:45:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfd1772d8so1741151cf.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 04 Sep 2026 02:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788515098; x=1789119898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+8D5YW4aMjYqkv07n5OIFJYINICm6DBJu2yq9WVbe+8=;
        b=HlT7wDXPnnb/qidYJmjTQPMDy7Gzu6XStDjlrWvgsyj+OoeKbn5E1mfNv9ggjexgUJ
         10UjBITdtyFdXi9djZ8S+doXg8Y7UwQGClbyk9+oFPW+EsSi5h/Xg4IKWBEwNHBCJIiI
         HEeH4F81UG9qTrh11LvNJLeqN9At6dnrGbH/Q49O3U7qti+UW2PWQnkDCl2M2nWhKBPf
         mXFuJCPZONEe8w7D6VHu3v0BqNcMuthmyBO34cS1Nq+YCDG06JzGJsYGTaUcBnutk9xV
         3/AHZnFAaSuLkZwa43HiDRiLsewctUnO5XagxrZh2QjVqBK1uibu+fommufsg+gD5DfS
         Q1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788515098; x=1789119898;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+8D5YW4aMjYqkv07n5OIFJYINICm6DBJu2yq9WVbe+8=;
        b=LEgV00+3viugP+7nPHAl70tyhm5i9akWj23CMqiJ56m4UspeWdkce9JlPuwLtK/Av6
         Nqpr4orZfi8Prf1z6qrS3f/IHNq55rhJLy4RY75ymdL9ULXtPih5h5pC9TH46M3Hs7Oh
         W+vpx5/87ASmTq7sDaqrRkU/p8zWCNuIjKRpqPp1Ha2qzgcHHIzEQLPczGmW11vcrhx/
         QxrfXy/cB1eSnd150NMr2j7ShcOBw0luDZb2POwDAJDc8Ijr9Vot70LI/2XBBW/xqcmg
         eFbZC8L0VlHsBfjjQEikPVcLsgBXU0F2l4FsPvFChNYdmZfVkwy8r1WVI9gvU9SDmnLz
         ttHQ==
X-Forwarded-Encrypted: i=1; AKwUvByEEHRSezap5ezWFC7bs65rA8PLVp3nS7vrcRT1KGom6/SkHxceU292WIDONvM0N61+CbF0m6YHnbOevwraSJudX6hu@vger.kernel.org
X-Gm-Message-State: AFuF++n6oUQgnZc55cck4TDeLYO79roElQoPr56IG5dpg/Z0MCRy+uTh
	lLV7qOmOs/5ZfD/omaPsXbpff6RHnaNXvf6+mXywEBWeFUZQa7GQNxzJa0NBUSuAmP/UzGxaQcO
	4rZmhmhqGFF/SxkpfBIAbLLeUmavQvU/FZz4KUh1NcAF2J21yXiPtGyISaAoO9SS2j4T8DXVIlT
	8z
X-Gm-Gg: AYBFou3SwknS9M22EbOKP2cyV1snvytHeeRpPOHcFIlXmqoEgPOoppZ1HQRUcpeM1zd
	/OZ34+VNyZKMjHqjPAFSL/uvW1fzG6V7vorVFPxuGn6yZyijoe0jkorDdu7ZI2sYujVb1h2adgh
	CbqQGa1pBvxc3DCpoweyvt4yQJSYGlJ8YZYli5sfZG9a43squk+6OZVht+t0/jRuDz7MlgvN0Yw
	lvdPDGFZLMMaPTJbIcbmz4erNGjEGJpOFeP0EPgMTVQaod0aoZjr6mjfKT8TgDgYXQimU7AtHL5
	fb36p0ikes/OyMfUWnVBlql01yMOd2munj9E1JJCF89SXQHythtyYBNiYAvqvwqW00bm7YhaWjm
	CLfKLGpXV36g392SE7Yn4yg==
X-Received: by 2002:a05:620a:4686:b0:939:47f4:935a with SMTP id af79cd13be357-939807adf30mr345133485a.5.1788515097820;
        Fri, 04 Sep 2026 02:44:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4686:b0:939:47f4:935a with SMTP id af79cd13be357-939807adf30mr345131285a.5.1788515097419;
        Fri, 04 Sep 2026 02:44:57 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d6dfad6sm83831366b.60.2026.09.04.02.44.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 02:44:56 -0700 (PDT)
Message-ID: <62c7ed77-32c7-4e4a-ab44-64bb174a88f8@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 11:44:54 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform: arm64: Add Radxa SVC GLINK driver
To: Xilin Wu <sophon@radxa.com>, Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20260831-radxa-svc-v1-0-7c028de6a387@radxa.com>
 <20260831-radxa-svc-v1-1-7c028de6a387@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260831-radxa-svc-v1-1-7c028de6a387@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F+xnsKhN c=1 sm=1 tr=0 ts=6a9a931f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=ksxQWNrZAAAA:8 a=oytB4wdSUnn8FBOm40sA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: 7PMeFGemPfsR2kKjzfezVxzrWSdNhr_N
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4OCBTYWx0ZWRfX2Eo0B0fJYIJm
 3SXU1ZO3bnwT48XSjMed96r9HvJIcFV5Oe75AUiSoj+V7l8+LNCffNfduFjxm+EcehFIZtW6ISQ
 m3LUqiP77S/SxgabAxfAKtxNzTa2bvc=
X-Proofpoint-GUID: 7PMeFGemPfsR2kKjzfezVxzrWSdNhr_N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4OCBTYWx0ZWRfX79DYexxqzpT8
 lNP6lFrSvAIyQ4NOE/YMahky1Ju9d5nfWwKMwQEt4t6Q0c/7T3qQSAoLlf/8NI66o2ps+3b9srW
 ysmWm1apeRwtlyzhYgxZudfZDMJ8GFrb1sVNHiVIMX2/mucMe6Bj9oBTLviPbknQU8YZD8QjNKw
 tJvVSkVSpnyBP4il91X12zCZONcGi5KISQ+Ev6IeiS0jPMcgr6jVuaqn/Z2GQoBKeJMNEq76vkO
 IOnWhtBGeh9nns4TX/GXGkhJa0JqQwJar0racIAa0p1f/FixK8r0Wo/5qmvLb//pl77Tv620XnR
 6wqfMNRN6p+ScclUh+MtlUKvGfreGfK1JqtTsqR6u4vHGgxHvx10gFak9uy8Iqns8lFBt3vM309
 2nkW/0q/vUgT5ZuHEr2CZ7ce0Xhe/JFG6RgJCNM5kVhaxIFvmNn5b8+QZkk3KwM4IqWE7+dc6Kl
 mE2bVvgiwMyBDD/ELQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040088

On 8/31/26 5:09 PM, Xilin Wu wrote:
> Add an rpmsg client for the RADXA_SVC_ADSP_APPS firmware service used
> on supported Radxa boards with Qualcomm SoCs.
> 
> Expose fan control through the standard hwmon pwm1 and pwm1_enable
> attributes. SET_PROFILE only changes the fan curve, so map its quiet and
> performance curves to automatic modes instead of platform_profile.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

[...]

> +static int radxa_svc_request(struct radxa_svc_glink *svc, u32 opcode,
> +			     const void *req_payload, size_t req_len,
> +			     void *rsp_payload, size_t *rsp_len);

I don't think you need this forward-declaration

[...]


> +	reinit_completion(&svc->rsp);
> +
> +	spin_lock_irqsave(&svc->rsp_lock, flags);


GPT says:

High: A late response from a timed-out request can complete and corrupt
the next transaction.

In patch 1, radxa_svc_request() clears pending and returns after the
5-second timeout, then a later request calls reinit_completion() and
installs its new pending_seq (patch lines 526-540, 550-555). The callback
sets do_complete under rsp_lock, drops the lock, and only then calls
complete() (patch lines 612-624). 

Konrad
