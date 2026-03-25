Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B757E3D0913
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 11:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774438887; cv=none; b=lRwebGRwhg4wP2lsVGVPRv8e7+MDJ8tAnVF4aNx507oxfeVAHv2wbddpQB74IyDpbjZFKBb4whVYsBdmu2YPCLMot2ooR/lZUaDf+mdpoqwjtYUJL0BDQPxZBXQsemc+gCNGzLA7DGGFGUTxQDHw5bmefDmlvKvLVgteknKXx6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774438887; c=relaxed/simple;
	bh=Dd5fp85/4V9VJ5EyZFEPibLsm/4o0VYPqFC5Sk2sGQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K/RoRkbV9bE9xRKjRjJ2Enq0p60IzhaQxaGC84XNHTsDwtvaRAu6UEc+I3Y13AhPOj+GVh9AoTf+wrBcquL9gmac5XuVfL666jx4cdwLM4gGXuFQgneQfJ+PDO++Nphhs83ylNz3duh8dbIwgIsRlS6eWaaoW4PtQv09ZwtUiyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KFXwsE2X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=imlpC6zN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KFXwsE2X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="imlpC6zN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBH7d61024461
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 11:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YM46yQGr/puwc3alCscfbFbGdSuIrLWtIOURjrNnAAI=; b=KFXwsE2XtaDGIRVH
	f3sE4WmkiKKVLnLQ+PtOQAFhDottapERvkDI5TIav1jQPXwDUlNsJAz1He+WHFqk
	E8FX8yS/0NFrUSIDMkGk5+K0wWtqiAHO9Ub6HBTevfd7iVYzeQMvi+cJ47+URww8
	o/WdZrYjA/hMoR+8u8r6Apd4uMTcr2LRR9+E5uBTIYxzDnBDMvM2ncmNw6aRN8tN
	uVNpVcAovf93C/BmObRVi1lQ0e9omJn/qHq6fQ8qvUInxkoKmLY2MDCIUVcyop1X
	EJECdlcAfJGI/BBIvUq0j9APmSVgwn/gN6G5K7eVhvKe+2d1A4IKQ6zwVb4SvZ0Y
	LllI2g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3vhvv877-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 11:41:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b0560c1320so145844485ad.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 04:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774438884; x=1775043684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YM46yQGr/puwc3alCscfbFbGdSuIrLWtIOURjrNnAAI=;
        b=imlpC6zNbeJOm9VoFoA3XmwjbbcBj00w1H7kGCjp9TAiTj75qXNzbTT52Jsv18vaK6
         LozQkbkTGVlCm3Yn2q8wSSXLr7zAB7dSQZs2W/XWlSgPL19qx4Rm47HTML9HFdhjKU2D
         vcMqu1F3EQg1sx0ylyMM53WnffVwzhutIWwl+pTyDgAlCzXcna2Pxc9rC17QNereYGsf
         DI4vi0pG5zWMPtbdplpaQCg/igU/C66l80ubecvVSclTRRIT0G0S1q9cCkGg5560VNC5
         1Cx6vR9ybwItPtGVkvYjSbO+OZbMmjNWebPwf0lV1OCnn0hHb60LHEt331L1T60sG1Hf
         K0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438884; x=1775043684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YM46yQGr/puwc3alCscfbFbGdSuIrLWtIOURjrNnAAI=;
        b=BNa0Y3sLx9RntNuazDJ8IVeLS8lOn3AXGjZuUjl4SlgeXtgufbnnpXHucpelAn5qPi
         FEqgTz2XvjH+vxEKTqH4pqAqyA4BeczzRVUqGwrVlIiW2w5I9zarPdbqQuwMhpRBNiAw
         CwCV1iOmS6pN3ufp9RyGlRQXeyWtYSWZZntRJJ8lE4FeNi7CCSo8f26NQNRQK+a7NL8V
         vzhHWGXMqzkxwbiSKYfypbKXliZd5YsliPRfuw9ZohCTdVkznTK3U060FXZPxQGzUBgX
         noJYqO66qLSwszOUuojYxAbcHYUYpZk8FOuOPatWzHQJtya1UilW+kUCmeUy+6tVunrT
         oKZA==
X-Forwarded-Encrypted: i=1; AJvYcCXnUt0gaudYvDB2skkeJrj7A5AglaTEM568hVWr2v/pKupHspOD12BRkquv5fBhke/5XFo8P5HwI2cPfZmRhPy28Vkj@vger.kernel.org
X-Gm-Message-State: AOJu0YyzWPuXXsGQhpDiAnHsELpdkTM4kFWbfUifDPsp3c4Z26nAKKWI
	5ahb+ZZOVKWDRSl5cEM8xnGvUN1Q5V9rsRVIVXGMGMeZkdSVioc3slY1YW1InwXSnsmMmTOVrCR
	axx/GRZyB1nXUX7tH8lA0wR5XjC7QyCWk7w8O24YAJmZQ4kJJlEV71nn0HIvC33xJT4JEBg2Om7
	tP
X-Gm-Gg: ATEYQzwKrnC8pZG+tHM1ML5ieTrWmd6K1H2UH2fWDa+h1Ub/fiQpSvbKI0Ka3A8gdG9
	1aHUg9WM4kRrLoR1Zkptwz0+Pi1Yke7KC5nsRcnZI79kAJ5tLS+o1bt+WayQYKsc4eOfLNb0RNS
	0cWCTuy0HoaryrBLcmc1tYvT/5b7n4fTtMy9j9zfip33YXEpYS4sKGNQp5jnUKzv06fP/ahCMQJ
	Ew2jXfgldWSADGCoZG4FPG0EGSIrB1kBhikMFBa6hogVSWJWP9Jt4JnU9XiwhAquXwmSFfq4xzY
	utEncxVTcll56Vh6Yc1cXM+mGmH1PLyzrtTQHrubH9hhGOiE3mWhG1E/PaAqOAcs2HIacof8z38
	YyY0vjt58LyWT27tmHV7J2XELsLU7zjnqcgWu1gpZ+E6jEuQ1SDV5QlFbXolBbORwDZJApl9eso
	hZwG9/wW9pKvQCx6mLgSVD1fUhVbezvUSC8Q==
X-Received: by 2002:a17:903:3807:b0:2ae:b9cd:d2df with SMTP id d9443c01a7336-2b0b0a9fd7cmr40601575ad.34.1774438884345;
        Wed, 25 Mar 2026 04:41:24 -0700 (PDT)
X-Received: by 2002:a17:903:3807:b0:2ae:b9cd:d2df with SMTP id d9443c01a7336-2b0b0a9fd7cmr40601165ad.34.1774438883877;
        Wed, 25 Mar 2026 04:41:23 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0ae360d4bsm38152015ad.16.2026.03.25.04.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:41:23 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 17:09:53 +0530
Subject: [PATCH v6 3/5] arm64: dts: qcom: glymur-crd: Add Embedded
 controller node
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-add-driver-for-ec-v6-3-a8e888d09f0f@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774438862; l=1578;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=Er+elbEJvOvNZkz+nLoEwXm5OyAOC9UUXsw+XjSTb7M=;
 b=mUIlcPLYJ2WktFEkXqwnaYyyR1prxDiVFP6OAllROeDf+efsFUifRJSWs2yXYVrLs+vDcFQr5
 ipexjNFhhyoA9koc46f1QCkTmtlL7UZHHJYOYeVIhV6rqiGQ+5iudsl
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4MyBTYWx0ZWRfX0VZYZ8RpBNPn
 mvfVzZclIUzZocgq39xZuMhZunex2jrjsghHh2/L/Jobz9kCH6yULQqdHf8FjKgoXQXxiBHyByk
 k4VsuubxYlQfHV+2kihtuii8uZGYsQY4BKIvN38MPLEeejOUz/VRkE1fs6hMMYFAgtfG1whNvHr
 RNO50vNotr1JxGaidv0nNZo7BmqAGeAUpxMII3nIuvduw/oqbKRcg7qKfuCN+JK/yArzSiA+xtN
 9XKE7GPQbVFb2jdQRqc8vVFU2wyIwvor1TqN6usUlqhJTmNl0S8htzGJwm+jgWFYtKgyS94cFpB
 3TczUyPSCz8SgrrSKZskwy/hYWKop04Y95k2YV3qF0RgWV0CPfas5NGpoIn7YFvHgXd2ebmqV7U
 gl396EY78vzWCXiyBXm7bR1FalxZDVFhERt37KUZphFSM78rzAItGhdzqoELs9uXksM8Al5HHPE
 B39s+hZ6ghMI4gweVxw==
X-Authority-Analysis: v=2.4 cv=P5M3RyAu c=1 sm=1 tr=0 ts=69c3c9e5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=h-fhkJo0eXD2C244oGgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 3FZKmJ04pPvFATXf2jih1E1256esyj6D
X-Proofpoint-GUID: 3FZKmJ04pPvFATXf2jih1E1256esyj6D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250083

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
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 51ea23a49b9e..1a69b428307f 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -198,6 +198,22 @@ ptn3222_1: redriver@47 {
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
 &mdss {
 	status = "okay";
 };
@@ -263,6 +279,12 @@ &smb2370_k_e2_eusb2_repeater {
 };
 
 &tlmm {
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	edp_bl_en: edp-bl-en-state {
 		pins = "gpio18";
 		function = "gpio";

-- 
2.34.1

