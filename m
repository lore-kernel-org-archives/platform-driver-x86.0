Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAC635C199
	for <platform-driver-x86@vger.kernel.org>; Sun,  8 Mar 2026 23:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773013038; cv=none; b=lD6jaXDnmSIurJO1wj22O+GOC37q9B/CtK1Aw/7dxqDtZapk21x/pHDbGsfCrQ9wqQjb0kw4HhZlb7qIK5vegjhmR/frG3QjXj36Dh0HougUMsJmQSSdKU22BWlMvfUmDrJHTBkxfyfw0Jv5yNC7mcZfEdb7xmiSAfrXiDIUADU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773013038; c=relaxed/simple;
	bh=M9K3UIkkj6b1jrYDTlji4S8p0UbCQhwBz60aeUglt/w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r7dJF33bCyU8EXvJDlJz7Ln7AvII3o0L6OFnN9JBVURONoWM0FMOdXR3ya+8ES1m22ylmP74tiAGMkghqUSvPrpFKtWOXJ3jm/Xc5fxW87+SfJdDYdb93Dj5TAVwS5ZPlQ5gvz5n9v18JHbaFao2XFOwPsG+Z4WumYcJyUcE8no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FaptaNFa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MybGw0mH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FaptaNFa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MybGw0mH"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628Cce8X2466489
	for <platform-driver-x86@vger.kernel.org>; Sun, 8 Mar 2026 23:37:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=C14Nx1IUNye
	f2MrP0doHKCmiNVz/XfkIxGtXZvYTpdc=; b=FaptaNFaC+y4hdb9KQIHcNDAq5X
	2fRbGVDKk5y87z5VYCZ2Fu3vL3zrUtKNUXEc2a/qsxl///LnAmE3IwfBEjmUtUTW
	SiF84ZRubfdvcNJGweTCBGn60NC7K8IpghMws6J8M5XggrNa2skdcjZtOmmPx81h
	GKsgqfEppSea4xaP9LUyUDwJ9c0em+cbmQrh1DnVPinT+XzIw2/h5vDjrxIIigKK
	Q/2ZxQt19euD1vgcbDfb5FrS1uTih906Asv9gFCIsE/XtSnSKAkDNJK/cbCPIX8a
	PzXmIrJYZqUog3cvy1wwk4pnH1QZDSV8+uDigpO3m2F0vp28VJgIILMAcOg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crayrkdu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Sun, 08 Mar 2026 23:37:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae6dd98043so48426665ad.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 08 Mar 2026 16:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773013034; x=1773617834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C14Nx1IUNyef2MrP0doHKCmiNVz/XfkIxGtXZvYTpdc=;
        b=MybGw0mHcXcHHJ4maxOhnWeUGSncWaBKaIeO8P8PFVdmYW8ERdpP6s491fgWFbI/06
         +Izg+/IFpaX3njWyA1Ik8apmCFVCtk6BO7yGs3vMmRN2snoKh2N/mtGf/c/00hu35sQZ
         yVw7UYnLfbIs8vy3v3U9ClwDY5+xMNj6VWuHJW200oxCyptxYHzesuPTMytt/dmaShFM
         RIze4379RvmB7GIqR9CkYNzJEJUWIS0eDZE8+Zqj3MbOcHsx/vfeh1yoRZ3jVVJ/+6Zl
         Gd0DwnyO5tbWFTrB1VDYPgcdpFpb/mFCj18dRW3A8Z+G+8zR+zkKNG+b9nQGRGaYBf6K
         dpAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773013034; x=1773617834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C14Nx1IUNyef2MrP0doHKCmiNVz/XfkIxGtXZvYTpdc=;
        b=lz/6pty8CBzst8brGeSlXG1RXqQXwBxJGDzY9O22MHBimvEuaE/cBaHTYK/1WoNhq4
         5Vkf3RaWOXZ0UGzVgwCALAtL06EzUYBo8C5AbZ6U6Sh9qPbEUgOVsFhpakASm5mThOnu
         BmcuFM7SLDQjNrDh1tylDF6+7xb+15JS5CZo7eKi4GIIaAPd1LLr2Ma0DmFknoWV3++b
         wHnU1MoGTeHUgaaKYRHoZCYPiZCRq0mblpj22Orp0kpPRBxWjdz1yVJQhonV83KiIrxM
         9VBEAoxk6SczjCfr2jzl0TbcjVHiQT0IYmEtKSoerjPIeStkBsMnn53dfugVdiR0rt2e
         UnaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYUcLhGM7SDBkwwsWUhGUMLdDIZucHM9ZJBIKwJdFkTWkBQ8xVhiqp0MXHiEbv+Jh+b6MkLet4Kt8PVAsplqmFnabp@vger.kernel.org
X-Gm-Message-State: AOJu0YxOkuGVBJnvzEFKnQNfT/64TzDDSPzH4SM8a1pkm+m3oD1NDuA9
	y4dKL8L5hvRFum2tqaUyjuLXOnds7Mtf04tHvzzPShY8SHWIkD2zgVGG2T5zElmp1BsbvbPXcf1
	M5DM4v25cJ4FGaHigUFiz6nQeDy+/pSOIgR5Kz+sftiVDgj8QFJYEAk+m3wuNfCys62AwGRvj6d
	/TOJCuUY9k
X-Gm-Gg: ATEYQzyWElFmRrM7AO0rcezH0FxHErpIgE+IjYcPElKJRlYzKHCbTjigwH1ZwWt4gFk
	JmzNRq+7KU9MOwanVfHx2qe3hDlGIhTMQy1cRQMaiYA89aOVkRHDkP03BscJ5NYB+kW22GhuXIH
	ecGjsrs99TqgzjTmDwsw/DosxFcOowTfveMUVAJ1Wgdx61LSCkF72ZfxlY0T30J01cBJ5GLoHJm
	UkUNdM1DpaN7qxnAnapPN8E8x0xxzn0uUBmRM8ZNHGBqon98BVRNbIJS3oTP8x1irAIpRlo41x6
	hmzncTcEt4a0O0vqKNNprlYDHpewOVA8YIP3vOf2vJdCSammNHeDPqIhZQYWE0wwh1NKu3kKM5q
	+7SM7ZdmhQb82cZvUY0ekgf2UriSB2ULdHGj3jm2/c+nrO5SotCv0mYu8yAoukXHNYER0TPEYfp
	QYrd2Xe/axqryRjSV10b7NMD57Cq4L6bp0UGJN
X-Received: by 2002:a17:902:e80b:b0:2ae:54b2:27d1 with SMTP id d9443c01a7336-2ae82467157mr96392835ad.44.1773013034352;
        Sun, 08 Mar 2026 16:37:14 -0700 (PDT)
X-Received: by 2002:a17:902:e80b:b0:2ae:54b2:27d1 with SMTP id d9443c01a7336-2ae82467157mr96392645ad.44.1773013033896;
        Sun, 08 Mar 2026 16:37:13 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e9ad26sm114274845ad.28.2026.03.08.16.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 16:37:13 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, bryan.odonoghue@linaro.org,
        ilpo.jarvinen@linux.intel.com, hansg@kernel.org
Cc: conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH V3 4/5] arm64: dts: qcom: x1-crd: Add Embedded controller node
Date: Mon,  9 Mar 2026 05:06:45 +0530
Message-Id: <20260308233646.2318676-5-sibi.sankar@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=U5qfzOru c=1 sm=1 tr=0 ts=69ae082b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=gaXMZf0GDK_To7W6ZIUA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 4ratA4vyGUrWBjsf8hPk7sb_vhyxwBj-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDIxOCBTYWx0ZWRfXyfEUgvWVT180
 gOLWPmTzaVbtsoFeYBNWA5iIYOg9EocqrfGZjE1lcTZCH4+ztw0MiKifYw6wH3DEuqvP9nSYRFP
 8l1nTVqxYw2pstuEHVlROFMDTnJeSlVG1t3wUmUMaOPG4tROACFmuE3TCwos4hZ22oQuMIGPBgS
 uWwy02ekL3FBCdBa5Cd1gyFXrBIXZk+LIKGt+HGsgYD2sb+hDRmaEc3XcnFraRhDXIhZQ9Wd4/F
 Kai42oMGwbGCzHL42CExPLDOUFz0ljtWtdEqJq2oqC97cAJLWv+Iu/sEZ7rJY593/KJxda3Su0m
 zVAzMVB7OX8ugK8T86/bsQdmMNRzlfB6tAxyjewiA2g/tiyS7QqIe7+1H0/kQnDK25RA8dT1+BQ
 Yg/mgmqRJYZruYM5X2mJF0clRgH5zbxXdAbawdJmVDWSPOS2E5Mq7Y4RQD9rzToBMDUEM+/6vP0
 Uzg4a3gGOH+be4Osgjw==
X-Proofpoint-GUID: 4ratA4vyGUrWBjsf8hPk7sb_vhyxwBj-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_07,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080218

Add embedded controller node for Hamoa/Purwa CRDs which adds fan control,
temperature sensors, access to EC internal state changes and suspend
entry/exit notifications to the EC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index ded96fb43489..29a1aeb98353 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -1042,6 +1042,16 @@ eusb6_repeater: redriver@4f {
 
 		#phy-cells = <0>;
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
@@ -1485,6 +1495,12 @@ &tlmm {
 			       <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
 
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";
-- 
2.34.1

