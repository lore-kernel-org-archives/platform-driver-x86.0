Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6816521D3E2
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 09:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773653849; cv=none; b=g26iDzHbkDkUH8nYGR3PQmYvHyyaT3Nqtzv1QPuCKp4x0Ln4bfiLhlRhGW3/mlR8E7u6lfz8s140ZvH44bgV/DB1Z7scpvVl8TqqhlAgatElWP4k936T3TCOV+nL0wVGXvDZSJlHgs2H72Rq5NnmMylaXoupGlqZ6xAAohBSQbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773653849; c=relaxed/simple;
	bh=DbvCh94rpXDv7WluBYY0jPnaT6bK+G4/fSGmypdNLWA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OxDXCDIQ/F1KkbOSss1obj1VThTLjVGnHMxQh4cJPBQFGFPSj20KNStHnh3MJkRBwJ82FyTUzIa+Yt15eqEPG+GpcbK2OKm9D0vzkbHYO8Ae2tkepBbwg3Eet6TQD76AYAdcM07icwHPrA00KyK/4pfa9Im+aMn8wyj/MkQrCro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XXrGPEhd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VFF3PfS+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XXrGPEhd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VFF3PfS+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64cF12583313
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 09:37:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vL0QFFEBT4HCnrXbSuzaMv26nwLRIwkg7ItBWYHCTmw=; b=XXrGPEhdVCVgz8gy
	tBUuw4mAsye4Rzy8JRLsrKWQHrc/dOuqFBtj43aBPfI+oH2OpN8BR9cHcsAOXf27
	ghIcwGPyo3x6cLnmvGFFSBnXPx7VM5bE2ilYfu5uexAercdLZx9FJYua/b6I6tfq
	5TRhGz0W5GooLJYsA3wVewwaCatvZEI3yI4sRqAPf004cy8jCLnZw1DfXw2Nvksc
	hzwAJBgKUk2mxRtQdKmNt9FZUGRWpHNN/0PvD8uT0Foka0AtMi5bPLGk9Xo1VrVr
	QLJ1VppyRyJinhwo20w5Ied8dtp6swAKwWk0lXLNiGKLdMPgPSTDsmCQI4M2bAW2
	PR2LrA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0eccybr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 09:37:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b04911610fso19152075ad.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 02:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773653847; x=1774258647; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vL0QFFEBT4HCnrXbSuzaMv26nwLRIwkg7ItBWYHCTmw=;
        b=VFF3PfS+w2vKaBMA2coDKnxumgvN+m2r16tk19Ql9X8Yh5acpmTGhyRGH8aLXnDunn
         +QaTOHHQTNdxrGI5dRKr0XSzhj/vYI0wBoV/oC6tyArxdUc9brFE+B36XJHERmphu1kK
         cMSsXNCavTwJ2tNlw4AdPp89Yk5ITiDc1ZnmgS6xewUrNeaAmZwZKY76vdUSmrIX7zr7
         6fR1xh2hqb4bETokQrU76FPyzOkyth5Mua+7QBY/ePCGZM6vH+9NtMayAnwhQN4qIJUv
         LxKiQCL6ZH9QENkPYfTlpRqj8sf3VWJO570OWgfeRMUoKmoaqQulGY9fi/iu32qc8xUd
         GRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773653847; x=1774258647;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vL0QFFEBT4HCnrXbSuzaMv26nwLRIwkg7ItBWYHCTmw=;
        b=EvWyBQ4QHFYSkhlt2ZCfnPnGEwKcYXdsubNKWPCiECyLaCsKVvqlhL9kPiq7D2BFsy
         8RJQyqJgnYzeoN2yLKmDoAHmfUZlc9wF12GdKMh17YPoRzm53ZVxdYpL5vIfost0ERue
         8qW/zTOpF8LbnvePKu2n4/uEkv6WFlkZqBtPEW8Tsf8MqSU0BWB72uIg0hO4P//g4V+i
         5Vw5sdVjW/6W+CivnFXNpYNQG0VEeCCeYZSOpiTJscbEGXoTPNp227yH7ikOIGz+n5OK
         E1zVeKb5JMjrEGTNwspLijFnXk7vSeNHbl878Di2DwhDX2fFsQaEq6xV3newauyEp+Qc
         AoNA==
X-Forwarded-Encrypted: i=1; AJvYcCVuW2XKEI2UV6fyXcq3fgIPApMxKmiqvAQNgxUH2uhDnIXyzvm5B3b/Gwz4Tuizw1ukYyKx5mjkQaM3Z3KYUf7CbsMW@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2ZD4vOi21920HDksLsOUHVP1NR4pjOifztAQBt4NbgU9HgFuz
	LObPoi2ZEQd3SR+Tci2zQgWtSfm2np3b8yhXQ88pNBlTtM1xhzDVtKm0bJ61sFZCeCECxOa7CLU
	ZWsvKfCcsDOzKIksHoZxtAv2hGTiEe9A+02imiWyJO5+cYOqkGBjlEJaixrgXNaIJtUb5jzxGq7
	Bl
X-Gm-Gg: ATEYQzyHaSCka+N0YTLnhfmYudG23jJ/ojwcm2AlfsnZF8udf+WqR6UuIpwPCBqhE16
	AZanIHbntGNlCIl+BnLaz9XkXd22Y8tRvDzfDOrMXx82ngrktkM9WlR7ED8S+6wreBRbKJvU6ws
	+NcDv4q284wLmBeF5W0vytCJ2thlJsP8y5PXhD6z2plkwQZYKX7kW/7B//qM9yAuZWrRLYHM8u5
	7dfL/oqAgYq1G9od9tSfbtOncGgUUfmPMajTi6WLkLFHMzEx7GY40tEsT7/IxIT0IMwb8LQtF/+
	KZmt4wPUSQMPTsgwG1FmJexjbP2lejkpSOL2gS038K5HSp57Fwysr2VEnBNTWEFCNicEWlBYfnv
	/Rk9GzTgWfjVJW3POMcxy8eTIhO2lBQ6e2S6UlB1VHbSZU0EEgu78UlwEUBNaKn85tZDmDLqQJP
	civT5wchXtezUPSnpYcGc1qUoUX9UhHjGaxQ==
X-Received: by 2002:a17:903:3b8e:b0:2ae:3afc:eb42 with SMTP id d9443c01a7336-2aecab04a1dmr114987425ad.38.1773653847098;
        Mon, 16 Mar 2026 02:37:27 -0700 (PDT)
X-Received: by 2002:a17:903:3b8e:b0:2ae:3afc:eb42 with SMTP id d9443c01a7336-2aecab04a1dmr114987095ad.38.1773653846553;
        Mon, 16 Mar 2026 02:37:26 -0700 (PDT)
Received: from [10.79.197.144] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b05f0ab2b7sm15664115ad.39.2026.03.16.02.37.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 02:37:26 -0700 (PDT)
Message-ID: <e72263b2-fcd8-436b-b283-76a90ae0effd@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 15:07:20 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] dt-bindings: embedded-controller: Add EC bindings
 for Qualcomm reference devices
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
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>
References: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
 <20260313-v04-add-driver-for-ec-v4-1-ca9d0efd62aa@oss.qualcomm.com>
 <de539038-7e9d-488b-a6a6-45396247bf63@kernel.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <de539038-7e9d-488b-a6a6-45396247bf63@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Fr7AuWUFk_D1qUK3fhCy4R10AECR5mH8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3MyBTYWx0ZWRfX9SEigR9lqsiS
 ZaCzhpKsWzRNTcsTNmmKpC3vdvlPOn5/X3/OFUNRLqybrfSzsyeqSv41whFfI258PDmWHqp3QTy
 1EGfmdjKd9v0sqtaWz4QShHH43Mnv5H1rBnoVV2VQK8RBl5KARaX3a8EdgAqYqrVVyRW2H0X1ru
 e5Y7iHebVhhS675OGWByVTzZlaJyLe1W1aJcQ6nwWwEDV7bwgP/vWxmjHCPBXlWhCR2+rWeCXGk
 F6PMtf/iI5R8+pe0xYhbQqTA54wyuQ7Vn1LO4KMxp3slZL66BiJSKpaH9yPH/wbstUueFqL5snI
 kZUur8xaU1M1cZYeevjAnKmcqIHyXpkajtviy1NQYI51qWLwrsuN0u1flyt/JbpZ0ZC5kyLyjRb
 klRKYjpTSUirNofl4OdpYbisCPJzTrRqA99jqvIccwM23g7UjyKBYMDCM2AYdrnWGOaoedXNz8M
 r049qV6FRCt4JiIem4w==
X-Proofpoint-ORIG-GUID: Fr7AuWUFk_D1qUK3fhCy4R10AECR5mH8
X-Authority-Analysis: v=2.4 cv=BqqQAIX5 c=1 sm=1 tr=0 ts=69b7cf57 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=P-IC7800AAAA:8 a=gEfo2CItAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=yKxla6SPEuOvPVJYePEA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160073



On 3/14/2026 12:31 AM, Krzysztof Kozlowski wrote:
> On 13/03/2026 11:29, Anvesh Jain P wrote:
>> From: Maya Matuszczyk <maccraft123mc@gmail.com>
>>
>> Add bindings for the EC firmware running on Hamoa/Purwa and Glymur
>> reference devices.
>>
>> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> 
> A nit, subject: drop second/last, redundant "bindings for". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

Noted, will fix the subject in v5.

> 
>> ---
>>  .../embedded-controller/qcom,hamoa-ec.yaml         | 56 ++++++++++++++++++++++
>>  1 file changed, 56 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml
>> new file mode 100644
>> index 000000000000..baa95f06644a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml
>> @@ -0,0 +1,56 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/embedded-controller/qcom,hamoa-ec.yaml#
> 
> Filename must match compatible.
> 
> This is a standard review comment already documented in kernel and your
> internal guideline, no?
>

You're right. The filename qcom,hamoa-ec.yaml does not match the base
compatible qcom,hamoa-crd-ec. Will rename the file to
qcom,hamoa-crd-ec.yaml and update the $id accordingly in v5.

Thanks for the review!

-- 
Best Regards,
Anvesh

