Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3FD3ACF17
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Mar 2026 10:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774606128; cv=none; b=bGy0v75MalYo1d9WMsn1Ci8JMsr9Y5FCvb2vkmu7yFH5bOOeCwsYP/C6us6GskTb5ek24AQWrBdVeHplHxmzBWpKPFsLTZQ2QV274GabQw4/9Q9Cr1oVU7l7Wo1ga/6GViDBDM4tnJOdT4sBPSN+20Uy8+1xYgfPHV5kOLPZ7Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774606128; c=relaxed/simple;
	bh=CNOKzvn5kD0XReRJC8TJ6vbCACz1YNhnjP6JoO3Pr4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RVwgdrTV6Vnvp0ujs2cMNreodF9Pu2B5J9BbGc8XCa5ukCCa9GB7qQwgbNryDpbfRArrs0l1G1ep1fpyyk2inJhKu0Vofp9sKaACsxfHsBxLX6yN2I2sOwMbAQVUryX+SyO3wXel6gRyM/ptpvRTa6oVpJrDj0O19yjBef/EEro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZLN0aVu5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CKLN3CXJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZLN0aVu5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CKLN3CXJ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6wHWL2538704
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Mar 2026 10:08:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7P6zhpcLFC6aPfvZXVad/0Nrsu/6r+qZ2S++aXiCT/I=; b=ZLN0aVu5bbmI4/nb
	I8J509pHJtfZgwIMCOkHBBIsc4K6HW3KdOek1M/M0eCCIDfGiVmNYMBDxXxzqEOI
	6uxPS4pbqVWmqFxjSeugz5l8R0RLiXUAGT2fj2zUunoS4h2yU+KH+WVM6BFLcNj2
	KfVrCyqyewuJ9kozFvKHLPEq1G5X1WsC9gsbePs1DyUCd6cUdhMAT2TSqZ9WvIMd
	CqQRz4AdmTDyuifcRGFl0k1yxXbZGn2Io/dz/fa/ttsW4K8NK9dd84U4OXLQ+LV3
	VFmSQ0kR/epfWJXvsS+fHjAAhP9TjxYG2YJnHxUeC/TtEQLck9Eptyq9bocWrkoi
	39ZhBg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5883kftk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Mar 2026 10:08:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b0f4e632caso5438825ad.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 Mar 2026 03:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774606125; x=1775210925; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7P6zhpcLFC6aPfvZXVad/0Nrsu/6r+qZ2S++aXiCT/I=;
        b=CKLN3CXJJFGmiF0hjYN+8doknGFRmnNZXCySqdZkvjP7GqU5grOJTMcvTUN4UBQOPu
         XdqBb/mbM77RZ66FPewJqrNWv4khQbkbNw6dDa7B23HWW67l4Yk9kd5rCfavK/V9tWan
         Bu8kL6PdWUxhkcllBxDu77vSg+ZYq03a+FnIZgQVueg45oCqFnz0/gEAoIJDjYj6WM2E
         XZz0ZJufFWJ5xK0x8NY64OFl5TSbVsa1IvADoTopgo8PWolz6mv18Nom68Sr1gXMf5lP
         vovJ1j2qxL+Dlm1sgZQOzbI6yhxDjmZRoapA+rWOfJb/IpMC3ggY2cizUYJUNSwhr7th
         D4CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774606125; x=1775210925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7P6zhpcLFC6aPfvZXVad/0Nrsu/6r+qZ2S++aXiCT/I=;
        b=BTKhSaZfS9p7ASd+7Fyp4x7jSXVnQc4pqNkxTVgh1obAwC+sDpIxV7184xJPZky2dD
         S42kkUHS/1TMPqU8gN4o/uJ+dXgqFmsPRxgQDsiQw0u4qV0rbKXHSK2vyD4Wli2RbAp/
         5WPd2HmnJqFcfNPaXsMdS81MBZdMI25x4Rlfct6X5WVBPiRrnd96yX+2wcA5UH34KCfd
         K/O8dNb4j586tL8NP1r5qasx9geRX58utePpg/Div1wTILl9Hl3EocpujUig9I0e/sLF
         6fG2X4w7mFIbwxJG5cIYXQ/ECuC8xZugxcoGekz+DbtVJJ+HpWVzXE0tqYaDI+Nv/UYZ
         UDZw==
X-Forwarded-Encrypted: i=1; AJvYcCWmqhop0gz8+EtAMw5Eewt+i7UPj9T5vz0tSdVMoS0+L0n+nNtWh9qzwo9mikpJHML5bwFJc3fA9qyT1WEEDfdSNOMY@vger.kernel.org
X-Gm-Message-State: AOJu0YzLwTLU8gpY7nebHEFrpeYmUtGjGu7ZJM+Gq++KylLC1BULkZ/P
	G1kq8Si1eovNKKYQQYV1CH2pxgiIX7eY/EPtMsbFyGKfqHQMaYfDDO43xsSWXjosweX/C8UxuL1
	GYhZfOMQRhqDp2q/xPB9wW8hl5DIzlUtVfBZqNUk7j2t38GkvA+3qKrHQ1pDSe1hX93VBsfeQSa
	uV
X-Gm-Gg: ATEYQzxKQegHWbHjqqItHurJeK2kNF3+Nr0wJbugP0ynvLb39JTNNAG0nVlyk0NsFCI
	gn7MGfTIpFOMsjvwBx3Kg6PfBNPbGwzmlr4cQM73ohDYBzPh5qXl0Q+wg/W5r1a8BOUZs1YZpsT
	pb67q+rZcfOTq6oEHSgnbmBwdfS7JWVMo6DspgbMfRQCz3KxiB5jYIR/AzE1ngKFcbULqMWvWQJ
	iox3TEz8gL4F0p3EsYPsfsB/FzBM2v4DS5fIlwq6ubCrDcRpVOzpUOpt+IfGHMA//B3NKjVfh0Z
	gQ3Jih4dpAUKLtcP1ujt4Wjfm+KQX62+k4UyS7ReUk2SPJMHE8GX8gXiCaG5EwY762pLyeLtlZM
	y/DmRqqgbzLR36m9SGKTjtsAJ18zuppv7mJaeKIFxmbsyagQHfk60iKGGk0THThen0C7yhVhW/w
	71j/iUyPmWbhvevm840JPfXeQU0HZigxkSnw==
X-Received: by 2002:a17:902:f650:b0:2b0:65e8:4041 with SMTP id d9443c01a7336-2b0cdcb73e2mr21795885ad.36.1774606125285;
        Fri, 27 Mar 2026 03:08:45 -0700 (PDT)
X-Received: by 2002:a17:902:f650:b0:2b0:65e8:4041 with SMTP id d9443c01a7336-2b0cdcb73e2mr21794805ad.36.1774606124738;
        Fri, 27 Mar 2026 03:08:44 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc786b7fsm74465675ad.20.2026.03.27.03.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 03:08:44 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 15:38:17 +0530
Subject: [PATCH v7 4/5] arm64: dts: qcom: x1-crd: Add Embedded controller
 node
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-add-driver-for-ec-v7-4-7684c915e42c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774606096; l=1504;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=pXx3AWCW1rDtKny9OmTAQa5CSZy7BRS7KSH0ZkBzrwE=;
 b=Fgof54/yHZmx9D9yhtZ8gNlARnkAkDOMYZ0K7Xn9LVlywkbmqZO2RpZIW2JpXwz6ZZT8Fcdnu
 5B1ogQt6MyEA2N9bMsC3KbiGn9ZRUUZyO0ohwVfNav07fssLsFav5ul
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-GUID: Mf026pmHOGqt_sjwN0HTrthOyWb7I46t
X-Authority-Analysis: v=2.4 cv=bopBxUai c=1 sm=1 tr=0 ts=69c6572e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=gaXMZf0GDK_To7W6ZIUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: Mf026pmHOGqt_sjwN0HTrthOyWb7I46t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NCBTYWx0ZWRfXyTS+e73RlfNy
 7DISo3IGPmOZ2BdBMeV02glzKRT8/xNdrKGOeBtZTu9p57QMTfA2MuljioR0TOi62b+SqlsOf1t
 o8Vaf/OzKy0YB+Wk9BEwIaysTJB0akhAZAWcTV5PGOTc6ut5/7lB6BfZNttInWsofQqpdZU2jaS
 Vy3SocbahvsX1zdCe6DmusYaj6yNnrVTWiUl+rjFzFmw9iEP9MlIfSUSqLAYwY0YHgqMJG+lEn3
 lqVLXTeDOUmJls1fRqcNIm1Tw65gSSRcB2JkGwdVBw8Evcx11UJ+Ke12Qx1JIqIEGvQyjYzYnwb
 stD6GLaGxXxqwN1LBhHSD0U4KVvZpBygTlhFUUojsozM+7w7wxJ0G6qL/kEoqRFZSouMakXTkev
 UZeaFKJzWmQB13IcFqG+yF1kOFDTIGHsh5IiyOv8ca7hYTZFROr+/oVEVn65Q6Nvv/fAoN6ijCL
 g9e2HOeTvCvbzfrGVKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270074

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Add embedded controller node for Hamoa/Purwa CRDs which adds fan control,
temperature sensors, access to EC internal state changes and suspend
entry/exit notifications to the EC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index 485dcd946757..1184169f49cc 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -1074,6 +1074,16 @@ eusb6_repeater: redriver@4f {
 
 		#phy-cells = <0>;
 	};
+
+	embedded-controller@76 {
+		compatible = "qcom,hamoa-crd-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &i2c7 {
@@ -1517,6 +1527,12 @@ &tlmm {
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

