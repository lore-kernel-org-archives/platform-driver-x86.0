Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E4740DFB0
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Mar 2026 10:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774606111; cv=none; b=GqfGam/+6cEfFP8tDmRXQAyyJ3An6Kv2KJhSK53FL11/NFoAyODpoWnHQ2ltnfvmz/rP/2YCqiayAmvy4WK+a4o8Rz4t7kkaYz3L6TzczWLG4bE3/WtDWzOFDxSxXrcz1BJ/TzY9gXbnrtrDo8NEmf1iliLyQ4xI0gxejyGPE54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774606111; c=relaxed/simple;
	bh=zFarwFyP7Mwjc36+jVJxSXy6/e4tQoyriPLsSHSmWgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P0UNNLRfkroRnIDODz6ItW4OzLcV0v7S0Mpo8izTVbSbo0TPGxtA51SOjhHg55XvqCo3B8dl8ZBoHNVkrEOeAcY77MswDjs2M1See3PKtr8oIfSdiO131GfbJXCE++ac0UR0k2V5031VBt/GHEsxTTmnHM0hbKkzQHKosj+bLaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c55QlWZT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZL6nmuwT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c55QlWZT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZL6nmuwT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vrc93713868
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Mar 2026 10:08:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hUZQteOkDmv1t57NkB6ARC1fQRP9JD9uH5Ktg+HthLo=; b=c55QlWZTIqH3kt0b
	BzT4MbUejVF5XT9ecsnKzSZOP+eUw79msQgPUYNjA8+bFexRV18N/ijY4pH50LLw
	CCjhajW5SYBJU//8y0DcSwqRsQ8j9AEM4ePRAkpLSMCnqEU4sP9k0Ud77E4AasBW
	shzoMTU6CHDGeXGn4GbOmrTsTjNeuPl/6cUx7SksfWrkG3Yc/FjdoTEZ6sAXwCla
	i8nr0GUIYFvmpKcKHJqbwsKGwfp7iSUG6lcmYQRLHuissM9kowGbIU/5SltnqTsg
	Ke0fZg+v6y/ZdKcrWzh6Y9N3p0RiAB51zvjpfw5kFQLAtnBlxwSLczj2PlfW2g4Z
	Jj9zUg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5hapsmdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Mar 2026 10:08:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b0c8d0df40so31629335ad.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 Mar 2026 03:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774606108; x=1775210908; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hUZQteOkDmv1t57NkB6ARC1fQRP9JD9uH5Ktg+HthLo=;
        b=ZL6nmuwT52ofx+3Jc8kS52AOcLIAdy8efUxQ/GYnCEq1fM18pjP9ZpljOY3EDW5AIR
         jiPpAN1wQWGrdf18YRerl1B8V9OXcfX/2ezUN04ynkiuDKcbP5hiKfxgO10nywgcFQEi
         HxNxOIdy0jbl5QNuSUraLD/9Dqn7WUJ2dBxZTa92eF10q10fvXJNK+D8piB7D2cP6BYk
         t9suRedfQHBt3XGIb5z1UqV8uJHWBgQlHF32p++bC64ryk4j56h8QHVj+wdTJPvmvs4S
         cIrcxxF1dlCD54i3ADECJI7pLCXFxp96SBg/DgzB1iSdC216YudXZsGuHHaHwyURGUU/
         WGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774606108; x=1775210908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hUZQteOkDmv1t57NkB6ARC1fQRP9JD9uH5Ktg+HthLo=;
        b=AJ8ma+kufAwfgs0ISpxInwMemAe3cDaqYK//wxvYEiqSJjONPoNrFM/OldUYrAqOeu
         AJufpfqQtGcEwKApo5YFhzByEEZpHLEvalBAsVr8ZKV9cRz0ALZTU+MTrCMsFWFPthcn
         Cl8p1xge+fnnUb9K/bJ8POFa51FnQN6KdYew9HdMs9SH3AATVouIvE0D0oZhhlaw/jPZ
         b5aHHpJ5uKjc5rR8auh7F+IvAiURXydoeAzG+04OmWkJki1Czm2uJxktnNm6HvxQw0D9
         YBgqCvGrcoOJts08Gfh584tMvPE7qY3rPmm9I0DEmPufpMC/+APZQT1Ph2JvKGKfIo45
         zd0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUlB1rLfrbpXLsniaf1M31X8GRIH/B/utC8QCDtq8qBxOcmasfBmetJ42eRhvnkl+TPk93q/S0VBl6+yg8tGSBbEwad@vger.kernel.org
X-Gm-Message-State: AOJu0YxmaDfBRd9fcUw0UJeki1whiHdTp8lrt5WT+cy1J8zx+8yeWdoe
	NUdgo20cRAMeWm2Gs95t510cqp2wdQs4RbUQmkEJ9gSf0g5kTdHGVe94sUCLH/Pd0K6nUjegYtN
	OHD/J15f46xY0JjkssuCHfJZ936hiYUdlcSZD/ZbjCEoCs+mtHbnT6dBVufhUEf7GlO99TqIC0I
	Qp
X-Gm-Gg: ATEYQzzN/5Iuvlm5OZoqU7Q9ST/zdIL2QfZdlGA8JxyhVJ3uEx2LqaBChNTgwUoEpEO
	g02wX0qKiGNH6jmqJllo7Mp/DBn/iJl6cOb3So5f0Ul0j+3Nnz5u4byvdppVDddGBC67lWd2EtK
	AJ3d1RAqgHkQKOfATvPlpZ8TZ/4ehuBj3ostu+0o1lkZykotLVDCCbXlbO+13KRLAvqWmprmTNK
	6phxjvHajtZ3SlhEy0POBEZIEIDPn8feam4YMlrwvgOLsAQ0o4qcH+ZYYRT30sfqgCkzOCUP2t/
	2YFncAMWOhRGGQ7d/7w8CBOy0huM5tKt3kbL5FjV6vnda+Ge67ERP3cFz4ry7RezWuETz4H0JLf
	NqWTd0mcVKJoBeHCejcCYuh0zUFH7cgV4AlDdObTuiFycNdTYGBRZrmr0zCsct5IYA36sQfmjL7
	8+5JytKMuiQL9guJG0iZAXk3vmfLmXuAb9qA==
X-Received: by 2002:a17:903:4407:b0:2b0:5e10:9dbd with SMTP id d9443c01a7336-2b0cdbeb419mr21200105ad.3.1774606108339;
        Fri, 27 Mar 2026 03:08:28 -0700 (PDT)
X-Received: by 2002:a17:903:4407:b0:2b0:5e10:9dbd with SMTP id d9443c01a7336-2b0cdbeb419mr21199805ad.3.1774606107878;
        Fri, 27 Mar 2026 03:08:27 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc786b7fsm74465675ad.20.2026.03.27.03.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 03:08:27 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 15:38:14 +0530
Subject: [PATCH v7 1/5] dt-bindings: embedded-controller: Add Qualcomm
 reference device EC description
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-add-driver-for-ec-v7-1-7684c915e42c@oss.qualcomm.com>
References: <20260327-add-driver-for-ec-v7-0-7684c915e42c@oss.qualcomm.com>
In-Reply-To: <20260327-add-driver-for-ec-v7-0-7684c915e42c@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774606096; l=2330;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=p1qib2l7A/JEOeiEFUXoqiCJEoH/aeCCTCy9wrPvB6A=;
 b=ibsuvcDp7Sci9hgY/3jUzw1fXjDiY0ZejF27wXljaMswnfyugfwJ3uNG0dIWxoB8AvBUswIOD
 tEx7k/gH9++D2t9Xkg/+d1HwaTmOXDWXfd8TjfEHcfAacxuUgEvO+ZX
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Authority-Analysis: v=2.4 cv=TqnrRTXh c=1 sm=1 tr=0 ts=69c6571d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=p9JF3S6fNoJM7NwPcqUA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NCBTYWx0ZWRfXyg7ZaKgmp+lg
 pXtI3McrGRS2aOCs5LlfKEHpZe8pAuYaj2m+bQyQXtFc94gzqBS4PenvdJhnHRhfKpqLJvIg50K
 kfW552Litmd2HUz8uHq0qMf1hWR/60MeJamQ+5atIeS4Rg4RgkUjGg1H1Q50HCZS42/LqfLkSKB
 VlIunVizP2CTcOqia639pBN4CSevqArGMpc7URy6n52+kBBWHUWwN3CUzdwLG2vvq6Qs/VNfQmE
 bPH04dUNj7Ib00iZAnRmFNGDAwlnI0zfBHuroF1tWPTXLf+2U848sH3GZpq3S/p9PUsLpHLQDFV
 OCdnI6mpq5uEUiOspcdbqaXtSAHfTOtG9DHs/bdlTLZr5KT5SmVtGfStxxhdD00SzZlC0HMO3p8
 0SzKNIrTBb35BH1LtHSOSro1gUH23zeGQKdxTSsgWruIjrax5Rst6Y6kQwY3hKTDKPQ3K3GHodv
 Aef8kdgOT1yiuZvOtWA==
X-Proofpoint-GUID: dPuqSDdJerm0IPsOOD7r9XEv5SY60zlw
X-Proofpoint-ORIG-GUID: dPuqSDdJerm0IPsOOD7r9XEv5SY60zlw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270074

From: Maya Matuszczyk <maccraft123mc@gmail.com>

Add description for the EC firmware running on Hamoa/Purwa and Glymur
reference devices.

Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 .../embedded-controller/qcom,hamoa-crd-ec.yaml     | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
new file mode 100644
index 000000000000..ac5a08f8f76d
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/qcom,hamoa-crd-ec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Hamoa Embedded Controller
+
+maintainers:
+  - Sibi Sankar <sibi.sankar@oss.qualcomm.com>
+  - Anvesh Jain P <anvesh.p@oss.qualcomm.com>
+
+description:
+  Qualcomm Snapdragon based Hamoa/Purwa and Glymur reference devices have an
+  EC running on different MCU chips. The EC handles things like fan control,
+  temperature sensors, access to EC internal state changes.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - qcom,glymur-crd-ec
+              - qcom,hamoa-iot-evk-ec
+          - const: qcom,hamoa-crd-ec
+      - enum:
+          - qcom,hamoa-crd-ec
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
+            compatible = "qcom,hamoa-crd-ec";
+            reg = <0x76>;
+
+            interrupts-extended = <&tlmm 66 IRQ_TYPE_LEVEL_HIGH>;
+        };
+    };
+...

-- 
2.34.1

