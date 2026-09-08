Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E5B4AD4D5
	for <platform-driver-x86@vger.kernel.org>; Tue,  8 Sep 2026 09:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859140; cv=none; b=uALDk9vg7OYZblckDhxoIaljyjrkjxIPt+alzAVnP5ZxzIFYpY8mzL9QgJuJlUbDatw81Aj6+09kCk9ILHH64Jxc3a58YDkDHFXtovJrlzqaWpOnuEmKad+PDokXSRZMRMcR5NuviwkzuJ1RnWftRGqJYrqmRh9yBeCmAGCWMRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859140; c=relaxed/simple;
	bh=f8uHZpfRl4v8AUtS53bPhxc4vthZX6W8U9P1WRFUNx0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O640jbKtf9s/CBCr3f2XuirAfTLZQ0D1tKqyKiX0lyQqP6f3rGXIwspclz/r6Zda/O0yjv8lFmIE9mkxLPbbLUuyQQDi0b6MSWDKQWagzlOU41wjP1QWQEPJzbIgHzAd1qc7xj/78wO/s6OZgS7Y+4DmgqkCwGGog3LOTXCNeOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OfK7SkI6; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OfK7SkI6"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49d036e0e99so16291125e9.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 08 Sep 2026 02:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788859134; x=1789463934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RBs47LjvcqFa12yXVqhhMacXUU5EOaptYJ05VFD/yFg=;
        b=OfK7SkI61VRC0ejxUBEWkW6ctgoAisu6hwL5X8kNm823fZ1IW0sJFSfJyzBl713W6t
         G0lmZEwIdl0eBV4IXz6iNBd6JKOU5g1c6KI2UPrWbKKfVUVheL0V1wWJzxA6JNai+ey0
         TYn7GqIk5kqVj3N0Vfeb9C6Zal4NoOYLW71oyr2IXxdWTv+8VPCKNmO4q48+2h06SO8E
         QJWykhuwXEw5Ba5NZ7mpQ7rMuG+y/K1XUFx3/kHEH0Gd4YSSfwC3c1lai8QoSuFkODvW
         CNfJoMM0RwPIIu8r7bVmeshkEFTBr9QLTNdl5T2rdW6cnMGP5lgmPXJ8oCMaotDBJC+g
         pyMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859134; x=1789463934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RBs47LjvcqFa12yXVqhhMacXUU5EOaptYJ05VFD/yFg=;
        b=N9I5lrnnkF8pYYu/s3AuGXZYQA62JpRIkSwwO62XRqc4LXiQNmNFG267xJOm+Q4aQe
         fF4DhgIqNcPLWDIAGweSIWiyttPjM5p0vMoIWp0+WkWHcgTsu00hFEYMjDweUgYd9xKD
         MHuXgiEwgH+WdgOmLMBqm7Dr1vuJ4pk4OueukGxRAzpnCH2E1B3SszBEGS1zTs+a23Bl
         5NCus9jPZv8YZ5z2XuJn7w23D1flKsdYbkVwPjSi9Y4epOx+ToPncKRnki0n8AMEJeB7
         MDJOOUWymtqcMNei1WZ70/T9fZZEIpEEMSit0M8Vq36qtyiige4b7ItGfA+mLJ8/oZpv
         HVgQ==
X-Forwarded-Encrypted: i=1; AKwUvBy21kjVnD+2GWB9oCOuPnwTREuwA7LferaOfL/02o/KZ6xTb3Akd7vyZF6cHnPY1I35FB3E4oN+oQiGi2azSur/vfi3@vger.kernel.org
X-Gm-Message-State: AFuF++nZrT+jtXEDDsLl0JsxmIF2mHHCEADD6dXlBZxPQZT4n3hfLo+r
	ADoOOhWQZRsxEJlAwLuE72cA68tdDZBf7OsQzrYeMTvX140XYfzrUdXj
X-Gm-Gg: AYBFou1XGvXu0Qs1KbUC3m6m1sulQk6eCBrn8vz54V/Bo+MGof91EVInsFRUJhE6RUW
	TWpKK27ErR440J6JZvP5NMEqMPjOYerNjAQ3fqSXiZ/LSzTw1VoB22IKkn3ZM140OQKoPLsMXeK
	LuHXDzZnEwV6lal0533y1gTF3NqoREuUh5kUzwqOL6G4by/wbuFlIBk/WUnFHgOfbpmwSd4e5ZO
	wpMY15O6XFOogEiSWTlrysuW5CqRRGsfDl9KyV4BCNL4KR5FZo6hvCmYHjRqUKvcT/nZtoj93Eq
	fbUtNIwbU85KFQtfp7UwO7F+1M3XU0g5qPFLRWgubGOEmngJwMDcG15J0KszB9u6zwB3L6QnvOA
	bRQAeh9kDWN8pMiEsc3GjwK4Iadr3RfcrVPag2JheDUIujQjIHrnDJ/ycG5Hdlu4OL9XuM7DenP
	pXIZeGuX4mVUTTLdm33CSGQBaC7SDnE4Pnmk4EVKVePX3bvsxYVFY5sp9zx7D/Mzi8wkSJLtzDt
	djK5PBGmzN/3J7X2t9zN8EO04l2T6WZdA==
X-Received: by 2002:a05:600c:5493:b0:49b:8f18:714a with SMTP id 5b1f17b1804b1-49cf824a6c5mr291161125e9.12.1788859134252;
        Tue, 08 Sep 2026 02:18:54 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48588135600sm30514063f8f.2.2026.09.08.02.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:18:53 -0700 (PDT)
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
	linux-hwmon@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: embedded-controller: add Lenovo Yoga Slim 7x Gen 11 EC
Date: Tue,  8 Sep 2026 11:17:51 +0200
Message-ID: <20260908091752.5508-2-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908091752.5508-1-okerixx@gmail.com>
References: <20260908091752.5508-1-okerixx@gmail.com>
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

