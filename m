Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0033F3B2D0D
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 06:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785393629; cv=none; b=ZTf81fr1RSjPyyVsBUX66K41iAfMAAr1sIKZI7BkUwELKEfYN1+MA/ENZJ6sBOT0kkGScvs1rlsNI31vef08in3V3SbZs/QaT+5EWLOzJFvWTxTinC8jm/mLDLKyGHFOC0+IBi1Nksp42Rk+aEDVfZm7yOtm5vAWDso9tny5Cfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785393629; c=relaxed/simple;
	bh=Y3x16PPIVyHj8Uh+iuCq3XKJqgFqpJFXRbLoKKVW1rI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tJZAeHrZsDTMqAWsKRx+2D8dzjDC4j4a9l8H0eOdBFjaLyLE2r73O8/toXTTZcDq5izxLYdgO0E4oADIxxF45H+VZMfRCOzJ3NwK1DDAWoDC48NRraswjeemAqmEqcXXOHSbO6bnAkLJAAZbUSMXLLRXI8wVTzMZtOQqwO9bOmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ts8aN9wO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e49R6bGn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ts8aN9wO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e49R6bGn"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U6awXe3729290
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 06:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	59EmuRUbgg9pAUe86V2NHMrtVqPRLri3llHo5p/HhR0=; b=Ts8aN9wO+0Hi3lpv
	WqRUQgeVeTXb1912+2DTImx7Xzjyyeqggj1mcyos7Yov0F/Dxlao/xKaIQYUVJOz
	MBkkcC/szBmAxFy6XnNe7zXEunOflzbfTUfpgtnGkNZdshPQYX98eKQQYAiS6Qrr
	r5eK6mWUv1yHyPXDOp4tll+7APlP/ZY8dvDAosgER8//fdc46QNDM+Qb1GHuexDH
	f17+7Gn4pHJ+UCd9LQouUWHY3qm05YsDi2WWHXtGy1quKbVja28EaUvtnzFE5wd9
	wjsH/04zKJ8EcPtAmyEdzZL3Gh1sK2GkJ0uCq70iM2J41ih6kQByQGXi2xl54k4G
	BofN+Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr19ag2yv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 06:40:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccd1958e8fso26644735ad.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 23:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785393626; x=1785998426; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=59EmuRUbgg9pAUe86V2NHMrtVqPRLri3llHo5p/HhR0=;
        b=e49R6bGnNlpQkITzIbXl0D02xty7T/5Gcuhy+q6ELXESbtvRLZuZpoav8DAB4AqVzV
         0SD2z2ljYWwOVTSWAwarpzjeeoSIrPF+4tNbLSEhe8/IUoO7rnq13VXmul8OpmGE+YwT
         G9VuyfMCH0UPea59zH+CfUc1uLykZ+VexctGU/Y4Ufffgq11XcbwwZQ2yTuHBhSdspj6
         Yo+eb5/Cck3CthM+tKvv6kv49E9uu8Wa2Apdu7UDPXTIm48vtP+m1nRA+vs1X7gbLF5V
         jc4sO5Qt86ZykLTDF+3VZbZBptpqLsXLgz6UJMyUNDkC1out5KoHnqAHMEMbGA6X6Xgo
         Fncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785393626; x=1785998426;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=59EmuRUbgg9pAUe86V2NHMrtVqPRLri3llHo5p/HhR0=;
        b=OVsyrW3wIdvXQXQaNpJ6QAEdkW5gghYdxilJm9pkl2fT4uQGDHJdFx2/+vC/5GD9pc
         yxL+rWzfd/6rdh9t5Gg5Bo/4juBImNOcJKoaiY6MqB4JCcKqFH08oWLnVdQn8BzJliO/
         yvE6Z8lcNgJfviPo76W4gx44sdYL59d9tMxQUkvIAFZkd9tebVRZEH7kyFfJh4Hygpp2
         xlU5ZlXDRMz+KDr5B8WpQAnpoZUQBrxHTRciIyOyZgG9nbteuhPAzW/KmmyAn1c0kaRJ
         Y/OO7hcXn/qb+yV+ImKZaY4uqeSGO3mZzHH7kJE/G5OPFwPtD3C/DbPGB6UDQaNX/clW
         cmYA==
X-Forwarded-Encrypted: i=1; AHgh+Rq64fWF4jNJZwDfAuEy+sOdPkOKqVc0By5PsnBZrpE6aCpykBHeRQLszTaHAd0zbZGPBARCZ7R7eDcG0Gnl0WLKKBl7@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7/IuvhBU8O8L1aLXbyzUtd0IL0ikpm7oIDLfrMJ0je3/1P9Bg
	43H/WuHfrUkzgxNBWlh+wZ1qqRP13g3cZofjTcK71B+itlth9G9ZZb4s17EF8OpFSVNbZgFMNpB
	nR4yKHP41K7oLiKdQkYgTJThDgHG8SPTfBJifBxN4X869H5oRKENZ8twr0MHem7BVWoDevzU9wd
	Z+
X-Gm-Gg: AR+sD10GhAmsK4eNgJkr1PnkG5V8JivRkgLpMRU0V7bZE5HBpOWTVkECe99gY3xba3Z
	abRwoef8reB9SCme984jXVNtc9Brk6oYEyaU+5ytn6irRmI31KpkMKH/lmBV7BaFUGnpwIirsMe
	maWJfufxnQ6rN2vfTrtAqzh5PTJFeHdMbWBYHenQV6N6M+LLR6DkXuiEojxE0UrtXZBGp60gqT9
	Gz73DeRKS6Xg8WHSwTOPXi5K7hYy3tctovdPUS9ly8zd0mZ5bg+tRCbXvchwu9s78l/QkCol0Ma
	cnwgdp8es7CFjK0l6kPkisiuhtYAFT/h7rKkDYCAMCU5iGtQGUOiYUy5kAFE6Dfr3/JVpaU25nS
	Kjhx2S0X/tzTTRgAsoJvCEQS9x+iTFxzcRz9rrHuNlfFRl8gPlCrQWLbLJM/6UyKQhQexiFagLU
	W41zohRuDwRCFM5g==
X-Received: by 2002:a17:903:2c10:b0:2ca:b4b9:4586 with SMTP id d9443c01a7336-2d035bdf320mr14389205ad.19.1785393626593;
        Wed, 29 Jul 2026 23:40:26 -0700 (PDT)
X-Received: by 2002:a17:903:2c10:b0:2ca:b4b9:4586 with SMTP id d9443c01a7336-2d035bdf320mr14389005ad.19.1785393626143;
        Wed, 29 Jul 2026 23:40:26 -0700 (PDT)
Received: from [10.190.200.192] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a45f1esm21550055ad.20.2026.07.29.23.40.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 23:40:25 -0700 (PDT)
Message-ID: <bc5b3299-7895-434b-b83d-2d28e450a484@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 12:10:20 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] platform: arm64: qcom-hamoa-ec: Retry I2C transfers
 on NACK
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
 <20260728-ec_add_more_commands-v1-6-771abd65ee1a@oss.qualcomm.com>
 <e3394d91-ddab-4983-92b5-714d5bd5220f@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <e3394d91-ddab-4983-92b5-714d5bd5220f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA0NSBTYWx0ZWRfX5JLsj60/3i3h
 4hKTRCPz8Xuc4LWJO9dbnMrUQK3+bytlEVF5OP1Jjm6u5Swj3BDRYSapHX/nEMOv+jxcKLKqkXS
 /kdx51BsWGGOq4EiEQZKqK4GeRrlEjU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA0NSBTYWx0ZWRfX9wzo+WItdZXq
 1FV3qvjsm+bK1TYZe3MhuOhOjdf2lvCRc6ssMz9Ght8gJ0r1ojydvLnGCnwghGRbEPe5I/m5nUc
 tWX0EQboedzXn6skLo8UTxnr8TtjRFllGuP/MyTRz68fgd8iTRN+qUSrgXwpTqYA2HMyrNQTw48
 zAFeBwNLzQrk9BVUmR3dB9sTcOJG3ryU5mSysXegZ3c7b2HVhQrAKcU1Xo66yYv1cH/blTqAm5l
 gxE9uHRd85/YB/Vs0BrsyoBzTnwaP/q5Ozxk6S+99AyRN6DtsthzSmTP5EUYU0H2Gn8XSK//ilV
 ydq0kZcC4d1axdY7/5sLOo0gU25id888woqx093igZLPEBPBlxa1uEinKBg3nZxErTySZwWbwiq
 jhfE3D62HT8vKIsOtAhpyOCa01Ml1vvl59RNj8NTe3N0geXlfHv1x+jO+D9raZZHBwAgPnIpcCA
 o1oW2CQxdFwhh7gm2fg==
X-Proofpoint-GUID: j8idaN8-hAw4SoT7hpgRI1aGYgNsVgBX
X-Proofpoint-ORIG-GUID: j8idaN8-hAw4SoT7hpgRI1aGYgNsVgBX
X-Authority-Analysis: v=2.4 cv=RPuD2Yi+ c=1 sm=1 tr=0 ts=6a6af1db cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=It6PG1r-qJMbqxhxAG0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300045



On 7/29/2026 4:41 PM, Konrad Dybcio wrote:
> On 7/28/26 7:44 PM, Anvesh Jain P wrote:
>> The EC firmware NACKs the bus instead of clock-stretching while it is
>> busy servicing internal work (e.g. right after boot, when it is also
>> emitting a burst of SCI events). A transfer issued in that window fails
>> with -ENXIO even though the EC is otherwise healthy.
>>
>> This isn't visible with the smbus-only command set used previously; it
>> surfaced while stress-testing the new fan LUT command on Hamoa, which
>> issues raw i2c_transfer() calls more aggressively and is thus more
>> likely to land in the NACK window right after boot or during an SCI
>> event burst.
>>
>> Retry qcom_ec_write() and qcom_ec_read() a bounded number of times with
>> a short delay when the EC NACKs the transfer, before giving up.
>>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
> [...]
> 
>>  enum qcom_ec_sci_events {
>>  	EC_FAN1_STATUS_CHANGE_EVT = 0x30,
>>  	EC_FAN2_STATUS_CHANGE_EVT,
>> @@ -233,11 +245,20 @@ static int qcom_ec_write(struct qcom_ec *ec, u8 cmd, const u8 *data, size_t len)
>>  	msg.buf[0] = cmd;
>>  	memcpy(&msg.buf[1], data, len);
>>  
>> -	ret = i2c_transfer(ec->client->adapter, &msg, 1);
>> +	for (int i = 0; i < EC_I2C_NACK_MAX_ATTEMPTS; i++) {
>> +		ret = i2c_transfer(ec->client->adapter, &msg, 1);
>> +		ret = ret == 1 ? 0 : (ret < 0 ? ret : -EIO);
> Please break this monster up. I know it already exists in-tree, but
> since you're moving it around, we might as well.

Agreed, will break that up into an explicit if/else instead of the
nested ternary in both qcom_ec_write() and qcom_ec_read().

-- 
Best Regards,
Anvesh

