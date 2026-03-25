Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2919332631
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 05:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774418272; cv=none; b=L95EM0xlY6AuTvkgpdbjHpLSL+iWSeeuLefhqZo/4OlQWynM7vbvjUkZ8KFqZMXDqlnh3eoUvo4vpkcDXytI96BpTUcFJP7rJu5aT+Pjx0AbaTCAiGF3so0+l1LtdznAJPYA71WS+d3/WTm5lc2ebftWTqF98/IRmPXhgy4Akpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774418272; c=relaxed/simple;
	bh=rETpE8k4PjULiluZbIhBi4G3z4WiF5EVaLesx9D69YY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D/4Z5vsT+51Z1zDgJLLQPpVwmQ1JVmAVg7huvYiK0H9slqA0cULaENmb8T/243cPIuI7gLyWOeCRVSAn1XutBZeQsJZr2xYId/rF9UFN/4YE7oJPfccqCaP1VYrG7elWHb1w87XfBhRMHtrRxxeQt22+Xu7mQc+CsapDSwXy8Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g5WE+97j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dG2vgDYV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g5WE+97j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dG2vgDYV"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P4Ig3Q989015
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 05:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5BY4lmgpz2ne1QfHELMPFWJzjB6bikBBRUD+XKSrcr4=; b=g5WE+97jIAQfF+p1
	+GMAq/kBUE1a9J8DNmlo754Pf8lH5IQfZ4cvt4g8RPqg2pQVBKVy23MQlh4VdiOl
	gpUbpsjxGb4lAqz+P888H8od0BhGAp6l9KJRVDTccDShuu4IrETVzAkDkLRkWzDK
	W2JA1+LQb99yUdvwQ/7X6Awzox+9ufKETJWBYPsKQ1iigo4d51JKVbyLf+BWUg8U
	taxbyDPsebmOWaiTLWIVuE4GXYi1V7NkQRgYV+SLjXUkrG1JxS3nMxIQFnrrwgpM
	9JNzj/RwOegR5BAbHp3WN7fvVdZi1lg5HII12JGYHSlA31eg498eg7HMzpVZ3JQ8
	96rMow==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3u0m3a56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 05:57:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3594620fe97so42413993a91.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 22:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774418268; x=1775023068; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5BY4lmgpz2ne1QfHELMPFWJzjB6bikBBRUD+XKSrcr4=;
        b=dG2vgDYVkiwXlqXHQ9BTmN9ToSmT101GcvbzEOELl+JDZMC5yEvAIwp5BDyn4v+Bcw
         COW+I/GjAhrSTqixw2O6xzg0xP3HpDFlSHcZbsPGh5wtFUcKwyWMWqAOMbAjq+98+VzP
         ShNh02xeB2jonZ5z6Ar69A3CrWZPGLApA51OrVCL1QzGZ+FtFrFLIJylGhsR+MlQZFWm
         nH+g69In63CLrEorSFsQTs5XDuv0DcI3FTN+F+2CnNXlYbwZttUxN2S87CDuesjz6j0i
         HvFcgrRl23vXnlDp1b1LabNf4QXmpKXLjK6LpUMxeLyTzM4kLi257fIkY8dga5/Lg5FV
         kegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774418268; x=1775023068;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5BY4lmgpz2ne1QfHELMPFWJzjB6bikBBRUD+XKSrcr4=;
        b=FH58sECD6H9YrQJa0J017k99sKM5VVuczCbHMdUtmPGIniQvxlww1ZqJtkLgbmcYsi
         CRHKv3mZiv+s68n9i9F4T6/J/UzqxIl0gW5XL5dgi+YrqdHknw6W9P6OOiNvMOqaAKOl
         EDNffLNo4YJ1JWhcNH1IBn7KaF5ehKqhFPl4g19WGjxMiKDvgE6HBzLCLmow/Nv50pXz
         G3Lv8qeybYDf6PEXj6PrFuKODq8nKiVFjjdewBg+l5CVx9eLbLXUrGXksBYXGwMtCmLQ
         044WEoVV6pP3gQliWEuHEMeEPDFzsFxao+VRrei3JfIr3AVp5gHIo6FRFiX6nx0alTFo
         dtdw==
X-Forwarded-Encrypted: i=1; AJvYcCWcjRjus8mLtIGUK3j24YW2K1bmsZ721nUozVvFXnKW/0zZBlFdiQuGG7eXocFsG0QAgyUVa/Pti8g77MjFgdAhCcXW@vger.kernel.org
X-Gm-Message-State: AOJu0YzgX+WUUdllm67ka30BE/DAMQjyfbaeio9fPSa/p45Zc43UzTOB
	vTDMqxD6vWmZGhuHvH8kzAaiIA8cxEAPyylSqbVV+8zpd+4EPVz/HRcmj4nJ8E6ynBM2t2k5fN5
	o6EYMLysG515trvbgNY1kWwS0FGZg+Cw0JQ+mQ0bZcSJTxeftXW8UFey0N8JI4VKK/jcyWGJTK0
	pF
X-Gm-Gg: ATEYQzzopuMZ3EEuSESTGeFgTo70F1mzriymeMWJP9hBK8uDVNliahupc66DDjUlHKm
	8LsEPK1mIu+gZ1ojPMBKoJ4cAsVXJp3ZbDrD1dai9e5UEpqH2yAGW6iemnHTeqJSg50ggmPP+0P
	Xl72ZATHynh9czusgLoiu1ZlessV8qzFlWpY3y4Iag4yDRWJ1zgNoNc20J21cMwXSF9AFIYoQBV
	XqLzZbltYZUNSeJhjt9xE+Z/UMqBrxLbQfgLyzM7W4ZfYwKPil5U4UcK5vjXVm9ry0EdHYNOzFd
	7m6zeH/NBvBzDi61Sf7CIba1fIxRul7eHB8/aNrG7Q746+idav3nKZD6GGBcw25LMZ5klfukaZe
	NQspcEuA9PA9UkeIiwLlLDixy2YIXcyiYXB+VyKwXI2IOvLC4PhUojx6FOFYjZQbSz+65wHSrwO
	ZFuS52Mivllfh3HKsvB4vqhYQEsC37ieEpBA==
X-Received: by 2002:a17:903:3845:b0:2ae:b9cd:d2ce with SMTP id d9443c01a7336-2b0b0ad2a7amr26130935ad.27.1774418268126;
        Tue, 24 Mar 2026 22:57:48 -0700 (PDT)
X-Received: by 2002:a17:903:3845:b0:2ae:b9cd:d2ce with SMTP id d9443c01a7336-2b0b0ad2a7amr26130735ad.27.1774418267526;
        Tue, 24 Mar 2026 22:57:47 -0700 (PDT)
Received: from [10.79.196.200] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08351675esm215900975ad.14.2026.03.24.22.57.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 22:57:47 -0700 (PDT)
Message-ID: <9561ee23-07b8-4f08-9ced-d16d4f764aef@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 11:27:41 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260317-add-driver-for-ec-v5-0-38d11f524856@oss.qualcomm.com>
 <20260317-add-driver-for-ec-v5-2-38d11f524856@oss.qualcomm.com>
 <b944c9f0-39ac-02f9-02ae-9e441c0b2cc5@linux.intel.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <b944c9f0-39ac-02f9-02ae-9e441c0b2cc5@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IY6KmGqa c=1 sm=1 tr=0 ts=69c3795d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=E2FcRaxJAAAA:8
 a=5VqgEL0XbDWLDk991EsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=Yev8HTsh1NrKSfoOyGCL:22
X-Proofpoint-ORIG-GUID: sx6iwnbKOWl3mQ3fouUn5wB_j-OKM7Y9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAzOSBTYWx0ZWRfX740glBcDTYCt
 HHio3mvTT29+SluyXZplBpD3j/4xLUHO73/vGyErvvUHlBXU0Zq9/LH8GCZ5MnVfemsthpVUuEF
 3wONcVhlGVPl9S5i3puY1gz8fflisiA1n72rK89BtYAAlam4d7pKtM1mYOsZlG1oxxEFbZQ/SpD
 Y10VnPhUj3TBCmCey7NFUpDCZesrbPI7wYVoJS7K8n1s4KYrAdbelr7URYB4X4sLwlqd5l7HiYG
 gYuuqimW4zE6RTgRUHIQhAPJ/HLbkCuVo2JGQqeZKvg7Iy0ryAlAQH1Y7ZQ9wuUzVSsoKGrWHx9
 3mMvvsPRdTUdFcdsoiFTMmnXAXPz2z3vH5nUvkki0Ytc20m98dQn6psSnMpNRdj1mfzdA4z+zp8
 sIKn8+GLuk/aHTWWT+KldNojvHd4M8vlUJpF6fdro09cY9otZ2w8/+y3XLZCnOVxEwXyD/JqBgZ
 X0c/EA+at2j6oedBGmA==
X-Proofpoint-GUID: sx6iwnbKOWl3mQ3fouUn5wB_j-OKM7Y9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250039



On 3/24/2026 5:11 PM, Ilpo Järvinen wrote:
> On Tue, 17 Mar 2026, Anvesh Jain P wrote:
> 
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
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
>>  MAINTAINERS                            |   8 +
>>  drivers/platform/arm64/Kconfig         |  12 +
>>  drivers/platform/arm64/Makefile        |   1 +
>>  drivers/platform/arm64/qcom-hamoa-ec.c | 449 +++++++++++++++++++++++++++++++++
>>  4 files changed, 470 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 2882a67bdf6d..9657c384be44 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -21932,6 +21932,14 @@ S:	Supported
>>  W:	https://wireless.wiki.kernel.org/en/users/Drivers/wcn36xx
>>  F:	drivers/net/wireless/ath/wcn36xx/
>>  
>> +QUALCOMM HAMOA EMBEDDED CONTROLLER DRIVER
>> +M:	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>> +M:	Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> +L:	linux-arm-msm@vger.kernel.org
>> +S:	Maintained
>> +F:	Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml
>> +F:	drivers/platform/arm64/qcom-hamoa-ec.c
>> +
>>  QUANTENNA QTNFMAC WIRELESS DRIVER
>>  M:	Igor Mitsyanko <imitsyanko@quantenna.com>
>>  R:	Sergey Matyukevich <geomatsi@gmail.com>
>> diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
>> index 10f905d7d6bf..025cdf091f9e 100644
>> --- a/drivers/platform/arm64/Kconfig
>> +++ b/drivers/platform/arm64/Kconfig
>> @@ -90,4 +90,16 @@ config EC_LENOVO_THINKPAD_T14S
>>  
>>  	  Say M or Y here to include this support.
>>  
>> +config EC_QCOM_HAMOA
>> +	tristate "Embedded Controller driver for Qualcomm Hamoa/Glymur reference devices"
>> +	depends on ARCH_QCOM || COMPILE_TEST
>> +	depends on I2C
>> +	help
>> +	  Say M or Y here to enable the Embedded Controller driver for Qualcomm
>> +	  Snapdragon-based Hamoa/Glymur reference devices. The driver handles fan
>> +	  control, temperature sensors, access to EC state changes and supports
>> +	  reporting suspend entry/exit to the EC.
>> +
>> +	  This driver currently supports Hamoa/Purwa/Glymur reference devices.
>> +
>>  endif # ARM64_PLATFORM_DEVICES
>> diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Makefile
>> index 60c131cff6a1..7681be4a46e9 100644
>> --- a/drivers/platform/arm64/Makefile
>> +++ b/drivers/platform/arm64/Makefile
>> @@ -9,3 +9,4 @@ obj-$(CONFIG_EC_ACER_ASPIRE1)	+= acer-aspire1-ec.o
>>  obj-$(CONFIG_EC_HUAWEI_GAOKUN)	+= huawei-gaokun-ec.o
>>  obj-$(CONFIG_EC_LENOVO_YOGA_C630) += lenovo-yoga-c630.o
>>  obj-$(CONFIG_EC_LENOVO_THINKPAD_T14S) += lenovo-thinkpad-t14s.o
>> +obj-$(CONFIG_EC_QCOM_HAMOA) += qcom-hamoa-ec.o
>> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
>> new file mode 100644
>> index 000000000000..0b0c1df19695
>> --- /dev/null
>> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
>> @@ -0,0 +1,449 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2024 Maya Matuszczyk <maccraft123mc@gmail.com>
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/bitfield.h>
>> +#include <linux/i2c.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/pm.h>
>> +#include <linux/slab.h>
>> +#include <linux/thermal.h>
>> +
>> +#define EC_SCI_EVT_READ_CMD	0x05
>> +#define EC_FW_VERSION_CMD	0x0e
>> +#define EC_MODERN_STANDBY_CMD	0x23
>> +#define EC_FAN_DBG_CONTROL_CMD	0x30
>> +#define EC_SCI_EVT_CONTROL_CMD	0x35
>> +#define EC_THERMAL_CAP_CMD	0x42
>> +
>> +#define EC_FW_VERSION_RESP_LEN	4
>> +#define EC_THERMAL_CAP_RESP_LEN	3
>> +#define EC_FAN_DEBUG_CMD_LEN	6
>> +#define EC_FAN_SPEED_DATA_SIZE	4
>> +
>> +#define EC_MODERN_STANDBY_ENTER	0x01
>> +#define EC_MODERN_STANDBY_EXIT	0x00
>> +
>> +#define EC_FAN_DEBUG_MODE_OFF   0
>> +#define EC_FAN_DEBUG_MODE_ON    BIT(0)
> 
> Please add linux/bits.h to includes for this.
>

Ack, Will add linux/bits.h to includes in v6.

>> +#define EC_FAN_ON               BIT(1)
>> +#define EC_FAN_DEBUG_TYPE_PWM   BIT(2)
>> +#define EC_MAX_FAN_CNT		2
>> +#define EC_FAN_NAME_SIZE	20
>> +#define EC_FAN_MAX_PWM		255
>> +
>> +enum qcom_ec_sci_events {
>> +	EC_FAN1_STATUS_CHANGE_EVT = 0x30,
>> +	EC_FAN2_STATUS_CHANGE_EVT,
>> +	EC_FAN1_SPEED_CHANGE_EVT,
>> +	EC_FAN2_SPEED_CHANGE_EVT,
>> +	EC_NEW_LUT_SET_EVT,
>> +	EC_FAN_PROFILE_SWITCH_EVT,
>> +	EC_THERMISTOR_1_THRESHOLD_CROSS_EVT,
>> +	EC_THERMISTOR_2_THRESHOLD_CROSS_EVT,
>> +	EC_THERMISTOR_3_THRESHOLD_CROSS_EVT,
>> +	/* Reserved: 0x39 - 0x3c/0x3f */
>> +	EC_RECOVERED_FROM_RESET_EVT = 0x3d,
>> +};
>> +
>> +struct qcom_ec_version {
>> +	u8 main_version;
>> +	u8 sub_version;
>> +	u8 test_version;
>> +};
>> +
>> +struct qcom_ec_thermal_cap {
>> +#define EC_THERMAL_FAN_CNT(x)		(FIELD_GET(GENMASK(1, 0), (x)))
>> +#define EC_THERMAL_FAN_TYPE(x)		(FIELD_GET(GENMASK(4, 2), (x)))
>> +#define EC_THERMAL_THERMISTOR_MASK(x)	(FIELD_GET(GENMASK(7, 0), (x)))
>> +	u8 fan_cnt;
>> +	u8 fan_type;
>> +	u8 thermistor_mask;
>> +};
>> +
>> +struct qcom_ec_cooling_dev {
>> +	struct thermal_cooling_device *cdev;
>> +	struct device *parent_dev;
>> +	u8 fan_id;
>> +	u8 state;
>> +};
>> +
>> +struct qcom_ec {
>> +	struct qcom_ec_cooling_dev *ec_cdev;
>> +	struct qcom_ec_thermal_cap thermal_cap;
>> +	struct qcom_ec_version version;
>> +	struct i2c_client *client;
>> +};
>> +
>> +static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, u8 resp_len, u8 *resp)
>> +{
>> +	int ret;
>> +
>> +	ret = i2c_smbus_read_i2c_block_data(ec->client, cmd, resp_len, resp);
>> +
>> +	if (ret < 0)
>> +		return ret;
>> +	else if (ret == 0 || ret == 0xff)
>> +		return -EOPNOTSUPP;
>> +
>> +	if (resp[0] >= resp_len)
>> +		return -EINVAL;
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * EC Device Firmware Version:
>> + *
>> + * Read Response:
>> + * ----------------------------------------------------------------------
>> + * | Offset	| Name		| Description				|
>> + * ----------------------------------------------------------------------
>> + * | 0x00	| Byte count	| Number of bytes in response		|
>> + * |		|		| (excluding byte count)		|
>> + * ----------------------------------------------------------------------
>> + * | 0x01	| Test-version	| Test-version of EC firmware		|
>> + * ----------------------------------------------------------------------
>> + * | 0x02	| Sub-version	| Sub-version of EC firmware		|
>> + * ----------------------------------------------------------------------
>> + * | 0x03	| Main-version	| Main-version of EC firmware		|
>> + * ----------------------------------------------------------------------
>> + *
>> + */
>> +static int qcom_ec_read_fw_version(struct device *dev)
>> +{
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +	struct qcom_ec *ec = i2c_get_clientdata(client);
>> +	struct qcom_ec_version *version = &ec->version;
>> +	u8 resp[EC_FW_VERSION_RESP_LEN];
>> +	int ret;
>> +
>> +	ret = qcom_ec_read(ec, EC_FW_VERSION_CMD, EC_FW_VERSION_RESP_LEN, resp);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	version->main_version = resp[3];
>> +	version->sub_version = resp[2];
>> +	version->test_version = resp[1];
>> +
>> +	dev_dbg(dev, "EC Version %d.%d.%d\n",
> 
> Add include.
>

Ack, Will add linux/device.h to includes in v6.

>> +		version->main_version, version->sub_version, version->test_version);
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * EC Device Thermal Capabilities:
>> + *
>> + * Read Response:
>> + * ------------------------------------------------------------------------------
>> + * | Offset		| Name		| Description				|
>> + * ------------------------------------------------------------------------------
>> + * | 0x00		| Byte count	| Number of bytes in response		|
>> + * |			|		| (excluding byte count)		|
>> + * ------------------------------------------------------------------------------
>> + * | 0x02 (LSB)	| EC Thermal	| Bit 0-1: Number of fans		|
>> + * | 0x3		| Capabilities	| Bit 2-4: Type of fan			|
>> + * |			|		| Bit 5-6: Reserved			|
>> + * |			|		| Bit 7: Data Valid/Invalid		|
>> + * |			|		|	 (Valid - 1, Invalid - 0)	|
>> + * |			|		| Bit 8-15: Thermistor 0 - 7 presence	|
>> + * |			|		|	    (1 present, 0 absent)	|
>> + * ------------------------------------------------------------------------------
>> + *
>> + */
>> +static int qcom_ec_thermal_capabilities(struct device *dev)
>> +{
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +	struct qcom_ec *ec = i2c_get_clientdata(client);
>> +	struct qcom_ec_thermal_cap *cap = &ec->thermal_cap;
>> +	u8 resp[EC_THERMAL_CAP_RESP_LEN];
>> +	int ret;
>> +
>> +	ret = qcom_ec_read(ec, EC_THERMAL_CAP_CMD, EC_THERMAL_CAP_RESP_LEN, resp);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	cap->fan_cnt = min(EC_MAX_FAN_CNT, EC_THERMAL_FAN_CNT(resp[1]));
>> +	cap->fan_type = EC_THERMAL_FAN_TYPE(resp[1]);
>> +	cap->thermistor_mask = EC_THERMAL_THERMISTOR_MASK(resp[2]);
>> +
>> +	dev_dbg(dev, "Fan count: %d Fan Type: %d Thermistor Mask: %d\n",
>> +		cap->fan_cnt, cap->fan_type, cap->thermistor_mask);
> 
> Consider if it's desirable to print a mask using %d (vs %x).
>

Agreed, will change to %x in v6

>> +
>> +	return 0;
>> +}
>> +
>> +static irqreturn_t qcom_ec_irq(int irq, void *data)
>> +{
>> +	struct qcom_ec *ec = data;
>> +	struct device *dev = &ec->client->dev;
>> +	int val;
>> +
>> +	val = i2c_smbus_read_byte_data(ec->client, EC_SCI_EVT_READ_CMD);
>> +	if (val < 0) {
>> +		dev_err_ratelimited(dev, "Failed to read EC SCI Event: %d\n", val);
>> +		return IRQ_HANDLED;
>> +	}
>> +
>> +	switch (val) {
>> +	case EC_FAN1_STATUS_CHANGE_EVT:
>> +		dev_dbg_ratelimited(dev, "Fan1 status changed\n");
>> +		break;
>> +	case EC_FAN2_STATUS_CHANGE_EVT:
>> +		dev_dbg_ratelimited(dev, "Fan2 status changed\n");
>> +		break;
>> +	case EC_FAN1_SPEED_CHANGE_EVT:
>> +		dev_dbg_ratelimited(dev, "Fan1 speed crossed low/high trip point\n");
>> +		break;
>> +	case EC_FAN2_SPEED_CHANGE_EVT:
>> +		dev_dbg_ratelimited(dev, "Fan2 speed crossed low/high trip point\n");
>> +		break;
>> +	case EC_NEW_LUT_SET_EVT:
>> +		dev_dbg_ratelimited(dev, "New LUT set\n");
>> +		break;
>> +	case EC_FAN_PROFILE_SWITCH_EVT:
>> +		dev_dbg_ratelimited(dev, "FAN Profile switched\n");
>> +		break;
>> +	case EC_THERMISTOR_1_THRESHOLD_CROSS_EVT:
>> +		dev_dbg_ratelimited(dev, "Thermistor 1 threshold crossed\n");
>> +		break;
>> +	case EC_THERMISTOR_2_THRESHOLD_CROSS_EVT:
>> +		dev_dbg_ratelimited(dev, "Thermistor 2 threshold crossed\n");
>> +		break;
>> +	case EC_THERMISTOR_3_THRESHOLD_CROSS_EVT:
>> +		dev_dbg_ratelimited(dev, "Thermistor 3 threshold crossed\n");
>> +		break;
>> +	case EC_RECOVERED_FROM_RESET_EVT:
>> +		dev_dbg_ratelimited(dev, "EC recovered from reset\n");
>> +		break;
>> +	default:
>> +		dev_notice_ratelimited(dev, "Unknown EC event: %d\n", val);
>> +		break;
>> +	}
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int qcom_ec_sci_evt_control(struct device *dev, bool enable)
>> +{
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +
>> +	return i2c_smbus_write_byte_data(client, EC_SCI_EVT_CONTROL_CMD, !!enable);
>> +}
>> +
>> +static int qcom_ec_fan_get_max_state(struct thermal_cooling_device *cdev, unsigned long *state)
>> +{
>> +	*state = EC_FAN_MAX_PWM;
>> +
>> +	return 0;
>> +}
>> +
>> +static int qcom_ec_fan_get_cur_state(struct thermal_cooling_device *cdev, unsigned long *state)
>> +{
>> +	struct qcom_ec_cooling_dev *ec_cdev = cdev->devdata;
>> +
>> +	*state = ec_cdev->state;
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * Fan Debug control command:
>> + *
>> + * Command Payload:
>> + * --------------------------------------------------------------------------------------
>> + * | Offset		| Name		| Description					|
>> + * --------------------------------------------------------------------------------------
>> + * | 0x00		| Command	| Fan control command				|
>> + * --------------------------------------------------------------------------------------
>> + * | 0x01		| Fan ID	| 0x1 : Fan 1					|
>> + * |			|		| 0x2 : Fan 2					|
>> + * --------------------------------------------------------------------------------------
>> + * | 0x02		| Byte count = 4| Size of data to set fan speed			|
>> + * --------------------------------------------------------------------------------------
>> + * | 0x03		| Mode		| Bit 0: Debug Mode On/Off (0 - OFF, 1 - ON )	|
>> + * |			|		| Bit 1: Fan On/Off (0 - Off, 1 - ON)		|
>> + * |			|		| Bit 2: Debug Type (0 - RPM, 1 - PWM)		|
>> + * --------------------------------------------------------------------------------------
>> + * | 0x04 (LSB)	| Speed in RPM	| RPM value, if mode selected is RPM		|
>> + * | 0x05		|		|						|
>> + * --------------------------------------------------------------------------------------
>> + * | 0x06		| Speed in PWM	| PWM value, if mode selected is PWM (0 - 255)	|
>> + * ______________________________________________________________________________________
>> + *
>> + */
>> +static int qcom_ec_fan_debug_mode_off(struct qcom_ec_cooling_dev *ec_cdev)
>> +{
>> +	struct device *dev = ec_cdev->parent_dev;
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +	u8 request[6] = { ec_cdev->fan_id, EC_FAN_SPEED_DATA_SIZE,
>> +			  EC_FAN_DEBUG_MODE_OFF, 0, 0, 0 };
>> +	int ret;
>> +
>> +	ret = i2c_smbus_write_i2c_block_data(client, EC_FAN_DBG_CONTROL_CMD,
>> +					     sizeof(request), request);
>> +	if (ret)
>> +		dev_err(dev, "Failed to turn off fan%d debug mode: %d\n",
>> +			ec_cdev->fan_id, ret);
> 
> Add braces.
>

Ack, Will fix this in v6.

>> +
>> +	return ret;
>> +}
>> +
>> +static int qcom_ec_fan_set_cur_state(struct thermal_cooling_device *cdev, unsigned long state)
>> +{
>> +	struct qcom_ec_cooling_dev *ec_cdev = cdev->devdata;
>> +	struct device *dev = ec_cdev->parent_dev;
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +
>> +	u8 request[6] = { ec_cdev->fan_id, EC_FAN_SPEED_DATA_SIZE,
> 
> Don't leave empty lines within variable declarations.
>

Ack, Will fix this in v6.

>> +			  EC_FAN_DEBUG_MODE_ON | EC_FAN_ON | EC_FAN_DEBUG_TYPE_PWM,
>> +			  0, 0, state };
>> +	int ret;
>> +
>> +	ret = i2c_smbus_write_i2c_block_data(client, EC_FAN_DBG_CONTROL_CMD,
>> +					     sizeof(request), request);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to set fan pwm: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ec_cdev->state = state;
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct thermal_cooling_device_ops qcom_ec_thermal_ops = {
>> +	.get_max_state = qcom_ec_fan_get_max_state,
>> +	.get_cur_state = qcom_ec_fan_get_cur_state,
>> +	.set_cur_state = qcom_ec_fan_set_cur_state,
>> +};
>> +
>> +static int qcom_ec_resume(struct device *dev)
>> +{
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +
>> +	return i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
>> +					 EC_MODERN_STANDBY_ENTER);
>> +}
>> +
>> +static int qcom_ec_suspend(struct device *dev)
>> +{
>> +	struct i2c_client *client = to_i2c_client(dev);
>> +
>> +	return i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
>> +					 EC_MODERN_STANDBY_EXIT);
>> +}
>> +
>> +static int qcom_ec_probe(struct i2c_client *client)
>> +{
>> +	struct device *dev = &client->dev;
>> +	struct qcom_ec *ec;
>> +	int ret, i;
>> +
>> +	ec = devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
>> +	if (!ec)
>> +		return -ENOMEM;
>> +
>> +	ec->client = client;
>> +
>> +	ret = devm_request_threaded_irq(dev, client->irq, NULL, qcom_ec_irq,
>> +					IRQF_ONESHOT, "qcom_ec", ec);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	i2c_set_clientdata(client, ec);
>> +
>> +	ret = qcom_ec_read_fw_version(dev);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "Failed to read EC firmware version\n");
>> +
>> +	ret = qcom_ec_sci_evt_control(dev, true);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "Failed to enable SCI events\n");
>> +
>> +	ret = qcom_ec_thermal_capabilities(dev);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "Failed to read thermal capabilities\n");
>> +
>> +	if (ec->thermal_cap.fan_cnt == 0) {
>> +		dev_warn(dev, FW_BUG "Failed to get fan count, firmware update required\n");
>> +		return 0;
>> +	}
>> +
>> +	ec->ec_cdev = devm_kcalloc(dev, ec->thermal_cap.fan_cnt, sizeof(*ec->ec_cdev), GFP_KERNEL);
>> +	if (!ec->ec_cdev)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < ec->thermal_cap.fan_cnt; i++) {
>> +		struct qcom_ec_cooling_dev *ec_cdev = &ec->ec_cdev[i];
>> +		char name[EC_FAN_NAME_SIZE];
>> +
>> +		snprintf(name, EC_FAN_NAME_SIZE, "qcom_ec_fan_%u", (unsigned int)i);
> 
> Please make i unsigned int instead, it only counts from 0 up.
>
> sizeof(name)
> 
> scnprintf() is preferrable over snprintf() even if you don't use the 
> return value so we could eventually have only one function for it.
>

Agreed, Will change i to unsigned int, use sizeof(name) directly and
replace snprintf() with scnprintf() in v6.

>> +		ec_cdev->fan_id = i + 1;
>> +		ec_cdev->parent_dev = dev;
>> +
>> +		ec_cdev->cdev = devm_thermal_of_cooling_device_register(dev,
>> +									NULL,
>> +									name,
>> +									ec_cdev,
>> +									&qcom_ec_thermal_ops);
> 
> I suggest you combine a few parameters so it takes only 3 lines, you've 
> pretty long lines in this function anyway and there's nothing fancy in 
> those parameters.
> 

Ack, Will fix this in v6.

>> +		if (IS_ERR(ec_cdev->cdev))
> 
> Please add include.
> 

Ack, Will add linux/err.h to includes in v6.

>> +			return dev_err_probe(dev, PTR_ERR(ec_cdev->cdev),
>> +					     "Failed to register fan%d cooling device\n", i);
> 
> Add braces.
>

Ack, Will fix this in v6.

>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void qcom_ec_remove(struct i2c_client *client)
>> +{
>> +	struct qcom_ec *ec = i2c_get_clientdata(client);
>> +	struct device *dev = &client->dev;
>> +	int ret;
>> +
>> +	ret = qcom_ec_sci_evt_control(dev, false);
>> +	if (ret < 0)
>> +		dev_err(dev, "Failed to disable SCI events: %d\n", ret);
>> +
>> +	for (int i = 0; i < ec->thermal_cap.fan_cnt; i++) {
>> +		struct qcom_ec_cooling_dev *ec_cdev = &ec->ec_cdev[i];
>> +
>> +		qcom_ec_fan_debug_mode_off(ec_cdev);
>> +	}
>> +}
>> +
>> +static const struct of_device_id qcom_ec_of_match[] = {
>> +	{ .compatible = "qcom,hamoa-crd-ec" },
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(of, qcom_ec_of_match);
>> +
>> +static const struct i2c_device_id qcom_ec_i2c_id_table[] = {
>> +	{ "qcom-hamoa-ec", },
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(i2c, qcom_ec_i2c_id_table);
>> +
>> +static DEFINE_SIMPLE_DEV_PM_OPS(qcom_ec_pm_ops,
>> +		qcom_ec_suspend,
>> +		qcom_ec_resume);
>> +
>> +static struct i2c_driver qcom_ec_i2c_driver = {
>> +	.driver = {
>> +		.name = "qcom-hamoa-ec",
>> +		.of_match_table = qcom_ec_of_match,
>> +		.pm = &qcom_ec_pm_ops
>> +	},
>> +	.probe = qcom_ec_probe,
>> +	.remove = qcom_ec_remove,
>> +	.id_table = qcom_ec_i2c_id_table,
>> +};
>> +module_i2c_driver(qcom_ec_i2c_driver);
>> +
>> +MODULE_DESCRIPTION("QCOM Hamoa Embedded Controller");
>> +MODULE_LICENSE("GPL");
>>
>>
>

Thanks for the review!

-- 
Best Regards,
Anvesh

