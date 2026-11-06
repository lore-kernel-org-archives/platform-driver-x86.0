Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794003831;
	b=HvckdgrNEZqJPh8CO8Ly8E8MFJfBqeHBISjYYYwaVCjghmtgo99FnDupuOw0rvZ/CZtC
	 4abD73/6LqxVqVB1LdKV/rbJuLYGz8wwPQPCdZUtRltyN+T1kmSqqyjSSmqqzACHVJ6S1
	 QEyLD6HkE6S5uWTXD3cb/+7yfh8XOwcw1di7SCs1fNNkJLedqt6H8XF/RiGZ6FKjN2ogS
	 7v5ZppA7sJKv4IfbzWeJIQhZ/TQjNmDA5hlYWg+HmcR8lbOI5DZlZpdM10SfJZRBbSg2a
	 SI+PEJCBZrNXAGbHOSUSOr4Aqk5IPK+izJc4Dz6V8tsnBBFFTponur1flrONAhwit0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794003831;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=sNmtmKxBXbXtnXzy36S5ifMWpujDgVfRK3RFFHB/W2w=;
	b=HKqy67zEmJpV36TsV887ewRl2+sZsDpVtK2JVZbb5czel9B9WNK7Zq6IGFjSZkAwHzzA
	 Bx/tdrlj1EORNgO2DOGZnDd4Rf9Qxoe0STDSjT/IxIOYzElsinDrV2ZrXrFX6lM3v0NGz
	 cKSL623HiuTDFfcvYa5DDTif/VUHq45bp5dO6Q4n5ZV+zvG1SxBfReTObxn9AIr/j1NAU
	 f27Gx+sDoPsdUkOTi1OoKDqOlDtkn51fUYXOwEkIY4t/on3gx2LHQin0HViK7hQqCrx4A
	 JO8mXBaFx0QtuFPzAM1ilOWo/yN3ojTHJCh7oTV+avIDEnMyDP8EN1XElJRQQ14bGtg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=c0IHE3xQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631F5606A326;
	Fri,  6 Nov 2026 22:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 631F5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=c0IHE3xQ
ARC-Seal: i=1; a=rsa-sha256; t=1794003794; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aCSc3GIVKZDaUG7LyPS5mU7wkuA7TZIrqphmAU8AWxychTR7WLxq4OAtJqDXbl+g2uLp/W8JBUMA8NkQNxtlLaqMONjVXtRWMr3dQaHESW6AvXKvTWItEkNpQtLFjw39q133/vhmFNx3uSagpSh/0++Eer2ZI92smew0o636fxc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794003794; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=sNmtmKxBXbXtnXzy36S5ifMWpujDgVfRK3RFFHB/W2w=; 
	b=XHhyA2A/onZwePjf5bp0Tm4UutZFS+3ZMgX+t6Uh+nWu+HgTMi7T07uPVeHazIfi+tgYXE/xSyvESl33O3++tf0Px9wBy0akchDztoZoOzJCVNRFWMxNCSDCOFQHKYGwSVA/+87YwnN2Acxfjf2ZBOBnbXqep4zxM8NkvjB5GUE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=c0IHE3xQVo4S2ti5LCheHwjji+beGKe4o52mO0b+bUP62P9qZex/TZ6kULO8BGiCX3UbvyzrfUt4KmBZW7ndYaB66syeKGzuWDsh0EZ6B7Z0+K/TX5F8sridNdJQnxdRNcEAN8DNBYJG740Ty2fMygJHbgoeM6gb9UZioNxZAKGTO9/0CBwc7uKO79/0MG+VV/56tJoXD3kDwYhxdOr581UKVXHLMOU3jv7roIzA/PRaRbkqfZfmL5OfW/kNm6vL1pGSfT2FdOrlOJAr4iaQkVL/a/GDkNNzo/PZkdTkZ9JBNhpF7a+8zCS2/P3RXgK25lUq5NKADIAunBeqZxhW6Q==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=sNmtmKxBXbXtnXzy36S5ifMWpujDgVfRK3RFFHB/W2w=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794003793347958.9821194253328;
	Fri, 6 Nov 2026 14:23:13 -0800 (PST)
From: Rong Zhang <i@rong.moe>
Date: Sat, 07 Nov 2026 06:22:51 +0800
Subject: [PATCH] platform/x86: thinkpad_acpi: Allow unlocking unsafe LEDs
 via debugfs
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-tpacpi-debugfs-unlock-unsafe-led-v1-1-69b1f1e10c2f@rong.moe>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ6CQAyF4auQru0CI9HxKsZFaTtYJQOZMsSEc
 HdHXb18m/9t4JpNHa7NBllXc5tSRXtogB+UBkWTagiRQsckuMzEs6FoX4boWNI48auOU1QcVbA
 9k5zCUS6xY6iZOWu09+/idv/bS/9UXr5d2PcPBnAxyYQAAAA=
X-Change-ID: 9fa95cad-tpacpi-debugfs-unlock-unsafe-led-17ad492d8f5c
To: Josh Triplett <josh@joshtriplett.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-6be7c
X-ZohoMailClient: External

Since commit a4d5effcc737 ("thinkpad-acpi: restrict access to some
firmware LEDs"), most LEDs are classified as unsafe and write access to
them is restricted by default.

To enable unrestricted access, users have to build the kernel on their
own with CONFIG_THINKPAD_ACPI_UNSAFE_LEDS enabled, as it's unsupported
and no distribution enables it.

The Kconfig option, for sure, acts as a gatekeeper very well, but it may
be too harsh when a user really has some sensible reasons to enable
unrestricted access. As a result, there have been several attempts to
loosen the restriction.

On the other hand, the Kconfig option has two additional flaws:

- It enables unrestricted access to all LEDs at once, rather than just
  those that the user needs
- It prints a notice message on probe, but can't really tell if the user
  has really tuned unsafe LEDs
- It doesn't taint the kernel to indicate the unsupported setup

To solve these issues, replace the Kconfig option with a debugfs
attribute `unlock_unsafe_led' attached to every unsafe LED. Considering
that debugfs is enabled on all major distributions, the attribute should
be widely available.

Unsafe LEDs are registered on probe, but with LED_SYSFS_DISABLE set to
disable write access. Users must write to the attribute to enable
unrestricted access per LED. This taints the kernel with TAINT_USER.

In this manner, the unlocked range is narrowed, with a tedious procedure
to enable unrestricted access on every boot. By implementing a runtime
switch and tainting the kernel, it indicates when the user is about to
tune unsafe LEDs and clearly indicate the unsupported setup.

Link: https://lore.kernel.org/all/20181113174136.58198c3a@gmail.com/
Link: https://lore.kernel.org/all/20250403040846.7834-1-martin@arp242.net/
Link: https://lore.kernel.org/all/a14640f58be48d4912ce5808faea1402ad7f7ad0.1793906572.git.josh@joshtriplett.org/
Signed-off-by: Rong Zhang <i@rong.moe>
---
 .../admin-guide/laptops/thinkpad-acpi.rst          | 15 ++--
 drivers/platform/x86/lenovo/Kconfig                | 23 ------
 drivers/platform/x86/lenovo/thinkpad_acpi.c        | 95 +++++++++++++++++++---
 3 files changed, 92 insertions(+), 41 deletions(-)

diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
index 60bf6868b849..be5211a2412b 100644
--- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
+++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
@@ -791,13 +791,16 @@ of the LED indicators.
 Because misuse of the LEDs could induce an unaware user to perform
 dangerous actions (like undocking or ejecting a bay device while the
 buses are still active), or mask an important alarm (such as a nearly
-empty battery, or a broken battery), access to most LEDs is
-restricted.
+empty battery, or a broken battery), most LEDs are classified as unsafe
+and write access to them is restricted by default.
 
-Unrestricted access to all LEDs requires that thinkpad-acpi be
-compiled with the CONFIG_THINKPAD_ACPI_UNSAFE_LEDS option enabled.
-Distributions must never enable this option.  Individual users that
-are aware of the consequences are welcome to enabling it.
+Individual users that are aware of the consequences may enable
+unrestricted access to desired unsafe LED with::
+
+	echo 1 >/sys/kernel/debug/tpacpi/led/<name>/unlock_unsafe_led
+
+This taints the kernel with TAINT_USER. Please always be aware of the
+danger of enabling unrestricted LED access.
 
 Audio mute and microphone mute LEDs are supported, but currently not
 visible to userspace. They are used by the snd-hda-intel audio driver.
diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/lenovo/Kconfig
index 516594993073..369f862e0d46 100644
--- a/drivers/platform/x86/lenovo/Kconfig
+++ b/drivers/platform/x86/lenovo/Kconfig
@@ -143,29 +143,6 @@ config THINKPAD_ACPI_DEBUG
 
 	  If you are not sure, say N here.
 
-config THINKPAD_ACPI_UNSAFE_LEDS
-	bool "Allow control of important LEDs (unsafe)"
-	depends on THINKPAD_ACPI
-	help
-	  Overriding LED state on ThinkPads can mask important
-	  firmware alerts (like critical battery condition), or misled
-	  the user into damaging the hardware (undocking or ejecting
-	  the bay while buses are still active), etc.
-
-	  LED control on the ThinkPad is write-only (with very few
-	  exceptions on very ancient models), which makes it
-	  impossible to know beforehand if important information will
-	  be lost when one changes LED state.
-
-	  Users that know what they are doing can enable this option
-	  and the driver will allow control of every LED, including
-	  the ones on the dock stations.
-
-	  Never enable this option on a distribution kernel.
-
-	  Say N here, unless you are building a kernel for your own
-	  use, and need to control the important firmware LEDs.
-
 config THINKPAD_ACPI_VIDEO
 	bool "Video output control support"
 	depends on THINKPAD_ACPI
diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 4f81855ad721..564fad46f5af 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -50,6 +50,7 @@
 #include <linux/input/sparse-keymap.h>
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
+#include <linux/kstrtox.h>
 #include <linux/kthread.h>
 #include <linux/leds.h>
 #include <linux/list.h>
@@ -57,6 +58,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/nvram.h>
+#include <linux/panic.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/platform_profile.h>
@@ -428,6 +430,7 @@ enum led_status_t {
 /* tpacpi LED class */
 struct tpacpi_led_classdev {
 	struct led_classdev led_classdev;
+	struct dentry *dbg;
 	int led;
 };
 
@@ -5608,17 +5611,59 @@ static const char * const tpacpi_led_names[TPACPI_LED_NUMLEDS] = {
 	"tpacpi::unknown_led3",
 	"tpacpi::thinkvantage",
 };
-#define TPACPI_SAFE_LEDS	0x1481U
+
+static unsigned long tpacpi_unlocked_leds = 0x1481U;
 
 static inline bool tpacpi_is_led_restricted(const unsigned int led)
 {
-#ifdef CONFIG_THINKPAD_ACPI_UNSAFE_LEDS
-	return false;
-#else
-	return (1U & (TPACPI_SAFE_LEDS >> led)) == 0;
-#endif
+	return !test_bit(led, &tpacpi_unlocked_leds);
+}
+
+/* sysfs unlock_unsafe_led - accessed via debugfs ---------------------- */
+
+static struct dentry *tpacpi_led_dbg;
+
+static int unlock_unsafe_led_show(struct seq_file *s, void *unused)
+{
+	struct tpacpi_led_classdev *data = s->private;
+
+	seq_printf(s, "%u\n", !tpacpi_is_led_restricted(data->led));
+	return 0;
 }
 
+static ssize_t unlock_unsafe_led_write(struct file *file, const char __user *buf,
+				       size_t count, loff_t *ppos)
+{
+	struct seq_file *s = file->private_data;
+	struct tpacpi_led_classdev *data = s->private;
+	struct led_classdev *led_cdev = &data->led_classdev;
+	bool unlock;
+	int ret;
+
+	ret = kstrtobool_from_user(buf, count, &unlock);
+	if (ret)
+		return ret;
+
+	/* One-way switch. */
+	if (!unlock)
+		return tpacpi_is_led_restricted(data->led) ? count : -EBUSY;
+
+	if (test_and_set_bit(data->led, &tpacpi_unlocked_leds))
+		return count;
+
+	dev_notice(led_cdev->dev,
+		   "userspace override of important firmware LED is enabled - tainting kernel\n");
+	add_taint(TAINT_USER, LOCKDEP_STILL_OK);
+
+	guard(mutex)(&led_cdev->led_access);
+	led_sysfs_enable(led_cdev);
+
+	return count;
+}
+DEFINE_SHOW_STORE_ATTRIBUTE(unlock_unsafe_led);
+
+/* --------------------------------------------------------------------- */
+
 static int led_get_status(const unsigned int led)
 {
 	int status;
@@ -5752,14 +5797,19 @@ static void led_exit(void)
 {
 	unsigned int i;
 
-	for (i = 0; i < TPACPI_LED_NUMLEDS; i++)
+	for (i = 0; i < TPACPI_LED_NUMLEDS; i++) {
+		debugfs_remove_recursive(tpacpi_leds[i].dbg);
 		led_classdev_unregister(&tpacpi_leds[i].led_classdev);
+	}
 
 	kfree(tpacpi_leds);
 }
 
 static int __init tpacpi_init_led(unsigned int led)
 {
+	bool restricted;
+	int ret;
+
 	/* LEDs with no name don't get registered */
 	if (!tpacpi_led_names[led])
 		return 0;
@@ -5773,7 +5823,30 @@ static int __init tpacpi_init_led(unsigned int led)
 	tpacpi_leds[led].led_classdev.flags = LED_RETAIN_AT_SHUTDOWN;
 	tpacpi_leds[led].led = led;
 
-	return led_classdev_register(&tpacpi_pdev->dev, &tpacpi_leds[led].led_classdev);
+	/*
+	 * Disable write access to unsafe LEDs. If the user really knows what
+	 * they are doing, they can enable it at the cost of tainting the
+	 * kernel.
+	 *
+	 * Read access on TPACPI_LED_570 should be safe.
+	 */
+	restricted = tpacpi_is_led_restricted(led);
+	if (restricted)
+		tpacpi_leds[led].led_classdev.flags |= LED_SYSFS_DISABLE;
+
+	ret = led_classdev_register(&tpacpi_pdev->dev, &tpacpi_leds[led].led_classdev);
+	if (ret)
+		return ret;
+
+	if (!restricted)
+		return 0;
+
+	tpacpi_leds[led].dbg = debugfs_create_dir(dev_name(tpacpi_leds[led].led_classdev.dev),
+						  tpacpi_led_dbg);
+	debugfs_create_file("unlock_unsafe_led", 0600, tpacpi_leds[led].dbg,
+			    &tpacpi_leds[led], &unlock_unsafe_led_fops);
+
+	return 0;
 }
 
 static const struct tpacpi_quirk led_useful_qtable[] __initconst = {
@@ -5883,7 +5956,7 @@ static int __init led_init(struct ibm_init_struct *iibm)
 	for (i = 0; i < TPACPI_LED_NUMLEDS; i++) {
 		tpacpi_leds[i].led = -1;
 
-		if (!tpacpi_is_led_restricted(i) && test_bit(i, &useful_leds)) {
+		if (test_bit(i, &useful_leds)) {
 			rc = tpacpi_init_led(i);
 			if (rc < 0) {
 				led_exit();
@@ -5892,9 +5965,6 @@ static int __init led_init(struct ibm_init_struct *iibm)
 		}
 	}
 
-#ifdef CONFIG_THINKPAD_ACPI_UNSAFE_LEDS
-	pr_notice("warning: userspace override of important firmware LEDs is enabled\n");
-#endif
 	return 0;
 }
 
@@ -11678,6 +11748,7 @@ static struct dentry *tpacpi_dbg;
 static void tpacpi_debugfs_init(void)
 {
 	tpacpi_dbg = debugfs_create_dir("tpacpi", NULL);
+	tpacpi_led_dbg = debugfs_create_dir("led", tpacpi_dbg);
 
 	/* HWDD raw data */
 	debugfs_create_file("hwdd-raw", 0444, tpacpi_dbg, NULL, &hwdd_raw_fops);

---
base-commit: a91337fb5e8e0127c8b5be87be9f3027f95b48bc
change-id: 9fa95cad-tpacpi-debugfs-unlock-unsafe-led-17ad492d8f5c

Thanks,
Rong

