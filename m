Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E7338F630
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 12:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778502403; cv=none; b=q5cjmNcaEo1+chpj0/Hepql79GSxuOsGcqMky6R7AXggRP2/J9YP6nR1Srasc50z+kg2UU8KqiIatTvMkS3ZfE+x64TQRLepv0UAalVpczgkVHIPFqrWFv7ekgzP98raXQzrk0P6DFE/AKdiSvdFPNvyO8CPuh9FhujgPpYNFcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778502403; c=relaxed/simple;
	bh=9qsLMKQvz1KlAOfBA/GqoUc9883e19KliNSG3Uq57nk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I5WaHj2JSaOK8xtIs/3cRCUhaHU6JAGZplz7ayehiL2HkH8nMZfkXVfyPQbMLYpWT5+Xs3G8nzaz3eOwyMybKBgoIzeS0fpI6ElLYMubtWQF3YABHS3zUsovGPb5rlwLdQ9vhgIJRETsm9Jad4Hm1dB0GyaaL7rCnMjHJmkYs9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LMqPvxHy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iCR1Ouyz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LMqPvxHy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iCR1Ouyz"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B9A92i017644
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 12:26:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UUp7pMKM4oCC7ZeQbB4lXBHSBYcVfDN9XJldmroooRw=; b=LMqPvxHysshjZ3vy
	RD0Y2BEdz2z7jn9j+WGioExiZvutFtsosQdNnpqH1xy5/RJfO6tSaUN5Sh+tF/Yh
	WSNaf4OKEVHYdXM7cr3erJBsCmFRlpgsI+SYx665YohRashI44fF2MAGo7YJb0wg
	0xNEIxYg1wU1a+JpWep9s2ejK/nR5fEb5gl9Q41/rx8lnYBXPrCUeFe78cUvm6qd
	1NQDGqB6GKOsZDKun4jJM1XxAFK9yod69kb7yYuBvfuGYgyE3oxMEbSiukdj5GgY
	qw9p1Ylfjc26ok24VRaafixMDfhsZp1kjVGrCe0WFb+bh9ryNzJja5355aWfwNJd
	6BHu0Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e37xfsp9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 12:26:40 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-366344513a3so7543560a91.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 05:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778502399; x=1779107199; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UUp7pMKM4oCC7ZeQbB4lXBHSBYcVfDN9XJldmroooRw=;
        b=iCR1OuyzvUI4DFOqmS578lhEOBDvm9yU5XnUlRUhOOt9Yoi5354g96A5k1KGP1NI+8
         g3A/Pejl9+M0A0Avn1PrWXqOqaRKd2NoFJ++f3ig1AWG98fowE6zrFKjd6rgzDtB4GWm
         UGtPU1cv84RaiDeGOnAbFWQRNOMlEfo1tbVXc5MFd5NS8999AKK767PIet7tTsnhAlFx
         e2TpUc2AruczaU0t9qe65BP2g0fhCQ3QvafkZB21l8QyKyfruVc0ayjr+4RHEwMfh4VP
         a6WkIqEdQ14yiOwSZtRZEYTP5+bmUFnqpGxcp6Ce/GHG+CYf2bYqYKQ6QEDfWTGYuA/f
         WCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778502399; x=1779107199;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UUp7pMKM4oCC7ZeQbB4lXBHSBYcVfDN9XJldmroooRw=;
        b=rj6YXfN2FKy755EWPNUzOxDLv/fqHU/jzhCGEm0KigBor+tppQ6pEPg+9BUCe2Nm16
         dLsCcphs0Iad80ZW/jsJ8yrUwiGmHjuFLiYb/sMe6Xikbs5YoIGsEawpBasitdChVoV6
         FzyXFvcOWA7J9mVnikRnkqJxPpfhkOFNF8mRUBoQqbw3KNIqGss3MAQwPpQ84+6Zdnff
         WOqBqNUU4eVO5HR8t54zdWVfj4dNsmBEWTxEbjSoU4Dp/PP6W0r2QXl/5CqhpeoYYU57
         uxy/ApGqfpfIeQq9Dc3l/B2mwvRGeYVKZTmhr6QkPUtOdPV8rNWsjKaUBZMW88GN56JT
         04Zg==
X-Forwarded-Encrypted: i=1; AFNElJ+epiarKMhaYHL2arZE2FjK+7i3tIRGppgYWSFZUgRLZwz14wwfmn0W2DeL5JzDF5mGCWN8TAG7LZU5T/vgGyjJVZAE@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5pAz+l+8drWUAb2wV7V5lBdaJJKrC/CvuO8u1IqPJYo8gi3Ay
	BR5QjhBdo0GRcSEEFGkL0KBTJkwkbQKSE7JPFJvaAppU+LMsR6riwDZsBbegSFxRKHRjeKXxwjV
	fi+7Tiu8aqBsrBVCxqCE7ZQ824shj8pstAg/l50yLc6vzMxrGvux7mWXy/EZ8QeRBbfZRSh/MJ8
	QX2ubIqKTS
X-Gm-Gg: Acq92OG0aBalHG7C+eirks4msYB/ba03TQDSHYtc0/PfEuvZq2QLj5GZwloj6NmrHEz
	cMvLwgcRfZD7W4L7GCCIUKyrCpDetdLCvOztZUdJKv0iWJVBjr/qvRjTBv1omTYzxRxak4Znt83
	FGtpwLvmbThT9GSIh+Z4eEQyMqAnE7xVfuXcDERx7WfYlgOBaovlRS79ewn/EOFZYZSTTRnAget
	Vt5IiEeJX30rMRuhmKviTPfkO9ebMWXy63hyiHbkxpkzylJRCNxtcIs56jJK2S7rv30T2Dtd/Wt
	xMDZ+MhZBs+5aTzeluRksCJML3E61iQeBn5bC4Domv6s4J50otHcHarHLy4E626NRTlDhTBYuez
	oPdhjJgXUdFyCGMU0nRRUdFoWbRMJIAx/SlAEwEzQaJMXIPoMWWgy4Ln3BlVmwgQyhSstvZpdif
	xbdTQyf9x1XttEuWCgzTO0eEmpfuG/rObz
X-Received: by 2002:a17:90b:3ecd:b0:366:1172:597e with SMTP id 98e67ed59e1d1-367d46b8236mr8976308a91.9.1778502398874;
        Mon, 11 May 2026 05:26:38 -0700 (PDT)
X-Received: by 2002:a17:90b:3ecd:b0:366:1172:597e with SMTP id 98e67ed59e1d1-367d46b8236mr8976248a91.9.1778502397593;
        Mon, 11 May 2026 05:26:37 -0700 (PDT)
Received: from [10.79.194.67] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d687bedesm9798710a91.16.2026.05.11.05.26.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 05:26:37 -0700 (PDT)
Message-ID: <798c90ec-9873-484a-a38d-be30581d3c43@oss.qualcomm.com>
Date: Mon, 11 May 2026 17:56:29 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/6] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap
 <rdunlap@infradead.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
References: <20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com>
 <20260427-add-driver-for-ec-v8-2-702f74e495f7@oss.qualcomm.com>
 <91523c61-bd03-2d96-823e-78ecd9e3798f@linux.intel.com>
 <17397c91-53e2-4786-b7c8-88c302821e22@oss.qualcomm.com>
 <88ce2f85-5d8f-9845-cdb8-77051989e57f@linux.intel.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <88ce2f85-5d8f-9845-cdb8-77051989e57f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TqXWQjXh c=1 sm=1 tr=0 ts=6a01cb00 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=HzHGujpu9rWnXTY9dJ0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: NYSngRa0-dLVd8yQy1x0AxbuOHcwqAjO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDEzOCBTYWx0ZWRfX+sYBbBgJx0in
 1d0qXudS2RF8t7VGDfEYutymxhxhkPegcvriwmAC20mfkUPiMCFDv3aw98zHluVYkLytVpUJmwG
 aIYNGc5SQyo0FoNXY6d5hNfozu7rfg6CwGcIDGMSg9It0Ukp9C65fO95a1bOLjzfsj4hCnQ/MSw
 Zi30UE2fZPYI6gDxd9vc8M7DR80SokB3QaYeXfX+V5/O2zc9SExCgFdrS3iR8zqlt/jNKT6g3GF
 YOZrkwYeUmlp5wm/oVHZgs1FGRTGBvDCDZXW7wfczTP4Kipu8rIjLz5R8OMBFZBl+gxxnI6foAP
 OEoEWFrZyESLuzUH9mh9zVRt2Dw+/dvemRuJmCkcc0CQIJdl4ASt0YABHg9KVY6pgWDcdxbUuvZ
 veGXkBVYN35tfi0vvndS6msHQ9bmEa5khYG+k11j5SGoJflkAWH+a3edu9NQlMqawz7fmurE7om
 UEQJMC/vbvowX0wV75g==
X-Proofpoint-ORIG-GUID: NYSngRa0-dLVd8yQy1x0AxbuOHcwqAjO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110138



On 5/11/2026 5:37 PM, Ilpo Järvinen wrote:
> On Mon, 11 May 2026, Anvesh Jain P wrote:
> 
>>
>>
>> On 5/8/2026 11:03 PM, Ilpo Järvinen wrote:
>>> On Mon, 27 Apr 2026, Anvesh Jain P wrote:
>>>
>>>> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>>>
>>>> Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
>>>> reference boards. It handles fan control, temperature sensors, access
>>>> to EC state changes and supports reporting suspend entry/exit to the
>>>> EC.
>>>
>>> Thanks, this seems mostly ready now. A few minor things still noted below.
>>>
>>
>> Hi Ilpo,
>>
>> Thanks for the review! Addressed all points below.
>>>> Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>>>> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>>>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>> Tested-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>>>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>>>> ---
>>>>  MAINTAINERS                            |   8 +
>>>>  drivers/platform/arm64/Kconfig         |  13 +
>>>>  drivers/platform/arm64/Makefile        |   1 +
>>>>  drivers/platform/arm64/qcom-hamoa-ec.c | 452 +++++++++++++++++++++++++++++++++
>>>>  4 files changed, 474 insertions(+)
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index 62b89d0013d2..0bf0d6d55550 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -21980,6 +21980,14 @@ F:	Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>>>>  F:	drivers/misc/fastrpc.c
>>>>  F:	include/uapi/misc/fastrpc.h
>>>>  
>>>> +QUALCOMM HAMOA EMBEDDED CONTROLLER DRIVER
>>>> +M:	Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>>>> +M:	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>>> +L:	linux-arm-msm@vger.kernel.org
>>>> +S:	Maintained
>>>> +F:	Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
>>>> +F:	drivers/platform/arm64/qcom-hamoa-ec.c
>>>> +
>>>>  QUALCOMM HEXAGON ARCHITECTURE
>>>>  M:	Brian Cain <brian.cain@oss.qualcomm.com>
>>>>  L:	linux-hexagon@vger.kernel.org
>>>> diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
>>>> index 10f905d7d6bf..e32e01b2a9bd 100644
>>>> --- a/drivers/platform/arm64/Kconfig
>>>> +++ b/drivers/platform/arm64/Kconfig
>>>> @@ -90,4 +90,17 @@ config EC_LENOVO_THINKPAD_T14S
>>>>  
>>>>  	  Say M or Y here to include this support.
>>>>  
>>>> +config EC_QCOM_HAMOA
>>>> +	tristate "Embedded Controller driver for Qualcomm Hamoa/Glymur reference devices"
>>>> +	depends on ARCH_QCOM || COMPILE_TEST
>>>> +	depends on I2C
>>>> +	depends on THERMAL || THERMAL=n
>>>> +	help
>>>> +	  Say M or Y here to enable the Embedded Controller driver for Qualcomm
>>>> +	  Snapdragon-based Hamoa/Glymur reference devices. The driver handles fan
>>>> +	  control, temperature sensors, access to EC state changes and supports
>>>> +	  reporting suspend entry/exit to the EC.
>>>> +
>>>> +	  This driver currently supports Hamoa/Purwa/Glymur reference devices.
>>>> +
>>>>  endif # ARM64_PLATFORM_DEVICES
>>>> diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Makefile
>>>> index 60c131cff6a1..7681be4a46e9 100644
>>>> --- a/drivers/platform/arm64/Makefile
>>>> +++ b/drivers/platform/arm64/Makefile
>>>> @@ -9,3 +9,4 @@ obj-$(CONFIG_EC_ACER_ASPIRE1)	+= acer-aspire1-ec.o
>>>>  obj-$(CONFIG_EC_HUAWEI_GAOKUN)	+= huawei-gaokun-ec.o
>>>>  obj-$(CONFIG_EC_LENOVO_YOGA_C630) += lenovo-yoga-c630.o
>>>>  obj-$(CONFIG_EC_LENOVO_THINKPAD_T14S) += lenovo-thinkpad-t14s.o
>>>> +obj-$(CONFIG_EC_QCOM_HAMOA) += qcom-hamoa-ec.o
>>>> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
>>>> new file mode 100644
>>>> index 000000000000..253f927c9aca
>>>> --- /dev/null
>>>> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
>>>> @@ -0,0 +1,452 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>> +/*
>>>> + * Copyright (c) 2024 Maya Matuszczyk <maccraft123mc@gmail.com>
>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>> + */
>>>> +
>>>> +#include <linux/bitfield.h>
>>>> +#include <linux/bits.h>
>>>> +#include <linux/device.h>
>>>> +#include <linux/dev_printk.h>
>>>> +#include <linux/err.h>
>>>> +#include <linux/i2c.h>
>>>> +#include <linux/interrupt.h>
>>>> +#include <linux/kernel.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/pm.h>
>>>> +#include <linux/slab.h>
>>>> +#include <linux/thermal.h>
>>>> +
>>>> +#define EC_SCI_EVT_READ_CMD	0x05
>>>> +#define EC_FW_VERSION_CMD	0x0e
>>>> +#define EC_MODERN_STANDBY_CMD	0x23
>>>> +#define EC_FAN_DBG_CONTROL_CMD	0x30
>>>> +#define EC_SCI_EVT_CONTROL_CMD	0x35
>>>> +#define EC_THERMAL_CAP_CMD	0x42
>>>> +
>>>> +#define EC_FW_VERSION_RESP_LEN	4
>>>> +#define EC_THERMAL_CAP_RESP_LEN	3
>>>> +#define EC_FAN_DEBUG_CMD_LEN	6
>>>> +#define EC_FAN_SPEED_DATA_SIZE	4
>>>> +
>>>> +#define EC_MODERN_STANDBY_ENTER	0x01
>>>> +#define EC_MODERN_STANDBY_EXIT	0x00
>>>> +
>>>> +#define EC_FAN_DEBUG_MODE_OFF   0
>>>> +#define EC_FAN_DEBUG_MODE_ON    BIT(0)
>>>> +#define EC_FAN_ON               BIT(1)
>>>> +#define EC_FAN_DEBUG_TYPE_PWM   BIT(2)
>>>> +#define EC_MAX_FAN_CNT		2
>>>> +#define EC_FAN_NAME_SIZE	20
>>>> +#define EC_FAN_MAX_PWM		255
>>>> +
>>>> +enum qcom_ec_sci_events {
>>>> +	EC_FAN1_STATUS_CHANGE_EVT = 0x30,
>>>> +	EC_FAN2_STATUS_CHANGE_EVT,
>>>> +	EC_FAN1_SPEED_CHANGE_EVT,
>>>> +	EC_FAN2_SPEED_CHANGE_EVT,
>>>> +	EC_NEW_LUT_SET_EVT,
>>>> +	EC_FAN_PROFILE_SWITCH_EVT,
>>>> +	EC_THERMISTOR_1_THRESHOLD_CROSS_EVT,
>>>> +	EC_THERMISTOR_2_THRESHOLD_CROSS_EVT,
>>>> +	EC_THERMISTOR_3_THRESHOLD_CROSS_EVT,
>>>> +	/* Reserved: 0x39 - 0x3c/0x3f */
>>>> +	EC_RECOVERED_FROM_RESET_EVT = 0x3d,
>>>> +};
>>>> +
>>>> +struct qcom_ec_version {
>>>> +	u8 main_version;
>>>> +	u8 sub_version;
>>>> +	u8 test_version;
>>>> +};
>>>> +
>>>> +struct qcom_ec_thermal_cap {
>>>> +#define EC_THERMAL_FAN_CNT(x)		(FIELD_GET(GENMASK(1, 0), (x)))
>>>> +#define EC_THERMAL_FAN_TYPE(x)		(FIELD_GET(GENMASK(4, 2), (x)))
>>>> +#define EC_THERMAL_THERMISTOR_MASK(x)	(FIELD_GET(GENMASK(7, 0), (x)))
>>>> +	u8 fan_cnt;
>>>> +	u8 fan_type;
>>>> +	u8 thermistor_mask;
>>>> +};
>>>> +
>>>> +struct qcom_ec_cooling_dev {
>>>> +	struct thermal_cooling_device *cdev;
>>>> +	struct device *parent_dev;
>>>> +	u8 fan_id;
>>>> +	u8 state;
>>>> +};
>>>> +
>>>> +struct qcom_ec {
>>>> +	struct qcom_ec_cooling_dev *ec_cdev;
>>>> +	struct qcom_ec_thermal_cap thermal_cap;
>>>> +	struct qcom_ec_version version;
>>>> +	struct i2c_client *client;
>>>> +};
>>>> +
>>>> +static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, u8 resp_len, u8 *resp)
>>>> +{
>>>> +	int ret;
>>>> +
>>>> +	ret = i2c_smbus_read_i2c_block_data(ec->client, cmd, resp_len, resp);
>>>> +
>>>> +	if (ret < 0)
>>>
>>> Call and its error handling belong together so please remove the empty line.
>>>
>>
>> Ack, will remove the blank line in the next revision.
>>
>>>> +		return ret;
>>>> +	else if (ret == 0 || ret == 0xff)
>>>> +		return -EOPNOTSUPP;
>>>> +
>>>> +	if (resp[0] >= resp_len)
>>>> +		return -EINVAL;
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +/*
>>>> + * EC Device Firmware Version:
>>>> + *
>>>> + * Read Response:
>>>> + * ----------------------------------------------------------------------
>>>> + * | Offset	| Name		| Description				|
>>>> + * ----------------------------------------------------------------------
>>>> + * | 0x00	| Byte count	| Number of bytes in response		|
>>>> + * |		|		| (excluding byte count)		|
>>>> + * ----------------------------------------------------------------------
>>>> + * | 0x01	| Test-version	| Test-version of EC firmware		|
>>>> + * ----------------------------------------------------------------------
>>>> + * | 0x02	| Sub-version	| Sub-version of EC firmware		|
>>>> + * ----------------------------------------------------------------------
>>>> + * | 0x03	| Main-version	| Main-version of EC firmware		|
>>>> + * ----------------------------------------------------------------------
>>>> + *
>>>> + */
>>>> +static int qcom_ec_read_fw_version(struct device *dev)
>>>> +{
>>>> +	struct i2c_client *client = to_i2c_client(dev);
>>>> +	struct qcom_ec *ec = i2c_get_clientdata(client);
>>>> +	struct qcom_ec_version *version = &ec->version;
>>>> +	u8 resp[EC_FW_VERSION_RESP_LEN];
>>>> +	int ret;
>>>> +
>>>> +	ret = qcom_ec_read(ec, EC_FW_VERSION_CMD, EC_FW_VERSION_RESP_LEN, resp);
>>>> +	if (ret < 0)
>>>> +		return ret;
>>>> +
>>>> +	version->main_version = resp[3];
>>>> +	version->sub_version = resp[2];
>>>> +	version->test_version = resp[1];
>>>> +
>>>> +	dev_dbg(dev, "EC Version %d.%d.%d\n",
>>>> +		version->main_version, version->sub_version, version->test_version);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +/*
>>>> + * EC Device Thermal Capabilities:
>>>> + *
>>>> + * Read Response:
>>>> + * ------------------------------------------------------------------------------
>>>> + * | Offset		| Name		| Description				|
>>>> + * ------------------------------------------------------------------------------
>>>> + * | 0x00		| Byte count	| Number of bytes in response		|
>>>> + * |			|		| (excluding byte count)		|
>>>> + * ------------------------------------------------------------------------------
>>>> + * | 0x02 (LSB)	| EC Thermal	| Bit 0-1: Number of fans		|
>>>> + * | 0x03		| Capabilities	| Bit 2-4: Type of fan			|
>>>> + * |			|		| Bit 5-6: Reserved			|
>>>> + * |			|		| Bit 7: Data Valid/Invalid		|
>>>> + * |			|		|	 (Valid - 1, Invalid - 0)	|
>>>> + * |			|		| Bit 8-15: Thermistor 0 - 7 presence	|
>>>> + * |			|		|	    (1 present, 0 absent)	|
>>>> + * ------------------------------------------------------------------------------
>>>> + *
>>>> + */
>>>> +static int qcom_ec_thermal_capabilities(struct device *dev)
>>>> +{
>>>> +	struct i2c_client *client = to_i2c_client(dev);
>>>> +	struct qcom_ec *ec = i2c_get_clientdata(client);
>>>> +	struct qcom_ec_thermal_cap *cap = &ec->thermal_cap;
>>>> +	u8 resp[EC_THERMAL_CAP_RESP_LEN];
>>>> +	int ret;
>>>> +
>>>> +	ret = qcom_ec_read(ec, EC_THERMAL_CAP_CMD, EC_THERMAL_CAP_RESP_LEN, resp);
>>>> +	if (ret < 0)
>>>> +		return ret;
>>>> +
>>>> +	cap->fan_cnt = min(EC_MAX_FAN_CNT, EC_THERMAL_FAN_CNT(resp[1]));
>>>> +	cap->fan_type = EC_THERMAL_FAN_TYPE(resp[1]);
>>>> +	cap->thermistor_mask = EC_THERMAL_THERMISTOR_MASK(resp[2]);
>>>> +
>>>> +	dev_dbg(dev, "Fan count: %d Fan Type: %d Thermistor Mask: %x\n",
>>>> +		cap->fan_cnt, cap->fan_type, cap->thermistor_mask);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static irqreturn_t qcom_ec_irq(int irq, void *data)
>>>> +{
>>>> +	struct qcom_ec *ec = data;
>>>> +	struct device *dev = &ec->client->dev;
>>>> +	int val;
>>>> +
>>>> +	val = i2c_smbus_read_byte_data(ec->client, EC_SCI_EVT_READ_CMD);
>>>> +	if (val < 0) {
>>>> +		dev_err_ratelimited(dev, "Failed to read EC SCI Event: %d\n", val);
>>>> +		return IRQ_HANDLED;
>>>> +	}
>>>> +
>>>> +	switch (val) {
>>>> +	case EC_FAN1_STATUS_CHANGE_EVT:
>>>> +		dev_dbg_ratelimited(dev, "Fan1 status changed\n");
>>>> +		break;
>>>> +	case EC_FAN2_STATUS_CHANGE_EVT:
>>>> +		dev_dbg_ratelimited(dev, "Fan2 status changed\n");
>>>> +		break;
>>>> +	case EC_FAN1_SPEED_CHANGE_EVT:
>>>> +		dev_dbg_ratelimited(dev, "Fan1 speed crossed low/high trip point\n");
>>>> +		break;
>>>> +	case EC_FAN2_SPEED_CHANGE_EVT:
>>>> +		dev_dbg_ratelimited(dev, "Fan2 speed crossed low/high trip point\n");
>>>> +		break;
>>>> +	case EC_NEW_LUT_SET_EVT:
>>>> +		dev_dbg_ratelimited(dev, "New LUT set\n");
>>>> +		break;
>>>> +	case EC_FAN_PROFILE_SWITCH_EVT:
>>>> +		dev_dbg_ratelimited(dev, "FAN Profile switched\n");
>>>> +		break;
>>>> +	case EC_THERMISTOR_1_THRESHOLD_CROSS_EVT:
>>>> +		dev_dbg_ratelimited(dev, "Thermistor 1 threshold crossed\n");
>>>> +		break;
>>>> +	case EC_THERMISTOR_2_THRESHOLD_CROSS_EVT:
>>>> +		dev_dbg_ratelimited(dev, "Thermistor 2 threshold crossed\n");
>>>> +		break;
>>>> +	case EC_THERMISTOR_3_THRESHOLD_CROSS_EVT:
>>>> +		dev_dbg_ratelimited(dev, "Thermistor 3 threshold crossed\n");
>>>> +		break;
>>>> +	case EC_RECOVERED_FROM_RESET_EVT:
>>>> +		dev_dbg_ratelimited(dev, "EC recovered from reset\n");
>>>> +		break;
>>>> +	default:
>>>> +		dev_notice_ratelimited(dev, "Unknown EC event: %d\n", val);
>>>> +		break;
>>>> +	}
>>>> +
>>>> +	return IRQ_HANDLED;
>>>> +}
>>>> +
>>>> +static int qcom_ec_sci_evt_control(struct device *dev, bool enable)
>>>> +{
>>>> +	struct i2c_client *client = to_i2c_client(dev);
>>>> +
>>>> +	return i2c_smbus_write_byte_data(client, EC_SCI_EVT_CONTROL_CMD, !!enable);
>>>
>>> This converts bool -> u8 using C's implicit conversion rules (plus on top 
>>> of that does unnecessary !!). Please write the conversion explicitly, you 
>>> can use ?: syntax for brevity.
>>>
>>
>> The original v4 code used `enable ? 1 : 0` explicitly, but Konrad Dybcio
>> suggested switching to `!!enable` during his review [1]. Happy to revert
>> to the explicit form if that's the preferred style — just want to flag
>> the conflict so everyone is aligned.
>>
>> [1]
>> https://lore.kernel.org/all/6eb3a173-c364-431f-93e4-7bbb7a32431e@oss.qualcomm.com/
> 
> I prefer to have the boolean to binary conversion done explicitly 
> (with the platform drivers maintainer hat on).
>

Understood, will update to `enable ? 1 : 0` in the next revision.

-- 
Best Regards,
Anvesh

