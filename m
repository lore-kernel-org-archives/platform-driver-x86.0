From: Matteo Croce <mcroce@redhat.com>
Subject: [PATCH 3/4] bug: use the aural error reporting framework to report warnings
Date: Mon,  1 Apr 2019 12:24:54 +0200
Message-ID: <20190401102456.11162-4-mcroce@redhat.com>
References: <20190401102456.11162-1-mcroce@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190401102456.11162-1-mcroce@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: x86@kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Use the new aural error reporting framework to signal kernel bugs. Emit the
sound at the end of the __warn(), so the WARN_* are all covered.
If panic_on_warn is set, panic() will play its sound and never return,
so there is no risk to emit two sounds or the wrong one.

Signed-off-by: Matteo Croce <mcroce@redhat.com>
---
 kernel/panic.c    | 18 ++++++++++++++++++
 lib/Kconfig.debug | 10 ++++++++++
 2 files changed, 28 insertions(+)

diff --git a/kernel/panic.c b/kernel/panic.c
index 360578e092e7..b87c4403924d 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -81,6 +81,22 @@ static struct note panic_sound[] = {
 };
 #endif
 
+#ifdef CONFIG_AUDIBLE_WARN
+static struct note warn_sound[] = {
+	{ 440, 400 },
+	{ 440, 300 },
+	{ 440, 100 },
+	{ 440, 400 },
+	{ 523, 300 },
+	{ 494, 100 },
+	{ 494, 300 },
+	{ 440, 100 },
+	{ 440, 300 },
+	{ 440, 100 },
+	{ 440, 800 },
+};
+#endif
+
 static long no_blink(int state)
 {
 	return 0;
@@ -609,6 +625,8 @@ void __warn(const char *file, int line, void *caller, unsigned taint,
 
 	/* Just a warning, don't kill lockdep. */
 	add_taint(taint, LOCKDEP_STILL_OK);
+
+	play(warn_sound, ARRAY_SIZE(warn_sound));
 }
 
 #ifdef WANT_WARN_ON_SLOWPATH
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index e5d187dfc74a..909c271d283b 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1007,6 +1007,16 @@ config AUDIBLE_PANIC
 	  the system buzzer and not via any soundcard.
 	  Not available on all platforms.
 
+config AUDIBLE_WARN
+	bool "Aural warning"
+	select PLAY_LIB
+	default n
+	help
+	  If you say Y here, warnings will play a sound just
+	  after the stacktrace and registers dump. The sound is played via
+	  the system buzzer and not via any soundcard.
+	  Not available on all platforms.
+
 config SCHED_DEBUG
 	bool "Collect scheduler debugging info"
 	depends on DEBUG_KERNEL && PROC_FS
-- 
2.20.1
