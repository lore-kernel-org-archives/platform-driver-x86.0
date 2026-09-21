Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917D24AA031
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Sep 2026 14:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002208; cv=none; b=bGrlwxnZynk3PG9sQnFku9N9DQhvpPK2n0nx8t+qQnj+jR7nHpzQAndV5QHP3tZTErKyuYT76ZjBbo4UZ8j5U9Hu8E0FPboTHC4+W65rbyO8RPxP5ejIckzC4U2SM/jI5v88Q3rflsDSDHUOoiMDZAsezWP3t9fR8jLge23qAoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002208; c=relaxed/simple;
	bh=aid97Yjimc76nz+M6o0QWk1KtiDp95Qtk/akmNNnZ3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OdzQOntL9CWuXH/Oj3FKziOlj8ihbW+Cj6SrQufTV4zgwikEk12TrxfgQObrHS7F6B55qmy1tlEDqZmU7E0qFOiJGnnFpegN5EtKYfJab4/ZAiVgCifeSOXrPPp8JL9eVyJ8xwAzvAR1AP/4SVgwpNY65DWImYJkjiCIgPETCqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H8PBul1g; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H8PBul1g"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912df756so21367545e9.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Sep 2026 07:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790002204; x=1790607004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qdwj3z7uTqgFd/9Tfs5y2p+1zT+FzwY0f8o+/81CJMs=;
        b=H8PBul1gog+1gzpTDxIrNVKB5K54pqG6vF5ZOD7G7ooAU5DeSJEP0a4k46YMZ5t6e0
         qroWpraGfT9X8CSnGRrxRpEXsZ6ITnA0ylYlaplVZG+zgsQ40tygeef7IiZXriPm34dY
         wfpAVnIcDy2TdqqDgVDpphaTbQH3ttQHrYegpsgusyyEygzR2/sTlJChWkvvmX8Yuc5p
         t/Tx4S69pKxk+4EhhMdE0camoxwmDAsfA5j9ppMaMIg9h4JRtIcr+DD3rLnJ67dvMk0W
         s07j0OZ1TFsfJ1emK2NCQBveJGnyQJq9H04+oVtGRiLeADAXqp+Z6f4NOtPj1XmqPRUp
         KPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790002204; x=1790607004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qdwj3z7uTqgFd/9Tfs5y2p+1zT+FzwY0f8o+/81CJMs=;
        b=Qf8hw1kTbZPRw/vQM2fMMgI9CWEcXFHqqKA7lER3IsSC5RT6qJkoIR6qjPum7tPNB3
         Kq49dsFxXyeH5TA8LV2Ol/tpBxjMiqdmJxZXseRYVEHosz2ncCFky4tGeC23VIN0XmYZ
         vAyEhKFOh0ehVpHicTjDxH+4lHsbJSPBwoMayo/dSNaoELjO4/9VnmB5EJK+q2R+dw1o
         +f5xBb08lN5PL4Sgb4S98OK1KZxIGnp39cnO55euekah99PAB30ASJMLRiT1a9thR7Y4
         9P+6lfuC6ERjM+7zIYfB8zQVuBqdKxw9/2ScPCon3nsbXoMuyLjXzt6QcNg4CDpwd531
         6IpA==
X-Forwarded-Encrypted: i=1; AKwUvBwYDEXFl/3HBxo5vy7LBBQ3Mf6Dx4uatOvGE8Oa24hQ5O9Qu/wlnWol9ohwO3uQ4nhpO0Gniw+vD1Z/28r00oJ7/nk7@vger.kernel.org
X-Gm-Message-State: AFuF++nnYcHsaKOFRb7TyutpSY/HvSHH4KyZ8GP29yRY3pKRhnvwjnLG
	An523Abz6KWEfocwGu+ANxKW1RvH9x3SrDTyN7tQvKJ542NYbABa5RXU
X-Gm-Gg: AYBFou2L9LqybQFSGb+5qOqHP4oqX13jSnUWDGxS7VdjFMTsnKa3uYJOJMqYCxZiYLQ
	9uSj8yPRklZVol0tGQylCbhZ0/bTwv4dNXKeufmVXEy32Vlgz6zGX2m3ZT8HUiHgedisYvuPbM+
	gAwyG6x9BfQ/bx44TrQfO3nPyuoAUa584CTfJeR7LuG2+vK24ri+HvKoy4eJFwQ/nVRGPRDNRMP
	aSGSXJLL1UFTusvoO0G3qpGm42WuOHux11E6ISpYYrbc4ccmTMXXhelHZwPZbbnawBkxciGb5gf
	DIC2MZK+X921L3qAnFavEB2nV0tGwvwSTLTD7pm3JTY98ZTIEcBS9zfd00af1puIMvPculB4UAT
	CUHJfH3lgSjajJ7pPUWzNJTfAN1tcNSZ+7+QQ+0Y6rlx+BMVG/tb48qYqXZ58+LQc1qBZb96rIy
	K0diDgNOqpN4/aHPcMXL/I1kl3J8lXViW/L1gZ9gbLN04jnW9BnBYm1awCz4Gx+X13BYtdvnwVP
	5S5jy0MXA==
X-Received: by 2002:a05:600c:3ba0:b0:49e:73d3:78ab with SMTP id 5b1f17b1804b1-49fc55adc12mr192320725e9.0.1790002203622;
        Mon, 21 Sep 2026 07:50:03 -0700 (PDT)
Received: from localhost.localdomain ([194.154.195.114])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fcd8bc15esm191595725e9.1.2026.09.21.07.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:50:03 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
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
Subject: [PATCH v3 1/3] dt-bindings: embedded-controller: add Lenovo Yoga Slim 7x Gen 11 EC
Date: Mon, 21 Sep 2026 16:49:51 +0200
Message-ID: <20260921144953.15113-2-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921144953.15113-1-okerixx@gmail.com>
References: <20260921144953.15113-1-okerixx@gmail.com>
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
index be096be5fff6..11d459c17caf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14966,6 +14966,14 @@ S:	Maintained
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

