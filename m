Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1985723BE
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 14:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715611586; cv=none; b=p3VQS/vbNq0HH8xj+zn8vB5bZlMWjKqH+NOoh/NQn50TTbxN2zZ9wb8nXm1M5W945czokGq1ZYEV4/BWEWGvmL3KAO0N9GCVo8a1WA5cxPZlYc8jyj+jQUAWWP8FbkXTNN5GxiqYo50uIPjpUG/ILLd9HwrKe2xpjGJRqxyKXL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715611586; c=relaxed/simple;
	bh=sKFovYhNFwsmSi0pVvce+Qefa5S0POgU4mdDQdGkg4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bxrSGo9KB3mcUMJYYOCQWmEZtJnyv9Xa5FCKNo1g5579I0gyKLqQkuKSDsE3pWH3E2B3o2zE7UrR7ylbPS9W0vbRqaNclDC5NW6iMXBUi9NWaxBK62fIif8mjuZ2xKuA6e+0D6dwHmoUXMrga9vfD4OzflCTfHtJwA3QcDwgniY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U86qC8GW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U86qC8GW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715611582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P3F37oJxj1djXvpUfNPr6tdTUNZ/fonBN8KgaNYad50=;
	b=U86qC8GWlSgCAab/AOOndU02M895hl85XpwEHElQEgmyaFV6mMz+ZkTg7c0Tx82auXTGnB
	QluQL/AIFs2HUQMFFdEaiFB5I1W0Xe+YRiR4VYVFh3bdwONT/rH2QI7zPCtkn7qpV4aLmY
	gbe4PY29YGLYmpV80LTDBTPQB1A+qhc=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-339-V3gGLW7nNw2iCcRwk3Hm8Q-1; Mon,
 13 May 2024 10:46:09 -0400
X-MC-Unique: V3gGLW7nNw2iCcRwk3Hm8Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79B2438135EB;
	Mon, 13 May 2024 14:46:08 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.190])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 926CF2026D33;
	Mon, 13 May 2024 14:46:07 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	AceLan Kao <acelan.kao@canonical.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Roman Bogoyev <roman@computercheck.com.au>,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 2/2] tools arch x86: Add dell-uart-backlight-emulator
Date: Mon, 13 May 2024 16:46:02 +0200
Message-ID: <20240513144603.93874-3-hdegoede@redhat.com>
In-Reply-To: <20240513144603.93874-1-hdegoede@redhat.com>
References: <20240513144603.93874-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

Dell All In One (AIO) models released after 2017 use a backlight controller
board connected to an UART.

Add a small emulator to allow development and testing of
the drivers/platform/x86/dell/dell-uart-backlight.c driver for
this board, without requiring access to an actual Dell All In One.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v3:
- Use response[0] when the response-length is needed instead of
  recalculating it multiple times

Changes in v2:
- Ensure clean exit (return 0) when the emulator is quit by Ctrl+C
---
 .../dell-uart-backlight-emulator/.gitignore   |   1 +
 .../x86/dell-uart-backlight-emulator/Makefile |  19 ++
 .../x86/dell-uart-backlight-emulator/README   |  46 +++++
 .../dell-uart-backlight-emulator.c            | 163 ++++++++++++++++++
 4 files changed, 229 insertions(+)
 create mode 100644 tools/arch/x86/dell-uart-backlight-emulator/.gitignore
 create mode 100644 tools/arch/x86/dell-uart-backlight-emulator/Makefile
 create mode 100644 tools/arch/x86/dell-uart-backlight-emulator/README
 create mode 100644 tools/arch/x86/dell-uart-backlight-emulator/dell-uart-backlight-emulator.c

diff --git a/tools/arch/x86/dell-uart-backlight-emulator/.gitignore b/tools/arch/x86/dell-uart-backlight-emulator/.gitignore
new file mode 100644
index 000000000000..5c8cad8d72b9
--- /dev/null
+++ b/tools/arch/x86/dell-uart-backlight-emulator/.gitignore
@@ -0,0 +1 @@
+dell-uart-backlight-emulator
diff --git a/tools/arch/x86/dell-uart-backlight-emulator/Makefile b/tools/arch/x86/dell-uart-backlight-emulator/Makefile
new file mode 100644
index 000000000000..6ea1d9fd534b
--- /dev/null
+++ b/tools/arch/x86/dell-uart-backlight-emulator/Makefile
@@ -0,0 +1,19 @@
+# SPDX-License-Identifier: GPL-2.0
+# Makefile for Intel Software Defined Silicon provisioning tool
+
+dell-uart-backlight-emulator: dell-uart-backlight-emulator.c
+
+BINDIR ?= /usr/bin
+
+override CFLAGS += -O2 -Wall
+
+%: %.c
+	$(CC) $(CFLAGS) -o $@ $< $(LDFLAGS)
+
+.PHONY : clean
+clean :
+	@rm -f dell-uart-backlight-emulator
+
+install : dell-uart-backlight-emulator
+	install -d $(DESTDIR)$(BINDIR)
+	install -m 755 -p dell-uart-backlight-emulator $(DESTDIR)$(BINDIR)/dell-uart-backlight-emulator
diff --git a/tools/arch/x86/dell-uart-backlight-emulator/README b/tools/arch/x86/dell-uart-backlight-emulator/README
new file mode 100644
index 000000000000..c0d8e52046ee
--- /dev/null
+++ b/tools/arch/x86/dell-uart-backlight-emulator/README
@@ -0,0 +1,46 @@
+Emulator for DELL0501 UART attached backlight controller
+--------------------------------------------------------
+
+Dell All In One (AIO) models released after 2017 use a backlight controller
+board connected to an UART.
+
+In DSDT this uart port will be defined as:
+
+   Name (_HID, "DELL0501")
+   Name (_CID, EisaId ("PNP0501")
+
+With the DELL0501 indicating that we are dealing with an UART with
+the backlight controller board attached.
+
+This small emulator allows testing
+the drivers/platform/x86/dell/dell-uart-backlight.c driver without access
+to an actual Dell All In One.
+
+This requires:
+1. A (desktop) PC with a 16550 UART on the motherboard and a standard DB9
+   connector connected to this UART.
+2. A DB9 NULL modem cable.
+3. A second DB9 serial port, this can e.g. be a USB to serial converter
+   with a DB9 connector plugged into the same desktop PC.
+4. A DSDT overlay for the desktop PC replacing the _HID of the 16550 UART
+   ACPI Device() with "DELL0501" and adding a _CID of "PNP0501", see
+   DSDT.patch for an example of the necessary DSDT changes.
+
+With everything setup and the NULL modem cable connected between
+the 2 serial ports run:
+
+./dell-uart-backlight-emulator <path-to-/dev/tty*S#-for-second-port>
+
+For example when using an USB to serial converter for the second port:
+
+./dell-uart-backlight-emulator /dev/ttyUSB0
+
+And then (re)load the dell-uart-backlight driver:
+
+sudo rmmod dell-uart-backlight; sudo modprobe dell-uart-backlight dyndbg
+
+After this check "dmesg" to see if the driver correctly received
+the firmware version string from the emulator. If this works there
+should be a /sys/class/backlight/dell_uart_backlight/ directory now
+and writes to the brightness or bl_power files should be reflected
+by matching output from the emulator.
diff --git a/tools/arch/x86/dell-uart-backlight-emulator/dell-uart-backlight-emulator.c b/tools/arch/x86/dell-uart-backlight-emulator/dell-uart-backlight-emulator.c
new file mode 100644
index 000000000000..655b6c96d8cf
--- /dev/null
+++ b/tools/arch/x86/dell-uart-backlight-emulator/dell-uart-backlight-emulator.c
@@ -0,0 +1,163 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Dell AIO Serial Backlight board emulator for testing
+ * the Linux dell-uart-backlight driver.
+ *
+ * Copyright (C) 2024 Hans de Goede <hansg@kernel.org>
+ */
+#include <errno.h>
+#include <fcntl.h>
+#include <signal.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <sys/un.h>
+#include <termios.h>
+#include <unistd.h>
+
+int serial_fd;
+int brightness = 50;
+
+static unsigned char dell_uart_checksum(unsigned char *buf, int len)
+{
+	unsigned char val = 0;
+
+	while (len-- > 0)
+		val += buf[len];
+
+	return val ^ 0xff;
+}
+
+/* read() will return -1 on SIGINT / SIGTERM causing the mainloop to cleanly exit */
+void signalhdlr(int signum)
+{
+}
+
+int main(int argc, char *argv[])
+{
+	struct sigaction sigact = { .sa_handler = signalhdlr };
+	unsigned char buf[4], csum, response[32];
+	const char *version_str = "PHI23-V321";
+	struct termios tty, saved_tty;
+	int ret, idx, len = 0;
+
+	if (argc != 2) {
+		fprintf(stderr, "Invalid or missing arguments\n");
+		fprintf(stderr, "Usage: %s <serial-port>\n", argv[0]);
+		return 1;
+	}
+
+	serial_fd = open(argv[1], O_RDWR | O_NOCTTY);
+	if (serial_fd == -1) {
+		fprintf(stderr, "Error opening %s: %s\n", argv[1], strerror(errno));
+		return 1;
+	}
+
+	ret = tcgetattr(serial_fd, &tty);
+	if (ret == -1) {
+		fprintf(stderr, "Error getting tcattr: %s\n", strerror(errno));
+		goto out_close;
+	}
+	saved_tty = tty;
+
+	cfsetspeed(&tty, 9600);
+	cfmakeraw(&tty);
+	tty.c_cflag &= ~CSTOPB;
+	tty.c_cflag &= ~CRTSCTS;
+	tty.c_cflag |= CLOCAL | CREAD;
+
+	ret = tcsetattr(serial_fd, TCSANOW, &tty);
+	if (ret == -1) {
+		fprintf(stderr, "Error setting tcattr: %s\n", strerror(errno));
+		goto out_restore;
+	}
+
+	sigaction(SIGINT, &sigact, 0);
+	sigaction(SIGTERM, &sigact, 0);
+
+	idx = 0;
+	while (read(serial_fd, &buf[idx], 1) == 1) {
+		if (idx == 0) {
+			switch (buf[0]) {
+			/* 3 MSB bits: cmd-len + 01010 SOF marker */
+			case 0x6a: len = 3; break;
+			case 0x8a: len = 4; break;
+			default:
+				fprintf(stderr, "Error unexpected first byte: 0x%02x\n", buf[0]);
+				continue; /* Try to sync up with sender */
+			}
+		}
+
+		/* Process msg when len bytes have been received */
+		if (idx != (len - 1)) {
+			idx++;
+			continue;
+		}
+
+		/* Reset idx for next command */
+		idx = 0;
+
+		csum = dell_uart_checksum(buf, len - 1);
+		if (buf[len - 1] != csum) {
+			fprintf(stderr, "Error checksum mismatch got 0x%02x expected 0x%02x\n",
+				buf[len - 1], csum);
+			continue;
+		}
+
+		switch ((buf[0] << 8) | buf[1]) {
+		case 0x6a06: /* cmd = 0x06, get version */
+			len = strlen(version_str);
+			strcpy((char *)&response[2], version_str);
+			printf("Get version, reply: %s\n", version_str);
+			break;
+		case 0x8a0b: /* cmd = 0x0b, set brightness */
+			if (buf[2] > 100) {
+				fprintf(stderr, "Error invalid brightness param: %d\n", buf[2]);
+				continue;
+			}
+
+			len = 0;
+			brightness = buf[2];
+			printf("Set brightness %d\n", brightness);
+			break;
+		case 0x6a0c: /* cmd = 0x0c, get brightness */
+			len = 1;
+			response[2] = brightness;
+			printf("Get brightness, reply: %d\n", brightness);
+			break;
+		case 0x8a0e: /* cmd = 0x0e, set backlight power */
+			if (buf[2] != 0 && buf[2] != 1) {
+				fprintf(stderr, "Error invalid set power param: %d\n", buf[2]);
+				continue;
+			}
+
+			len = 0;
+			printf("Set power %d\n", buf[2]);
+			break;
+		default:
+			fprintf(stderr, "Error unknown cmd 0x%04x\n",
+				(buf[0] << 8) | buf[1]);
+			continue;
+		}
+
+		/* Respond with <total-len> <cmd> <data...> <csum> */
+		response[0] = len + 3; /* response length in bytes */
+		response[1] = buf[1];  /* ack cmd */
+		csum = dell_uart_checksum(response, len + 2);
+		response[len + 2] = csum;
+		ret = write(serial_fd, response, response[0]);
+		if (ret != (response[0]))
+			fprintf(stderr, "Error writing %d bytes: %d\n",
+				response[0], ret);
+	}
+
+	ret = 0;
+out_restore:
+	tcsetattr(serial_fd, TCSANOW, &saved_tty);
+out_close:
+	close(serial_fd);
+	return ret;
+}
-- 
2.44.0

