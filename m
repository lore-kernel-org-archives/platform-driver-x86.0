Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.107
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792972605;
	b=MCPtzEPkyU86LerTO/KdlV3TsxwxDUGSm48KYbSGyS2ahJU4HuOLBUQrrIengE3Tyu4S
	 4zdqroA+7KRaojJStt3SepcBnehF+OjpH4sZguG0yjCg2XwS6Wj6nMzpKJM3HcJm53i+P
	 jpGnUBY/wbXD8v/XSrlVDv2E1dOO4DCgBS8ZIZlqx/dEVE6khg/nVLM2Sf5EU5Ij5YBXG
	 cKmJMoozhDdD7JaOclT1rxbOPITXaQEA9wA75WpgCwreJqQNHe2U7EWUfXr4OOpCmZV3o
	 Vz1jeMxSil9qQUeUTO6asd7lL+LKWU/AQnGccRsUtGxEqafzzcRT78A0DbYDCTvLwQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792972605;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:gpg:gpg:gpg:gpg:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=xJ6FY4Qdb47uak8OWZMc6ZVyTlTQEH16GVjCHyoaP2Q=;
	b=D4Ar4Jn+BJi6nGsLH9SHfW3aAOy/u+n5aaePImkxCAB7LKkQRmWgw4t9wQ0zXzn84x/S
	 1ytRzLOVVpf5b//+BpKwDfX46rteZIc78hbMAw1OEV0QLEbWFcMJakYgFSGVhAPRSBRsD
	 KfIWbmEM1Fzs3UemTsorMpJzaSpiVwT0tFW1NsHKldMTrlBWLnOmGZ2DjZgsCKpOi0T0V
	 FzNMevj74XSns70jxQ8sr6TjRqW5T0Tv0azKgn9QU/lUPLkNGdYKahTviHxF83fMX6TCe
	 cTN0lx3wqdPcN9rtWIhOFsICdqies7rCHMo60/10pwY3fDm/GAUcNz09KdZUBus/lAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vinarskis.com;
	spf=pass smtp.mailfrom=vinarskis.com;
	dkim=pass header.d=vinarskis.com header.i=@vinarskis.com header.a=rsa-sha256 header.s=protonmail3 header.b=KREiewty;
	arc=none smtp.remote-ip=109.224.244.107
Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80ED4606A33F;
	Sun, 25 Oct 2026 23:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80ED4606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vinarskis.com header.i=@vinarskis.com header.a=rsa-sha256 header.s=protonmail3 header.b=KREiewty
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail3; t=1792972602; x=1793231802;
	bh=xJ6FY4Qdb47uak8OWZMc6ZVyTlTQEH16GVjCHyoaP2Q=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=KREiewtyb3yU1FfB9LaBFEoi72Ov/e7Vf1Jfpn6Lrp6LGz4P2KN6/QqKtOhYq5stj
	 KT/RSCkydGgcTs3ZYo2C6iVgoWFfIOGdLOsQMs2CIrLNN8xys2vxjCbhxDsw+XE/5s
	 y/9me3WeEBPuRI/WEE60M07Ehd87KoT4aWMw+J30ouvzHLuxhUH5VQNPe5dY/KfAbM
	 /aDpjM58mueojmW9v0vIwFBnpRaYCVy9GEtq2kGfaIA2bD316qY16HHsdcehA3nrXc
	 AyV5pJfJfVR6BCADPjbxzE2tM6R6z1Z4c0OCtiTn9mjvgvjN9tslSneTO5CYDdQttj
	 PLd0PxeliTUSA==
X-Pm-Submission-Id: 4jCYZH5TL3z1DFDy
gpg: Signature made Mon 26 Oct 2026 12:55:32 AM CET
gpg: using EDDSA key 8BFCF5668AA29DAD00D728F6EDAE71A20F500310
gpg: Good signature from "Aleksandrs Vinarskis <alex@vinarskis.com>"
 [ultimate]
gpg: aka "Aleksandrs Vinarskis <alex.vinarskis@gmail.com>" [ultimate]
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Date: Mon, 26 Oct 2026 00:56:25 +0100
Subject: [PATCH v7 3/3] arm64: dts: qcom: x1e80100-dell-xps13-9345:
 introduce EC
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-dell-xps-9345-ec-v7-3-828ce301b839@vinarskis.com>
References: <20261026-dell-xps-9345-ec-v7-0-828ce301b839@vinarskis.com>
In-Reply-To: <20261026-dell-xps-9345-ec-v7-0-828ce301b839@vinarskis.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>
Cc: Liviu Nicoara <lnicoara@thinkoid.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Tobias Heider <tobias.heider@canonical.com>, Val Packett <val@packett.cool>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>, 
 linux-hardening@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2697; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=TjL8tqeyObvnnmH2fSvubcRlGgOdAfNbx21FJciGlxM=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDFn3phvoiSy73cX7d+/trGtvpz/5/TrXaa0TS+v6aN2Oh
 0t9N3y/2VHKwiDGxSArpsjS/edrWteiuWsZrmt8g5nDygQyhIGLUwAmwqDH8E9pre9hZqkflwK7
 qxRuyDavOnc6aarK60J1iRB3BtbL0wwYGRZ/s3r91D1uy9TOS8XB98M35m+0r3e4UG2b8+B9rsJ
 DF2YA
X-Developer-Key: i=alex@vinarskis.com; a=openpgp;
 fpr=8E21FAE2D2967BB123303E8C684FD4BA28133815

Describe embedded controller, its interrupt and required thermal zones.
Add user-friendly labels for know thermal zones.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
---
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     | 65 +++++++++++++++++++++-
 1 file changed, 63 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index f48e6bc35006..3f0c17c845b3 100644
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
+		io-channels = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>,
+			      <&pmk8550_vadc ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>,
+			      <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>,
+			      <&pmk8550_vadc ADC5_GEN3_AMUX2_THM_100K_PU(1)>,
+			      <&pmk8550_vadc ADC5_GEN3_AMUX3_THM_100K_PU(1)>,
+			      <&pmk8550_vadc ADC5_GEN3_AMUX4_THM_100K_PU(1)>,
+			      <&pmk8550_vadc ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
+		io-channel-names = "sys_therm1",
+				   "sys_therm2",
+				   "sys_therm3",
+				   "sys_therm4",
+				   "sys_therm5",
+				   "sys_therm6",
+				   "sys_therm7";
+	};
 };
 
 &i2c7 {
@@ -1025,6 +1049,37 @@ rtmr0_1p8_reg_en: rtmr0-1p8-reg-en-state {
 	};
 };
 
+&pmk8550_vadc {
+	channel@144 {
+		label = "vph_pwr_therm";
+	};
+
+	channel@145 {
+		label = "usb_charger_right_therm";
+	};
+
+	channel@146 {
+		label = "ssd_conn_therm";
+	};
+
+	channel@147 {
+		label = "vreg_rtmr0_1p8_therm";
+	};
+
+	channel@148 {
+		label = "keyboard_therm";
+	};
+
+	channel@14a {
+		label = "lpddr5_therm";
+	};
+
+	/* Between Left USB charging controller and SSD connector */
+	channel@14b {
+		label = "sys_therm2";
+	};
+};
+
 &qupv3_0 {
 	status = "okay";
 };
@@ -1103,6 +1158,12 @@ cam_indicator_en: cam-indicator-en-state {
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

