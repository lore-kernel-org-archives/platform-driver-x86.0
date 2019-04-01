From: Matteo Croce <mcroce@redhat.com>
Subject: [PATCH 2/4] panic: use the aural error reporting framework to report panics
Date: Mon,  1 Apr 2019 12:24:53 +0200
Message-ID: <20190401102456.11162-3-mcroce@redhat.com>
References: <20190401102456.11162-1-mcroce@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190401102456.11162-1-mcroce@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: x86@kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Use the new aural error reporting framework to signal kernel panic. The
error sound is emitted between the stack dump and the kexec jump.

Signed-off-by: Matteo Croce <mcroce@redhat.com>
---
 kernel/panic.c    | 25 +++++++++++++++++++++++++
 lib/Kconfig.debug | 10 ++++++++++
 2 files changed, 35 insertions(+)

diff --git a/kernel/panic.c b/kernel/panic.c
index 0ae0d7332f12..360578e092e7 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -29,6 +29,7 @@
 #include <linux/bug.h>
 #include <linux/ratelimit.h>
 #include <linux/debugfs.h>
+#include <linux/play.h>
 #include <asm/sections.h>
 
 #define PANIC_TIMER_STEP 100
@@ -57,6 +58,29 @@ ATOMIC_NOTIFIER_HEAD(panic_notifier_list);
 
 EXPORT_SYMBOL(panic_notifier_list);
 
+#ifdef CONFIG_AUDIBLE_PANIC
+static struct note panic_sound[] = {
+	{ 784, 400 },
+	{ 784, 400 },
+	{ 784, 400 },
+	{ 622, 300 },
+	{ 932, 100 },
+	{ 784, 400 },
+	{ 622, 300 },
+	{ 932, 100 },
+	{ 784, 800 },
+	{ 1174, 400 },
+	{ 1174, 400 },
+	{ 1174, 400 },
+	{ 1244, 300 },
+	{ 932, 100 },
+	{ 740, 400 },
+	{ 622, 300 },
+	{ 932, 100 },
+	{ 784, 800 },
+};
+#endif
+
 static long no_blink(int state)
 {
 	return 0;
@@ -213,6 +237,7 @@ void panic(const char *fmt, ...)
 	if (!test_taint(TAINT_DIE) && oops_in_progress <= 1)
 		dump_stack();
 #endif
+	play(panic_sound, ARRAY_SIZE(panic_sound));
 
 	/*
 	 * If we have crashed and we have a crash kernel loaded let it handle
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 10d04b266aef..e5d187dfc74a 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -997,6 +997,16 @@ config PLAY_LIB
 	depends on HAVE_PCSPKR_PLATFORM
 	default n
 
+config AUDIBLE_PANIC
+	bool "Aural panic"
+	select PLAY_LIB
+	default n
+	help
+	  If you say Y here, kernel panics will play a sound just
+	  after the stacktrace and registers dump. The sound is played via
+	  the system buzzer and not via any soundcard.
+	  Not available on all platforms.
+
 config SCHED_DEBUG
 	bool "Collect scheduler debugging info"
 	depends on DEBUG_KERNEL && PROC_FS
-- 
2.20.1
