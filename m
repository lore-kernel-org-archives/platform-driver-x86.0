Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F142E3AA4FC
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Mar 2026 10:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774606122; cv=none; b=FBLjNB5Sz3iZtkKXpo80ThqYyLEaGcdAveWZGZWi34NMrZVny4XEdm7n/bv12BH2lLT+jwnkjbXV1hOgDw+/Br/ixpy/A2a0DPHk6kPX8NjYYf5wb0EWDLISzQrr/1yqp+fM+Viba85pcCCH8ynDPJE0+TF9O7W4IZnvaAXzt5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774606122; c=relaxed/simple;
	bh=Dd5fp85/4V9VJ5EyZFEPibLsm/4o0VYPqFC5Sk2sGQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SaVIHQEWrstW+J66QdvC6qG7p9K1s7fGl+65t63OQJd1EViOkM6IjdhYOgxbMtjWXCT3axdcXH30uQpRnQJb82E6qUvharNoI9lTuhPnnrMi6KhSJdewzJN8Fet/uNQphGQ6CexKNW/jnwtqXzqiY34kGoykWB9thIRA51iQi1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gm7bp72e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YSKbPyno; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gm7bp72e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YSKbPyno"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6wJD31711109
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Mar 2026 10:08:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YM46yQGr/puwc3alCscfbFbGdSuIrLWtIOURjrNnAAI=; b=gm7bp72e4QiuNr+o
	dzafqmRZ1AOArxGnoBuuJcVNVezCOCxJM2dwh473KRvdu3kXq5vg/MlSawoDBAWG
	7OnPljrZJPL+KoslLQk0fQMXmlhp4eZBaFRIpA800b0gw4KU01thMVSewMAApuZc
	Jj+xsG8oi0NboZYlGWwdVmMBFUd/zsyUBhrEzghvpExKa+XqM/RjOoQ+E1l8rijs
	GWE7TYe0fUMr10omUonTDEKCMNjLxvkaqeIliiIHRNPY82bwBUwJxEoxs3fMEbXT
	J40VrHsCnokuddZkHZ1GFzp7t7XCyfapelbrT+qOT/PUk5lUL0cbMv7efWNroViw
	XZK4/g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bxvjh4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Mar 2026 10:08:40 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b07bd30b5eso41535325ad.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 Mar 2026 03:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774606120; x=1775210920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YM46yQGr/puwc3alCscfbFbGdSuIrLWtIOURjrNnAAI=;
        b=YSKbPyno6C3AU8toY0rRMClmO+vzJ1cNQ+LhXLeEhBgYmnrvJZM+Ik/RRMV7OAMtgL
         i9q2UNzYYZ2MR8wbWrSSZBPFhH5RQPnffJPmG0kh5OG7/kz1iVXGE+34cipM5z9WRWIi
         qrlc0sp7pZ/7+9nT1G9+uBmr1yveukpl/D43ZJ83JrIGs5AWnjuo2KJdBWpg4XLsF4rW
         QSCYWbhOSlmjjm/0RkOx1WWMY7hgQz5JA+IKjPIu41vhDZWoy5EgA/rb8Y8cbMSdFteF
         ArKVo1RjWQC9bNmQqAVn2/Ym7iWf7i6Q8Ljm1oJPW4sGt5JguUofUzf37+vV3yJvhbSD
         tGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774606120; x=1775210920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YM46yQGr/puwc3alCscfbFbGdSuIrLWtIOURjrNnAAI=;
        b=Nh6ix+pjXPV+hMmu04gyQ80qm0guY98XfRf6bL4NQsoZceeSMwqBA0bHBUYErLthhZ
         m8rWwZNg+E9Tve4GXJcS0fLJsVoyzqPxe89rmLg/5xhUVXdqs5GFLX0VaXYy18uMnQ58
         tXx7pLu+Ynw6yyq/0jHSFpF3ItirfCOHXYn1o1Oe5+FPrsovVzEOzVOS6f92oOR9MJ2u
         tIFLmykuC6DPyHjDt+wVBbDDf8/i33fXC+9twt7p/yjTfwAuUY7MQl3kCKEoUUWhKPwt
         gJ7sC/IUzy6tXrOOgA/+un/JMDHbO+o6NrN0e3BayO0PoKrL1TQgugdMkhIb0npZRJOT
         cMgw==
X-Forwarded-Encrypted: i=1; AJvYcCWXuyohWmLii76B8ka4sDsVEx9XYMkDK35d2Pe43B3TMvlVGCV6QqhX2m8eCWaVAE07rkWAG7rsik8vM3MS3BsAPM66@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3Z6XeUD4ldGUD1ZzAS/p4bsjYK/N5HEgQYj+2OrP6yzYjfNh2
	tvBpIrX7ipA/u1aKWj6wpalL4Ze05uwDoeaIJZI/M4PmsqOafgJWkbrJ1CGhhggvZBw+wmUGGzI
	r3gTRt3dJcCfCuGTsxDKkikl8JZHXdPY2JCuruyrH9U6tAjlRKuKmA8iz5NZtFP1T6ZfcVtQny8
	B6
X-Gm-Gg: ATEYQzzoXT3Npe6AJZn4Bh164O9p48WqUkZeszLeGNQcBKe4NWHgXdR2kzc15wavJtQ
	+esM95TpJOKnNQQhJmoU1ESdLDwxHqHd1zNK1aNUXBDDTc/4GNKhx92og6qjYCAelK2fgmSQU5O
	qzfLGmja7icWn+SLAHSJfLZVSMo9YiGTve03WmDftBs1+iPCdfL0S1K0vN96G5FUfCpzEivipOb
	FRRGEVBVLULHq2ly4uJS4hEkHeROS3pmLmQgXCnE91LwO/sBFwy6kNa0xMfL6mSPaaX+aqPbGdp
	MZAkicMevuO/lScwTMkKdQwRtNL2poIS43Aqxc4oOhmkfrYAPD66xNaSW6nJxAzfMl2GBI3WuLz
	+ujZk04GHYxBclAZOfiIH4rJoQnSdhGawy/FURkGdSQEDAvqnWJtO6BfgINJmQAXumts/wHcS6Y
	hja/68B70fAZmp45PN7I6mXiMNA1tz4My8yQ==
X-Received: by 2002:a17:903:1aab:b0:2b0:badc:c9cf with SMTP id d9443c01a7336-2b0c4879c57mr50300435ad.13.1774606119670;
        Fri, 27 Mar 2026 03:08:39 -0700 (PDT)
X-Received: by 2002:a17:903:1aab:b0:2b0:badc:c9cf with SMTP id d9443c01a7336-2b0c4879c57mr50300015ad.13.1774606119175;
        Fri, 27 Mar 2026 03:08:39 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc786b7fsm74465675ad.20.2026.03.27.03.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 03:08:38 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 15:38:16 +0530
Subject: [PATCH v7 3/5] arm64: dts: qcom: glymur-crd: Add Embedded
 controller node
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-add-driver-for-ec-v7-3-7684c915e42c@oss.qualcomm.com>
References: <20260327-add-driver-for-ec-v7-0-7684c915e42c@oss.qualcomm.com>
In-Reply-To: <20260327-add-driver-for-ec-v7-0-7684c915e42c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774606096; l=1578;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=Er+elbEJvOvNZkz+nLoEwXm5OyAOC9UUXsw+XjSTb7M=;
 b=RxaZ6PQcsC3PiEq8EfkdXwoJI91FZ25LY48pVhQl+X1JgzEyVTbcTK/efzfwQQSfBCBSjru8a
 nngk5qFXNXpAVtHsBYQ5GZYaPMssDTa6S7WJA1ZfM5dBMPhAzGrN+pN
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-GUID: Fpw8h7FJ8dDeXZXkSxmdfxVtlV7T1lxD
X-Proofpoint-ORIG-GUID: Fpw8h7FJ8dDeXZXkSxmdfxVtlV7T1lxD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NCBTYWx0ZWRfX8+YD9dZXpyTn
 nKSDC1YlyoMy4PV4d+dgpJkop4aYeYIWB+VP6XLIMzngPvp8pAYfVlOFbO0rkjQ5lZdxxBTUbfs
 lEhd/iFyVcIEQEfqfzBR2bFsFX03QJ/SwPraipJWSI9h8vCA23T4BobBClUa9yhVTjNzVfTXrxW
 /m4y+WJI0lZtz0jE0z6FUYlbA/BB8Rs/HNnqoZFf11KquADd6aajraG9/KAiAPD8QRUk7KInnkp
 MoMaQkxoqcqGbT6F0CY6J8K5PQz8qn+wXCwJnwbjzlJqEczIpc27jEr8O67MMi9I02GLQ2q1O+7
 FDZKkpuivX8FmHXLt5v+mTF+NCom7nVj2KCoTlAxA7eMFaOkR5vO+oRhDDmyEO/PAX+bGn6i0UE
 NlsLBtltNep3UqfczoEdVJEshNQWgCVaaOu2Sa+hiQdt8yiBHPu3g5vcQtF+CwT41rIatuKWQRy
 tCWgjuy9sXp0yThxeSg==
X-Authority-Analysis: v=2.4 cv=ToXrRTXh c=1 sm=1 tr=0 ts=69c65728 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=h-fhkJo0eXD2C244oGgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270074

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

