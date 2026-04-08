Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9719035CB8B
	for <platform-driver-x86@vger.kernel.org>; Wed,  8 Apr 2026 06:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775628344; cv=none; b=PoYSx1oIm0t83v9nqNU88LdISdqUVDSeN3iEhFAdutTjAZWeOgGDS4khwL5PelhFgGl1AmnzPJVJ3slpjHTJwMfFifHvPbE4U5NF+8SX1KjZRsJQobmOxz7eb/daSokFbODEI1Qxnpw3iboA75/o+8d9qtquJvpvpOUvC9Cvr2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775628344; c=relaxed/simple;
	bh=c6N26IhPygukcAcEbbwCi5kxSzaFfkAPpzFHNLonrc4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=N0jlovYjyK6x3KCrzKB6ZbDk0oH3VNQwsT4CjBNN2tDpb7VgahqjrSvbWWPmbksJyB4hDeqCCIPzfnfJfpEbQBA7+mHJWxHplURKJsc7h1OSaseaOjx8mLxycjrhn/dYt2PQAPaBJthsxx/uPKcYKzTz5hs390UaUTGBV0cY7fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WtpHvwGN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kmeT7GcC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WtpHvwGN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kmeT7GcC"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63858xlU3362745
	for <platform-driver-x86@vger.kernel.org>; Wed, 8 Apr 2026 06:05:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1af8hSConZXJHNKgadMXHP8pYeo9HkkDLzcsI82+dMw=; b=WtpHvwGNYHHRhOdL
	k7g4khmayRNuNCuhQrBxwv/w+ecOjHITw1adu1pAhg7F5hBw+y31PoH6rDIBwJoM
	BOWt+Ph1jt/8+hO448hzpvOEuhUVg4ALBZ5nA1UPjXrWIq32GmyHHs2ZtO3ACFUn
	FOK7Cwt0BRMDeJ58jzDgxddJzzv5cTv7Tc47Kw1+4triQcHFkBRr4hg1IKUoICCj
	VQWDHKzNOQFkoGDnV/30BpM8OvUcc2e/bkIdHQM84VIQDFkja3Z/hi3+6QFkqsyM
	mHgLv+fzTLq2+nvLhx8m7UgM3V6yEBpiiD7rZwKt16kVnWGV+8eZmhrpXeGKpM+1
	SBJPZQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7tkhs6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 08 Apr 2026 06:05:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b241be0126so158784475ad.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Apr 2026 23:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775628341; x=1776233141; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1af8hSConZXJHNKgadMXHP8pYeo9HkkDLzcsI82+dMw=;
        b=kmeT7GcCNvigH7NyYokCqDYS7AFAbr8rS9mR7J/NrVH4HmT8MQL2hnW2Lzb08PmLQ9
         Pryhq0bQB47lDrLcAieffXaoW70Gmo9+bj02us/hpmZRFSOX/wdzNldOO50h1HpUDB0J
         yaDwXH0CvjsSeQqjBsTYj/eOm9R2IIAZ4qAfVGtUdYcEqlha12/ww1qyAYCAvbEZm+yt
         rAlYD4Geb3e3RQDpZiFihjX9NpaDm203+OpgX0jw4VTH4F/VmVnYfztn992Rb2kOato3
         01umlaPpcCDdSRlAlgy55Zpj2d/KZo5QlgMCzCiNLlRAYY/Z3XD/3lOiaoS32LT66AIw
         qHrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775628341; x=1776233141;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1af8hSConZXJHNKgadMXHP8pYeo9HkkDLzcsI82+dMw=;
        b=kni1v5Nd8Psn31I+dKvwALn4HB4fhRhsgCFFGmKSXPqJifWptMPttV/DOfFrY5lG81
         vQH8p0pf3TRfaijkrUYclg7JtThX+IlmvGNV7HN0Dt1+KvDUmHE/4IpFmsRK9ya8el89
         uVr8OeqM2wChGrWQESAy6+tLnCaiz+9PD2ByJrdphaPwffx8AEsjWxxjC6KJ4aW43vRF
         21A7iwAjgD0M7E8FyKTgvD2wfa9DD46cFDm7XYB6n//gJLNIlP0C8lpWX0A65qGnmj6Z
         XiOxT04nMzfeNGjRGJf9M9pXFSrrIxz9oHhgcvJNjeo+KWBz4Inm7Voh+0quRH88RBGL
         0oLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgQjryTmU8nhagRvqSINaJRrGDpSZ7GqvxubsOWqVQc5ahOpJB2iKNbH9yKQOuDtIbINVI211CL93pVt4I6DD1H5/M@vger.kernel.org
X-Gm-Message-State: AOJu0Yylfpnv7zH7bjtbbQROblZEOiKWmmB82fIz3wxVnKQroRyXTYgp
	UQ+GZjK7aUPnWup5IKC8SMCDOQbiQeQz1h76GDu4MJylA5vuX35W/LiyZIqmxQ9fAXPZiXDg7Fx
	zo1sNjaLj+Uw8uTrKbgfStYVluFWe6F7k4No7wUfYt4++JIIWWD7r1UW03c/rND1UGnIF3OyfJ9
	UU
X-Gm-Gg: AeBDievj0M2DKeuIfeBZfMWWb6d4m0gQssOCqPSzcwEURWD24Xn2d181Vfn/MF4Dvdu
	gWEifDR7uYV9mM0dlpsZtwJgJab/5D3TLpkpH0o9oW9dbrbC1adteg1j/Rvh6QNbIc1fXc7z2b1
	lBKdqRFxtsa0FwkgO/neC9Q/Gzq4wkzlP54yJNjGa+a4SbGIk0D4LuZtoNr52bMIKgT5c7t+e3v
	3dHawq/IDnfqVRC55a90h24LueQcK6irJcHVZ1kf2/R75hByscgqNhQV+hq5tEhS1Q3lHaHRmo+
	KUBlmVqBN9wSTc+4lKG3WimBMVuFyRu2lTRA+2AGLiDLO0DxYTlIvEbfmkTQxcpTnnGVYUHbNDw
	zQS+L2obE9GMGNzWnXQYZfBi/gZ7+FBi1VrAOZN0kLVpzHgREh2DqgLgQL0Fzp34TR5e4eeOzlO
	UVl4IPWIegtntZ/yrGd96VQJM+OxSjokklrg==
X-Received: by 2002:a17:903:a86:b0:2b0:ac1e:9720 with SMTP id d9443c01a7336-2b2817995b8mr193083025ad.23.1775628341158;
        Tue, 07 Apr 2026 23:05:41 -0700 (PDT)
X-Received: by 2002:a17:903:a86:b0:2b0:ac1e:9720 with SMTP id d9443c01a7336-2b2817995b8mr193082645ad.23.1775628340581;
        Tue, 07 Apr 2026 23:05:40 -0700 (PDT)
Received: from [10.79.196.164] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749c38adsm240381685ad.69.2026.04.07.23.05.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 23:05:40 -0700 (PDT)
Message-ID: <c256047d-cacf-4ef1-96bc-529b3158c60c@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 11:35:34 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260327-add-driver-for-ec-v7-0-7684c915e42c@oss.qualcomm.com>
 <20260327-add-driver-for-ec-v7-2-7684c915e42c@oss.qualcomm.com>
 <308ae40a-34f1-9b69-bfe7-150ca8ad1d29@linux.intel.com>
 <e35da42f-e43c-4810-9985-7f51a1f5dc0e@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e35da42f-e43c-4810-9985-7f51a1f5dc0e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=drPrzVg4 c=1 sm=1 tr=0 ts=69d5f035 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=-0q7uios7j49SWls-T0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: SWba5GGkfmTgo_F_HEtwFHjMmFRDb2hi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA1MyBTYWx0ZWRfX6VrlKAvESAZP
 6BTYVRhTJ+Bv/7FN6j/08ORPFouBFeY8sdYN/vDq2KSIelts/AKlj7q9u3iaEl6Kj87uxNrtRHo
 IEMTTHHulCvsjBkajq2+02o4QcDTbr5QyLqDu1ehbHn4l44Nz8g2WzBVSHlH39E3DMqkbGVU/G2
 CuFjWbVSDyGZI2zpgIpBzXPlOjpakNZepkMCOo1eHYAh0WJMGjBtxxBPasrK5Y2X1YlUCz+hj6O
 4YQkytswafjjcuyuu3YV1wR1r6lAUpqTp+hSa4k0yY8o5k6DqpiT6Ue3C4zZLCApJKak4ns6Epp
 7MPvf3gsQPUYNNUsUI3g/Y/BeMuNEM4wZ1mTh1K1Qlh/bZ6b0mkxo9FXsAfp6XS+T1cXmT5rlSX
 w8EqfjB990KoZci57y+Vk93qRXk8PC/kkjumjEC2JHdgvXrdIEftGLwK7kS6TwthKwHVczZWgJz
 ZzyCelMXB1pfiBohEJA==
X-Proofpoint-GUID: SWba5GGkfmTgo_F_HEtwFHjMmFRDb2hi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_02,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080053



On 3/30/2026 12:14 PM, Anvesh Jain P wrote:
> 
> 
> On 3/27/2026 5:20 PM, Ilpo Järvinen wrote:
>> On Fri, 27 Mar 2026, Anvesh Jain P wrote:
>>
>>> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>>
>>> Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
>>> reference boards. It handles fan control, temperature sensors, access
>>> to EC state changes and supports reporting suspend entry/exit to the
>>> EC.
>>>
>>> Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>>> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>>> ---
>>>  MAINTAINERS                            |   8 +
>>>  drivers/platform/arm64/Kconfig         |  12 +
>>>  drivers/platform/arm64/Makefile        |   1 +
>>>  drivers/platform/arm64/qcom-hamoa-ec.c | 451 +++++++++++++++++++++++++++++++++
>>>  4 files changed, 472 insertions(+)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 30ca84404976..536dfd9adff4 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -21804,6 +21804,14 @@ F:	Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>>>  F:	drivers/misc/fastrpc.c
>>>  F:	include/uapi/misc/fastrpc.h
>>>  
>>> +QUALCOMM HAMOA EMBEDDED CONTROLLER DRIVER
>>> +M:	Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>>> +M:	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>> +L:	linux-arm-msm@vger.kernel.org
>>> +S:	Maintained
>>> +F:	Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml
>>> +F:	drivers/platform/arm64/qcom-hamoa-ec.c
>>> +
>>>  QUALCOMM HEXAGON ARCHITECTURE
>>>  M:	Brian Cain <brian.cain@oss.qualcomm.com>
>>>  L:	linux-hexagon@vger.kernel.org
>>> diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
>>> index 10f905d7d6bf..025cdf091f9e 100644
>>> --- a/drivers/platform/arm64/Kconfig
>>> +++ b/drivers/platform/arm64/Kconfig
>>> @@ -90,4 +90,16 @@ config EC_LENOVO_THINKPAD_T14S
>>>  
>>>  	  Say M or Y here to include this support.
>>>  
>>> +config EC_QCOM_HAMOA
>>> +	tristate "Embedded Controller driver for Qualcomm Hamoa/Glymur reference devices"
>>> +	depends on ARCH_QCOM || COMPILE_TEST
>>> +	depends on I2C
>>> +	help
>>> +	  Say M or Y here to enable the Embedded Controller driver for Qualcomm
>>> +	  Snapdragon-based Hamoa/Glymur reference devices. The driver handles fan
>>> +	  control, temperature sensors, access to EC state changes and supports
>>> +	  reporting suspend entry/exit to the EC.
>>> +
>>> +	  This driver currently supports Hamoa/Purwa/Glymur reference devices.
>>> +
>>>  endif # ARM64_PLATFORM_DEVICES
>>> diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Makefile
>>> index 60c131cff6a1..7681be4a46e9 100644
>>> --- a/drivers/platform/arm64/Makefile
>>> +++ b/drivers/platform/arm64/Makefile
>>> @@ -9,3 +9,4 @@ obj-$(CONFIG_EC_ACER_ASPIRE1)	+= acer-aspire1-ec.o
>>>  obj-$(CONFIG_EC_HUAWEI_GAOKUN)	+= huawei-gaokun-ec.o
>>>  obj-$(CONFIG_EC_LENOVO_YOGA_C630) += lenovo-yoga-c630.o
>>>  obj-$(CONFIG_EC_LENOVO_THINKPAD_T14S) += lenovo-thinkpad-t14s.o
>>> +obj-$(CONFIG_EC_QCOM_HAMOA) += qcom-hamoa-ec.o
>>> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
>>> new file mode 100644
>>> index 000000000000..0f883130ac9a
>>> --- /dev/null
>>> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
>>> @@ -0,0 +1,451 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (c) 2024 Maya Matuszczyk <maccraft123mc@gmail.com>
>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>> + */
>>> +
>>> +#include <linux/bitfield.h>
>>> +#include <linux/bits.h>
>>> +#include <linux/device.h>
>>> +#include <linux/err.h>
>>> +#include <linux/i2c.h>
>>> +#include <linux/interrupt.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/module.h>
>>> +#include <linux/pm.h>
>>> +#include <linux/slab.h>
>>> +#include <linux/thermal.h>
>>> +
>>> +#define EC_SCI_EVT_READ_CMD	0x05
>>> +#define EC_FW_VERSION_CMD	0x0e
>>> +#define EC_MODERN_STANDBY_CMD	0x23
>>> +#define EC_FAN_DBG_CONTROL_CMD	0x30
>>> +#define EC_SCI_EVT_CONTROL_CMD	0x35
>>> +#define EC_THERMAL_CAP_CMD	0x42
>>> +
>>> +#define EC_FW_VERSION_RESP_LEN	4
>>> +#define EC_THERMAL_CAP_RESP_LEN	3
>>> +#define EC_FAN_DEBUG_CMD_LEN	6
>>> +#define EC_FAN_SPEED_DATA_SIZE	4
>>> +
>>> +#define EC_MODERN_STANDBY_ENTER	0x01
>>> +#define EC_MODERN_STANDBY_EXIT	0x00
>>> +
>>> +#define EC_FAN_DEBUG_MODE_OFF   0
>>> +#define EC_FAN_DEBUG_MODE_ON    BIT(0)
>>
>> Add include for BIT().
>>
> 
> Added <linux/bits.h> in v6 to address this.
> 
>>> +#define EC_FAN_ON               BIT(1)
>>> +#define EC_FAN_DEBUG_TYPE_PWM   BIT(2)
>>> +#define EC_MAX_FAN_CNT		2
>>> +#define EC_FAN_NAME_SIZE	20
>>> +#define EC_FAN_MAX_PWM		255
>>> +
>>> +enum qcom_ec_sci_events {
>>> +	EC_FAN1_STATUS_CHANGE_EVT = 0x30,
>>> +	EC_FAN2_STATUS_CHANGE_EVT,
>>> +	EC_FAN1_SPEED_CHANGE_EVT,
>>> +	EC_FAN2_SPEED_CHANGE_EVT,
>>> +	EC_NEW_LUT_SET_EVT,
>>> +	EC_FAN_PROFILE_SWITCH_EVT,
>>> +	EC_THERMISTOR_1_THRESHOLD_CROSS_EVT,
>>> +	EC_THERMISTOR_2_THRESHOLD_CROSS_EVT,
>>> +	EC_THERMISTOR_3_THRESHOLD_CROSS_EVT,
>>> +	/* Reserved: 0x39 - 0x3c/0x3f */
>>> +	EC_RECOVERED_FROM_RESET_EVT = 0x3d,
>>> +};
>>> +
>>> +struct qcom_ec_version {
>>> +	u8 main_version;
>>> +	u8 sub_version;
>>> +	u8 test_version;
>>> +};
>>> +
>>> +struct qcom_ec_thermal_cap {
>>> +#define EC_THERMAL_FAN_CNT(x)		(FIELD_GET(GENMASK(1, 0), (x)))
>>> +#define EC_THERMAL_FAN_TYPE(x)		(FIELD_GET(GENMASK(4, 2), (x)))
>>> +#define EC_THERMAL_THERMISTOR_MASK(x)	(FIELD_GET(GENMASK(7, 0), (x)))
>>> +	u8 fan_cnt;
>>> +	u8 fan_type;
>>> +	u8 thermistor_mask;
>>> +};
>>> +
>>> +struct qcom_ec_cooling_dev {
>>> +	struct thermal_cooling_device *cdev;
>>> +	struct device *parent_dev;
>>> +	u8 fan_id;
>>> +	u8 state;
>>> +};
>>> +
>>> +struct qcom_ec {
>>> +	struct qcom_ec_cooling_dev *ec_cdev;
>>> +	struct qcom_ec_thermal_cap thermal_cap;
>>> +	struct qcom_ec_version version;
>>> +	struct i2c_client *client;
>>> +};
>>> +
>>> +static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, u8 resp_len, u8 *resp)
>>> +{
>>> +	int ret;
>>> +
>>> +	ret = i2c_smbus_read_i2c_block_data(ec->client, cmd, resp_len, resp);
>>> +
>>> +	if (ret < 0)
>>> +		return ret;
>>> +	else if (ret == 0 || ret == 0xff)
>>> +		return -EOPNOTSUPP;
>>> +
>>> +	if (resp[0] >= resp_len)
>>> +		return -EINVAL;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +/*
>>> + * EC Device Firmware Version:
>>> + *
>>> + * Read Response:
>>> + * ----------------------------------------------------------------------
>>> + * | Offset	| Name		| Description				|
>>> + * ----------------------------------------------------------------------
>>> + * | 0x00	| Byte count	| Number of bytes in response		|
>>> + * |		|		| (excluding byte count)		|
>>> + * ----------------------------------------------------------------------
>>> + * | 0x01	| Test-version	| Test-version of EC firmware		|
>>> + * ----------------------------------------------------------------------
>>> + * | 0x02	| Sub-version	| Sub-version of EC firmware		|
>>> + * ----------------------------------------------------------------------
>>> + * | 0x03	| Main-version	| Main-version of EC firmware		|
>>> + * ----------------------------------------------------------------------
>>> + *
>>> + */
>>> +static int qcom_ec_read_fw_version(struct device *dev)
>>> +{
>>> +	struct i2c_client *client = to_i2c_client(dev);
>>> +	struct qcom_ec *ec = i2c_get_clientdata(client);
>>> +	struct qcom_ec_version *version = &ec->version;
>>> +	u8 resp[EC_FW_VERSION_RESP_LEN];
>>> +	int ret;
>>> +
>>> +	ret = qcom_ec_read(ec, EC_FW_VERSION_CMD, EC_FW_VERSION_RESP_LEN, resp);
>>> +	if (ret < 0)
>>> +		return ret;
>>> +
>>> +	version->main_version = resp[3];
>>> +	version->sub_version = resp[2];
>>> +	version->test_version = resp[1];
>>> +
>>> +	dev_dbg(dev, "EC Version %d.%d.%d\n",
>>> +		version->main_version, version->sub_version, version->test_version);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +/*
>>> + * EC Device Thermal Capabilities:
>>> + *
>>> + * Read Response:
>>> + * ------------------------------------------------------------------------------
>>> + * | Offset		| Name		| Description				|
>>> + * ------------------------------------------------------------------------------
>>> + * | 0x00		| Byte count	| Number of bytes in response		|
>>> + * |			|		| (excluding byte count)		|
>>> + * ------------------------------------------------------------------------------
>>> + * | 0x02 (LSB)	| EC Thermal	| Bit 0-1: Number of fans		|
>>> + * | 0x3		| Capabilities	| Bit 2-4: Type of fan			|
>>
>> 0x03 ?
>>
> 
> Typo, Will fix to 0x03 in next respin.
> 
>>> + * |			|		| Bit 5-6: Reserved			|
>>> + * |			|		| Bit 7: Data Valid/Invalid		|
>>> + * |			|		|	 (Valid - 1, Invalid - 0)	|
>>> + * |			|		| Bit 8-15: Thermistor 0 - 7 presence	|
>>> + * |			|		|	    (1 present, 0 absent)	|
>>> + * ------------------------------------------------------------------------------
>>> + *
>>> + */
>>> +static int qcom_ec_thermal_capabilities(struct device *dev)
>>> +{
>>> +	struct i2c_client *client = to_i2c_client(dev);
>>> +	struct qcom_ec *ec = i2c_get_clientdata(client);
>>> +	struct qcom_ec_thermal_cap *cap = &ec->thermal_cap;
>>> +	u8 resp[EC_THERMAL_CAP_RESP_LEN];
>>> +	int ret;
>>> +
>>> +	ret = qcom_ec_read(ec, EC_THERMAL_CAP_CMD, EC_THERMAL_CAP_RESP_LEN, resp);
>>> +	if (ret < 0)
>>> +		return ret;
>>> +
>>> +	cap->fan_cnt = min(EC_MAX_FAN_CNT, EC_THERMAL_FAN_CNT(resp[1]));
>>> +	cap->fan_type = EC_THERMAL_FAN_TYPE(resp[1]);
>>> +	cap->thermistor_mask = EC_THERMAL_THERMISTOR_MASK(resp[2]);
>>> +
>>> +	dev_dbg(dev, "Fan count: %d Fan Type: %d Thermistor Mask: %x\n",
>>
>> Please add include for dev_dbg().
>>
>> It seems you've missed at least some of my comments to v5, please recheck
>> those comments. I won't look further for now.
>>
>> --
>>  i.
>>
> 
> Added <linux/device.h> for dev_dbg() in v6, will include
> <linux/dev_printk.h> as well in in v8. That said, all your v5 comments
> have been addressed, here is a summary of what was fixed:
> 
> - Add <linux/bits.h> for BIT()
> - Add <linux/err.h> for IS_ERR()
> - Switch thermistor mask format specifier from %d to %x
> - Add missing braces
> - Remove empty line within variable declarations
> - Change loop counter i to unsigned int
> - Replace snprintf() with scnprintf()
> - Use sizeof(name) instead of the EC_FAN_NAME_SIZE macro directly
> - Condense devm_thermal_of_cooling_device_register() to 2 lines
> 
> Apologies if it appeared otherwise. If anything was missed, please do
> point it out and I will address it in the next respin.
> 

Hi Ilpo,

Could you please take a look at this when you get a chance?

-- 
Best Regards,
Anvesh

