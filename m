From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v11 05/10] test_firmware: add support for firmware_request_platform
Date: Sat, 11 Jan 2020 15:56:58 +0100
Message-ID: <20200111145703.533809-6-hdegoede@redhat.com>
References: <20200111145703.533809-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <20200111145703.533809-1-hdegoede@redhat.com>
Sender: linux-input-owner@vger.kernel.org
To: Ard Biesheuvel <ardb@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Peter Jones <pjones@redhat.com>, Dave Olsthoorn <dave@bewaar.me>, x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-input@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Add support for testing firmware_request_platform through a new
trigger_request_platform trigger.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v11:
- Drop a few empty lines which were accidentally introduced

Changes in v10:
- New patch in v10 of this patch-set
---
 lib/test_firmware.c | 59 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/lib/test_firmware.c b/lib/test_firmware.c
index 251213c872b5..6042840f861c 100644
--- a/lib/test_firmware.c
+++ b/lib/test_firmware.c
@@ -24,6 +24,7 @@
 #include <linux/delay.h>
 #include <linux/kthread.h>
 #include <linux/vmalloc.h>
+#include <linux/efi_embedded_fw.h>
=20
 #define TEST_FIRMWARE_NAME	"test-firmware.bin"
 #define TEST_FIRMWARE_NUM_REQS	4
@@ -507,6 +508,61 @@ static ssize_t trigger_request_store(struct device *=
dev,
 }
 static DEVICE_ATTR_WO(trigger_request);
=20
+#ifdef CONFIG_EFI_EMBEDDED_FIRMWARE
+static ssize_t trigger_request_platform_store(struct device *dev,
+					      struct device_attribute *attr,
+					      const char *buf, size_t count)
+{
+	static const u8 test_data[] =3D {
+		0x55, 0xaa, 0x55, 0xaa, 0x01, 0x02, 0x03, 0x04,
+		0x55, 0xaa, 0x55, 0xaa, 0x05, 0x06, 0x07, 0x08,
+		0x55, 0xaa, 0x55, 0xaa, 0x10, 0x20, 0x30, 0x40,
+		0x55, 0xaa, 0x55, 0xaa, 0x50, 0x60, 0x70, 0x80
+	};
+	struct efi_embedded_fw fw;
+	int rc;
+	char *name;
+
+	name =3D kstrndup(buf, count, GFP_KERNEL);
+	if (!name)
+		return -ENOSPC;
+
+	pr_info("inserting test platform fw '%s'\n", name);
+	fw.name =3D name;
+	fw.data =3D (void *)test_data;
+	fw.length =3D sizeof(test_data);
+	list_add(&fw.list, &efi_embedded_fw_list);
+
+	pr_info("loading '%s'\n", name);
+
+	mutex_lock(&test_fw_mutex);
+	release_firmware(test_firmware);
+	test_firmware =3D NULL;
+	rc =3D firmware_request_platform(&test_firmware, name, dev);
+	if (rc) {
+		pr_info("load of '%s' failed: %d\n", name, rc);
+		goto out;
+	}
+	if (test_firmware->size !=3D sizeof(test_data) ||
+	    memcmp(test_firmware->data, test_data, sizeof(test_data)) !=3D 0) {
+		pr_info("firmware contents mismatch for '%s'\n", name);
+		rc =3D -EINVAL;
+		goto out;
+	}
+	pr_info("loaded: %zu\n", test_firmware->size);
+	rc =3D count;
+
+out:
+	mutex_unlock(&test_fw_mutex);
+
+	list_del(&fw.list);
+	kfree(name);
+
+	return rc;
+}
+static DEVICE_ATTR_WO(trigger_request_platform);
+#endif
+
 static DECLARE_COMPLETION(async_fw_done);
=20
 static void trigger_async_request_cb(const struct firmware *fw, void *co=
ntext)
@@ -903,6 +959,9 @@ static struct attribute *test_dev_attrs[] =3D {
 	TEST_FW_DEV_ATTR(trigger_request),
 	TEST_FW_DEV_ATTR(trigger_async_request),
 	TEST_FW_DEV_ATTR(trigger_custom_fallback),
+#ifdef CONFIG_EFI_EMBEDDED_FIRMWARE
+	TEST_FW_DEV_ATTR(trigger_request_platform),
+#endif
=20
 	/* These use the config and can use the test_result */
 	TEST_FW_DEV_ATTR(trigger_batched_requests),
--=20
2.24.1
