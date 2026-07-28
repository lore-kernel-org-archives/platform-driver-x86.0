Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2AA3B27CF
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 17:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785260734; cv=none; b=tCFUFzURvh3nqKB2RJbVwVaEt9EwAqG5y5Nt1tWlpI2DxrqfVaxLKNmPBslAZrU5sDOA9o9Bk4Hfv1S+0Lu0UHUinVvTnr78TTcFVdB8KiyL+zj8YFpKwSpyBfUd27Pwbs0vcyurGBmQDSmTEyoPWHD1FGSfVv5uPYHJ+J/31+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785260734; c=relaxed/simple;
	bh=SX/Yh22C58hRkGq2jF5mLznKqXNndZ+1f7fceacWOdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H2vHU+NwCUjKSmrBK0T8tzjIdXGRtk48udFK7HBlOdr0C8twhx+PiB3tmycw0gKCV4V4sP8tE1idepuivmsrBZbk6cnFeVNVGrJG2eRwsS1Let9eEgZ42CDxCdAuoFuHobv7g6qU3j280iJf3g8cgHA1OYp2d9UmFyTQCoqoVng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cOOVxG17; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HlkhNO51; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cOOVxG17";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HlkhNO51"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SHc0fD3885012
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 17:45:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PBmSA5vaTa4NBromFjRMv7g8xNHdvGrFm3nvdRmx6SU=; b=cOOVxG179KAxCRUH
	7aX+RPhhS07XLoExrrtuSfqjicCQRY8yhlMod3MbUip07m6xok0zcjJaZocCNcrT
	PHpn1C5O923v9NwZ91hyM3V8w0Som8Dp48k9IXjKpnC07JKQ0WOtPYA7xZYaS+Ac
	TMASofUC/0sbt3ellNRJp/IHJAO0Hk7C+GmIo5voe7MgV0Pl7AuT6n0vPkwuk2we
	nJJ5toNE/Ebz6BiW0CaGva5/6SrGKPf1Yz49pHNzp9P/AATI0ULGFgGazKgjXNW0
	pu9oSAe1Vt7+lD4a2A9nrcmG1OFsFlzZ4e9z/6sTNb4LTgkVxfGxdNqixT4G7ekr
	hoVOtw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq108r131-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 17:45:30 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb6dd278512so3128a12.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 10:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785260730; x=1785865530; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PBmSA5vaTa4NBromFjRMv7g8xNHdvGrFm3nvdRmx6SU=;
        b=HlkhNO51ld7aP1EMt6mjZ4sfHICA5P98P6k/mobLXO9RB6gsG0KO9qyIuVwDWlroB8
         2lwzgIktaKkmXLO+GdZlDj1VIdAB0sp81RFqFfYDIdqlutJfqhRXHGCqDQzfVCgBU7QZ
         wK3i5C/8/Brk0hk6OxAOtV21O47YJufDTkZX53ikUL6M8ZVcLRDCsUhPnWVrnsobqoRz
         5emoijIDT3BkmGFT9PJ4eTeAmOyhy0RdyxrJcJ/1pGFh/LFVaqY0WS+PHyYwpieL5KEM
         d0cX3hdPS3ndcf0KG8RId7kWH7i4el1bMs6BCcLIF4QvK8Ev1AC1ppps606nXK0aTKaS
         4Q7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785260730; x=1785865530;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PBmSA5vaTa4NBromFjRMv7g8xNHdvGrFm3nvdRmx6SU=;
        b=ihkeVfpGsQbfvxvNJVX7RjC+5HFw8gUxMVAMDOG2twTCAJI+XhPzKjfM7cwWUPIvjE
         mvJO1Kq0fz7n2Hvx0/IzdvIC9Pd0zCOWV2a5WLD3lK/4EIqB8CmKm3VuQfP3scC7Ab23
         qBO/6EtrD2QZq8FlEqkI89yRSirStYw2qh9PYXx+5T06kaSF1nCOEgVahPs9eZ/mcTc6
         HDNkF2vxRbjQYhocnv4h/nLgwFHfJX0rrc5SJ9Q5Ycsq6ZCHkgOzHGnUsxm+bE/IzrfK
         flxs5UmsMp2KijcwmPGOh3UgrkhdeKcHn9qgBDAqs4fJkuidJQ50RlZPTuYgrZAKf0bH
         mA4A==
X-Forwarded-Encrypted: i=1; AHgh+RqOBZpszZ2NYWWjqak81uLnGtE84tBMQbCsQFqFRhI9BgnmphmbCAdrfL1RvQqw7eZNRFiHpkJUiM6Bl6HYAxQOWCpg@vger.kernel.org
X-Gm-Message-State: AOJu0YxcsMSOuBh8TxTfgV7zBD8L0w/yt+PxkBVZsWxX0xfhy8ULbn3l
	d/Ix2U6Zdgb7CXlXHibYjRSLqQF0AAxPOd7VMrhvQHrGMqehHrPWpuZHHiB6RzszeoVrP4My/FI
	yviaapZJlkunn+EDilcfAZSOIxY+CUSe1O+OdRviSISUPpLyPbt0eabG1Ad3VGnY/ApY6mdab96
	Nl
X-Gm-Gg: AR+sD11mg/PbSMAGHXzgIZRHIicxWbYhrEHnhGoP9Zz+iO2WV6fHVWiQvPRk9NU6nMt
	zLAPgIQ+BectfBbrooblr4jl3R7AnsRjctd2gQDWfG1RAGLwnDqwkx3D87B+3Qjmdved0oE5hmn
	rw8Ubora6Ueb/kpGPrwow9hcnhifC4968bZPW3refidwe/qJ20tI2gqWs+oZhbsBcUCVJ2aJtDa
	A8v07n13fVgQfJP8dI+nJVBUM/7xDm7avvdJYfVMdZJW78M+DaBfEwYTT8YJiw35Lgbwc2j1vFT
	sy9UuuNhNFU75cezyKMRmx9B9TeWIrjgmmtKNzIa1q1zn39GExPRtqGru1aGqcMQx1/Q6Mr8GOM
	mKCVUMlohWsczLycQ/g3jkMSMsP+XZXD5NKth7TgRQSAjt3cOr8u8A1LARcfYXZxisplQbqiMaH
	odr1OOZnF7StCw
X-Received: by 2002:a05:6a20:4322:b0:3b3:2703:110 with SMTP id adf61e73a8af0-3c8aafb77b7mr4181841637.4.1785260729403;
        Tue, 28 Jul 2026 10:45:29 -0700 (PDT)
X-Received: by 2002:a05:6a20:4322:b0:3b3:2703:110 with SMTP id adf61e73a8af0-3c8aafb77b7mr4181800637.4.1785260728765;
        Tue, 28 Jul 2026 10:45:28 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7273cd9esm749553c88.13.2026.07.28.10.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 10:45:28 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 23:14:32 +0530
Subject: [PATCH 4/8] platform: arm64: qcom-hamoa-ec: Add fan RPM query and
 LUT calibration
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-ec_add_more_commands-v1-4-771abd65ee1a@oss.qualcomm.com>
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
In-Reply-To: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785260700; l=26462;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=SX/Yh22C58hRkGq2jF5mLznKqXNndZ+1f7fceacWOdg=;
 b=z6UnDS1Tos/lOsuc2dlsN6sbsLJxxlE13PlPQdJy6Lb2pnk5X4phxqaW4bv9H+mX8xBfWem5Y
 u9UoU0RE4/qDW+618aJZYCik+pEzGz0x1N+eWKATuimRSlNqWD0fW0q
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-ORIG-GUID: 24qikVdA2xQSrbCxU9VXtcTKOpE3ayKt
X-Authority-Analysis: v=2.4 cv=fufsol4f c=1 sm=1 tr=0 ts=6a68eaba cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=bJJoA3EV-GMqZMMsUvwA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 24qikVdA2xQSrbCxU9VXtcTKOpE3ayKt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDE1NiBTYWx0ZWRfXwrycFMgVqzQ5
 yVCBq4LEuvXDhEUJNjjdyQqvLUg11ZgC608QK9cdoHDUyyj8QkbTfOLUp2WWKeNSntgQWWtoZb+
 9VEZa2BgLmflYSYPIKhj5XrnMS4j9Y4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDE1NiBTYWx0ZWRfXyL8g34WVVEDs
 WL4rFTFyPBSOSp5YS9l9mbjRoIDW0CDjfOvtKuK2+va6GdEEc35OfGDuJKVOspapK+zWqodrycY
 aezTd2i/w0NZHAppNE5/6orDC29qECS9QRI+YQ+wRlgTzzQ6HvZnvvielyQO1Vbmt7bL4qOo3HS
 q0N299Th42Woz5UZeQuB0rp8wxZI5Rz1CHdRSeT94gsnR9L06yad8TTs4C758TLYJC3Sn+RNQAo
 YDi4luL/qHHonMuDdms07XNaXdPrcuqBe0+z0CPCRiftSIlOI+nolTpCPMMfvxF33fgUBLLz/qk
 RECQGkIhW2bA2fswkU69APrbKwQvRiKkmIC7vjabR0Dz0g4rEwZhIjiqfFoZ3xdVmHP4JyUBiu4
 eBechM24glM/hs+ohHV5jgFmjydybRhat9Km5bLhgbuzW/3YoZWcdIIAMQHHr30dqBnAtaK62og
 UY6rWiPeU3Xa5L2TqEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280156

Add the EC command definitions and handler functions for querying fan
RPM and programming per-fan LUTs (lookup tables mapping SoC
temperature to target RPM), and introduce a raw i2c_transfer()-based
transport for the two commands, since their variable-length,
sub-command-addressed payloads don't fit the smbus block-data model
used by the existing commands.

Fan LUT geometry and temperature breakpoints vary by board, so encode
them in per-compatible qcom_ec_lut_config data selected via
device_get_match_data(). Add configs for the Hamoa CRD, Hamoa/Purwa
IOT EVK, and Glymur CRD ECs; IOT EVK boards share the Hamoa LUT
geometry but are bring-up platforms without a calibrated fan curve,
so skip_lut_set suppresses the LUT-set command on those boards.

Since the LUT values depend on each fan's maximum RPM, which varies
per board assembly, calibrate it at runtime: drive the fan to full
PWM, wait for it to spin up, and read back the achieved RPM via the
new query command. Run calibration in a work item at probe time and
after EC reset recovery, and make it abortable via a completion so
suspend can cut it short. Track calibration completion state so the
LUT is programmed once calibration finishes and again on every
subsequent power-supply-driven profile switch.

Guard all of the above behind the presence of lut_cfg, since boards
without match data (or without a populated fan_cnt) have no LUT to
calibrate or program. Add a new state_lock mutex to guard the
per-fan cooling device state (current PWM state and calibrated
max_rpm) now that it can be read and written from more than one
context.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 drivers/platform/arm64/qcom-hamoa-ec.c | 600 ++++++++++++++++++++++++++++++---
 1 file changed, 561 insertions(+), 39 deletions(-)

diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
index f6ff77d4e8f6..d0c45d9970ee 100644
--- a/drivers/platform/arm64/qcom-hamoa-ec.c
+++ b/drivers/platform/arm64/qcom-hamoa-ec.c
@@ -6,6 +6,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/devm-helpers.h>
 #include <linux/device.h>
@@ -20,14 +21,17 @@
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/power_supply.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/thermal.h>
 
 #define EC_SCI_EVT_READ_CMD	0x05
 #define EC_FW_VERSION_CMD	0x0e
 #define EC_SOC_TEMP_CMD	0x20
+#define EC_FAN_RPM_QUERY_CMD	0x22
 #define EC_MODERN_STANDBY_CMD	0x23
 #define EC_FAN_PROFILE_CMD	0x24
+#define EC_SET_FAN_LUT_CMD	0x28
 #define EC_FAN_DBG_CONTROL_CMD	0x30
 #define EC_SCI_EVT_CONTROL_CMD	0x35
 #define EC_THERMAL_CAP_CMD	0x42
@@ -41,8 +45,11 @@
 
 #define EC_FW_VERSION_RESP_LEN	4
 #define EC_THERMAL_CAP_RESP_LEN	3
+#define EC_FAN_RPM_RESP_LEN	3
 #define EC_FAN_DEBUG_CMD_LEN	6
 #define EC_FAN_SPEED_DATA_SIZE	4
+#define EC_LUT_MAX_DATA_SIZE	64
+#define EC_MAX_LUT_ENTRIES	16
 
 #define EC_MODERN_STANDBY_ENTER	0x01
 #define EC_MODERN_STANDBY_EXIT	0x00
@@ -71,6 +78,92 @@ enum qcom_ec_sci_events {
 	EC_RECOVERED_FROM_RESET_EVT = 0x3d,
 };
 
+struct qcom_ec_fan_lut_entry {
+	u8 target_rpm;	/* units of 100 RPM */
+	u8 temp_high;
+	u8 temp_low;
+};
+
+struct qcom_ec_fan_lut_temp_entry {
+	u8 temp_high;
+	u8 temp_low;
+};
+
+struct qcom_ec_lut_config {
+	u8 lut_data_size;
+	u8 lut_entry_stride;
+	u8 max_lut_entries;
+	const struct qcom_ec_fan_lut_temp_entry *temps;
+	u8 num_temps;
+	bool send_soc_tj;
+	bool skip_lut_set;
+};
+
+static const struct qcom_ec_fan_lut_temp_entry hamoa_lut_temps[] = {
+	{ 32,  25  },
+	{ 35,  32  },
+	{ 42,  35  },
+	{ 45,  42  },
+	{ 52,  45  },
+	{ 55,  52  },
+	{ 60,  55  },
+	{ 65,  60  },
+	{ 70,  65  },
+	{ 75,  70  },
+	{ 80,  75  },
+	{ 85,  80  },
+	{ 90,  85  },
+	{ 95,  90  },
+	{ 100, 95  },
+	{ 105, 100 },
+};
+
+static const struct qcom_ec_fan_lut_temp_entry glymur_lut_temps[] = {
+	{ 40, 35 },
+	{ 50, 45 },
+	{ 55, 50 },
+	{ 60, 55 },
+	{ 65, 60 },
+	{ 70, 65 },
+	{ 75, 70 },
+	{ 85, 80 },
+};
+
+static const struct qcom_ec_lut_config hamoa_crd_lut_config = {
+	.lut_data_size            = 64,
+	.lut_entry_stride         = 4,
+	.max_lut_entries          = 16,
+	.temps                    = hamoa_lut_temps,
+	.num_temps                = ARRAY_SIZE(hamoa_lut_temps),
+	.send_soc_tj              = true,
+};
+
+/*
+ * IOT EVK boards share the Hamoa LUT geometry but are bring-up platforms
+ * without a calibrated fan curve, so the LUT-set command is not issued.
+ */
+static const struct qcom_ec_lut_config hamoa_iot_lut_config = {
+	.lut_data_size            = 64,
+	.lut_entry_stride         = 4,
+	.max_lut_entries          = 16,
+	.temps                    = hamoa_lut_temps,
+	.num_temps                = ARRAY_SIZE(hamoa_lut_temps),
+	.send_soc_tj              = true,
+	.skip_lut_set             = true,
+};
+
+static const struct qcom_ec_lut_config glymur_lut_config = {
+	.lut_data_size            = 24,
+	.lut_entry_stride         = 3,
+	.max_lut_entries          = 8,
+	.temps                    = glymur_lut_temps,
+	.num_temps                = ARRAY_SIZE(glymur_lut_temps),
+	.send_soc_tj              = false,
+};
+
+static_assert(ARRAY_SIZE(hamoa_lut_temps) <= EC_MAX_LUT_ENTRIES);
+static_assert(ARRAY_SIZE(glymur_lut_temps) <= EC_MAX_LUT_ENTRIES);
+
 struct qcom_ec_version {
 	u8 main_version;
 	u8 sub_version;
@@ -91,36 +184,125 @@ struct qcom_ec_cooling_dev {
 	struct device *parent_dev;
 	u8 fan_id;
 	u8 state;
+	u16 max_rpm;
+	struct qcom_ec_fan_lut_entry lut_entries[EC_MAX_LUT_ENTRIES];
 };
 
 struct qcom_ec {
 	struct i2c_client *client;
+	const struct qcom_ec_lut_config *lut_cfg;
 	struct qcom_ec_cooling_dev *ec_cdev;
 	struct thermal_zone_device **soc_tj_zones;
 	struct notifier_block psy_nb;
 	struct delayed_work soc_tj_work;
+	struct work_struct fan_calib_work;
 	struct work_struct psy_work;
-	struct mutex io_lock; /* serializes EC command sequences */
+	struct completion calib_abort;
+	struct mutex io_lock; /* serializes EC command sequences and calibrating */
+	struct mutex state_lock; /* guards per-fan cooling device state */
 	struct qcom_ec_thermal_cap thermal_cap;
 	struct qcom_ec_version version;
 	int num_soc_tj_zones;
+	u8 fan_profile;
 	int on_ac_power; /* -1 = unknown, 0 = battery, 1 = AC */
+	bool calibrating;
+	bool calib_done;
 };
 
-static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, u8 resp_len, u8 *resp)
+static int qcom_ec_write(struct qcom_ec *ec, u8 cmd, const u8 *data, size_t len)
 {
+	struct i2c_msg msg;
 	int ret;
 
-	ret = i2c_smbus_read_i2c_block_data(ec->client, cmd, resp_len, resp);
-	if (ret < 0)
-		return ret;
-	else if (ret == 0 || ret == 0xff)
-		return -EOPNOTSUPP;
+	if (len > U16_MAX - 1)
+		return -EINVAL;
 
-	if (resp[0] >= resp_len)
+	if (!data && len)
 		return -EINVAL;
 
-	return 0;
+	msg = (struct i2c_msg){
+		.addr  = ec->client->addr,
+		.flags = I2C_M_DMA_SAFE,
+		.len   = 1 + len,
+	};
+
+	msg.buf = kmalloc(1 + len, GFP_KERNEL);
+	if (!msg.buf)
+		return -ENOMEM;
+
+	msg.buf[0] = cmd;
+	memcpy(&msg.buf[1], data, len);
+
+	ret = i2c_transfer(ec->client->adapter, &msg, 1);
+
+	kfree(msg.buf);
+
+	return ret == 1 ? 0 : (ret < 0 ? ret : -EIO);
+}
+
+static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, const u8 *subcmd,
+			u8 subcmd_len, u8 resp_len, u8 *resp)
+{
+	struct i2c_client *client = ec->client;
+	struct i2c_msg msgs[2];
+	u8 *write_buf, *read_buf;
+	int ret;
+
+	if (subcmd_len > 3)
+		return -EINVAL;
+
+	if (!subcmd && subcmd_len)
+		return -EINVAL;
+
+	if (!resp || !resp_len)
+		return -EINVAL;
+
+	write_buf = kmalloc(1 + subcmd_len, GFP_KERNEL);
+	if (!write_buf)
+		return -ENOMEM;
+
+	read_buf = kmalloc(resp_len, GFP_KERNEL);
+	if (!read_buf) {
+		kfree(write_buf);
+		return -ENOMEM;
+	}
+
+	write_buf[0] = cmd;
+	if (subcmd && subcmd_len)
+		memcpy(&write_buf[1], subcmd, subcmd_len);
+
+	msgs[0].addr  = client->addr;
+	msgs[0].flags = I2C_M_DMA_SAFE;
+	msgs[0].len   = 1 + subcmd_len;
+	msgs[0].buf   = write_buf;
+
+	msgs[1].addr  = client->addr;
+	msgs[1].flags = I2C_M_RD | I2C_M_DMA_SAFE;
+	msgs[1].len   = resp_len;
+	msgs[1].buf   = read_buf;
+
+	ret = i2c_transfer(client->adapter, msgs, 2);
+	if (ret != 2) {
+		ret = ret < 0 ? ret : -EIO;
+		goto out;
+	}
+
+	if (read_buf[0] == 0 || read_buf[0] == 0xff) {
+		ret = -EOPNOTSUPP;
+		goto out;
+	}
+
+	if (read_buf[0] != resp_len - 1) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	memcpy(resp, read_buf, resp_len);
+	ret = 0;
+out:
+	kfree(write_buf);
+	kfree(read_buf);
+	return ret;
 }
 
 /*
@@ -150,7 +332,7 @@ static int qcom_ec_read_fw_version(struct device *dev)
 	int ret;
 
 	mutex_lock(&ec->io_lock);
-	ret = qcom_ec_read(ec, EC_FW_VERSION_CMD, EC_FW_VERSION_RESP_LEN, resp);
+	ret = qcom_ec_read(ec, EC_FW_VERSION_CMD, NULL, 0, EC_FW_VERSION_RESP_LEN, resp);
 	mutex_unlock(&ec->io_lock);
 	if (ret < 0)
 		return ret;
@@ -194,7 +376,7 @@ static int qcom_ec_thermal_capabilities(struct device *dev)
 	int ret;
 
 	mutex_lock(&ec->io_lock);
-	ret = qcom_ec_read(ec, EC_THERMAL_CAP_CMD, EC_THERMAL_CAP_RESP_LEN, resp);
+	ret = qcom_ec_read(ec, EC_THERMAL_CAP_CMD, NULL, 0, EC_THERMAL_CAP_RESP_LEN, resp);
 	mutex_unlock(&ec->io_lock);
 	if (ret < 0)
 		return ret;
@@ -444,6 +626,133 @@ static int qcom_ec_get_fan_profile(struct qcom_ec *ec, u8 *profile_id)
 	return 0;
 }
 
+/*
+ * Setting a Fan LUT from SoC to EC:
+ *
+ * Request (SoC -> EC):
+ * -------------------------------------------------------------------------------
+ * | Offset		| Name		| Description				|
+ * -------------------------------------------------------------------------------
+ * | 0x00		| Command = 0x28| Command to set Fan LUT from EC	|
+ * -------------------------------------------------------------------------------
+ * | 0x01		| Fan and	| Bit 0-3: Fan ID (1 - 2)		|
+ * |			| Profile ID	| Bit 4-7: Fan Profile ID (1 - 7)	|
+ * -------------------------------------------------------------------------------
+ * | 0x02		| Temp Source	| 0x1 : SoC Tj				|
+ * |			|		| 0x2 : Tskin				|
+ * |			|		| 0x3 - 0xFF : Reserved			|
+ * -------------------------------------------------------------------------------
+ * | 0x03		| Byte count=64	| EC LUT payload byte count		|
+ * -------------------------------------------------------------------------------
+ * | 0x04 - (0x04 +	| EC LUT data	| N* entries x 3 bytes:			|
+ * | (N* x 3))		|		| Byte 1: Target RPM (units of 100 RPM)	|
+ * |			|		| Byte 2: Temp High			|
+ * |			|		| Byte 3: Temp Low			|
+ * -------------------------------------------------------------------------------
+ *
+ * N* - Indicates the number of entries in the LUT.
+ *
+ */
+static int qcom_ec_set_fan_lut(struct qcom_ec *ec, u8 fan_id, u8 profile_id,
+			       u8 temp_source, const struct qcom_ec_fan_lut_entry *entries)
+{
+	const struct qcom_ec_lut_config *lut_cfg = ec->lut_cfg;
+	u8 write_buf[3 + EC_LUT_MAX_DATA_SIZE] = {};
+	int i, ret;
+
+	if (!lut_cfg)
+		return -EOPNOTSUPP;
+
+	if (lut_cfg->max_lut_entries == 0 ||
+	    lut_cfg->lut_entry_stride < 3 ||
+	    lut_cfg->lut_data_size > EC_LUT_MAX_DATA_SIZE ||
+	    (lut_cfg->max_lut_entries - 1) * lut_cfg->lut_entry_stride + 3 > lut_cfg->lut_data_size)
+		return -EINVAL;
+
+	write_buf[0] = (fan_id & 0x0f) | ((profile_id & 0x0f) << 4);
+	write_buf[1] = temp_source;
+	write_buf[2] = lut_cfg->lut_data_size;
+
+	for (i = 0; i < lut_cfg->max_lut_entries; i++) {
+		u8 *dst = &write_buf[3 + i * lut_cfg->lut_entry_stride];
+
+		dst[0] = entries[i].target_rpm;
+		dst[1] = entries[i].temp_high;
+		dst[2] = entries[i].temp_low;
+	}
+
+	ret = qcom_ec_write(ec, EC_SET_FAN_LUT_CMD, write_buf, 3 + lut_cfg->lut_data_size);
+	if (ret < 0)
+		dev_err(&ec->client->dev, "Failed to set fan LUT: %d\n", ret);
+
+	return ret;
+}
+
+/*
+ * EC Fan RPM Query:
+ *
+ * Request (SoC -> EC):
+ * ---------------------------------------------------------------
+ * | Offset	| Name		| Description			|
+ * ---------------------------------------------------------------
+ * | 0x00	| Command = 0x22| EC Fan RPM Query		|
+ * ---------------------------------------------------------------
+ * | 0x01	| Fan ID	| 0x1 : Fan 1			|
+ * |		|		| 0x2 : Fan 2			|
+ * ---------------------------------------------------------------
+ *
+ * Response (EC -> SoC):
+ * ---------------------------------------------------------------
+ * | Offset	| Name		| Description			|
+ * ---------------------------------------------------------------
+ * | 0x00	| Byte count = 2| Byte count for fan RPM value	|
+ * ---------------------------------------------------------------
+ * | 0x01 (LSB)| Fan Speed	| Fan speed in the resolution	|
+ * | 0x02	|		| of 1 RPM			|
+ * ---------------------------------------------------------------
+ */
+static int qcom_ec_get_fan_rpm(struct qcom_ec *ec, u8 fan_id, u16 *rpm)
+{
+	u8 resp[EC_FAN_RPM_RESP_LEN];
+	int ret;
+
+	ret = qcom_ec_read(ec, EC_FAN_RPM_QUERY_CMD, &fan_id, 1, sizeof(resp), resp);
+	if (ret < 0)
+		return ret;
+
+	*rpm = resp[1] | (resp[2] << 8);
+
+	return 0;
+}
+
+static int qcom_ec_set_lut_for_profile(struct qcom_ec *ec, u8 profile_id)
+{
+	const struct qcom_ec_lut_config *lut_cfg = ec->lut_cfg;
+	int i, ret;
+
+	if (!lut_cfg)
+		return -EOPNOTSUPP;
+
+	if (lut_cfg->skip_lut_set)
+		return 0;
+
+	for (i = 0; i < ec->thermal_cap.fan_cnt; i++) {
+		struct qcom_ec_cooling_dev *ec_cdev = &ec->ec_cdev[i];
+
+		ret = qcom_ec_set_fan_lut(ec, ec_cdev->fan_id, profile_id,
+					  EC_SOC_TEMP_SOURCE_TJ,
+					  ec_cdev->lut_entries);
+		if (ret < 0) {
+			dev_err(&ec->client->dev,
+				"Failed to set LUT for fan%u profile 0x%x: %d\n",
+				ec_cdev->fan_id, profile_id, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static int qcom_ec_update_profile_from_power_supply(struct qcom_ec *ec)
 {
 	int on_ac_power;
@@ -457,8 +766,10 @@ static int qcom_ec_update_profile_from_power_supply(struct qcom_ec *ec)
 
 	mutex_lock(&ec->io_lock);
 
-	if (ec->on_ac_power != on_ac_power) {
+	if (ec->on_ac_power != on_ac_power && !ec->calibrating) {
 		ret = qcom_ec_set_fan_profile(ec, profile);
+		if (!ret && ec->lut_cfg && ec->calib_done)
+			ret = qcom_ec_set_lut_for_profile(ec, profile);
 		if (!ret)
 			ec->on_ac_power = on_ac_power;
 	}
@@ -473,6 +784,24 @@ static void qcom_ec_unreg_psy_notifier(void *data)
 	power_supply_unreg_notifier(data);
 }
 
+static void qcom_ec_restore_fan_state(struct qcom_ec *ec)
+{
+	bool calib_done;
+
+	if (!ec->lut_cfg || !ec->thermal_cap.fan_cnt)
+		return;
+
+	mutex_lock(&ec->io_lock);
+	ec->on_ac_power = -1;
+	calib_done = ec->calib_done;
+	mutex_unlock(&ec->io_lock);
+
+	qcom_ec_update_profile_from_power_supply(ec);
+
+	if (!calib_done)
+		queue_work(system_long_wq, &ec->fan_calib_work);
+}
+
 static void qcom_ec_psy_work_fn(struct work_struct *work)
 {
 	struct qcom_ec *ec = container_of(work, struct qcom_ec, psy_work);
@@ -537,6 +866,7 @@ static irqreturn_t qcom_ec_irq(int irq, void *data)
 		break;
 	case EC_RECOVERED_FROM_RESET_EVT:
 		dev_dbg_ratelimited(dev, "EC recovered from reset\n");
+		qcom_ec_restore_fan_state(ec);
 		break;
 	default:
 		dev_notice_ratelimited(dev, "Unknown EC event: %d\n", val);
@@ -569,20 +899,30 @@ static void qcom_ec_sci_evt_disable(void *data)
 		dev_err(dev, "Failed to disable SCI events: %d\n", ret);
 }
 
-static int qcom_ec_fan_get_max_state(struct thermal_cooling_device *cdev, unsigned long *state)
-{
-	*state = EC_FAN_MAX_PWM;
-
-	return 0;
-}
-
 static int qcom_ec_fan_get_cur_state(struct thermal_cooling_device *cdev, unsigned long *state)
 {
 	struct qcom_ec_cooling_dev *ec_cdev = cdev->devdata;
+	struct i2c_client *client = to_i2c_client(ec_cdev->parent_dev);
+	struct qcom_ec *ec = i2c_get_clientdata(client);
+	struct device *dev = ec_cdev->parent_dev;
+	u16 rpm;
+	int ret;
+
+	mutex_lock(&ec->io_lock);
+	ret = qcom_ec_get_fan_rpm(ec, ec_cdev->fan_id, &rpm);
+	mutex_unlock(&ec->io_lock);
+	if (ret < 0)
+		dev_err(dev, "Failed to read fan%u RPM: %d\n", ec_cdev->fan_id, ret);
 
+	mutex_lock(&ec->state_lock);
+
+	if (ret >= 0 && ec_cdev->max_rpm)
+		ec_cdev->state = min_t(u32, (rpm * EC_FAN_MAX_PWM) / ec_cdev->max_rpm,
+				       EC_FAN_MAX_PWM);
 	*state = ec_cdev->state;
+	mutex_unlock(&ec->state_lock);
 
-	return 0;
+	return ret < 0 ? ret : 0;
 }
 
 /*
@@ -628,24 +968,116 @@ static int qcom_ec_fan_debug_mode_off(struct qcom_ec_cooling_dev *ec_cdev)
 	return ret;
 }
 
-static int qcom_ec_fan_set_cur_state(struct thermal_cooling_device *cdev, unsigned long state)
+static int qcom_ec_fan_write_pwm(struct qcom_ec_cooling_dev *ec_cdev, u8 pwm)
 {
-	struct qcom_ec_cooling_dev *ec_cdev = cdev->devdata;
 	struct device *dev = ec_cdev->parent_dev;
 	struct i2c_client *client = to_i2c_client(dev);
+	struct qcom_ec *ec = i2c_get_clientdata(client);
 	u8 request[6] = { ec_cdev->fan_id, EC_FAN_SPEED_DATA_SIZE,
 			  EC_FAN_DEBUG_MODE_ON | EC_FAN_ON | EC_FAN_DEBUG_TYPE_PWM,
-			  0, 0, state };
+			  0, 0, pwm };
 	int ret;
 
-	ret = i2c_smbus_write_i2c_block_data(client, EC_FAN_DBG_CONTROL_CMD,
-					     sizeof(request), request);
-	if (ret) {
+	ret = qcom_ec_write(ec, EC_FAN_DBG_CONTROL_CMD, request, sizeof(request));
+	if (ret)
 		dev_err(dev, "Failed to set fan pwm: %d\n", ret);
+
+	return ret;
+}
+
+static int qcom_ec_fan_set_cur_state(struct thermal_cooling_device *cdev, unsigned long state)
+{
+	struct qcom_ec_cooling_dev *ec_cdev = cdev->devdata;
+	struct i2c_client *client = to_i2c_client(ec_cdev->parent_dev);
+	struct qcom_ec *ec = i2c_get_clientdata(client);
+	int ret;
+
+	if (state > EC_FAN_MAX_PWM)
+		return -EINVAL;
+
+	mutex_lock(&ec->io_lock);
+
+	if (ec->calibrating) {
+		mutex_unlock(&ec->io_lock);
+		return -EBUSY;
+	}
+
+	ret = qcom_ec_fan_write_pwm(ec_cdev, state);
+	if (!ret) {
+		mutex_lock(&ec->state_lock);
+		ec_cdev->state = state;
+		mutex_unlock(&ec->state_lock);
+	}
+
+	mutex_unlock(&ec->io_lock);
+
+	return ret;
+}
+
+static int qcom_ec_fan_calibrate(struct qcom_ec *ec, struct qcom_ec_cooling_dev *ec_cdev)
+{
+	struct device *dev = ec_cdev->parent_dev;
+	u16 rpm;
+	int ret;
+
+	mutex_lock(&ec->io_lock);
+	ret = qcom_ec_fan_write_pwm(ec_cdev, EC_FAN_MAX_PWM);
+	mutex_unlock(&ec->io_lock);
+	if (ret) {
+		dev_err(dev, "Failed to set fan%u to max state: %d\n", ec_cdev->fan_id, ret);
 		return ret;
 	}
 
-	ec_cdev->state = state;
+	mutex_lock(&ec->state_lock);
+	ec_cdev->state = EC_FAN_MAX_PWM;
+	mutex_unlock(&ec->state_lock);
+
+	ret = wait_for_completion_interruptible_timeout(&ec->calib_abort, msecs_to_jiffies(10000));
+
+	mutex_lock(&ec->io_lock);
+
+	if (ret != 0) {
+		qcom_ec_fan_debug_mode_off(ec_cdev);
+		mutex_unlock(&ec->io_lock);
+		return ret < 0 ? ret : -ECANCELED;
+	}
+
+	ret = qcom_ec_get_fan_rpm(ec, ec_cdev->fan_id, &rpm);
+	if (ret) {
+		dev_err(dev, "Failed to read fan%u RPM at max state: %d\n", ec_cdev->fan_id, ret);
+		qcom_ec_fan_debug_mode_off(ec_cdev);
+		mutex_unlock(&ec->io_lock);
+		return ret;
+	}
+
+	if (!rpm) {
+		dev_err(dev, "Fan%u reported 0 RPM at max state, fan may be blocked or faulty\n",
+			ec_cdev->fan_id);
+		qcom_ec_fan_debug_mode_off(ec_cdev);
+		mutex_unlock(&ec->io_lock);
+		return -ENODEV;
+	}
+
+	qcom_ec_fan_debug_mode_off(ec_cdev);
+	mutex_unlock(&ec->io_lock);
+
+	mutex_lock(&ec->state_lock);
+	ec_cdev->max_rpm = rpm;
+
+	for (int i = 0; i < ec->lut_cfg->max_lut_entries; i++) {
+		ec_cdev->lut_entries[i].target_rpm =
+			min_t(u32, rpm * i / (ec->lut_cfg->max_lut_entries - 1) / 100, U8_MAX);
+		ec_cdev->lut_entries[i].temp_high = ec->lut_cfg->temps[i].temp_high;
+		ec_cdev->lut_entries[i].temp_low  = ec->lut_cfg->temps[i].temp_low;
+	}
+	mutex_unlock(&ec->state_lock);
+
+	return 0;
+}
+
+static int qcom_ec_fan_get_max_state(struct thermal_cooling_device *cdev, unsigned long *state)
+{
+	*state = EC_FAN_MAX_PWM;
 
 	return 0;
 }
@@ -665,6 +1097,49 @@ static void qcom_ec_soc_tj_work_fn(struct work_struct *work)
 	queue_delayed_work(system_percpu_wq, &ec->soc_tj_work, EC_SOC_TJ_TEMP_POLL_JIFFIES);
 }
 
+static void qcom_ec_fan_calib_work_fn(struct work_struct *work)
+{
+	struct qcom_ec *ec = container_of(work, struct qcom_ec, fan_calib_work);
+	struct device *dev = &ec->client->dev;
+	int i, ret;
+
+	reinit_completion(&ec->calib_abort);
+
+	mutex_lock(&ec->io_lock);
+	ec->calibrating = true;
+	mutex_unlock(&ec->io_lock);
+
+	for (i = 0; i < ec->thermal_cap.fan_cnt; i++) {
+		ret = qcom_ec_fan_calibrate(ec, &ec->ec_cdev[i]);
+		if (ret) {
+			dev_err(dev, "Failed to calibrate fan%d: %d\n", i, ret);
+			goto out;
+		}
+	}
+
+	mutex_lock(&ec->io_lock);
+	ret = qcom_ec_get_fan_profile(ec, &ec->fan_profile);
+	if (ret < 0) {
+		dev_err(dev, "Failed to read current fan profile: %d\n", ret);
+		mutex_unlock(&ec->io_lock);
+		goto out;
+	}
+
+	ec->calib_done = true;
+	ret = qcom_ec_set_lut_for_profile(ec, ec->fan_profile);
+	mutex_unlock(&ec->io_lock);
+
+	if (ret < 0)
+		dev_err(dev, "Failed to set LUT for profile 0x%x: %d\n", ec->fan_profile, ret);
+
+out:
+	mutex_lock(&ec->io_lock);
+	ec->calibrating = false;
+	mutex_unlock(&ec->io_lock);
+
+	qcom_ec_update_profile_from_power_supply(ec);
+}
+
 static int qcom_ec_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
@@ -678,9 +1153,13 @@ static int qcom_ec_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	enable_delayed_work(&ec->soc_tj_work);
-	queue_delayed_work(system_percpu_wq, &ec->soc_tj_work, EC_SOC_TJ_TEMP_POLL_JIFFIES);
+	if (ec->lut_cfg && ec->thermal_cap.fan_cnt && !ec->calib_done)
+		queue_work(system_long_wq, &ec->fan_calib_work);
 
+	if (ec->lut_cfg && ec->lut_cfg->send_soc_tj) {
+		enable_delayed_work(&ec->soc_tj_work);
+		queue_delayed_work(system_percpu_wq, &ec->soc_tj_work, EC_SOC_TJ_TEMP_POLL_JIFFIES);
+	}
 	return 0;
 }
 
@@ -690,7 +1169,16 @@ static int qcom_ec_suspend(struct device *dev)
 	struct qcom_ec *ec = i2c_get_clientdata(client);
 	int ret;
 
-	disable_delayed_work_sync(&ec->soc_tj_work);
+	if (ec->lut_cfg && ec->thermal_cap.fan_cnt) {
+		complete_all(&ec->calib_abort);
+		cancel_work_sync(&ec->fan_calib_work);
+	}
+
+	if (ec->lut_cfg)
+		cancel_work_sync(&ec->psy_work);
+
+	if (ec->lut_cfg && ec->lut_cfg->send_soc_tj)
+		disable_delayed_work_sync(&ec->soc_tj_work);
 
 	mutex_lock(&ec->io_lock);
 	ret = i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
@@ -714,6 +1202,22 @@ static int qcom_ec_probe(struct i2c_client *client)
 	ec->client = client;
 	ec->on_ac_power = -1;
 	mutex_init(&ec->io_lock);
+	mutex_init(&ec->state_lock);
+	init_completion(&ec->calib_abort);
+	ec->lut_cfg = device_get_match_data(dev);
+
+	if (ec->lut_cfg &&
+	    (ec->lut_cfg->max_lut_entries < 2 ||
+	     ec->lut_cfg->max_lut_entries > EC_MAX_LUT_ENTRIES ||
+	     ec->lut_cfg->max_lut_entries > ec->lut_cfg->num_temps))
+		return dev_err_probe(dev, -EINVAL,
+				     "Invalid LUT config: max_lut_entries=%u, num_temps=%u, limit=%d\n",
+				     ec->lut_cfg->max_lut_entries, ec->lut_cfg->num_temps,
+				     EC_MAX_LUT_ENTRIES);
+
+	ret = devm_work_autocancel(dev, &ec->fan_calib_work, qcom_ec_fan_calib_work_fn);
+	if (ret)
+		return ret;
 
 	ret = devm_work_autocancel(dev, &ec->psy_work, qcom_ec_psy_work_fn);
 	if (ret)
@@ -742,15 +1246,18 @@ static int qcom_ec_probe(struct i2c_client *client)
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to read thermal capabilities\n");
 
-	ret = qcom_ec_setup_soc_tj_zones(ec);
-	if (ret < 0)
-		return dev_err_probe(dev, ret, "Failed to setup SoC Tj thermal zones\n");
+	if (ec->lut_cfg && ec->lut_cfg->send_soc_tj) {
+		ret = qcom_ec_setup_soc_tj_zones(ec);
+		if (ret < 0)
+			return dev_err_probe(dev, ret, "Failed to setup SoC Tj thermal zones\n");
 
-	ret = devm_delayed_work_autocancel(dev, &ec->soc_tj_work, qcom_ec_soc_tj_work_fn);
-	if (ret)
-		return ret;
+		ret = devm_delayed_work_autocancel(dev, &ec->soc_tj_work,
+						   qcom_ec_soc_tj_work_fn);
+		if (ret)
+			return ret;
 
-	queue_delayed_work(system_percpu_wq, &ec->soc_tj_work, EC_SOC_TJ_TEMP_POLL_JIFFIES);
+		queue_delayed_work(system_percpu_wq, &ec->soc_tj_work, EC_SOC_TJ_TEMP_POLL_JIFFIES);
+	}
 
 	if (ec->thermal_cap.fan_cnt == 0) {
 		dev_warn(dev, FW_BUG "Failed to get fan count, firmware update required\n");
@@ -777,6 +1284,9 @@ static int qcom_ec_probe(struct i2c_client *client)
 		}
 	}
 
+	if (!ec->lut_cfg)
+		return 0;
+
 	ec->psy_nb.notifier_call = qcom_ec_psy_notifier;
 	ret = power_supply_reg_notifier(&ec->psy_nb);
 	if (ret)
@@ -788,6 +1298,7 @@ static int qcom_ec_probe(struct i2c_client *client)
 
 	qcom_ec_update_profile_from_power_supply(ec);
 
+	queue_work(system_long_wq, &ec->fan_calib_work);
 	return 0;
 }
 
@@ -795,17 +1306,28 @@ static void qcom_ec_remove(struct i2c_client *client)
 {
 	struct qcom_ec *ec = i2c_get_clientdata(client);
 
-	disable_delayed_work_sync(&ec->soc_tj_work);
+	if (ec->lut_cfg && ec->thermal_cap.fan_cnt) {
+		complete_all(&ec->calib_abort);
+		disable_work_sync(&ec->fan_calib_work);
+	}
+
+	if (ec->lut_cfg && ec->lut_cfg->send_soc_tj)
+		disable_delayed_work_sync(&ec->soc_tj_work);
 
 	for (int i = 0; i < ec->thermal_cap.fan_cnt; i++) {
 		struct qcom_ec_cooling_dev *ec_cdev = &ec->ec_cdev[i];
 
+		mutex_lock(&ec->io_lock);
 		qcom_ec_fan_debug_mode_off(ec_cdev);
+		mutex_unlock(&ec->io_lock);
 	}
 }
 
 static const struct of_device_id qcom_ec_of_match[] = {
-	{ .compatible = "qcom,hamoa-crd-ec" },
+	{ .compatible = "qcom,hamoa-iot-evk-ec", .data = &hamoa_iot_lut_config },
+	{ .compatible = "qcom,purwa-iot-evk-ec", .data = &hamoa_iot_lut_config },
+	{ .compatible = "qcom,hamoa-crd-ec",     .data = &hamoa_crd_lut_config },
+	{ .compatible = "qcom,glymur-crd-ec",    .data = &glymur_lut_config    },
 	{}
 };
 MODULE_DEVICE_TABLE(of, qcom_ec_of_match);

-- 
2.34.1

