Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10ED63C3448
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Mar 2026 12:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773750521; cv=none; b=cKbfMMi++E85xGTGeeEgjPOKLw2zI4Ilc55GaDj2Gd+vpT1roA+BYogrsH2d20Qsmea80AUBfjSmdawd22q+OGVYySQEj19BA2jw1HRtfWNI0ujNYTXqnUxio3t1Vy2eGxAr3MuoCGSm9wEWz+d30YK8N8kIPW77AWZYRjerDhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773750521; c=relaxed/simple;
	bh=jwEbSknkTqA/WdCoJsnCio3M5fUYzjYKyaflSmFl4vU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ME2cLSd9K6lUhX+eX9BshbaxVA1awW8tMrdCbw6e8HA2Itu1x8/BReLkrIdm3tohmXQk3huGMqHN1Qqp8Gji/Tz3ZUuZUYISsZve+dysEcyWbffSngEremhL2fFSYVF4hhDEvthA/NjV2xQEVFAHeTypRx3+GC434Pd10Arku+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DM0hkytw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q4dyzZu0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DM0hkytw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q4dyzZu0"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HCGHg81042729
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Mar 2026 12:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	niM+iJC0eeL7X/cWaAOnCvf7tfxCWSaK+2g7VjRLFk8=; b=DM0hkytwO+R6YrR1
	Zp47SabKTjE0NRt8Sq5NRz9Q6juqcSgThsJtJhkAcAwZIzoAt98g77fUIz2fjI0V
	7xIxS961n8zpeChVC8tO6e/gniHhqQKRwxV5YUABak1tQNxpPdtk3Z+iskbsXNKt
	wQAB3PbTOe5s3HYXwOAYYrJ25jBMaOIecMz/eywO9B611Uv/r9qBlZVpTQQQjkCz
	XEMQYG1BKpG18N4R/0CVB4+mJGXLL17GXskb8YWCS2NkcG0d5BUsVeDc9Z6RryOI
	uzXP/Q0exkR1a3aOIlqJXtMjNNv0Hae2pfqD3RWLR0bsA6leW84rdzIG06tEvcgW
	p3kiYg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxkuy3ykp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Mar 2026 12:28:38 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82988b04c5cso19553495b3a.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Mar 2026 05:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773750517; x=1774355317; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=niM+iJC0eeL7X/cWaAOnCvf7tfxCWSaK+2g7VjRLFk8=;
        b=Q4dyzZu0b/69X0e1zNDXxmgxD7Gbg5WOQl2xKMHo9cr6YPvJyJZWIxc18cU+REUEjI
         V6ZX5C4nfxja9efse0sibKR8oJt36OB/HmvfwyUIInOwTfQIfMmatSUSBo8VugKKayB7
         kGzuSrne5kqK0uaCADrTZya6jrVAKjpitKB/6344QinpBbkZug4gIWkz4XOJwZCCnc7y
         8SPgzbk6Qq9sTvHw4ZO4e0ie4XMWCxx1aIXPHhCGlOLO5oct05f6bIVn477EbO47Df1i
         rwNDlwnIyh4UFQquXaLMwULyZQ+tKLahBBPBL0n9gsaZ2sXM18RskDYo6Ol1NIAvy4sQ
         QOgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773750517; x=1774355317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=niM+iJC0eeL7X/cWaAOnCvf7tfxCWSaK+2g7VjRLFk8=;
        b=B/7PYY4zYCEHdo6LFi3+BqDV7rPWmN4x9kVPQ0ccejAq5KMv07h5O5YxD8E+Xjdjut
         NUkdkhJuuhSr7P+7YgLOra+XVydCtHCu/eQRrAO1x14APrcl9GY7HQP+ZuMqPz4emG6C
         I+DlGz1Nx4epYuuNLGzdGptDyTnCLvtKSaF191ovNcjVucehFVG9Vj6xzc0x/L7q6oET
         MeadLq6V8PoNT9L1AUcOWX/eUHWfyx2UXFd4nuzaBQ3ql7phm8pnxvjWQlXnCQPME50V
         w4Ca96DiWSYpQvXPXZF5/FrUQIVUiNNogbMl0MLAf6HhevM1QvZ1u5b+xH+L+WD/b71R
         a0zw==
X-Forwarded-Encrypted: i=1; AJvYcCUtsuVms2LOgDMbuZU10u3Jg1++wMCi+Tt+RduMvPDmdK0cOTl33ylk5LyZWi4vax84dVYfp72jFfmdUFW43LeS596u@vger.kernel.org
X-Gm-Message-State: AOJu0YyFYS4URYkMdNbNxU/fRDIQQiRaiuhrDIPPsANNu/7lkc5pGiAN
	r83jkFwUp/5L2l0q7XS+0/QhJ55a2PkCwi2ATc0xjbQ503gZDLWCFJeA9yAFHkMr0gecd/Vmo1R
	qcNRPKOzSX2VIeeyIhnmpK9HCayAGWtA3xgSn2JHDsdoX2HlzkOV+3hGuKqu987mY0TMcm/IrWN
	VHA5FBKodc
X-Gm-Gg: ATEYQzyx9OrJ69paEIy15HcB5wTgQ1KnVovF+PFv7ahVH99z71DoQk7uxckZuJBcyeo
	622cvMNRdd2etPcxw+kOMrm7KGHKYfEk2ms+g0Tza66CTEPSTGvcp71hj6rcsFrmNopSGofPwt8
	Gi/lrD5C4qqE0WKmTZq1XUwyhnERsewz/bvYMGyMSlG64mqniS0F11YB1Mh7F4kwGW6Vinpm+xq
	0wCm6hFkhyIKDt9GQfbuILn2IuC5WPLOAI+w0oH0Q7CjZJZZ40oIHPqVH3mScZ2egyi3HC92hU9
	WltxRo6oz59+kskgdk8INjxcd8rZCF+LyEJpFcxviuy2MTPesYRF+iEakd8SPMV1j5a14UHTp7N
	UJkEjwvjywNyxg35P76p1zcWldW1XJCd5E0jiPZWv6vghQrmFfIwo6gS6LWbpjJ0OTHSJX18L5/
	/uAJ/Xd8zyJ5l+Jd4Qw+TIc3KrArMnL+KJyQ==
X-Received: by 2002:a05:6a00:9083:b0:829:af4a:5ebc with SMTP id d2e1a72fcca58-82a196d2ef4mr16274074b3a.7.1773750516984;
        Tue, 17 Mar 2026 05:28:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:9083:b0:829:af4a:5ebc with SMTP id d2e1a72fcca58-82a196d2ef4mr16274056b3a.7.1773750516542;
        Tue, 17 Mar 2026 05:28:36 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07340518sm16654056b3a.34.2026.03.17.05.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:28:36 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 17:57:55 +0530
Subject: [PATCH v5 1/5] dt-bindings: embedded-controller: Add Qualcomm
 reference device EC description
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-add-driver-for-ec-v5-1-38d11f524856@oss.qualcomm.com>
References: <20260317-add-driver-for-ec-v5-0-38d11f524856@oss.qualcomm.com>
In-Reply-To: <20260317-add-driver-for-ec-v5-0-38d11f524856@oss.qualcomm.com>
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
        Maya Matuszczyk <maccraft123mc@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773750505; l=2257;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=qrvxHlVtDdMnB751P/2Y3pnvwn4siZ5kMuXc1Ih3Jfs=;
 b=sUJdn8dmTBJPbcArrBkAeJ02VYrFQdVwAsKKIjC8AMKu+i5hmpy5f5kFQIo2tyqVmDyDQ3to8
 8H4sPIz1gX8DrkuOmnxyn3FCvKNPQl9NYc7VnwojwgUVuGpO8WRCyV1
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Authority-Analysis: v=2.4 cv=br1BxUai c=1 sm=1 tr=0 ts=69b948f6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=p9JF3S6fNoJM7NwPcqUA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEwOSBTYWx0ZWRfX5i/rSY4qP1QV
 0Bk9sKhNnf/933OED04AbACGGrc71NMFpjZ3JyNPxDr+Lu0zEf7RwO8XWNe4pS11ySqrbHwEeVA
 sAcbqT6100DxBJUnAnFg61zJbNKQT1r3rOWZpLFR/QCUuQcnfsOHxBhP9xdaW0mWfPPwWGdfIax
 8LNpP9M1srDQ9fdRpbPs2S3SMleRuz0lXxHeQXOGKjyPaozHUPktZCzyhQp9vFCs4xPC13CsINk
 pSDbAD2qS55cRlsfTZ96+ATHvt4f8MX0ahYByjeB6Ig8x0k8l0ZOjFDxjwdHIXV19mqz6wbkJcA
 Dy3idfoAq6S9PeBGfQPydbnzpL0iblbdZ7i2BMdgVEwNrJsSizmZyfjjEnF7YH3GSZqzG1Knq2t
 fhmMldTQ8br8TRb/EF4FVoDF4eYwLCQbAr/v/lcMkNPqdWlCxVC94WTER0s2EPrMZdlfwXyHI8R
 OQSxAbH+kCUmrggZ6yA==
X-Proofpoint-ORIG-GUID: yGYYVDAuqwivJjFfyNeCS09O5qBeSbY0
X-Proofpoint-GUID: yGYYVDAuqwivJjFfyNeCS09O5qBeSbY0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170109

From: Maya Matuszczyk <maccraft123mc@gmail.com>

Add description for the EC firmware running on Hamoa/Purwa and Glymur
reference devices.

Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
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

