Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB644E0219
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 14:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160243; cv=none; b=k1uva3Q+qLf/ZXx/dz/zasiDtALJb4epmSISrPhIp+KNOGn+A+hrTbb5TF3jP3elDqwQQmUWGdt9tyy9IWc1k4cwX150r347nMvDUkX3SCzpnlWqv6Ksj+G49Y860gVAb6aP9Y66kZbh9uNBs9ZW8RQ9xfcsMnoQZQGalx99fAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160243; c=relaxed/simple;
	bh=NUneaeMkro41YBBJrbILDFHZrCCroRaL0stp9ywmjCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DWz+8j2iHw1gOf9j7QGAIpoWB9uyuFlLTQRp0o3qKg0xOfL5RZ45A8x20jLS+zOFwGizART7RJSMZeIiRdWGXgcYidjrtwzvcALnnFNJB2jCB0Kffv7YifOTEwv0YQ1S6xzb7FPTMCjCNjw7Qa2rmY617RKAnWyH6nAlQLHVJ2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=no0VPDW5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zc1fZbTB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="no0VPDW5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zc1fZbTB"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE5jtQ1911011
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 14:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Oudz1CdP6yY
	TxbEMePva/E7QsVxdjGK26nlaKicEfLw=; b=no0VPDW5GlykMX2Y21vekc8t5f9
	346/cv3wGcp/fx3dIcvDf5c/17Wg7CyYqYGqRvUW+fDYchOngx9WMRQYFAiA8xnP
	N3Qf+l0ZlmpsudDPRQSZI6PBmr93KseaPJ3ekd0UaNjsk4ZmlrGNyJLIAHaGbWpi
	Biv24vitDFIxW+sdpQTTtE4Vk+XMMv8UGbkjrUiEhlRbNqB31kyz1CWLsasmNB9j
	iZMQ1DdKkd27DJEn5+Slt2jTuSmTCOXdijoZPFMvknaaZhKUOFtTRq98sgiII9CE
	tL1ogjgtXAQXFygYDvt7WCZwiftrAkHbe1kHNd92Caubrbu1C68j+eU/J/w==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbjmf8q4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 14:17:21 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5decf4b8cf8so1778024e0c.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 16 Oct 2026 07:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792160240; x=1792765040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oudz1CdP6yYTxbEMePva/E7QsVxdjGK26nlaKicEfLw=;
        b=Zc1fZbTBucxzUOZtT1S/DIIFR8c88podYlZT1TsbSbimgBVrAB5arzmZF6zQTirYEc
         htovF8trIP8s77TBCXXJjMRet9VUmByRCTxYo0e8QFKa6cFiPt0a0qcg4HhomWr9rXa8
         2MO4XYNZKW3ypYGa4oL6pOhh0feQOErw+lpjQbvyVH2fzTAA+0VIIENavGL8KkuyOQ6r
         QEgxq1RSYTbn+uGsTtcRMS5MmcLggGHOcL48SJiuUNJXQ3A+hXmHJYW0zVzQllnQTrqO
         QZbPYYZcFxcsMvJUOSHRoer980YWaltqJkTmMyZPTXEVlaAWLo11sW5jOsEZiQeU209+
         UN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792160240; x=1792765040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oudz1CdP6yYTxbEMePva/E7QsVxdjGK26nlaKicEfLw=;
        b=uW+kAmjWwWSDV48aoyqPZk2/2/cHVjbKkbm7zrN1uBz24dHMnKirbM4yKuJEy56pjJ
         YqzUuTY0kE+GT/tJUQLUf38qjOphIJffdehZMa+Y4dQ1jY6FqXHzOXFJkg7TtB4brOCV
         8cnIVV0cfJXUEIAZLZLzoDGUMRsUhXqdWIvRXGZH4pAgd8rdaY6Vn0xHqoruHTkDYz+q
         /s2ibz5vKZIekcz92hylzMgIVvRg2x5Z9nm74GVqUsvLeknD1FMMHAEL+Coo5IB4WF/c
         Vu2+dGc7RqkleAuYd/tX0cTMVVB4AbacVk0mC2n4K67kUV1RDEeO0HEmYssRrOpGRiKD
         ZXRA==
X-Forwarded-Encrypted: i=1; AKwUvBwcoDEzuEn1gb67DFtdpEIMg4KcVOBhpjsVGSg5/tIiLwwUxCKsTRwuPheAsV9KItHbcHfkJYBjlmYebd/ViAGXHvJ/@vger.kernel.org
X-Gm-Message-State: AFq9FYKPGt5qgvy3am+MvroKG67eoPeInT/y53rXahK6KR8vyN1NKAW7
	jclYEADHsq1tQUOEkAbH0tHfGDthX19qfzQSyGdhLgF2Rr0VBoKBKlDR0Xm2KPO37UuDvJ568ff
	hTcT395JgAyTLg5VRGJ1y3xqV+rSruPoB58AXa26SllPm7BSp840oyn6duc0ZHFcnodASdt61C5
	Pl
X-Gm-Gg: AYBFou0WpiKrZhdRazZd31iZP4+nVJS83Y90oDfthWN+JpFr/+bwN5NTBF8Fpcaf8bq
	vkM8dZ3WO54+rKhz6ubpfuxL87QE5toNKlWk5ButtUMFeMPPavGZGonVcY2NKomFPjbOljHSr2E
	rP+Z3AMk65kZtZTFHV+g80eYZZZ8mb0CfDVMCreOTn+ur0Cxk+dVHnEpkhYGmM9EuH3SXbwKBbG
	OArCBnQp8beLXF8nUXMHPv/gX2P5R2mhKWJGC+Xl/D3bC46O9wAurexS4dTOJuRUPQiitRifIad
	XZ9xZj66n1Jbdxv4n1eTiPO/UYsZHOQIHV0UADrto/vhaH4Jo5Z550DzxmKL/J51wle1iK8Va5U
	8hb9G8MpVRLEJNJPmq2NO3BAOguPVRinKUaEnMV4zITqdneYiUeuO22Z/8fXBT/IEM5vA3y/ePj
	l/WwBFOFh00H6uLQ==
X-Received: by 2002:a05:6123:2eb:b0:5dc:d0cb:7d6b with SMTP id 71dfb90a1353d-5eaaa65aa82mr77760e0c.14.1792160240110;
        Fri, 16 Oct 2026 07:17:20 -0700 (PDT)
X-Received: by 2002:a05:6123:2eb:b0:5dc:d0cb:7d6b with SMTP id 71dfb90a1353d-5eaaa65aa82mr77737e0c.14.1792160239541;
        Fri, 16 Oct 2026 07:17:19 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c03bbsm71144166b.64.2026.10.16.07.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:17:18 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Antti Laakso <antti.laakso@linux.intel.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Alexander Patrakov <patrakov@gmail.com>,
        Leif Skunberg <diamondback@cohunt.app>,
        Sahan Nissanka <adee.sahan@gmail.com>, linux-media@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/5] media: ov05c10: Support full range of power rails
Date: Fri, 16 Oct 2026 16:17:12 +0200
Message-ID: <20261016141716.130220-2-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016141716.130220-1-johannes.goede@oss.qualcomm.com>
References: <20261016141716.130220-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4oK9EcA4ZJFRMXCFINjq1qwXdg7PvllN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX0xU0VrfIWNxU
 BaMUrh7cM5AEmPGvuHLD2GwnzBt36Lj50S1nbTt/U7xeBL/wQ4PAQL7mcyR/VdzSC6305208W3J
 Nb6myHzNmowU4p4qvCscjloLvJ9ZK1A=
X-Authority-Analysis: v=2.4 cv=SrAFe/O0 c=1 sm=1 tr=0 ts=6ad231f1 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=x68c91NkkiPh6XH7nFIA:9
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: 4oK9EcA4ZJFRMXCFINjq1qwXdg7PvllN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX5RLrz/LYco0W
 iq08JCCQvrMstALd778B+gKpmuJnZhoYi4h8KG+eQrTtr7MJqdxiI9MLhVC620e7WMi89t+PVmg
 emr3sL/TdgfZQIGkqtsZ1KRnkuNa93TjK80FLJBkHrUAVvHdavdVFaXiJbdofJD7mSAoC5vONfp
 pbk9D0HZ9D5vAY8NHA/SuqML6I3eEFZySWaUrn4KQGNitmi2YVc2ZYtlPmmVqFKBLBrpytrA/GS
 Eb72EbI8WoyhMLbUiuu5GAAUsIkCpU7qYOnfsUnMk9l1lXvrYdUgDppejyQ0NoGSOPoUSIHa8mf
 ym6926KRJmhII6mUhF4qwreIpjXtyn+oxcIp08gH6jjlI3UT8/ZIuUqBMB1f1DmKKfcgwy0zIAP
 fAO6RFfF0bgxjOmAFTe2O6kL+45WqKU5jD4V6YUQBNlfMGT2m4KmJXdzx+E/lFPRUVGnS1g0cP6
 xlcmr01+sjY2Cdn4vSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160056

Add support for the full standard set of power rails for Omnivision
sensors: "dovdd", "avdd" and "dvdd", using the regulator_bulk_* APIs to
manage to regulators.

Previously the driver only supported avdd, but depending on the design
some of the other power rails may need to be controlled by the sensor
driver too.

This is a prep patch for some INT3472 GPIO -> regulator mapping changes,
which require sensor drivers to support all 3 rails to avoid regressions.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/media/i2c/ov05c10.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/ov05c10.c b/drivers/media/i2c/ov05c10.c
index 8fe4dc0d9405..f94752dc626f 100644
--- a/drivers/media/i2c/ov05c10.c
+++ b/drivers/media/i2c/ov05c10.c
@@ -7,6 +7,7 @@
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
 #include <linux/regmap.h>
 #include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
@@ -279,6 +280,12 @@ static const struct ov05c10_mode supported_modes[] = {
 	},
 };
 
+static const char * const ov05c10_supply_names[] = {
+	"dovdd",	/* Digital I/O power */
+	"avdd",		/* Analog power */
+	"dvdd",		/* Digital core power */
+};
+
 struct ov05c10 {
 	struct v4l2_subdev sd;
 	struct media_pad pad;
@@ -291,8 +298,8 @@ struct ov05c10 {
 	struct regmap *regmap;
 	unsigned long link_freq_bitmap;
 
+	struct regulator_bulk_data supplies[ARRAY_SIZE(ov05c10_supply_names)];
 	struct clk *img_clk;
-	struct regulator *avdd;
 	struct gpio_desc *reset;
 	bool identified;
 };
@@ -753,16 +760,20 @@ static int ov05c10_get_pm_resources(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ov05c10 *ov05c10 = to_ov05c10(sd);
+	int ret;
 
 	ov05c10->img_clk = devm_v4l2_sensor_clk_get(dev, NULL);
 	if (IS_ERR(ov05c10->img_clk))
 		return dev_err_probe(dev, PTR_ERR(ov05c10->img_clk),
 				     "failed to get imaging clock\n");
 
-	ov05c10->avdd = devm_regulator_get(dev, "avdd");
-	if (IS_ERR(ov05c10->avdd))
-		return dev_err_probe(dev, PTR_ERR(ov05c10->avdd),
-				     "failed to get avdd regulator\n");
+	for (unsigned int i = 0; i < ARRAY_SIZE(ov05c10_supply_names); i++)
+		ov05c10->supplies[i].supply = ov05c10_supply_names[i];
+
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ov05c10_supply_names),
+				      ov05c10->supplies);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get regulators\n");
 
 	ov05c10->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(ov05c10->reset))
@@ -778,7 +789,8 @@ static int ov05c10_power_off(struct device *dev)
 	struct ov05c10 *ov05c10 = to_ov05c10(sd);
 
 	gpiod_set_value_cansleep(ov05c10->reset, 1);
-	regulator_disable(ov05c10->avdd);
+	regulator_bulk_disable(ARRAY_SIZE(ov05c10_supply_names),
+			       ov05c10->supplies);
 	clk_disable_unprepare(ov05c10->img_clk);
 
 	return 0;
@@ -796,9 +808,10 @@ static int ov05c10_power_on(struct device *dev)
 		return ret;
 	}
 
-	ret = regulator_enable(ov05c10->avdd);
+	ret = regulator_bulk_enable(ARRAY_SIZE(ov05c10_supply_names),
+				    ov05c10->supplies);
 	if (ret < 0) {
-		dev_err(dev, "failed to enable avdd: %d", ret);
+		dev_err(dev, "failed to enable regulators: %d", ret);
 		goto err_clk_disable_unprepare;
 	}
 
@@ -821,7 +834,8 @@ static int ov05c10_power_on(struct device *dev)
 
 err_power_off:
 	gpiod_set_value_cansleep(ov05c10->reset, 1);
-	regulator_disable(ov05c10->avdd);
+	regulator_bulk_disable(ARRAY_SIZE(ov05c10_supply_names),
+			       ov05c10->supplies);
 
 err_clk_disable_unprepare:
 	clk_disable_unprepare(ov05c10->img_clk);
-- 
2.55.0

