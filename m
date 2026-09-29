Received: from mail-4396.protonmail.ch (mail-4396.protonmail.ch [185.70.43.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51ED4563FCF;
	Tue, 29 Sep 2026 19:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790710192; cv=none; b=WVvISWAiWW0N11NDou4K75BzfeBUAlhZ8IuVXFKYli4p6RHCbmIMCz66c19aqZEho4VLdazC5a/5dP09wy1dIgmnjME7IesgMwJvk1cO4RCYx1MrtR7Wck27v25+s6NlF2+rHhTH+TSnrIcqsCymhWkKdGsnFjGKmKXbInLp0FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790710192; c=relaxed/simple;
	bh=QLHPXGnyW0YJfr5p9mWujy7JUre9E5Q4+Id3qD6/5dg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GbIYVuY7ZIAbezSgzNeCDv7SRY2sf2D6DNZvkfw6pVzuYG2/Yro/bhJ2a0Lazri8T/H6h0IxcyOQQLLBIzyQoRk/6njzC+mkLb2Nt7a16DlgPAACdmRUnq+F0Uc2k2X2RYbfu5+J0lTWOTwO3tPTyPReR0sIkisjo4txoCQryDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ironrobin.net; spf=pass smtp.mailfrom=ironrobin.net; dkim=pass (2048-bit key) header.d=ironrobin.net header.i=@ironrobin.net header.b=YCIGnWly; arc=none smtp.client-ip=185.70.43.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ironrobin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ironrobin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ironrobin.net header.i=@ironrobin.net header.b="YCIGnWly"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ironrobin.net;
	s=protonmail3; t=1790710184; x=1790969384;
	bh=ymTjs/zUV0M33JdBWsgsfL2uizg3ZGZsejyQCjKyuEA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=YCIGnWlymmEMJaqvg3c8P+GR3igt+mUdAt9MPTaotoyqBRorT0PhLQf+UMqEAIzte
	 D1DFNIUU1LblU4GKclxY3b+8LV8K0UFJ1ge1O02MtUmgfj4FoCombsfIRVMatJsdFm
	 U6NL1ICclTnaiijLlxud3kan3/XGAn2Oy92wszR7IPcMx88SPstRQW5Bt0yz3PV1A+
	 1cWEEE5H2ybSaC2v8ujNDxRtYfi4gCEpfUA9VqOXjDlkVPkrTttxksHDfnHXflw3f6
	 UUoNIL8AI6XNNJpRhD8Hl53iKR3gNyIjufB+SoCbbLaqhoOKbE4unoP46gJeYLp6Se
	 jxDskq8OQKgbw==
Date: Tue, 29 Sep 2026 19:29:40 +0000
To: Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
From: Alex Robinson <alex@ironrobin.net>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Steev Klimaszewski <threeway@gmail.com>, platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] dt-bindings: embedded-controller: Add Lenovo ThinkPad X13s EC
Message-ID: <20260929192908.16507-2-alex@ironrobin.net>
In-Reply-To: <20260929192908.16507-1-alex@ironrobin.net>
References: <20260929192908.16507-1-alex@ironrobin.net>
Feedback-ID: 54785507:user:proton
X-Pm-Message-ID: 579cb41f6884ef9873014fce3dce0500ba598368
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The ThinkPad X13s EC uses a command transport similar to the T14s EC,
but has different keyboard-backlight, event and power-management
interfaces.

Add a separate binding to describe the X13s EC.

Assisted-by: LLM
Signed-off-by: Alex Robinson <alex@ironrobin.net>

---
diff --git a/Documentation/devicetree/bindings/embedded-controller/lenovo,t=
hinkpad-x13s-ec.yaml b/Documentation/devicetree/bindings/embedded-controlle=
r/lenovo,thinkpad-x13s-ec.yaml
new file mode 100644
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad=
-x13s-ec.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/lenovo,thinkpad-x13=
s-ec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lenovo ThinkPad X13s Embedded Controller
+
+maintainers:
+  - Alex Robinson <alex@ironrobin.net>
+
+description:
+  The Lenovo ThinkPad X13s has an I2C-connected embedded controller (EC)
+  providing keyboard backlight control and event notifications. In additio=
n
+  to its event interrupt, the EC has a separate host-controlled power-stat=
e
+  input used during transitions between normal operation and low power.
+
+properties:
+  compatible:
+    const: lenovo,thinkpad-x13s-ec
+
+  reg:
+    const: 0x28
+
+  interrupts:
+    maxItems: 1
+
+  power-state-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the EC power-state input, driven by the host.
+      The signal is high during normal operation and low in the low-power
+      state. It is used together with I2C power-state commands, rather tha=
n
+      as a power-supply enable or reset signal. The GPIO is active high.
+
+  wakeup-source: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-state-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        embedded-controller@28 {
+            compatible =3D "lenovo,thinkpad-x13s-ec";
+            reg =3D <0x28>;
+            interrupts-extended =3D <&gpio 1 IRQ_TYPE_EDGE_FALLING>;
+            power-state-gpios =3D <&gpio 2 GPIO_ACTIVE_HIGH>;
+            pinctrl-0 =3D <&ec_int_n>, <&ec_power_state>;
+            pinctrl-names =3D "default";
+            wakeup-source;
+        };
+    };
+...

