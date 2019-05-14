From: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Subject: [PATCH v4 07/13] platform/x86: asus-wmi: Support WMI event queue
Date: Tue, 14 May 2019 21:02:09 +0200
Message-ID: <28b9a17e-fb23-5277-4f65-26cae9f2837f@gmail.com>
References: <c8cdb347-e206-76b2-0d43-546ef660ffb7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c8cdb347-e206-76b2-0d43-546ef660ffb7@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Daniel Drake <drake@endlessm.com>, Chris Chiu <chiu@endlessm.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Event codes are expected to be retrieved from a queue on at least some
models. Specifically, very likely the ACPI WMI devices with _UID ATK are
queued whereas those with ASUSWMI are not [1].

The WMI event codes are pushed into a circular buffer queue. After the INIT
method is called, ACPI code is allowed to push events into this buffer.
The INIT method cannot be reverted. If the module is unloaded and an event
(such as hotkey press) gets emitted before inserting it back the events get
processed delayed by one or if the queue overflows, additionally delayed by
about 3 seconds.

It might be considered a minor issue and no normal user would likely
observe this (there is little reason unloading the driver), but it does
significantly frustrate a developer who is unlucky enough to encounter
this. Therefore, the fallback to unqueued behavior occurs whenever
something unexpected happens.

The fix flushes the old key codes out of the queue on load. After receiving
event the queue is read until either ..FFFF or 1 is encountered. Also as
noted in [1] it is checked whether notify code is equal to 0xFF before
enabling queue processing in WMI notify handler.

DSDT examples:

FX505GM
Device (ATKD)
{ ..
    Name (ATKQ, Package (0x10)
    {
        0xFFFFFFFF, ..
    }

    Method (IANQ, 1, Serialized)
    {
        If ((AQNO >= 0x10))
        {
            Local0 = 0x64
            While ((Local0 && (AQNO >= 0x10)))
            {
                Local0--
                Sleep (0x0A)
            }
            ...
        ..
        AQTI++
        AQTI &= 0x0F
        ATKQ [AQTI] = Arg0
        ...
    }

    Method (GANQ, 0, Serialized)
    {
        ..
        If (AQNO)
        {
            ...
            Local0 = DerefOf (ATKQ [AQHI])
            AQHI++
            AQHI &= 0x0F
            Return (Local0)
        }

        Return (One)
    }

This code is almost identical to K54C, which does return Ones on empty
queue.

K54C:
Method (GANQ, 0, Serialized)
{
    If (AQNO)
    {
        ...
        Return (Local0)
    }

    Return (Ones)
}

[1] Link: https://lkml.org/lkml/2019/4/12/104

Signed-off-by: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Suggested-by: Daniel Drake <drake@endlessm.com>
---
 drivers/platform/x86/asus-wmi.c | 73 ++++++++++++++++++++++++++++++---
 1 file changed, 68 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index ed7c7857012e..7bfac06abae4 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -84,6 +84,13 @@ MODULE_LICENSE("GPL");
 #define PCI_DEVICE_ID_INTEL_LYNXPOINT_LP_XHCI	0x9c31
 
 #define ASUS_ACPI_UID_ASUSWMI		"ASUSWMI"
+#define ASUS_ACPI_UID_ATK		"ATK"
+
+#define WMI_EVENT_QUEUE_SIZE		0x10
+#define WMI_EVENT_QUEUE_END		0x1
+#define WMI_EVENT_MASK			0xFFFF
+/* The WMI hotkey event value is always the same. */
+#define WMI_EVENT_VALUE_ATK		0xFF
 
 #define WMI_EVENT_MASK			0xFFFF
 
@@ -150,6 +157,7 @@ struct asus_wmi {
 	int dsts_id;
 	int spec;
 	int sfun;
+	bool wmi_event_queue;
 
 	struct input_dev *inputdev;
 	struct backlight_device *backlight_device;
@@ -1738,14 +1746,52 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 static void asus_wmi_notify(u32 value, void *context)
 {
 	struct asus_wmi *asus = context;
-	int code = asus_wmi_get_event_code(value);
+	int code;
+	int i;
 
-	if (code < 0) {
-		pr_warn("Failed to get notify code: %d\n", code);
-		return;
+	for (i = 0; i < WMI_EVENT_QUEUE_SIZE + 1; i++) {
+		code = asus_wmi_get_event_code(value);
+
+		if (code < 0) {
+			pr_warn("Failed to get notify code: %d\n", code);
+			return;
+		}
+
+		if (code == WMI_EVENT_QUEUE_END || code == WMI_EVENT_MASK)
+			return;
+
+		asus_wmi_handle_event_code(code, asus);
+
+		/*
+		 * Double check that queue is present:
+		 * ATK (with queue) uses 0xff, ASUSWMI (without) 0xd2.
+		 */
+		if (!asus->wmi_event_queue || value != WMI_EVENT_VALUE_ATK)
+			return;
 	}
 
-	asus_wmi_handle_event_code(code, asus);
+	pr_warn("Failed to process event queue, last code: 0x%x\n", code);
+}
+
+static int asus_wmi_notify_queue_flush(struct asus_wmi *asus)
+{
+	int code;
+	int i;
+
+	for (i = 0; i < WMI_EVENT_QUEUE_SIZE + 1; i++) {
+		code = asus_wmi_get_event_code(WMI_EVENT_VALUE_ATK);
+
+		if (code < 0) {
+			pr_warn("Failed to get event during flush: %d\n", code);
+			return code;
+		}
+
+		if (code == WMI_EVENT_QUEUE_END || code == WMI_EVENT_MASK)
+			return 0;
+	}
+
+	pr_warn("Failed to flush event queue\n");
+	return -EIO;
 }
 
 /*
@@ -1944,6 +1990,23 @@ static int asus_wmi_platform_init(struct asus_wmi *asus)
 		asus->dsts_id = ASUS_WMI_METHODID_DSTS;
 	}
 
+	/*
+	 * Some devices can have multiple event codes stored in a queue before
+	 * the module load if it was unloaded intermittently after calling
+	 * the INIT method (enables event handling). The WMI notify handler is
+	 * expected to retrieve all event codes until a retrieved code equals
+	 * queue end marker (One or Ones). Old codes are flushed from the queue
+	 * upon module load. Not enabling this when it should be has minimal
+	 * visible impact so fall back if anything goes wrong.
+	 */
+	wmi_uid = wmi_get_acpi_device_uid(asus->driver->event_guid);
+	if (wmi_uid && !strcmp(wmi_uid, ASUS_ACPI_UID_ATK)) {
+		dev_info(dev, "Detected ATK, enable event queue\n");
+
+		if (!asus_wmi_notify_queue_flush(asus))
+			asus->wmi_event_queue = true;
+	}
+
 	/* CWAP allow to define the behavior of the Fn+F2 key,
 	 * this method doesn't seems to be present on Eee PCs */
 	if (asus->driver->quirks->wapf >= 0)
-- 
2.17.1
