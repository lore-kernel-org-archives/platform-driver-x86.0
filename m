Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D40648A8B1
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Aug 2026 16:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787157289; cv=none; b=eGyGGij4tljZdCCTXr2c9P5YdVz0CzOoCtvbvDBdPcxHE+NQAt6mTu5UGkKk2QT/0tDSU5JPDsGlyWGSLX0pY0pU4s3XCgjloZRjJ4jNcA1VN/xJrmFij7nF9mkpttY+fSB740p+LsW6GuTQbZ3S58cmQ7WfUUPnizcCOA4+2Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787157289; c=relaxed/simple;
	bh=r0UdGZ6t8TSGFR4bNpVzGy/0hINZi61fPITnYokWDhQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nuzbl20ljCv3ElIQDKIW2ef9AyTkcThNj24bj6nQWyMEJpy3ySgzantBihPNIcvtthodbLzQOq3nyL6NCeq3uZRVTEtBSnzQz7mkTqfof6iovoeuCzW+3bPruMLADOuJkSYHjSEUAyTSqJf6olQANi43quBLHXXYsxC7aKyygus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ggs86ID4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RvCLAYVq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ggs86ID4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RvCLAYVq"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF2FZd190713
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Aug 2026 16:34:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TWy+ySCcYENBF17tSAyqwXm235v/+ZUFPPyXbMWLu7M=; b=Ggs86ID4PJGL30Mt
	5kAtEey/7yZ6K1iDxnmZ/aSZXGSwUtHsdT4M60K0s2HdsBfgLhC3yo/i/x5hg8qc
	Trd5tCrHJWjWf0cMJML7UDIYGShD7OxYRlhLQSWT1GJ6lo7J6+8R9FQ8sQmH6BQu
	jzjjIOMmLjhlsmUa+RUUcnTSbVEplJ1gkvStMMX8fDnD93TpQtx8N9jUdiiubGem
	4Y+s32OXS5cPCEFTAFGgKdYXeHampfR5aEJXc4iKxRi8OwVICstsHUipwKdLnHor
	NU3RfqPuUiAGiG/rBmF+Fb4EwjsqY0BpgcTZ+xFYh7HMLC1cZ/TOA9lyf34ahX5O
	4SB9ng==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5esc0gt5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Aug 2026 16:34:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930bd2bfc45so40149585a.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 Aug 2026 09:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787157286; x=1787762086; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TWy+ySCcYENBF17tSAyqwXm235v/+ZUFPPyXbMWLu7M=;
        b=RvCLAYVq32A7ZAaZyTAKdfepvFXjxe3YC1kXRM1D5wZf5CLSw8uAOaQQv5hA8hIM55
         pwUeySopAGUj0cb4n0/ok77M/c5FqKx3w7MHnkQFSYmFvvVnI69H+iGrd14oZ2DZ8/Iz
         E2jlNhbnT3AHXp0luuUq+rwFyfx7MSabukdU1mpbBBepBy+5WbmlpKd4MpUUpWhTdyp4
         nLKqeIGy6y+0ej6jJk1tieSypx3R8Iw1JF0Rkz8L5gzxlfUkW//kwGWsgLQDU1YsnsGF
         mObadlnr7dNRu8HUbDe4BkUW1MsgLL0FiZqyPRDZpwetT3guv9kpn7mJmfHgINPdzG7q
         UtXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787157286; x=1787762086;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TWy+ySCcYENBF17tSAyqwXm235v/+ZUFPPyXbMWLu7M=;
        b=WFoOibmVbPfyBhaZOALhpbLtjQU2fqKce/VazqUUsLzl7Nz8CDGByccL0ytVJzScxR
         llbkpBVPYaj23AP2aHkaO93mWZdkzjFeGmu13ij4P8kfUa0l7xZm04CVUjqKnZeRU5Ui
         RDLr7t9/+8lzVEKPUklXacnU+e0+O2Pc2JU2lU2wJkyFcrMvsEFfs2RCNhXjX2+mkwD8
         JEQcM85ygLsFgcVvJ5JZyDcLwlsAxdXZae2W8KxeUo/MBZGHid0BfVoJM8k0tVTTjcY/
         xBV2T+EYbfxI7l/FB7LxXcpdoOsQDGDBPYjd1xLyszoM9zSv9MFQSWxnSnS50M9opUL9
         6yiQ==
X-Forwarded-Encrypted: i=1; AHgh+RpA5dQFCzUCJ/ayrDS72VWzNn/Et3PoHHwcKzgcSbi1MH+t3AgMSriODb9a1I5Y0Ayhghfjg4Wzgdi/R4igkrgKo4fi@vger.kernel.org
X-Gm-Message-State: AOJu0YygyhVpxJg/L/H8TwIC5MxhDF3oIpWdF8bGlAZbQcTR42/zkqMc
	DiyIVAJjtE701/pgqM9omU1+VwPzI8tbpFiz3cV7cLza0YbeNqX/Z5muvaZoq9ME4GVwnaEZxAq
	WOJmA23BPmb6Uv405+9o25H/Nb8+Y05FvlKJ7rC9vSbum7a56q4yUiLk5RUfvniHm9mH7Xn01QA
	dN
X-Gm-Gg: AR+sD10ZyKnI0VA6/6OlXw5eZ9QAeoFahWogC38I3LYavHo/FvjacjqV9rKpiE4UBH6
	56XaHOEe2lGuKwq2BHCkMEaefLqOEPDgI/+bFaBYwebfUjZ+4mLpLH1WlMMP0qzYvovYbWUXiqO
	EeiIGzV0HdaQJNkFd1RXEjpAQl+W51+HNep/YHA/SOqcv3o3Hc579ot5pC2p2QulCryXIzZ54W9
	UJjvE6qrGsGPPR2axPxwctj3u4lqtfIBymb/xUba8dsSLjAoH2yHMGUO3j9z4h/mNfWnp83AtgM
	5xnO87kaTo9sMBb2ULCv9XuiF6ynDliR8dMSyQq+9r2Mqfo+hjkZ6iwyXFH15k8fSfCN7DizJfV
	s1HtE4n3x8J6Ujn2rGc6FLfQv
X-Received: by 2002:a05:620a:8802:b0:930:a08c:cf9c with SMTP id af79cd13be357-9371e6803f4mr414222985a.2.1787157285683;
        Wed, 19 Aug 2026 09:34:45 -0700 (PDT)
X-Received: by 2002:a05:620a:8802:b0:930:a08c:cf9c with SMTP id af79cd13be357-9371e6803f4mr414218485a.2.1787157285063;
        Wed, 19 Aug 2026 09:34:45 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c8e4482sm100845166b.1.2026.08.19.09.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 09:34:44 -0700 (PDT)
Message-ID: <bd3feb33-8669-4c5e-8969-b371bcf382f1@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:34:40 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] platform: arm64: qcom-hamoa-ec: Add fan RPM query and
 LUT calibration
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
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-4-771abd65ee1a@oss.qualcomm.com>
 <eb8731e2-6cc5-49d1-a746-3c81563094f0@oss.qualcomm.com>
 <96411e0c-f357-40d5-81f8-14523836280e@oss.qualcomm.com>
 <438eeded-2f5c-41f0-a021-b5476fb16cb7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <438eeded-2f5c-41f0-a021-b5476fb16cb7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: x5tmecDQuwsFCsH_GQaBtTh2e4NIvrEO
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEyOCBTYWx0ZWRfX9pKy3M0ayww6
 4D9TVEbMi207aNwTzF4b8S02jt1wAhDCY+7kkhwNciMvNFd2SqnobqP4zBgTUChqF+a2ItyX+f/
 N0ME+RfH3wUXdCCZCQ8bSrm5ScP7U8M=
X-Proofpoint-ORIG-GUID: x5tmecDQuwsFCsH_GQaBtTh2e4NIvrEO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEyOCBTYWx0ZWRfX6eMAFuvRSQh6
 /I331PTmOmzWyZqZLtk/IcZ4lLAecc9A+RghSabGnOMjKoIC9NFbVnZLvZATtCicfmgotE5Kt3/
 e7E+azxmTVTdnrTd9wmc2VvulF3DGPi+F3XguVvwYHJ75RU4QkTScy0wICTHlOWz8ypO4EeAf/6
 Yx8lDprIyc381/oEtPC25IOB9dJZWQAgcMePsUfsny0Pgjv8AtU7xyphn0m6OkvlKqPqRp3UlKu
 QeLYWPg5kpbl4Kfyg1yDd4zd8ohWxa2PSX7H46dtZ7tiEjWp8/R2eGnMltP9+THoqsXPYtmudpN
 tXErvT+MtcPJmH7uBuYGxCe17RrYQiNQ9gVZbSnWDwF4BFPagFO8dJJU5NqQa4V3aICa7KcEkYw
 1cKFNb3Hm95xWf6FpbArfJuVarAZBcX7sU52JGfteSN7anFovfxN6I7EnSZUf/2TwGLnMRVlKzy
 Fv+azYwb458sjwXyi3g==
X-Authority-Analysis: v=2.4 cv=b6uCJNGx c=1 sm=1 tr=0 ts=6a85db26 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=JpzDVA2CVgTy79lvUYkA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190128

On 8/19/26 7:13 AM, Anvesh Jain P wrote:
> 
> 
> On 7/30/2026 12:05 PM, Anvesh Jain P wrote:
>>
>>
>> On 7/29/2026 4:37 PM, Konrad Dybcio wrote:
>>> On 7/28/26 7:44 PM, Anvesh Jain P wrote:
>>>> Add the EC command definitions and handler functions for querying fan
>>>> RPM and programming per-fan LUTs (lookup tables mapping SoC
>>>> temperature to target RPM), and introduce a raw i2c_transfer()-based
>>>> transport for the two commands, since their variable-length,
>>>> sub-command-addressed payloads don't fit the smbus block-data model
>>>> used by the existing commands.
>>>>
>>>> Fan LUT geometry and temperature breakpoints vary by board, so encode
>>>> them in per-compatible qcom_ec_lut_config data selected via
>>>> device_get_match_data(). Add configs for the Hamoa CRD, Hamoa/Purwa
>>>> IOT EVK, and Glymur CRD ECs; IOT EVK boards share the Hamoa LUT
>>>> geometry but are bring-up platforms without a calibrated fan curve,
>>>> so skip_lut_set suppresses the LUT-set command on those boards.
>>>
>>> So are we expecting every single laptop/device that utilizes a
>>> compatible EC to require modifications to the driver here?
>>>
>>
>> Yes, currently a new board does need a driver-side compatible + LUT
>> config entry. Will check on the feasibility of moving the LUT
>> geometry/curve data into devicetree instead so new boards don't require
>> driver changes.

Adding a specific way to write the configuration to the driver vs
storing the entirety of configuration data in the driver are two very
separate issues

Konrad
