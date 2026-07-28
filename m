Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8213B0ADE
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 17:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785260727; cv=none; b=o5/R3+CERTyAXoxRVnnYHksStJBMLLTlPiHkFMC4ojxnJSpAshEpmO1vOSB4v4oOBl6tcV7sKwU8qbNrhYA5Vbv8NRMXjJ/V8QYdim0s6Qy9ZSEpMpMCdfLiPPgPy9q3br44VT6lU9PUh1pjKcp6WkMQejFyXMlfXngt2c9cNqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785260727; c=relaxed/simple;
	bh=8rsYCWsi+z+9YKAJEdO1NnrxsZm0QOOlc8znCD6EHwU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kZ/9gfTPTYGAgkiwux8Sis5FOHEPeEL1wosefwdDUNVpvP6wreIpziQPVyy7iMpVeME9vy7M+Jg9uJY+mzKse+vuzuaFQe1BZj3OpACX42iEWNRaH5WbO+R/L7amDNYc62H/QDoR77+4k9tr1A6y9/cOowsuDe5jC80tWqmnAqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m/hGKgj6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b8WvFkuG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m/hGKgj6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b8WvFkuG"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SHbgsR3883686
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 17:45:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IQuoy2xgAU0KTs2VSlupSgyKd8orCoUGVK6VULyRe9w=; b=m/hGKgj6zA/ZQKRo
	kY83IT6E4pgIdurcPf4cSb2il7G24SZIySQsOr8DsCrsCaZ+CMpPOv7v/A3mwNSZ
	Cq29aewugi2dfHxi8N2LvUAajcznrWaoyCPAA6+b0OI3bMO2BZ9YCmZU1A7qDCnc
	0gOwWD7uUBfY79jL0BdGGCQTJw3OdD2OeId63NbnuqgCBp7WtPqpzagveFZyoNFG
	sgwN5N6/uhwiLesRffaG8RgoDLLpBUlRlpp7qgHy3vLL6ZHk7q2IX4qsTpvh3JDE
	CgBxQLaDkBAPvAYUyedUQsv+pFapG+PC3rVrL2r1cb+2yOUgC+rdNWePMgVi9EVU
	u9C0/A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq108r12n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 17:45:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e7b87ce77so221875a91.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 10:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785260724; x=1785865524; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IQuoy2xgAU0KTs2VSlupSgyKd8orCoUGVK6VULyRe9w=;
        b=b8WvFkuG0IjltcRnlMrymSPgttM+4OwqM6kgIUBBtT2FpLelFeojf2dDehL4UnXbeE
         Y2vCSHeppGtfGIqKiajwrVnF7WxzK8P0IXQpCD6GjNT10wcSRnIJ0/iPoqd+8ZSnPjbj
         hDuX3GJl+T1kX89dFfz4KDgtNkIk9gNwamH/Q7PVtTFVdo0fiNd2GrD0oP3COLisYTeX
         ItL3oTtWt2hak7GZulpdYt6Abkpmv4n/Q4QZL3WQrVeRNtnmCngpDbkw1uE3wZdDp8FC
         bm+xuy1ZwYnoFl0zqfB+nBC0GIYjT8/opfnXKRgIgk+gvUojjN80v/6gaJLo7XFvxNCm
         YU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785260724; x=1785865524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IQuoy2xgAU0KTs2VSlupSgyKd8orCoUGVK6VULyRe9w=;
        b=L/7rh9+M34toe/mhpNGMTzPTdIWGoWO9mftiqxYIVznAsVNrxtn3OuWWljBtWxcaw9
         Vr9qF862DrMc82DLd4a+ItPPMzZ4foC1FB73ZDnYLlp+DNULEw/HOe3T+fn11yVj8FY8
         HBRVUAchRvO3OzwUCNN75OQWu9sqyQA/jGa6NuaG7AwcbimOsUrGt4PJ+S8TniO4oHfn
         5E8XNnw1C/zv6VwYf7KBjCNJfw7TF1OLyX9TxRA2AMtaHTb7l16P74svjSHR6DDzOht2
         P4+B7ESJTKFNiRclpv1JCD/0ZpqKCT8a38oe2wRpEkv4hpteLKGzERjKfDovkqo19JNh
         3q3g==
X-Forwarded-Encrypted: i=1; AHgh+Rrn2g8L0S4zcy86sfh2oa38uAFWHJQ5WuABx+GLat6JOSrAPXKDHYogSuwcZh1molgvo/EmN95boDacyIHJXjoJIVJE@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6LRX84maKmXYKE/GZApKduHrYYq+jlxOpdQwMoUrQn+MKM6Pg
	5IfFB8/OWqFJVp3AS4O4m6tL/whoWea0Y8AGZxzqdieE3MG8kNEmYPr9pdYa0mwqKbrg3eIVmYq
	jxXMkWGI9CNITqaW3gbo6Z8fUI9m8mI8vCzshZp7gj4xwE9V8ceEZVgycLpLhhaC1ucySk+Acf4
	J9
X-Gm-Gg: AR+sD10ltkZxCCw4aA3EowBo1XsI/2pLXFAKMlpa+qck5qKikaI+ddF7EjOmGPsgd7J
	kD325Bh59RyDlZDg+a2dT3Fol1DUmfbBVMo4IvPQ3FI1SAslXt7E4jY9Bw3mRO9CGV2V4/krfQB
	ULyAdpgoVO8vqzG8teCJJaMUIRwGpHbTiGASn80l8NSwUO3fW8clSXaMrwLYfMaczSnyAHMNDQk
	NeX61QIcVfifoHswtsJ+jv8F0SMIS7F998Nn97gn9mHQmV/tYAUbpSWxoQMxsmloHOHeX66O5cm
	FZOmpW7fBl9wOIY2sSdvB+aAZRxSQraoSlS6zt4l1gKwiG6FMC8ydyO7cyOVPFdrQN7X91NNcu8
	kEZrFwxJDek0P1KjotieDbJB5sh/GL55pLupSPHVKc95jMIZs3rVI2/+tt444oUcmQW5vOt6Dj+
	c5PDdgDuBi09ag
X-Received: by 2002:a17:90b:584f:b0:368:af5c:5925 with SMTP id 98e67ed59e1d1-38f6a4e2a12mr3669843a91.23.1785260724090;
        Tue, 28 Jul 2026 10:45:24 -0700 (PDT)
X-Received: by 2002:a17:90b:584f:b0:368:af5c:5925 with SMTP id 98e67ed59e1d1-38f6a4e2a12mr3669815a91.23.1785260723698;
        Tue, 28 Jul 2026 10:45:23 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7273cd9esm749553c88.13.2026.07.28.10.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 10:45:23 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 23:14:31 +0530
Subject: [PATCH 3/8] platform: arm64: qcom-hamoa-ec: Switch fan profile
 based on power supply state
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-ec_add_more_commands-v1-3-771abd65ee1a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785260700; l=7692;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=8rsYCWsi+z+9YKAJEdO1NnrxsZm0QOOlc8znCD6EHwU=;
 b=Cjb5ogUxHeejzzYkzjyPUKZFD+w0NW89x3yxMbBgrQ3YHevVfGZZ7kvXm9QkcdFuT7H5mrY99
 j9rmArWzGraATumwy2gJTBt363M9YAgemD1Dk+8jeSeoVLDrm4Csbci
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-ORIG-GUID: MKw12j6BMjdw67JhNNsu0T8Vqceye05Z
X-Authority-Analysis: v=2.4 cv=fufsol4f c=1 sm=1 tr=0 ts=6a68eab4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=S1IX0agl0VDsrzKuCdsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: MKw12j6BMjdw67JhNNsu0T8Vqceye05Z
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDE1NiBTYWx0ZWRfX6uTBXbA1DgVy
 V0BCmhcBphbKBjf8U4Cs43HaqaU/kFTCtkQ8vcNcAzGl57O4lfGK7sib2NhhviZjTEaOh5Iu50s
 7N2ZQFgm35YRQ/SahSUiBBGx32Hh5hw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDE1NiBTYWx0ZWRfX+MVcX4cEJdop
 jptRIA52aNpvR34nDjQ8ccahEYNcbFZ7MPifD3D9lcHL281ZCREBVwYU5KwyZifbu5PfpSom0Yl
 qnjlLn2Qyfx9fKpEI0+HotW12lY32OWXUewvblT+vGhEnSjud7gY/sRRiNubqRYeq0xvlT4+tn4
 h6LvAWFPx5ody3hDtpmMv2DGZkroKirL0OOBFr5oY8VMNJDgLJaDx//r5Awj8qIetESWkgzDZzT
 z+B9G+Bv9ZIuHYkwf3NbmRjjC5EtCAjj7FXuwPupKUVRxM5iQ9o7jAOjM/8RqvmlykvM5yDIX2/
 EONZVdtTbGahz27JI8H9WZ8m86R5Oa/0KJYQukdlBWuPPW1qBVUxu+1iK8h0L5Y8VHhx053o1m5
 U0Vi2IwVy8KAwAR8VssHjfmFtHIKZmLVqko8J3LyFsi1XPwdLNYye/PATX5llaEtLTjIhrvgBw3
 UUApu9wF8uRbY69yHZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280156

Add the EC command definitions and handler functions for switching and
reading the EC fan profile.

Register a power supply notifier so the driver can react to AC/battery
transitions: on each PSY_EVENT_PROP_CHANGED notification, queue work
that checks power_supply_is_system_supplied() and, if the AC/battery
state has actually changed, switches the fan profile to the
performance profile on AC or the battery-saver profile on battery.
Track the last-applied state in on_ac_power to avoid redundant EC
writes. Run the initial sync once at probe time, and defer the actual
switch to a work item since the notifier callback runs in atomic
context.

Serialize the fan profile write under the existing io_lock mutex,
alongside the other EC command sequences.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 drivers/platform/arm64/qcom-hamoa-ec.c | 158 +++++++++++++++++++++++++++++++++
 1 file changed, 158 insertions(+)

diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
index 4c745b78322c..f6ff77d4e8f6 100644
--- a/drivers/platform/arm64/qcom-hamoa-ec.c
+++ b/drivers/platform/arm64/qcom-hamoa-ec.c
@@ -19,6 +19,7 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
+#include <linux/power_supply.h>
 #include <linux/slab.h>
 #include <linux/thermal.h>
 
@@ -26,10 +27,14 @@
 #define EC_FW_VERSION_CMD	0x0e
 #define EC_SOC_TEMP_CMD	0x20
 #define EC_MODERN_STANDBY_CMD	0x23
+#define EC_FAN_PROFILE_CMD	0x24
 #define EC_FAN_DBG_CONTROL_CMD	0x30
 #define EC_SCI_EVT_CONTROL_CMD	0x35
 #define EC_THERMAL_CAP_CMD	0x42
 
+#define EC_FAN_PROFILE_BEST_PERF_PLUGGED_IN	0x6
+#define EC_FAN_PROFILE_BETTER_BATT_ON_BATT	0x3
+
 #define EC_SOC_TEMP_SOURCE_TJ			0x1
 #define EC_SOC_TEMP_SOURCE_TSKIN		0x2
 #define EC_SOC_TEMP_DATA_SIZE			2
@@ -92,11 +97,14 @@ struct qcom_ec {
 	struct i2c_client *client;
 	struct qcom_ec_cooling_dev *ec_cdev;
 	struct thermal_zone_device **soc_tj_zones;
+	struct notifier_block psy_nb;
 	struct delayed_work soc_tj_work;
+	struct work_struct psy_work;
 	struct mutex io_lock; /* serializes EC command sequences */
 	struct qcom_ec_thermal_cap thermal_cap;
 	struct qcom_ec_version version;
 	int num_soc_tj_zones;
+	int on_ac_power; /* -1 = unknown, 0 = battery, 1 = AC */
 };
 
 static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, u8 resp_len, u8 *resp)
@@ -351,6 +359,140 @@ static int qcom_ec_send_soc_tj_temp(struct qcom_ec *ec)
 	return ret;
 }
 
+/*
+ * SoC to EC Fan Profile switch command:
+ *
+ * Command Payload:
+ * -----------------------------------------------------------------------
+ * | Offset	| Name		| Description				|
+ * -----------------------------------------------------------------------
+ * | 0x00	| Command = 0x24| SoC to EC Fan Profile switch command	|
+ * -----------------------------------------------------------------------
+ * | 0x01	| Fan Profile ID| Bit 0-3: Fan Profile			|
+ * |		|		| 0x0 : Invalid Profile			|
+ * |		|		| 0x1 : Battery saver profile		|
+ * |		|		| 0x2 : Better Battery with charger	|
+ * |		|		|       plugged in			|
+ * |		|		| 0x3 : Better Battery with charger	|
+ * |		|		|       removed				|
+ * |		|		| 0x4 : Better Performance with charger	|
+ * |		|		|       plugged in			|
+ * |		|		| 0x5 : Better Performance with charger	|
+ * |		|		|       plugged out			|
+ * |		|		| 0x6 : Best Performance with charger	|
+ * |		|		|       plugged in (default)		|
+ * |		|		| 0x7 : Best Performance with charger	|
+ * |		|		|       plugged out			|
+ * |		|		| 0x8 - 0xF : Reserved			|
+ * |		|		| Bit 4-7: Reserved			|
+ * -----------------------------------------------------------------------
+ *
+ */
+static int qcom_ec_set_fan_profile(struct qcom_ec *ec, u8 profile_id)
+{
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(ec->client, EC_FAN_PROFILE_CMD, profile_id);
+	if (ret < 0)
+		dev_err(&ec->client->dev, "Failed to set fan profile 0x%x: %d\n",
+			profile_id, ret);
+	else
+		dev_dbg(&ec->client->dev, "Fan profile set to 0x%x\n", profile_id);
+
+	return ret;
+}
+
+/*
+ * SoC to EC Fan Profile read command:
+ *
+ * Read Response:
+ * -----------------------------------------------------------------------
+ * | Offset	| Name		| Description				|
+ * -----------------------------------------------------------------------
+ * | 0x00	| Fan Profile ID| Bit 0-3: Fan Profile			|
+ * |		|		| 0x0 : Invalid Profile			|
+ * |		|		| 0x1 : Battery saver profile		|
+ * |		|		| 0x2 : Better Battery with charger	|
+ * |		|		|       plugged in			|
+ * |		|		| 0x3 : Better Battery with charger	|
+ * |		|		|       removed				|
+ * |		|		| 0x4 : Better Performance with charger	|
+ * |		|		|       plugged in			|
+ * |		|		| 0x5 : Better Performance with charger	|
+ * |		|		|       plugged out			|
+ * |		|		| 0x6 : Best Performance with charger	|
+ * |		|		|       plugged in (default)		|
+ * |		|		| 0x7 : Best Performance with charger	|
+ * |		|		|       plugged out			|
+ * |		|		| 0x8 - 0xF : Reserved			|
+ * |		|		| Bit 4-7: Fan ID			|
+ * |		|		| 0x1 : Fan 1				|
+ * |		|		| 0x2 : Fan 2				|
+ * -----------------------------------------------------------------------
+ *
+ */
+static int qcom_ec_get_fan_profile(struct qcom_ec *ec, u8 *profile_id)
+{
+	int ret;
+
+	ret = i2c_smbus_read_byte_data(ec->client, EC_FAN_PROFILE_CMD);
+	if (ret < 0)
+		return ret;
+
+	*profile_id = (u8)ret & GENMASK(3, 0);
+
+	return 0;
+}
+
+static int qcom_ec_update_profile_from_power_supply(struct qcom_ec *ec)
+{
+	int on_ac_power;
+	u8 profile;
+	int ret = 0;
+
+	on_ac_power = power_supply_is_system_supplied() > 0 ? 1 : 0;
+
+	profile = on_ac_power ? EC_FAN_PROFILE_BEST_PERF_PLUGGED_IN :
+				EC_FAN_PROFILE_BETTER_BATT_ON_BATT;
+
+	mutex_lock(&ec->io_lock);
+
+	if (ec->on_ac_power != on_ac_power) {
+		ret = qcom_ec_set_fan_profile(ec, profile);
+		if (!ret)
+			ec->on_ac_power = on_ac_power;
+	}
+
+	mutex_unlock(&ec->io_lock);
+
+	return ret;
+}
+
+static void qcom_ec_unreg_psy_notifier(void *data)
+{
+	power_supply_unreg_notifier(data);
+}
+
+static void qcom_ec_psy_work_fn(struct work_struct *work)
+{
+	struct qcom_ec *ec = container_of(work, struct qcom_ec, psy_work);
+
+	qcom_ec_update_profile_from_power_supply(ec);
+}
+
+static int qcom_ec_psy_notifier(struct notifier_block *nb,
+				unsigned long event, void *ptr)
+{
+	struct qcom_ec *ec = container_of(nb, struct qcom_ec, psy_nb);
+
+	if (event != PSY_EVENT_PROP_CHANGED)
+		return NOTIFY_DONE;
+
+	queue_work(system_long_wq, &ec->psy_work);
+
+	return NOTIFY_OK;
+}
+
 static irqreturn_t qcom_ec_irq(int irq, void *data)
 {
 	struct qcom_ec *ec = data;
@@ -570,8 +712,13 @@ static int qcom_ec_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	ec->client = client;
+	ec->on_ac_power = -1;
 	mutex_init(&ec->io_lock);
 
+	ret = devm_work_autocancel(dev, &ec->psy_work, qcom_ec_psy_work_fn);
+	if (ret)
+		return ret;
+
 	ret = devm_request_threaded_irq(dev, client->irq, NULL, qcom_ec_irq,
 					IRQF_ONESHOT, "qcom_ec", ec);
 	if (ret < 0)
@@ -630,6 +777,17 @@ static int qcom_ec_probe(struct i2c_client *client)
 		}
 	}
 
+	ec->psy_nb.notifier_call = qcom_ec_psy_notifier;
+	ret = power_supply_reg_notifier(&ec->psy_nb);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register power supply notifier\n");
+
+	ret = devm_add_action_or_reset(dev, qcom_ec_unreg_psy_notifier, &ec->psy_nb);
+	if (ret)
+		return ret;
+
+	qcom_ec_update_profile_from_power_supply(ec);
+
 	return 0;
 }
 

-- 
2.34.1

