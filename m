Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C82453E2FF
	for <platform-driver-x86@vger.kernel.org>; Tue, 22 Sep 2026 12:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790078628; cv=none; b=YTQEtRQGNtb1YQYlit4oZXQFfFPEVnRp+5RdIZaowMDDpjaN4Q9/47jj6D4xqQbtO8wnWcQdHgKsEa63caCKsDYlcxcemA+sWI4nwwVbe6GLM56s3ienenoDgB2EOKOIxcSRh5gh+0+RenJJUA8d+ekA5RO0l3Nb6XG9dMkGvDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790078628; c=relaxed/simple;
	bh=SZCXlrQAryWhTDqNuUadzwglBxE2aUkKuezLoH0aDRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h0HHMG8qEjgBXSpVEQnNDMLESxUXo7R/WB3atMKGtITtjxHScqNJ88H2kPuUheFB5HQcayAkcdpOyrv9KqCcuweFWQ6fuYJ0tssx+bXEzSVKKM35SkrNiCetGghwD3KigyBBKHAKMW5Urb0AnNSlcUdRaOHitFMnjw33iDh20mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XGIYyFF6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BgAdJlHE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XGIYyFF6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BgAdJlHE"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPhkN134476
	for <platform-driver-x86@vger.kernel.org>; Tue, 22 Sep 2026 12:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7a776RgZFeskGxVekBSZFf3BASD5Wked69cTCRkftEw=; b=XGIYyFF6dsfvo/OU
	YLl/mPQe/Z9bzqgu4v0+bXeQ0CJd2miuxkagDmzl/TfuBjcBy+Z99sOY+bjtFM5s
	Lbz/Xf8mxKHyTBYtmHvGxKhXrUx/caCOuqMVt25HIuZi4BRXhfJNEJc8IaBov7f6
	uFc9CRghMAdywstpZ2eb7qfZzN5U4FwdssqDJn8/WJrw/tYhtzS1RtvHax5dLoos
	e5kf0/CR/KcjLZYmg1lmRnzL/rjR8PlQfNOMkB5tzOamiqPsj8J9uyZUIAQLA9Y6
	/HKqC/4/pcFVBFvPj1ujY9lRgKL5EUQTccV1ODfAnsJ2TaAXDs48gejNjzDgrUP0
	arvSqA==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gujkj9s08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 22 Sep 2026 12:03:44 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-45f00527132so236482fac.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Sep 2026 05:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790078624; x=1790683424; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7a776RgZFeskGxVekBSZFf3BASD5Wked69cTCRkftEw=;
        b=BgAdJlHEET0Zey4poWZlccsZ6t9o3sp2Hx6+OcU9SiQDPxiD1gHWTwG7Nv2Z9ciNFb
         /E/3UHlUU5lcLzqrrAY14RLj+BNGNE4zpy88eWg0G5a7WJ1Nw43M32FH7zVGI7GAObbu
         XZE0sqMBscy7WPt6AxAG0VlyO4H4a1kqMQCCQL+toQil+CWSHA6w9igeZzbZKSBW1Z1h
         U0IHDzEhjVYUMSMwtxStcoyGa25r+RAf5VF6gkUIYJMFBkAm8SH4V0DxC4FnA9lPG8R7
         nPfxK9fpHajBBO13JHqC9bgCO0zBKQYwA5ZNKSwY0/eU4U6ZO0Rl01FJRlsN0g+xm7i7
         ObbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790078624; x=1790683424;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7a776RgZFeskGxVekBSZFf3BASD5Wked69cTCRkftEw=;
        b=ph+GqqIl6kj8CJNk18IAubZa+YXkDkhdoCa0UU3ihewbSj/K8mgR2uxe56czQhPoNb
         kFZWQMlnK6u/kDJv1mLTErhiT/DrvxqF2lqPt23IL1K+9AzpKEmnnrxoNVo8v0kPOZ8m
         wqyaIU8kZ4oZftDSJp+zLmApnpnWQijb7o0VQXoJrhBpH8bBVDF5AJKR8AHc43Cy/HBy
         Zxcqct2eyzm2J6TCwG5AAXRDyYZsezs0UnEE58+q4h/Rrgedvg6LQjpyV0ocCWnURQWR
         e6ITlJnV6hgbwrvSVX5z9m0AdP9l2F90lPzgBIFsEBh+dfLWbhjOP8tMyqZ0Hq8J5oZp
         rTog==
X-Forwarded-Encrypted: i=1; AKwUvBziq7kyjoBXbM+jm0zHO1gkmy1DrZFCjVD3suI1AAX3XtX5Vj8HDQeFLzOsPSHQU5n+NOLdBvP3cTGbu216Q6hmixOq@vger.kernel.org
X-Gm-Message-State: AFuF++mSqBGOy6WwQJ0UK452xXEMPl5gBXS9hBRWGv7Ggau/ewHvYPjo
	7AWB1Fegg6LW56QRvO0ModH7RAKVtdogeV8vcbU2vNH2g5aI5MrU8kc6Vw9q/wFGQMGuUGoqtL2
	rpupJG72chbhVcM+NifWZQvsJxZwB0TX16fMSAAezIE7+hamLnP9zKNxJmS20Gx1Ukz8wKfHGQl
	IX
X-Gm-Gg: AYBFou12/T0lby0UEtz+C3Foa64tglBUJ0lCfRg7qL3/PoLr3CyenbSZTlI/BRKxzkW
	PoIs9xoTtL1Bm21LzeHIN2tHCsg95X0wafZLh2yRC4AqztkjJpmYFO1V20JvJYn81Kf62ZBwkQ6
	gSvYtW3j4vXf4j4llVSAD6RDAUZX7x7AB2WRPYYateB/Hz6BEIpnKP/n6D758a3Z2m8etTo6xxb
	ScHeiSMZs81tlB+1ftMrFPLmV/GWvv90efz45FpY7HKymScIM89KdzmByTCV/7oXkzpot2BkVWW
	c+0qk1pBPif2F1jIv9YD037dJ0IOQBzP4gBLP1f5TrxnzG1nf/LWyFTi3rVb82L+5RLw2vuA6q3
	2amCJB+iriO7Z1qC8/A+PeA==
X-Received: by 2002:a4a:e205:0:b0:6c7:76c8:1a6d with SMTP id 006d021491bc7-6ca971e9d72mr10228111eaf.0.1790078623753;
        Tue, 22 Sep 2026 05:03:43 -0700 (PDT)
X-Received: by 2002:a4a:e205:0:b0:6c7:76c8:1a6d with SMTP id 006d021491bc7-6ca971e9d72mr10228055eaf.0.1790078623189;
        Tue, 22 Sep 2026 05:03:43 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9f1895ddsm54692066b.9.2026.09.22.05.03.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 05:03:42 -0700 (PDT)
Message-ID: <69636cb8-5867-42db-a8fb-aa8b2d9301e2@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 14:03:39 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add
 the embedded controller
To: Oleg Keri <okerixx@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org
References: <20260921144953.15113-1-okerixx@gmail.com>
 <20260921144953.15113-4-okerixx@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921144953.15113-4-okerixx@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3U8yOoy0YXIFvyuHD1YsFXQPhQCneU8w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE3NCBTYWx0ZWRfX9eg2/pElQA5H
 LxpipWuHqPYADEDVF+wgI5sZuHbnOLlR0ReaE9VKQ2SVYnzrpvlrddl869QNKqT362NuU8sqwny
 mMNTYnTgyWXNiUp78lxwJ08QRrE6hB5+jOyi2hRW8djrTl+lOBxV7Jm+QHvjmJN/Ur+K0fkRTLj
 rkjWEk+ssgCMcZlm8TV1dY/xZe2+P23YDD9L7FGw2pnOAtVuVBlGY4sXnqw5YV3ScjUHGpfh4p7
 tZgzWqR7qO/3TEsL36ffANPmvybcA0bR/wQ+dziOUgjD40iFBW1iaUt7lDlOe6Hfn5hysQUmyDA
 dLVWAv4Gme/+Rb8NZo27o3AfZgojzHbWoiWL+yrz1gyom1B/P0j1B7qOTsQunle5t3yZSj0/wCo
 4SkK51i47PdLDdHr+K7ERnoHkBQYhEJODN8UjcTHO/CXAqb3kCeWjKgHynz9CCyYX3kOp06CTrQ
 xRxFUnWiNMPpdiLVang==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE3NCBTYWx0ZWRfX3QFhbvGnliWB
 yosym/lKvPqeFZXaqjm6ekbW4ImS60nLXDd1MUCyyFSiTtD5SGKDnVLZ7btxdq94NQ7pe0J3Q17
 91Xsk2zJ9r5wGGZUtz6T0djG2gPHPDE=
X-Authority-Analysis: v=2.4 cv=SuAFe/O0 c=1 sm=1 tr=0 ts=6ab26ea0 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=cXQzEVsWzZF_LJZYrIMA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-ORIG-GUID: 3U8yOoy0YXIFvyuHD1YsFXQPhQCneU8w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220174

On 9/21/26 4:49 PM, Oleg Keri wrote:
> Describe the Compal embedded controller on I2C at address 0x70. It
> provides the board thermistors, the battery cell voltages and the CPU fan
> speed, and drives the keyboard backlight. Its interrupt line is TLMM
> gpio66, falling edge, for which the file already carries a pin state.
> 
> That state leaves the pin without a bias. gpio66 has no external pull
> and floats when the EC is not driving it, which shows up as a steady
> stream of spurious edges; the vendor ACPI tables describe the same pin
> as GpioInt(Edge, ActiveLow, Exclusive, PullUp). Enable the pull-up.
> 
> Signed-off-by: Oleg Keri <okerixx@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
