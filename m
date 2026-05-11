Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299E93A3E68
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 12:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778503481; cv=none; b=LlmKSwPXzaMPcT0DtNNK8s8BChUloHHn5dCwCwoglRGHrjIZ5alfVkICGr+x6JKpM1t0uRnagH1aNhx9NnVO2PQjPFes0HKfLFjhmYVyY8QNXkHTCe1TJ5HuSxsQIvvRYeTNBCp599pcBMpw26++41jqIeufkwxq1daJjtA4IQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778503481; c=relaxed/simple;
	bh=zFarwFyP7Mwjc36+jVJxSXy6/e4tQoyriPLsSHSmWgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BDJMEvJR7k/rXh0elpiSEgnfedLi/uIIT3OstH38SX/GctMJHNaOKIWsLoz6UbGpA/DFHUffHAPx837jsXeWDhJYSmAHcyQ2IMjAnOGr1S3vXphditjoTqA4OBDje0Ns+ZI86yR3A9aUUXP6QdTauH+fdpnKTd45P4uxSoB/KhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MkDjHxjy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HqXiQj4N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MkDjHxjy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HqXiQj4N"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BC4OH71106469
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 12:44:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hUZQteOkDmv1t57NkB6ARC1fQRP9JD9uH5Ktg+HthLo=; b=MkDjHxjyTMIt61R2
	za9VUFS5uTkWlSCaQZu+C0BoD8BuLB7RXbpVT5qKEVpHIMBIYq7EXdDK8K6B35wk
	tCDnJ/OObrzgjiqb+wis9lQ3tNFLCXM0anXPyBe2bHTq6QVQGrCEqNPUogZp8euu
	5zJ+PVHlWUisX+XHjCTJxuRRg03Pt4AEXvitc++22ejCj84IZQ2yqcjpszpfEE1N
	C3fQWR8VGOs23NUndE4pFqZ4lO97sq10QxWXfZUYcqfa4M/Ix2R/wtunl9GJKupO
	sQJkC8xFm9BUILhq6TmQIZXzg1iI8+hXkpa1TJ3ipHtSpj6JXRFaYUBw1yZ4ioGJ
	p6B9jQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3esr83q7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 12:44:38 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7bdaa2677aeso54370457b3.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 05:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778503477; x=1779108277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hUZQteOkDmv1t57NkB6ARC1fQRP9JD9uH5Ktg+HthLo=;
        b=HqXiQj4NG+qTDYdqzV50NKnFI09Zo2G/Mng8ezwcAvH7p5/3IIENQoelR2P+4xypv1
         oA9OdMkTIe8oFpbD8Hly3jH88SKQ1rXVoam3PUL5eUOF5XHQkH9q52/wk4SGhByiVs+B
         E9dXEqyEjn4SbC8Xr7sYZ1P2QFhZUU4kW95zcER49dX9mT+doAOavzJq0hUeNkkhdgwC
         xm+qxXVtZPsxAjR9P3P4k/Vs1xPUsHSVjMaw9iZPodOHgdkLlr2H/izg30CcFZilvroX
         9rydW2BeA8HqJC02b6yeBG+pHrr1M4xq/A2O1coIZJjOXyn4i5HNcVugh0byH2A/G2J9
         tAxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778503477; x=1779108277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hUZQteOkDmv1t57NkB6ARC1fQRP9JD9uH5Ktg+HthLo=;
        b=UcihQ3ukJegYfntvVVs9ThgqeYm+uEds6hWLV2b8Z6tlbdjdPCvOriimLGLHkHjaeD
         oG8Y1iVCkW5FTAiUYdhlK5qeMPxBrtJP50mIhF2U0yUc/8kbT5Fy/QtZyAHZNQSzCAFQ
         c3GluaLMOyO89GCK52kkyqQkUcYd86uq9cQ3hhRuYXQmHZ+/on1VcOEI+35Sq9Tjub2F
         QUZlRfbtDG+SjCstYm/RQafHD8vJFF7h+aQ/wQBKeSiS6oGUJzxuAPxOmwy0L2XfBBIZ
         UbzPuzKMxaibDoKgia/0FD93w2+EYBVFThOes5m50l3dmwQN4E8E8Gnd7URqiYvrrRQt
         eL5Q==
X-Forwarded-Encrypted: i=1; AFNElJ+MAW+h6BH+DkyOtQl9Tw1MWeYa6VmXg/gqYtfgCClHx9zFO5StpQ33051i2upbM9WEQxnIdaweZVl6HIqxAxOQyllC@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0OCuBXcnVmqlcwcZfYByliha3msf6KiBS43gIB3DKqilq4MDQ
	ouaIKZiP3/qJ3EFRrHxRMWkc4ZOarHuZC4rWoj7Bri1TsQwhoU/CThNKBrzUHmtx76CX0OyFOCP
	2SeUZbpfFjVjwTv3XiniEcGmhEEHoUAR7T8h9cGJT4VqkDI/wlET2ICsJMO+OgkCB3+d2ofes2D
	6J
X-Gm-Gg: Acq92OEyDcmJRg4DOiZGoNPwK3XvYIjy4I0cbzAWBS5P2n6GqdWyVzXqwdTKyWNS8Ei
	gHLL+67P6lZhxUHdamdrr+UWxrA8UtIT9gXJ9Km4C733bQTm8uZcB0lwEZBVJukj2Wuia4Jm7FP
	enYjePgAzbIo+WgtBFExCuMij7LmdtFDFHELqq6oUXK9M60mMK7UBdcH9BRUtoC3XbnhHUjDtbp
	8hq4ZZ/M16K5WIK7TVhK4bfvS+Uu5oBq2m02OIbyA+gRHxnXH6b0XJAdpvUudHwFOELiuhlTwAs
	cErUIVJZacLYg+J/fguDyWMpJV0D04z0zypnho3UZpr8uXxzMmaS0GVTRFRP8Td8hvKg6Ur0y2I
	SJRnGAJsHjrX3B7CQHIwUhOCRDm6pwPC4CTq45PGvc3WTWrKMG17QzuMoSaEvYaN6ernduGgpyT
	AAn6hsCLoc+oaLWILphrystxZ0MG5O8/ZAgQ==
X-Received: by 2002:a05:690c:6989:b0:7bd:a6ea:c508 with SMTP id 00721157ae682-7c104dab240mr82943447b3.24.1778503477441;
        Mon, 11 May 2026 05:44:37 -0700 (PDT)
X-Received: by 2002:a05:690c:6989:b0:7bd:a6ea:c508 with SMTP id 00721157ae682-7c104dab240mr82942977b3.24.1778503476919;
        Mon, 11 May 2026 05:44:36 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6683794dsm149641717b3.27.2026.05.11.05.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 05:44:36 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Mon, 11 May 2026 18:13:19 +0530
Subject: [PATCH v9 1/6] dt-bindings: embedded-controller: Add Qualcomm
 reference device EC description
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-add-driver-for-ec-v9-1-e5437c39b7f8@oss.qualcomm.com>
References: <20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com>
In-Reply-To: <20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778503462; l=2330;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=p1qib2l7A/JEOeiEFUXoqiCJEoH/aeCCTCy9wrPvB6A=;
 b=FCKxXhfphZfzNrqt3+fgaJMTaJIkPxTyUKk1I2quUplNtgZlNkRiJFkRS+Erh/joPXZuPFGRi
 nA+DuAdTtQXA7FrOkEGSNkCK2JaHd45xLiw55hQB25jfFuhnaHt3Qq8
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-GUID: kcEdToU6qBycbKRG7_TU_ZyYLbuKbOOp
X-Proofpoint-ORIG-GUID: kcEdToU6qBycbKRG7_TU_ZyYLbuKbOOp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE0MSBTYWx0ZWRfX5n6OcI/AyQA+
 KNkt5aVjI/O4TtoXZaayTpgQBWlB2xdQCqbgyV+CpSZ7zpE7CSWxVFwpUeRWb7yq+02kaN7LxsA
 HsAh/W8kjjiQF6wShB4FFX5HYAf5MrCxM1lisXORnlFU8lYg8dGDghfAf7KTnIP5QXqJUbl7bZR
 C9iKHUF+3aPjzc6r57zEFkBhk4ACo/xDem3npLvAEgw2TK/enLpts71yxYOVTZAotRY11Ob6d/n
 18mbLS7WRpe4U7/oH14aEpHXWY7imM6TDBK8/DzKd9vx+aiWw6SC/k12yQxxW9Gqy41/Ql5t0XB
 gjsOsOmEiSVueZW6THIJVWF8PvEt/Ocx2BoYVYXT8VYmgR4nbE99HQR71jlGYc9gOUVo/xxrpiR
 WUj+gXYmiFR8fXqEMyjCHryarFKnCVx3IMVApdiP5BbN/kj6oIIgVps/8d3/dz91JapucVxuk2A
 vsOhJBjOT5gTNeLuZGg==
X-Authority-Analysis: v=2.4 cv=G40s1dk5 c=1 sm=1 tr=0 ts=6a01cf36 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=p9JF3S6fNoJM7NwPcqUA:9
 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110141

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

