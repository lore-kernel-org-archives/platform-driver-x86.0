From: Peng Hao <peng.hao2@zte.com.cn>
Subject: [PATCH V2 4/4]  misc/pvpanic : pvpanic: add document for pvpanic-mmio DT
Date: Thu, 25 Oct 2018 01:12:16 +0800
Message-ID: <1540401136-78500-4-git-send-email-peng.hao2@zte.com.cn>
References: <1540401136-78500-1-git-send-email-peng.hao2@zte.com.cn>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1540401136-78500-1-git-send-email-peng.hao2@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de, gregkh@linuxfoundation.org, andy@infradead.org, dvhart@infradead.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, hutao@cn.fujitsu.com, Peng Hao <peng.hao2@zte.com.cn>
List-Id: platform-driver-x86.vger.kernel.org

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 .../devicetree/bindings/arm/pvpanic-mmio.txt       | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/pvpanic-mmio.txt

diff --git a/Documentation/devicetree/bindings/arm/pvpanic-mmio.txt b/Documentation/devicetree/bindings/arm/pvpanic-mmio.txt
new file mode 100644
index 0000000..a6bdacd
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/pvpanic-mmio.txt
@@ -0,0 +1,29 @@
+* QEMU PVPANIC MMIO Configuration bindings for ARM
+
+QEMU's emulation / virtualization targets provide the following PVPANIC
+MMIO Configuration interface on the "virt" machine.
+type:
+
+- a read-write, 16-bit wide data register.
+
+QEMU exposes the data register to guests as memory mapped registers.
+
+Required properties:
+
+- compatible: "qemu,pvpanic-mmio".
+- reg: the MMIO region used by the device.
+  * Bytes 0x0  Write panic event to the reg when guest OS panics.
+  * Bytes 0x1  Reserved.
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
