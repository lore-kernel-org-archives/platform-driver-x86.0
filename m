Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158773B4EBC
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 10:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284333; cv=none; b=EjcXsgvNfRKtxEUx49xQ4E+m5tDmeO5IZxKsfH1GuBTSSuGAcfDDuofGB6Rj5TbZke91jDybk+pJVuWQaO0Uvw6Bmv0JIoLO/MKO07EuWB1lJ6adGp9giImpr4aqlHKQnbVT/5up2t6KdMj9ZrhiftP38EvszrKEjf68RnAQwcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284333; c=relaxed/simple;
	bh=zFarwFyP7Mwjc36+jVJxSXy6/e4tQoyriPLsSHSmWgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EtD5h9w3hT2T541dcOAxJtm/8M3AGfquuVTf8STN329xWNqyAPVXAcjwtW8qLk/3jd9qrp7Rz6JgwZl04g00E7OwqarglGPjuT3FkEEkQwzyT+Mqm99ZX17TW3/jnKiQ9nFaoaw+K2InXgt51mUOUVjR2Y6AzKqdUJMjSgnemKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WYqUrJEo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QOV6UGLY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WYqUrJEo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QOV6UGLY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TCnf1501564
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 10:05:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hUZQteOkDmv1t57NkB6ARC1fQRP9JD9uH5Ktg+HthLo=; b=WYqUrJEoiVFArZGy
	nJIBZb3a3PgX7GJtmkR9ZHutSLEhXOeSAy/vgVYRnzn6K8sWDOQclsRKPzZspMaP
	L7k21madqwSV94yBcn0ww0u2QCHIZvHkc7svz2+UQrh37XJ+YdzavIEsy3pEn99t
	TuhSM3pzNYJ/tU8043NMJrcnfSbh14MX2EZIZ1rhhmgSC+/15kq9Ruc/xVDOCn5o
	fpyVoTxMNCc+L2QBhXzGH14Ra9RdAeLDx96bmX4R7TrEPkWP744kc49PToDLmWKU
	Rgbx83zndobpYkBhyWoVoaILCoo7vK0A3DkkfGoczDv4d4/CGonPUq7jpZ+d8mS2
	1Lt2bA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnqrnjgt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 10:05:31 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f6e6a3a76so12170090b3a.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 03:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777284330; x=1777889130; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hUZQteOkDmv1t57NkB6ARC1fQRP9JD9uH5Ktg+HthLo=;
        b=QOV6UGLYMt3ZuIa3hLkeMurokulxZfNqVajpl3fkZRQaRVfH/Rt6hgcBezd356M6gD
         5ytKrAx0dmfmH9xrwk0kC3OKsnVyuMO11z0qLwAPRHHS2AHx3YHEnTmWjt79GlguNQcP
         0WXYoiD+/jS+pNuKPRgacA/8/590up+WOlz3XR4W4uGfz7DAm7wtRKV00bppQjNL3N+k
         fr6HqDIBXr+5OO62P7ewh+OhVKSHQKbIlOQMBC3NZ0nh/NkBxzZ4sZEOI2e/8FY2P1Ms
         zVNpn1qHLADDT0k5ZcqTYPm6zuxxQ/w+ufFXv7le7NMxxu3ExlguK0JkGtSjkViMWAB0
         IaPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777284330; x=1777889130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hUZQteOkDmv1t57NkB6ARC1fQRP9JD9uH5Ktg+HthLo=;
        b=L5hlYgIsz3jiZg9e4tA4IhEdKj5GqEvBydATQUTqtSA3jUPA2uKO6kJ3skic29NrNs
         w8a1s1MPhv2i1X3ug6kfp/7XQjbDVNiwzH+rCM64ryWs9kWMQCmqJLXIOcbdPTanFg0C
         wSZA+dLIZBYTodzVU+gEhShp6kAO6ZzpwVnk0ZxiZQ4GCU9jao2x9Q+MXyVke0O23exj
         7VDkPhg58jnW1a32eMQ38R8Xfak6Wx7QrQGFPI/xwsQdg8fAVHWW+KLdBEUw15sXhObG
         YSYKoa7tw8pD4m9uN4DY+nRvw1A01H6Xe5ZD6VD86hXnlvPqA+1TNEh7E3XoTUrCfST1
         0Cfw==
X-Forwarded-Encrypted: i=1; AFNElJ8HZal0aFoJhFj484yYi67xI2Cd8RpJG49gwMQPEr3VkxK9syVeY29MkkhlGYIARb1o+PgxbWlAiiLkEakQ3tC/10Vi@vger.kernel.org
X-Gm-Message-State: AOJu0YwrBHMAZofqT5dVks4XUDTtdb8UUfo9KfiDBGwcZDmK77goSVDj
	tM2REA2dTuIZ2HtNtf4AxiLmCsKy6w40y09XdZBdfiEUdmPOOHak6QazRK0PaDOItddKl52vF8g
	mXOtSDi20h/VBsN1WF17qP46pS0Cr4Qw+nF95A8D9GINgrSgXzAjnywNEseCEItWh8gi3NwKw/W
	S2
X-Gm-Gg: AeBDietHDn+0Ozk/dOHduKwiISDQY+a9IbVd5+8PebppzPfWYqfXyeqqGB5Ot9kSxO3
	mmzg8jqHHAyqP5M7Wo8bxRS4EEV7dS2GoNy4nQDpsskiqCMDydlZD6tXe3aNFMf4A2hvwg6V2G2
	gwlNJt2XYGUmu+810duOGMQJKNk/RhOXZ2FbDHDKfIIqyoIvYhyLQvplMf7llMAopK+H9FlaFAn
	UQ+l7JjYJ3TSlI4viZGsyW0ysgI7xJuyptmcx8T9t0zvfI8RmXBRVutW7s4cvDvNlfJjgunHnrF
	ay5TVP8RF42nkmNaBBIrwlL9mTWo5O01PGVWDJBIuM12XL/uWrLgNb1S/dmOaWILlW2RGKgL0PJ
	zRU0K4eBSuZWJ4yzFx6hakdRsNJ+8MtGG7WtZER6BZjfmUqy+XBX8odslMLGQFKCg07PbV54+6S
	wuLMaSgmTnY3B/B3H5dwBMeQO8bO6v/5IqzS+elndRDfMM
X-Received: by 2002:a05:6a00:929b:b0:82f:5051:f022 with SMTP id d2e1a72fcca58-82f8c8c7bc4mr44751995b3a.32.1777284329637;
        Mon, 27 Apr 2026 03:05:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:929b:b0:82f:5051:f022 with SMTP id d2e1a72fcca58-82f8c8c7bc4mr44751948b3a.32.1777284329165;
        Mon, 27 Apr 2026 03:05:29 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec24850sm33004008b3a.60.2026.04.27.03.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:05:28 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 15:34:52 +0530
Subject: [PATCH v8 1/6] dt-bindings: embedded-controller: Add Qualcomm
 reference device EC description
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-add-driver-for-ec-v8-1-702f74e495f7@oss.qualcomm.com>
References: <20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com>
In-Reply-To: <20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777284317; l=2330;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=p1qib2l7A/JEOeiEFUXoqiCJEoH/aeCCTCy9wrPvB6A=;
 b=ErNzU5mw83Da2u7kh008/Dc0CT1AdXprku9fq+PLAB/henuOdFNdmhU9r870WHRACmc6EEBKF
 1J2D6KcowsVBQ+RURg+8DJkn1ei+/DxrRWRW/LMM3p9WPpGpLe6w5xS
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEwNSBTYWx0ZWRfX6QqbJFXPTAi9
 ZOWpilNdpAu16SyeyCOAIEARTSdvzq6s78l6UoY4a+UEekrfAkku6icLSOKr9Ifbs3Uc/+MKBLi
 qxtKiCYSXunUvkpBhVK1UHSxvQKmxDpdiNX94VsgxPvzlqFAJVbCQw/w7hbDMuGWj+98z+wH9eZ
 E04JPWMumBoji0H7ycsDOx/CFX1JT2WbQ5KX+FayfhFzy+RJwy9kEbfr8R8myZVZciKlGHL6ANI
 1KOuOAbRUIpGEEVFZI6nSQGIfBg9MT/WN7aoSofR/VxlRFbEyr7Xm2trWiPewbTE12lgjpG73vk
 c6dSyip5dzRJMlVydg/0LO10Tq8CVMT3sy6/xk8wisle+uTHxtXcS5NiRo5/fRSf/b5iDICd+ZB
 jIgHRNAD9Ra5fedD1gMv8PNDl4UGI+7X3MQ1dINK9QG9/hPduL6i9c1nv5yvnPceAsEBxlGJlHU
 g/p1Nrci9PNWwebcCNw==
X-Proofpoint-ORIG-GUID: 6mlRLOHIJPmHW5WDjrM4B2hKpp6_5gI2
X-Proofpoint-GUID: 6mlRLOHIJPmHW5WDjrM4B2hKpp6_5gI2
X-Authority-Analysis: v=2.4 cv=UcthjqSN c=1 sm=1 tr=0 ts=69ef34eb cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=p9JF3S6fNoJM7NwPcqUA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270105

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

