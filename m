Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93CD39AD33
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 17:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785431054; cv=none; b=TbBwMnNGeWk4ARPzTxH4NUggRGIFPKuWWmLzaScWfBNYFPMOZjjWEiIbjaAJzpauvNmUkcuPr6YLFgdy3rH9XF/5IR4TjL5gshbVXWXvm9lK3AIfp0PbbofNGPca5OeDjIMoRhV0HeqY8oXis5r8U+p/XpeXdiwXWAv5XCEcO6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785431054; c=relaxed/simple;
	bh=w4nxZ4t9jToYcjWqK3dqjw1l+neGGSxMyre0r+Uepz4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X7Rx02rLiwSPUqoSfMlyRQ4yxOg5NO1bJTd280w/SydxflwFvgF4h3TSFRUVRGza7t0V7pung8HAhfv3zEmzujulvKP5k/+v9WtjwrDSFhAQGaheO06JUK3DFhfDsQKhk2+uBtehN5riwBUQkdezylRTxgwC0RxYs8gIAheGhoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=embT7qVx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Izm6MvuV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="embT7qVx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Izm6MvuV"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UGXWlY1571705
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 17:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8B2kKIkcMVLNTNUWOdUDAECnFfDkCwpTqdo5KvTH4DE=; b=embT7qVxA+JC3jja
	dONZn/Nb8agNVXRh4qwaVMTGSurrtt2as4X2Brqyj4Pl1i9NLXAcEFBL1k4GRwp+
	OpKpY6iI0ftKGT8TiiQwNAYM9QCX7/8uE/+rlDuh4vXDDyUNQJ/PTHqbRs1m7CiJ
	Cokc0kn4ZX2m9wCPGhyd462HusLWs09h7Gh7RLUQM065gEFNJvRfUn/MdXNGYrMp
	HgDOAI2YLUsCWlVSdOnjMaI1Gk8S3oINTfl7/4sBwjSUwb+iY1RJjZLMEviUvqzj
	S5Ypb791oFu9oxoGWdfng4MC0m3yq6f+AlSdXhmvyE31SZHcbZmwtNCeZl5E1I6+
	7OMSdw==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr891gxcm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 17:04:12 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4a4e7805e95so18584b6e.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 10:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785431051; x=1786035851; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8B2kKIkcMVLNTNUWOdUDAECnFfDkCwpTqdo5KvTH4DE=;
        b=Izm6MvuVY6CxNndUBwVjipmQgscc8W1XQJyIuQ2szZ64SS7fBAWBgjO/UmGLdwVzk6
         VTUsed5skOpfb8vAOtLqOGxWTWdeaPq1f/R1AzIDEi+/anA5b4yBp5i0f3ttODizwOkh
         Q7IHomfl3rdmq4w+bOkC6JQ1u8qvPsc8JqpBrPRZ45NnwVSJerliFrxIpl2qCZor3Lfi
         q0IlloVmksLxlLMrXKB0wA5QkObVMdLZ3NQ/GbVdL95Zad6EayTLxWP9li+UHbwC58bU
         y5pSLhcyZDHDyr5oNcEH6J4iLtUBviLeE67p5HdXo6MKxtGFt1vCBFtYavTVhkw4/AX/
         VNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785431051; x=1786035851;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8B2kKIkcMVLNTNUWOdUDAECnFfDkCwpTqdo5KvTH4DE=;
        b=Ui9WA8rxpdBJqBLGZfuePJQZL9aY03AaBFhgSJtDkPozVSsxvs6pEfrsdi/EMmFvqs
         Br7JGTpYp9ZQ7blqNbmM15vetdf8Ny7XdQAtC9L1ZEu8h04PR6Tu4aAtZeoE71jhAuze
         UHAQT+3kiRzB4LYD3bY2O8ZyOm2TYCzvSF9mrkEhtgqQ0RfQT9+H9z7ztim/fKJinFTD
         yVePvhvT92oSx+uNo3xIuhRq5L7olUdXdOc2vqOwQoU4Q+89bWAfUhvlwhe4TfXn1D+d
         IZ9sX5HynP+5k595kj53W9vQn7D4o28Rtt3C1pLBGloIWmikgfZlNzkc087mjt4l32LO
         crPg==
X-Forwarded-Encrypted: i=1; AHgh+Rpii6TuBjDcgHahYm4+GfIBSbzE/UAgVogk+D/EkRBHBzim2h3crm6+Iz+NNZxqZ/wT7dSM6mAqByZMQPGRbkPSPZAt@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv816dAdO2MZcZDPZeNAEBMj8CzvCEHTR2HK1BjFyYSd1up/SL
	yTIv5Ex5ISt8HNOMV5h1l8tWY37av8qQO4tld7/m8yM6pwkFaOLAnehuHMd9fThOpKDMZzn8Peo
	jyYP+aRpN5ILZL8KaHRTm2eAShWyfciMz7jxMOcpbaJhAiQ7jwhVlpxI0hxk6w0y3uVSYhO6R5J
	yl
X-Gm-Gg: AR+sD10ztXLtNYWJjYtKCLAvvMVcmVwuQsgKSCn7sx2PAM63jQezdXw7ACe3Yhc+4xV
	M3xGeuHuQTGQr7ORRBd5KGXRkw8zDtPkkPQobH574/jsxgnURys1Dai1MegO7Jd86piDF2QAlr6
	ihGfEWiOae95Vt82j+DIUFwOQN7xkV1+OMKkqkiA0jfcelTqva3KumMviChsrIRdgIltFzoCW91
	ceJkXl9ji4lEv3CAg97tf+NrhhIUQidxIsZ/wG2hLI5gW++H72P52KQJi0J24EeZV7q3mgeUuFt
	iLVLj5oW2o/8fAWv6JxPe67rqem2ol6k+eALBaO97eNc/LpuzffvEh+YzFbYpUw8gG9sBUdseKl
	mp6/JRvvIZY+0dbDIkx0a+rG2
X-Received: by 2002:a05:6808:1797:b0:486:7a1b:5a9a with SMTP id 5614622812f47-4ad954171a3mr1176948b6e.2.1785431051310;
        Thu, 30 Jul 2026 10:04:11 -0700 (PDT)
X-Received: by 2002:a05:6808:1797:b0:486:7a1b:5a9a with SMTP id 5614622812f47-4ad954171a3mr1176871b6e.2.1785431050733;
        Thu, 30 Jul 2026 10:04:10 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa85dbe43sm93327666b.27.2026.07.30.10.04.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 10:04:09 -0700 (PDT)
Message-ID: <9d9eaae1-97e0-492f-954d-d683f089ef78@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 19:04:07 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] platform: arm64: qcom-hamoa-ec: Add SoC junction
 temperature reporting
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
 <20260728-ec_add_more_commands-v1-2-771abd65ee1a@oss.qualcomm.com>
 <94081897-2e6a-4c8f-bd95-1961ca843478@oss.qualcomm.com>
 <95133f63-c7fa-4c68-9db0-2123cf754f50@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <95133f63-c7fa-4c68-9db0-2123cf754f50@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyNyBTYWx0ZWRfXwy0ElGfsJ4+B
 1wJiV+cW/AETPQwRswYBclW0g11mywuHHWxB3pvtsIyXxwey7CcEuVeKQ2eBoRKE3wYaJwFVrI/
 XvfRqK9Kj+VOYUP9qQwVdJZ0jAb38sURzFeVmCa+1BK3rK2LZKDhsIfiOHN0RqbMHfw+1OD1Noz
 36Eb+f0T4+y8mLJgZILYs7axmnWWHNq6r3JD1LvPakXE06U7h8cPIrSq2BWI7I+NmoItAClTLm5
 MpD8GjngXAlWO529bq2ZL5TP9rpb4bU5GYMvvm3urfB9K1/XKcJ8veSRiPDj3fH+OZ/NeGmnwJh
 9+FipZdyvXT3mtPCuigWgDedgMzwT19MEu7sT4DLP2HrVMjronVxmWGLaja8E8PxkqxP+hNr/iJ
 n1xe3biHGiDn6vXX79N3us86W4OTet6E9TqAT8+H/Z5S9bFwtUDHZ8WeF24Q4dg9+N83vwU9oX5
 zssqdlUv9td6wt8YPqQ==
X-Proofpoint-ORIG-GUID: GKlBDbfcUGzPWnGvhEaqyZj5skZJc6r_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyNyBTYWx0ZWRfXxysyljLLsysu
 x81bc7PHL57WvT2WZNKC4HZR8lbhVA4P6fBK2eZKixbinm4qxjLMfWpAA0Ry3cHFBl2BBerZaI0
 MstgjojkU1IOL7eElCnuyGp3tvRHk7o=
X-Authority-Analysis: v=2.4 cv=PdzPQChd c=1 sm=1 tr=0 ts=6a6b840c cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=j8X-GRWtO0FzkeSpfNQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: GKlBDbfcUGzPWnGvhEaqyZj5skZJc6r_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300127

On 7/29/26 3:03 PM, Anvesh Jain P wrote:
> 
> 
> On 7/29/2026 4:29 PM, Konrad Dybcio wrote:
>> On 7/28/26 7:44 PM, Anvesh Jain P wrote:
>>> Add the EC command definitions and handler function for reporting the
>>> SoC junction temperature (Tj) to the EC.
>>>
>>> Discover the platform's thermal sensor to zone mapping via the
>>> qcom,tsens device tree property, average the junction temperatures
>>> across the mapped zones, and periodically report the result to the EC
>>> over SMBus using a delayed work item. Serialize this and the existing
>>> EC command sequences (firmware version read, thermal capability read,
>>> SCI event control, and the SCI IRQ handler) under a new io_lock mutex,
>>> since the delayed work item now runs concurrently with those paths.
>>>
>>> Re-arm the periodic report on resume and cancel it on suspend to avoid
>>> racing with the modern standby transition.
>>> ---

[...]

> Agreed, will split the devm_add_action_or_reset() conversion into its
> own commit — it's an independent correctness fix (also disables SCI
> events on partial probe failure, not just on remove()), unrelated to SoC
> Tj reporting.
> 
> On the -13 during suspend/resume: that looks like the SCI IRQ firing (or
> its threaded handler still running) while the I2C SE resources are down
> for suspend. Will dig into whether the IRQ needs to be quiesced/disabled
> around suspend/resume here and follow up.

I hope I'm misjudging here, but if I'm going to talk to your agent
instead of you, this is pointless..

Konrad
