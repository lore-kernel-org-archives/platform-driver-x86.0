Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3A9456E0E
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 11:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785326079; cv=none; b=e2OlyJHIE86TN+kQYipdCvnBSsiWPHy00npmCR6YbM4DgFvzu3wYyBueScARv3JG0KOv2dBjM4hmjq6zxPi5CGsfiuhfTDja1TE3J7cjUyDA8st2IFHpBt4J0HzHXsesxzQZySA4LaKlCmxjFT2zchcbnJfOue/8CuopNGfs4Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785326079; c=relaxed/simple;
	bh=9a9so1CYH3stmaNiF2igDa4SDSwTPoO+r+0jxm4VP3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W7eHTPFynHBoOueLctMMbVvTVkfGvFzb6gsBBaD3N6IaCkqKmUgkzCGALypLFPm715xj9fX6nLyGf74inlMRkrGKFu0XdSYOPhbfEYqviyq+CAgui77FKuWYjLSHetbTHXbZp+PySCeVFo2sdZE0yViKTaylNx3sStO4xPBRAZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ggvTB0Q7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C0ENa+xE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ggvTB0Q7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C0ENa+xE"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TBXb0f1218274
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 11:54:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6FmIKkJTESuL46QyrIupTolyqTQ4VxA4jR8F/WmR/GU=; b=ggvTB0Q7NEWrk2/i
	ICsIYlqYDS8gh/tIp1vUJE4+a05LTveWQFwroV0Ub/EemjMxEOa5H2eQ913Z/frn
	ZavclWAelZhQsV+MHSjB7/6b2wqJp6x7ZJfkee7g6QSOFV9smG5rtWRm/GfjYhB9
	3pu3F+qhHSlD5yYvo7tmQoSLXMd2awV0/fm3vTXGh34v2FanMpYOLCocn0MNyPBv
	pOsSHuRHIsrF0JSyMS7ng5EWIHR9IB8AJqOlcwefh2uqyI30+4idgkIN/T3yeKwE
	imC4VP/xo2wbJYp6PIhfcXM77GFfnVuOFdr36xBtb0msn4+K/oYRpRVZKIWkMoeS
	L7T0/A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgrj02sj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 11:54:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc88e22f92so21755595ad.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 04:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785326077; x=1785930877; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6FmIKkJTESuL46QyrIupTolyqTQ4VxA4jR8F/WmR/GU=;
        b=C0ENa+xEBxWbcYhrfnxVrzeItm8BIlP7cblcHcreTGP693rE7Vs7L+HI0c9PDQrg4L
         hyybNsN0rm1uDmStD8x6BNcigDJctzkY/+FpFsFsUTkp4QOL+Gl+fFpFfhIWzfKb/m3j
         J158TsnljuLxopl5tktQztc4/n95EdjMQpLYUgLKoPA+tfGTq6p2nFTjUE5DkqjuPz/5
         0i0CautQ5WaJyGydE6zM0twBY60lIIWSpcZE3XR8HjiuI6FHeG27GwybBuXhuffr6Qvs
         2KNh1yF1Pmmcr3zDtosnsQawgML4kkG2/DpBumXPxWopt7KNsEGAK7W/sIlvkE9yBOfH
         VknA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785326077; x=1785930877;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6FmIKkJTESuL46QyrIupTolyqTQ4VxA4jR8F/WmR/GU=;
        b=tSX2EByJ8azAUmkpY14WBi2zyDF0/loamQ9GQhGmJ1wVQyxqXHzKfmQwetAjoQU4Rl
         uLqz3Nk3y+M1HWjvJDuOoJJgvN68UvwOo3MKPRF1AKdU7jXNWJBzEd7ZkA0NF/xjTpob
         ftvQeQ/kePA62C0W8D5jjuqD/BVjzeZYfYmkFv1baa+GsF3QBh0mD19xSWMKDDSoHR9g
         fHjAKHjatEstjJwycuDE+dGI3BW3O0ZS8lwNefZR6g55orqYLFLMKg7CYcWjrqoqHUbs
         M/mvNv90fh7ISGP7vuxIi+wm/W4V6r48yebW4xKyW6I4kpGG67IkEX7g+Kb51Gvi05EC
         Tr3w==
X-Forwarded-Encrypted: i=1; AHgh+RoVOyoEQFZZgLOCngle4TDLgzGuXyK6NVo7Fgj1ewFRKXfxTR/OJLvRLIGY4HScry2305mxv+60wT3rPhCjORoziOkd@vger.kernel.org
X-Gm-Message-State: AOJu0YyM8pHhMxQ3qIC++nziredcKcUWPXI8dE+QlDATcNpXcJ/Vu2Xb
	9MdGFUPLQvxazBSt118+euY0innOS1djULV9K5V+gMrVg+gN2uRja8hyaFQFjtxujBKyo7iObge
	RYTbC/ZXzKW8MlvgQsGI0l8gnHyVXW3Zdfwz++26wJnnDhyTEbUGH8QlBCTBw0/Dn1HIOtllFUB
	P5BnASplo6
X-Gm-Gg: AR+sD11Lw046VSPigSjurpadnyPLr4k6OMzdyBTipEtO7N3fwqSbcxddTEGRLcHXA3p
	e8KtUpPhhssoa1u7rmqYOUdwHHRkkdDI0pNutE4RQOUA+NlXJhTlyI5W7xtKpVxwWwzcO+Bx1dx
	PcKvz0RR4NttSW5Lc2rCYU1rP/ABt+gXc2PMiOOZoA3FykvOoQ8EnEm22W05HAOgThEKIYj6MmZ
	Yu8lVF7eq4ZeKi99J/SukKB3RiSJ0Wkbqw/5c5JXrfDSIYqwBLGHUYdLUf5RYWV+tfa09tPpbfg
	TeItYJanYGndIdv+mXPjIpXwkA3+wL3XjVnSEmHbi3BNG4JjkPFXkE4fqHW+J+txO2ASdRfTUSi
	kfgCv75hpxb/hiDLoMa0gv7HZg3BDcr00WITHNW1jMaG8DKmt7RF5T/gnBhYa2Q8GgG799jr8zz
	sFZGV/a9d1Ac/L
X-Received: by 2002:a17:903:2351:b0:2ce:ed59:7044 with SMTP id d9443c01a7336-2d015d4610bmr68523455ad.30.1785326076800;
        Wed, 29 Jul 2026 04:54:36 -0700 (PDT)
X-Received: by 2002:a17:903:2351:b0:2ce:ed59:7044 with SMTP id d9443c01a7336-2d015d4610bmr68523165ad.30.1785326076380;
        Wed, 29 Jul 2026 04:54:36 -0700 (PDT)
Received: from [10.149.71.180] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bc6d56sm10233465ad.49.2026.07.29.04.54.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 04:54:35 -0700 (PDT)
Message-ID: <d1af3fcb-f2cd-4e37-b1b1-d8caff984c84@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 17:24:30 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: embedded-controller: qcom,hamoa-crd-ec:
 Add qcom,tsens
To: Krzysztof Kozlowski <krzk@kernel.org>,
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
 <b7a45a38-008f-45e1-b138-91ca34704bde@kernel.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <b7a45a38-008f-45e1-b138-91ca34704bde@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RJOD2Yi+ c=1 sm=1 tr=0 ts=6a69e9fd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=5Skys0qmx9fMEjuPsKYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: bg9dXE2_j9wyRa8gTw0TwT5H2logaFha
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA5OCBTYWx0ZWRfX6qSWJml611Wv
 +ehsq3TZ85QD9+8OnkDNQj1WwChUxJMBHd0wa26AbLDPhpsLY1IlBldcq8lIzrMt+gzPK4F1Il+
 U0o8iYsCKzqjKsnwe0cYFnI26F2cb0C4wIkg8jA0sA0RE8YzuFBdoh7Qte8PoXgcIfKJbLusyU2
 AEmqfwb24EsQKsND7a+VCwRTiud5a/ze/MJvIPPmt4rRTku9U6dyqCdM9ERtkoJPkcFiVmXAXmp
 7Fe8dkBGUSBjUB+v3lr6x4jboPBisFI7V5nhxDXULAIvWj5ojSqo0D8pNq/fbphDkaJHaPhoikN
 2kAK/uJrKri0E5FqOESYU3IJ+Giexb0/OF6gWcSPx46xRuJAZsM+UtbpqJhrxMytXIpIZgeHLbW
 hmMDKQFXDWHkRhn1uumg6FLvUIh0OqqbwNFkK//jY4g93Z8FShr3491MgDTsAGdYW7K4UoPIYp6
 +o5VPaV7eZgEJf63/qg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA5OCBTYWx0ZWRfX4xlCdQoAMLrD
 ROGT7tJcQlT6Ldov0ug8jAsqqHs4Ei4R2EruyfVZM18G/KVNT+5HSncu+6aDkmFMX7MftdYhKJm
 nQUbr2july8MnzGZmFe3Dthr7xC/XcU=
X-Proofpoint-GUID: bg9dXE2_j9wyRa8gTw0TwT5H2logaFha
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290098



On 7/29/2026 4:38 PM, Krzysztof Kozlowski wrote:
> On 28/07/2026 19:44, Anvesh Jain P wrote:
>> Add the qcom,tsens property so Hamoa-based boards can list the tsens
>> providers, and how many leading sensor IDs on each, whose readings the
>> driver averages to compute the SoC junction temperature reported to
>> the EC for fan control.
>>
>> The generic thermal-sensors property has no standard semantic for
>> selecting a range of sensor IDs from a provider without enumerating
>> each one, so a vendor-specific phandle-array with an explicit sensor
>> count is used instead.
>>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
>>  .../embedded-controller/qcom,hamoa-crd-ec.yaml     | 31 ++++++++++++++++++++++
>>  1 file changed, 31 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
>> index c07483aa5937..ec809fcd03ab 100644
>> --- a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
>> +++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
>> @@ -33,11 +33,40 @@ properties:
>>    interrupts:
>>      maxItems: 1
>>  
>> +  # A generic "thermal-sensors" phandle only identifies individual sensor
>> +  # IDs, and thermal zones are a Linux-side grouping of those sensors, not
>> +  # a devicetree concept the EC cares about. What the driver actually needs
>> +  # is raw readings from a contiguous range of leading sensor IDs on each
>> +  # tsens provider, averaged together, so qcom,tsens pairs each provider
>> +  # phandle with a count instead of enumerating every sensor cell.
>> +  qcom,tsens:
> 
> 
> What is the point of having internal review and then IGNORE that review?
> 
> NAK
> 
> Best regards,
> Krzysztof

Krzysztof — for context: I did move to thermal-sensors after your
review, but Konrad separately suggested keeping just the provider
phandle instead of enumerating every sensor cell, since we only need a
leading range per provider. qcom,tsens was meant to combine both
suggestions, not ignore yours. Happy to instead just go with your
original suggestion and use plain thermal-sensors, enumerating each
sensor — let me know which you'd prefer.

-- 
Best Regards,
Anvesh

