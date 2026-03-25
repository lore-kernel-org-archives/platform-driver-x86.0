Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98843CF042
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 11:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774438882; cv=none; b=AnekXtRQYhCR8KhbWmXTSdjxDON1Ha79BN7f2jSPO5vnMUAF0DloqpTfY1IhmrMb6xKlkXkPDl1Qdp5ispwU0Zqf7Fsqk8JVwsZUTHlxc9PI8uaWOqhDnJdvJruRQWLv0MKgfaKHDy4L4dbf1cX/55O8DsGNa9LLQZ+83pnYWfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774438882; c=relaxed/simple;
	bh=nE2GCbN01q0fOzAfeXn3J/JUvfk00klvT4yMoxZNSrM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V+xua3/TNwPlJSlGqKGt0VOTofh/3k1khnJMuPJ210aG5fZGAXGif01KpUR4FEWfZaKpEiPuzLAZv+mPgNweYafbTpmq65k0YRxhuMK7QgzBDzxwkN3eZUZNjtgch73apLV1cyMY79ZToqjGZABhUQlRQaBE6Ptj5U0iAHtLbLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XdlJx+gY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jLqBfUhY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XdlJx+gY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jLqBfUhY"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBFuKe720209
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 11:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MoSa/6BdZGUBXj8JaOkd73kwYLa6INX6WcFBWb8rb/k=; b=XdlJx+gYWlqMr0kD
	IJRvHA29Kkj1l+t0wG39JSAFhsoc02YFbLpUBKuzhqtujzeQ4XWscvFNOfGd4s+B
	nNAwHORZZVQ50IS4NohXF6GQ8/G7F6PQ3Az/lvtDl8TM+YvQPzpRYR6dCsXuPH+l
	n9Ul5PM9W929INRjRB6P8rjiIahvm+KTS1TGAtJUXhD1/CBeiH1ztqcdF6S9/5nE
	0Yzl27fAWWWEpIuhejXG3jZVU1IBTfxbP4Okw4dPGMI6Gzslfhjdp40j9mQ2Tioj
	bAuEtnAbFlDQf/oVcF5sra8CIeBXmlcrb1VzUX5soodocD+m3dFJrhgd6275GTcv
	GTKtbg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dm2rb90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 11:41:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aecfe69196so83856605ad.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 04:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774438879; x=1775043679; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MoSa/6BdZGUBXj8JaOkd73kwYLa6INX6WcFBWb8rb/k=;
        b=jLqBfUhY2Tic4agcXb6lQtQrBUfPXhSmPJ2E8mRc6gSKlm+MW8HZ12Z3tWolNl3Rbs
         /5apIHz/dlie95aEu67b2vrigijnHy6dFS2GCREz3T1BUXQgXtCn48kixcmobMf+sx/0
         ukid5DlcfImf/KujtrW1xzRZgWk0BNW1Xtax2/1yvoB+mq5D1+EgDRmKyHYnabThv0sk
         HDrgbJQPSbEjhLeTUQ1Vg9icZ3qpVHiAKhj/K6YblvICiR6NLlABEjc3aOG4nY4A4RU6
         Nn5GFfDim3lorxhO+3s61X1b0lkTedn6ah4HJxz1bk83u3jl2Ocd0ZKjIiSxfTw5SRCm
         yNmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438879; x=1775043679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MoSa/6BdZGUBXj8JaOkd73kwYLa6INX6WcFBWb8rb/k=;
        b=DsQhWVT8ztzLfgSe0bpsbs/nDDmjL6tRom8wkt6KamYLcGygNg73W/deJcd1PrXoeo
         siTyB4hATCjs6+Bi6410saHpIckzCBq4NCFqe6A+rfoKGCMkas4Cc8VoCaAWSXPwzNYZ
         0fbf67C97a8ay4LdCT0Lr37bLN1JCB7EBMFZXnN/3GXfHdkUGnbTh61MXJP/PTx1ulJz
         L+xw8RD346zGmbUPbQ/7o87DFswt0nC1dLdSTInqOMsB/au01S6F3QewC888Q6r80+VD
         gcWrsAhsW3KrBOiva8k3TR0n4jqZgesUcBapN+YAqTkbx2L262ZYhJphwmX0N2xkvtdH
         kErg==
X-Forwarded-Encrypted: i=1; AJvYcCX6g69jGag0k0NfBSaS+ke6p6vZeeCkHBxtqHKNbJTcJiB7aK937q0YRpddmqVcWYqSzgE9dAWD8PtSnfZhsQ2Bx/u+@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/w7HirhmIslMF3YZK6eNFGmG8X5DjXhnBIJAtFgtlZylL0mIV
	MlAq0V/+sdu1qpAJpJHmfYkWBCNpkbN+WWvavcidzr0eN0DcW7F9T2x+LoyknrxYTLG7gKre8l9
	PnelFzLdyDCKGFqmEkhHmmSJOFwxXr0AgmLrfc7YcsuOmdbyyMdCXcfFEcva8hvaa+p6ova3yUN
	mV
X-Gm-Gg: ATEYQzxaq/x1wKRdQMsmCm7WD7K9L+RRRBZqvZtuDEw+oxXS6b83LhnzuiCF1y0Vvah
	viB8GNWjEsssnBVEzY8f2RYnekxBsykdl2uTufVj/890YtblhwG2ukjA4v0TxF3IRidrVEpXkaO
	GmhLoNxJi3d+bDWq0htseqXCqpHsU0HYoL4V2DxCECz0EF+k/3OHAOWA7gHgkLRc1xPhreMviqt
	agp6J+2Xk/SFG1ua9bChWqb8H4FlbUC+mGuUD7FBinZNQq59sU6D9ewhGP2g/7raGKf76hYPmX6
	3nlILsrU1yX6CMSFdqW5ZRESW4I9fkNtRX/eFNvjmfbNxP/434m43DlfAT2oS08xeywBWs3WqmN
	h64f587p0hJ3VY+lS+GPl3sjTcoVHMW6BRXT9RrfLZeOI3Km0CHinFWTeZSbX5U1eDmBkjsSsEG
	hzr6a204mB7NOBzgoOgetckF2BMSrmmmdbJQ==
X-Received: by 2002:a17:902:ccc4:b0:2b0:571f:6f09 with SMTP id d9443c01a7336-2b0b0b5f6f5mr31333025ad.44.1774438879099;
        Wed, 25 Mar 2026 04:41:19 -0700 (PDT)
X-Received: by 2002:a17:902:ccc4:b0:2b0:571f:6f09 with SMTP id d9443c01a7336-2b0b0b5f6f5mr31332705ad.44.1774438878546;
        Wed, 25 Mar 2026 04:41:18 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0ae360d4bsm38152015ad.16.2026.03.25.04.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:41:18 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 17:09:52 +0530
Subject: [PATCH v6 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-add-driver-for-ec-v6-2-a8e888d09f0f@oss.qualcomm.com>
References: <20260325-add-driver-for-ec-v6-0-a8e888d09f0f@oss.qualcomm.com>
In-Reply-To: <20260325-add-driver-for-ec-v6-0-a8e888d09f0f@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774438862; l=17298;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=Y9BH/Cn+pJk6z5oN3AVBuPO1k8yg1iF2MnFDzBi0sAM=;
 b=8bGLRXhbqn0YqpmLaywy0kmfmL6rMZvMl9Ghiq+YHn0Uvnh32fRjyV5xe7L1dFvkxebe5kb33
 V57jBh1DPeyA7/UkWhn6R214Gzbwm9S7sWLzev7tLhbbgESdCxNmoNY
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4MyBTYWx0ZWRfX0vpNluIHVzCE
 tPxwbp2hH/VwbGyofp1F61qZmUyBmdMGRH+Q4BlFnaLziwARa3TWqjLbEe8/pqeYk4OB11fAB/Q
 9oIcMaPY4ZEfgVu2+lnybP0lTQV3bNymj8CB8kNnTsZKPnqhHHQa5Qgn5DANX8dXhrXYt4zioEs
 3W/7e+8rEq7Q9CdxLyV1GAj5R9to8tNeqwTebrZpaXWhiPLlCtlcXZbaF2vOGm7IWOXeRmGRc32
 Q9iKQJnaTPoJRRbGyWfJEhXJg+mkHPm1eatL+DtKixEdx/z+wGtFYL+i5wQqOMMPW+BMEC/X7ZG
 62AhoBCT/Ix3mLTlRFksZlYnIHMZhLwGBTrATEWUsi9CIHg3iYlm47YnyMHfEa4SrNubV/AEa7x
 R0POuPeDmtm4vdAnlRp7qvvzno0w1cBSWhKy2RYuOR0khMzQrthb/YVLHlAVWVdj2AZ/hFZfolJ
 +YNySqaeIldKjNyTDlg==
X-Proofpoint-GUID: rwzMmBGE6zA_AZZnxX4587bEoF-gWMuQ
X-Authority-Analysis: v=2.4 cv=Fo0IPmrq c=1 sm=1 tr=0 ts=69c3c9e0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=E2FcRaxJAAAA:8
 a=ZZkxa-lhXBFmNfqa1H8A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=Yev8HTsh1NrKSfoOyGCL:22
X-Proofpoint-ORIG-GUID: rwzMmBGE6zA_AZZnxX4587bEoF-gWMuQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250083

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
reference boards. It handles fan control, temperature sensors, access
to EC state changes and supports reporting suspend entry/exit to the
EC.

Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 MAINTAINERS                            |   8 +
 drivers/platform/arm64/Kconfig         |  12 +
 drivers/platform/arm64/Makefile        |   1 +
 drivers/platform/arm64/qcom-hamoa-ec.c | 451 +++++++++++++++++++++++++++++++++
 4 files changed, 472 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 30ca84404976..bcd7b0729ab7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22001,6 +22001,14 @@ S:	Supported
 W:	https://wireless.wiki.kernel.org/en/users/Drivers/wcn36xx
 F:	drivers/net/wireless/ath/wcn36xx/
 
+QUALCOMM HAMOA EMBEDDED CONTROLLER DRIVER
+M:	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
+M:	Anvesh Jain P <anvesh.p@oss.qualcomm.com>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml
+F:	drivers/platform/arm64/qcom-hamoa-ec.c
+
 QUANTENNA QTNFMAC WIRELESS DRIVER
 M:	Igor Mitsyanko <imitsyanko@quantenna.com>
 R:	Sergey Matyukevich <geomatsi@gmail.com>
diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
index 10f905d7d6bf..025cdf091f9e 100644
--- a/drivers/platform/arm64/Kconfig
+++ b/drivers/platform/arm64/Kconfig
@@ -90,4 +90,16 @@ config EC_LENOVO_THINKPAD_T14S
 
 	  Say M or Y here to include this support.
 
+config EC_QCOM_HAMOA
+	tristate "Embedded Controller driver for Qualcomm Hamoa/Glymur reference devices"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on I2C
+	help
+	  Say M or Y here to enable the Embedded Controller driver for Qualcomm
+	  Snapdragon-based Hamoa/Glymur reference devices. The driver handles fan
+	  control, temperature sensors, access to EC state changes and supports
+	  reporting suspend entry/exit to the EC.
+
+	  This driver currently supports Hamoa/Purwa/Glymur reference devices.
+
 endif # ARM64_PLATFORM_DEVICES
diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Makefile
index 60c131cff6a1..7681be4a46e9 100644
--- a/drivers/platform/arm64/Makefile
+++ b/drivers/platform/arm64/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_EC_ACER_ASPIRE1)	+= acer-aspire1-ec.o
 obj-$(CONFIG_EC_HUAWEI_GAOKUN)	+= huawei-gaokun-ec.o
 obj-$(CONFIG_EC_LENOVO_YOGA_C630) += lenovo-yoga-c630.o
 obj-$(CONFIG_EC_LENOVO_THINKPAD_T14S) += lenovo-thinkpad-t14s.o
+obj-$(CONFIG_EC_QCOM_HAMOA) += qcom-hamoa-ec.o
diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
new file mode 100644
index 000000000000..0f883130ac9a
--- /dev/null
+++ b/drivers/platform/arm64/qcom-hamoa-ec.c
@@ -0,0 +1,451 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024 Maya Matuszczyk <maccraft123mc@gmail.com>
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/pm.h>
+#include <linux/slab.h>
+#include <linux/thermal.h>
+
+#define EC_SCI_EVT_READ_CMD	0x05
+#define EC_FW_VERSION_CMD	0x0e
+#define EC_MODERN_STANDBY_CMD	0x23
+#define EC_FAN_DBG_CONTROL_CMD	0x30
+#define EC_SCI_EVT_CONTROL_CMD	0x35
+#define EC_THERMAL_CAP_CMD	0x42
+
+#define EC_FW_VERSION_RESP_LEN	4
+#define EC_THERMAL_CAP_RESP_LEN	3
+#define EC_FAN_DEBUG_CMD_LEN	6
+#define EC_FAN_SPEED_DATA_SIZE	4
+
+#define EC_MODERN_STANDBY_ENTER	0x01
+#define EC_MODERN_STANDBY_EXIT	0x00
+
+#define EC_FAN_DEBUG_MODE_OFF   0
+#define EC_FAN_DEBUG_MODE_ON    BIT(0)
+#define EC_FAN_ON               BIT(1)
+#define EC_FAN_DEBUG_TYPE_PWM   BIT(2)
+#define EC_MAX_FAN_CNT		2
+#define EC_FAN_NAME_SIZE	20
+#define EC_FAN_MAX_PWM		255
+
+enum qcom_ec_sci_events {
+	EC_FAN1_STATUS_CHANGE_EVT = 0x30,
+	EC_FAN2_STATUS_CHANGE_EVT,
+	EC_FAN1_SPEED_CHANGE_EVT,
+	EC_FAN2_SPEED_CHANGE_EVT,
+	EC_NEW_LUT_SET_EVT,
+	EC_FAN_PROFILE_SWITCH_EVT,
+	EC_THERMISTOR_1_THRESHOLD_CROSS_EVT,
+	EC_THERMISTOR_2_THRESHOLD_CROSS_EVT,
+	EC_THERMISTOR_3_THRESHOLD_CROSS_EVT,
+	/* Reserved: 0x39 - 0x3c/0x3f */
+	EC_RECOVERED_FROM_RESET_EVT = 0x3d,
+};
+
+struct qcom_ec_version {
+	u8 main_version;
+	u8 sub_version;
+	u8 test_version;
+};
+
+struct qcom_ec_thermal_cap {
+#define EC_THERMAL_FAN_CNT(x)		(FIELD_GET(GENMASK(1, 0), (x)))
+#define EC_THERMAL_FAN_TYPE(x)		(FIELD_GET(GENMASK(4, 2), (x)))
+#define EC_THERMAL_THERMISTOR_MASK(x)	(FIELD_GET(GENMASK(7, 0), (x)))
+	u8 fan_cnt;
+	u8 fan_type;
+	u8 thermistor_mask;
+};
+
+struct qcom_ec_cooling_dev {
+	struct thermal_cooling_device *cdev;
+	struct device *parent_dev;
+	u8 fan_id;
+	u8 state;
+};
+
+struct qcom_ec {
+	struct qcom_ec_cooling_dev *ec_cdev;
+	struct qcom_ec_thermal_cap thermal_cap;
+	struct qcom_ec_version version;
+	struct i2c_client *client;
+};
+
+static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, u8 resp_len, u8 *resp)
+{
+	int ret;
+
+	ret = i2c_smbus_read_i2c_block_data(ec->client, cmd, resp_len, resp);
+
+	if (ret < 0)
+		return ret;
+	else if (ret == 0 || ret == 0xff)
+		return -EOPNOTSUPP;
+
+	if (resp[0] >= resp_len)
+		return -EINVAL;
+
+	return 0;
+}
+
+/*
+ * EC Device Firmware Version:
+ *
+ * Read Response:
+ * ----------------------------------------------------------------------
+ * | Offset	| Name		| Description				|
+ * ----------------------------------------------------------------------
+ * | 0x00	| Byte count	| Number of bytes in response		|
+ * |		|		| (excluding byte count)		|
+ * ----------------------------------------------------------------------
+ * | 0x01	| Test-version	| Test-version of EC firmware		|
+ * ----------------------------------------------------------------------
+ * | 0x02	| Sub-version	| Sub-version of EC firmware		|
+ * ----------------------------------------------------------------------
+ * | 0x03	| Main-version	| Main-version of EC firmware		|
+ * ----------------------------------------------------------------------
+ *
+ */
+static int qcom_ec_read_fw_version(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct qcom_ec *ec = i2c_get_clientdata(client);
+	struct qcom_ec_version *version = &ec->version;
+	u8 resp[EC_FW_VERSION_RESP_LEN];
+	int ret;
+
+	ret = qcom_ec_read(ec, EC_FW_VERSION_CMD, EC_FW_VERSION_RESP_LEN, resp);
+	if (ret < 0)
+		return ret;
+
+	version->main_version = resp[3];
+	version->sub_version = resp[2];
+	version->test_version = resp[1];
+
+	dev_dbg(dev, "EC Version %d.%d.%d\n",
+		version->main_version, version->sub_version, version->test_version);
+
+	return 0;
+}
+
+/*
+ * EC Device Thermal Capabilities:
+ *
+ * Read Response:
+ * ------------------------------------------------------------------------------
+ * | Offset		| Name		| Description				|
+ * ------------------------------------------------------------------------------
+ * | 0x00		| Byte count	| Number of bytes in response		|
+ * |			|		| (excluding byte count)		|
+ * ------------------------------------------------------------------------------
+ * | 0x02 (LSB)	| EC Thermal	| Bit 0-1: Number of fans		|
+ * | 0x3		| Capabilities	| Bit 2-4: Type of fan			|
+ * |			|		| Bit 5-6: Reserved			|
+ * |			|		| Bit 7: Data Valid/Invalid		|
+ * |			|		|	 (Valid - 1, Invalid - 0)	|
+ * |			|		| Bit 8-15: Thermistor 0 - 7 presence	|
+ * |			|		|	    (1 present, 0 absent)	|
+ * ------------------------------------------------------------------------------
+ *
+ */
+static int qcom_ec_thermal_capabilities(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct qcom_ec *ec = i2c_get_clientdata(client);
+	struct qcom_ec_thermal_cap *cap = &ec->thermal_cap;
+	u8 resp[EC_THERMAL_CAP_RESP_LEN];
+	int ret;
+
+	ret = qcom_ec_read(ec, EC_THERMAL_CAP_CMD, EC_THERMAL_CAP_RESP_LEN, resp);
+	if (ret < 0)
+		return ret;
+
+	cap->fan_cnt = min(EC_MAX_FAN_CNT, EC_THERMAL_FAN_CNT(resp[1]));
+	cap->fan_type = EC_THERMAL_FAN_TYPE(resp[1]);
+	cap->thermistor_mask = EC_THERMAL_THERMISTOR_MASK(resp[2]);
+
+	dev_dbg(dev, "Fan count: %d Fan Type: %d Thermistor Mask: %x\n",
+		cap->fan_cnt, cap->fan_type, cap->thermistor_mask);
+
+	return 0;
+}
+
+static irqreturn_t qcom_ec_irq(int irq, void *data)
+{
+	struct qcom_ec *ec = data;
+	struct device *dev = &ec->client->dev;
+	int val;
+
+	val = i2c_smbus_read_byte_data(ec->client, EC_SCI_EVT_READ_CMD);
+	if (val < 0) {
+		dev_err_ratelimited(dev, "Failed to read EC SCI Event: %d\n", val);
+		return IRQ_HANDLED;
+	}
+
+	switch (val) {
+	case EC_FAN1_STATUS_CHANGE_EVT:
+		dev_dbg_ratelimited(dev, "Fan1 status changed\n");
+		break;
+	case EC_FAN2_STATUS_CHANGE_EVT:
+		dev_dbg_ratelimited(dev, "Fan2 status changed\n");
+		break;
+	case EC_FAN1_SPEED_CHANGE_EVT:
+		dev_dbg_ratelimited(dev, "Fan1 speed crossed low/high trip point\n");
+		break;
+	case EC_FAN2_SPEED_CHANGE_EVT:
+		dev_dbg_ratelimited(dev, "Fan2 speed crossed low/high trip point\n");
+		break;
+	case EC_NEW_LUT_SET_EVT:
+		dev_dbg_ratelimited(dev, "New LUT set\n");
+		break;
+	case EC_FAN_PROFILE_SWITCH_EVT:
+		dev_dbg_ratelimited(dev, "FAN Profile switched\n");
+		break;
+	case EC_THERMISTOR_1_THRESHOLD_CROSS_EVT:
+		dev_dbg_ratelimited(dev, "Thermistor 1 threshold crossed\n");
+		break;
+	case EC_THERMISTOR_2_THRESHOLD_CROSS_EVT:
+		dev_dbg_ratelimited(dev, "Thermistor 2 threshold crossed\n");
+		break;
+	case EC_THERMISTOR_3_THRESHOLD_CROSS_EVT:
+		dev_dbg_ratelimited(dev, "Thermistor 3 threshold crossed\n");
+		break;
+	case EC_RECOVERED_FROM_RESET_EVT:
+		dev_dbg_ratelimited(dev, "EC recovered from reset\n");
+		break;
+	default:
+		dev_notice_ratelimited(dev, "Unknown EC event: %d\n", val);
+		break;
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int qcom_ec_sci_evt_control(struct device *dev, bool enable)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+
+	return i2c_smbus_write_byte_data(client, EC_SCI_EVT_CONTROL_CMD, !!enable);
+}
+
+static int qcom_ec_fan_get_max_state(struct thermal_cooling_device *cdev, unsigned long *state)
+{
+	*state = EC_FAN_MAX_PWM;
+
+	return 0;
+}
+
+static int qcom_ec_fan_get_cur_state(struct thermal_cooling_device *cdev, unsigned long *state)
+{
+	struct qcom_ec_cooling_dev *ec_cdev = cdev->devdata;
+
+	*state = ec_cdev->state;
+
+	return 0;
+}
+
+/*
+ * Fan Debug control command:
+ *
+ * Command Payload:
+ * --------------------------------------------------------------------------------------
+ * | Offset		| Name		| Description					|
+ * --------------------------------------------------------------------------------------
+ * | 0x00		| Command	| Fan control command				|
+ * --------------------------------------------------------------------------------------
+ * | 0x01		| Fan ID	| 0x1 : Fan 1					|
+ * |			|		| 0x2 : Fan 2					|
+ * --------------------------------------------------------------------------------------
+ * | 0x02		| Byte count = 4| Size of data to set fan speed			|
+ * --------------------------------------------------------------------------------------
+ * | 0x03		| Mode		| Bit 0: Debug Mode On/Off (0 - OFF, 1 - ON )	|
+ * |			|		| Bit 1: Fan On/Off (0 - Off, 1 - ON)		|
+ * |			|		| Bit 2: Debug Type (0 - RPM, 1 - PWM)		|
+ * --------------------------------------------------------------------------------------
+ * | 0x04 (LSB)	| Speed in RPM	| RPM value, if mode selected is RPM		|
+ * | 0x05		|		|						|
+ * --------------------------------------------------------------------------------------
+ * | 0x06		| Speed in PWM	| PWM value, if mode selected is PWM (0 - 255)	|
+ * ______________________________________________________________________________________
+ *
+ */
+static int qcom_ec_fan_debug_mode_off(struct qcom_ec_cooling_dev *ec_cdev)
+{
+	struct device *dev = ec_cdev->parent_dev;
+	struct i2c_client *client = to_i2c_client(dev);
+	u8 request[6] = { ec_cdev->fan_id, EC_FAN_SPEED_DATA_SIZE,
+			  EC_FAN_DEBUG_MODE_OFF, 0, 0, 0 };
+	int ret;
+
+	ret = i2c_smbus_write_i2c_block_data(client, EC_FAN_DBG_CONTROL_CMD,
+					     sizeof(request), request);
+	if (ret) {
+		dev_err(dev, "Failed to turn off fan%d debug mode: %d\n",
+			ec_cdev->fan_id, ret);
+	}
+
+	return ret;
+}
+
+static int qcom_ec_fan_set_cur_state(struct thermal_cooling_device *cdev, unsigned long state)
+{
+	struct qcom_ec_cooling_dev *ec_cdev = cdev->devdata;
+	struct device *dev = ec_cdev->parent_dev;
+	struct i2c_client *client = to_i2c_client(dev);
+	u8 request[6] = { ec_cdev->fan_id, EC_FAN_SPEED_DATA_SIZE,
+			  EC_FAN_DEBUG_MODE_ON | EC_FAN_ON | EC_FAN_DEBUG_TYPE_PWM,
+			  0, 0, state };
+	int ret;
+
+	ret = i2c_smbus_write_i2c_block_data(client, EC_FAN_DBG_CONTROL_CMD,
+					     sizeof(request), request);
+	if (ret) {
+		dev_err(dev, "Failed to set fan pwm: %d\n", ret);
+		return ret;
+	}
+
+	ec_cdev->state = state;
+
+	return 0;
+}
+
+static const struct thermal_cooling_device_ops qcom_ec_thermal_ops = {
+	.get_max_state = qcom_ec_fan_get_max_state,
+	.get_cur_state = qcom_ec_fan_get_cur_state,
+	.set_cur_state = qcom_ec_fan_set_cur_state,
+};
+
+static int qcom_ec_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+
+	return i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
+					 EC_MODERN_STANDBY_ENTER);
+}
+
+static int qcom_ec_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+
+	return i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
+					 EC_MODERN_STANDBY_EXIT);
+}
+
+static int qcom_ec_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct qcom_ec *ec;
+	unsigned int i;
+	int ret;
+
+	ec = devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
+	if (!ec)
+		return -ENOMEM;
+
+	ec->client = client;
+
+	ret = devm_request_threaded_irq(dev, client->irq, NULL, qcom_ec_irq,
+					IRQF_ONESHOT, "qcom_ec", ec);
+	if (ret < 0)
+		return ret;
+
+	i2c_set_clientdata(client, ec);
+
+	ret = qcom_ec_read_fw_version(dev);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to read EC firmware version\n");
+
+	ret = qcom_ec_sci_evt_control(dev, true);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to enable SCI events\n");
+
+	ret = qcom_ec_thermal_capabilities(dev);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to read thermal capabilities\n");
+
+	if (ec->thermal_cap.fan_cnt == 0) {
+		dev_warn(dev, FW_BUG "Failed to get fan count, firmware update required\n");
+		return 0;
+	}
+
+	ec->ec_cdev = devm_kcalloc(dev, ec->thermal_cap.fan_cnt, sizeof(*ec->ec_cdev), GFP_KERNEL);
+	if (!ec->ec_cdev)
+		return -ENOMEM;
+
+	for (i = 0; i < ec->thermal_cap.fan_cnt; i++) {
+		struct qcom_ec_cooling_dev *ec_cdev = &ec->ec_cdev[i];
+		char name[EC_FAN_NAME_SIZE];
+
+		scnprintf(name, sizeof(name), "qcom_ec_fan_%u", i);
+		ec_cdev->fan_id = i + 1;
+		ec_cdev->parent_dev = dev;
+
+		ec_cdev->cdev = devm_thermal_of_cooling_device_register(dev, NULL, name, ec_cdev,
+									&qcom_ec_thermal_ops);
+		if (IS_ERR(ec_cdev->cdev)) {
+			return dev_err_probe(dev, PTR_ERR(ec_cdev->cdev),
+					     "Failed to register fan%d cooling device\n", i);
+		}
+	}
+
+	return 0;
+}
+
+static void qcom_ec_remove(struct i2c_client *client)
+{
+	struct qcom_ec *ec = i2c_get_clientdata(client);
+	struct device *dev = &client->dev;
+	int ret;
+
+	ret = qcom_ec_sci_evt_control(dev, false);
+	if (ret < 0)
+		dev_err(dev, "Failed to disable SCI events: %d\n", ret);
+
+	for (int i = 0; i < ec->thermal_cap.fan_cnt; i++) {
+		struct qcom_ec_cooling_dev *ec_cdev = &ec->ec_cdev[i];
+
+		qcom_ec_fan_debug_mode_off(ec_cdev);
+	}
+}
+
+static const struct of_device_id qcom_ec_of_match[] = {
+	{ .compatible = "qcom,hamoa-crd-ec" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, qcom_ec_of_match);
+
+static const struct i2c_device_id qcom_ec_i2c_id_table[] = {
+	{ "qcom-hamoa-ec", },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, qcom_ec_i2c_id_table);
+
+static DEFINE_SIMPLE_DEV_PM_OPS(qcom_ec_pm_ops,
+		qcom_ec_suspend,
+		qcom_ec_resume);
+
+static struct i2c_driver qcom_ec_i2c_driver = {
+	.driver = {
+		.name = "qcom-hamoa-ec",
+		.of_match_table = qcom_ec_of_match,
+		.pm = &qcom_ec_pm_ops
+	},
+	.probe = qcom_ec_probe,
+	.remove = qcom_ec_remove,
+	.id_table = qcom_ec_i2c_id_table,
+};
+module_i2c_driver(qcom_ec_i2c_driver);
+
+MODULE_DESCRIPTION("QCOM Hamoa Embedded Controller");
+MODULE_LICENSE("GPL");

-- 
2.34.1

