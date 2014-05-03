From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH 2/2] Documentation: Rename hpfall.c => freefall.c, fixes for Dell
Date: Sat,  3 May 2014 12:47:57 +0200
Message-ID: <1399114077-19314-3-git-send-email-pali.rohar@gmail.com>
References: <1399114077-19314-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f45.google.com ([74.125.82.45]:54431 "EHLO
	mail-wg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751975AbaECKtL (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 3 May 2014 06:49:11 -0400
In-Reply-To: <1399114077-19314-1-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org, Sonal Santan <sonal.santan@gmail.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>

Dell kernel driver dell-smo8800 provides same freefall interface as hp_=
accel so
program hpfall.c works also on Dell laptops. So rename it to freefall.c=
=2E

Dell driver does not provide hp::hddprotect led so make sure that freef=
all.c
works also if hp::hddprotect does not exist in sysfs.

Additionally write info to syslog.

Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
Cc: Sonal Santan <sonal.santan@gmail.com>
---
 Documentation/laptops/00-INDEX   |    4 +-
 Documentation/laptops/freefall.c |  171 ++++++++++++++++++++++++++++++=
++++++++
 Documentation/laptops/hpfall.c   |  146 ------------------------------=
--
 3 files changed, 173 insertions(+), 148 deletions(-)
 create mode 100644 Documentation/laptops/freefall.c
 delete mode 100644 Documentation/laptops/hpfall.c

diff --git a/Documentation/laptops/00-INDEX b/Documentation/laptops/00-=
INDEX
index d13b9a9..d399ae1 100644
--- a/Documentation/laptops/00-INDEX
+++ b/Documentation/laptops/00-INDEX
@@ -8,8 +8,8 @@ disk-shock-protection.txt
 	- information on hard disk shock protection.
 dslm.c
 	- Simple Disk Sleep Monitor program
-hpfall.c
-	- (HP) laptop accelerometer program for disk protection.
+freefall.c
+	- (HP/DELL) laptop accelerometer program for disk protection.
 laptop-mode.txt
 	- how to conserve battery power using laptop-mode.
 sony-laptop.txt
diff --git a/Documentation/laptops/freefall.c b/Documentation/laptops/f=
reefall.c
new file mode 100644
index 0000000..4d4d90a
--- /dev/null
+++ b/Documentation/laptops/freefall.c
@@ -0,0 +1,171 @@
+/* Disk protection for HP/DELL machines.
+ *
+ * Copyright 2008 Eric Piel
+ * Copyright 2009 Pavel Machek <pavel@ucw.cz>
+ * Copyright 2012 Sonal Santan
+ * Copyright 2014 Pali Roh=C3=A1r <pali.rohar@gmail.com>
+ *
+ * GPLv2.
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <fcntl.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <string.h>
+#include <stdint.h>
+#include <errno.h>
+#include <signal.h>
+#include <sys/mman.h>
+#include <sched.h>
+#include <syslog.h>
+
+static int noled;
+static char unload_heads_path[64];
+static char device_path[32];
+static const char app_name[] =3D "FREE FALL";
+
+static int set_unload_heads_path(char *device)
+{
+	char devname[64];
+
+	if (strlen(device) <=3D 5 || strncmp(device, "/dev/", 5) !=3D 0)
+		return -EINVAL;
+	strncpy(devname, device + 5, sizeof(devname) - 1);
+	strncpy(device_path, device, sizeof(device_path) - 1);
+
+	snprintf(unload_heads_path, sizeof(unload_heads_path) - 1,
+				"/sys/block/%s/device/unload_heads", devname);
+	return 0;
+}
+
+static int valid_disk(void)
+{
+	int fd =3D open(unload_heads_path, O_RDONLY);
+	if (fd < 0) {
+		perror(unload_heads_path);
+		return 0;
+	}
+
+	close(fd);
+	return 1;
+}
+
+static void write_int(char *path, int i)
+{
+	char buf[1024];
+	int fd =3D open(path, O_RDWR);
+	if (fd < 0) {
+		perror("open");
+		exit(1);
+	}
+	sprintf(buf, "%d", i);
+	if (write(fd, buf, strlen(buf)) !=3D strlen(buf)) {
+		perror("write");
+		exit(1);
+	}
+	close(fd);
+}
+
+static void set_led(int on)
+{
+	if (noled)
+		return;
+	write_int("/sys/class/leds/hp::hddprotect/brightness", on);
+}
+
+static void protect(int seconds)
+{
+	const char *str =3D (seconds =3D=3D 0) ? "Unparked" : "Parked";
+	write_int(unload_heads_path, seconds*1000);
+	syslog(LOG_INFO, "%s %s disk head\n", str, device_path);
+}
+
+static int on_ac(void)
+{
+	/* /sys/class/power_supply/AC0/online */
+	return 1;
+}
+
+static int lid_open(void)
+{
+	/* /proc/acpi/button/lid/LID/state */
+	return 1;
+}
+
+static void ignore_me(int signum)
+{
+	protect(0);
+	set_led(0);
+}
+
+int main(int argc, char **argv)
+{
+	int fd, ret;
+	struct stat st;
+	struct sched_param param;
+
+	if (argc =3D=3D 1)
+		ret =3D set_unload_heads_path("/dev/sda");
+	else if (argc =3D=3D 2)
+		ret =3D set_unload_heads_path(argv[1]);
+	else
+		ret =3D -EINVAL;
+
+	if (ret || !valid_disk()) {
+		fprintf(stderr, "usage: %s <device> (default: /dev/sda)\n",
+				argv[0]);
+		exit(1);
+	}
+
+	fd =3D open("/dev/freefall", O_RDONLY);
+	if (fd < 0) {
+		perror("/dev/freefall");
+		return EXIT_FAILURE;
+	}
+
+	if (stat("/sys/class/leds/hp::hddprotect/brightness", &st))
+		noled =3D 1;
+
+	if (daemon(0, 0) !=3D 0) {
+		perror("daemon");
+		return EXIT_FAILURE;
+	}
+
+	openlog(app_name,  LOG_CONS | LOG_PID | LOG_NDELAY, LOG_LOCAL1);
+
+	param.sched_priority =3D sched_get_priority_max(SCHED_FIFO);
+	sched_setscheduler(0, SCHED_FIFO, &param);
+	mlockall(MCL_CURRENT|MCL_FUTURE);
+
+	signal(SIGALRM, ignore_me);
+
+	for (;;) {
+		unsigned char count;
+
+		ret =3D read(fd, &count, sizeof(count));
+		alarm(0);
+		if ((ret =3D=3D -1) && (errno =3D=3D EINTR)) {
+			/* Alarm expired, time to unpark the heads */
+			continue;
+		}
+
+		if (ret !=3D sizeof(count)) {
+			perror("read");
+			break;
+		}
+
+		protect(21);
+		set_led(1);
+		if (1 || on_ac() || lid_open())
+			alarm(2);
+		else
+			alarm(20);
+	}
+
+	closelog();
+	close(fd);
+	return EXIT_SUCCESS;
+}
diff --git a/Documentation/laptops/hpfall.c b/Documentation/laptops/hpf=
all.c
deleted file mode 100644
index b85dbba..0000000
--- a/Documentation/laptops/hpfall.c
+++ /dev/null
@@ -1,146 +0,0 @@
-/* Disk protection for HP machines.
- *
- * Copyright 2008 Eric Piel
- * Copyright 2009 Pavel Machek <pavel@ucw.cz>
- *
- * GPLv2.
- */
-
-#include <stdio.h>
-#include <stdlib.h>
-#include <unistd.h>
-#include <fcntl.h>
-#include <sys/stat.h>
-#include <sys/types.h>
-#include <string.h>
-#include <stdint.h>
-#include <errno.h>
-#include <signal.h>
-#include <sys/mman.h>
-#include <sched.h>
-
-char unload_heads_path[64];
-
-int set_unload_heads_path(char *device)
-{
-	char devname[64];
-
-	if (strlen(device) <=3D 5 || strncmp(device, "/dev/", 5) !=3D 0)
-		return -EINVAL;
-	strncpy(devname, device + 5, sizeof(devname));
-
-	snprintf(unload_heads_path, sizeof(unload_heads_path) - 1,
-				"/sys/block/%s/device/unload_heads", devname);
-	return 0;
-}
-int valid_disk(void)
-{
-	int fd =3D open(unload_heads_path, O_RDONLY);
-	if (fd < 0) {
-		perror(unload_heads_path);
-		return 0;
-	}
-
-	close(fd);
-	return 1;
-}
-
-void write_int(char *path, int i)
-{
-	char buf[1024];
-	int fd =3D open(path, O_RDWR);
-	if (fd < 0) {
-		perror("open");
-		exit(1);
-	}
-	sprintf(buf, "%d", i);
-	if (write(fd, buf, strlen(buf)) !=3D strlen(buf)) {
-		perror("write");
-		exit(1);
-	}
-	close(fd);
-}
-
-void set_led(int on)
-{
-	write_int("/sys/class/leds/hp::hddprotect/brightness", on);
-}
-
-void protect(int seconds)
-{
-	write_int(unload_heads_path, seconds*1000);
-}
-
-int on_ac(void)
-{
-//	/sys/class/power_supply/AC0/online
-}
-
-int lid_open(void)
-{
-//	/proc/acpi/button/lid/LID/state
-}
-
-void ignore_me(void)
-{
-	protect(0);
-	set_led(0);
-}
-
-int main(int argc, char **argv)
-{
-	int fd, ret;
-	struct sched_param param;
-
-	if (argc =3D=3D 1)
-		ret =3D set_unload_heads_path("/dev/sda");
-	else if (argc =3D=3D 2)
-		ret =3D set_unload_heads_path(argv[1]);
-	else
-		ret =3D -EINVAL;
-
-	if (ret || !valid_disk()) {
-		fprintf(stderr, "usage: %s <device> (default: /dev/sda)\n",
-				argv[0]);
-		exit(1);
-	}
-
-	fd =3D open("/dev/freefall", O_RDONLY);
-	if (fd < 0) {
-		perror("/dev/freefall");
-		return EXIT_FAILURE;
-	}
-
-	daemon(0, 0);
-	param.sched_priority =3D sched_get_priority_max(SCHED_FIFO);
-	sched_setscheduler(0, SCHED_FIFO, &param);
-	mlockall(MCL_CURRENT|MCL_FUTURE);
-
-	signal(SIGALRM, ignore_me);
-
-	for (;;) {
-		unsigned char count;
-
-		ret =3D read(fd, &count, sizeof(count));
-		alarm(0);
-		if ((ret =3D=3D -1) && (errno =3D=3D EINTR)) {
-			/* Alarm expired, time to unpark the heads */
-			continue;
-		}
-
-		if (ret !=3D sizeof(count)) {
-			perror("read");
-			break;
-		}
-
-		protect(21);
-		set_led(1);
-		if (1 || on_ac() || lid_open())
-			alarm(2);
-		else
-			alarm(20);
-	}
-
-	close(fd);
-	return EXIT_SUCCESS;
-}
--=20
1.7.9.5
