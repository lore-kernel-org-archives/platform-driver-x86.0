Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10F74E50BC
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 08:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054728; cv=none; b=uslKqLNcd1sJBI5dJkIdELw1qr9t5MoaVfPt0wKiDO3zz2zbx6JXr596MM9LQc/1RlD/na2wGFDorXW+zl76/9OgZHGhoTf3G55okOUrUgy0VpKs+7dHuxA5KlbVYt+zpWffO/lDwULgGuynPw4xtyGuoq9bAwGemwRPKGYzxw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054728; c=relaxed/simple;
	bh=A4/JKd8Bel05nQI0APY4HDpLZlqsnNWXRk9ZTGOuc2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TwWLG8xU8Sh/pT07ynXJX5r5VSJaD1u3hFDyShp/Uj7ZDhMUTHZFesPoO3l2dl9XzQbXKLX/HZFqvyUABvZEeUyeX4kGcmVAJPfC4Mjlt+PzzI5w70hIPjS1zz1WVN4XcsaETPDqpC6nKfdZ2dhYJEPqMxcgrLEJwAos1qoRVQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g9yL0Acz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iw7m8kX/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g9yL0Acz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iw7m8kX/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F6JPx6644571
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 08:58:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vu9KbfWHprfYt8Ll8VBeV6KksXaA0Iz6M9e+WSpON4I=; b=g9yL0AczBPiS7fyO
	KhxwwYogST3fUzB02H6TT04AfIWJyGGYjhlCFLJXBmbWeHqUsCD4akFzKT01+Zov
	O+b/P3F8r2ND4nm3s2SDCSJ/XEQ/RefVZuPfLqrfBhvO4r9lpcQd3kdKoKrvUY77
	kzuMlWqGB+1VI1w5O6MMkKzjGpC7/28LT8VANJ2zlhoyLukE5Mn5RxVwFaWhgmP/
	Z++cu6pIc45bTM6LnMKBFdZ76K4G+YxZVCWnEsvVGzc1jsDIoeo1pl+PuRB7zwuW
	oCPNpj3lBFHXFjEX4UeO8hDnDouZJCl5uB22vAy37jjHLBNNO0Xfb8y5ZFLFUov2
	FPyCoQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmya4f7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 08:58:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc50fb0d2so97768485a.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 01:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792054721; x=1792659521; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vu9KbfWHprfYt8Ll8VBeV6KksXaA0Iz6M9e+WSpON4I=;
        b=iw7m8kX/11MxeFd3fT0aZMvPt+AJylqTyMmHadMiwDd0BLwz1DKoDaUCioF525AuG9
         mYRstbFuY5Cxn4xP5v3gdu0qxIc1OSdxtltrasMRbiBDunosKuUL7XG+h/yhGDPoiFTu
         Qol0F78BMF67SIdBckHVM9Ii5g5FxdW9QvleHGqbKkhz3Oqwk6XBZ2Ov6wwJ6HbXPsyb
         OycEDP6s1cc9pHDmET9/GNhGiUdv2cQwCekuEZbTlI3TuT1nJPPnjY8ttxu26TJgiFAg
         P2kZvqYFtXDzR5txGH3YTWGJ/nMLRmnqp8xndsgiXxGsZjNeiyEIJMDKg+equ0FLYy2Y
         PxFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792054721; x=1792659521;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vu9KbfWHprfYt8Ll8VBeV6KksXaA0Iz6M9e+WSpON4I=;
        b=h4SUTlDFBEqB2homW1C2p6fTa44YiTdTN0Xnk9pFYyQ+vOXShJgUUaaTAav2qDZT/I
         T6W5vlTuE+rQP+7ZWlF3/ino19qnaOBefQhH4DB79kB4fpaLdYZLeWq1xSEnprWjf9TG
         HpktaikFcBrRnYSAmSnFOH42MDAwAON1zosHaRKDm4UYTQprE7IhNZ5IjQoCh/WEXvpL
         92VQ/bARLKwHACursJAxwFphA2cNr5ZJPRgZIFX8aOmvGwFix1gYLZtXX/A9BQRNBcyX
         wK7Qb1BM1X/q2Fw5oq1NbAvhVY2HKCGNqydv51IFdQqOpvLuvnQilE0rcGGt+jz/tgTw
         Iy1A==
X-Forwarded-Encrypted: i=1; AKwUvBzcD1IiGrYm43voI8fEVB61BuZnw1T2lqVg1XfZy0KEZFqwJQqHNndcd8s1bnJPLWcll4eF47zQbQKzjn6xu3oX7PR5@vger.kernel.org
X-Gm-Message-State: AFq9FYLkrJJ/ZxIcXWZaKfmGF055T5ZHfyWiNgL1P/Bv1DHH3FPAQi3l
	VxFBhbVzVdQ+SyoTIwcpoEHaqW0QiZpywuPrnfSutgQvm/boD9LLYuAFswj9Mrd6fR2LXwVvrCq
	leHOZeGOUhvBgvvVJxGDmJaQYbLBbwlwkzC6bLW99169UfIiwe5aocHzj6SxUJqPSrCyqhOH6Ie
	/t
X-Gm-Gg: AYBFou0Dt+J6Rek+5nKX4Ke7eiAmqlIuY7G2Taj3chm6xhTqaclaA99Oacgf8o2S5Vt
	4iI4Kb24vTcKhuDb/1wI3lkErgsx6MiQzPllrdF5xHo9t590Wn+fye9clPqqTJsRyiwHN5CQa+K
	OjUgquBHbmshGuhXgmv0E9UxTDLCxxNnCQ7gRdZjz66sciQxe6A/YP4aPe/u13vZ+JBfik9Si8p
	qfPwwDOJsGlBWAeOc1p9Ul62Wm4I/nZhkhW3nu5DRSJNqdH9qWWgvYrJXe7uZOOf2TCzXIY3mK8
	xzMgQy666qlAwhVYvMMkp7oOhBO8pr0wGBQ1XanfhywW7zCwpR4Qfi/cqXH32r3qHrx7mVQ3iQi
	cHskyC97C3R+mNGoFsi1T0g==
X-Received: by 2002:a05:620a:1a17:b0:93e:70cd:e420 with SMTP id af79cd13be357-93ebd2605bdmr3480585485a.5.1792054720677;
        Thu, 15 Oct 2026 01:58:40 -0700 (PDT)
X-Received: by 2002:a05:620a:1a17:b0:93e:70cd:e420 with SMTP id af79cd13be357-93ebd2605bdmr3480583685a.5.1792054720249;
        Thu, 15 Oct 2026 01:58:40 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b2037623e4sm2226634a12.1.2026.10.15.01.58.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 01:58:39 -0700 (PDT)
Message-ID: <6230bd88-98cb-42ce-ac07-188a30a8c48d@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 10:58:37 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindings: embedded-controller: Add ASUS Zenbook
 A16 EC
To: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
 <20261015-topic-asus_ec-v4-1-af6305ffcb10@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-topic-asus_ec-v4-1-af6305ffcb10@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QYiphitBIHPVvWV5pL0GCGpzrRA_WL3J
X-Proofpoint-ORIG-GUID: QYiphitBIHPVvWV5pL0GCGpzrRA_WL3J
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfXxc7yvxpSnwsI
 TVG+bEpuTn1HSplkCqVG3K06Za1+w1+pzO8JJwDn2VUGWjomKsD+CVWsOjjYjB8NAwih7QaDDXx
 iYqERE1RwE8r+obvNbQ9HeRJrg9CKiA=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad095c1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IdPoCcsTyHqTvs3CpEwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfX6e7ffF0L00wI
 vOJFKVYTbmvJCi2+CjvoR1im1axVw2a+S6XCrhI19jsBt6GMigdP0oqNGiRylSX9VrYwGsxLLyG
 9XJMpShRaAoWeMVRWiYr7PhO18eAMxxwJbQ096hYit39mqImh+iAxIk9F1Hr6TSB4D0eq3T2bKy
 l8rXJOjpRjBWlDhKSTnarzXrTp2MfiRYE9JI2lAA6h+mdKJD7+TKvlpBV1fJPrq/UvJnoRGJZuv
 zxLVFy+FcEboDpvTyzhKyUbMdvEPfEm0xV1BHPZpgQQGcIA8GgrWO8oJdS1ocBtft+lWWps3h1f
 koR0DEkEqbmJ+478wdmB0es1woxEIPcuCkLDbG9il+gL3nipNHViehbIhyXBzlDo+7k0B7HoPdM
 1UsbIwNBPWMRY3E6rSPWlAh/OvX25JvBnebZaRi9Un2R9QlIxIQsDf1MGJvUooogE4DfyovmNrC
 jjGdbXbZMdFBz4HYBfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150035

On 10/15/26 10:55 AM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Some Qualcomm Snapdragon X2 Elite (Extreme)-based ASUS laptops (at
> least the Zenbook A14 and A16) expose a custom, somewhat
> Qualcomm reference-derived EC interface. It allows for fan speed
> reporting, keyboard backlight setting and receiving of a number of
> miscellaneous sideband events.
> 
> Introduce a binding for that class of devices.
> 
> Two separate compatibles are maintained since the two laptops' ECs seem
> to be generally alike, however assuming full compatibility with the
> limited available information does not spark confidence.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---

Forgot to add:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

from https://lore.kernel.org/linux-arm-msm/20260928-miniature-orthodox-ibex-d5b97f@quoll/

Konrad
