Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F3E35BDA5
	for <platform-driver-x86@vger.kernel.org>; Sun,  8 Mar 2026 23:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773013024; cv=none; b=tXCnCswGQUXafPAe458OnP9jhlV8/TfgXtKXhdklSO3Wz7QMBukSQ7y4yJ3VOpP3SzM8H3+Y+r8PINNIAKi8j5O0goCS1ejhf2z0p2JHaeU9yCRrNCcUrQtLl9MLBW1jq7EcGgjuhfl6L4IZL/9bo8h/UniUvhKElZI0hyJe4cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773013024; c=relaxed/simple;
	bh=eYkkvK51MTx9Bdfkthyx9CLf6igJE1ETRsExN/41P7w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KlTPm/nhKzQ93PprE4GG4IuBqKUfO85AIGawxSMsfs4zVNviTgLmugRisqCOElJNr+vZAMnKTnv6cQ9yOAlAV/Ib1QfHAhFgxRaOE+jfss+KzDdUHum/JXP9Y1E6SoqRNNlEEWDckXxoqiNb+HyNN8Fj3ovbQ4s8vIpLuEanEuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RuGmkyg9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MaNGHTSs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RuGmkyg9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MaNGHTSs"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628N0hZY3464415
	for <platform-driver-x86@vger.kernel.org>; Sun, 8 Mar 2026 23:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HLnC0O84/rB
	xJH7HK8btP2WKZlrp/hXgCjy/ALgrKbY=; b=RuGmkyg9UIosFzajyGOPZL9W36o
	ykcwZ+tER9klK1Q+oUjomhtQfTRYUk0laLzNnIjnikD47BMC5QJZKzqX/W7LCtNw
	hZoVmcLoklr3SV40+60C9J4BOq8SyREi7Is9d9kzdNjeupTaaCGP48gC/9ES5OPz
	yo3J+KKDsCxexOdGKY/CPp03BhDte0dUp26/HYNLF2xPxjl+X9IeXjCxp5IWCGz7
	X6tDk7WvFPENCZB2Xi6drav0vvu2gX78z1lfjF5HxOVL1Mn+4JAAPLwR3etH73Jp
	NniSwpOOT1Xs9qReeOz/ar1g4Rz+PnnlBnDDe2V3hZxyh7BoteKLOzjjCZQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crcd8b6x4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Sun, 08 Mar 2026 23:37:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae50463c39so71514315ad.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 08 Mar 2026 16:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773013021; x=1773617821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLnC0O84/rBxJH7HK8btP2WKZlrp/hXgCjy/ALgrKbY=;
        b=MaNGHTSsIAhz9i1D7RZG9RCqlH9V7pqub68ePWYWnCiOhWFC1+beYt1y0R3R/6hhCt
         Ptz9eAVK26w8frqDMqfshkP7WJWivpDb7IA2gOwedJSUArFVj3o3HoPKjzH9Xai4VZX4
         gX1nK3xHOsLDUpDx0J4eNYJl0UDssim5SL+R315KesCegeNmIsaLltyQ7czucLgdFkMH
         YTJCZTmbl+4WkKuX87HdgH5DIiN9SdjsLT1uiShlsTcJzKILpl5xex6iGTiZtL1nBM0H
         I3wFMCO1Tsh3F2Z7twG0tyaOoxdXizOirv448phYTXz4WB7Z2hxI3fk+LN+oDQPpDAmR
         ItdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773013021; x=1773617821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HLnC0O84/rBxJH7HK8btP2WKZlrp/hXgCjy/ALgrKbY=;
        b=FZBUIBwVv9cJdr+h5az0iyU1gYBFxZhl1pHhWJsrlH9pGYMi8XLvqBNby+RmaPwkkF
         GpLXvIvq1FCCUKPiEPmgYiIIZGBPlyjjTTe6MZmyc+zr8g6DnXalokId0wPGdE1knNS5
         2k1e/2eKKuCwkQ7fGY1sTSKZbSst9bhvdbckOH4+3Tv8dGUVhfHq4iNmtjA5NqYLbEOR
         IA2DcS5NtuofgNDSa1TK1hS2qzJLkZYlFkFKvxitOcQ6QSYp26fW3Pbq3QPtAzeoM3MD
         GlMtk3nJiW2FvHAmDzPqp+3F67mdM+jbpuP35rlTwEDxpR6fMmcwYnGxgUUYkW7bcv9a
         aKPw==
X-Forwarded-Encrypted: i=1; AJvYcCW7zXe02tF9IMnuTbT3GkMLkdLRXPqLoOeKzJ7c5hJszPrOzjOxS2/4lwGl+yF+J7tecJJPmFTSEcvs6+mCcZWA6B/T@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9Siw4VhDg4gscxg2zoTUKduruu/g+UZt5LMZZ/6Q8e8xSiHb5
	DkndNLRPQBn5Vc1RfLKZ1JDGLtB1/89HvSZq2KWSIQUsBbAoJwohgmt3v2G4OgpGPjHZMLpoFmB
	4Z03llTzctRIpIc9+HaGbOKdPQWhFbfnZim+/wxnC9vlZrlth77NWCoxqbIw+jUUoxRNTj4k/6j
	xZ
X-Gm-Gg: ATEYQzzvZi+CrFhLZWVSutQPK7iMGICAVDL7qVv4dMrPHZTDEqrQMg6ZOadHJv32pV6
	C8c9FtMqZ1lhtJaj2iy5CNgYwGdkBK2pTJ85+of63jOTMimzgJG2QqlN9L3hSVQazv5DDHVSgm1
	F1D3orYorDSh+w+/JeHtTCyJaHDZAoAFAdF9hOTzXxd0Rir3axe4sNdOI7AUK0Z0mwqQK9UPxRp
	lDNqvzxHQ/pE2n1p8z8lPRJJ66eyA3wDrZrOT7y8/0cw4Phb/QiqYallTxJ2Fc6j/ZPllWyGlZR
	KCjmIZfeMKqr5aLqGWo2m3/RHrU0hHtu+COdFnaRKZtaGYrLIkb2zLoSXIYYwVPxb/JW4BJcX0t
	l4hsnX9cV61dsUrMsznw4/fvhmLb0kFiWuzOsiFHhMS6HyP0+DbpViqZGOVmpnFrv1WXsGr2wxE
	+4yXMI6C319HPIHmmS30e/ZwXAz2EnGwOjdcH6
X-Received: by 2002:a17:903:2411:b0:2ae:517d:5cf with SMTP id d9443c01a7336-2ae825373b1mr93783945ad.54.1773013021307;
        Sun, 08 Mar 2026 16:37:01 -0700 (PDT)
X-Received: by 2002:a17:903:2411:b0:2ae:517d:5cf with SMTP id d9443c01a7336-2ae825373b1mr93783765ad.54.1773013020865;
        Sun, 08 Mar 2026 16:37:00 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e9ad26sm114274845ad.28.2026.03.08.16.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 16:37:00 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, bryan.odonoghue@linaro.org,
        ilpo.jarvinen@linux.intel.com, hansg@kernel.org
Cc: conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH V3 1/5] dt-bindings: embedded-controller: Add EC bindings for Qualcomm reference devices
Date: Mon,  9 Mar 2026 05:06:42 +0530
Message-Id: <20260308233646.2318676-2-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com>
References: <20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: RqNXobwCruEVSWC7GAr0JCHYWeoat2HD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDIxOCBTYWx0ZWRfXyPpgn6f+v+VB
 JF5JySfgJ5gF/jR209RFrnAqlDkoJsCRbN78sVvGxwnz7ZO3LSTEC/SEyCoXwXtICVF7CJJiJbK
 h8CC5YBQkk3XPY0nRZNdCgAYeYbWa5fZNqKM1q4uRvP1UMy1qFVgaCgxyWmvq5nplWQsc4EceAx
 Y86z9atCi3z0g8x9LyimvpkIhntyJMakoBxLTqqB4JmFwrtWv4uMbndhqsFRuCnSDAfiNh48NE8
 /SOrKkEHvEy//iIkTBZZmcX7lG0mq1wqZjAT1LLmwt1AdqkIXDBAkfLhT5/uNW4eRHQ4RkGrADg
 y4/jCyvDGjI/U1jeSlVyrPPKYL7nMOiNSL0SrsvMSSs+C68mvkjq9IKK1q1T3C5PTIcdybcUXY8
 ovOUm10bkkqMsGe4jJgKoTbTmCKfxnZNr88YwFNpcVF4JcYUZfjBcTYDmwb/HxvMOKAQxLygzT0
 dbtmXzA9QKLUXsytrQQ==
X-Authority-Analysis: v=2.4 cv=O/w0fR9W c=1 sm=1 tr=0 ts=69ae081e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=gEfo2CItAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=6bqoFnLgofmmdwMbvCAA:9
 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: RqNXobwCruEVSWC7GAr0JCHYWeoat2HD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_07,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080218

From: Maya Matuszczyk <maccraft123mc@gmail.com>

Add bindings for the EC firmware running on Hamoa/Purwa and Glymur
reference devices, which run on IT8987 and Nuvoton MCUs respectively.

Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 .../embedded-controller/qcom,hamoa-ec.yaml    | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml

diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml
new file mode 100644
index 000000000000..ea093b71d269
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/qcom,hamoa-ec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Hamoa Embedded Controller.
+
+maintainers:
+  - Sibi Sankar <sibi.sankar@oss.qualcomm.com>
+
+description:
+  Qualcomm Snapdragon based Hamoa/Purwa and Glymur reference devices have an
+  EC running on IT8987 and Nuvoton MCU chips respectively. The EC handles things
+  like fan control, temperature sensors, access to EC internal state changes.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,glymur-nuvoton-ec
+          - qcom,hamoa-it8987-ec
+      - const: qcom,hamoa-ec
+
+  reg:
+    const: 0x76
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        embedded-controller@76 {
+            compatible = "qcom,hamoa-it8987-ec", "qcom,hamoa-ec";
+            reg = <0x76>;
+
+            interrupts-extended = <&tlmm 66 IRQ_TYPE_LEVEL_HIGH>;
+        };
+    };
+...
-- 
2.34.1

