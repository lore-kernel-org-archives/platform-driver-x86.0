Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB79413258
	for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 15:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971463; cv=none; b=dAaaLS7z7VX4CSHYo1tITjNWpg6X8S0N5gBn8CM70VRmXYQSibnlKrLRYh/h+6YGu4B2sr6XTj7oNYIT/0z2tVcu794rJegbuyd5EybltrIWWeFeom5kOC2j1EXJm9rjmejCczeKKkTyWrBnMIp0uznd2fox8877JWTq79P6dH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971463; c=relaxed/simple;
	bh=nhZbrvjVovuvesS3bzTmjVn9T/K+n0DqOYlmcCEF49U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ST5bZ/K1oxjHDC94EW/GY9UoJK5vUq5ZnufhI1vG+JZZtHFwP9FVN3ItrbNRYxr2w2h+nvTNI1Q0WkPkNi7fkx5siZSX7f1x1yYDEekW+dkSGjeGVCqARmM0m2geq8v/RTA+C4ctdO+TNB7lwnSq5cEIWePAFFhxxpMk58ERUFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jZAJX/j+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G1DRiBU2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jZAJX/j+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G1DRiBU2"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VBwPYx2407599
	for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 15:37:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	il1hEW6r5dvc+JXkZzfMkJTKkOlvHfQZpgMQfLRxbKk=; b=jZAJX/j+NxkB1riC
	avvVcJaMSE+8TNrtdjqG0/KEK23kdYtFxafiJvkNyzGYh6qhh0ffFVpCxo8vEcxb
	kL6R3OZQeCg+di16a0FJnldTx0wZKxImn5xBXpGrck0DQQVhDV3jIALstoESiTXY
	7x7oRXnHoVnvAzdDAmV6FbAAoY8aNauHULQa1wDjQeMusXFEjFEACtewaBnPD9ig
	KS7jF2Dkv/UhRuwLyugnZguz2KlOjEed0xOQ+e2dINyglH2lkuAvzr56Z2XCHJmk
	/UCSQjuD5rqwOjwwidOtQNv71vruRh6LeiQ/ePwVI1tlBlL9w+FDaT6Z6+M+aw8a
	zU3smQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80heuxs2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 15:37:39 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82a77f807e4so9608394b3a.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 08:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774971458; x=1775576258; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=il1hEW6r5dvc+JXkZzfMkJTKkOlvHfQZpgMQfLRxbKk=;
        b=G1DRiBU2qtnhaFlQrF3dJVyS6nq7BGpGcLX9MbOSQ+sSFVgHH9Wx1whxYxbugi5Zlw
         /RtYGEg10gEwFIgMWdR0o4rpDHx2gxF2Glft1v98fdgCjWMrqrI9okQoI5QBw4m0/WVH
         Zmgv7vyMcXzDFqRfdclLh6VBP5NtJnhR2niz7JcYuonboehEnytG0SMDVdIz4xwoZ7Ms
         hRg5gvDzEHk1PkDqtVMplCu8Mc8lnB4chWgD0KaziLUPQWc7acX08oXz92IhGv85fReu
         nYLw+faWDwhZUV/DQPLexLz6nAgEOM8VmE69mRz7aF7wVdwW+zMo9jJ7OEilMRn4z34D
         GWtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774971458; x=1775576258;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=il1hEW6r5dvc+JXkZzfMkJTKkOlvHfQZpgMQfLRxbKk=;
        b=pm6NTFZ+EK4iJW4UD+a6gPNx/0U4Jo+6/ZjlGK1XSc8jHAgKg1OHqehdTqwYhBV1kv
         ScY4NwpLj83kiKUYoEZRWxidnCMkSyWU14KmZ1og782xi1FzXQ1wp3bBHkdpYnuwqalT
         QQgo1DcPiRngdkfVi9qaATMGc0E7gJ5nrhzgzIZ/mM2I7bLBr3BoLCqK05WKpdoMW7C5
         SHrCmQk0DCWOX1tMFxUOe5Umzdlr0w41tBOf/MI6OAYDd9K+j+dq/YudaFWG7oX8Ts5l
         gg36hqfjl60W/BEra7rzas4p6Sh4RZLhTViiLYwbhalUDcARr8SrauKNnJMmYRX+fzBm
         oDVg==
X-Forwarded-Encrypted: i=1; AJvYcCWFJK0ObpTKvCmAHE43uN2W9OIbmv1lUU6lsdbJIwBz1OMk9dDXifK/r5QTwco+TE9G1yCLOvTysGWtsjZiiD7bWTXL@vger.kernel.org
X-Gm-Message-State: AOJu0YxWOmFosWCugRJknA0uk6XXlq4FEbikiGvSMQDyR9QgYxa0BxDP
	KmQEJjPHNmGbcLlG9qocTl7DyR4lDpNMYPhIaqeF3nu/lw2EoKcB8u0drmhxODCm0ytWiBryoVR
	tW0p2Grn973JwxM74jRbAnSm8zn9Pt9txbHIm0B5yxB2ViWFB3GfDZpLoWs0/ntFsVqBfn9wVbY
	2t
X-Gm-Gg: ATEYQzytok3rb5fi5oO0NlXo0JgsM2efBlto4YaD8uVj6siVl/EsMfQSMSRQdpbWsW/
	ktxEolFJCZ4lBpSRaLTM7oGOjl1xNR7/gYpSS2MiwKKGgtcN8vWAqjvlPDp/R8Ek12Zz5kL6zHZ
	lYhTJ1LUzlNLaFGemtyqrXCWwBqv70k/3edIj5wbaO21+9oW2PH/tZ4DW+N8zSJjrLpvNIUZA/U
	iMxblg6ZQHvcjh1NkgdncPa72GEFvdEHcjHnFEk7hcGa5uG8fzjqPu96h0CNFt5iJFGrFOR5UE2
	h5ShjyFViO1mCTcFtQI5dUrnLmbv1YVdZuZ8KnKTiwMkdRUM753xlfVR2QjDPs8gwoPbKMuRHkP
	O8H4DVQ/grhEeDNrxmr8FheT5cw5m0qOIdAi4ldR7z0Gq
X-Received: by 2002:a05:6a00:338e:b0:829:bd4d:3817 with SMTP id d2e1a72fcca58-82ce89b5714mr77631b3a.28.1774971457871;
        Tue, 31 Mar 2026 08:37:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:338e:b0:829:bd4d:3817 with SMTP id d2e1a72fcca58-82ce89b5714mr77580b3a.28.1774971457171;
        Tue, 31 Mar 2026 08:37:37 -0700 (PDT)
Received: from [192.168.1.11] ([106.222.233.0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cdc16317csm2669205b3a.22.2026.03.31.08.37.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 08:37:35 -0700 (PDT)
Message-ID: <0b7b8415-7039-4bad-8079-ea3280891f68@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 21:07:29 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260327-add-driver-for-ec-v7-0-7684c915e42c@oss.qualcomm.com>
 <20260327-add-driver-for-ec-v7-2-7684c915e42c@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260327-add-driver-for-ec-v7-2-7684c915e42c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Gb0aXAXL c=1 sm=1 tr=0 ts=69cbea43 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=LIJ1G+IszuYCLGPi0MaIKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=A2EAuuJ_w2Yb6CcnjlkA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: WyHkBMSE5fEHjukEj6lU4IAwa2iYQ92a
X-Proofpoint-ORIG-GUID: WyHkBMSE5fEHjukEj6lU4IAwa2iYQ92a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE1MCBTYWx0ZWRfX5x+k7kWLuWkC
 b7rTML+wlhQqRG23Lv2DXM61OXLJ6Okah+ay//qLIiKprm5sn4YRrQ4L5J3/o4p8c2bdEvyu3Ee
 bhItYQpeZZpbMNs2slnKP+d3+1UX9kCvFBCNGCbTSYR/d00XKyt2l9Ph3afyv3xyCwnwLpH45o0
 vnKCUlKNP9sd0Lc3LMigCIlGraUrY0/Fzw7wunsEXFi8oMRER/3s+sH68QmS4uJvDO9pF9A2dX9
 4L1QSWjo/n958xIKmZY6L750pIkRpF6/MgXJAPirs4VnVh33xcQcMSmhTFcrTOTXnQg9/Gxeznn
 y7Hz5BAR5wjIyDlNjvE0IFvRHtytPiTia00cOqK0eZ6igj3YbKaQA4Hvv7RMAfg08zpO96bcWG7
 d1BQbKL2WWhfZP/9ia/TBJN95BPSGRlHXP1oQerWfc0FaLXVojrTy8oWpKwxI5vNAS8xXYjE09g
 2zmhs4Dh4Fw9uCEYntA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310150

On 3/27/2026 3:38 PM, Anvesh Jain P wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
> reference boards. It handles fan control, temperature sensors, access
> to EC state changes and supports reporting suspend entry/exit to the
> EC.
> 
> Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  MAINTAINERS                            |   8 +
>  drivers/platform/arm64/Kconfig         |  12 +
>  drivers/platform/arm64/Makefile        |   1 +
>  drivers/platform/arm64/qcom-hamoa-ec.c | 451 +++++++++++++++++++++++++++++++++
>  4 files changed, 472 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 30ca84404976..536dfd9adff4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21804,6 +21804,14 @@ F:	Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
>  F:	drivers/misc/fastrpc.c
>  F:	include/uapi/misc/fastrpc.h
>  
> +QUALCOMM HAMOA EMBEDDED CONTROLLER DRIVER
> +M:	Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> +M:	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> +L:	linux-arm-msm@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml
> +F:	drivers/platform/arm64/qcom-hamoa-ec.c
> +
>  QUALCOMM HEXAGON ARCHITECTURE
>  M:	Brian Cain <brian.cain@oss.qualcomm.com>
>  L:	linux-hexagon@vger.kernel.org
> diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
> index 10f905d7d6bf..025cdf091f9e 100644
> --- a/drivers/platform/arm64/Kconfig
> +++ b/drivers/platform/arm64/Kconfig
> @@ -90,4 +90,16 @@ config EC_LENOVO_THINKPAD_T14S
>  
>  	  Say M or Y here to include this support.
>  
> +config EC_QCOM_HAMOA

Enable this in arm64 defconfig?

Anyway, for the whole series:

Tested-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Nice work. I have been looking for a way to force fan always ON since
Hamoa. :)

-Akhil.


> +	tristate "Embedded Controller driver for Qualcomm Hamoa/Glymur reference devices"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on I2C
> +	help
> +	  Say M or Y here to enable the Embedded Controller driver for Qualcomm
> +	  Snapdragon-based Hamoa/Glymur reference devices. The driver handles fan
> +	  control, temperature sensors, access to EC state changes and supports
> +	  reporting suspend entry/exit to the EC.
> +
> +	  This driver currently supports Hamoa/Purwa/Glymur reference devices.
> +
>  endif # ARM64_PLATFORM_DEVICES
> diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Makefile
> index 60c131cff6a1..7681be4a46e9 100644
> --- a/drivers/platform/arm64/Makefile
> +++ b/drivers/platform/arm64/Makefile
> @@ -9,3 +9,4 @@ obj-$(CONFIG_EC_ACER_ASPIRE1)	+= acer-aspire1-ec.o
>  obj-$(CONFIG_EC_HUAWEI_GAOKUN)	+= huawei-gaokun-ec.o
>  obj-$(CONFIG_EC_LENOVO_YOGA_C630) += lenovo-yoga-c630.o
>  obj-$(CONFIG_EC_LENOVO_THINKPAD_T14S) += lenovo-thinkpad-t14s.o
> +obj-$(CONFIG_EC_QCOM_HAMOA) += qcom-hamoa-ec.o
> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
> new file mode 100644
> index 000000000000..0f883130ac9a
> --- /dev/null
> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
> @@ -0,0 +1,451 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024 Maya Matuszczyk <maccraft123mc@gmail.com>
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/pm.h>
> +#include <linux/slab.h>
> +#include <linux/thermal.h>
> +
> +#define EC_SCI_EVT_READ_CMD	0x05
> +#define EC_FW_VERSION_CMD	0x0e
> +#define EC_MODERN_STANDBY_CMD	0x23
> +#define EC_FAN_DBG_CONTROL_CMD	0x30
> +#define EC_SCI_EVT_CONTROL_CMD	0x35
> +#define EC_THERMAL_CAP_CMD	0x42
> +
> +#define EC_FW_VERSION_RESP_LEN	4
> +#define EC_THERMAL_CAP_RESP_LEN	3
> +#define EC_FAN_DEBUG_CMD_LEN	6
> +#define EC_FAN_SPEED_DATA_SIZE	4
> +
> +#define EC_MODERN_STANDBY_ENTER	0x01
> +#define EC_MODERN_STANDBY_EXIT	0x00
> +
> +#define EC_FAN_DEBUG_MODE_OFF   0
> +#define EC_FAN_DEBUG_MODE_ON    BIT(0)
> +#define EC_FAN_ON               BIT(1)
> +#define EC_FAN_DEBUG_TYPE_PWM   BIT(2)
> +#define EC_MAX_FAN_CNT		2
> +#define EC_FAN_NAME_SIZE	20
> +#define EC_FAN_MAX_PWM		255
> +
> +enum qcom_ec_sci_events {
> +	EC_FAN1_STATUS_CHANGE_EVT = 0x30,
> +	EC_FAN2_STATUS_CHANGE_EVT,
> +	EC_FAN1_SPEED_CHANGE_EVT,
> +	EC_FAN2_SPEED_CHANGE_EVT,
> +	EC_NEW_LUT_SET_EVT,
> +	EC_FAN_PROFILE_SWITCH_EVT,
> +	EC_THERMISTOR_1_THRESHOLD_CROSS_EVT,
> +	EC_THERMISTOR_2_THRESHOLD_CROSS_EVT,
> +	EC_THERMISTOR_3_THRESHOLD_CROSS_EVT,
> +	/* Reserved: 0x39 - 0x3c/0x3f */
> +	EC_RECOVERED_FROM_RESET_EVT = 0x3d,
> +};
> +
> +struct qcom_ec_version {
> +	u8 main_version;
> +	u8 sub_version;
> +	u8 test_version;
> +};
> +
> +struct qcom_ec_thermal_cap {
> +#define EC_THERMAL_FAN_CNT(x)		(FIELD_GET(GENMASK(1, 0), (x)))
> +#define EC_THERMAL_FAN_TYPE(x)		(FIELD_GET(GENMASK(4, 2), (x)))
> +#define EC_THERMAL_THERMISTOR_MASK(x)	(FIELD_GET(GENMASK(7, 0), (x)))
> +	u8 fan_cnt;
> +	u8 fan_type;
> +	u8 thermistor_mask;
> +};
> +
> +struct qcom_ec_cooling_dev {
> +	struct thermal_cooling_device *cdev;
> +	struct device *parent_dev;
> +	u8 fan_id;
> +	u8 state;
> +};
> +
> +struct qcom_ec {
> +	struct qcom_ec_cooling_dev *ec_cdev;
> +	struct qcom_ec_thermal_cap thermal_cap;
> +	struct qcom_ec_version version;
> +	struct i2c_client *client;
> +};
> +
> +static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, u8 resp_len, u8 *resp)
> +{
> +	int ret;
> +
> +	ret = i2c_smbus_read_i2c_block_data(ec->client, cmd, resp_len, resp);
> +
> +	if (ret < 0)
> +		return ret;
> +	else if (ret == 0 || ret == 0xff)
> +		return -EOPNOTSUPP;
> +
> +	if (resp[0] >= resp_len)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +/*
> + * EC Device Firmware Version:
> + *
> + * Read Response:
> + * ----------------------------------------------------------------------
> + * | Offset	| Name		| Description				|
> + * ----------------------------------------------------------------------
> + * | 0x00	| Byte count	| Number of bytes in response		|
> + * |		|		| (excluding byte count)		|
> + * ----------------------------------------------------------------------
> + * | 0x01	| Test-version	| Test-version of EC firmware		|
> + * ----------------------------------------------------------------------
> + * | 0x02	| Sub-version	| Sub-version of EC firmware		|
> + * ----------------------------------------------------------------------
> + * | 0x03	| Main-version	| Main-version of EC firmware		|
> + * ----------------------------------------------------------------------
> + *
> + */
> +static int qcom_ec_read_fw_version(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct qcom_ec *ec = i2c_get_clientdata(client);
> +	struct qcom_ec_version *version = &ec->version;
> +	u8 resp[EC_FW_VERSION_RESP_LEN];
> +	int ret;
> +
> +	ret = qcom_ec_read(ec, EC_FW_VERSION_CMD, EC_FW_VERSION_RESP_LEN, resp);
> +	if (ret < 0)
> +		return ret;
> +
> +	version->main_version = resp[3];
> +	version->sub_version = resp[2];
> +	version->test_version = resp[1];
> +
> +	dev_dbg(dev, "EC Version %d.%d.%d\n",
> +		version->main_version, version->sub_version, version->test_version);
> +
> +	return 0;
> +}
> +
> +/*
> + * EC Device Thermal Capabilities:
> + *
> + * Read Response:
> + * ------------------------------------------------------------------------------
> + * | Offset		| Name		| Description				|
> + * ------------------------------------------------------------------------------
> + * | 0x00		| Byte count	| Number of bytes in response		|
> + * |			|		| (excluding byte count)		|
> + * ------------------------------------------------------------------------------
> + * | 0x02 (LSB)	| EC Thermal	| Bit 0-1: Number of fans		|
> + * | 0x3		| Capabilities	| Bit 2-4: Type of fan			|
> + * |			|		| Bit 5-6: Reserved			|
> + * |			|		| Bit 7: Data Valid/Invalid		|
> + * |			|		|	 (Valid - 1, Invalid - 0)	|
> + * |			|		| Bit 8-15: Thermistor 0 - 7 presence	|
> + * |			|		|	    (1 present, 0 absent)	|
> + * ------------------------------------------------------------------------------
> + *
> + */
> +static int qcom_ec_thermal_capabilities(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct qcom_ec *ec = i2c_get_clientdata(client);
> +	struct qcom_ec_thermal_cap *cap = &ec->thermal_cap;
> +	u8 resp[EC_THERMAL_CAP_RESP_LEN];
> +	int ret;
> +
> +	ret = qcom_ec_read(ec, EC_THERMAL_CAP_CMD, EC_THERMAL_CAP_RESP_LEN, resp);
> +	if (ret < 0)
> +		return ret;
> +
> +	cap->fan_cnt = min(EC_MAX_FAN_CNT, EC_THERMAL_FAN_CNT(resp[1]));
> +	cap->fan_type = EC_THERMAL_FAN_TYPE(resp[1]);
> +	cap->thermistor_mask = EC_THERMAL_THERMISTOR_MASK(resp[2]);
> +
> +	dev_dbg(dev, "Fan count: %d Fan Type: %d Thermistor Mask: %x\n",
> +		cap->fan_cnt, cap->fan_type, cap->thermistor_mask);
> +
> +	return 0;
> +}
> +
> +static irqreturn_t qcom_ec_irq(int irq, void *data)
> +{
> +	struct qcom_ec *ec = data;
> +	struct device *dev = &ec->client->dev;
> +	int val;
> +
> +	val = i2c_smbus_read_byte_data(ec->client, EC_SCI_EVT_READ_CMD);
> +	if (val < 0) {
> +		dev_err_ratelimited(dev, "Failed to read EC SCI Event: %d\n", val);
> +		return IRQ_HANDLED;
> +	}
> +
> +	switch (val) {
> +	case EC_FAN1_STATUS_CHANGE_EVT:
> +		dev_dbg_ratelimited(dev, "Fan1 status changed\n");
> +		break;
> +	case EC_FAN2_STATUS_CHANGE_EVT:
> +		dev_dbg_ratelimited(dev, "Fan2 status changed\n");
> +		break;
> +	case EC_FAN1_SPEED_CHANGE_EVT:
> +		dev_dbg_ratelimited(dev, "Fan1 speed crossed low/high trip point\n");
> +		break;
> +	case EC_FAN2_SPEED_CHANGE_EVT:
> +		dev_dbg_ratelimited(dev, "Fan2 speed crossed low/high trip point\n");
> +		break;
> +	case EC_NEW_LUT_SET_EVT:
> +		dev_dbg_ratelimited(dev, "New LUT set\n");
> +		break;
> +	case EC_FAN_PROFILE_SWITCH_EVT:
> +		dev_dbg_ratelimited(dev, "FAN Profile switched\n");
> +		break;
> +	case EC_THERMISTOR_1_THRESHOLD_CROSS_EVT:
> +		dev_dbg_ratelimited(dev, "Thermistor 1 threshold crossed\n");
> +		break;
> +	case EC_THERMISTOR_2_THRESHOLD_CROSS_EVT:
> +		dev_dbg_ratelimited(dev, "Thermistor 2 threshold crossed\n");
> +		break;
> +	case EC_THERMISTOR_3_THRESHOLD_CROSS_EVT:
> +		dev_dbg_ratelimited(dev, "Thermistor 3 threshold crossed\n");
> +		break;
> +	case EC_RECOVERED_FROM_RESET_EVT:
> +		dev_dbg_ratelimited(dev, "EC recovered from reset\n");
> +		break;
> +	default:
> +		dev_notice_ratelimited(dev, "Unknown EC event: %d\n", val);
> +		break;
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int qcom_ec_sci_evt_control(struct device *dev, bool enable)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +
> +	return i2c_smbus_write_byte_data(client, EC_SCI_EVT_CONTROL_CMD, !!enable);
> +}
> +
> +static int qcom_ec_fan_get_max_state(struct thermal_cooling_device *cdev, unsigned long *state)
> +{
> +	*state = EC_FAN_MAX_PWM;
> +
> +	return 0;
> +}
> +
> +static int qcom_ec_fan_get_cur_state(struct thermal_cooling_device *cdev, unsigned long *state)
> +{
> +	struct qcom_ec_cooling_dev *ec_cdev = cdev->devdata;
> +
> +	*state = ec_cdev->state;
> +
> +	return 0;
> +}
> +
> +/*
> + * Fan Debug control command:
> + *
> + * Command Payload:
> + * --------------------------------------------------------------------------------------
> + * | Offset		| Name		| Description					|
> + * --------------------------------------------------------------------------------------
> + * | 0x00		| Command	| Fan control command				|
> + * --------------------------------------------------------------------------------------
> + * | 0x01		| Fan ID	| 0x1 : Fan 1					|
> + * |			|		| 0x2 : Fan 2					|
> + * --------------------------------------------------------------------------------------
> + * | 0x02		| Byte count = 4| Size of data to set fan speed			|
> + * --------------------------------------------------------------------------------------
> + * | 0x03		| Mode		| Bit 0: Debug Mode On/Off (0 - OFF, 1 - ON )	|
> + * |			|		| Bit 1: Fan On/Off (0 - Off, 1 - ON)		|
> + * |			|		| Bit 2: Debug Type (0 - RPM, 1 - PWM)		|
> + * --------------------------------------------------------------------------------------
> + * | 0x04 (LSB)	| Speed in RPM	| RPM value, if mode selected is RPM		|
> + * | 0x05		|		|						|
> + * --------------------------------------------------------------------------------------
> + * | 0x06		| Speed in PWM	| PWM value, if mode selected is PWM (0 - 255)	|
> + * ______________________________________________________________________________________
> + *
> + */
> +static int qcom_ec_fan_debug_mode_off(struct qcom_ec_cooling_dev *ec_cdev)
> +{
> +	struct device *dev = ec_cdev->parent_dev;
> +	struct i2c_client *client = to_i2c_client(dev);
> +	u8 request[6] = { ec_cdev->fan_id, EC_FAN_SPEED_DATA_SIZE,
> +			  EC_FAN_DEBUG_MODE_OFF, 0, 0, 0 };
> +	int ret;
> +
> +	ret = i2c_smbus_write_i2c_block_data(client, EC_FAN_DBG_CONTROL_CMD,
> +					     sizeof(request), request);
> +	if (ret) {
> +		dev_err(dev, "Failed to turn off fan%d debug mode: %d\n",
> +			ec_cdev->fan_id, ret);
> +	}
> +
> +	return ret;
> +}
> +
> +static int qcom_ec_fan_set_cur_state(struct thermal_cooling_device *cdev, unsigned long state)
> +{
> +	struct qcom_ec_cooling_dev *ec_cdev = cdev->devdata;
> +	struct device *dev = ec_cdev->parent_dev;
> +	struct i2c_client *client = to_i2c_client(dev);
> +	u8 request[6] = { ec_cdev->fan_id, EC_FAN_SPEED_DATA_SIZE,
> +			  EC_FAN_DEBUG_MODE_ON | EC_FAN_ON | EC_FAN_DEBUG_TYPE_PWM,
> +			  0, 0, state };
> +	int ret;
> +
> +	ret = i2c_smbus_write_i2c_block_data(client, EC_FAN_DBG_CONTROL_CMD,
> +					     sizeof(request), request);
> +	if (ret) {
> +		dev_err(dev, "Failed to set fan pwm: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ec_cdev->state = state;
> +
> +	return 0;
> +}
> +
> +static const struct thermal_cooling_device_ops qcom_ec_thermal_ops = {
> +	.get_max_state = qcom_ec_fan_get_max_state,
> +	.get_cur_state = qcom_ec_fan_get_cur_state,
> +	.set_cur_state = qcom_ec_fan_set_cur_state,
> +};
> +
> +static int qcom_ec_resume(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +
> +	return i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
> +					 EC_MODERN_STANDBY_ENTER);
> +}
> +
> +static int qcom_ec_suspend(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +
> +	return i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
> +					 EC_MODERN_STANDBY_EXIT);
> +}
> +
> +static int qcom_ec_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct qcom_ec *ec;
> +	unsigned int i;
> +	int ret;
> +
> +	ec = devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
> +	if (!ec)
> +		return -ENOMEM;
> +
> +	ec->client = client;
> +
> +	ret = devm_request_threaded_irq(dev, client->irq, NULL, qcom_ec_irq,
> +					IRQF_ONESHOT, "qcom_ec", ec);
> +	if (ret < 0)
> +		return ret;
> +
> +	i2c_set_clientdata(client, ec);
> +
> +	ret = qcom_ec_read_fw_version(dev);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to read EC firmware version\n");
> +
> +	ret = qcom_ec_sci_evt_control(dev, true);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to enable SCI events\n");
> +
> +	ret = qcom_ec_thermal_capabilities(dev);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to read thermal capabilities\n");
> +
> +	if (ec->thermal_cap.fan_cnt == 0) {
> +		dev_warn(dev, FW_BUG "Failed to get fan count, firmware update required\n");
> +		return 0;
> +	}
> +
> +	ec->ec_cdev = devm_kcalloc(dev, ec->thermal_cap.fan_cnt, sizeof(*ec->ec_cdev), GFP_KERNEL);
> +	if (!ec->ec_cdev)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < ec->thermal_cap.fan_cnt; i++) {
> +		struct qcom_ec_cooling_dev *ec_cdev = &ec->ec_cdev[i];
> +		char name[EC_FAN_NAME_SIZE];
> +
> +		scnprintf(name, sizeof(name), "qcom_ec_fan_%u", i);
> +		ec_cdev->fan_id = i + 1;
> +		ec_cdev->parent_dev = dev;
> +
> +		ec_cdev->cdev = devm_thermal_of_cooling_device_register(dev, NULL, name, ec_cdev,
> +									&qcom_ec_thermal_ops);
> +		if (IS_ERR(ec_cdev->cdev)) {
> +			return dev_err_probe(dev, PTR_ERR(ec_cdev->cdev),
> +					     "Failed to register fan%d cooling device\n", i);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static void qcom_ec_remove(struct i2c_client *client)
> +{
> +	struct qcom_ec *ec = i2c_get_clientdata(client);
> +	struct device *dev = &client->dev;
> +	int ret;
> +
> +	ret = qcom_ec_sci_evt_control(dev, false);
> +	if (ret < 0)
> +		dev_err(dev, "Failed to disable SCI events: %d\n", ret);
> +
> +	for (int i = 0; i < ec->thermal_cap.fan_cnt; i++) {
> +		struct qcom_ec_cooling_dev *ec_cdev = &ec->ec_cdev[i];
> +
> +		qcom_ec_fan_debug_mode_off(ec_cdev);
> +	}
> +}
> +
> +static const struct of_device_id qcom_ec_of_match[] = {
> +	{ .compatible = "qcom,hamoa-crd-ec" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, qcom_ec_of_match);
> +
> +static const struct i2c_device_id qcom_ec_i2c_id_table[] = {
> +	{ "qcom-hamoa-ec", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, qcom_ec_i2c_id_table);
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(qcom_ec_pm_ops,
> +		qcom_ec_suspend,
> +		qcom_ec_resume);
> +
> +static struct i2c_driver qcom_ec_i2c_driver = {
> +	.driver = {
> +		.name = "qcom-hamoa-ec",
> +		.of_match_table = qcom_ec_of_match,
> +		.pm = &qcom_ec_pm_ops
> +	},
> +	.probe = qcom_ec_probe,
> +	.remove = qcom_ec_remove,
> +	.id_table = qcom_ec_i2c_id_table,
> +};
> +module_i2c_driver(qcom_ec_i2c_driver);
> +
> +MODULE_DESCRIPTION("QCOM Hamoa Embedded Controller");
> +MODULE_LICENSE("GPL");
> 

