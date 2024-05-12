Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F5F46433
	for <platform-driver-x86@vger.kernel.org>; Sun, 12 May 2024 16:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715531048; cv=none; b=j8IZnDeFkhg3YtoCMTMzNkC0JMazV/PjyvT3E9RZc+31XU1SCtiAT+20+3yqpP1W7rHP+I6yJpolTGF3aLWW8ikw55eskplVDRqVk2/JyvzD2cVXPvSIm0vTfk2MtvEuDF1tTBapzOiZZVrydqiQWmNkWTb8UZuVpP2uKwx0bSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715531048; c=relaxed/simple;
	bh=Fj14SxdreDyHc3GoIDWlnNwGIi4l3u8eXFXsqy6u59Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OeNvrmNxODpVKwRrzYOjxNcnXY3jscox0YXBPioPVOw6ZRbPNKksZlFeHSL6Yew78snZwOAsU7yOJaG+R8+4ZG/bHTQCBiKoaUTjpLflFjs0AOE/91bfZgRXozq54+6AnHekPqfZ3nAwvYN9e/ppPL8/vya2nuo+kgZBLZlsaxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NrWF8JRv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NrWF8JRv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715531045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3Gc3ha3RVCyyNUz+rZ63SbLHxs8Px7ZXHPKWawyRvGg=;
	b=NrWF8JRvRgmyTe6Onnwkd8aXI1VAOuk/j3SDeP9a3vhAmc5SXMVNDv9mqzzoma8DZNi7ux
	qmwPpQO/vmP2pXMVnbZroVgUNm9nYPBFiZcVhSQWGX5VhMwvcZWj7YUrti9SEEG4JrRvsb
	RyW9947dPWa+1wFDrvRjmdeX6JiThl0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-pr1bfRwSOFuPWTazCu2N6Q-1; Sun, 12 May 2024 12:24:03 -0400
X-MC-Unique: pr1bfRwSOFuPWTazCu2N6Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 995C3185A780;
	Sun, 12 May 2024 16:24:02 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C05D1966;
	Sun, 12 May 2024 16:24:01 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	AceLan Kao <acelan.kao@canonical.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Kai-Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/2] tools arch x86: Add dell-uart-backlight-emulator
Date: Sun, 12 May 2024 18:23:52 +0200
Message-ID: <20240512162353.46693-3-hdegoede@redhat.com>
In-Reply-To: <20240512162353.46693-1-hdegoede@redhat.com>
References: <20240512162353.46693-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1

Dell All In One (AIO) models released after 2017 use a backlight controller
board connected to an UART.

Add a small emulator to allow development and testing of
the drivers/platform/x86/dell/dell-uart-backlight.c driver for
this board, without requiring access to an actual Dell All In One.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../dell-uart-backlight-emulator/.gitignore   |   1 +
 .../x86/dell-uart-backlight-emulator/Makefile |  19 ++
 .../x86/dell-uart-backlight-emulator/README   |  46 +++++
 .../dell-uart-backlight-emulator.c            | 166 ++++++++++++++++++
 4 files changed, 232 insertions(+)
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
index 000000000000..35c77ca3c695
--- /dev/null
+++ b/tools/arch/x86/dell-uart-backlight-emulator/dell-uart-backlight-emulator.c
@@ -0,0 +1,166 @@
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
+		case 0x6a06:
+			/* cmd = 0x06, get version */
+			len = strlen(version_str);
+			strcpy((char *)&response[2], version_str);
+			printf("Get version, reply: %s\n", version_str);
+			break;
+		case 0x8a0b: /* 3 MSB bits: cmd-len + 01010 SOF marker */
+			/* cmd = 0x0b, set brightness */
+			if (buf[2] > 100) {
+				fprintf(stderr, "Error invalid brightness param: %d\n", buf[2]);
+				continue;
+			}
+
+			len = 0;
+			brightness = buf[2];
+			printf("Set brightness %d\n", brightness);
+			break;
+		case 0x6a0c:
+			/* cmd = 0x0c, get brightness */
+			len = 1;
+			response[2] = brightness;
+			printf("Get brightness, reply: %d\n", brightness);
+			break;
+		case 0x8a0e:
+			/* cmd = 0x0e, set backlight power */
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
+		ret = write(serial_fd, response, len + 3);
+		if (ret != (len + 3))
+			fprintf(stderr, "Error writing %d bytes: %d\n",
+				len + 3, ret);
+	}
+
+out_restore:
+	tcsetattr(serial_fd, TCSANOW, &saved_tty);
+out_close:
+	close(serial_fd);
+	return ret;
+}
-- 
2.44.0

