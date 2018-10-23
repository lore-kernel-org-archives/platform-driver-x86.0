From: Peng Hao <peng.hao2@zte.com.cn>
Subject: [PATCH 4/4]  pvpanic: add document for pvpanic-mmio DT
Date: Wed, 24 Oct 2018 01:25:37 +0800
Message-ID: <1540315537-70007-4-git-send-email-peng.hao2@zte.com.cn>
References: <1540315537-70007-1-git-send-email-peng.hao2@zte.com.cn>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1540315537-70007-1-git-send-email-peng.hao2@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de, gregkh@linuxfoundation.org, andy@infradead.org, dvhart@infradead.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, hutao@cn.fujitsu.com, Peng Hao <peng.hao2@zte.com.cn>
List-Id: platform-driver-x86.vger.kernel.org

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 .../devicetree/bindings/arm/pvpanic-mmio.txt       | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/pvpanic-mmio.txt

diff --git a/Documentation/devicetree/bindings/arm/pvpanic-mmio.txt b/Documentation/devicetree/bindings/arm/pvpanic-mmio.txt
new file mode 100644
index 0000000..96c84e15
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/pvpanic-mmio.txt
@@ -0,0 +1,26 @@
+* QEMU PVPANIC MMIO Configuration bindings for ARM
+
+QEMU's aarch64-softmmu emulation / virtualization targets provide the
+following PVPANIC MMIO Configuration interface on the "virt" machine
+type:
+
+- a read-write, 16-bit wide data register.
+
+QEMU exposes the data register to ARM guests as memory mapped registers.
+
+Required properties:
+
+- compatible: "qemu,pvpanic-mmio".
+
+Example:
+
+/ {
+        #size-cells = <0x2>;
+        #address-cells = <0x2>;
+
+        pvpanic-mmio@9060000 {
+                compatible = "qemu,pvpanic-mmio";
+                reg = <0x0 0x9060000 0x0 0x2>;
+        };
+};
+
-- 
1.8.3.1
