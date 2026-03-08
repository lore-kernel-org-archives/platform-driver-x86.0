Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0783135DA52
	for <platform-driver-x86@vger.kernel.org>; Sun,  8 Mar 2026 23:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773013041; cv=none; b=ioYzMx4QV7gJs4Q+dmbAgfvre/oHSGvjCOFxm4Me1KKJOdTK7uR1tBxg4AW2ishZo1e8YBGBN3Ad3V3Hrs/Ly+2VkZxc/GLUsdaTKGT9fIyqb6lfiq/xCDR3KfpVKPBCVFQd90vgEokSXbZJhni8NbfAXDoren0VloPfNcya79k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773013041; c=relaxed/simple;
	bh=sWB/MCTZF0QRfhii15yqvoLZyv0Ws5yxWGh7O7kBK4k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OI9NMs0jk2ZQuuD+G3/MGuQ85MNbBWMv8/LZ+QZcEeiiQTA6OFDyuV08YlOEU80Ay2UX2B7Bkejq30eZLv9UfGf7dKcUAG4AvzUHvsBkeZ6teW1y/OPw7qTy9A8o4QDmiBPpt/qWG8LfjSRhEiJlBPzps68EiPFeroq9LVan0mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oShP+5rk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TylCoCVO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oShP+5rk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TylCoCVO"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628LQlm83522504
	for <platform-driver-x86@vger.kernel.org>; Sun, 8 Mar 2026 23:37:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qfGr5maJy8e
	2oTmsd+kPNeiWt8WWcfirQv0+zbNNfi8=; b=oShP+5rkxsl6e05+yC0tgLORSr0
	FEzdxGAa3QJp+SrnWEzMGMWN/JxYDmslKzAsuAz8egvHVbj5cOLkUR94/+y/P/lD
	mf24Q32/AgNsJ4EzudmDm0Ja1BZNcjIJHQ1HXKs4LxuPQXF6I0PpILvKTqzDUVTo
	ShcAVhBenzITlkJvdAL2hcD9mGz5SrtOu4VSPdIKd3WdsB4kwBtX25iD4zdSRn9e
	RXC2Ktn+vtHxhAeVVF/l9VeY/hThg5qBWC6HOc0rPYpMt1W7Jjd6ctxrtHeH13Ft
	9S1xvm7aQexsVSFd0uFLHmOm6RaSRiR5StNuNigGIVZqjaQ/xvLFCsa6ELw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crayrkdud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Sun, 08 Mar 2026 23:37:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae6dd98043so48426965ad.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 08 Mar 2026 16:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773013038; x=1773617838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfGr5maJy8e2oTmsd+kPNeiWt8WWcfirQv0+zbNNfi8=;
        b=TylCoCVOKXTq9t+ML6eYNpc7nAmedst4mHjyApJUU2BS1hwukp8OnNpjNr7tFhLyFx
         sTpHrNhrCJX4DxrSV28UEZCuvGA6pwkjEBt7J4R6o0vRiA36H46mOl07NSLdbR/t4u2J
         LPTuL5V8pm0uWJbBapEns6dx0z9PvKy54v6kR8+f1vo5Dhw5vNWhHueh7qx4ZFjqNbVU
         42I+2IVJbaz7waKuziuUP6C/+B67d7WnEgsxqAlOdmysjzE4LM6AFxJDn/xfKCt7RJd+
         ktr8sMdv0uMKYR9pyohU0tIusoysBpvagPzwWXfmUxqiO65HNXo4FICKMVv8K0DlJXSY
         PoBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773013038; x=1773617838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qfGr5maJy8e2oTmsd+kPNeiWt8WWcfirQv0+zbNNfi8=;
        b=Fz8WAllCdsfuYZv5u6bqjckhMy03O5SaG6ynV2mdhhk+AsTI+r1MVz2Ae0MD1JnPHY
         6zofogo9WR50YSbaR5RpZMHLanf+4npfcIxkwBKUOvj+NMZFsHO/9UgRW5v4qQmifMIQ
         r+efLVierpLZkws/QJ6h595I90GNrbHF3VYcDXCwxwcQ6o/yQpNqqWDl2SiVdtfjMv8s
         dXz3LzGQ+rlHc6IvKGMy5+6bfE08c0ithb46hzueVzCzEMaILuTbHMPp+I9rrBeFijUA
         0mOrV+/qBSGfo9/mPvMWeNX0oaEc4mOvGuwnGT4Sy3/CXQGHV3SZnGeVTKh/9TshTkMC
         MMjg==
X-Forwarded-Encrypted: i=1; AJvYcCWFqTjIj+OK+XXMbP8GyYVhizgGR3dv0A9BUpJ1G5qKZ0e+/uZJnXbUDwyWLSr13cpgx2hi7hPA0FAUMC5bmgGS/Kha@vger.kernel.org
X-Gm-Message-State: AOJu0YxOnYujoy7Cyk5D86IgF1V4VFG3WfswzTEDjwgKoNRCAqU7DAps
	I2vobuI89kWpokXwT2TmAxXIrh2cbMKzF4ZjzAhQFXqb+m9SKWN0eK1wZzdOqcGI8Sy218qX+NR
	VSNTEP8yBA87oFKy42OqO2jiMPeeVgyGR0kmbiBwpSN7fYvigubBqAh8qFLBtZzpQm3iFwMdftE
	XC
X-Gm-Gg: ATEYQzxNGjOsOyqSy/3oKwEsRxxdC73r68B3ZN/h7VfflRB25/t+6YdJXhT66C9qwY/
	5MnGhD5JQAu3Xs6XsnUZVM3wIXFnLl1cXxMu2FFHDiRFC3VUGTPasYNZ6FxGsCqYKO3TOfWZn91
	OQjCh1xg8l9z3RGpvBflWXG5g/tDa38owSINEUJ1mSe4gOotbqzEviWrJ12VL9j5OEDin5ehLNT
	ob/doNWb2xkUN8pp5SutzPkGyB5GEQw3wJZBV9M6z086c2OWZsXEh1oArvMMStphsAG+RrIELhC
	HaMi4y1dGQdNEtKIhSHiN+B06HPQ7VwIy5NSc1cPuwMYpAgiYj+vGKh1lB4iBRPJ36XsFTieret
	9oEP/ltLWTaUMgFXiwzb5AOzPc5XGmbazmD8RosAqo6VsnhOee/qBLfVu0BdTrtFix5tNNB3Mh6
	rcBnapXMFtnt6VIuijQfxkFR5U9/JYFJYhqDAH
X-Received: by 2002:a17:902:da8a:b0:2ae:450c:951e with SMTP id d9443c01a7336-2ae82388a53mr82981775ad.17.1773013038530;
        Sun, 08 Mar 2026 16:37:18 -0700 (PDT)
X-Received: by 2002:a17:902:da8a:b0:2ae:450c:951e with SMTP id d9443c01a7336-2ae82388a53mr82981665ad.17.1773013038074;
        Sun, 08 Mar 2026 16:37:18 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e9ad26sm114274845ad.28.2026.03.08.16.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 16:37:17 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, bryan.odonoghue@linaro.org,
        ilpo.jarvinen@linux.intel.com, hansg@kernel.org
Cc: conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH V3 5/5] arm64: dts: qcom: hamoa-iot-evk: Add Embedded controller node
Date: Mon,  9 Mar 2026 05:06:46 +0530
Message-Id: <20260308233646.2318676-6-sibi.sankar@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69ae082f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=ltsv1nNgzXx585P2vnAA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: ARSKv7FB2jQlOpJj0UY9iSuZtYNEGaTg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDIxOSBTYWx0ZWRfX+U2T7YQ0/qvD
 W3IhOw6Yq7GDe6nZTE4SZn3pd1y/9X9mKtKmjNmvEYX5cAMFahRld+9kL+v5BDG1pHvGXuHR1jb
 bmzyKTy1jYAeONZ0Kz1w3darFrwjNBcV6nTCmF15KrapXw54u3fFo0SHPFYOt3pvN4OSuSwRGXz
 yPL15biIWPrVn3N0DKuuh2u+qNVgisgGR6OiCv7bXo6y/QF7Vfi1WMHImBOX7OtBZ7oCl0Z5Oz2
 w86qnZbwDnqDkj/KvSGA/M02+LHrkJtfT8DtnqGcwMU0jyyZr+Wv7Q1ozfhBcwAsPTN8vY5oTNL
 yzXDLLiXktQYfyrsOK4iXMveTjUfBCEBQkO1jqE92JQrfw6mv6vJhjdZ3rMwgMLpT3iuunESLmi
 BCZE3hEm437bwPmHNAH0tuARRGJzjN+50EeGoHdG/Hoi3H7/z02zLDkfxw7ySRWefAUrZWumgS3
 Ki0LHu8bi5msHXFdF2w==
X-Proofpoint-GUID: ARSKv7FB2jQlOpJj0UY9iSuZtYNEGaTg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_07,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080219

Add embedded controller node for Hamoa IOT EVK boards which adds fan
control, temperature sensors, access to EC internal state changes and
suspend entry/exit notifications to the EC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts  | 10 ++++++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi |  6 ++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 630642baa435..3cbbc4a0dfdf 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -799,6 +799,16 @@ eusb6_repeater: redriver@4f {
 		pinctrl-0 = <&eusb6_reset_n>;
 		pinctrl-names = "default";
 	};
+
+	embedded-controller@76 {
+		compatible = "qcom,hamoa-it8987-ec", "qcom,hamoa-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &i2c7 {
diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
index b8e3e04a6fbd..763399393daf 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
@@ -475,6 +475,12 @@ &remoteproc_cdsp {
 &tlmm {
 	gpio-reserved-ranges = <34 2>; /* TPM LP & INT */
 
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	pcie3_default: pcie3-default-state {
 		clkreq-n-pins {
 			pins = "gpio144";
-- 
2.34.1

