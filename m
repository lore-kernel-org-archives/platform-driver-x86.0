Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5E8390615
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Oct 2026 12:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791981547; cv=none; b=L33loTOz83MNOgeTucQKKYrFBm4C/PlXlmTIZXt3ToVayI9vES/OKIYh73dcRWPJWiI15slDIbBtf7fxCNCK3NG4cFou4vP9zmdtArTpo20MOxGb/aY4d29SIsfnUp+fQNBNM3hHm3e+C2XneEN+/5a2HK47qeQEPmXGp5wSHxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791981547; c=relaxed/simple;
	bh=l1jRMWxG8RdouFaSgoCqrvZ1hJGAI4dQoynHDRwfyhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jz9TbfHul1vB4hsEdclmCC0ho2IjXjdq3EC+QBsumXtnEUx9Xr8kSMMQghwScvbXH51+u/mHXqEYnwK5id8fwaHRlzF9Q+3+LbrDezmc+m4DIiP7F+KYBgpv7ZhlIqqWK+K4fSZps+ft+d5m0E7wckymZA4/TlTe+10Mq2g1iYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F09bMLUg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SrjmfvaL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F09bMLUg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SrjmfvaL"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E9Lu612222162
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Oct 2026 12:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W8LWP4j+bIpY8MUEJUHYxf6cp4BonPSG9HyxtvJUqRY=; b=F09bMLUgmIud66IR
	bGEjfC8h0uO4+ZE471JhFlskW1uqinYqAfrBAyYuSv8Jyq5vFAG9M0ZIsYyuB4x9
	JtqMhSipBbwmHPUFj9YFsoV6b6t5adWkKFl7bpE0G6LdJ0FTFc/np2nNJ+sh41qs
	p+UsDbvk+1yJHsTR+EkUsT7M6tMHtDpS07S6SiliFZSGDjepHAGvjz7PTpTfoUqo
	GYNUoSuflpNuU0FZrpOpVic2HN3MoL6i1/EDA/zlDzMUIPFSm9WDoj3CequkCi3k
	b9ji1OU1/2Fzzmpv1duEsOAnUXKHiNfdERnyakYUHq/PvBZhiFhkbLjVXh/46qMG
	ntzNlg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9txsbme2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Oct 2026 12:39:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a8ae5154e7so5060648a91.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 14 Oct 2026 05:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791981544; x=1792586344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W8LWP4j+bIpY8MUEJUHYxf6cp4BonPSG9HyxtvJUqRY=;
        b=SrjmfvaLsbgxhL19xxJyfbkzlCqOKZHIvTihkBexitVcOlmKUNcTFC7DzjjVNmMM9N
         xEHcGnVYUzcwvVcWvM2EcwZ3BMAfTjp8ApRzB3xH0vVAvpKu6JD+tKmJgt3fnwFSZFVo
         PQuJb35OTpePDKhC5RbNgMYplSxhV0yqVSRlnW/w4LpGyf6J/8Slbpr0LYw0kr1eqiq+
         nzwTOH4/5Pwe/jgYqwgsgzORH1FGyEaArbCng1svIGuQgTOLklQlQkwghPRmKb3rtd2d
         YSS4PsGQGYzq7vOi2hgiZvrDn9cnESL66B9EF3mlikl2IkFyCGAtQ7v+Rv1AwlpoU8uc
         IesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791981544; x=1792586344;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W8LWP4j+bIpY8MUEJUHYxf6cp4BonPSG9HyxtvJUqRY=;
        b=YVsBYFV6AQXQvPhq/kN+zdFwfXhfg3JL/Zj7yN8w03BiFwBvGqggiW1E83Kqgny+xw
         pTESgg1FjKSWvYWKp/cPjFCkREL1tE0X8ROwjCNtf/XU5XJHiMw8O0QZ5OERYJQlKrbR
         wyfhFlDe1HpdgpX0lrNq0VAPY7+in3C0Jq70lLosdsoo+Au+v1a1HqiZs4c5wnEvgDUg
         vojvg3FFkIDeIwRHRKgAlnJpyDo9KB7Q8fbKlikFeMzb6ZJc3zXNFK+LHBNblFZ6sxlL
         RArpSQWDv+qLafUoW8A4TsAdvAlJKW7ZJebTZWUo7SmvASW7RnnFcgAj7tfX0b/04LvE
         C9Og==
X-Forwarded-Encrypted: i=1; AKwUvBwJZougqgQxAllrhV/4ZSODNURUGZhO9WXevUyCg55idtaqDfPxgGWlf2Hi6SPTA/gXe7499E2PAGtQtJbwbbeMUaM9@vger.kernel.org
X-Gm-Message-State: AFq9FYKyGgKdJfFS+6ZzqDtaG/i95YGYfKyjB2k0jiBsdUk3Ny9oz+4x
	u5KU8sZxpoKKIIa1fwHc1KkN4pWyRwC1pLezXdct9UHO62y0hJOQ5aK4wo+1gPHS01qiJa0T3Bx
	Hx/L9Qh3gvK67eGN52GG/z2WVUkWvHpq52ln238L+JXp4sCCn+xXgAebzWVYe7GGfEe21JZCivt
	X8
X-Gm-Gg: AYBFou1UK4lYqwuywO4BznpvMrbaFCpE+Us6tdp1LDC2mHjmHIy0T/ThRT1SXDfWOvG
	ECoUYiraoskVpTT/2dLYsh0AaAR9VtP32+8klEjv0VV2PqoLcuwjzl7AoZTaeC5Scb6GMwc9ZCV
	rJIuVLuulpAB7J5MiIFVgMBmp5c6OgKobuTLQ0saY8k8r8naiiLG6IAjFEsiGlKK4DsSFQUZyI4
	xQJ2HPiPJVQgML1w6Lkil+8fuObcXqsbJs7J9RYsMna9H0TlBptKIHmiSPE+PAQsZ0n1KS7fkM0
	5dBWoKIqVo3Un7+wfRImFpMXRMXkPt5BoAqJXM0pvgEq68Zxv/F4INHRMy+ChyL/w0y/mN1qA0g
	IykeABUcXZiMgnXYcvccMgF60BXP8eQITZBlIzE614RWuw591pANiZvrRTGr8t9oQAQ9zm5f8VO
	BTYDtiKL7XEGewK1RFebapQd21cmY=
X-Received: by 2002:a17:90b:3c8c:b0:3a4:967c:6947 with SMTP id 98e67ed59e1d1-3ab3a99b4d0mr11899810a91.21.1791981544211;
        Wed, 14 Oct 2026 05:39:04 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8c:b0:3a4:967c:6947 with SMTP id 98e67ed59e1d1-3ab3a99b4d0mr11899778a91.21.1791981543678;
        Wed, 14 Oct 2026 05:39:03 -0700 (PDT)
Received: from [10.149.108.218] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f2ba9efsm4368806a91.16.2026.10.14.05.38.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 05:39:03 -0700 (PDT)
Message-ID: <a60bc242-e132-4d92-9f04-5d234ba4979e@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 18:08:54 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: Add Microsoft Surface Laptop 8th
 Edition
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maximilian Luz
 <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
 <20261006-mahua-surface-laptop-v1-5-406fc042162a@oss.qualcomm.com>
 <762978b8-72ce-4836-85f4-2cd3ee4dc5cf@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <762978b8-72ce-4836-85f4-2cd3ee4dc5cf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MCBTYWx0ZWRfXw+xbcV0HjFSa
 In6ybw/zlEOAk6WxcUDOSkMycvgTDDmtPyk6V8dQ77IAfT4i6ER+ZU1kVz8WpOxdJv/USXN7W5K
 t5DIYhBmI11saIZDx4sHC/1cnxz9SFPj333PV8ajfRELFFrCVkKzeFneKdTTo44BOcBYkK5deUS
 HYjX6MI1ixwL20kbm3zLAbQlxRuanCfytL0CjLn3SA0H9dFPb0QHpVX1NmduP/E14ZsyhMbq8B/
 ccRQSh5SrZPxg7xjQEc0vTFeRkX/+WXznHm+Q4DkeBxr60/T793fYGSgGvFQBajUn3rOLbknf8w
 0mAXXpkyrIz+duvXGZGLbtWZLzeoPHdiWXEVkCzpUx8vitlAYBi+udtVszoQGg5cJGsHoV/86wy
 iVfSO96RIypsrzereTEdPR2fl5mMkO9wRoe+4PrzlOEbDWKCNQ5QBeS3HfyN+lZUp7W0z65vCz/
 WiFyH98qcvO2ZvEhOyQ==
X-Authority-Analysis: v=2.4 cv=LPPz05W9 c=1 sm=1 tr=0 ts=6acf77e9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=03qAMiCteCMXZj9sYoEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MCBTYWx0ZWRfX8Toe6sUsqJjq
 QOes0YEeaVuKGW8oE15w0gAe7d2vFa4RtjTIeyZu1dCYxVQLsvJAwJ7HQgeygm5gut8HVmjs5eL
 3xNA8Y2HaqI+XC50ft3IjrswOTL0IEU=
X-Proofpoint-ORIG-GUID: NhroarZTp05SKsImP8iN2-SjzZ6vWM3N
X-Proofpoint-GUID: NhroarZTp05SKsImP8iN2-SjzZ6vWM3N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140050


Hi Konrad,

On 10/13/2026 4:00 PM, Konrad Dybcio wrote:
> On 10/6/26 11:50 AM, Gopikrishna Garmidi wrote:
>> Add support for the Microsoft Surface Laptop 13.8" 8th Edition, which is
>> built on the Mahua SoC. Most of the board follows the Qualcomm reference
>> design. The keyboard, fan and platform profile sit behind the Surface
>> Aggregator Module on uart22, same as on the Surface Laptop 7.
> 
> [...]
> 
>> +&mdss_dp3_out {
>> +	data-lanes = <0 1 2 3>;
>> +	/* HBR2 channel equalization fails, limit the link to HBR */
>> +	link-frequencies = /bits/ 64 <1620000000 2700000000>;
> 
> Oops, that's no good - is there a chance this helps?
> 
> https://lore.kernel.org/linux-arm-msm/20260622-glymur-edp-phy-v1-2-814b45089ac9@oss.qualcomm.com/
> 

Thanks for the pointer. It helps, but doesn't get HBR2 working.

The panel (SHP LQ138P1JX61) supports up to HBR2. With all rates allowed,
clock recovery passes every time, and channel EQ goes like this:

               without patch    with patch
   HBR2 x4     fail             fail
   HBR2 x2     fail             fail
   HBR2 x1     fail             pass

Without the patch the sink asks for swing 2 / pre-emphasis 2 on all
lanes and never locks. With it, lane 0 settles at pre-emphasis 1, but
lanes 1-3 still sit at 2 and fail. A single lane doesn't have enough
bandwidth for the native mode, so it seems the PHY still needs more
tuning at HBR2.

Limited to HBR, 4 lanes train first time, so I'd like to keep that in
v2 for now. Happy to test anything else you have in mind.


> [...]
> 
>> +&usb_0 {
>> +	dr_mode = "host";
> 
> OTG should work just fine on both ports

Will drop dr_mode in v2.

Thanks,
Gopikrishna
