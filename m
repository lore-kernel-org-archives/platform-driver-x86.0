Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0623B530D
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 10:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284344; cv=none; b=W0XBuhw8BewsEH/3IrXWpVUK1C2NRS3I1oIj+/CR/0P0vsh7ElJnXq5nC0N8UiJahygqD8lQ6XCUN/Rakfo1/g5SYG4HzVhgTrbNun/Uhyy8C0oQJVYO1KehpCXXQfCm86vFdpv3jIlxpXRYc/D3/AIDK8s7iNIqUySU5a7WMwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284344; c=relaxed/simple;
	bh=n3Dj9ex9DeD+L+lQKKQOUzTFyrR50tsgxLyyinSeV2g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o2H5zwZnDDKAOLfxBOYRMHBjacvXC59kyyfc5H13V8VhicJwUIqpmNYhdRRxuAHGiv6iVRRC9pttxmWAXqtVP1D26LA3OoEAwVNeC606AehvyJOGb16JJxKWf+3OqG38Wgtph901ijUJ+OABRMMeIjpnJCDnYWCvs5jgLCqUmlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AuycH58P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R+D+5kgD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AuycH58P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R+D+5kgD"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8T7mH2913796
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 10:05:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SwpSnd+xI/zib862gFlteSCwOFEFE9mObuftCHljYWg=; b=AuycH58Pn7nfM35v
	HgR9QbZ4RIZH4mTeAbsPZ3WI6dt3hML2aAfsz7Y6Q4nNXbdzYqobutZiqljTUW3y
	RixshYN8knxww5P9No4RLpq0j5OiY8cS9S7qGS1O1xlidbtT8Sz2Os9m6YJWIqKB
	QlQKLBXeU0h5N6VCDpNRWR2MZxhOl5Vb9hXNq2kcfZC3Ve+FoyxvCye3o4B5haBm
	KFGjRgJXFZYtqqF0inqMnGuPzTUyrrd0St9WeLSr5Rah0wIxV9FFZqP8BIVBdOav
	wcDNEzTJKLWZ2lkDiMR1uEYU6U0Yx8g8wFYbddqxcS2KXOpPfSeIIoAxZ2Jokr66
	zbD6Yw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt26xgy5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 10:05:42 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f7bec24fdso6743152b3a.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 03:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777284341; x=1777889141; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SwpSnd+xI/zib862gFlteSCwOFEFE9mObuftCHljYWg=;
        b=R+D+5kgDDuODtaN+fyJzTpfWcIIQNIkwcvFZT22CUPB2nUp4V6BsIA/3b/11b2uWAD
         4HOtE5hKjiAYLWA+mrgeXFclWGgXZ2sTYIoiQV0iEK8ZbSbdr1YbCBdZlu6RagiQ/hAy
         HnHvFZ05EaDp2soww1Fto5e5VeB25e8dn58Uep81c9RxDq8yQwlPCBOZ+Fmnc4DBLuI/
         9N6u2IqUFE5NXbR2JERqHzHJmpqTF0DrbWJtLxBzSPS7CFFQFlIvaKlUd8Nx7CtkQlQl
         3taW9wIjfkD96zQum5kuCW2mfGBXakzzOzkNWRPIEA+OYiDBFmGIFU5gqXTjk5LU85/7
         BRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777284341; x=1777889141;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SwpSnd+xI/zib862gFlteSCwOFEFE9mObuftCHljYWg=;
        b=ompQpYUzZedKdZmXKoniARgIK+TWdJw0MXlNdLbcUx5NiuNUOJCtjKyktGigdEEzUp
         A1czIK2EYaOA3yUNwfN/+WGYw2NPUYMyBKQiZeGSIuCVk5+ASA33wsCfdYGlk0lmS/ku
         2bgMR4hWtQlHDd2jJCDHXQ8N9wrph/m+xvRXdN8g+lLzbh2l8gWJsQ2hQQTCY+q47GU2
         Y2brelJ9BxrotsX5v/qC7fIFStZigSoxK36aCpoa4K3jYVM4HUfR5wpagKZlstFSdhSp
         u5Dwsqy3F323XvjMNCUVl+Txx5oleVAAnfoxs2haWX9xst1fSWJO3fJ+nSCe1bpb6+BS
         /buw==
X-Forwarded-Encrypted: i=1; AFNElJ/i1NceH/ofwcTjTOVUO3gkrLRq9u7yRy73G/0VZzxpnyZjHGc/CP4L2R/fhMQb7+ALULUxrjB+hIdg+7E6P5/Im4CA@vger.kernel.org
X-Gm-Message-State: AOJu0Yy11NrmKu6skbuxwKSwc3wLrqGUfG6W5Hhn2EeRaNj9f0dzLKm+
	K+PkM6z2WO95xafO8YclXf6reaMVzUUGeW7TLInDVdp4R+COqEL3wvDjO6VMs8c5p3TfVVo+++R
	SNBspAuEUaI+3N65tXGsBaozFMopJEuaGcjl5KC6xEbHXY0P8J+jzcQoCKi3L5BZfrBe4MDVZoq
	i9
X-Gm-Gg: AeBDieuqZ4c/JUxcH/RMIN8PMClPrjs8vr1A6YztJXfpRnADpItT8IwR4QRRdCrhjoC
	pqybDy+riOeFCnxgP03SCqA4F3R7o0QPN97PAStQvfQm5JV8seMY2IoXMkP//vUDpUsk2LmkmQ1
	TZL9vLzzM4ITSkcZBDuLW9WgmWfnpQfGdvB94e2C7IQgIBZZa8a5IWQC453BrMbkN2D+wan5SE4
	v2Kj8YuTVLv7BpuGZVS8HYhBhJqKKIOokFYmRazLCAiCsqeZF6z2/8eBFfJ4OA0eFY5gFOTwGJF
	5cEEB15fLm9ynTCwg9XzO79GInHFgxzr3qIpuJnM0jnIQK7md2E+xvu064+dVzoF9TAP9HMkutv
	7Rbd5se4O//bQ5tgJeb7NSm7SOiK1WZ5SEhxpG6ZRHc7L4Ucj114XXm7CYonxiWQNazdnQ+3mTG
	Fd9MYhNzyE9UXS8NhxKyP1DpoM0NPxx2EB61YY96j9daXG
X-Received: by 2002:a05:6a00:3e07:b0:824:9bc5:e946 with SMTP id d2e1a72fcca58-82f8c919150mr43912386b3a.46.1777284341448;
        Mon, 27 Apr 2026 03:05:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e07:b0:824:9bc5:e946 with SMTP id d2e1a72fcca58-82f8c919150mr43912352b3a.46.1777284340843;
        Mon, 27 Apr 2026 03:05:40 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec24850sm33004008b3a.60.2026.04.27.03.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:05:40 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 15:34:54 +0530
Subject: [PATCH v8 3/6] arm64: dts: qcom: glymur-crd: Add Embedded
 controller node
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-add-driver-for-ec-v8-3-702f74e495f7@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777284317; l=1650;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=3BLnT5OTOT0qEyowVKSfm/R3DNxg4MouTyG+K4wg5xE=;
 b=Hlbo3xq6s5a6jr3USS+Pcqn+F0iHwlc9CIYWbC2511TyN1Y1eaq6TwYcu+raC6WosoM7rMxuU
 zYss128YWnKAfipuhrCrQmJjeOKmKfnQOH+rmrv9oeWf3jsSnIJATaN
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-GUID: iIc1BtxU2UFef0X4M7MBGCsv1hX8UTze
X-Proofpoint-ORIG-GUID: iIc1BtxU2UFef0X4M7MBGCsv1hX8UTze
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEwNSBTYWx0ZWRfX0poWZcfGcthe
 EyUXVzTA6jE/wqJ9ug+eVcU3BoEKXxYHJRKKOSieqn/Z1Ccjne8Czzfs5cBAOPcfxPssH8kVjk0
 9uXq7vMRNb49D8VFqha4i7yl4uSZ7GKlXDq146tIKUGE3WbYQFP00V2rMrbL+MEXYPsgU9uYPP2
 1GZo1OQjYL6Rf+WxQwplmu+u8AU3iIbVQDFVbUzSAJqOcTgOPn9ppsGmpEQ55xNWHvoAEsR8VoE
 FpxeoYY9su82aBVXumP7JGdRZzMMHg31hVDTB+A/8PPsNHFiOJVeIXcMRmSuzlsA3uh9Nss0iMR
 be48m9KvXgt/mLwUkzPi8Yq9CnMWEJn/93vSCwmAgetfxtx21ePxNF6cTJbXvAHrVEF5ivQbEbm
 vvwLJflo91Agh8G40f46+SGGbAmOS2x1xICSOxni6OxcbDi4umi4g0Y5CQ8hOBIfy1XFLgVgU43
 g1dT+NksywnWQLe7AvA==
X-Authority-Analysis: v=2.4 cv=FM8rAeos c=1 sm=1 tr=0 ts=69ef34f6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=h-fhkJo0eXD2C244oGgA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270105

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Add embedded controller node for Glymur CRDs which adds fan control,
temperature sensors, access to EC state changes through SCI events
and suspend entry/exit notifications to the EC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 2852d257ac8c..8f684f3402ba 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -433,6 +433,22 @@ vreg_l4h_e0_1p2: ldo4 {
 	};
 };
 
+&i2c9 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	embedded-controller@76 {
+		compatible = "qcom,glymur-crd-ec", "qcom,hamoa-crd-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
+};
+
 &pcie3b {
 	vddpe-3v3-supply = <&vreg_nvmesec>;
 
@@ -565,6 +581,12 @@ &tlmm {
 			       <10 2>, /* OOB UART */
 			       <44 4>; /* Security SPI (TPM) */
 
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	pcie4_default: pcie4-default-state {
 		clkreq-n-pins {
 			pins = "gpio147";

-- 
2.34.1

