Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994C63AFAE0
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 17:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785260723; cv=none; b=IToCtA1nMKIAdKWP7IUlNOZNUZvx/vuvlup11YnIKp5TZPmSWI/knsi1awgdyIgrTbOofqlCHnC1eFuj6w+66MdeWiTYpJQ47/kHcZaz7UNrtrfILR0HMw5Oo8MoH7BHrIsnfAcHcIIc5WjzrTXpBbBsHixXqSSf/+VVW45Ajg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785260723; c=relaxed/simple;
	bh=HHfOVi9yBAJed7tYmrKOd5KkJUBeO7KW5Zy+UymhVyo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=geM0x9vDXIY7QTa87Ks7Ll3vUrJJsucAGNJGNvQ6k+W8DyrRQqTFNeDCMc5yvUGl5+BnYqn0oNnbzxeuqzJ63qjfBfcQySz+pswaherVea0suareLH8e+dEQBenn1r/4aMoo44+tVRZTcyo25XqQdQ+zF9lawifBqIaI9UEKThM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nBlNGS7n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U9YL3ABt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nBlNGS7n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U9YL3ABt"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SEcV902838391
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 17:45:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f1nXq5jJeJ+KC5VZupby0oTpejklKGunH5VCvGiN3Ms=; b=nBlNGS7nN2p/Cpyy
	/IPTtEfoK9Bwo8ySRkK4NqluFHfx35TYtB5h4M7Hvl5cEZtPceIh+gyqRf+h7fp6
	Ni3I3Sgfpwt46C4Y3ZzytGJAz/tn1yISRXRBSXxx6Ht1R36zzm0RE9XQVyR4G8it
	ohL3LARVP39nnNdX+crlDpdtP464xhGq8FYuUYUjardwX1vcBO6jrwuagdTDzcKL
	MNS5ndZKm2zvtI38tQu19O9FL3j6+OsBJzHi/WX6C9p0LfIlKAzxGC0/vWxNGPq+
	SSko/iB+sdsGrQOHVf+sKd7uHouBYolTRFWAYBY5oh3a3W3mpJlX44VKeZW4/5la
	DZjvzA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpvd3ht6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 17:45:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dbe39ce62so107595a91.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 10:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785260719; x=1785865519; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f1nXq5jJeJ+KC5VZupby0oTpejklKGunH5VCvGiN3Ms=;
        b=U9YL3ABtdRyFaJfWi9PQ+VdsgtPB7fU8m8G6cbOu+Bbjt/wHrF0PgRPVXpFGRlIRb/
         OuEiasJw+1YJSfROxsClWa5hyqWHZDoJD5qgtik76G63Xe468rieHDWBMyVDfqHfW9q9
         +yHz2SS7gy3vBDhZpuzkBeZT7QP9KM7j+yeqzddWZqdpSYOThkTObiSpR6SKUcWZl3zb
         lO3hzhpB0OQJ79kvjx2MQqdm5+O+hni7x1ud2SJSZ1AM2IJEhdgYy6d+CyoRWR569fEG
         XsfpKi7vAPv+eHphpeezGLiEtiI1bTYBfvDv65d96vK5ZmciULU8EP72vWSnSwqkNpj3
         e+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785260719; x=1785865519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f1nXq5jJeJ+KC5VZupby0oTpejklKGunH5VCvGiN3Ms=;
        b=s/Y0cbEvXKba3y4RQBpfHq4Qab9nS0DlxY7Mq/13Cm693gdXvVNd6LT8/mwtLSnCL+
         bQ/WXeFHqUlcxe19OjtRWsTvrvf87trymG9PUNymIEt5Ff1ccI1uQDIrMcwmDZjBQ1Sv
         zqYuphZ69s/tp0QGwcQZcKnpIp00f9jynRAbM79IqjegsGDLnQrOIlvjzKREgkRuErxs
         ypV9TOye/WsoisTCOTOvxcgatF4ig1mUnnJmByhsRbqKcl3xaLNctb2HUmh8Cpjx7FEN
         YssJwHHETKtvolssosJQw5y4myMxC8IAgLHVj1BWYA4ENme2gxUJSr7lIp8HrUbyrE6e
         EmiA==
X-Forwarded-Encrypted: i=1; AHgh+RofC6/A0tkMqijn1g0gNN8ABl0uXjeYqUPVHmZGOQD+mXnt7/sdfO9+HSvALrA6hJIqYkrYnbmVrk4uuh4m31VGPifI@vger.kernel.org
X-Gm-Message-State: AOJu0YyT/l0N4rg5ftpFaLo4ReBLAlNs7RAOpsdI6KayuRK1FvdFq0UK
	CVkVnRL2mF9/8pNIZ2Yghy6oZi0NU6dkh9tbrpqWo0g+B8rJgSVmsIKxuNvGegOcPbWS+yWgOOG
	QGi+bzen+L7KQ7FFvGS1TQFFZJPmS692e2Kr8gjQczEntlWqbzJcr/oF9BfXm0D2e+H2msRNip9
	Wc
X-Gm-Gg: AR+sD12mnQ0fv9YNCt7dO8U3mm1IexwREQ2u66RQLOS1qtNyqTFOuCbg+mnGlmjW+mb
	arrvWt4nct/X9zwcG9857hAIiVEHvVij2LCNdslWqsaubO1wNpZxlidmrivVjGgDrJa2MukcV4+
	rCd31Cclf4S3ELm/2A71xaaWoouvyDA8Z5K1yNkgXZDNmklRL9WGepdpYmXAHj2WI0/A5wYKmiB
	CE50mZ6xX98NDX942B7nsjBcthkSwcx/KFXfCEJwTtudeO61C3XnzPI/RUPvOJWPFcqHLXvlA7O
	A30ccGUnxkqYkORypDIpRuIuNcl7K+rb5Nwgkd+x1R2DfgVmkAhAKqvLeXgQthtR7RYEq6nwCUM
	ua63MIP8Er2ZXj2aKQ7fVjXaii5Y8cdHSkk4ZxCo5BjUeiY99gI24bUeuCe76oqxazU5LI9LZ8b
	90FwyraaGSdm9t
X-Received: by 2002:a17:90b:37d0:b0:381:10a3:8b10 with SMTP id 98e67ed59e1d1-38f6a3371fcmr3640647a91.14.1785260718999;
        Tue, 28 Jul 2026 10:45:18 -0700 (PDT)
X-Received: by 2002:a17:90b:37d0:b0:381:10a3:8b10 with SMTP id 98e67ed59e1d1-38f6a3371fcmr3640627a91.14.1785260718461;
        Tue, 28 Jul 2026 10:45:18 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7273cd9esm749553c88.13.2026.07.28.10.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 10:45:17 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 23:14:30 +0530
Subject: [PATCH 2/8] platform: arm64: qcom-hamoa-ec: Add SoC junction
 temperature reporting
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-ec_add_more_commands-v1-2-771abd65ee1a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785260700; l=12818;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=HHfOVi9yBAJed7tYmrKOd5KkJUBeO7KW5Zy+UymhVyo=;
 b=f7huBfKohFB5yN/kqtsePe40zDFuah0asS7Npk330vv9ggcTyMAdwb0MfWofrHgyg+5Fjhiry
 kTYI+Mdo2qJBupOctHRKc4k8syNYkZkfYg9I/H1gUt2gdukWtNE3xxv
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDE1NiBTYWx0ZWRfXxbSE9dqyL4ZP
 cUTn89rqJpk0aQlADk4cnUDS9ra766Urt+NCbSaiSOdE5ELiEhUrq7yU3WkMwMAgXPWTlqWUhy6
 uMsz17tcN1hxObFVLOX7J2wUs+NQ150=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDE1NiBTYWx0ZWRfX9RhsTG0Wr7tQ
 ao4GQAfB/CPJKmN3kNsRAWBsHmlc05Hrzt1gAdommx/s2f51yZCxQViLQOpPtghYSlu1+7N5Dcl
 vEuqW50Xj+nGyiVbt1Fgk8T1yQQBKRfQ+6hitavsfMo0vipoooSq6KDAwMYeQ4DQYmv6AlWw8Hs
 aEhhwqtl1F7Q6Ng0qbZ1sPdwEIxrl0JnFNV0PMAPiFfAzXTmy9idvZVW20rXMqirzl6QJLzMwAe
 tyN/wui5mV7GhQA0eFy1/4rKHGU0HUi8ut0Fa51cr5nnJTd3SKycXWGJv+pu6TgbVnwidmZ9rdF
 U9S8vXYuE3b4CJg9brp8inauIHIVC9PgiCPDNzv1ex/4QsjyKhNwXuqq5ejiwmNfQXruT6Wri8+
 KL5b2a6sPwNwGQfZHJsqLEkcyg8X2VUs7ByzoLvClNGqV+r3bybc2DlBveEHZY0qbnJtVnpayML
 NLAW/iswVEqd+nR/kdw==
X-Authority-Analysis: v=2.4 cv=SqegLvO0 c=1 sm=1 tr=0 ts=6a68eaaf cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=iTxp0ioLXQRmjZty4voA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: -AX-RgTn2Qc-cvXWw4eXuwU0-Q4b2uf3
X-Proofpoint-GUID: -AX-RgTn2Qc-cvXWw4eXuwU0-Q4b2uf3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280156

Add the EC command definitions and handler function for reporting the
SoC junction temperature (Tj) to the EC.

Discover the platform's thermal sensor to zone mapping via the
qcom,tsens device tree property, average the junction temperatures
across the mapped zones, and periodically report the result to the EC
over SMBus using a delayed work item. Serialize this and the existing
EC command sequences (firmware version read, thermal capability read,
SCI event control, and the SCI IRQ handler) under a new io_lock mutex,
since the delayed work item now runs concurrently with those paths.

Re-arm the periodic report on resume and cancel it on suspend to avoid
racing with the modern standby transition.
---
 drivers/platform/arm64/qcom-hamoa-ec.c | 257 +++++++++++++++++++++++++++++++--
 1 file changed, 242 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
index 5ca7308c6077..4c745b78322c 100644
--- a/drivers/platform/arm64/qcom-hamoa-ec.c
+++ b/drivers/platform/arm64/qcom-hamoa-ec.c
@@ -6,6 +6,8 @@
 
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/delay.h>
+#include <linux/devm-helpers.h>
 #include <linux/device.h>
 #include <linux/dev_printk.h>
 #include <linux/err.h>
@@ -13,17 +15,25 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/slab.h>
 #include <linux/thermal.h>
 
 #define EC_SCI_EVT_READ_CMD	0x05
 #define EC_FW_VERSION_CMD	0x0e
+#define EC_SOC_TEMP_CMD	0x20
 #define EC_MODERN_STANDBY_CMD	0x23
 #define EC_FAN_DBG_CONTROL_CMD	0x30
 #define EC_SCI_EVT_CONTROL_CMD	0x35
 #define EC_THERMAL_CAP_CMD	0x42
 
+#define EC_SOC_TEMP_SOURCE_TJ			0x1
+#define EC_SOC_TEMP_SOURCE_TSKIN		0x2
+#define EC_SOC_TEMP_DATA_SIZE			2
+
 #define EC_FW_VERSION_RESP_LEN	4
 #define EC_THERMAL_CAP_RESP_LEN	3
 #define EC_FAN_DEBUG_CMD_LEN	6
@@ -32,14 +42,16 @@
 #define EC_MODERN_STANDBY_ENTER	0x01
 #define EC_MODERN_STANDBY_EXIT	0x00
 
-#define EC_FAN_DEBUG_MODE_OFF   0
-#define EC_FAN_DEBUG_MODE_ON    BIT(0)
-#define EC_FAN_ON               BIT(1)
-#define EC_FAN_DEBUG_TYPE_PWM   BIT(2)
+#define EC_FAN_DEBUG_MODE_OFF	0
+#define EC_FAN_DEBUG_MODE_ON	BIT(0)
+#define EC_FAN_ON		BIT(1)
+#define EC_FAN_DEBUG_TYPE_PWM	BIT(2)
 #define EC_MAX_FAN_CNT		2
 #define EC_FAN_NAME_SIZE	20
 #define EC_FAN_MAX_PWM		255
 
+#define EC_SOC_TJ_TEMP_POLL_JIFFIES	msecs_to_jiffies(125)
+
 enum qcom_ec_sci_events {
 	EC_FAN1_STATUS_CHANGE_EVT = 0x30,
 	EC_FAN2_STATUS_CHANGE_EVT,
@@ -77,10 +89,14 @@ struct qcom_ec_cooling_dev {
 };
 
 struct qcom_ec {
+	struct i2c_client *client;
 	struct qcom_ec_cooling_dev *ec_cdev;
+	struct thermal_zone_device **soc_tj_zones;
+	struct delayed_work soc_tj_work;
+	struct mutex io_lock; /* serializes EC command sequences */
 	struct qcom_ec_thermal_cap thermal_cap;
 	struct qcom_ec_version version;
-	struct i2c_client *client;
+	int num_soc_tj_zones;
 };
 
 static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, u8 resp_len, u8 *resp)
@@ -125,7 +141,9 @@ static int qcom_ec_read_fw_version(struct device *dev)
 	u8 resp[EC_FW_VERSION_RESP_LEN];
 	int ret;
 
+	mutex_lock(&ec->io_lock);
 	ret = qcom_ec_read(ec, EC_FW_VERSION_CMD, EC_FW_VERSION_RESP_LEN, resp);
+	mutex_unlock(&ec->io_lock);
 	if (ret < 0)
 		return ret;
 
@@ -167,7 +185,9 @@ static int qcom_ec_thermal_capabilities(struct device *dev)
 	u8 resp[EC_THERMAL_CAP_RESP_LEN];
 	int ret;
 
+	mutex_lock(&ec->io_lock);
 	ret = qcom_ec_read(ec, EC_THERMAL_CAP_CMD, EC_THERMAL_CAP_RESP_LEN, resp);
+	mutex_unlock(&ec->io_lock);
 	if (ret < 0)
 		return ret;
 
@@ -181,13 +201,165 @@ static int qcom_ec_thermal_capabilities(struct device *dev)
 	return 0;
 }
 
+static struct thermal_zone_device *
+qcom_ec_sensor_to_zone(struct device_node *sensor_np, u32 sensor_id)
+{
+	struct device_node *tz_np __free(device_node) =
+		of_find_node_by_name(NULL, "thermal-zones");
+
+	if (!tz_np)
+		return ERR_PTR(-ENODEV);
+
+	for_each_available_child_of_node_scoped(tz_np, child) {
+		struct of_phandle_args args;
+
+		if (of_parse_phandle_with_args(child, "thermal-sensors",
+					       "#thermal-sensor-cells", 0, &args))
+			continue;
+
+		of_node_put(args.np);
+
+		if (args.np == sensor_np &&
+		    sensor_id == (args.args_count ? args.args[0] : 0))
+			return thermal_zone_get_zone_by_name(child->name);
+	}
+
+	return ERR_PTR(-ENODEV);
+}
+
+static int qcom_ec_setup_soc_tj_zones(struct qcom_ec *ec)
+{
+	struct device *dev = &ec->client->dev;
+	struct device_node *np = dev->of_node;
+	int nproviders, total, i;
+
+	nproviders = of_property_count_elems_of_size(np, "qcom,tsens",
+						     2 * sizeof(u32));
+	if (nproviders <= 0)
+		return 0;
+
+	total = 0;
+	for (i = 0; i < nproviders; i++) {
+		struct of_phandle_args args;
+
+		if (of_parse_phandle_with_fixed_args(np, "qcom,tsens", 1, i, &args))
+			return -EINVAL;
+
+		of_node_put(args.np);
+		total += args.args[0];
+	}
+
+	ec->soc_tj_zones = devm_kcalloc(dev, total, sizeof(*ec->soc_tj_zones),
+					GFP_KERNEL);
+	if (!ec->soc_tj_zones)
+		return -ENOMEM;
+
+	for (i = 0; i < nproviders; i++) {
+		struct of_phandle_args args;
+		struct platform_device *sensor_pdev;
+		u32 id;
+
+		if (of_parse_phandle_with_fixed_args(np, "qcom,tsens", 1, i, &args))
+			return -EINVAL;
+
+		sensor_pdev = of_find_device_by_node(args.np);
+		if (!sensor_pdev) {
+			of_node_put(args.np);
+			return -EPROBE_DEFER;
+		}
+
+		/* Ensure we unbind before the sensor frees its zones */
+		if (!device_link_add(dev, &sensor_pdev->dev, DL_FLAG_AUTOREMOVE_CONSUMER)) {
+			dev_err(dev, "Failed to link to sensor %pOF\n", args.np);
+			put_device(&sensor_pdev->dev);
+			of_node_put(args.np);
+			return -ENODEV;
+		}
+		put_device(&sensor_pdev->dev);
+
+		for (id = 0; id < args.args[0]; id++) {
+			struct thermal_zone_device *tz;
+
+			tz = qcom_ec_sensor_to_zone(args.np, id);
+			if (IS_ERR(tz))
+				continue;
+
+			ec->soc_tj_zones[ec->num_soc_tj_zones++] = tz;
+		}
+		of_node_put(args.np);
+	}
+
+	return 0;
+}
+
+/*
+ * SoC to EC Temperature command:
+ *
+ * Command Payload:
+ * -------------------------------------------------------------------------------
+ * | Offset	| Name		| Description					|
+ * -------------------------------------------------------------------------------
+ * | 0x00	| Command = 0x20| SoC to EC Temperature command			|
+ * -------------------------------------------------------------------------------
+ * | 0x01	| Temp Source	| 0x1 : CPU junction temperature (SoC Tj)	|
+ * |		|		| 0x2 : Skin Temperature (Tskin)		|
+ * -------------------------------------------------------------------------------
+ * | 0x02	| Byte count = 2| Number of data bytes for temperature value	|
+ * -------------------------------------------------------------------------------
+ * | 0x03 (LSB)| Temperature	| Temperature value in 0.1 deg C units		|
+ * | 0x04	|		| (e.g. 651 => 65.1 deg C)			|
+ * -------------------------------------------------------------------------------
+ *
+ */
+
+static int qcom_ec_send_soc_tj_temp(struct qcom_ec *ec)
+{
+	int total = 0;
+	int valid = 0;
+	int ret = 0;
+	u16 temp;
+	u8 request[4];
+
+	for (int i = 0; i < ec->num_soc_tj_zones; i++) {
+		int zone_temp;
+
+		if (thermal_zone_get_temp(ec->soc_tj_zones[i], &zone_temp))
+			continue;
+
+		total += zone_temp;
+		valid++;
+	}
+
+	if (!valid)
+		return 0;
+
+	/* Convert millidegrees Celsius to 0.1 deg C units as required by EC */
+	temp = clamp(total / valid / 100, 0, (int)U16_MAX);
+	request[0] = EC_SOC_TEMP_SOURCE_TJ;
+	request[1] = EC_SOC_TEMP_DATA_SIZE;
+	request[2] = temp & 0xff;
+	request[3] = (temp >> 8) & 0xff;
+
+	mutex_lock(&ec->io_lock);
+	ret = i2c_smbus_write_i2c_block_data(ec->client, EC_SOC_TEMP_CMD,
+					     sizeof(request), request);
+	mutex_unlock(&ec->io_lock);
+	if (ret < 0)
+		dev_err_ratelimited(&ec->client->dev,
+				    "Failed to send SoC Tj temperature: %d\n", ret);
+
+	return ret;
+}
+
 static irqreturn_t qcom_ec_irq(int irq, void *data)
 {
 	struct qcom_ec *ec = data;
 	struct device *dev = &ec->client->dev;
 	int val;
 
+	mutex_lock(&ec->io_lock);
 	val = i2c_smbus_read_byte_data(ec->client, EC_SCI_EVT_READ_CMD);
+	mutex_unlock(&ec->io_lock);
 	if (val < 0) {
 		dev_err_ratelimited(dev, "Failed to read EC SCI Event: %d\n", val);
 		return IRQ_HANDLED;
@@ -235,8 +407,24 @@ static irqreturn_t qcom_ec_irq(int irq, void *data)
 static int qcom_ec_sci_evt_control(struct device *dev, bool enable)
 {
 	struct i2c_client *client = to_i2c_client(dev);
+	struct qcom_ec *ec = i2c_get_clientdata(client);
+	int ret;
+
+	mutex_lock(&ec->io_lock);
+	ret = i2c_smbus_write_byte_data(client, EC_SCI_EVT_CONTROL_CMD, enable ? 1 : 0);
+	mutex_unlock(&ec->io_lock);
 
-	return i2c_smbus_write_byte_data(client, EC_SCI_EVT_CONTROL_CMD, enable ? 1 : 0);
+	return ret;
+}
+
+static void qcom_ec_sci_evt_disable(void *data)
+{
+	struct device *dev = data;
+	int ret;
+
+	ret = qcom_ec_sci_evt_control(dev, false);
+	if (ret < 0)
+		dev_err(dev, "Failed to disable SCI events: %d\n", ret);
 }
 
 static int qcom_ec_fan_get_max_state(struct thermal_cooling_device *cdev, unsigned long *state)
@@ -326,20 +514,48 @@ static const struct thermal_cooling_device_ops qcom_ec_thermal_ops = {
 	.set_cur_state = qcom_ec_fan_set_cur_state,
 };
 
+static void qcom_ec_soc_tj_work_fn(struct work_struct *work)
+{
+	struct qcom_ec *ec = container_of(work, struct qcom_ec, soc_tj_work.work);
+
+	qcom_ec_send_soc_tj_temp(ec);
+
+	queue_delayed_work(system_percpu_wq, &ec->soc_tj_work, EC_SOC_TJ_TEMP_POLL_JIFFIES);
+}
+
 static int qcom_ec_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
+	struct qcom_ec *ec = i2c_get_clientdata(client);
+	int ret;
+
+	mutex_lock(&ec->io_lock);
+	ret = i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
+					EC_MODERN_STANDBY_EXIT);
+	mutex_unlock(&ec->io_lock);
+	if (ret)
+		return ret;
+
+	enable_delayed_work(&ec->soc_tj_work);
+	queue_delayed_work(system_percpu_wq, &ec->soc_tj_work, EC_SOC_TJ_TEMP_POLL_JIFFIES);
 
-	return i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
-					 EC_MODERN_STANDBY_EXIT);
+	return 0;
 }
 
 static int qcom_ec_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
+	struct qcom_ec *ec = i2c_get_clientdata(client);
+	int ret;
 
-	return i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
-					 EC_MODERN_STANDBY_ENTER);
+	disable_delayed_work_sync(&ec->soc_tj_work);
+
+	mutex_lock(&ec->io_lock);
+	ret = i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD,
+					EC_MODERN_STANDBY_ENTER);
+	mutex_unlock(&ec->io_lock);
+
+	return ret;
 }
 
 static int qcom_ec_probe(struct i2c_client *client)
@@ -354,6 +570,7 @@ static int qcom_ec_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	ec->client = client;
+	mutex_init(&ec->io_lock);
 
 	ret = devm_request_threaded_irq(dev, client->irq, NULL, qcom_ec_irq,
 					IRQF_ONESHOT, "qcom_ec", ec);
@@ -370,10 +587,24 @@ static int qcom_ec_probe(struct i2c_client *client)
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to enable SCI events\n");
 
+	ret = devm_add_action_or_reset(dev, qcom_ec_sci_evt_disable, dev);
+	if (ret)
+		return ret;
+
 	ret = qcom_ec_thermal_capabilities(dev);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to read thermal capabilities\n");
 
+	ret = qcom_ec_setup_soc_tj_zones(ec);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to setup SoC Tj thermal zones\n");
+
+	ret = devm_delayed_work_autocancel(dev, &ec->soc_tj_work, qcom_ec_soc_tj_work_fn);
+	if (ret)
+		return ret;
+
+	queue_delayed_work(system_percpu_wq, &ec->soc_tj_work, EC_SOC_TJ_TEMP_POLL_JIFFIES);
+
 	if (ec->thermal_cap.fan_cnt == 0) {
 		dev_warn(dev, FW_BUG "Failed to get fan count, firmware update required\n");
 		return 0;
@@ -405,12 +636,8 @@ static int qcom_ec_probe(struct i2c_client *client)
 static void qcom_ec_remove(struct i2c_client *client)
 {
 	struct qcom_ec *ec = i2c_get_clientdata(client);
-	struct device *dev = &client->dev;
-	int ret;
 
-	ret = qcom_ec_sci_evt_control(dev, false);
-	if (ret < 0)
-		dev_err(dev, "Failed to disable SCI events: %d\n", ret);
+	disable_delayed_work_sync(&ec->soc_tj_work);
 
 	for (int i = 0; i < ec->thermal_cap.fan_cnt; i++) {
 		struct qcom_ec_cooling_dev *ec_cdev = &ec->ec_cdev[i];

-- 
2.34.1

