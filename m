Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7013712FF60
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Feb 2024 20:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708114659; cv=none; b=AW4sWGjU1f28luCo/aPBgipk+Vd6qu6qdGSEKs0CfRfzqYDjdSY8OB0F8jBAFz9OYfVijqOxxyLddKKHNwOGxBA/a6OlDYAZKS9PqoUDInbNmeYlhpkIFfw/H7d3CCWYZ8fTeTGr/jTVs2KBw/1os+wNWijBD0JrSNOurCg/cV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708114659; c=relaxed/simple;
	bh=XAJdtj0aCyKQTTLjNlv0nCrbgxkLbSweAKVKNG95L/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Twz0Hj7/NfVSqBzDRQFpIcutqjGUJbP8r52+dQQp2jgL6kcQX6JUXnggP/MCi3vNxkuGzUpcn8TMXs7JJDUCZg7byDs26fJBR6DgYl6aR5nE/RuDzzZLnpjy90III7okr+UeDeTgvJAmCZ3yh/7L/LTB2LnkRqCkY/ziTXmAMWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A1yGnzb0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A1yGnzb0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708114656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B955ShQ83txeuiPkO3gvu7BBohyGzojHbVv7qjD7oYc=;
	b=A1yGnzb0V0LDX3AD2SxRu40rkx++rMcEKgp7WzckVC3jDcAvA7537r1ru5915YlsaEgTAS
	nO7osEchOerQYER2CiiHbZDWdEDItlKzWBIxXNmOq/XnfB666ARhPIfi1kBQW+DDv+bP5S
	CJueAMhv788JmgfQMH2IdBb2p+buxj0=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-266-4C_ylTN5PBWCUiFApZn1ew-1; Fri,
 16 Feb 2024 15:17:32 -0500
X-MC-Unique: 4C_ylTN5PBWCUiFApZn1ew-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 484DF2806675;
	Fri, 16 Feb 2024 20:17:32 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7DC792166AE7;
	Fri, 16 Feb 2024 20:17:31 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	Tony Lindgren <tony@atomide.com>
Subject: [PATCH 2/4] platform/x86: Add new get_serdev_controller() helper
Date: Fri, 16 Feb 2024 21:17:19 +0100
Message-ID: <20240216201721.239791-3-hdegoede@redhat.com>
In-Reply-To: <20240216201721.239791-1-hdegoede@redhat.com>
References: <20240216201721.239791-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6

In some cases UART attached devices which require an in kernel driver,
e.g. UART attached Bluetooth HCIs are described in the ACPI tables
by an ACPI device with a broken or missing UartSerialBusV2() resource.

This causes the kernel to create a /dev/ttyS# char-device for the UART
instead of creating an in kernel serdev-controller + serdev-device pair
for the in kernel driver.

The quirk handling in acpi_quirk_skip_serdev_enumeration() makes the kernel
create a serdev-controller device for these UARTs instead of a /dev/ttyS#.

Instantiating the actual serdev-device to bind to is up to pdx86 code,
so far this was handled by the x86-android-tablets code. But since
commit b286f4e87e32 ("serial: core: Move tty and serdev to be children of
serial core port device") the serdev-controller device has moved in the
device hierarchy from (e.g.) /sys/devices/pci0000:00/8086228A:00/serial0 to
/sys/devices/pci0000:00/8086228A:00/8086228A:00:0/8086228A:00:0.0/serial0 .

This makes this a bit trickier to do and another driver is in the works
which will also need this functionality.

Add a new helper to get the serdev-controller device, so that the new
code for this can be shared.

Fixes: b286f4e87e32 ("serial: core: Move tty and serdev to be children of serial core port device")
Cc: Tony Lindgren <tony@atomide.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/serdev_helpers.h | 77 +++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 drivers/platform/x86/serdev_helpers.h

diff --git a/drivers/platform/x86/serdev_helpers.h b/drivers/platform/x86/serdev_helpers.h
new file mode 100644
index 000000000000..825979f6736b
--- /dev/null
+++ b/drivers/platform/x86/serdev_helpers.h
@@ -0,0 +1,77 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * In some cases UART attached devices which require an in kernel driver,
+ * e.g. UART attached Bluetooth HCIs are described in the ACPI tables
+ * by an ACPI device with a broken or missing UartSerialBusV2() resource.
+ *
+ * This causes the kernel to create a /dev/ttyS# char-device for the UART
+ * instead of creating an in kernel serdev-controller + serdev-device pair
+ * for the in kernel driver.
+ *
+ * The quirk handling in acpi_quirk_skip_serdev_enumeration() makes the kernel
+ * create a serdev-controller device for these UARTs instead of a /dev/ttyS#.
+ *
+ * Instantiating the actual serdev-device to bind to is up to pdx86 code,
+ * this header provides a helper for getting the serdev-controller device.
+ */
+#include <linux/acpi.h>
+#include <linux/device.h>
+#include <linux/printk.h>
+
+static inline struct device *
+get_serdev_controller(const char *serial_ctrl_hid,
+		      const char *serial_ctrl_uid,
+		      int serial_ctrl_port,
+		      const char *serdev_ctrl_name)
+{
+	struct device *ctrl_dev, *child;
+	struct acpi_device *ctrl_adev;
+	char name[32];
+	int i;
+
+	ctrl_adev = acpi_dev_get_first_match_dev(serial_ctrl_hid, serial_ctrl_uid, -1);
+	if (!ctrl_adev) {
+		pr_err("error could not get %s/%s serial-ctrl adev\n",
+		       serial_ctrl_hid, serial_ctrl_uid);
+		return ERR_PTR(-ENODEV);
+	}
+
+	/* get_first_physical_node() returns a weak ref */
+	ctrl_dev = get_device(acpi_get_first_physical_node(ctrl_adev));
+	if (!ctrl_dev) {
+		pr_err("error could not get %s/%s serial-ctrl physical node\n",
+		       serial_ctrl_hid, serial_ctrl_uid);
+		ctrl_dev = ERR_PTR(-ENODEV);
+		goto put_ctrl_adev;
+	}
+
+	/* Walk host -> uart-ctrl -> port -> serdev-ctrl */
+	for (i = 0; i < 3; i++) {
+		switch (i) {
+		case 0:
+			snprintf(name, sizeof(name), "%s:0", dev_name(ctrl_dev));
+			break;
+		case 1:
+			snprintf(name, sizeof(name), "%s.%d",
+				 dev_name(ctrl_dev), serial_ctrl_port);
+			break;
+		case 2:
+			strscpy(name, serdev_ctrl_name, sizeof(name));
+			break;
+		}
+
+		child = device_find_child_by_name(ctrl_dev, name);
+		put_device(ctrl_dev);
+		if (!child) {
+			pr_err("error could not find '%s' device\n", name);
+			ctrl_dev = ERR_PTR(-ENODEV);
+			goto put_ctrl_adev;
+		}
+
+		ctrl_dev = child;
+	}
+
+put_ctrl_adev:
+	acpi_dev_put(ctrl_adev);
+	return ctrl_dev;
+}
-- 
2.43.0

