Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA648396D2E
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 11:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774438877; cv=none; b=IsqQuiw/xdEFH2Xd71T3fWvK0DJEI+2u5Ss2jADIar79Q4JNvYPW0zZpdY3xkNl5/e6ZyTfq6WO0X6qBekMEyej9/DPB4PIxI3CJKcr+UfKfd1Vfd5UWA0Xx5BYjgaMZKjtKnUiEBAoBKl7FXT8PfNeCniad9V+ho79kzPDg+bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774438877; c=relaxed/simple;
	bh=zFarwFyP7Mwjc36+jVJxSXy6/e4tQoyriPLsSHSmWgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=km7bBGmpfd4Vua7Pj6AH8J7Nt0ugkmXUmeKKe1fKiQQnn9sJ6iYo+hSzv6pZrz4bnW4qRYqC5OqeABncY+tf9ueevOwMwBDNh1Ow9Iua16/C+i7wypywvy5VQbgvN8ialg+bXJ50i18kyx4bhRytRkYBhM7xji8rjBRDOlzFg1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SxFExful; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GgrcIs4G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SxFExful";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GgrcIs4G"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGGdi2197431
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 11:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hUZQteOkDmv1t57NkB6ARC1fQRP9JD9uH5Ktg+HthLo=; b=SxFExfulq98ZuKSX
	tZ2c7Qmr6fFDjQneqq4dAmfIQzMC2rRpJwHB181i5pk62Cu9BzHmIbqxxZQWkjAs
	4ZU+u1vWDJYoSHWFDO7TKs6vOFqom4QwTcYZP/ThQrT7V5L35GDAr1d6c3VDI8wx
	LlXyg+OWa33BzFlD6wHaBB16AAmiPCoSYFrV5Uy8V4g8GUkR6/mxzp7DIM/xzDiV
	yfCx3/1zPmXqJRiQWLUmCa6XJYguOjuAn/Pe3XqhGrfZmc4wWGDS1j+QnpT68OAT
	cmaYr0wpwyQX3zm9Dq5lxQWFQJ7ZsHIFF/lxvN+mCOI8L2LTfapusqBDcMO1j0Di
	XcAjpA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d48599kyr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 11:41:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b051befbb8so61887635ad.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 04:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774438874; x=1775043674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hUZQteOkDmv1t57NkB6ARC1fQRP9JD9uH5Ktg+HthLo=;
        b=GgrcIs4Gq7GMFc/dA81ZKqkySiapNtinJ340AjCToOLmcVg+bRqYicvDc4qLweEaZe
         Urmv5Xb4Grao6IG/f+DVGIdy7lXmvaoFoKydqOcT7dugZFznT7JLUMPJ3hsEPDMss5kX
         mrccFSAjQJ72vOOFDsG1MX3OrR4vu6X18B5IpQP3VqMiqHv13HT1RvJ+fVWDK5ArUzV2
         B7qT1CQJJmHnIfK1rpjLBrLJtNdqZYdYibChoGB33Nsx51XhowD4kAnf6wItnIV1GPGA
         Tba+ptlGqweOmpsOPxfC2y8724NxuKiSRN5PMTGrRNgUfAicgzAZLHziX/QuYZ6hf2hh
         8Gjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438874; x=1775043674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hUZQteOkDmv1t57NkB6ARC1fQRP9JD9uH5Ktg+HthLo=;
        b=lkZBiAnEQ/VjjLGq1B5YUAVJzTBBP+HmFd3AF78Dowv6auM2BgmEwHoMYbLtm6HsCA
         S9cAvXxEsBxXwggnSgg01JpfyypepW4nWaJgKtf9jQBTy2LrbVv6dkgdCh7SlKiT3O0g
         ZOl4Hm04MKmca5uGukq2EisFU4f+/pzaRk03xbFQSdA6FfNT6HZx4dBZV/+Xu/CGuAWy
         ompzZPMkNgMaoiN0rhZISQcqU+yaKXcqCY6+pGhKRoGZtN+JxVqu9P69jWEeNrQal4rT
         aiH0S/+9JkApODCDKHrp/+6nrLi8YVbvNcKJ3j0DphE4HKoXb5SX/T8mOQI+JIsc4q4E
         Uxqw==
X-Forwarded-Encrypted: i=1; AJvYcCX0KAVjukVl/ofmfZ+Coqhk2fa+YRjEH7WZwkNsTBDoXXNKF85EKmOATm6jh6r5/ttqPLhNpxpUjF9f1AYmpBUUDWnY@vger.kernel.org
X-Gm-Message-State: AOJu0Yw57GxVPBffy76rNLxf+VoNyrGkBFKoYJ3Uyf8VsoM5gvXJHB6+
	sottLUGaCcTuYfpn4S4bZMcOSbpS+fI8DH/PuXIFZLyzQQXuUby0DwSExTT+shprP9/jQpe2rQI
	hD6vVSxyyiIPZLRGg54itL9os/O23lCJmrVz1J6s2xryIbMvYNyhkfkWp2PFa96bPrxGz7mwv9X
	DF
X-Gm-Gg: ATEYQzz3zsRF9KH4hXYAkXwGtq8eiO7BxD6j8s1lPyABe7ODlrsCXr8K0v6eCTWGzws
	Ze/HTPkVRHAsMtRgkNDAztRsvOgiblvsPA1fSdFoqaGlksxNOLqM6FlJiqRwjotuaWnLsE0JLzu
	yWQlT9pi6eeB7PgQqKQ/ZiqAuhJN1dgKXal05nyOz7wtANZ0SsuZUW8zDL4lxUZ8VcABCaEfZ8u
	U3hT08plJdCSB6Ss9EBZcMmIlQfdio2aUiOmoEks608mVkA5gInGaqS+UbDAYNCUyh7OBn21AER
	SZQuvaIbQ4/7/el3+nQk4KN8/XKKqyR3NlB+ueBcIu+uQGLZqIYp1iFujcSlr6HqroBfFyifv6k
	l5zfnrKjUK2N9kHBoUIXXACwlvpULwldM4Vj65CdJ/gQSBotdNYn9P5UmpbIs3Z0dgUn3m9tW5+
	cso0tfN4amsj/SRDwrJxTLBc6RigznSRWBUw==
X-Received: by 2002:a17:902:e885:b0:2ae:c67c:3b05 with SMTP id d9443c01a7336-2b0b099cb9amr36671645ad.10.1774438873609;
        Wed, 25 Mar 2026 04:41:13 -0700 (PDT)
X-Received: by 2002:a17:902:e885:b0:2ae:c67c:3b05 with SMTP id d9443c01a7336-2b0b099cb9amr36671265ad.10.1774438873121;
        Wed, 25 Mar 2026 04:41:13 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0ae360d4bsm38152015ad.16.2026.03.25.04.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:41:12 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 17:09:51 +0530
Subject: [PATCH v6 1/5] dt-bindings: embedded-controller: Add Qualcomm
 reference device EC description
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-add-driver-for-ec-v6-1-a8e888d09f0f@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774438862; l=2330;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=p1qib2l7A/JEOeiEFUXoqiCJEoH/aeCCTCy9wrPvB6A=;
 b=B9ryd+vvxFBe91fPiXtBVsao3vJGX75CubyOgVKHhW8onikmhOqcycrY1iFvnvVmd18gEPdp1
 7Bw/TAqo6hjCXi6GxfeHqku/7ad5QyoUzQvGWdonay8KioiUUuzHd/n
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4MiBTYWx0ZWRfX2fN6Sn//Q+FL
 sUFjODs/P46slW0cUf7ylWKY0Ug2IURqLBX2rhwv2cNxpGE5+kyz2yLqssZPhflhn3mSeOq20NG
 mhtOyLYWau2uGXuHRAUC+H9xibnaReIp672hXP6zaSrJiXUz1uSynfUcleyGrTvoG9vFEEmwGTk
 obQXvzG2VFXOZ9Bo50ZKZ/AiHrLC1qqVssXP1/RufxpMrKcOU5Uy7zmB7P/kwn5L0HdZzG1Ot+h
 EqN6Yf9RI34twVG51dVON9ZP0D3r5KrEDLy6WxEC+zGaBLTfpd+TpjzfZulazQ6bqytsxcFvOlj
 JaEv4stykexyFjvZ+Ld7IijOmWRNWgBB49HeXE2rOhUYd2VjLmwvAs8ao+hKtfoh+c7IF6pjhjl
 oxNi1A2FZLlvN8SfFJCx96uBtXeWF/w+IblHJUjPLP8NVUWPwz4qEsMu6t4uWGH4YfVFfC+2V1M
 hTndwjsSZE4VUbP56Sw==
X-Authority-Analysis: v=2.4 cv=VODQXtPX c=1 sm=1 tr=0 ts=69c3c9da cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=p9JF3S6fNoJM7NwPcqUA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: -ZHww54h153fjqxPcNWXylCZaQI5FmaU
X-Proofpoint-ORIG-GUID: -ZHww54h153fjqxPcNWXylCZaQI5FmaU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250082

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

