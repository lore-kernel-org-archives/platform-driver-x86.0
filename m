Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC871E515
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 06:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785393433; cv=none; b=F58Gc/leQei3qGK6zi9xr41t3ym9Ov2/T6AlbGdKC9fUznF73Wtst1qgTtWgqr8kWOL8Orj0Slq+e5CUCZocVIzZI5J41eVMLb8gFLEPY0qRrElZS4OCEiazOzHfWa/+wjU8vsqjQ1WqlOHVebXopnySby3uD1VWaNIzXKy2dAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785393433; c=relaxed/simple;
	bh=143qVcfHrDUndtdM+/SnV2vC7F35FUc3Kc9bqs9KHT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kE2yL/bJGzIO0jB90PvG7/sGimAhg1an+U9JOT/MOVe/5QmQsu4/wbbviz28PVn+HfSo7mYtZqhDiZMHcpqYLEX9WeqbQ29OMH0uksowllgz6FVdiyAaI/nhzGYlGhL7jBmXx+iNfj4fS/cBRtyMySOL3P4xTxrpKa1cvCBxGoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TvszRTw2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EiswUGuR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TvszRTw2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EiswUGuR"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U6aTdQ4002705
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 06:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6/UOShqbHnV7Ke1cD00vlv35wu1bLj2I4lxM25OdUZA=; b=TvszRTw2kHk5SD7Y
	m+VGxf/yguCwWTSiZg9FVjbmDotbWjZhNkVEFe3fcYTTSXfJdHX3/xu3h4ad2XiI
	2/+yr4luMgp4VF7ak2Vf7iY+8VYLXrtnFBNZVkX6Mio7pwA8wE3aFDZn4CTEBfpR
	Oa4TsIFZ2ptSBS1cY0P/CpC5j++lZ88DjyxD2zatgrHbSC3GYlxkg601imFOyiMw
	Q9ss/7dDPgao5yigLKHGy8PAAoDSz4KVHSK9YR596OUoIRVx5wOVVtIoG3w+hWrn
	aqCC4IohOteltobyui0Djth6C1ELRZwEALlVCt5hsdQWOIpd1I7kkI74ba+i8+Fz
	OFFwcw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr17s82sp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 06:37:11 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e13b57b2cso2536553b3a.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 23:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785393430; x=1785998230; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6/UOShqbHnV7Ke1cD00vlv35wu1bLj2I4lxM25OdUZA=;
        b=EiswUGuRdyfj7K6MDuLf4wmn2uQXu0u5uARka1Q2Ag2IYZzH5L3f4OdJTXEQ3CN8Nz
         Ma+kaLH+i0fW4i5wc5N5WUjZlo8/LYX2CkEItKfheTYjgqeX2jz7Np5r6JDPXf0kl5Lr
         K5zrkG5JeYjfHVIPBNhAiqXNgrAShAQqaWTr0QgdoCAK/wTPbdSFvWIo/LQ9wOcEUWTd
         vyh4OkX9JzS6FUqFtUXhUjf97jJxyCDp2n/4X3QwlHc6OH6hgukcaZh4B2eTnDYlmyAb
         FWFvGIsQT1xYT3XMwu5y33v5vEgLiGz6qocFrq0CxaC//ouYFsjsl/lyUYhkyMeIDpwf
         WDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785393430; x=1785998230;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/UOShqbHnV7Ke1cD00vlv35wu1bLj2I4lxM25OdUZA=;
        b=ZgtoT2hhiJXbtfLBv1jaPf/H/al8iQnvcOPrsVZ0ofs4X/IDPjc1K7r8onfucKWKux
         ZnRB1la5Bh/sfI0NJYx/n6C8+x5T/7qg2o2El9KdL0ylKzKb/+fEAgpxGuQgOoYjuqPs
         JtrMOe16GRusP5PqfOUIlVUxc3+d8gI0g/TWn2CC8X5cRDTELesDcQ1U6VRcxJayXB8k
         wBCMkKiKLzrcdXixcNGw9Xh3Sl3+UHLz0gQ94sAeekiw8cdKS2ND0aGAt509Fca0A5v+
         KorVqDJ2op/F4p7qZD9QHkjr+vfnxTOIAQ4rdkXBefsAxQpZmRDP1cefQ3T4Z13ymMVC
         B6rA==
X-Forwarded-Encrypted: i=1; AHgh+Rrvd6LWb3aAoW9QYgOUqCr5agij41ILaUr4g2q8JKrENkD0anWihrW1uwE8b9VCynFf5M4TaOCs9fFg4FumwxRDZn9u@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlpc9q4ZYp8n4f9ucp8QNUByzieNyk5dPKRD3XdOfXgUcigZFG
	15sV9Olk8nGm1ouj5CkiU0glzNGe0SpwB2+dO24thZRVFHi0Qn/Oip2iwBj5BL21lMduwx1Cscg
	kgqIM++0gZS6ooOD9JVdxUF8ZTOLQIrxH+QWkIw/zTN/0c+SQG0vyF0Qssprs5YyLDXLR+bxsgo
	OG
X-Gm-Gg: AR+sD10TEtoRyZq6tz0cI6NXDLa1pGaldHD0RBR6nuwqDk/Hfw082QHtGrtbg8mm/yA
	SQaGYqEJcbhCxUbOWfq5IOtWHT5XWS2CSpKLPgx6KZ+Us6KSQnvp8DS/FXXHff3mflJG+a5nyvy
	3XuUZcsPDQrrNmhYNJMRuoFqC0vwC3wnR2537kSY5x6JTn/H9joynxI6YGPGVx8mUmW5+oMz8ms
	CLs/ecYcDm1mJIlWLkpcGVIauCh989ZFNyYFsq6FKtClA+sabIvZGuQrpYnJYtMJdyndAPDsm4t
	ZK2Epc4SRjUg1jFfWLzW+GPNINupe5Im8EncLSh5bK+ol0BAaxOSIdy2Y3Xro4xVf/N8UcQJaqy
	F+yAXFso0zNUxfCmk3Qds4MuExcyRyzzO8Xz4ftuAhXQNlDSaM2CJOe5SEx71ueWaX6IQjU7fhm
	BLxzSpKOq0lHrVEA==
X-Received: by 2002:aa7:88c9:0:b0:848:2f73:9002 with SMTP id d2e1a72fcca58-84ebc4247cfmr1485946b3a.75.1785393430532;
        Wed, 29 Jul 2026 23:37:10 -0700 (PDT)
X-Received: by 2002:aa7:88c9:0:b0:848:2f73:9002 with SMTP id d2e1a72fcca58-84ebc4247cfmr1485930b3a.75.1785393430157;
        Wed, 29 Jul 2026 23:37:10 -0700 (PDT)
Received: from [10.190.200.192] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0373cd3sm2457635b3a.42.2026.07.29.23.37.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 23:37:09 -0700 (PDT)
Message-ID: <6f2fc314-9e39-4bf7-b1ce-b51dd564daf7@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 12:07:04 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] platform: arm64: qcom-hamoa-ec: Verify required I2C
 adapter functionality
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
 <20260728-ec_add_more_commands-v1-5-771abd65ee1a@oss.qualcomm.com>
 <b451e31a-cc1d-4e0a-9686-c04ba33720e2@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <b451e31a-cc1d-4e0a-9686-c04ba33720e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA0NSBTYWx0ZWRfX4ezEf7m+uS2a
 Mr9L3wjQrxKfcGWKfAWqLf6PNj/w+Fg+QlR+pwKVz3HEqNAdW881w2deDhwh5GW25B1yw61vrmE
 V3d8frYt1fiDvdy8rf0uWILUNYQ8mgCiwovDLT4UhNULwXx/0pIzpD8KZ8QAGamqaj5FgXyXZI7
 m4DLyBgPXnuPeRfYhbNdWaM8tX8cRHzgsjHeKt0Ua26bYLp0JATbBO7jBSJ06J7enRQMyqpQf9j
 avwkRY3zsiVPGa6XHGi4MAOOiQotn1o6TbQRuRkSPpgu7w2ScAcdZnCt4arEV+/ms80INLAeOin
 3eAUM4qJRCPvGXfnuNkBt2nKZDmXApif3Utt5R9QZYIpx6JU/yVgHoI7ZG/zixAyuQjUhY44cXx
 u8MPMEBqdYUxB9l/8rIudzKxMAWzpCdcneo/pAu/7ba/kUUj0n66OebISbYi/8Ggf5KKWqa4Q1g
 F0cHnz7LvdoVUpi7KIw==
X-Proofpoint-GUID: kjc4o4-vxLunnXyVoTEbBuoI989NbalP
X-Authority-Analysis: v=2.4 cv=M6x97Sws c=1 sm=1 tr=0 ts=6a6af117 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=CFGf0PpD_GUA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EJZTz2ZzxWxwHnGGTj8A:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA0NSBTYWx0ZWRfX8fCMnciXdd5H
 DQgWvMfHzEh5NgBDya0l+VtWQpUGYxCXjijiRhw1gr1RngROQO87ku3WD04iYR8obnlX6W5D0lE
 kKU2hQwc2LIyuc5wyH5gNG9zeKQVgzk=
X-Proofpoint-ORIG-GUID: kjc4o4-vxLunnXyVoTEbBuoI989NbalP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300045



On 7/29/2026 4:38 PM, Konrad Dybcio wrote:
>> +	if (!i2c_check_functionality(client->adapter,
>> +				     I2C_FUNC_I2C | I2C_FUNC_SMBUS_BYTE_DATA |
>> +				     I2C_FUNC_SMBUS_WRITE_I2C_BLOCK))
>> +		return -EOPNOTSUPP;
> return dev_err_probe(dev, -EOPNOTSUPP, "I2C adapter missing required functionality\n")

Ack, will switch to dev_err_probe() there so a probe failure due to
missing adapter functionality actually shows up in dmesg.

-- 
Best Regards,
Anvesh

