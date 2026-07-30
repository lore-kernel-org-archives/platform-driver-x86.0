Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4FC431E73
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 17:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785431469; cv=none; b=OxqFrqgoZXVjdUa3paXl60kvTpfxb4TOR1bbmhRnLDqQoG2OW9ELzHXN6hMniKhRsfUM03d8/z50Dhhhfmz/BI+xBenEEKx2/JSsaDzIzCS3ckxKKu+kRwyy/TYAxWDpJqyXUmV4cConn7ZUKGcWc8/2v9OVp2gHn+cJ2HF9IkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785431469; c=relaxed/simple;
	bh=kPktCVfGSgaJPZ7kLJjrZO2ZEHofop+Fsrv/RsVNmrM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZtYRnLwQxMioGdHpVggE6TP4E3tdcnC+AyatQZBXO+n0dtCADNBBl5fWAPJpkD6IEHb431109UankDBC/DIB9QUahwjWrPmV/STru4bIvKgZXJdJdn9tNQSZSJJbBOaawuJ2Y9o7VEBwIEyHXvg4EB+Evfgcyd/4mMqA+7QpALU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MnXIfORp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OP/5Cn+M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MnXIfORp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OP/5Cn+M"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UGXXVU1571720
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 17:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3gPhQOOU18qroC0E1Q14tMzdx9r/lWFjKmTrH6UjN/Y=; b=MnXIfORpqIF5xwVt
	sBUspfTYuCpKLWMMASA8/zdHcMR+hOt6ePC2Hq//4eyVprs5jxvuozhfBewtnVpZ
	DFFingb9f2mYN5cpcyLQWG2SBUBLDqMpKWnOjcyI1tOnq1sF7fhBJ5s01A0NfzFW
	6GvmhagI8wLoNZY4G0uGJ/5SUMuCcpadnL4OdUXVCD2WFOkMC+6ODA321NPj6Ubi
	Z4kcdNB4/6CvN+AkEp8ws43CbMGzrs11mWskDv+VO3M3pMVJkuzRNQPVDyoet28W
	ol87zaHQEX8GypOsmDVUF+Ua0deaGg4R6CDgUQbq0Rh7Ah25zaZ1gPVLG8/P4/Fs
	toEKdw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr891gyfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 17:11:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52845bd815bso23141cf.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 10:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785431466; x=1786036266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3gPhQOOU18qroC0E1Q14tMzdx9r/lWFjKmTrH6UjN/Y=;
        b=OP/5Cn+M1FD4DgnXqwqc3E9r0eaGzf3j0pWMNeBp6lNNzWuXeyzPYxM9pCzu1uXYB3
         Oz1egTOIChQNBmLY/LoNEl3+/B+bn0IKavnEOAdkHnTHhB5gXxlRfwPlFabDsiMMlqK2
         Vk+Cs8F33skBuPcJalk5f4pS4ZuA0moBWSTKnq9C7hRa0TstSRaQrI+CnhCjD/VVXAaP
         skvkg95i7qAikpiIsw63eG8+K5ZsygiA4WOaeYEqkMyKHzKb1jSqo2F7CxbaiyKJ+3ZE
         L0RusUQQ1iUgkHR++oEbGRn1oFd6k7KWi3NknyxFlxMaQIS8YyFMvOIdtjn5Q+Ptskqq
         5TQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785431466; x=1786036266;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3gPhQOOU18qroC0E1Q14tMzdx9r/lWFjKmTrH6UjN/Y=;
        b=Zeg9sf8cQlM1pCfjymioLB+U3oi5J1lr92dQAWHRgdl0u2xdE+8TmPYrDa5pxQSocN
         Dv7LAo7bdPT1vEM8S+gV5So8Hsqscta70uSeAtjoflBsAj3te/E+BmPb/zFD2oNj7zSN
         PpMu0B27XTGyQdMxWNPvrpsdTwxcCHur8DC9uFyLwlUc5eQA/YUALYE1R9RiMuFyDyno
         YtXpbXTydKsYt6k2bH9H4SBaHbQeVgDRTmDdp2LhDmxGxjrjRXRBYdAC/shIaiqNoTGi
         SRYxiSHop1xbLNe32rAkNoZfDLyf1OgP9y9fY4p+/vNKvulLFIIjz1iU2lNhHhsYgWB0
         Y7ew==
X-Forwarded-Encrypted: i=1; AHgh+Rrp0oraBqLG4hFu0xWlk2mpq3aufXGF06Ei0RPE9dhDM6X9KlDskQFsc2Bh0Eel+/DFV1bKC5rz469Bz1+uRdKH9Zx5@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6TCVCzhT1jwoB23bHITHOW/zTCC87PFc4ro2ZZU5ncJXVC9qU
	bhTr4WBNZomjrDnIbG+4xCMHOmgJg6fg4ob3fxTFKvqaZLWJgpdGMtcLarRWJoMwAn9ScAbtQ6p
	T5OAQysmI/rKa3G4APiFU8pQ711llDYj4lvegTcNim5TJqefQ0XCpTDYICxG8RpxWJZeU4nCSqr
	4F
X-Gm-Gg: AR+sD118G0K645Y8AanZe2bLaVt2hrOAkJGRpET0eVnugdETpe1pceHN/ruFlKUsqKi
	XHOP8oWLnZdbw7ZjdSDB/Y0TAkHGt+spdAjDc+eHCp8QNxqbJ14p7MBq1buxAWbYOFmXGAAtw2f
	2+QwzG1CEYSMU7iPmh23n2/sRLpPSO8ywIeVPwnN4q5LBn7Vjk3qPtxJQ8v0LlnjJCXW44jqwgS
	AVgp9wtiJz+w/UkNkv4FrTcBFrnpvXs0iY03eAVYiV/hK7ohviG3GfVhSma9+wqE26YTF4q6lwg
	tL8GVTvnA6BDHdVwZYkGBInMZTpaQe3l4QfP5C0btpGkCXG2WW6qjJKjoNpfGFLpQyLtEZGebX7
	0xdUcpIbShQDXHjnnPdSGZxqV
X-Received: by 2002:a05:622a:4ca:b0:51c:2101:f0 with SMTP id d75a77b69052e-52b42b78208mr16495481cf.2.1785431465944;
        Thu, 30 Jul 2026 10:11:05 -0700 (PDT)
X-Received: by 2002:a05:622a:4ca:b0:51c:2101:f0 with SMTP id d75a77b69052e-52b42b78208mr16494481cf.2.1785431465176;
        Thu, 30 Jul 2026 10:11:05 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8b760f5sm90599766b.32.2026.07.30.10.11.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 10:11:04 -0700 (PDT)
Message-ID: <01a90313-8cab-4502-92ed-761834763f8b@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 19:11:01 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: embedded-controller: qcom,hamoa-crd-ec:
 Add qcom,tsens
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
 <20260728-ec_add_more_commands-v1-1-771abd65ee1a@oss.qualcomm.com>
 <a46f1394-f006-4a13-b251-e5e2a0494b89@oss.qualcomm.com>
 <f079642f-87c5-4b85-bba7-f4d25e2be2a4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f079642f-87c5-4b85-bba7-f4d25e2be2a4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyOCBTYWx0ZWRfXxbRygAvXWqXo
 WAwSf5O4Ilwqbd4IjDBsXfNdUYqh6eBStYcpKSZO/jllzuBkJUVd/RXoPO+abzl6R3Cc6/Rhdxq
 nAv5gYrceREu7/W3QeGNuOx8Fgmy46RjzojVel8Q2lIJMBnUqHhcNum7USX64icUXGXnbu76Aux
 stQ6EtoVUnMhAhtJ8RadWDMA5qyivn30Hp4qvhRgWQNAYxIpiDhXUVdC50PGmplYR6H+/j5gRs1
 UtZ6RHhCyrVjtcOaWU8K8yVSgDI8JIF5ZBY6R+AvXnVzM2KLV5b0dGSYV+KefAbymNj6DYtx2V+
 9B97PrNidQXX52LAnFm16bIHOVXtAd7C85bM2usTQ9N3J6m4IMHIrAHxkbfsUA9twod2gtRO7j/
 5A9ZpbM80v1ksQqiYYbcOISGYSz7lBQ+eWwl+1zwEkWmmDKhLvlMF0oKc2gUd6V84IxA9DnLEv8
 4ypNqEQArkKTyxGPfZw==
X-Proofpoint-ORIG-GUID: 5w98PtQ0dEt0_mAsgCANQ3oDI-deQx1G
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyOCBTYWx0ZWRfX4007LtOyj5q6
 Cr9+zxxjT7UHnyUxrr0krKM5S0wMZPDBwswZ+yAghVuATNMzYD2k95vV5jUZZUWeWJZG6FXW/N6
 seGNswKy1Q48Zbkmd1BvI/X75hE4FPI=
X-Authority-Analysis: v=2.4 cv=PdzPQChd c=1 sm=1 tr=0 ts=6a6b85aa cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=5TKC7vhQAi-i42DR7gYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 5w98PtQ0dEt0_mAsgCANQ3oDI-deQx1G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300128

On 7/29/26 2:13 PM, Anvesh Jain P wrote:
> 
> 
> On 7/29/2026 4:43 PM, Konrad Dybcio wrote:
>> On 7/28/26 7:44 PM, Anvesh Jain P wrote:
>>> Add the qcom,tsens property so Hamoa-based boards can list the tsens
>>> providers, and how many leading sensor IDs on each, whose readings the
>>> driver averages to compute the SoC junction temperature reported to
>>> the EC for fan control.

[...]

>>> +  qcom,tsens:
>>> +    description:
>>> +      List of tsens providers and, for each, the number of leading sensor
>>> +      IDs on that provider whose readings are averaged to compute the SoC
>>> +      junction temperature reported to the EC for fan control. Only
>>> +      applicable for Hamoa based devices.
>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>> +    minItems: 1
>>> +    maxItems: 2
>>> +    items:
>>> +      items:
>>> +        - description: phandle to a tsens thermal-sensor provider
>>> +        - description: number of leading sensor IDs on that provider to average
>>
>> Why don't we want to look at all of the TSENS sensors?
>>
>> Konrad
> 
> Each tsens provider has more physical sensors (16) than the count used
> here. The leading N we take exactly matches the number of sensors
> already wired to board thermal-zones for other purposes (CPU clusters,
> GPU, camera, etc.) on that provider — e.g. on hamoa, tsens2 has 11 such
> zones and tsens3 has 15, matching qcom,tsens = <&tsens2 11>, <&tsens3
> 15>;. The remaining sensor IDs aren't referenced by any thermal-zone on
> this platform, so there's no per-purpose reading to include in the SoC
> Tj average.

What you said is true

It also doesn't answer the question why that isn't the case

Konrad
