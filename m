From: Paulo Alcantara <pcacjr@zytor.com>
Subject: [PATCH v2] platform/x86: hp-wmi: Correctly determine method id in WMI calls
Date: Sun, 30 Jul 2017 09:47:55 -0300
Message-ID: <20170730124755.16877-1-pcacjr@zytor.com>
References: <20170730031921.10324-1-pcacjr@zytor.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from terminus.zytor.com ([65.50.211.136]:48963 "EHLO mail.zytor.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751360AbdG3Mta (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 30 Jul 2017 08:49:30 -0400
In-Reply-To: <20170730031921.10324-1-pcacjr@zytor.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Paulo Alcantara <pcacjr@zytor.com>

The WMI queries are performed by evaluating the WMPV() method from ACPI
DSDT tables, and it takes three arguments: instance index, method id and
input data (buffer).

Currently the method id is hard-coded to 0x3 in hp_wmi_perform_query()
which means that it will perform WMI calls that expect an output data of
size 0x80 (128). The output size is usually OK for the WMI queries we
perform, however it would be better to pick the correct one before
evaluating the WMI method.

Which correct method id to choose can be figured out by looking at the
following ASL code from WVPI() method:

...
Name (PVSZ, Package (0x05)
            {
            Zero,
            0x04,
            0x80,
            0x0400,
            0x1000
            })
Store (Zero, Local0)
If (LAnd (LGreaterEqual (Arg1, One), LLessEqual (Arg1, 0x05)))
{
    Store (DerefOf (Index (PVSZ, Subtract (Arg1, One))), Local0)
}
...

Arg1 is the method id and PVSZ is the package used to index the
corresponding output size; 1 -> 0, 2 -> 4, 3 -> 128, 4 -> 1024, 5 ->
4096.

This patch maps the output size passed in hp_wmi_perform_query() to the
correct method id before evaluating the WMI method.

Signed-off-by: Paulo Alcantara <pcacjr@zytor.com>
---
 drivers/platform/x86/hp-wmi.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 0df4209648d1..c2ca5c22f8d2 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -188,6 +188,22 @@ struct rfkill2_device {
 static int rfkill2_count;
 static struct rfkill2_device rfkill2[HPWMI_MAX_RFKILL2_DEVICES];
 
+/* map output size to the corresponding WMI method id */
+static inline int encode_outsize_for_pvsz(int outsize)
+{
+	if (outsize > 4096)
+		return -EINVAL;
+	if (outsize > 1024)
+		return 5;
+	if (outsize > 128)
+		return 4;
+	if (outsize > 4)
+		return 3;
+	if (outsize > 0)
+		return 2;
+	return 1;
+}
+
 /*
  * hp_wmi_perform_query
  *
@@ -211,6 +227,7 @@ static struct rfkill2_device rfkill2[HPWMI_MAX_RFKILL2_DEVICES];
 static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 				void *buffer, int insize, int outsize)
 {
+	int mid;
 	struct bios_return *bios_return;
 	int actual_outsize;
 	union acpi_object *obj;
@@ -225,11 +242,15 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
 	int ret = 0;
 
+	mid = encode_outsize_for_pvsz(outsize);
+	if (WARN_ON(mid < 0))
+		return mid;
+
 	if (WARN_ON(insize > sizeof(args.data)))
 		return -EINVAL;
 	memcpy(&args.data, buffer, insize);
 
-	wmi_evaluate_method(HPWMI_BIOS_GUID, 0, 0x3, &input, &output);
+	wmi_evaluate_method(HPWMI_BIOS_GUID, 0, mid, &input, &output);
 
 	obj = output.pointer;
 
-- 
2.11.0
