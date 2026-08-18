Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F77F30FF2A
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Aug 2026 13:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787058408; cv=none; b=Ht0Rbo0trbfKhxqOj6nVDO6ehPUV1enP0dN1qrAfiV4KKTSn9RY6YpBArMUvjIB/vg1A6nVmZPHZIWPg5gLF6FiydcJeUDekQhV0LpaOs97wMwrXwKXjlHISXWkpg2qlOJSUIC5M8igN3v9AEuKSaxEZjuSOL7sASYHpYg5en8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787058408; c=relaxed/simple;
	bh=KYv5PL/TF+d76RiJqFNjvnmyTh4nizUzZ3HOo3pZhXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SXgojnf49RG612HHzuBzC9tL00brUBSy0uKcIyx27jJTwoMR6XQJGmEO2zNfm0CABw2g7buizD3DqIWHo3fwrFK6rq4Nyj4Jen5iTINI1HkBdKfhd9KU5AbtjFLCkFGJeVOLa8qNQgkRKhy4+vz9EEImvMeCjd/Rjx9uz53Ook0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VvdPxaxC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i8Ps5oXN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VvdPxaxC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i8Ps5oXN"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABYCJ919497
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Aug 2026 13:06:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7e2FtV7p71m6bF85tuF07LQ6OZkylmUItn06kMAU0Bs=; b=VvdPxaxCKy6r/ZxM
	AH4+i+/ej09M7SW4xUbAnC+7O25p8UH8tKmXf8rUyMh65PLmjMdZM4ngRwMK97/Y
	xWy1aCvF1x5C7Q5PRmC6JMWg320cRLX2MYtQQHviwWUg5fYqn6cyZ998CDt9ngkE
	0Vlcex6uc6NhS/jyL5FBgrGxq1qVQhbaYfQALtF1JnEylR6vRQE0+tPO4n/cOa6K
	4Padp5OdZkvzlgN0lo1a3OZ0pjee3Z/qmKgqyIlVsCIPT6Y33Sc0h2c4rzGCvIwz
	7d6dPmog+JxguBEN+TGCZE4dBotSPwwWDJFpHF4ZDSQwz7TeP6fmwP0HIXSKl8cn
	7/75/g==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4nb18nr1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Aug 2026 13:06:45 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bbcdd9a269so73782e0c.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Aug 2026 06:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787058405; x=1787663205; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7e2FtV7p71m6bF85tuF07LQ6OZkylmUItn06kMAU0Bs=;
        b=i8Ps5oXNyxKe4E2FihFgv0U9wkPWCBE5JIP2PDMZnTGBUZ7JFariSfCW5yxG+H6F7O
         1rPdCYB7EpiicuEe6U1bEznhLtnMVT2k+X8DcST0fn46tkwunNNiFYkIY7YRUHsvmycd
         6ut4J2kB4LjCZsemyyWxSWBF8CmEU+IU82QVkukJzMIe3pL36F9nBuySkWJIqYVfb6Kt
         Ift2sS9vqoYbjomomsBRZbt8UVVizbY9XkUxHFSJB9+2lPBmIbXdSfMt75oXMTj0rvIf
         JNJuWYrdB+GIzDMsdRZhN3q4FSD4UgRhdQ2EYvv+x6U366hXcuUxEu2F+l45kmHn4dcR
         ejLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787058405; x=1787663205;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7e2FtV7p71m6bF85tuF07LQ6OZkylmUItn06kMAU0Bs=;
        b=M4PIO8A8aO09UDYNfwUmUhWUyTPSurX/SkWkmp88h0kqID89qwFsqM4+CPTkF/hVH8
         anfPAbdQVmLm91fWPJeDkWQ+OeVVaCs9PJjL2hRsaAHDvwkZZDUgbpuKjAwdyr7xUSt2
         LUdrY39HAotAflhiUNmLVv2+WUNli5Z0W2hx3f/4+/uM1roGcX6kEZ09LRxr1v4GRvTZ
         gTAh6hqlrWkVlTmL2Hqb7dgb/NZVvmxuHTcNUgrOmCBgkasukIhoTg8t2atcM5Krdsvz
         gsfd5vP1osX86rMzRQ2gGfln/AEeyBFiGrMPXZMh7TS/kKdHOpBuq4hGwog9FJJghDvi
         9/HA==
X-Forwarded-Encrypted: i=1; AHgh+Rr6W8rhBIBpI70jDIY3VSEtGHlF2kQAS1QnJnzLDOLBxVtoblMekp+3VONlPcEZUhy/fO+hNXg7ubqQawpeFsL7xzvh@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2zs9xGBi1NMzQZTEu98RL1+14nqI3JUZieJNgozn20oGTIq8j
	K0dMdKN5ZNyjekuakpWGdBZ+OuLP37rm+xGc5NwqyarGxScUwL4k+h7lv+ZxWdQBTxQ7uOtw130
	IcyMLk+bRkYZaqcL0Jdml7/1IPYInMGg6DrrxBOif9SPy4HiISYuRZPwEsQHeD8TwtymuQbkjr3
	L6
X-Gm-Gg: AR+sD11Yy6nvuNbqZq12pu+4FXaH2DeO7nDBpUAH4N9GYA9akK8QnT1TdRBSIHq6mf3
	5cOfLSXdTe8yO7AKFFn9mFsH/jm5zLDMc1gkbUaOSOoQvNlDEYmyNNReAoQM8B6RZTFM0ldN+VU
	vHorvZoaIxb4beyBsjZAq2gKEgZdWFoWpijDl26VBrU8yEFHnJJjpJAWbAeBFNY45+7e2Q3EkSw
	BcRPp7zS5dyjtIL8DsIt8JWAZX81eXYNUDi8/kyxjRckwr2iWhAZfKjlfRKh6RS4ZHyhRlHkY0p
	Fjjr18vosNjSVIf3o36RaghYZrz6mQIdd2IPbcDw1UHZ9hOWD0w4h4iBHO3dJIiUheXX5ckM/mN
	4ax5rLrZB9SPBfw80vez4vE0J
X-Received: by 2002:a05:6123:4205:20b0:5c3:6e8a:4a22 with SMTP id 71dfb90a1353d-5c591f2c4afmr2346543e0c.3.1787058404946;
        Tue, 18 Aug 2026 06:06:44 -0700 (PDT)
X-Received: by 2002:a05:6123:4205:20b0:5c3:6e8a:4a22 with SMTP id 71dfb90a1353d-5c591f2c4afmr2346474e0c.3.1787058404495;
        Tue, 18 Aug 2026 06:06:44 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46d00ab3fsm1214108e87.59.2026.08.18.06.06.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 06:06:43 -0700 (PDT)
Message-ID: <ed39625a-5b38-426d-9cb5-a1e486d25ff3@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 15:06:39 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: x1e80100-dell-xps13-9345:
 introduce EC
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Tobias Heider <tobias.heider@canonical.com>,
        Val Packett <val@packett.cool>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-hardening@vger.kernel.org
References: <20260809-dell-xps-9345-ec-v4-0-88306dbbc7aa@vinarskis.com>
 <20260809-dell-xps-9345-ec-v4-3-88306dbbc7aa@vinarskis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260809-dell-xps-9345-ec-v4-3-88306dbbc7aa@vinarskis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA5NyBTYWx0ZWRfX3mGsT5yCrz7F
 vNPQXGVkJyU8DI6yhlPt2nVtJMrRuTIX9UbYprWEI+rxSsU2AcEptxuwjQ4eu6aIJBB61Dk3HId
 kEXxckU17DDP9sra7jSuTvn786uG8j5YPzXtKFiu+59yQzro26ni0/WA/uM13MZ/nXkj+Ito1wY
 nEHeIj+u6eyixAWuKdkIg2N7/bt23Vm7RJpHdITc+wcayrTu5QuR+AqYxuQe3zcLPawzUr+XwgU
 B2f9aLnutvuUxXXhTCuTImPvra8FOsuxsWAwGf1Nh3YwQm9tHO97WZqO5v3aBgTpDStG336ZJtE
 NRbfJcG2Mqz8u7t0qfFWlZiPYYm73UgAf0eDt0cfzPcZ8y/1/wAbqbjXjE85RERWQ9LjZIdoJ12
 URFODMgZgT2XTsTdPfoaeDLsvivKr5I5g99UQMoJ7oivA9k9hpOAjF9oZjg3OiLkR2Qj1w3FZR5
 VNaL6vcE9AkwnsZ9xGg==
X-Proofpoint-GUID: ARSdRUsPkXI0GobP66RFYv-oP4cz6T9z
X-Authority-Analysis: v=2.4 cv=Ze4t8MVA c=1 sm=1 tr=0 ts=6a8458e5 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=I76Qk8w-AAAA:8 a=EUspDBNiAAAA:8 a=BDX-M9UYCxStvK4FQfUA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-ORIG-GUID: ARSdRUsPkXI0GobP66RFYv-oP4cz6T9z
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA5NyBTYWx0ZWRfX0xio8C4+B1jB
 jZ6999NqSfUTIpoJMWi4CAGexzIw9SgzAQzODIpMKVE21o8Q6EI2ltKSSeELI1BoosaFNCulKzB
 f0qWTre3IueWhggiW5PCWG0KCZgSxDU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180097

On 8/9/26 3:32 PM, Aleksandrs Vinarskis wrote:
> Describe embedded controller, its interrupt and required thermal zones.
> Add EC's reset GPIO to reserved range, as triggering it during device
> operation leads to unrecoverable and unusable state.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
