Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787C950EBFF
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Oct 2026 13:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984210; cv=none; b=J+/I/ikv4wPJIpyBI7efjfbarB4cAsKGYZY3609bOjJ/f3MG6Ps0rrGDSN7BzzBK22g4if1BF9++z7vqc9lCxeJHomOQaAiXb5V3gNKOkCIZj75BRqCbcVlVGO2bkGEDM2hzoAxGzWRquIYVVinuno7U/RBsdxH8bnYOWyy+QOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984210; c=relaxed/simple;
	bh=3t2mQVj8Yt6ntyBqwLQcfmTJXVcoYTmawKWtLoxFocw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lrAlUIQ8na7K/aOe4tA94LD37TdfRZbP95PavDZtUMNE1MNaS+iPW3J+Rv2Xzvd61HbKtXW4CweksRB5wMKf8veqScXwT6jIsCPok1PlPVYWixvp2cxZVZ0JfdruD5ng6My3qsGIfBeyC+Qb07Oq9o8U4n/t4X3sm/9sQWrh5iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S428NoCO; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S428NoCO"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-486e70f2457so237700f8f.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 14 Oct 2026 06:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791984205; x=1792589005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y8jXtfpSQ24o+MiydEQ6AfaaIrOtsZbBxK+xcoMqoWE=;
        b=S428NoCOyb8SCVwbHYXEi3Cw+3asIZSqjvwi8KBsZDT/50oP9NLB8Kz6eP0EQhMdgx
         L/7bdMr0/xbMKxHq5sQs7+LNv2OsWaNn36nW54sxysefFJgLk71QTXwzn8yBLor9ermE
         ABKKQ2f6xY+PoPSlRzdZXKOXwMPkWjauBpmtRUgkXt+S9uQqQwJWpT8aEeEMHW3NbB//
         1w3cbM9ScrVPjUtpDbHmBWkKN4HbHxfKdirJ8jr41GKexu+aqk0pSPsXJLRtFeCMBko/
         KsNporA7JlzYUWQ4aRbJhVxF+tUaQTPEzJvxGVYmK+JhYL5/PTxz/iQ0ld59bMOONL7M
         v3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791984205; x=1792589005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y8jXtfpSQ24o+MiydEQ6AfaaIrOtsZbBxK+xcoMqoWE=;
        b=nUN0bbUN+AfkD11WpmiGLkVba6WnV3cKAhHbgLbW8EVxA9hk5vFDXHmb59nNKd6nKX
         sH5EDEZIdGzNIGM+enNlSXe3/idCfwVcRIfG0NvwtInyI/F/qz14kcGbLXY2H3TtV4kf
         TIZbnv1oigp5Rmq/ULDe0PtnU1GodntsTxBbobjAyzOi8yHiiUiMroMb5f6vxr5stFnI
         OvRue/6g8Ao84GZmA0t2NZkejejVecrapwpH9oAhAm/hlETWGbVJxhvERxB1lON5RnP6
         b0AmuJrhYn4W1CRMLN8DDQqFwg2CYaOhIZqmrzXalJ6crnMfLvxDUUCaDV7PMqjWM7Ew
         NyWw==
X-Forwarded-Encrypted: i=1; AKwUvBxGDldalixfI0zMzkF2RXA+yPdOBKgQ8+gU0SD/VRgFjccWLURrzwg7/3+rwM98GjRhgnMj1GW6+7JmT/wG386j8r9H@vger.kernel.org
X-Gm-Message-State: AFq9FYIHBbb5IBRj+5rjqVYqml74f27OJ2BLHWmmW5i7i/m18lRVJeHg
	x7AnHENzHY2WyOky1tgicMnySJqR4Sqc+t9DVBXaSgOzYKGroG5+HppZ
X-Gm-Gg: AYBFou3ikcJUeirKF9+8pJPqOGjy00ZLtfWvr2tcjT+lnZR3Ano79MM9YQf8Sx7wCSY
	wOZIyFvnqNl/QLzkYanuwLKpmdGUoysVJFUnCfw9BKa68mgmrrpgyrcD2CKQPCkLDi9z4jTj5HZ
	yB3M3QzqoMe49PB8vLZlqkQjWfXjE9eP+hsZfDP/glmCH3p89O5ovmRUw3IsLws6XV57GPKIEU8
	9tlEpYsrEhugD4aAwFyw/lkru8dv3o54gesIvfHKIc+LK1McDtkIaAMuNuYdF2Of7o1MQU6ugaW
	+wSLYvjyqxmpkbsa7Ob22EdnL1iHAQor8KCVOKIyXKu4vzg0mBs5CFUIeua/iAknI44HdU6N5D4
	kzW6XBlYog5CWk8QuRxYJ+j2AgENxsRQVMjk19HtlpnG9h4D6wDyGfXbQyhapzcE92cITkz05kn
	J0EN/A+FhtRNhkSSIsJlNDdp4uTKpSxrh52X+QdhCFZbu8IpbkPbJ/GXEo2mgzlSaTeTIzimWGb
	EHNc+BSgumfZQ==
X-Received: by 2002:a05:600c:699b:b0:4a0:4a8:d444 with SMTP id 5b1f17b1804b1-4a18e4af334mr336344225e9.33.1791984204396;
        Wed, 14 Oct 2026 06:23:24 -0700 (PDT)
Received: from localhost.localdomain ([194.154.195.114])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1bcf69402sm782515e9.14.2026.10.14.06.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:23:24 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 1/3] dt-bindings: embedded-controller: add Lenovo Yoga Slim 7x Gen 11 EC
Date: Wed, 14 Oct 2026 15:23:13 +0200
Message-ID: <20261014132315.4659-2-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014132315.4659-1-okerixx@gmail.com>
References: <20261014132315.4659-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the Compal embedded controller found on the Lenovo Yoga Slim 7x
Gen 11, a Qualcomm Snapdragon X2 Elite (glymur) laptop. It sits on I2C at
address 0x70 and is distinct from the Qualcomm reference EC that the
reference designs place at 0x76.

Signed-off-by: Oleg Keri <okerixx@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../lenovo,yoga-slim7x-gen11-ec.yaml          | 56 +++++++++++++++++++
 MAINTAINERS                                   |  8 +++
 2 files changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml

diff --git a/Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml
new file mode 100644
index 000000000000..37337de86b0b
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lenovo Yoga Slim 7x Gen 11 Embedded Controller
+
+maintainers:
+  - Oleg Keri <okerixx@gmail.com>
+
+description:
+  The Lenovo Yoga Slim 7x Gen 11, a Qualcomm Snapdragon X2 Elite (glymur)
+  laptop, has a Compal embedded controller on I2C. It reports board
+  thermistors, battery cell voltages and CPU fan speed, and drives the
+  keyboard backlight.
+
+  This controller is not the Qualcomm reference EC that the Snapdragon
+  reference designs place at address 0x76; it speaks a different command
+  set and answers at 0x70.
+
+properties:
+  compatible:
+    const: lenovo,yoga-slim7x-gen11-ec
+
+  reg:
+    const: 0x70
+
+  interrupts:
+    maxItems: 1
+    description:
+      The controller pulses this line while it has events queued.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        embedded-controller@70 {
+            compatible = "lenovo,yoga-slim7x-gen11-ec";
+            reg = <0x70>;
+
+            interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 1da3623e77ce..91d562a7531e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15135,6 +15135,14 @@ S:	Maintained
 F:	Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
 F:	drivers/platform/x86/lenovo/yb9-kbdock.c
 
+LENOVO YOGA SLIM 7X GEN 11 EMBEDDED CONTROLLER DRIVER
+M:	Oleg Keri <okerixx@gmail.com>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	Documentation/ABI/testing/sysfs-driver-lenovo-yoga-slim7x-gen11-ec
+F:	Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml
+F:	drivers/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c
+
 LETSKETCH HID TABLET DRIVER
 M:	Hans de Goede <hansg@kernel.org>
 L:	linux-input@vger.kernel.org
-- 
2.55.0

