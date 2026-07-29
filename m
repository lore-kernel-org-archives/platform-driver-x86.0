Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0971449B1E
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 11:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785323310; cv=none; b=CeEiMN30Vmwiy1aLrQtymdALmkpSM+ds0so2M1i4Gklso57riZjSrjFqetqjgIKK9BMdmc+x5QT6BkCKXdRYL5UOaGgkMAwXEvKCmO9GcHLbpVumi2dCOOHNwrirg/aPJuAsAFgkwq5IJB4C2ij9lp8jLGj90KcnihuTdXx1QoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785323310; c=relaxed/simple;
	bh=jwLSnPHPhs07q4yGQ1uUTlOrqbgHeEvkeKKGcscaaMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b1Nuoi+FWBzUw3mIq9u2K8ytIpybT/sIGmFl+p+5xx7XV5TxxwWj5/t3yXf4qlx/9BKXT1OrQd6xYtvNmhuvA49QmNKVWFRsufeWJG5/wjhi/luB+jU0xXllTpe+UzxIC1fKECxJixvOfxMAK1gZUZPmbiMn80oQ5ziSLdl+Jfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kbj5Ei3i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LiKT8cLN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kbj5Ei3i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LiKT8cLN"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TB730U1867013
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 11:08:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XsF4AYt0q/thRJpzFo1gQ/Z6B82oRkzfDmlpGkTlKmU=; b=kbj5Ei3inFRzMxsv
	ITEqZztJFJGgTDGcNM1ZBGcs5aJLLiHEQKVT9tfGb2k/sOooGPeB3Jyq6Sf+9dPz
	wAf8R98ICewKDbEKG9Xtiinmzy1pfLKsq2dro1Cs92tfUC+rIN1yteIReVeYWafJ
	O5eet2M+ruFj1Zqsa8GwqHeeIMcIx3d8Rkpth9JWytASoOb/V4Wsx2WWW6tKB1Wh
	AHUBAjmLx6i/I2eP+nqf8impZnzOVDxTLW1TPzN9BqqKPwmvfoVdtdOojQseVdS8
	8xKKHGDtAioQK1WO+J8Cqml20i0sZdc8O+YddVRR+5XQ4pftz8RvuimWxR1u8vuw
	lgNy4w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbmxsaxx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 11:08:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c9e97b626so1660151cf.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 04:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785323307; x=1785928107; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XsF4AYt0q/thRJpzFo1gQ/Z6B82oRkzfDmlpGkTlKmU=;
        b=LiKT8cLNtcgY7kLq1/BFaibLbw91e0E1tifDofoNSx6yPv+pkOofAQDFNuaJ9UE3Tq
         0z9xJrteZtzlbqcASvdQLmcFmZMzL5/NcLHUITJiu9xsBmHPhRufbZA3mP/NOnPE1fQH
         XRWgyPpcRqsLp0l1veB0vPduIB0FMdtqQzgWoJkkSDlgDlAKB1prw7qY8YqMtg99P4Oc
         z5XQPcfb/oBHm7B+5GW1kBmaN9cUSBpuHrTkR9I4jMCD7AbqnLdRqWDc0sT3BjcAdJ5h
         XsUcQounn1DwmHbF6XOe5JUQe+6qm/zXYxTopNoTbJTwE5L6xHYCHwBOuaV0NUnPyosz
         obhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785323307; x=1785928107;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XsF4AYt0q/thRJpzFo1gQ/Z6B82oRkzfDmlpGkTlKmU=;
        b=mdGTg/0BoILYhAd/eGY+WeZpZgoezyZs3Z+MLZT3201rGRobb+zkW66j3CeD2ZTkYa
         b8RhwVYuz0HnBE7f0zVCkaYO9XqCl8EnST3LSLLtLLJ79Mmt4JUibk9GlqX2swP7+/VZ
         x8Bmd6To5mYcsUWUsHNvlhO3eS3xE4FXx8ZHtdOHdhOu2nm1N/DttHbSxWgopBFIRjsC
         EdVIA0X03CU8lT+UBFSR4BlWP3G82gmuWbbrOMfO0FjDQscZLMQ7fyex45dy3u+RW0aC
         yn7Yo0JMQhEd0wktm5+Ni1wz9Rs35TYTqFLNnuF+QhMNxGkRl8t8VYMejwrgbkRIx63a
         bcXw==
X-Forwarded-Encrypted: i=1; AHgh+RoWV0IE/B8eLuC4leN0dwPfaKnfpjJNEJ5tKBy1b9G1VVnlOAqSbjP/Wy+I9IKzOmzYmLluAATIPcpSXrxMcW1qE3fc@vger.kernel.org
X-Gm-Message-State: AOJu0YwHs/2sD9zBhzOvW2zOq4P1iAlJYfj0+RPpp1uAFswWQdKB9KEx
	4DoMXJOS+KT3Vr5mGLEPpkf/TUg9+G4hZb+rfriePoUHcwUScF2hfouCa71bY8ykurH343SIKK8
	OU0+87Vg3a/p6oj85RkDBchR/J8nqTVUscf4GjqYukeoL2wyPNgU4Jf4F7By8Rc+7K3avp4xejM
	O1
X-Gm-Gg: AR+sD10WZWW1DC6dKJrhnXdRXXp1Bs4D+NxU5cJRtDZ05694P2iWfPDNYtPJMEs7Fyo
	23j/CJ3MJWRq8HJ5q/M9HnwNmffQO2J/WK+O/hnlw39Rib6FWNjhQWy2gpJaFkNOy9UHK4rBP6F
	N7/kul0509x2fd/1uXCDCxF3XOtki5czH++73aU+664dVjjsngVvC+xU/bi58N8NEDY6l6pEQjE
	RBoyVumMlRFuc9NEg0ld0wdR+X9ZHBlMLCTo6hxm6V23jdC0sO4hYKBn/S2EkfBbb4nsvWN0WvQ
	ZWMDdV0ptcZToOMOgdOoC0VvZ1ZVbziYgww5c6VOHJQKuPo8WN+4gecAoXAAoPr+pFGNGjwrM9k
	7KhPM/sKlzzU9utzpk1v8Pf8E
X-Received: by 2002:a05:622a:1191:b0:51c:11b4:6b24 with SMTP id d75a77b69052e-529d6fb9320mr55113711cf.3.1785323307232;
        Wed, 29 Jul 2026 04:08:27 -0700 (PDT)
X-Received: by 2002:a05:622a:1191:b0:51c:11b4:6b24 with SMTP id d75a77b69052e-529d6fb9320mr55113161cf.3.1785323306692;
        Wed, 29 Jul 2026 04:08:26 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83f4e062sm99494066b.33.2026.07.29.04.08.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 04:08:25 -0700 (PDT)
Message-ID: <b451e31a-cc1d-4e0a-9686-c04ba33720e2@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 13:08:23 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] platform: arm64: qcom-hamoa-ec: Verify required I2C
 adapter functionality
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
 <20260728-ec_add_more_commands-v1-5-771abd65ee1a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260728-ec_add_more_commands-v1-5-771abd65ee1a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA5MiBTYWx0ZWRfXwZRyIlFYoxUI
 OhHGxaUWah7LLi15Wv/SDXkmEI5KgIHB2Kj3m2V+/CysWTg3t50Rll26j1bZi2TDiQcQ7teowA7
 nqsM0xWH19p2qtAJkCyuEKwalV5zLcaPDk1kzN+pwEQrDkuX6yp14TPjcmhzEcQFyFvp5XJ26VS
 eyeKWWKOhGqxHV8MVwx2ZJRF4vZ6hqPg0oZZRb6Ff3Vtfj04QFlXpcFIRLKtT/OsuAhMyRrXcbh
 kRqRA/zRaF7FMo648TQIkMZVZDk/F62ocE8ixlY9eFAqFUUqoVzdIiTpV84afNzjNhf/PihtPhb
 +6WxxHmRR+ZjtXOOLhgbMPEExr5PsN2OcYtfc2lgIiIEN1W0rqD5OUeBb6bVcvoui2xe5jHaX3a
 RCHhLDUB668GmptiwJQzP56YClWIjwbCfikM2qASJeoK1iXVFHJjUbugbNkltz3qeXZlcMDNQ9J
 BMtnMgLz2VtGbewKuiw==
X-Proofpoint-ORIG-GUID: H66nx3qzwbrqXsHrjd_v_wc6nRaiups_
X-Proofpoint-GUID: H66nx3qzwbrqXsHrjd_v_wc6nRaiups_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA5MiBTYWx0ZWRfXxO3mFvfcZT1s
 ap9m64N9LMPkYVvIQUUOuImDshD/UGs+/k05wUu2+MlTBYFSdyeiDtEZ1x9e5x/XndHeZK9voiX
 KkL3RqlS+3jIqvrI7g3y6YlmvnWS76o=
X-Authority-Analysis: v=2.4 cv=fLIJG5ae c=1 sm=1 tr=0 ts=6a69df2c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=CFGf0PpD_GUA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=8kbzDDFSmQlM37ls7SUA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290092

On 7/28/26 7:44 PM, Anvesh Jain P wrote:
> Check the underlying I2C adapter supports both the raw I2C transfers
> used by the fan RPM/LUT commands and the SMBus byte and block-write
> transfers used by the other EC commands, and fail probe early with a
> clear error if it doesn't.
> 
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  drivers/platform/arm64/qcom-hamoa-ec.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
> index d0c45d9970ee..a420a180a194 100644
> --- a/drivers/platform/arm64/qcom-hamoa-ec.c
> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
> @@ -1195,6 +1195,11 @@ static int qcom_ec_probe(struct i2c_client *client)
>  	unsigned int i;
>  	int ret;
>  
> +	if (!i2c_check_functionality(client->adapter,
> +				     I2C_FUNC_I2C | I2C_FUNC_SMBUS_BYTE_DATA |
> +				     I2C_FUNC_SMBUS_WRITE_I2C_BLOCK))
> +		return -EOPNOTSUPP;

return dev_err_probe(dev, -EOPNOTSUPP, "I2C adapter missing required functionality\n")

Konrad
