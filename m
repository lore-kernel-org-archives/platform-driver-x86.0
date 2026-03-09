Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4533921D5
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Mar 2026 11:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773056122; cv=none; b=iDCTpHdTIvOK3tbJOPoX2xKsht5oX3rWhu+h1Fhadp0fGH2Q/Nr6OzzSpQBVf4XeN9UQCbiLFBLk7UPiBB58eNMLu5L95iXGthMax180jdjfc/QJPZJy9uH7XpEgZ72UOvyd7QykrsbHjrVBbb1Ik8ZeRrY8yaF/QJDKsKpbN4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773056122; c=relaxed/simple;
	bh=IjKB0RY1F7a9g2zBFRyurkKPqU1OSnC1fFvV7yeNsx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jdJTyK7SF/anazef0MOwl9p8vo6Yl1T8fk57BKXKTfhehgIWoN9BDxtY94irRZlBj7Y8c77WUSj3YfqO2Z2vKXSgLT2Km5DmXMxGepcP7hiIEHIDAg51urDv/wkuS/WdibPsH+jCryQgWC5rltv/N5G5bFBvd7vJP2IVQaOK+iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jl8hfwlC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=geXjl7xS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jl8hfwlC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="geXjl7xS"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298E8Qp2129848
	for <platform-driver-x86@vger.kernel.org>; Mon, 9 Mar 2026 11:35:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G3+rstJ/ZdS7C8kBoFMmuPACxGCxopy6Lc4ZaIJW+ZY=; b=jl8hfwlCwYb8dApe
	yTiKjIcLS/poBp86vwfjLXe04EVGEb5ymRgl1pD0B5r7fOHGGtpnfApXh4cWBqGk
	nq2phhZkWCv9utPft0N6Nl9eo+kHwgMTaN1ANPuxlig4QUUmDq0S/xJtqzYO5C+9
	3Y10UkZmxstGGiJZx622xkoJ4LxTKDHNc3ssk0Tf3AdVOr8fhitSKVgtJWjdCdnK
	KMmi3w6rXLi8itMip9irWe/yeqIhLKyfxRnzA2AZhsci27Mlyu7F/o9+6zWj0OQo
	IoeRWjr2QfF7e0jkpAogumXvD/9k1wtuuwGitBlLMyQspsVz7UPWjP20RMi3uGLw
	a8nTFg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crda9d10r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 09 Mar 2026 11:35:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae50463c39so77046055ad.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Mar 2026 04:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773056120; x=1773660920; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G3+rstJ/ZdS7C8kBoFMmuPACxGCxopy6Lc4ZaIJW+ZY=;
        b=geXjl7xSvfxo4L4uw9hfxsxTqBU2W4OjtwmjMA/ZXvWTvA0pqtbRm1U49MqTI1Fxsx
         KZEoGv4YO5QEkrdpUHRcO+KYJWghl2pJvocjwuxVkHtDclQBRW/UafUjFtXt06k6p/io
         8CnsOq0aGCZRgSdv6ApJBfq07EMvOhfP7lWFnmGvVnB93x506mKa3JSzQ7sxDXZqu5c5
         z9QmaWumOCgnBLr9CmrZ+gcZ5i3k55MBTJg2Y7LfBdFJJi1lKMAByumyCuWmuY18jvrp
         j2GWp8zYaDHJRpDgShEIH0sUQx/tkoJYTFuugpf8DuKX4IT1s3YrXzxnMPGAL9UM4ZxQ
         7QJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773056120; x=1773660920;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G3+rstJ/ZdS7C8kBoFMmuPACxGCxopy6Lc4ZaIJW+ZY=;
        b=biaarzo0lysc3YWVGxuq7jCfDqtLlB02z6MGVLmP9qLpfGMg4ep/2PvQV3dskNHePq
         GsSF85OeDGoIEuxljyb4ZvUZuX8c+IxRoYOxJmrrYfNY1sjC+s/ceSJx2pDrJch0mqvS
         1xJAqgr8fc4EFkF6E9YPHsgOsGdb5709mP/YNemYEcxBAaQ9IPHM9QAe9YAeQU8+TZMy
         c2VM9bd8ke3dgixuz37y75PqAbp45oUtjQxhS65/MSc1co2wXwNtYF6OAhZucHiy9mkp
         9/MbXfPOguzV0cetyP1zsglXokR3oUDAzixIufJaKLe9qyihymRqZR/6vCZkChjwPlNa
         5F5w==
X-Forwarded-Encrypted: i=1; AJvYcCXo97xBe8XvULefBB2cX2WhjejDaTPlhweRxPgms5L26jPc3lUkPYwvyWcWbgL4MqS6rXc48+Sv5B2NyExR7NgzSUw0@vger.kernel.org
X-Gm-Message-State: AOJu0YyFkdN8gUM1YrgcPKph6/VBbpIQ5IXMkD7JiRHcUFmxyWNrhJq4
	5iA4fLQNlaz+JV6Ed/juciDdo9p8a3IgVAiNV94NgJ0/UWXL/fvMmWUsSQvPYAj0yVnQ16NsI6J
	GpwSdR5jfJXWWD78Y/g4QGEgfT/e0dWYjCJ1EvdMveSU84aRKA9Bh5IO7n8JOnZx+SyZ75Jv14y
	FV
X-Gm-Gg: ATEYQzwwIShajUTgqxScWYs86bDSb9vjKymcoxAahw58sw51RrV8eXexhmEzOki4uw+
	vmzQLqcAHx0WvDofgC2e+3l698uYVuS7ter6G7EbOJF5l+PwvB6N2TZIzT2suDOWoFEO6kEt6Mq
	Pyvgarg6+D3GywqN/Z+ilw/2dPq2QAZ8K3rfYont08xxKWL8khJZSLfy0R9QPxp+05GYN/4zdxk
	S3pziUm7NPdPokmqACDfQNnTVgUTtDGox7m54aG+p/yrylTo5gdNWPY9au4gdnwdLXjXWyRoWjj
	nghQsflACjC4Rnm2CYO/6DPyUxsPRbsAmXd+YwcqjA9lyLiQjeUHHt9DewzkiKoq/D7SoROvMVp
	SHlo7KYtVj8gfwiggW04dgYtXyQdDDivbwWvQ8vWG6EtPbYDBHMA70SZe3MPyFV0tnZqHl3j4SQ
	MCPE4cFMZebuGraUAHJCpGazJ0ouj3FGGYFtRNnMk=
X-Received: by 2002:a17:903:182:b0:2ae:4fb6:bb21 with SMTP id d9443c01a7336-2ae8242e961mr120563605ad.15.1773056119674;
        Mon, 09 Mar 2026 04:35:19 -0700 (PDT)
X-Received: by 2002:a17:903:182:b0:2ae:4fb6:bb21 with SMTP id d9443c01a7336-2ae8242e961mr120563325ad.15.1773056119026;
        Mon, 09 Mar 2026 04:35:19 -0700 (PDT)
Received: from [10.190.200.237] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840aefbdsm149900975ad.82.2026.03.09.04.35.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 04:35:18 -0700 (PDT)
Message-ID: <c6820604-d1a9-42dc-bcd7-821aeb1b09c7@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 17:05:13 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/5] dt-bindings: embedded-controller: Add EC bindings
 for Qualcomm reference devices
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, bryan.odonoghue@linaro.org,
        ilpo.jarvinen@linux.intel.com, hansg@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com>
 <20260308233646.2318676-2-sibi.sankar@oss.qualcomm.com>
 <20260309-amorphous-archetypal-impala-8a0e1d@quoll>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <20260309-amorphous-archetypal-impala-8a0e1d@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwNiBTYWx0ZWRfX0J09VdkrXIw7
 cwIWvbuJbXrWLsfoKR4punJ5wjTlN3WoMs1/FHOiOLRqUYaaiZhQSBPXd7Q21NbS/Oo1p0eN9Xw
 yC/LtscQlivvDCAlrw8pQ0+5q2/ngx9j/1buw20NXpd7lLPLzN92LEWuxycz+PxXwtwzQpSc3tY
 2FaXMojaET6ZUXtW4xHex6BmGv3sRmOEyeQ5dG2bUNsGIXDpYoUuobW6E1nL9v4snrfaXwPB1VY
 dlh+cJY0gRkEJgAGLsIUYUMNGSot3p21vRQGHYXiWoO/mWtjqgcV+6MPmXxiIlY5y5Tla/0W1bk
 nc/8uJ6U3dAZdR+o6JJU5AHduPoYcQM5FvcZ5gx/yRJfrYj9pqS/wRW7PC7kl3zSIIyuNLiXnsW
 IdhGJxPtvlbz+rjvZS/EvFu8yUmFAdxKMD57QGCa/s7aPjHuFnFyf1Hv5MK2w2VHIHFcFkqL3Sc
 UkbW2SjkZJUYRxRTlgA==
X-Proofpoint-ORIG-GUID: iwFgsINQ28__OroP9HUYCjC3kbFdhJ2z
X-Authority-Analysis: v=2.4 cv=QZtrf8bv c=1 sm=1 tr=0 ts=69aeb078 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=1qf01Qjrl_d0v0_Yp50A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: iwFgsINQ28__OroP9HUYCjC3kbFdhJ2z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090106


On 3/9/2026 12:53 PM, Krzysztof Kozlowski wrote:
> On Mon, Mar 09, 2026 at 05:06:42AM +0530, Sibi Sankar wrote:
>> From: Maya Matuszczyk <maccraft123mc@gmail.com>
>>
>> Add bindings for the EC firmware running on Hamoa/Purwa and Glymur
>> reference devices, which run on IT8987 and Nuvoton MCUs respectively.
>>
>> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> ---
>>   .../embedded-controller/qcom,hamoa-ec.yaml    | 52 +++++++++++++++++++
>>   1 file changed, 52 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml
>> new file mode 100644
>> index 000000000000..ea093b71d269
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml
>> @@ -0,0 +1,52 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/embedded-controller/qcom,hamoa-ec.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Hamoa Embedded Controller.
> Please implement the feedback from v2.

Ack, sorry missed it.

>
>> +
>> +maintainers:
>> +  - Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> +
>> +description:
>> +  Qualcomm Snapdragon based Hamoa/Purwa and Glymur reference devices have an
>> +  EC running on IT8987 and Nuvoton MCU chips respectively. The EC handles things
>> +  like fan control, temperature sensors, access to EC internal state changes.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - qcom,glymur-nuvoton-ec
> nuvoton is name of the company, so it's too generic to describe a
> component. It's like calling it "qcom,glymur-qcom-ec". How many EC do
> you have there?

Ack, will get this updated.

>> +          - qcom,hamoa-it8987-ec
> I don't understand this compatible. You already have hamoa.
>
>> +      - const: qcom,hamoa-ec
> So which EC is this?

Will update the compatibles when consensus is achieved
on patch 4 thread.

>
> Best regards,
> Krzysztof
>
