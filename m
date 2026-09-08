Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06A159D616
	for <platform-driver-x86@vger.kernel.org>; Tue,  8 Sep 2026 18:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788892463; cv=none; b=UrPriVpzCejmaMLWqEIwZHM8SwVzXVWDIi+YK8iF9HTVWiN7dvMhJMOSknoiGod1inyMlTwkgZ4tIoI72qk7rN4VjgaYE+7uRSXCbpcXmBrpTbuutuIxqzZJf09CIVxEJJ2xuqxn9clorOuC8O0bKljsproLQtbLH1H6lojW07M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788892463; c=relaxed/simple;
	bh=yMIqHAyYFGtS2eBd0WBVHOU4tQ7yI35DjGOHB3lvWEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QtsOQiATxzCtHCi+COOREfvUyDqvqC61+waNk/5/ADd0PdV4wKakc92e+A75nZPFjgrzmqI+yUhMIfoenbIFeUm4gg9LsDI8bn/sdZPMCe29E4TnLzy+q3hG8RPBhkQjH998FLhCfBmjDGFK1YNA7vlx48v6TSjSMJvn9xOZJD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rNaNuL8f; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rNaNuL8f"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so47088765e9.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 08 Sep 2026 11:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788892457; x=1789497257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HRuj29Ji4lepfajyUf6OsbyzRBUwpagoj3OZk9BKOfQ=;
        b=rNaNuL8f6E6kKRL5HP186VbzBYBgRyTR4LhaxrREJLNkjfP7uRv2301sBpO+G1DGE3
         sAR2MKhOc6ue4gOTa3o30oUtAn2C7F3AsPvTtAh9ykSBvBKKSRQcxc/iicL9d9p5xrTR
         qGT/BTofCLLISlGSMokNIIVsPb7+Bcar12tUqWNH55bBB/T+OU6uWufUX20eWMa6uo3X
         1710F5zeE47H38y0FSkiltdmOuN9AjOS2glr+KQ6JVYgaCECqTlYIsoldTUF5wniO/ZT
         GagHlifgM6Wa5Y5ybqdo9bDA0y63/GwlW0jX5v/T74QEjugzTpgtVYO04JijomluahMp
         Lv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788892457; x=1789497257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HRuj29Ji4lepfajyUf6OsbyzRBUwpagoj3OZk9BKOfQ=;
        b=pNqYOvUsOP76KlsV6RLIVo7j88ceh8RvUvDguJlHLOHy29is+AlooBlDLkzCS4YtTN
         hbhHC8zhUvXQ2/f3SKy9HAtd5RwiiqMOv8dLaZMkLUqfm8i6TE8E3SaOX/Kh7z4w6Pum
         aTPIr8awQiE3HQih+zbbbx0ymZIFpNUydCU0wReNs32fKsljxvWhaAODeFEXRYJxEiy6
         5vVjAiRV2GAVvYkl8dZXWVUGNq32EC+wXOWxOGK5CfpQIrVB0lcLVcSuQZjuc27btQFV
         XH0nVNorI1ZF18w+WeHFMMgWdcV3x2gBiR0qA2gfSOTfc6oOwNcwtXSRw8CeEo7wX9Ky
         /OQA==
X-Forwarded-Encrypted: i=1; AKwUvBxFuPsJV8UKBosOWggyKO1t4owV7hQPJp2arKt7FLWqRVvyuDkSLTDoQE3WJz+JhtRikiFF8z6oq/vS21VDF9pIq86a@vger.kernel.org
X-Gm-Message-State: AFuF++klymri0g5IEfJPPnm/POPYUQdWFfl6dDpOMwWxlYWbK4tC5MJm
	ciKFpDDpoXRS4xQdvXWUu8nS5GWkEUym61ssvDoluIom/aOLEPL9P7Tu
X-Gm-Gg: AYBFou1tTcfyuSzIZvwRrdWsh3H1A1cqF2ikwtnVvYboOqv+h11whj6RsmOGcfNFlQJ
	fJRHs9gV1tmnJ5Kgafw/2hK2PziBodo6LmmhP2hxYOrisJzvutLThdKMHapLsEHzTi1Y0hr8Ev/
	xn3ukpKzUSrxqvaasAF5XXmvKIlsDWbDqOhXyeXVPJLLiu9EZkDJ4HeranpW3YUkbTa23uINJfB
	XFHbnZI0UPn3VWLXd40RJ3ReI/BELVgxHIPUbrLw/1dzQ43tfzurTzLEyadwSI2ETvouZkdiEZO
	UufvFVfR15VVqeeFvX5x/jKGGxHshAlkPAm1lgQOkpXdj0gzdJuu4ibAIeLP9WPtVta8VYH/5S7
	ug9UtKQFSZjrdTpcHjcxmHtbVqE5VDaHjloS1EAV74Q0DFddyTr2VJWX2hK6F+/e9YkvmgRE7pW
	+ehckAn7SA7C+4T9+6CyhGLZZtasBnxvw9Yvkng+UV7lKl8G1coEj+9FEZb+AafWxqd9J7tTebU
	PiC0RMxCY78ejJGeqjdjmzsSKr7xccu
X-Received: by 2002:a05:600c:474c:b0:49c:f4e1:4c2d with SMTP id 5b1f17b1804b1-49cf828cd70mr287272355e9.16.1788892456722;
        Tue, 08 Sep 2026 11:34:16 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49d04fe7f9dsm312095435e9.0.2026.09.08.11.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 11:34:16 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: embedded-controller: add Lenovo Yoga Slim 7x Gen 11 EC
Date: Tue,  8 Sep 2026 20:34:02 +0200
Message-ID: <20260908183403.2107-2-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908183403.2107-1-okerixx@gmail.com>
References: <20260908183403.2107-1-okerixx@gmail.com>
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
index 38612eca2987..e35679264e22 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14882,6 +14882,14 @@ S:	Maintained
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

