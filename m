Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90093CA49C
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Aug 2026 05:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787116420; cv=none; b=NsOT4Rsl/LXX+KazXgCCD0PWk29SbrS0Kx/835qS/q6SAxp3z6KZ7s7Eza39vbBY4pDDgJWkhhMxpVUGxP5HNWoTqe/5mcxq3dP+m7BjAxFxxIdb/owxjgC482pYUnYhCj9NOjP0KRbFMNnEMpGM1KP1HAxRNIb4yDQerfmgfkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787116420; c=relaxed/simple;
	bh=Hb66b60qnJnSpQBTJoAPDarIN2fbw63I443JMWsCAqY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=My2mhgzzW8mkIwzj8RwHsMYXrHMw8IS52hJ75knGnO3LpsEFgOJmo1gXQ6baHpILJijUK7d3LGSCTjwWUXaQzG6gJTWIJbfwsp3vOloiyg3xdEBDap3JbQe/HAEoZ1BpalU/PhozEHcGvldlq2sU2rhcGYGAAx1X2BtxtjNS9RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UGb08MW7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z5fAJYcc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UGb08MW7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z5fAJYcc"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J4v9Os4002222
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Aug 2026 05:13:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M7fdvEesRmQ1lXoO6VluZzaOF+h3MPh/Thc4yMprxbw=; b=UGb08MW7VT6JT03r
	gAihtJT4gSZ/cqAN8iDAP99O01HmIpL8djxI4yheiHAMFyGCXBOHLWzZnu/83t6m
	8bnxu+iCao5brT4ibSttUfv5ujhLI6TRVQn6fxu6TaXJXK103ggPeGjmkbx7WDJ/
	YKVrItn1HmgL7kQIpe44UKDGgs4L0vD9vELUHAAMpzsmnYp33mCjTv5p4PotHfRG
	sNI2j/2Py659SRqBu9RlQ3A575GlO9XEXKSEJ/WWCqyW8oQprGOgMRI76C7N78Wv
	HpU9xs4L4NRrGS42TiioBeVUrvHsyRHvZE4SGzSPHguiaF90y3TT67by90ZeG/aZ
	ajux3A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfpsdam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Aug 2026 05:13:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-395543dc382so892300a91.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Aug 2026 22:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787116417; x=1787721217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M7fdvEesRmQ1lXoO6VluZzaOF+h3MPh/Thc4yMprxbw=;
        b=Z5fAJYcc7vwR4fptGpLD4oq+mZkF+UfmMa5l/Kt6WnkSmNnV1r3JAIDfspGRT5gjdu
         IAWfylfsYljlizJLCIRGECYSnbOfH1kMZnSxbgRmklT2Xniowso3eO3GGIk8vGYjpCau
         oAmKk5qZjKXu3znGVOnciS6kQodIKxE9s7j2gWMJ89AiC/gpj8vjyG+0hnzG646/p7gj
         u/RUeN8Ynvxd5he4GnEOvp6cMppG6CnMg6aKu0SEu8kEHmsk9dGGLN9COBmDy+tXanb6
         b1OBIZLBW2mbBjNessVCphlisKeMAHI8NspCRKijtjXZm/eklOlEX45eNVwsCYntP8ch
         jpzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787116417; x=1787721217;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M7fdvEesRmQ1lXoO6VluZzaOF+h3MPh/Thc4yMprxbw=;
        b=Orf1attMm2y+OHpe3JJNrtfhN5mhCQxEsylceVsDNWHtAB0lqCSXxpIc9EMEdpoAnC
         tsjgdooRAg1/WDsgaC4ZX+IBgJCleH2WG7tj2Yt8t7XMWOIp3WEjryTG7izapYWvXbY6
         fSnv7Iub5D16U/0tMxGrl3tucyjoTkvxhfu3oIciWVG5R195RC4CT5ngJ+eB/YUULZY7
         JfrYrqraX//c3cQ3se/z0sZlF48y7JNM6P7+h0SfOgmXW2WOcBoCq/VuEcYSD1KwJec4
         /IoDG5jcAVs/bcT04j6kbbdo8U5SHillFM/IgMugKClD5j4vm01l413/nZQWkO5lPohY
         VRsA==
X-Forwarded-Encrypted: i=1; AHgh+Roy/WM2Bqd2eBbTJE6dZXGeKMKGnVPF1c7BYxmCzuf+G+SxcnfoSnzZwu6EC3StMTxuwDLAfZaTDSWgKPDHtdCLH6xs@vger.kernel.org
X-Gm-Message-State: AOJu0YzSJ8FeGE8mHyVnehJiFdbeiGVqybh1O9L423XMqbNDueBShuDv
	2RsaRYvmUd7x/A5VthZjiHKXZKPgEvuk1csJ/WjXyIfBb4iSMxvpDRO4jeGbtK0pWICYPX/6WL9
	G8wbGNh4C3qQgdD1t1SwV1T8OSRhRupXNn+f3qfJ7/ooRTALPIWo4lrjGnZP00SAcxc2k4bxX7R
	SWvqw0qjy2
X-Gm-Gg: AR+sD13X/V42OOqMN6uBSUnhBrmpHd93vN9bA4D2cdHEZ45+gl84Q8I1SjmTX5y3Ys2
	OQ/hUIRKvLoAhfa+1tKirUY7Zjk5vN0cTIpjjI1kfxOI6+79xKYkX3vqc0HEUjqNrtOXEKgHENr
	dfyC2BsAL8pxJ/qRiyBfQ0i7agSixaTlJm17NASxWdN3glbtHVGlqZz3QMn8p95dF3O2MUygkwP
	+azE8hRq02Lc/YVgF7IKFs7b/f3k5XM5RSjAENY4XOSeU/Wx/5ulx1zczpa9uZ8xwPtxbMWKwAO
	XXSoQIO1i7MGX1ug49P215NokjaiOzXPxr66niXbmmCOFE8HxE8l/zOCYFoMqiw8BR4mG8dr0Gp
	wtrKbvwT5xGJ+CcpexPzsk00=
X-Received: by 2002:a17:90b:1e4a:b0:37f:bfd6:8b40 with SMTP id 98e67ed59e1d1-39580a79277mr3732854a91.5.1787116417030;
        Tue, 18 Aug 2026 22:13:37 -0700 (PDT)
X-Received: by 2002:a17:90b:1e4a:b0:37f:bfd6:8b40 with SMTP id 98e67ed59e1d1-39580a79277mr3732756a91.5.1787116416374;
        Tue, 18 Aug 2026 22:13:36 -0700 (PDT)
Received: from [192.168.1.6] ([171.76.87.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb4ffb4sm1134903a91.5.2026.08.18.22.13.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 22:13:35 -0700 (PDT)
Message-ID: <438eeded-2f5c-41f0-a021-b5476fb16cb7@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 10:43:29 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] platform: arm64: qcom-hamoa-ec: Add fan RPM query and
 LUT calibration
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-4-771abd65ee1a@oss.qualcomm.com>
 <eb8731e2-6cc5-49d1-a746-3c81563094f0@oss.qualcomm.com>
 <96411e0c-f357-40d5-81f8-14523836280e@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <96411e0c-f357-40d5-81f8-14523836280e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ttPUzRm4XvPu26DjlN7fmXpcETXpCX3h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDAzNyBTYWx0ZWRfX0M9WavG9GS01
 FEgSNNWuqgSW46pxIJI6pJTRETmXQZM0XSUBpYtoBaDC3iijbAlY2K8U4tWNsEyk3s6c5DiDYOH
 ATLA7ERPjNbutZd7T+bhAN8aEuq62sX/ughwg/ebQuHm6liMDi14CqrdWago2HIKGdcQTf1ASw1
 UzP+Or5J6Ga34JN/xiBsSSeNSn3iHiwfLBcwPhyOL2nwWN72zrwhotuTA2+147U0Wjt1EwZv8nr
 8URbWpkwASl8eJXoVxlN0bVy83ueb3nGaBd4HfkZXDXFFDxBVW13PL++PQGV19bjOUlDz3klZsI
 0A8vwBz3csPQOGHGK8vEEXcDmxAYxBaj0oiH26fSfu1aI0rwCFPnbytEj+OkxSgpTOZ8RA072FO
 xtcUoKQRauqmv/Y+KB3Cr2kVu+zBBL2T3juVrc+cVIPW9VrIPSsmrcE2+UG7stRa9dMGHa94BNf
 tSOQfRndoSAtXEwD/jg==
X-Authority-Analysis: v=2.4 cv=aMrAb79m c=1 sm=1 tr=0 ts=6a853b81 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=alUBXKyVNpYQNee0O81Cpw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Vvnin58ruKcyw0OJcwkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: ttPUzRm4XvPu26DjlN7fmXpcETXpCX3h
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDAzNyBTYWx0ZWRfX3FTlOao5oqQz
 E4f4o59F+WE7CsqEsaTyklzY/bLEHLvoCSZ5imgh8rN3DUPuKTgbFF6NNzS981T2f5XZ4hTPSx+
 QsC56ZDSPoSzgdVCGI0YHqaFv+UurxA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_01,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190037



On 7/30/2026 12:05 PM, Anvesh Jain P wrote:
> 
> 
> On 7/29/2026 4:37 PM, Konrad Dybcio wrote:
>> On 7/28/26 7:44 PM, Anvesh Jain P wrote:
>>> Add the EC command definitions and handler functions for querying fan
>>> RPM and programming per-fan LUTs (lookup tables mapping SoC
>>> temperature to target RPM), and introduce a raw i2c_transfer()-based
>>> transport for the two commands, since their variable-length,
>>> sub-command-addressed payloads don't fit the smbus block-data model
>>> used by the existing commands.
>>>
>>> Fan LUT geometry and temperature breakpoints vary by board, so encode
>>> them in per-compatible qcom_ec_lut_config data selected via
>>> device_get_match_data(). Add configs for the Hamoa CRD, Hamoa/Purwa
>>> IOT EVK, and Glymur CRD ECs; IOT EVK boards share the Hamoa LUT
>>> geometry but are bring-up platforms without a calibrated fan curve,
>>> so skip_lut_set suppresses the LUT-set command on those boards.
>>
>> So are we expecting every single laptop/device that utilizes a
>> compatible EC to require modifications to the driver here?
>>
> 
> Yes, currently a new board does need a driver-side compatible + LUT
> config entry. Will check on the feasibility of moving the LUT
> geometry/curve data into devicetree instead so new boards don't require
> driver changes.
>

Even moving the LUT into devicetree wouldn't fully solve it, different
EC vendors use different LUT layouts, so there's no common structure the
driver could parse generically. Hence we need driver changes always.
>>> Since the LUT values depend on each fan's maximum RPM, which varies
>>> per board assembly, calibrate it at runtime: drive the fan to full
>>> PWM, wait for it to spin up, and read back the achieved RPM via the
>>> new query command. Run calibration in a work item at probe time and
>>> after EC reset recovery, and make it abortable via a completion so
>>> suspend can cut it short. Track calibration completion state so the
>>> LUT is programmed once calibration finishes and again on every
>>> subsequent power-supply-driven profile switch.
>>
>> I don't want my laptop to become a jetplane on every bootup. I
>> doubt anyone does.
>>
>> Konrad
> 
> There's no EC command that reports a fan's max/rated RPM directly — the
> only way to learn it is to drive the fan to full PWM and read back what
> it actually spins up to, which is what calibration does. It's bounded to
> a 10s timeout per fan and only runs once at probe (and again after EC
> reset recovery).
> 

-- 
Best Regards,
Anvesh

