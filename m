Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCDE38F651;
	Sat, 26 Sep 2026 19:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790452504; cv=none; b=Nyk7uGdiTXtLwL6lbCSHKEs3MQvcSIqyOSeqihHSgxFhqITy3K8f+lJbfDNulGq0AifWQLaRv7nS3NAb/Gesxvyhzpc65xq7gwu5EHnOgS5+Msjx0SnQfBrLZTrVh8rRwF8ObGYtIMdPWV6iSS74hpyeM/Or74NMK5plJiakkIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790452504; c=relaxed/simple;
	bh=oHjgKyWVc3myOgWQuYaErGagqd179GMhrTKxj/1ya1k=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HqMTqKoQ6DFT4DvcJHhYEbOB/djZ8/lx29Qcx3ybgpdq6SEx6MlsPKP3FUTQd4zTcDbHZvLQCiQWASsn/i1DQVpClftiFQDI7eFivcxKCldkpOIX4Qssi0UjtFEoLZnWZiF/FfTUxOPEzxi1x52PKxtQU+Zm7FIZJtLJKkY3aDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ironrobin.net; spf=pass smtp.mailfrom=ironrobin.net; dkim=pass (2048-bit key) header.d=ironrobin.net header.i=@ironrobin.net header.b=QXR51JS+; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ironrobin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ironrobin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ironrobin.net header.i=@ironrobin.net header.b="QXR51JS+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ironrobin.net;
	s=protonmail3; t=1790452484; x=1790711684;
	bh=gnxEzuWvdTQthETEvJeX8qiBwt1jzgNiFgc7PfOVSRM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=QXR51JS+oSnyp47c6LUGBXYpcY4J0qA4bbf2NLU+0PHyVTMuSPMmYigQSBTUMwYKo
	 lMVaAbeGz45BuzQJmtu9InG74NZwe/18GWkrVLg6wKjo6kJB2VPs1xMYRul0EviK3/
	 aaAPxPhTwk0xOnBfKDzLswKENbxKj2LV4omlJOBuZ5auU/wdsM2NgcSON4540iPggf
	 l6M3DgbKmSMvupeIXLYqrmbmp92VvdsitGMrhSC2JnbDh9pRtt6JiO3hNYIU1oIhVL
	 m8ViH0/QwI3KnibDiXljCISHOsorX7w3ojsvIj5+PIxZAloyAlG/R4GKaRSnO41cYl
	 tR4aSOyaWuQhA==
Date: Sat, 26 Sep 2026 19:54:38 +0000
To: Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
From: Clover <alex@ironrobin.net>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Steev Klimaszewski <threeway@gmail.com>, platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: embedded-controller: Add Lenovo ThinkPad X13s EC
Message-ID: <20260926195415.5995-2-alex@ironrobin.net>
In-Reply-To: <20260926195415.5995-1-alex@ironrobin.net>
References: <20260926195415.5995-1-alex@ironrobin.net>
Feedback-ID: 54785507:user:proton
X-Pm-Message-ID: dcdd8f7eb9a0694f31923b73dcf46193f7c385bf
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add a standalone binding for the embedded controller in the Lenovo
ThinkPad X13s. Although its I2C command transport resembles that of the
T14s EC, its keyboard-backlight, event and power-management interfaces
differ.

Describe the event interrupt and the separate host-controlled power-state
signal, which is high during normal operation and low in the low-power
state. Require this GPIO and allow wakeup-source to describe wake
capability.

Assisted-by: LLM
Signed-off-by: Clover <alex@ironrobin.net>

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
+  - Clover <alex@ironrobin.net>
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

