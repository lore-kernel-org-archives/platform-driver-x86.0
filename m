From: Simranjit Singh <simranjit.singh@corebaby.org>
Subject: [PATCH 1/1] Use checkpatch.pl to make thinkpad_acpi.c error free:
 add parenthesis to complex macros
Date: Tue, 14 Nov 2017 15:14:41 -0800
Message-ID: <1510701281.9469.20.camel@k3saltt0>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: ibm-acpi@hmh.eng.br
Cc: dvhart@infradead.org, andy@infradead.org, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Simranjit Singh <simranjit.singh@corebaby.org> 

    Added parentheses around complex macros following checkpatch.pl for thinkpad_acpi.c

Signed-off-by: Simranjit Singh
---
diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 9ad1f5b..e2616c2 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -1650,23 +1650,23 @@ static void tpacpi_remove_driver_attributes(struct device_driver *drv)
 	TPV_Q(PCI_VENDOR_ID_IBM, __id1, __id2, __bv1, __bv2)
 
 /* Outdated IBM BIOSes often lack the EC id string */
-#define TPV_QI1(__id1, __id2, __bv1, __bv2, __ev1, __ev2) \
+#define (TPV_QI1(__id1, __id2, __bv1, __bv2, __ev1, __ev2) \
 	TPV_Q_X(PCI_VENDOR_ID_IBM, __id1, __id2, 	\
 		__bv1, __bv2, TPID(__id1, __id2),	\
 		__ev1, __ev2),				\
 	TPV_Q_X(PCI_VENDOR_ID_IBM, __id1, __id2, 	\
 		__bv1, __bv2, TPACPI_MATCH_UNKNOWN,	\
-		__ev1, __ev2)
+		__ev1, __ev2))
 
 /* Outdated IBM BIOSes often lack the EC id string */
-#define TPV_QI2(__bid1, __bid2, __bv1, __bv2,		\
+#define (TPV_QI2(__bid1, __bid2, __bv1, __bv2,		\
 		__eid1, __eid2, __ev1, __ev2) 		\
 	TPV_Q_X(PCI_VENDOR_ID_IBM, __bid1, __bid2, 	\
 		__bv1, __bv2, TPID(__eid1, __eid2),	\
 		__ev1, __ev2),				\
 	TPV_Q_X(PCI_VENDOR_ID_IBM, __bid1, __bid2, 	\
 		__bv1, __bv2, TPACPI_MATCH_UNKNOWN,	\
-		__ev1, __ev2)
+		__ev1, __ev2))
 
 #define TPV_QL0(__id1, __id2, __bv1, __bv2) \
 	TPV_Q(PCI_VENDOR_ID_LENOVO, __id1, __id2, __bv1, __bv2)
@@ -6238,8 +6238,8 @@ static ssize_t thermal_temp_input_show(struct device *dev,
 	THERMAL_SENSOR_ATTR_TEMP(16, 15),
 };
 
-#define THERMAL_ATTRS(X) \
-	&sensor_dev_attr_thermal_temp_input[X].dev_attr.attr
+#define (THERMAL_ATTRS(X) \
+	&sensor_dev_attr_thermal_temp_input[X].dev_attr.attr)
 
 static struct attribute *thermal_temp_input_attr[] = {
 	THERMAL_ATTRS(8),
