Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6627D3D3CF2
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 11:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774438897; cv=none; b=skdkU2N//bZleoAlhvAdHeQmJgdAt5dJcDdn5JNAGWTt81+I6sRz1zQRsUHzhr+kivSXCG86AUtSszX9ySI4No4oycoWSaojKAlE7gj+roENEloGwEV+g0ljXgqqjI6AeP7c5wVNVFqRXPxLUDey8HvCzBR7NDmG8UBAq7/21hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774438897; c=relaxed/simple;
	bh=RvDw1WkLEnEmhvLbM2Vw+wuFrP8QpNfDVUGmlhDKG+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SfgeHbVm+WgAnZLCD8zNhFA80hsyqSZ5Vk2O0Pe9fugKQmJdcCmSnTR6z7iuM3KAJ/N1mRxu+KZYgOGaxh7O0iTwBDiyL2rQOz/k6xeIE4LZ33OM2bACqaDE5eJCwfXBRjq/NnC59P9Ez8OKIBfF+o8Gr8442PbEMhok712OWu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dJgV/Poj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NyVnJ+si; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dJgV/Poj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NyVnJ+si"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBG7Dj3091038
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 11:41:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zHGJ73QrwY/BmnqceQXRceCf5lqD4HFme4sfvsGZKh0=; b=dJgV/PojUI9SMTpY
	QsHR17NMmBv+DQwuT6hKo9kJTV6g6nSvmGJqu+nExK6kc9boTuyRvDdUtdhowfDk
	3b7xqDk6LdYxlu9WT8GycNv64CKUGGTxJ8z5CdPARl1xVYaFbtgB6z+09qS23FH/
	lO+PowQTNyrwpTnhP/Xeyoso7/+S+Oq1QO8Z/W+J526HFK5Asas7MBurfAbM2AFU
	Ug1Gmz4gmlYbdT0saaE+w33bCWCA4bgx7VM5UwmwW3XqxYHcDgXgonhxrZZEzf86
	IG6m1ydkrJk4pizziDzJtXsutvuVDtbLyqzMK2SvpcF746fJ1cmtmkYPN/8Ywo/x
	Y7zfKg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dmprbwg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 11:41:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aeb90532f6so39449565ad.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 04:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774438895; x=1775043695; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zHGJ73QrwY/BmnqceQXRceCf5lqD4HFme4sfvsGZKh0=;
        b=NyVnJ+siBgw+isRNisTWyOJRw6VKDncAX1ZJaAANZm8CkkUWoaA8uag1L/KSnEbWig
         c+jgdWkh9sljlWXvaBZy1J+Mke+HVYZZdd8AoGwgLQCUnyY4vTF3kEVTeaH3LOVVQ2ZB
         vn0DdakkU7LVbOaz4D4XK8pjtV7SghcfVqpTDqzjL8jd9VAzqilbyN86DzZeIsR7DfdO
         aVN7sPayOehBh6xbnYFdErYUjY9Q5SB7PNvbktwrMV4Q4xuaenQdKjZieub8t9ENwX28
         TrMf+c8Jpqxz2xBVHBZbHWJ82b/+Q1KebySovjQAOhMNBzhb8b7c64m6EqAk7J1Wzg0g
         KV9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438895; x=1775043695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zHGJ73QrwY/BmnqceQXRceCf5lqD4HFme4sfvsGZKh0=;
        b=IXJxOG8FBiFqWYrWZ9TFFrkntP6q+FGRGNdca6h/ln85GbBF0+BMWn0W3K+NxRwVwt
         ZGPqwtD7NU0EGViXhGsOKmHdvMVuBxNaOtkrEMJLrDKI6op3lWI0OXQjuw4hA+GT2rLI
         PC+8lBz0jSyPFgfPlsOV4O2YkDDH7N+nbtqx0hwRN5MlyCTDAnl05pwjbD0OVGy6gyQe
         hW5ljy6+BUtCQ3+n2CCLL9iBaMCQ6jYwbU2P1w25oX27NXCm8Bg2U8IXkSZn59ZiEm8n
         hrmJX3aVM5NKRSJuBc9LqwKW2HCatkuSSJFJJS8bF3o45pdZ03qU20FyFH2Eh7ORc7yE
         gQvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXflFxE+nB6srWdNh5IFLN3rdCELEFDzF5vKpGWjJfsmuFTk2Hp/IfeG4rtXWCMjzZIF24J6tt+rg6YfU+E0fkBgcb9@vger.kernel.org
X-Gm-Message-State: AOJu0YzbUH3XSTU0pcvTiqWBQFlH3+NeizUm5RvfyiWKWPVUgkR2Plv/
	GgQh6dYgcSAN28OcanUymshGOseST8wYPWt03Ndq8ADSmlY+5ydcwT3ooIr6UHQs3QKQOaO9AO4
	FSFyW2hF2JI/Xgoqbym3DKElqabCNCph9wzOmmGgeoRf2U2E8wG/vqXmdzOTbLb54oC4vjABeGr
	2l
X-Gm-Gg: ATEYQzzo+ylI7gTt62dS064qdWkIUKt/ARUL87QgYyFPCj0AoaF7/X4UoAab4MxNngy
	iGFhRAs/8+1EIxyx3/UlJUuQhd2W/6IZJDE2siK8AvXv/Maf7PD1gjRRbWO8SBY7fVVy/n6BVUi
	oUAfzJ26hSTQDlwW9DxVjRBgdKqtI5rxsb3QJtXlk+HvL6foEVXNnCzRXfqjkUCO4sRG5DR/CaO
	dkqjukolLokUnedrDMIIqManTWk20p2QyJTyIKIT8KP7BPGRyCtPZIEICMadIc651iJxuzpxs1t
	DN9DTFr6DLw321db/Zb00EbO0vQ+aXaJ8DJJOzSsrkpRIrPqrOk/4pCVN2lGut70GCCUSrV+06N
	Gi4A4kofJsGWyJskiQd7DhBwe9lIZmdYBRIcGE9OeD9lxyjHnbgOji8x1dxj9gElr+MTfQIwPrx
	bvNFHjFRmvOI16FzYdIhMCjHFZNwwh3rbe/w==
X-Received: by 2002:a17:903:2a90:b0:2b0:58a8:5fc0 with SMTP id d9443c01a7336-2b0b0b236b5mr34948685ad.44.1774438895034;
        Wed, 25 Mar 2026 04:41:35 -0700 (PDT)
X-Received: by 2002:a17:903:2a90:b0:2b0:58a8:5fc0 with SMTP id d9443c01a7336-2b0b0b236b5mr34948195ad.44.1774438894447;
        Wed, 25 Mar 2026 04:41:34 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0ae360d4bsm38152015ad.16.2026.03.25.04.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:41:34 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 17:09:55 +0530
Subject: [PATCH v6 5/5] arm64: dts: qcom: hamoa-iot-evk: Add Embedded
 controller node
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-add-driver-for-ec-v6-5-a8e888d09f0f@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774438862; l=1511;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=IdPH1Imvkn25efPE2wUno8oRCpw1N9VjuYi71HEmcTY=;
 b=KYgr0Mxa3JiFHajJjIIY/l+uMwSuRIG1RNhjMhDApPHJppBLiBhQ/uYGUUyj864mqoKzaLeaf
 busP5MEU4aeB0sXot4UkRm65nRWltUIeuRPQEzoPx1QVqvaqKapOH57
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4MyBTYWx0ZWRfX3P2SJhM+KQ49
 qs1c/kuHJxZFeyK/Cf6+yk1VN7g4fRc+IP/m2ra/P50FYb7MTEvAmXcnGemdWd2E7Y+3vdyU+VS
 F0h2foUEQhuVNkFEZRJwqFDBO5xwlR/h/wQEFhFgic9uYy8iWjw0GR+DHNt0CJVK40Z4qD1A+NT
 YKjl0sPp484cWw9zat+iGGuqUz09/LWFLiFMMCLggBAnG/SD26kfde4H3EaAdtsQpi8zR0QjT/F
 Gamosuf3NeygBJh4iFNoMDER++8CNnDTve6u3T6IzFyGKD5WfpMl2GqU6a2UanNyr/l3hjWGFfM
 2Jnv923MBbRr/ISW3OEjr7taE/33ghHqdyMl3WYOVV2dHFyt+b8+/4Aq4GydXVsWpbjJ6Gf3BQ0
 lOkRDwNjAT2x836KZ/oXe2qCVgReqJ9NMeI+cDNN1enpvMLphJrnIlSy78pwJQZy5t3gcSAjCUV
 scIwC/nszWdYSgVLUCw==
X-Proofpoint-GUID: kCsfqC6tJrFMmC1y7EzqbcE9cx8Aswip
X-Proofpoint-ORIG-GUID: kCsfqC6tJrFMmC1y7EzqbcE9cx8Aswip
X-Authority-Analysis: v=2.4 cv=O7w0fR9W c=1 sm=1 tr=0 ts=69c3c9ef cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=um1wo07bdbQtbc5qrgwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250083

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Add embedded controller node for Hamoa IOT EVK boards which adds fan
control, temperature sensors, access to EC internal state changes and
suspend entry/exit notifications to the EC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

