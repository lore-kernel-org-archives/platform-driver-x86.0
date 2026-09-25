Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A766B478847
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 21:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790373300; cv=none; b=q9ILXda8YrKB0i8R+5aKsj+XM+eJ8ekOKuONY+6NHaoC5lNGmpbnuUvjOwsFXHO7APUuXrM7gyrYnwbBEQJGltIok25IjxPm+QLUnfsV/biJ6cIn4tqXkRUhMiKlO8GL/V8UbPTJOp14YjYq///sBB++b9LHjmTvLsPgtqEZO30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790373300; c=relaxed/simple;
	bh=oHjgKyWVc3myOgWQuYaErGagqd179GMhrTKxj/1ya1k=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sOGzp8OwI5aAqNJBbV8r91QlMTTc4PVHjIf6jUz9G9UiQwe7VKkfCHm0w7UmhDKvhWGV67rxj68NmaKbyVBA3D/pFh+cS2rSbavBsHgd/0c2hgHF3EmcJfU64Humfrl+Dyni94i+0dY1TXBh+FsmGFl820V/mcTXv+mvliSKZvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ironrobin.net; spf=pass smtp.mailfrom=ironrobin.net; dkim=pass (2048-bit key) header.d=ironrobin.net header.i=@ironrobin.net header.b=FZwrfr3g; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ironrobin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ironrobin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ironrobin.net header.i=@ironrobin.net header.b="FZwrfr3g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ironrobin.net;
	s=protonmail3; t=1790373280; x=1790632480;
	bh=gnxEzuWvdTQthETEvJeX8qiBwt1jzgNiFgc7PfOVSRM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=FZwrfr3ghORjRSh5g/HjKtmAVG1TgTEJb4QA4fN8vHilck3pNaKmWk/mDGd/uIjCR
	 i/sQczNBufFIrVRuRbWKeoZTTXYET/9XhLnMO6Bq77OWUxCGZZVq+Awp8Q8suGS5a6
	 wsQWt7KdyqokIE5eQ5yfMAHlxerO/DLv8vBYQCmR96ddRI00CdJNpL38X8ziWrnDG4
	 Uhw/Caj4d62fO0Rk927SXyXrbNWyR4vqEGvU7VPdyN9ojDnpUg1gQqRUspfrpdvz9F
	 KoEPBaoy7mIYJiIi8/e0Qk64O1b4pmdTmZCXZ7ZwR//JBDBssCllrBlnSLsudX8Svs
	 U0A/ogbY71VPw==
Date: Fri, 25 Sep 2026 21:54:36 +0000
To: Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
From: Clover <alex@ironrobin.net>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Steev Klimaszewski <threeway@gmail.com>, platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: embedded-controller: Add Lenovo ThinkPad X13s EC
Message-ID: <20260925215358.33417-2-alex@ironrobin.net>
In-Reply-To: <20260925215358.33417-1-alex@ironrobin.net>
References: <20260925215358.33417-1-alex@ironrobin.net>
Feedback-ID: 54785507:user:proton
X-Pm-Message-ID: 3c7e2bee16a1507f56110204a53332006d401c3a
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

