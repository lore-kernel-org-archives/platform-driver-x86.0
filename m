Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A7A351C04
	for <platform-driver-x86@vger.kernel.org>; Fri, 31 Jul 2026 05:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785476889; cv=none; b=VbF8bM24BciuGOhUkS7SoBOP0CtnSf9gSCiwC64Nf/am2NzAnJedpag8ywKKLOCxB2R82bNdZkpVvle0d/htKQvMvVybCUy7j3gCm7aHcbz9Si/A/yQ6HC/6XIAZSeNbd25lAjIGR3C6Q3G0KQPSVOkVmyktqKyUEWLA5nOPPYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785476889; c=relaxed/simple;
	bh=X9bI3KryGBVoO0zgYTMvyGaCEVM+CP6pWzGHPchLeoc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S/1WXQIyMP9iWjogqwe/FMwP5KsNDHwgCFGzhz97NAAdqj6uY96IToI+LMkm5W0GsO2KMdH+2aI7PIEUmSxRrIColamwz8TjMibahe3EsmbEDwbIzGDmpxpjqROMRkKgFK4GzjQCUrWwgOWaE+0pW+FU58nZEhH4aLbg4jDbLog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R59iY9UA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jv/bb6ei; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R59iY9UA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jv/bb6ei"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V5jrAC3014962
	for <platform-driver-x86@vger.kernel.org>; Fri, 31 Jul 2026 05:48:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JxBG5UieYyr/vXdsG/LnJem5I19aPI+KoHvdzUbIAeM=; b=R59iY9UAA6LL0jeX
	vPS9dAgtordx7E3wO9PVGdhIaaSRdfGOdMIS4Q391hFnNPL/CetEL4u06Co8xIJN
	vcImJarTdnVzs9vlj+bRZWEOd5LMqj4dqksT+SCMOWXG8IOESVjrYIo2qT7YJKgu
	J90yRHjTTLn6gbt8PPAjT/AT6vLaCcic3RcSFia1rR3SIMZr/Ak6w/vZmvtmhgDv
	fb11zOwvhzIuqbIrqDFSgTVKTwJK1JYEy9ptw0smiwr++AwRW7l8bxhy1InCC9Zw
	SVElY2uLLrN8CxnW4l1aCRvWZgIj1zsN0eN+tXSaMFeZInIFcGGaKS1a9XBWK6PD
	VpjfKQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frnuc008w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Fri, 31 Jul 2026 05:48:06 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e024d2129so1259511b3a.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 22:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785476886; x=1786081686; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JxBG5UieYyr/vXdsG/LnJem5I19aPI+KoHvdzUbIAeM=;
        b=Jv/bb6eiu27MxcmuuOx95myZmN2CmQljZTnWNAvj1KiqT5RzJTFUzh/nG/i3zg8ibv
         KPEA1ESQD7BdJE0XL2v1au9xYGNWdVAGhavoO2DfB3srhu8r5uOeeGC2u7EXL49MGevu
         qwSmdrTeHk+eJWagZvuy/5gaa8LaaUxQ7sjvDFKL9BLtD6pXHAXCdTYumlIX8ifqEH23
         KYNbQljwr4laj8gHyp/uilgbpHzycK5eX2f+5DLVJ5U20Mloc6aRziwXmsabzQDxz/+e
         Mg1+2pHlloa0bbGuH3U7k4IA9JizXjCdT2TB32Y56HqoXmLQOzHAGtunRqnCPEe5PqhQ
         St+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785476886; x=1786081686;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JxBG5UieYyr/vXdsG/LnJem5I19aPI+KoHvdzUbIAeM=;
        b=CzvAzoz6qPjjK6YgM4PW2U+oSIt6rQH0YwfNikVIRKJlItG7OxFPgjqXRaiCjxl+TG
         mv1RaSTonyMS9T36x6f6bEW2KSzm0UJIO6uoDrM+0SxHuLPcjCs9DIRujkVcTWEWj1Jz
         OUcF1OxVAMjmaET034NoxelPS34bEoMJ1DTdpU7zT84mAHYgKaznw0pzZOl0BsOWakAp
         2vdZBo2iZNwC+0zZ9JsEWGK3nD1FhkEe4go6VXqkhmjT7g5JfKE6JjcFVF66tiu+tMsd
         uyoB0DPKSheBbDaPuzdsRDZFoGZc5KzZp3KZD6TGjEy39u9ppONio84PUj/X+OGQ1LXm
         PJmQ==
X-Forwarded-Encrypted: i=1; AHgh+RqVBY93IZBgP2198GZz+wkJ9xQ+ug2d7UvZKpUsECEYrh5NR16K+7RRTjEPqOXX7kGxSsLD5F+YW2j9IssQm8c+3lnK@vger.kernel.org
X-Gm-Message-State: AOJu0YzpkPRUfWUF+QdzF+DV/NwmV1gbNn3RdlLiHRt6D8oGMhsM722y
	6idYok2lVDMxhDE/LDsVYSlIq2Xm0YJWrilVRGql6d42KnDQ3oSL7AeOXu0yzVBL9dsAYAKKgNk
	Xla7o0gsNy5RBXNWy2xR0DdmUFOvA9HeHk1jK+I/H5ox7Yv/oKrOmsmX803r8iglRQjSa3N7qFK
	ed
X-Gm-Gg: AR+sD13qeJIbxBsieVKCHc+pADLC+YuVIfVn2qU+monpeCmQd4eIpWhRyl+D9akCOEV
	DNvRk5NQN6z32NwLSkfp0OGV9fLwbvHRRu9PXM2dYlC99nOz8n/Obv77T0pjL4IUQMgyZQ3Eysk
	G75ejbze8c7FquuVjf5lh5DDhzp7g8hu80Ugifk6phvUJ5qugAdnoh1+m6YZwIo24viN4hdCSK0
	yOxTj1yo1Xh75Y7tPPJfPl0ntdndAyKfKd3SU/HY5O16ISuPvNV2iVVWZwWDqqT5rlg7YRarymi
	wMLKIOce8TYXpKZHYQqDeesgWi4YffLCwa7ftwtYVDdt9ih2jFmo63dXusMnwDvKH3fjVKfM8H3
	BfiNsoID0b5ecgz0POdHVZ5e+bP8MY7DfryESxwviFRX9cMj36akl9lgUtopLM25uQVOhj5l6Jl
	7IOV3kbTyIDH3VjQ==
X-Received: by 2002:a05:6a00:4b4e:b0:845:eadb:821 with SMTP id d2e1a72fcca58-84ed6bb1f27mr583239b3a.14.1785476886250;
        Thu, 30 Jul 2026 22:48:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b4e:b0:845:eadb:821 with SMTP id d2e1a72fcca58-84ed6bb1f27mr583219b3a.14.1785476885870;
        Thu, 30 Jul 2026 22:48:05 -0700 (PDT)
Received: from [10.190.200.192] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ed5782ea8sm309379b3a.1.2026.07.30.22.48.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 22:48:05 -0700 (PDT)
Message-ID: <d3094d80-c51e-47c3-9359-2d28d6d47c8c@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 11:17:59 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] platform: arm64: qcom-hamoa-ec: Add SoC junction
 temperature reporting
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
 <20260728-ec_add_more_commands-v1-2-771abd65ee1a@oss.qualcomm.com>
 <94081897-2e6a-4c8f-bd95-1961ca843478@oss.qualcomm.com>
 <95133f63-c7fa-4c68-9db0-2123cf754f50@oss.qualcomm.com>
 <9d9eaae1-97e0-492f-954d-d683f089ef78@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <9d9eaae1-97e0-492f-954d-d683f089ef78@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0TN-v7L0NcbixUj3KoMwp9BkQCHur7jS
X-Proofpoint-ORIG-GUID: 0TN-v7L0NcbixUj3KoMwp9BkQCHur7jS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAzNiBTYWx0ZWRfX3N2cpJ4L+vqe
 7xm59u9Un0ElNHFwF4aDJ9zZB4xGF5CNZaZVJC8sjxCRyPB8VVnIwmMwzjiSLc0S7kuVMU0PV6V
 qYuA8P2Lg6kF+JIKjsyHOcwe/MKQiZGwIp5Nak7h18as456o6zMGERHoTX3HclGBdJGzWMv5O2l
 noz4vOKBsLvIzpzzboxQfK9fl5eLNkjdK3MyITGdM+gfRqdPlVjJg1+g2DZsVd1pKl3hOogLGiI
 jYCrdYx+dUqeFJtuvn/Ox1ARSr7y3O9+B1rcdsu0yeHAI1TsrMSU35MB/S6jLKNUTDlKj85VhZT
 jDz/OSQJDedNmnX56VNAC5pHdgpfz9WzqqBDf/8IDXMABY2B/HA9mJO4QsksEzkr+927yM9o7xH
 QY1hZ7RWtzeYYrxjRZzPoBihSv9bWNsnaE6Mm64pyTaV97M4b1sWZbGxYiS1TMhLS4gf9QG22fs
 5DQkgQBzjPhLvMGv+Xg==
X-Authority-Analysis: v=2.4 cv=T5W8ifKQ c=1 sm=1 tr=0 ts=6a6c3716 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=4dpkOlLZqYEDTin6f6AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAzNiBTYWx0ZWRfX9klF0GK+Z2Go
 lMLvsVkamJX6XnfSqKEKRIlXCMBo8LlNxiA1Upty/2NTmca0uqC9zEBfJ3EW5b0TIrnAHQHhHXR
 qF9kQge7KH9bibPwWsLJWPDkCRZ2sbw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310036



On 7/30/2026 10:34 PM, Konrad Dybcio wrote:
> On 7/29/26 3:03 PM, Anvesh Jain P wrote:
>>
>>
>> On 7/29/2026 4:29 PM, Konrad Dybcio wrote:
>>> On 7/28/26 7:44 PM, Anvesh Jain P wrote:
>>>> Add the EC command definitions and handler function for reporting the
>>>> SoC junction temperature (Tj) to the EC.
>>>>
>>>> Discover the platform's thermal sensor to zone mapping via the
>>>> qcom,tsens device tree property, average the junction temperatures
>>>> across the mapped zones, and periodically report the result to the EC
>>>> over SMBus using a delayed work item. Serialize this and the existing
>>>> EC command sequences (firmware version read, thermal capability read,
>>>> SCI event control, and the SCI IRQ handler) under a new io_lock mutex,
>>>> since the delayed work item now runs concurrently with those paths.
>>>>
>>>> Re-arm the periodic report on resume and cancel it on suspend to avoid
>>>> racing with the modern standby transition.
>>>> ---
> 
> [...]
> 
>> Agreed, will split the devm_add_action_or_reset() conversion into its
>> own commit — it's an independent correctness fix (also disables SCI
>> events on partial probe failure, not just on remove()), unrelated to SoC
>> Tj reporting.
>>
>> On the -13 during suspend/resume: that looks like the SCI IRQ firing (or
>> its threaded handler still running) while the I2C SE resources are down
>> for suspend. Will dig into whether the IRQ needs to be quiesced/disabled
>> around suspend/resume here and follow up.
> 
> I hope I'm misjudging here, but if I'm going to talk to your agent
> instead of you, this is pointless..
> 
> Konrad

I do use tools to help format and reword replies faster, but the inputs
and technical decisions here are all mine.

-- 
Best Regards,
Anvesh

