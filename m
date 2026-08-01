Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A46A3BBFC9
	for <platform-driver-x86@vger.kernel.org>; Sat,  1 Aug 2026 18:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785608591; cv=none; b=lragWpUpJUby6TQ+iAvu58gVSAc4F91B2xZzf3h4EQ/yjYjkvlOaLSmHZUbVZy3GCRNMuLOMBlZ5KKpPmqXvZOK/7pnwnZI+2HYrsapOE+O0+uzilOLIMEJj8Fdai9HEdTvRxuE8YXVwGygWz55RGf3LmWe/UY4shHO/zLmQyck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785608591; c=relaxed/simple;
	bh=oNBsncJky7ip5AyMa7VzaVmnAs0Z0PXWyNAfy7mhbkE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NtckA8TsO0FL1Ef1i2P0iscwkPpyaGtNWdLdrG2FzPMjoOrXrrZvIuP7b3zWXb+HNZ5gQ+cvqBQosEYkU0HUX/0m7Sb/4KW7koXNeCGMscf3Apl3xCoLYu5cbIqA0q2v7AraZmeek8Gyn6zhdtBaimeCmm4PVbCdpYz8CEapSmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=h2O2BdsF; arc=none smtp.client-ip=79.135.106.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="h2O2BdsF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail2; t=1785608581; x=1785867781;
	bh=B4SBI9qu+1fGfU735aEX4C1Gip+rRdABa/qY27g/wiM=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=h2O2BdsFiTnTHbtiiv0w96xUWj3BONsUn8cmGPexEyRYhzIBgt5B4ahrwnwvHK9Lv
	 9VT2hc5119kGcPwFzz4g7K0A2reWNRLdLRsommDy/yRWSs45qg0Dee2GYhf1rkvlx2
	 9YfU+JlVCyS4L1Ai32MaYPOBO7XfdjLRp8SLF7q7IlNG0yLSs24w5Lfb5dWE6cFXht
	 zwfcFl6OwDpSL6z46zYnli4JoDKi27yilyjfwVoKnvqHSyqWleViuF3JusN/Q7dVrp
	 8nY0l3nvZm4jRC+6YSsIAwta3XCOebs+7TIouM0mXuabmCn4zYbQr4LwLHB7SBWXPc
	 AOqMTvwkPZQ0g==
X-Pm-Submission-Id: 4hCBBT3Jx9z2Sd4y
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Date: Sat, 01 Aug 2026 20:22:37 +0200
Subject: [PATCH v3 3/3] arm64: dts: qcom: x1e80100-dell-xps13-9345:
 introduce EC
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-dell-xps-9345-ec-v3-3-9f4bdb5a5dad@vinarskis.com>
References: <20260801-dell-xps-9345-ec-v3-0-9f4bdb5a5dad@vinarskis.com>
In-Reply-To: <20260801-dell-xps-9345-ec-v3-0-9f4bdb5a5dad@vinarskis.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Tobias Heider <tobias.heider@canonical.com>, Val Packett <val@packett.cool>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3588; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=oNBsncJky7ip5AyMa7VzaVmnAs0Z0PXWyNAfy7mhbkE=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDFl5ltWK/5wSli9tufzpAJ/U2WdPqsOzsszF1P8s5BGcE
 3dqttCOjlIWBjEuBlkxRZbuP1/TuhbNXctwXeMbzBxWJpAhDFycAjCRW68Z/inN1390kG//32x+
 tqutErbuVXImGSylJ3ct8vGUSZxm+p7hf53LjGcLJ7eHx7Q6BMrLbqmwuXvxXeR5ltPFOcdLOJf
 GsQMA
X-Developer-Key: i=alex@vinarskis.com; a=openpgp;
 fpr=8E21FAE2D2967BB123303E8C684FD4BA28133815

Describe embedded controller, its interrupt and required thermal zones.
Add EC's reset GPIO to reserved range, as triggering it during device
operation leads to unrecoverable and unusable state.

Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
---
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     | 86 +++++++++++++++++++++-
 1 file changed, 84 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index ce7b10ea89b6..8d8d8014049b 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -759,8 +759,32 @@ retimer_ss0_con_sbu_out: endpoint {
 
 &i2c5 {
 	clock-frequency = <100000>;
-	status = "disabled";
-	/* EC @0x3b */
+	status = "okay";
+
+	embedded-controller@3b {
+		compatible = "dell,xps13-9345-ec";
+		reg = <0x3b>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+
+		io-channels = <&pmk8550_vadc ADC5_GEN3_AMUX3_GPIO_100K_PU(1)>,
+			      <&pmk8550_vadc ADC5_GEN3_AMUX4_GPIO_100K_PU(1)>,
+			      <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>,
+			      <&pmk8550_vadc ADC5_GEN3_AMUX2_THM_100K_PU(1)>,
+			      <&pmk8550_vadc ADC5_GEN3_AMUX3_THM_100K_PU(1)>,
+			      <&pmk8550_vadc ADC5_GEN3_AMUX4_THM_100K_PU(1)>,
+			      <&pmk8550_vadc ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
+		io-channel-names = "sys_therm0",
+				   "sys_therm1",
+				   "sys_therm2",
+				   "sys_therm3",
+				   "sys_therm4",
+				   "sys_therm5",
+				   "sys_therm6";
+	};
 };
 
 &i2c7 {
@@ -1025,6 +1049,57 @@ rtmr0_1p8_reg_en: rtmr0-1p8-reg-en-state {
 	};
 };
 
+&pmk8550_vadc {
+	sys_therm0: channel@14c {
+		reg = <ADC5_GEN3_AMUX3_GPIO_100K_PU(1)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "lpddr5_therm";
+	};
+
+	sys_therm1: channel@14d {
+		reg = <ADC5_GEN3_AMUX4_GPIO_100K_PU(1)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "usb_charger_left_therm";
+	};
+
+	sys_therm2: channel@144 {
+		reg = <ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "vph_pwr_therm";
+	};
+
+	sys_therm3: channel@145 {
+		reg = <ADC5_GEN3_AMUX2_THM_100K_PU(1)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "usb_charger_right_therm";
+	};
+
+	sys_therm4: channel@146 {
+		reg = <ADC5_GEN3_AMUX3_THM_100K_PU(1)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "ssd_conn_therm";
+	};
+
+	sys_therm5: channel@147 {
+		reg = <ADC5_GEN3_AMUX4_THM_100K_PU(1)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "sys_therm5";
+	};
+
+	sys_therm6: channel@148 {
+		reg = <ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "keyboard_therm";
+	};
+};
+
 &qupv3_0 {
 	status = "okay";
 };
@@ -1071,6 +1146,7 @@ &smb2360_1_eusb2_repeater {
 
 &tlmm {
 	gpio-reserved-ranges = <44 4>,  /* SPI11 (TPM) */
+			       <65 1>,  /* EC Reset, accessible but yields system unusable */
 			       <76 4>,  /* SPI19 (TZ Protected) */
 			       <238 1>; /* UFS Reset */
 
@@ -1081,6 +1157,12 @@ cam_indicator_en: cam-indicator-en-state {
 		bias-disable;
 	};
 
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	edp_bl_en: edp-bl-en-state {
 		pins = "gpio74";
 		function = "gpio";

-- 
2.54.0

