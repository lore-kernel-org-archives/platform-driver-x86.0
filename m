Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616663ACEF7
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 17:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785260717; cv=none; b=PH3iR8dq7v1bfEtPfzzYshvQuY9KfyQSN7xPSBe5q4nk/yOEmeCEnAcZR4goz9dToyq8TgrgXhs3SkuYCkwkyXIRKuyW1w3gxhKOPd7hk1Zy3TvXvtHs+l4wpL6ROipH9b+3cxi+j4kLaJ9TcBZBQG6xNVU+wqx9Z0VUus2JvPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785260717; c=relaxed/simple;
	bh=KsznFoias9Gr7+EhnuvQf5kZBYgK2qNofKI+M7iy53I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lWiYlwEXEcZB9y2dnj/6PM78GCvIqYDDg91ZXbfz96Ux/gH+gFAKAtb5Tx1kYp/ZkhE8f1ZVLoYppAWk6gVagdJCBIOTWekICuhDOxbr5sdB1dqpeKMhHAsqShJCny3Hoia4qVYoayhSOL3qA2XM/hE6ISiaTOjxlKAY0Bz7Aks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TXfAJjSh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P5CLTPzd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TXfAJjSh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P5CLTPzd"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SEcVi4029594
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 17:45:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h/xiCBme0nrLwh5E+PqxZz4iFAPGiAXD90oYrZH2xsc=; b=TXfAJjShW/H+3tRc
	OdzcU0HuGrzTn/SRSBM+2kQKrff/kvUUo5rTUjBzHtOjHZypWkI4/PjKYcybX3PL
	lCfkudbaqJQYBk4FmCAk0CXOCi9OtzVDnv7s3jhMqf3WD26t6lbf/tcG4JXLKuI/
	I2iiqSDYda1GTcVFHAStx01xlAIWB1mObF7J7XMLVw9jDXTMWLt9DvABpsp4uRMF
	m2h/U6aWSkyNwKwaRE/eobGHL/DSi+YeRhuWYa2StrVySI6XbMro41CoXbPzAnIB
	hww4ySJ2s9/TguSif+uMjVwiWZ5mpbVpU2R6LbXcpq/UN8lGDeUoFGzUJu9xTiO9
	UIveKQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpvxxhmtn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 17:45:14 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca8aee88725so1684a12.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jul 2026 10:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785260714; x=1785865514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h/xiCBme0nrLwh5E+PqxZz4iFAPGiAXD90oYrZH2xsc=;
        b=P5CLTPzdje6T34oxuT9LoIVcW9JGQNGSoQEcr3lOGaIi6p99JYlBB4pvnHM52ERZtE
         q+pWcVASXRIqfIo3lkCnQGK9jwZmJUkUlr531GK1Kv8sFdLnH2/2yGG6pW56t+N7JxwV
         NBVnCa4L9DDoXNx5skiw6ZcLlc1mYmDtGCP2KkybWoAcm62X5o7I7roDNPtHRGO6vLLi
         8+0Lqd2Co6cNnnf4ZuNJdQjsOvxuMu2/eS40zDpSX0RzBKvbAB60Ar7u50gkR/+WjT6v
         lWKn2aDprd1zi03DbJovxtPz0ElH9FxDm5hFle3gcGEL/N69Ysm+CDPkbYpZlnwgqyIE
         JgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785260714; x=1785865514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h/xiCBme0nrLwh5E+PqxZz4iFAPGiAXD90oYrZH2xsc=;
        b=oY4Ke2mlQlXYNe3Noose0JAhDAuietLGDpfbF1TqnWCiPEh+/E9BfskLglkALKXkkz
         0IqpaxyQxSSswM/iGUvX6rAORw45A9gAWn45J0IlgaGNfAW3ULuNLVqVKBCTWnzsstqR
         WTLrYIOyY/ypM3rE+6Y0OKoE8a9wOlYe0E9LC1nCTapZ92LcCorOEzcDkfDLyQNj3LLA
         hRZ0Gsq6egt8mssQGCwAhAKK6bA4Sy0raRXWjFFnZp8nSBkN/y4tXqxFBgeYW04XAMBO
         7dFHGKcFN7NYu5QQN5LKPhN4Vj1mQEZGgX2bGcsmGgfddQZHpJeU9cJDh+uIibD0lEmy
         461g==
X-Forwarded-Encrypted: i=1; AHgh+Rru0m6r5cjhtDXkqAMCv+ZPyq2VtJ+Efd8QtcVJwI1Ogx+kY1DZut6T0Oh9PKzd6Pvp0kjqq/Fxgsi+guPa7RgZfO/e@vger.kernel.org
X-Gm-Message-State: AOJu0YxHH/6cUeLU5M4RVnsxlEBpfPCKDrOmfJ0+aTvbuT9ymWkSLcki
	PvzK8u9uoSlMtrOKOzNgRTfkLY5TqcgURgw13LtPfsSMEhlUKqhcaAVjB1UUbeDOA4UG2H4Nluq
	eMvV7jNcnizNQJkATRgVUDH1qoFFq2kX5y1oXAIMHey8bDBiy16CMefAgLrLIgqlbGQUPJDjj2H
	mZ
X-Gm-Gg: AR+sD12j8rp/lbLYFMH3K7ZeW9F5crtVyj3F4o+P92PrWXx1ehtZ2hXj2VvWyUL5HCc
	aHXbzSKpsaR90Sa9iuJOnitKTTYkxXRORUDiK2S2c1Y4xcOebgJ/BASPwbj/ykMfWjZznp/kFDc
	hBvvDDHsYH54UB4c57Qp8REe6ZjglnSfVyPhLzq9lpxcgp2+wtaU8U7iKKtcBWeBZI6gdjI9XsP
	jHIWfkOOgyfFW5YRcd88ZCpA6s+VvOJwEnAKbx3X6VloPEuqNOYD39IpGbiBkntc2Q/3zZCcHr4
	uixr0hu2botQc4vBo0ozm7To/+DRVC3W8UNdUS+OBtfM6HifG/tQjUu3xgaOrpH3gonQlmz8tSd
	vdGfbuuDMAKi1iEatyVOA3m7ISQpSw62LqQHy5cK9yBAed0f/LU+ERMffeyg6SDAjcu6/DJKyke
	BNV78/fzSydk69
X-Received: by 2002:a05:6a20:d529:b0:3c3:a41f:ce7d with SMTP id adf61e73a8af0-3c89cacf521mr4367794637.0.1785260713878;
        Tue, 28 Jul 2026 10:45:13 -0700 (PDT)
X-Received: by 2002:a05:6a20:d529:b0:3c3:a41f:ce7d with SMTP id adf61e73a8af0-3c89cacf521mr4367753637.0.1785260713336;
        Tue, 28 Jul 2026 10:45:13 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7273cd9esm749553c88.13.2026.07.28.10.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 10:45:12 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 23:14:29 +0530
Subject: [PATCH 1/8] dt-bindings: embedded-controller: qcom,hamoa-crd-ec:
 Add qcom,tsens
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-ec_add_more_commands-v1-1-771abd65ee1a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785260700; l=2591;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=KsznFoias9Gr7+EhnuvQf5kZBYgK2qNofKI+M7iy53I=;
 b=y0OMhUp7s1ciwxgqBH32RD6URch1OLFyOSuOwqc0D/uyqpqj2T0k9WsJlGKDbhnyh3aP7g+pZ
 GXlZgOv3880AdRzwStwEwNUBpw+1Y/W+5hJjwx8Cd1BX0k/8NFRJj89
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDE1NiBTYWx0ZWRfX2QGb/8sZrhxl
 hEdrsCnaZCBMP6riStgtlQF6zqvObxXmaQRB0op/HExyPmVdjgeeLENBbjoyFJHsxGbdRvl4KcG
 R40uvfMPTqXF0FHDJuVOeTI/7872lXNIk2aZyWBkl9jrbzDczso3+gJoYL/dl5DMwdhKoX0ASD6
 U0UMkUhM9Zalhy4qe/yQ6ui5M7+iVh8fvMYX35Lb3RkHJCyY2t/7PkZY9Vr6Cs+2mJTLFDQQgLS
 bPm5Kx4cPGmNcIVuKdlVKUYtNotyvMeP9ZB3DSnGnMnfQHWon9fnD8wno1mjgPjeUgdaBk9BkLo
 3QCnOsfse6b6wVTDzU+iyr/z8eUYBEHw838tRhkEOZqcvX7U0YKsxazZlSoJrbFjl0eMSZAA5OC
 oBtcNFqtjQFJczw7iRQMA62Er9i/28X4meuZgegxPEkbotqqNXa/aQvR/IPHONwOrOiymYOI5Gd
 bTKPdtX8JEks71v3vuQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDE1NiBTYWx0ZWRfXz/AYRMMfI1qt
 +HMhqX5egEUpySnr6b8lXvqTquPv1/kk7IbEreTMKZ8IG+o1iNs2ZAuhCv090j3Qsv2XU538B7f
 Kk9rok8449Och0DIi+rtDJn7rCnFpEM=
X-Proofpoint-GUID: dgyrumjYJ8b2CEobYrP90EpVcIOKfWw0
X-Proofpoint-ORIG-GUID: dgyrumjYJ8b2CEobYrP90EpVcIOKfWw0
X-Authority-Analysis: v=2.4 cv=PeDPQChd c=1 sm=1 tr=0 ts=6a68eaaa cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=dzekx4SEDLAKeHpuqyMA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280156

Add the qcom,tsens property so Hamoa-based boards can list the tsens
providers, and how many leading sensor IDs on each, whose readings the
driver averages to compute the SoC junction temperature reported to
the EC for fan control.

The generic thermal-sensors property has no standard semantic for
selecting a range of sensor IDs from a provider without enumerating
each one, so a vendor-specific phandle-array with an explicit sensor
count is used instead.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 .../embedded-controller/qcom,hamoa-crd-ec.yaml     | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
index c07483aa5937..ec809fcd03ab 100644
--- a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
@@ -33,11 +33,40 @@ properties:
   interrupts:
     maxItems: 1
 
+  # A generic "thermal-sensors" phandle only identifies individual sensor
+  # IDs, and thermal zones are a Linux-side grouping of those sensors, not
+  # a devicetree concept the EC cares about. What the driver actually needs
+  # is raw readings from a contiguous range of leading sensor IDs on each
+  # tsens provider, averaged together, so qcom,tsens pairs each provider
+  # phandle with a count instead of enumerating every sensor cell.
+  qcom,tsens:
+    description:
+      List of tsens providers and, for each, the number of leading sensor
+      IDs on that provider whose readings are averaged to compute the SoC
+      junction temperature reported to the EC for fan control. Only
+      applicable for Hamoa based devices.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
+    maxItems: 2
+    items:
+      items:
+        - description: phandle to a tsens thermal-sensor provider
+        - description: number of leading sensor IDs on that provider to average
+
 required:
   - compatible
   - reg
   - interrupts
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: qcom,glymur-crd-ec
+then:
+  properties:
+    qcom,tsens: false
+
 additionalProperties: false
 
 examples:
@@ -52,6 +81,8 @@ examples:
             reg = <0x76>;
 
             interrupts-extended = <&tlmm 66 IRQ_TYPE_LEVEL_HIGH>;
+
+            qcom,tsens = <&tsens3 2>;
         };
     };
 ...

-- 
2.34.1

