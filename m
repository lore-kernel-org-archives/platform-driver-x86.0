Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4F93BFAD4;
	Sat,  1 Aug 2026 18:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785608591; cv=none; b=ArVTQoFRI37nghl3YIpIWwwtkTXOXHc+wIzW2paFZ79TCo6GSJQv8bZRwl5Z077wB6hxcWnxF9JmeEC3/qHEbsNRiHC6TX8caZ/asn1/3RoIk3SZfzpcvk26mnYojjdlzCmSPpcI8Pbmad8sL0hIwNemw+wnWGxB59Ho9bIZ9SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785608591; c=relaxed/simple;
	bh=dL5Q69CPD596Efx34PNz+rjSwkCxxOF7QmYkZsJrnOM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C+U07l/msdNvfOfILZsjxSR/frcC9JCj1lFGOFcXd4jaJ0/5Ft67nM5VY0/S2m2eksRd0sGUsCTi509FQdwwG2H0n+cYclg0ENtko51DhPfQVXxHxckMOVhmYFPJNwLowN7p2PbvZmzRO6aoWmfBWpgxZcAsokpZmkeUk0SSovc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=szvPY0oS; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="szvPY0oS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail2; t=1785608576; x=1785867776;
	bh=KG7x2Dk97FBBVM4aKLaW3xGgq8PQxJLw89qRnYSWb60=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=szvPY0oSPCsZeVfxEzz4VSrHChbsBKYeqzgZsSO0PlxBfwsZ7xp0IFPWruLPpj4cR
	 Yx/Q3JKJtEd8ytDIqBDRAZnbca05D1V1FP3Vo/a1RI0g5G1rvWUhlcqdh7E8uEDy8T
	 u0/iUFL7BjwJTvlMUDTqGd2jpSun2zHxjiYX22XCkTKFunae0IVzV1maJlNwHlIDR3
	 Mj4FVTh6xJ1+gzj9Heu6EvdKklFzvso7Aj2QwW9O6MNilqHjlngwCqu3N+8y8PKryS
	 zKSwKtPBwa2sJwj5um8A5gI9yLwUR9a2/V5b2hIP+33KvNaO/z1/i2AIBbIHup/3gh
	 xOFQWadQvjslw==
X-Pm-Submission-Id: 4hCBBQ0JtCz2Sd4y
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Date: Sat, 01 Aug 2026 20:22:35 +0200
Subject: [PATCH v3 1/3] dt-bindings: platform: introduce EC for Dell XPS 13
 9345
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-dell-xps-9345-ec-v3-1-9f4bdb5a5dad@vinarskis.com>
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
 Stephan Gerhold <stephan.gerhold@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4564; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=dL5Q69CPD596Efx34PNz+rjSwkCxxOF7QmYkZsJrnOM=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDFl5llXCGhk8l4w/uMfvvjHhlJ6Lfbqhu7dS8Bvxu8IzK
 4JuVvZ1lLIwiHExyIopsnT/+ZrWtWjuWobrGt9g5rAygQxh4OIUgInclGX4pzvP2K0lI+abacKP
 ZNV57ys/enxbcX3yfn4pfTUhIf97/xgZ5qgZbt7VF8N8IcHt1K/NExZWmEzfpBklHzu/bQpjaLk
 rMwA=
X-Developer-Key: i=alex@vinarskis.com; a=openpgp;
 fpr=8E21FAE2D2967BB123303E8C684FD4BA28133815

Add bindings for Embedded Controller (EC) in Dell XPS 13 9345 (platform
codename 'tributo'). It may be partially or fully compatible with EC
found in Snapdragon-based Dell Latitude, Inspiron ('thena').

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
---
 .../embedded-controller/dell,xps13-9345-ec.yaml    | 91 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 96 insertions(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/dell,xps13-9345-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/dell,xps13-9345-ec.yaml
new file mode 100644
index 000000000000..3485117b505c
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/dell,xps13-9345-ec.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/dell,xps13-9345-ec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dell XPS 13 9345 Embedded Controller
+
+maintainers:
+  - Aleksandrs Vinarskis <alex@vinarskis.com>
+
+description:
+  The Dell XPS 13 9345 has an Embedded Controller (EC) which handles thermal
+  and power management. It is communicating with SoC over multiple i2c busses.
+  Among other things, it handles fan speed control, thermal shutdown, peripheral
+  power supply including trackpad, touch-row, display. For these functions, it
+  requires frequently updated thermal readings from onboard thermistors.
+
+properties:
+  compatible:
+    const: dell,xps13-9345-ec
+
+  reg:
+    const: 0x3b
+
+  interrupts:
+    maxItems: 1
+
+  io-channels:
+    description:
+      ADC channels connected to the 7 onboard thermistors on PMK8550.
+      EC requires frequent thermal readings of these channels to perform
+      automated fan speed control.
+    items:
+      - description: ADC channel for sys_therm0
+      - description: ADC channel for sys_therm1
+      - description: ADC channel for sys_therm2
+      - description: ADC channel for sys_therm3
+      - description: ADC channel for sys_therm4
+      - description: ADC channel for sys_therm5
+      - description: ADC channel for sys_therm6
+
+  io-channel-names:
+    items:
+      - const: sys_therm0
+      - const: sys_therm1
+      - const: sys_therm2
+      - const: sys_therm3
+      - const: sys_therm4
+      - const: sys_therm5
+      - const: sys_therm6
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - io-channels
+  - io-channel-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <arm64/qcom/qcom-adc5-gen3.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        embedded-controller@3b {
+            compatible = "dell,xps13-9345-ec";
+            reg = <0x3b>;
+            interrupts-extended = <&tlmm 66 IRQ_TYPE_LEVEL_LOW>;
+
+            io-channels = <&pmk8550_vadc ADC5_GEN3_AMUX3_GPIO_100K_PU(1)>,
+                          <&pmk8550_vadc ADC5_GEN3_AMUX4_GPIO_100K_PU(1)>,
+                          <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>,
+                          <&pmk8550_vadc ADC5_GEN3_AMUX2_THM_100K_PU(1)>,
+                          <&pmk8550_vadc ADC5_GEN3_AMUX3_THM_100K_PU(1)>,
+                          <&pmk8550_vadc ADC5_GEN3_AMUX4_THM_100K_PU(1)>,
+                          <&pmk8550_vadc ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
+            io-channel-names = "sys_therm0",
+                               "sys_therm1",
+                               "sys_therm2",
+                               "sys_therm3",
+                               "sys_therm4",
+                               "sys_therm5",
+                               "sys_therm6";
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index fe67f7bfa44c..9b5efed4c430 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7343,6 +7343,11 @@ S:	Maintained
 F:	Documentation/ABI/testing/sysfs-class-firmware-attributes
 F:	drivers/platform/x86/dell/dell-wmi-sysman/
 
+DELL XPS EMBEDDED CONTROLLER DRIVER
+M:	Aleksandrs Vinarskis <alex@vinarskis.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/embedded-controller/dell,xps13-9345-ec.yaml
+
 DELTA AHE-50DC FAN CONTROL MODULE DRIVER
 M:	Zev Weiss <zev@bewilderbeest.net>
 L:	linux-hwmon@vger.kernel.org

-- 
2.54.0

