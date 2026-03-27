Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C25D3AA50F
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Mar 2026 10:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774606133; cv=none; b=KW6chiFippmaH6O7kAKD83/iuCn866SNp2zQTe8EfZjvtL1n8kOW0X3fiA0kjrNTFDSx14VNaTlbw5jTbGiWvisAIJHHl9Hj3zWYWxOBUvKbgEfCZ5kiSgns9K/GMMxF2DxwQdOPPxYsHtopXSMEzRo99eyK58pYDUH4aLSOEmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774606133; c=relaxed/simple;
	bh=+E4tZfMlel36uwMhdXbJ+b8CyJSQUpcuObNpX2cZjj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lnhTSB7yzqAkDjESv4zNRA382eIFaV89OesYbmGuque5Ay8ZcUIq7UEdTwbjVHUFTsZw81YZsm3XfmcuD4esHn56eYg+sW6qtex8CAtxkJuo3HK7MyPhvV0xVyapsalEm3vMIilumGNTc8uHF/T7E11VQ66FKffCqFyjnbhGlF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bzGjBRzP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kAMOkV0g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bzGjBRzP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kAMOkV0g"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6wEjF1710545
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Mar 2026 10:08:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XReiQn22kMCzGHeyxP3PcAro8SFN43+wajCGNcXyMl8=; b=bzGjBRzPKq0WeUgR
	4coIioMmDv/v0MxlXMxV0cWX9PJnL3zwpvBOE8Ax7zc6qu2FyDNOFxeX2AUqjgbK
	+7+HPB1TtbBn7OpAzP7jKJyAMNTNEtGukEDpe4fb5TyAHlKXY9lweoZUDne/E3Mh
	0wX81ZZDCU9jyZ0VeQodPJL749tf+OuwMaCdRecumRoA/gvX9TkylqKcY9HEpbUl
	FMVBSse5uNRw6BtQLiRWdzwC0J9ZZGcokVgoYKcEKn0o/H92lB6Z+wlB7N8b3XY0
	pdor+ZZO4uBJX4qxHNqth8wUcN8BR4w7SfZ87CJ7Nw+Y5MDbPjaOB+dCNCXZtW7O
	2znv/g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bxvjh59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Mar 2026 10:08:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2adef9d486bso39027475ad.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 Mar 2026 03:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774606131; x=1775210931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XReiQn22kMCzGHeyxP3PcAro8SFN43+wajCGNcXyMl8=;
        b=kAMOkV0gTlrmNfGnJl8u1fueNFLrxV7Znh6twiWeYMrc1bffgj7/rBAzzQr2iZ+T07
         yHXRcVNnDR4HTszjRs+SFyzKAaVFXqqqgoXGbBdjacE44A0NteGpjFQuqe5gKkeRp+nL
         zIAUyAB20CTxr1FGkNrFRnJUoU0h38MMafBkK7bupI0hJqxRxJiq1fxMGIgSm3t4Q7l3
         4bdYa9uNrFeWl9napLYM2XMVygF+6HcehHilo8Fva2kcb7A3k4A/qQ/H85Z8MDRFxqey
         DPCMIgG/lljMBcvWntq7rU48ygVFnqBhHC0OVQasXn1xNtFT1CPQiif0csJxTZuuAqLv
         UFwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774606131; x=1775210931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XReiQn22kMCzGHeyxP3PcAro8SFN43+wajCGNcXyMl8=;
        b=Z0kP3cc1wQLxephUQZcN9Em9KDan/LxruuTAkgFlH2LkyHtg59dzPFgerRDkNLZpcq
         s2viUfMCnj9Hb+Tb2rQBq/5xI8fSnnY1R5a6V7xOaAZf+2WMlLMBNjvwciGWhDrUx1HE
         YzhY9GKhzPyszhFEEOm5S6QbRSLO1lmoPNerMVa7gLUJBSY8hhF7xVv2C0ILOaQIXAwh
         FoCQmUWuDs2TPN4FdjfZwBl9x9rwulsnWBQv2eO1nB0W8LlJdcSVClyxGr43rErsdmtS
         TrMLwJn1nyP73Gqi3pzfrnPamXh2wEWitC/AOVeLmn3njGMAzokYSdcxJOS9Pfb6V/Ha
         WVsA==
X-Forwarded-Encrypted: i=1; AJvYcCW/WAt9UIF32wZLldciuJ+5HCCb2gMMtMUfro/rnViS9FkF9DekKTAP0lFS7V+kkbN4w5eH+4YbMcusy0OvP1YH0wJ/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/Mr9iF1oMdegiRKqJYrwJ3mm7GrgWESGS+YQV5s/sLVjyAs11
	S6lKNGySDrxON2OeuO6qZQW4nI29u7+XpaT9Tx+ZE1R9vn69xvphEZmrtItRT+EX9l1gR38HdcB
	/8PABmaHq7M1WCzXOeBV2CaxjYL0Zzk5LyDobOV7doQsuo3oerm4AU5bkLSHa0CkhJCqYGEax52
	ip
X-Gm-Gg: ATEYQzwsWLbTmPK1mX+CzVnecvoc2gkRg1VHbCV6PgtcmcfAPh4mKCCmmFT12XhcNbD
	y+F3dBXc6czFItN6CQRYZzu+b18v7MBRpWIC/n3EDVcL/bAoQ1n5861V9sJ2H6EJwc19b1c+6wN
	NzOVhoyBkgUccF6p8KRB8uHGjYia/DLpIPl/qBSCyPctz+LxCpSrTSVODJC7ecghGTHlCGCzZ2e
	UtiCIJ9/y3rpVvyKHKczXOy/ZWxKy9/AKNnvVyda+ORuVEQh9CU2gX6uLhHz9Vhp3cLkbBqZSyi
	U7vLw8oN39/6xdOC+bfz2LXWYDawQ9U2/lAUZv7feeijzdBFbkVuBhUJNRJWrjXo8KWfZffQNcK
	4P/xfC9wsa7BPlYcFpKoE+Fz74rxf3UC80P7hHAlALYTiqaSh58TB0yDwWG7DLGhW0cfuxSurp+
	5XlNqOYdYraoxYYVAMaJpCC8rNi+MdDGBH+A==
X-Received: by 2002:a17:903:1450:b0:2b0:5626:f75d with SMTP id d9443c01a7336-2b0cdcb7d29mr22984305ad.26.1774606130762;
        Fri, 27 Mar 2026 03:08:50 -0700 (PDT)
X-Received: by 2002:a17:903:1450:b0:2b0:5626:f75d with SMTP id d9443c01a7336-2b0cdcb7d29mr22983985ad.26.1774606130299;
        Fri, 27 Mar 2026 03:08:50 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc786b7fsm74465675ad.20.2026.03.27.03.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 03:08:49 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 15:38:18 +0530
Subject: [PATCH v7 5/5] arm64: dts: qcom: hamoa-iot-evk: Add Embedded
 controller node
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-add-driver-for-ec-v7-5-7684c915e42c@oss.qualcomm.com>
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
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774606096; l=1627;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=v3xhy4TAVQzMuukJtx0ZPXFz4/C8vTU0vk3Dukc5Tss=;
 b=Avf6Q2NxGSEHZm3OYNgznndDtNW26jckaDRb8PQjiSW0DrZKPl8yWhVikJmF+aj2DdUGI0r5f
 HNq/X0qPYKkBW9ZdVsEit65pTkYPotbzgRlRbXqqjTIz2YiXrAVwNsi
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-GUID: k2SzIMoPfNJBODeqIk8VXF5MUWHFkTce
X-Proofpoint-ORIG-GUID: k2SzIMoPfNJBODeqIk8VXF5MUWHFkTce
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NCBTYWx0ZWRfXwFVcq8IhtvkT
 lBlFatLfoyH2fUjZVaXMQLLQRQ9uEAE+nNwiSLLxGiTdO/8E7dJcbpYZ87hjK1PEPKBzIiSmZAO
 Hn7JCWSm2O4NHyl81hF+ImiAMYkjZVbG9yWxBLYuZyCuVvJw3737vutkCrn1pJZpQCycBQkoAW/
 8u2bJh8B4r63aQ8g77/khc0xliiF9czFHwguR9y7GhXZ36Po3/XqIGsNK20HVOesqUzUqP/k3fC
 4dO91lYzGmn+VFu3RvmSzLMJsN8xQ5guR/l595j/gV+NtAJgSlWjuEX9keyc5Uxb/Nzhdt8wM3x
 ovk0QNorwfGxvQH8hgWUjZkvbrbrlzPFy52KzBS6YyriRnKElodKUY/1c6RFol2pjZ0jybwxr2M
 1OX4rGgH6gQxVNma7vkIOPW5aX8oIKCriJSbibQygKnR3+uO16DPvUOnBGJ9CfB39xaZlpwn61L
 PoX846LrUeqARP9DYqA==
X-Authority-Analysis: v=2.4 cv=ToXrRTXh c=1 sm=1 tr=0 ts=69c65733 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=um1wo07bdbQtbc5qrgwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270074

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Add embedded controller node for Hamoa IOT EVK boards which adds fan
control, temperature sensors, access to EC internal state changes and
suspend entry/exit notifications to the EC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Tested-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 460f27dcd6f6..a0d2ccf931ec 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -831,6 +831,16 @@ eusb6_repeater: redriver@4f {
 		pinctrl-0 = <&eusb6_reset_n>;
 		pinctrl-names = "default";
 	};
+
+	embedded-controller@76 {
+		compatible = "qcom,hamoa-iot-evk-ec", "qcom,hamoa-crd-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &i2c7 {
@@ -1320,6 +1330,12 @@ right_tweeter: speaker@0,1 {
 };
 
 &tlmm {
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

