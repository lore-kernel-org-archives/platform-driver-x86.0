Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99EE35BDD7
	for <platform-driver-x86@vger.kernel.org>; Sun,  8 Mar 2026 23:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773013034; cv=none; b=Fm524Tv2dtkKJRTW2Injw/l1nIF/bb6NYRDam/9gQrK59G+igbR3km8iV/4KJrmw2ZfRwBs8iVyYQPZ6PtjktcgtZqosaRBAepdZU2IB/QD6ub6ysTDJ+BX8LraYJ+XyG4Aw+b+5T5jDkZoTR+FcGeXTg3MIj4MSeeez/K1oPss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773013034; c=relaxed/simple;
	bh=GWftoszj7bbn3ImxQVyW+DYVQAbOtHpmtrjaSzfje6Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZYF/snGpT/NLUuXSPRDGsAuE/MFicKIBvjbp5kKgBkBYjLR0v51ynSZdU+eg++/WFt9x8HjwNVUic7V/QN+/ZoihISffyVlx/2dw74xfTD8y8OPwDMbDL0iW6VBhcj1WlveWAPNQIzFpekWhpkM0uuLpT10JF5Qu9tm4hZsGi54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kdA6mJFf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h4M3sQKM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kdA6mJFf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h4M3sQKM"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6283OAMc224227
	for <platform-driver-x86@vger.kernel.org>; Sun, 8 Mar 2026 23:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=t4G1XLE6zkU
	yEgv+up47Gk/kIHuZ/MbxKPZHfvipbfg=; b=kdA6mJFfimqWaBk3RzEsdbWSLY8
	VffyiPNdQTAGKoKxdNj6UHW02Iiyu8ycyjI3Igt+wvuSDP2fm6JCIA8Wj8SqysIf
	nXNXAiCaK/skNv9Kv+dyjb9PyrsgS3M77D2wQqZlLkRCE1LbGbpnrU+ovTY0skG2
	oQ583p3pTdFDic2wwRMmFTvL2NOhr8PIKchkg4Y1onXQ96/tzIgGsjHesgBKTvCz
	hbgrwBdx1XqKUbhfUF6hr8XJhW1eq5BfqhtZiDRffQ27UjovYSE8/gsyNyt423HN
	WliAN9Lo6+MBKtbl27oxbfBcrGhBB2cRwGZ8aRU8+ZFaD48Vv431TQEbdEw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crbbg3b13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Sun, 08 Mar 2026 23:37:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae415b68b1so90411985ad.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 08 Mar 2026 16:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773013030; x=1773617830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4G1XLE6zkUyEgv+up47Gk/kIHuZ/MbxKPZHfvipbfg=;
        b=h4M3sQKMAj5Q52Yn5rP12H+VgT9Q2d3O8ICSGX/1scP+4qYlrdYiwi3xI0D9p23Uk+
         H+gGjIXVpQqTaTBdLaLvGp/Dz/wY0Ebx3Fxrf6l3Y5yEJXv6qKFRgqt38fSZi8z2I30A
         ZTjTSGhL5ftIWjW0er30HJ3tQl5NJVgBrYSJ2ZuT5Ezw8VyXmvZD6oY+tmiTHda+RUE0
         KC7J16t7FYVHy7XBKInLzkOSad/e6fdHbhWE+afOwpF9DG5SQX1bVqR5IpWLb/Zvl6FL
         IF69vpeRGW9OZAQloyqx+9nXBV9+o288fFwUjjgQgL0REt9Iu0Q0hZ3poagqCTAfEB+G
         g7Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773013030; x=1773617830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t4G1XLE6zkUyEgv+up47Gk/kIHuZ/MbxKPZHfvipbfg=;
        b=D1EmRsJ4hgnePgSmobDVsLnC5fhsHMBbYfaKWUWzMMkNehDbzpwG1XAV3h9FKSTXAq
         2r7+FqYhH7BoaasTb420fr7aKsNH1EGU2HadjWD434zftV8UC3DeK9m8wrFJFT43oft2
         cG4KFR6+FRDaaPS3SchdOiLIE4RLmyPsw3CSgNgnX58R3EQ8bBhnA+04ldxUl3LdtJ/C
         9UgM/3c5sw2lH75qxkSDRcYuvtNqHEFG3dZuLvEnATaHuSr+//a15xY1Uph6eG/GocFY
         hA0QY3CIZ+/18ikQy7lCUlRLPAxHs9beMCIfl9YVbiC6oDialhnBNCXFgnT9eVhx/CVQ
         X+/g==
X-Forwarded-Encrypted: i=1; AJvYcCX1clI0Qs9czf9V8sOJyaYycAd/UXvqbXxd6xQUayVwHnM4owvD7WWeI5lW2YZx/scwfdD7bHneALVKG0C0+CsfRpJ8@vger.kernel.org
X-Gm-Message-State: AOJu0YzmqSxCpqO/7QvzKnKb4+I4PmDfysAaBFofHWE3PRe3qSWb+b3E
	+JifUgXR/jMSNse/yv9frnqzIJ3YwisXKh/sHz0muxSfRPal+egX/eBu5Ulz2A7r/YuC6Ctfn96
	5qI59Xj27UaCiTsmVSVpkz4TnJWVafrTEnUmUDuA59rITYkukGUU46mpQOxC+pjrYWxqAuJwatf
	G2vKJMucfT
X-Gm-Gg: ATEYQzzuYh7emytF9/Ne53gN1jUeHQXW726zyWT10EiAjn6qTd07TMEiDMwG+tBJF0c
	nq8+1TF6Tak6u2WE10QfJubTmQMJiIoLIHnedBRQ5TkF9f1VgI0zTPj6TO5ablg5Qiusrc5ayE7
	3VF7ANxImVqmNdcB3a6z4qrtIf7BhGVNh9rseGa/UeEqdWfC/U85w/jvneGZ9Z2gbshqvB849Aa
	YN92rWbvbTnhUOV2EoeQTAhNt6PnINT/Z6e5lzgQBgJwU8wQg4Hd82AEy4EVn9mycII4fgDIBTM
	FXmAn8HMGog/sDO1xQDu4lUtSDUiMjo14y/Tn7mkQaIBLuXeKk2gQFr6O6pZdEO8ynKhHgg1cwl
	kphsU77iQMEp63Ui1RJsuj/Jd842rejiyt4g1dmbFnPwTw8y3GcJWMQWqWpVlC+J2R9GfvxrJWt
	dijd9hyid2i3I40ZamElBd4T/JdzUs1qUvAux9
X-Received: by 2002:a17:902:ec8c:b0:2ae:4150:3125 with SMTP id d9443c01a7336-2ae82397833mr85238905ad.17.1773013030149;
        Sun, 08 Mar 2026 16:37:10 -0700 (PDT)
X-Received: by 2002:a17:902:ec8c:b0:2ae:4150:3125 with SMTP id d9443c01a7336-2ae82397833mr85238725ad.17.1773013029682;
        Sun, 08 Mar 2026 16:37:09 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e9ad26sm114274845ad.28.2026.03.08.16.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 16:37:09 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, bryan.odonoghue@linaro.org,
        ilpo.jarvinen@linux.intel.com, hansg@kernel.org
Cc: conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH V3 3/5] arm64: dts: qcom: glymur-crd: Add Embedded controller node
Date: Mon,  9 Mar 2026 05:06:44 +0530
Message-Id: <20260308233646.2318676-4-sibi.sankar@oss.qualcomm.com>
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
X-Proofpoint-GUID: jSJD5SLxPnBP_oWcnmP8fCiZ4yoIZf1n
X-Proofpoint-ORIG-GUID: jSJD5SLxPnBP_oWcnmP8fCiZ4yoIZf1n
X-Authority-Analysis: v=2.4 cv=SumdKfO0 c=1 sm=1 tr=0 ts=69ae0827 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=h-fhkJo0eXD2C244oGgA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDIxOCBTYWx0ZWRfX/UbQpD2l8rHY
 ezS14dYIKSJlJb1Uibezu1RPl0fp8vdN8cZ6notF4aneHUVoZ/It+ocF63AoLpqDevuFctiHoLC
 MpGwhMdA/dbxIcitKVXOpRwP13vGCBlYO158qZBm3T7Ch/QQjlEy+JLkZgYbCXzPNlw89UbM9Vb
 raFKA2NQ1kfTPmF2y7yYupVboIiqcPyntu+7ifuTqs/mTd7VoGeKFMoZ5TLwFeGwgMhtUVDjuAL
 KacUqmcSCpE9xZcJSPvyrRSEtPtspAbf5NSwlwStPofKvz+YjnQ2eB/bjNqhIVgkGhkM3HQNeJL
 F4SBKzVHdJtRl9ksZTklGA1BQaT2P8a7O5c4nQfYF5YJ330zmEFUmRppVJYsdFpIHlad9W9E8Yg
 K1j4ZQDLDjbE3d3/0MKXw+XZDnDHljPcxJ6e7AIEQE3Yyog9uq4E08kiOBxxGqKRxXJBsakEPyP
 MPoK4QgtmOGYqHp5TRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_07,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080218

Add embedded controller node for Glymur CRDs which adds fan control,
temperature sensors, access to EC state changes through SCI events
and suspend entry/exit notifications to the EC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 877945319012..94abef7f0f1f 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -367,6 +367,22 @@ vreg_l4h_e0_1p2: ldo4 {
 	};
 };
 
+&i2c9 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	embedded-controller@76 {
+		compatible = "qcom,glymur-nuvoton-ec", "qcom,hamoa-ec";
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
 
@@ -490,6 +506,12 @@ &tlmm {
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

