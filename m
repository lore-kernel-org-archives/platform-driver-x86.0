Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35B715ECF8
	for <platform-driver-x86@vger.kernel.org>; Fri,  7 Jun 2024 10:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717756369; cv=none; b=bOL8bA6bhDyMuWvoMFQwlLS6fTuKdydSalegSL1ulu02/8aJYUfZrr7PebXQ41JRK8LygVKhCNdcq+Kw4xIAARpcYRTDv3vUJr/6vUv2ez2nHvgazyiuQc+rS+FlUPQuVqSPININS1VEsutqWfqoxPTgRIxyDNq79rOoqQlhLbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717756369; c=relaxed/simple;
	bh=ohK2sslGjClxr9kCmY/gW62DMEkgvC5Tz6xsCMKB8Kw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gqLTM7oXqW/ZB22NWKLz4XFdbTKZaSI9h18Hrmi+LVSChl01ysqeIAumR+SgJJCP0xEX4AkmZV2H8bSGUIR3SVSqjGAcnR5GYSBxt3d+7rUKdpNTRL2WW+pFoaP9BC0ad3i2KUhRmgHl2Z/Pq6UY2IV7jSI8YaAWwX0D3axzA3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vwEVTxDj; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vwEVTxDj"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52bc0a9cea4so257378e87.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 07 Jun 2024 03:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717756365; x=1718361165; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o+nA/cIlT4hl2if/i6DmrZViDpHELl0xAbf5HX+dSsg=;
        b=vwEVTxDjOtNjwJGD7kcMRd/i2OZTrvoxzGUxu9cV7odLPixhjmF/p+8E+dzzX9XaDo
         WEw+cnqglM1XfG6u69nNHclhobbQLYXBy6NeZJrSl0XWLLGedx8CZOHjdZdB5yD8D/k/
         MMfWeyUq5vFEqy0Wy2JmfP4G/JjnKksToZ3Qs52TFbTCBNRpMsG/GPsUtsye1fQFWgGM
         6ro7MkbFjyva0/FBwrxBacc8eL0IJl1llH/O6z2bB9h5SpfNcLQYFUO2sTNimX7ZAZyB
         bnjLmAGDaHtKcIa2DoADJN9TSqhH1Ep9B6v5Q171aDN+Te0SaZAghrCDj9uGa1PXZz9a
         uEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717756365; x=1718361165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o+nA/cIlT4hl2if/i6DmrZViDpHELl0xAbf5HX+dSsg=;
        b=oEBy23b3WRiZdI4FGfkDh1AzB9r2WifFx0eYZdPgrFIDHIs6asRitSZiApGavvOeXr
         6vMGJ1rJ78/hDJDPP32QXsQXJ8/1rjH55W9XW4Cqa7RiGVH4k47f1dBT0067bnTI28Xt
         bonBsbqRZToiLwvIiVLMfxrxplrwHyoqbeeaYo9eQGqcRQ83PrsbfEq00e0WbfkwGJJs
         yuFUo2AeOB8r0Hx8ExwE+G8VP0/+S9ziDvW9PKAw7lVAPButmcXIDoKBgxaDoP2zdIMj
         K5Pkznn93B3kb5IFt4gHJ5UwdyEbLLIusdKSWXZGpByFMsJDguQYgUZOB+7uO45Xn5Pv
         4PjA==
X-Forwarded-Encrypted: i=1; AJvYcCVaOlyfNZPO49MX5ZCqp3sbfN/w1P5D1eIwjWP7IRiqbJ3g60djqjoE5xjwuz52l6yNl9l0x9pFPodCPBUuZ4/rcBMOZikUcHG+GWpghgoKO8dXRw==
X-Gm-Message-State: AOJu0Yxxh+VGOzHVDrdDpOjIdcdlVwdIajyShEwngMWgZ0zm9vWtQ+iA
	bR3rIzrm+KBAqQ3tYm01oeFOrXnGT0sD2ZteZRQ1i0y12U4tUuV2Po/IMEwATn8=
X-Google-Smtp-Source: AGHT+IHwMriQsM1CMt6lSUr4ex+0paISgflwuPSKyxa2InvrwFrwht9F2G2f6bxRlZR19OZ5frotLg==
X-Received: by 2002:a05:6512:252c:b0:52b:c2b8:b1d9 with SMTP id 2adb3069b0e04-52bc2b8bd19mr72709e87.26.1717756364765;
        Fri, 07 Jun 2024 03:32:44 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bb433ccdbsm483448e87.283.2024.06.07.03.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 03:32:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 07 Jun 2024 13:32:41 +0300
Subject: [PATCH v5 6/6] arm64: dts: qcom: c630: Add Embedded Controller
 node
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240607-yoga-ec-driver-v5-6-1ac91a0b4326@linaro.org>
References: <20240607-yoga-ec-driver-v5-0-1ac91a0b4326@linaro.org>
In-Reply-To: <20240607-yoga-ec-driver-v5-0-1ac91a0b4326@linaro.org>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Nikita Travkin <nikita@trvn.ru>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2519;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ve9c78TTAFS5VXzgVyLUhE7e1KCToRb1yljm5NLcL8s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmYuHHRI+9rHUj3nUv35thy/7x99PxS55VdUsZv
 SSnHxDIRyOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmLhxwAKCRCLPIo+Aiko
 1TwKCACyq1kzwkRnJ0/z1CWjVmvAKVwpj73htm8NuAtDYs7+KnRjCoh7ywTxmvYv+PbHdpXmBC+
 lx4KrHjIQzozMzb83fv/2JX2UXbEVDlMj3+f5Z33k41J3GUqcZokk1w6jytKKR4TAN90px/q8F+
 y2CQsXluHQ6KMFPnq5om0SGk5sqSvHy9F2ZNZvXsRliw7nzE4XY+fmJSwhWLElgvmxFqlB0HNVs
 u0PdTEQMVUgxrle4of0kGSBB1c+iS0XYvXG5ocbrD6PGZA8WYPWgDg8ZZfSwsVv0VdVk5PzT3iB
 IpWSTG2MbPJq/SycoaNZIpT2m06L7gbN2gGPeZtZ++uXVw5V
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

From: Bjorn Andersson <andersson@kernel.org>

The Embedded Controller in the Lenovo Yoga C630 is accessible on &i2c1
and provides battery and adapter status, as well as altmode
notifications for the second USB Type-C port.

Add a definition for the EC.

Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 8402ea2d93a7..f18050848cd8 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -370,6 +370,66 @@ zap-shader {
 &i2c1 {
 	status = "okay";
 	clock-frequency = <400000>;
+
+	embedded-controller@70 {
+		compatible = "lenovo,yoga-c630-ec";
+		reg = <0x70>;
+
+		interrupts-extended = <&tlmm 20 IRQ_TYPE_LEVEL_HIGH>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&ec_int_state>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			power-role = "dual";
+			data-role = "host";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi0_hs_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ucsi0_ss_in: endpoint {
+						remote-endpoint = <&usb_1_qmpphy_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					ucsi0_sbu: endpoint {
+					};
+				};
+			};
+		};
+
+		connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
+			power-role = "dual";
+			data-role = "host";
+
+			/*
+			 * connected to the onboard USB hub, orientation is
+			 * handled by the controller
+			 */
+		};
+	};
 };
 
 &i2c3 {
@@ -695,6 +755,13 @@ mode_pin_active: mode-pin-state {
 
 		bias-disable;
 	};
+
+	ec_int_state: ec-int-state {
+		pins = "gpio20";
+		function = "gpio";
+
+		bias-disable;
+	};
 };
 
 &uart6 {
@@ -742,6 +809,10 @@ &usb_1_dwc3 {
 	dr_mode = "host";
 };
 
+&usb_1_dwc3_hs {
+	remote-endpoint = <&ucsi0_hs_in>;
+};
+
 &usb_1_hsphy {
 	status = "okay";
 
@@ -762,6 +833,10 @@ &usb_1_qmpphy {
 	vdda-pll-supply = <&vdda_usb1_ss_core>;
 };
 
+&usb_1_qmpphy_out {
+	remote-endpoint = <&ucsi0_ss_in>;
+};
+
 &usb_2 {
 	status = "okay";
 };

-- 
2.39.2

