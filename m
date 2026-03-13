Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA226389453
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 17:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773422697; cv=none; b=rrB0cqOxIPzSuzZfgMWGO2V5YtsO1TfViI1MaijJ53sHWr6jPlALNf5AR0aIP8dv23eM5/XTzYg6fkhLG3iQNIvTTsvMWYMt1CZ47SOlsEdq2IMCTL4SpLVlM+9hKamcVb2oDtYRxe9xRCMjdoK2KzlqRas9na2S2t1wPt2kPZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773422697; c=relaxed/simple;
	bh=RYUtDu4/ksEGv2btHhMUsGqDiMCF5NNiK6mOhT67obA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TuI1FJ2bvpqTbTpxlOGixmUyeMnXdiMUComIpuQR2EtsghFGg5/xuEOb26iGlorkDblis3imXpXgmBKGwRoDPtspnKZh9AmC1ForwZxMAdIilH6VBxEoyOS8teyf+pjpvRjYoYb/H7qSwQoyTIbeL0fdl4li3OhC3iusw2xZ3po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PcnxHi78; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jyPOOsRk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PcnxHi78";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jyPOOsRk"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DAsFdu525821
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 17:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dgiFOIwoyS3Ji9sphkLmcFmfMQca4IMGuI+uQ4NwSYk=; b=PcnxHi78X2qZcKs5
	zimmNyty7xM9XtxC9lw3mmn0xUAiy4v+pQYpSTY2r0VMd/MljAIRFLz18DiJpLs2
	oeDNPoQ+POmYO0wk48tJ4k2kciJTcu0cXUxXlXISzKMxR+Cl8N7lxJD3wzCcAUMe
	eBhxJ0rF4SL1lEgZLpMuPJvs3doQJIRpeWcZy17lFSpj2Pw02pzomt2bmaV2nse8
	IMN2IwpF8d9JrA+lYv6OLZ12Ft5bCJxPC+AF6ZLYREJlZYTKp1mURtKLRU3X6ndv
	zyBHH06q0n12N3N+foD9zEWZPLgLMiVmvADg/tlxlrjFiBc3UqkhY1L+Y0vwCRg/
	6qpvXA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvh84saa5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 17:24:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aec805eec4so4117475ad.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 10:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773422694; x=1774027494; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dgiFOIwoyS3Ji9sphkLmcFmfMQca4IMGuI+uQ4NwSYk=;
        b=jyPOOsRk8WYckMrFzEy67hDPOTgb5LjKxUBgVORMNwRPd2xfVvr9hyJdrDUeiiwUb+
         XdAn/OB4ddrHUo+kGpwAGeC7pBv6SAO7NhRczlTrFrpheiaZq0f4cwXnfrsYKAbvjLhY
         bzAqdZBrIzRvovITLauj8fsbYTI7s3ToXmG3f2n/g24ecHzR6+JL78MKVNNVYgJKipw2
         lMfp3h2hf7FUXAmAVOybBLlzFbzciz+Dfi3GBFvupjJTAa3ff2BN7mQkaCr6+25ansvB
         YBDfRezVUMwUSruylz+K6h289TSEdCEb0vnt2g4c1msrM/Zib2iChdNUw5nTVB2st4Ob
         PH6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773422694; x=1774027494;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dgiFOIwoyS3Ji9sphkLmcFmfMQca4IMGuI+uQ4NwSYk=;
        b=IxT8TqGdZGPpAMcJjZcfHV8T09oXsRtTrh5FT5G6Xl6Sgj1jhvXrWK1Sfu4OtGv6YB
         rci/wVQiblzA/vnDFWie7Y7Xc5DnwY4YkflPdekphbR8e7nGf2erW5H6w2Ma0Uzqrh9u
         V/g479FtbQ2fbD+KZDHNjfg7j7NfEZpghGQksD7Y11nv0CTC7WRLstd8sqtHYnqcgt69
         /YrQ4ldvwdWMUwBrLeS0SH+bYQfO+vEpuILcJJDf6KRUDyNjyWENE2qmOCNL1bE1ejnA
         7m4NnyKA+uyAaQ0f1oyclXRNTEHJEEpuEu7YIrxKZ01RyHTvBxitx04i6HHE62lzUsHG
         FXIw==
X-Forwarded-Encrypted: i=1; AJvYcCVhOqUF9CxLosoLHBJL+idBTZsrovdQt1frTnDiYMh9HMJfyhQOxdfWpoyghyYdVuu9/fYog6GV6vp7Udt4g5rn9aFB@vger.kernel.org
X-Gm-Message-State: AOJu0YzHUBKjtDEstHUA9QQwwbNox+Qm2Yl2O9jsEIMzXSl9CRHVYv+y
	7wu507mace8pK+qbqhEqkJ+zcY9tX3PthAtDPX/P91pc0yegPG0gkGF1ivErRUmeKtSRTOuqHTU
	Sh5W/UZxFAHSb38SPOW6PQFUWIcpBLs4I1UI4AL+IgmS2qAaS5irZtwSHygq6QpL+CGPMEC3nyl
	Pf
X-Gm-Gg: ATEYQzy236yTIzEoPZMJYqWVdl4O+m+37ilUGUQ3fNEPhy+SaYMx3ceriXSKRRbrdrL
	q6gntTYMwacobHA8pBlBwjMckec6lzvPgsD0+dKXiv49y/2dclvbv4PDBTzjrmndv1Rb+ByOO4k
	d7+rsUrK+0U4TzsOXpmPNThncvDZ+A6sBI1oTEUOzfjMOf18+WMg/5QjPMS8SRxmwdKFM5ebSqQ
	x60PeU9hkpW/Kd1ahZODmyPLGv1mNyJXMvV5mVxhceHmyBa2gel3KBPCuUifN8zUiNFTpPJfTVm
	2SB3+chPzWDCDcxFM8E5hSz/0jVi/PiT4RFK1nIe6uaf8gQL2GqOIxRX1YHbfda3kPy1dm50qZj
	HKL++iU+JHj3I0sHsEcsEBQiwKMklOiJoRh4ZBDH69Gw=
X-Received: by 2002:a17:903:3b8e:b0:2ae:3afc:eb42 with SMTP id d9443c01a7336-2aecab04a1dmr37715375ad.38.1773422693611;
        Fri, 13 Mar 2026 10:24:53 -0700 (PDT)
X-Received: by 2002:a17:903:3b8e:b0:2ae:3afc:eb42 with SMTP id d9443c01a7336-2aecab04a1dmr37715155ad.38.1773422693145;
        Fri, 13 Mar 2026 10:24:53 -0700 (PDT)
Received: from [192.168.1.8] ([101.0.62.124])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece83d391sm35439165ad.79.2026.03.13.10.24.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 10:24:52 -0700 (PDT)
Message-ID: <a088d852-a813-4537-b20c-1dcc4d166597@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 22:54:47 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>
References: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
 <20260313-v04-add-driver-for-ec-v4-2-ca9d0efd62aa@oss.qualcomm.com>
 <44xgivai4jqlc7f5xxe6yohzrqicb2sgso465xuip66n5tatqt@6cu2u4erpe5j>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <44xgivai4jqlc7f5xxe6yohzrqicb2sgso465xuip66n5tatqt@6cu2u4erpe5j>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OMoqHCaB c=1 sm=1 tr=0 ts=69b44866 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=EhmMhbG5NVnfTD3xWHIiWQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VOWR3M7HpeV8rc-S3HoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEzOSBTYWx0ZWRfXw7djAT4zRDZ8
 J3qM6cckZQWsT8s6ibxOg+g5vxkWFKgwQ90arL2fvftx72rq/HygnXWHDURd7+MMzwl+PFkqfT6
 HDWCHrcIBLRTduOIzLuH6wDhoBXtFwpZuktdoba4H6b8Xb8KHM56VoEyxw1fp2+gd3nbaoPPY2f
 UV5lia4bx5IyAztLrCrEKWQ00S85HHg1TSY0PF8PgStDsK/Z+RGv5g4Jk6+N1GG8HlOy01AdIsp
 pD++IvPOoITpnco+z7kYkbAnY7mAraOaSanWJaUllG+BrSXH23IKUebnyJouT0ZaMkPGCIk5eNX
 WRiL0C3RozUk/nHPUqWyqHs5oNmHr9YCMa8dmJs3NauASgSqWLYiQaCoc+Ti1/87VXVNar1MZvx
 7SgDXDaXxAJihGX3UfVVVwedlf4Yq96KknDefhmciwHvzuijloqc8WKTEHbK2nav+ocfU3fh3sh
 YXJll6URUZSK1br9t3A==
X-Proofpoint-ORIG-GUID: OYugx-2oQGtWbmEI1516C7uTrZDEX7kt
X-Proofpoint-GUID: OYugx-2oQGtWbmEI1516C7uTrZDEX7kt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130139



On 3/13/2026 8:05 PM, Dmitry Baryshkov wrote:
> On Fri, Mar 13, 2026 at 03:59:52PM +0530, Anvesh Jain P wrote:
>> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>
>> Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
>> reference boards. It handles fan control, temperature sensors, access
>> to EC state changes and supports reporting suspend entry/exit to the
>> EC.
>>
>> Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
>>  MAINTAINERS                            |   8 +
>>  drivers/platform/arm64/Kconfig         |  12 +
>>  drivers/platform/arm64/Makefile        |   1 +
>>  drivers/platform/arm64/qcom-hamoa-ec.c | 468 +++++++++++++++++++++++++++++++++
>>  4 files changed, 489 insertions(+)
>>
>> --- /dev/null
>> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
>> @@ -0,0 +1,468 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2024 Maya Matuszczyk <maccraft123mc@gmail.com>
>> + * Copyright (c) 2026, Qualcomm Technologies, Inc. and/or its subsidiaries.
> 
> Drop the year from Qualcomm copyright, please.

Will fix in v5.

> 
>> + */
>> +
>> +#include <linux/bitfield.h>
>> +#include <linux/i2c.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/pm.h>
>> +#include <linux/thermal.h>
> 
> Please add <linux/slab.h> and <linux/interrupt.h>

Will add both headers in v5.

> 
> With that and with the typo fixed,

Thanks for the review!

> 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> 
> 

-- 
Best Regards,
Anvesh

