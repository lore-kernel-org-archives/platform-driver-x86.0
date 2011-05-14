From: Andy Lutomirski <luto@MIT.EDU>
Subject: [PATCH v3] thinkpad-acpi: Improve hardware volume controls
Date: Sat, 14 May 2011 11:34:25 -0400
Message-ID: <75329ac2644b3832911882e23e9308c3dc88518c.1305386829.git.luto@mit.edu>
References: <20110512204213.GA8776@core.coreip.homeip.net>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from DMZ-MAILSEC-SCANNER-4.MIT.EDU ([18.9.25.15]:63543 "EHLO
	dmz-mailsec-scanner-4.mit.edu" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757560Ab1ENPem (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 14 May 2011 11:34:42 -0400
In-Reply-To: <20110512204213.GA8776@core.coreip.homeip.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Dmitry Torokhov <dmitr>
Cc: Bruce Hill <bruce@slackwarebox.com>, Andy Lutomirski <luto@mit.edu>

ThinkPads have hardware volume controls and three buttons to control
them.  (These are separate from the standard mixer.)  By default,
the buttons are:

 - Mute: Mutes the hardware volume control and generates KEY_MUTE.
 - Up: Unmutes, generates KEY_VOLUMEUP, and increases volume if
   applicable.  (Newer thinkpads only have hardware mute/unmute.)
 - Down: Unmutes, generates KEY_VOLUMEDOWN, and decreases volume
   if applicable.

This behavior is unfortunate, since modern userspace will also
handle the hotkeys and change the other mixer.  If the software
mixer is muted and the hardware mixer is unmuted and you push mute,
hilarity ensues as they both switch state.

For better or worse, the ThinkPad ACPI code checks _OSI(Linux) and
changes the behavior of the buttons to generate keypresses and do
nothing else.  This is an improvement, since the hardware mixer
isn't really necessary.  We only set _OSI(Linux) on a very small
set of modles, though.

It's worse on very new ThinkPads like the X220, which have a mute
indicator controlled by the hardware mixer.  The only way to make
it work is to have the mute button control the hardware mixer (or
to have some userspace hack to change the hardware mixer when you
ask for "mute").

It turns out that we can ask ACPI for one of three behaviors
directly.  They are "latch" (the default), "none" (no automatic
control), and "toggle" (mute unmutes when muted).  So we let the
user control the mode through sysfs, and we don't generate KEY_MUTE
in any mode other than "none".

As an added bonus, we fix an old bug: the hardware mute control
doesn't generate an ALSA change notification on newer ThinkPads.

Signed-off-by: Andy Lutomirski <luto@mit.edu>
---

Dmitry-

This would IMO be prettier if we could install the hook at the serio
level instead of the i8042 level.  As it stands, there's some
duplicated logic and some ugly code to figure out exactly what to send
to serio_interrupt when we get a normal extended key.

Changes from v2:
 - Use an i8042 platform filter instead of an input filter.
 - Don't generate ALSA notification on hotkey release.

Changes from v1:
 - Read HAUM on startup, which gives the correct default (toggle)
   on X220 and should preserve the "none" behavior on systems that
   set acpi_osi=Linux.
 - Enable all of the controls on systems with hardware volume control,
   for ease of testing.
 - Back out HKEY modifications that didn't do anything -- that code
   was already correct.

 drivers/platform/x86/thinkpad_acpi.c |  243 ++++++++++++++++++++++++++++++++++
 1 files changed, 243 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 4025d84..91d1a18 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -73,6 +73,8 @@
 #include <linux/leds.h>
 #include <linux/rfkill.h>
 #include <asm/uaccess.h>
+#include <linux/i8042.h>
+#include <linux/serio.h>
 
 #include <linux/dmi.h>
 #include <linux/jiffies.h>
@@ -6453,6 +6455,15 @@ static struct ibm_struct brightness_driver_data = {
  * bits 3-0 (volume).  Other bits in NVRAM may have other functions,
  * such as bit 7 which is used to detect repeated presses of MUTE,
  * and we leave them unchanged.
+ *
+ * The firmware can optionally automatically change the volume
+ * in response to user input.  Historically, we've assumed that this
+ * feature is off (and we've quirked _OSI="Linux" to get this behavior),
+ * so, if we can't find the explicit control we keep the historical
+ * behavior.
+ *
+ * On new Lenovos (e.g. X220), the mute button has an indicator light,
+ * so it's nice to get this right.
  */
 
 #ifdef CONFIG_THINKPAD_ACPI_ALSA_SUPPORT
@@ -6502,12 +6513,28 @@ enum tpacpi_volume_capabilities {
 	TPACPI_VOL_CAP_MAX
 };
 
+enum tpacpi_volume_autocontrol {
+	TPACPI_VOL_AUTO_LATCH  = 0,	/* Mute mutes; up/down unmutes */
+	/* 1 might be the same as 2 */
+	TPACPI_VOL_AUTO_NONE   = 2,	/* No automatic control at all */
+	TPACPI_VOL_AUTO_TOGGLE = 3,	/* Mute toggles; up/down unmutes */
+};
+
+static const char *tpacpi_volume_autocontrol_names[] = {
+	[TPACPI_VOL_AUTO_LATCH] = "latch",
+	[TPACPI_VOL_AUTO_NONE] = "none",
+	[TPACPI_VOL_AUTO_TOGGLE] = "toggle",
+};
+
 static enum tpacpi_volume_access_mode volume_mode =
 	TPACPI_VOL_MODE_MAX;
 
 static enum tpacpi_volume_capabilities volume_capabilities;
 static int volume_control_allowed;
 
+static enum tpacpi_volume_autocontrol volume_autocontrol = TPACPI_VOL_AUTO_NONE;
+static bool volume_autocontrol_configurable = false;
+
 /*
  * Used to syncronize writers to TP_EC_AUDIO and
  * TP_NVRAM_ADDR_MIXER, as we need to do read-modify-write
@@ -6667,6 +6694,167 @@ unlock:
 	return rc;
 }
 
+static int volume_set_autocontrol(enum tpacpi_volume_autocontrol val)
+{
+	int rc = 0;
+	int result;
+
+	if (!volume_autocontrol_configurable)
+		return -EIO;
+
+	if (mutex_lock_killable(&volume_mutex) < 0)
+		return -EINTR;
+
+	if (!acpi_evalf(ec_handle, &result, "SAUM", "qdd", (int)val)) {
+		rc = -EIO;
+		goto out;
+	}
+
+	/* On success, SAUM returns what it programmed. */
+	if (result != val) {
+		rc = -EIO;
+		goto out;
+	}
+
+	volume_autocontrol = val;
+
+out:
+	mutex_unlock(&volume_mutex);
+	return rc;
+}
+
+/* This should only be used at startup.  We keep a shadow for later use. */
+static int volume_read_autocontrol(enum tpacpi_volume_autocontrol *ret)
+{
+	int result;
+
+	if (!acpi_evalf(ec_handle, &result, "HAUM", "qd"))
+		return -EIO;
+
+	if (result < 0 ||
+	    result >= ARRAY_SIZE(tpacpi_volume_autocontrol_names) ||
+	    !tpacpi_volume_autocontrol_names[result])
+		return -EINVAL;
+
+	*ret = result;
+	return 0;
+}
+
+static void volume_alsa_notify_change(void);
+
+static bool tpacpi_i8042_filter(unsigned char data, unsigned char str,
+				struct serio *port)
+{
+	bool steal_event = false;
+
+	/* Was the last event extended and, if so, what was its str? */
+	static bool extended;
+	static unsigned char extended_str;
+	static struct serio *extended_port;
+
+	bool prev_extended;
+	unsigned char prev_extended_str;
+	struct serio *prev_extended_port;
+
+	/* Don't mess with the AUX port. */
+	if (port->id.type != SERIO_8042_XL)
+		return false;
+
+	/* Save the previous extended prefix, if any */
+	prev_extended = extended;
+	prev_extended_str = extended_str;
+	prev_extended_port = extended_port;
+	extended = 0;
+
+	/* Paranoia: we shouldn't see AUX messages here. */
+	WARN_ON_ONCE(str & 0x20);
+
+	if (data == 0xe0) {
+		/* Beginning of an extended event.  Steal it for now. */
+		extended = true;
+		extended_str = str;
+		extended_port = port;
+		steal_event = true;
+	} else if (prev_extended &&
+		   volume_autocontrol != TPACPI_VOL_AUTO_NONE) {
+		/* Rest of an extended event.  Which one? */
+		switch (data) {
+		case 0x20: /* press mute (or hold mute) */
+			volume_alsa_notify_change();
+			/* fall through */
+		case 0xA0: /* release mute */
+			steal_event = true;
+			break;
+
+		case 0x2E: /* volume up */
+		case 0x30: /* volume down */
+			volume_alsa_notify_change();
+			break;
+		}
+	}
+
+	/* Reinject the previous 0xe0 if we ate it. */
+	if (prev_extended && !WARN_ON_ONCE(prev_extended_port != port))
+		serio_interrupt(port, 0xe0,
+				(prev_extended_str & 80) ? SERIO_PARITY : 0);
+
+	return steal_event;
+}
+
+static ssize_t volume_autocontrol_show(struct device *dev,
+				       struct device_attribute *attr,
+				       char *buf)
+{
+	ssize_t ret;
+
+	ret = mutex_lock_killable(&volume_mutex);
+	if (ret < 0)
+		return ret;
+
+	ret = snprintf(buf, PAGE_SIZE, "%s\n",
+		       tpacpi_volume_autocontrol_names[volume_autocontrol]);
+
+	mutex_unlock(&volume_mutex);
+	return ret;
+}
+
+static ssize_t volume_autocontrol_store(struct device *dev,
+					struct device_attribute *attr,
+					const char *buf, size_t count)
+{
+	int i;
+	const char *p;
+	size_t len;
+
+	p = memchr(buf, '\n', count);
+	len = p ? p - buf : count;
+
+	for (i = 0; i < ARRAY_SIZE(tpacpi_volume_autocontrol_names); i++) {
+		const char *name = tpacpi_volume_autocontrol_names[i];
+		if (name && !strncmp(name, buf, len)) {
+			int ret = volume_set_autocontrol(i);
+			if (ret < 0)
+				return ret;
+			return count;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static struct device_attribute dev_attr_volume_autocontrol =
+	__ATTR(volume_autocontrol, 0,
+		volume_autocontrol_show, volume_autocontrol_store);
+
+static struct attribute *volume_attributes[] = {
+	&dev_attr_volume_autocontrol.attr,
+	NULL
+};
+
+static const struct attribute_group volume_attr_group = {
+	.attrs = volume_attributes,
+};
+
 static int volume_alsa_set_volume(const u8 vol)
 {
 	dbg_printk(TPACPI_DBG_MIXER,
@@ -6774,6 +6962,10 @@ static void volume_suspend(pm_message_t state)
 
 static void volume_resume(void)
 {
+	if (volume_autocontrol_configurable &&
+	    volume_set_autocontrol(volume_autocontrol) < 0)
+		printk(TPACPI_ERR "failed to restore volume autocontrol\n");
+
 	volume_alsa_notify_change();
 }
 
@@ -6784,6 +6976,11 @@ static void volume_shutdown(void)
 
 static void volume_exit(void)
 {
+	sysfs_remove_group(&tpacpi_pdev->dev.kobj, &volume_attr_group);
+
+	/* Safe even if not registered. */
+	i8042_remove_filter(tpacpi_i8042_filter);
+
 	if (alsa_card) {
 		snd_card_free(alsa_card);
 		alsa_card = NULL;
@@ -6998,7 +7195,53 @@ static int __init volume_init(struct ibm_init_struct *iibm)
 			| TP_ACPI_HKEY_VOLDWN_MASK
 			| TP_ACPI_HKEY_MUTE_MASK);
 
+	/* Try to initialize autocontrol */
+	volume_autocontrol_configurable = true;
+	rc = volume_read_autocontrol(&volume_autocontrol);
+	if (rc != 0) {
+		vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_MIXER,
+			    "failed to read volume autocontrol\n");
+		volume_autocontrol_configurable = false;
+
+		/* Maintain historical behavior. */
+		volume_autocontrol = TPACPI_VOL_AUTO_NONE;
+	} else {
+		/* Write the value we just read, just in case. */
+		if (volume_set_autocontrol(volume_autocontrol) == 0) {
+			vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_MIXER,
+				"volume autocontrol available\n");
+		} else {
+			volume_autocontrol_configurable = false;
+			vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_MIXER,
+				"failed to write volume autocontrol\n");
+			/* Keep the value we read, though. */
+		}
+	}
+
+	if (volume_autocontrol != TPACPI_VOL_AUTO_NONE ||
+	    volume_autocontrol_configurable) {
+		if (i8042_install_filter(&tpacpi_i8042_filter) != 0)
+			printk(TPACPI_ERR
+			       "failed to register i8042 filter\n");
+	}
+
+	dev_attr_volume_autocontrol.attr.mode =
+		(volume_autocontrol_configurable ? S_IWUSR | S_IRUGO : S_IRUGO);
+	rc = sysfs_create_group(&tpacpi_pdev->dev.kobj, &volume_attr_group);
+	if (rc < 0)
+		goto err;
+
 	return 0;
+
+err:
+	i8042_remove_filter(&tpacpi_i8042_filter);
+
+	if (alsa_card) {
+		snd_card_free(alsa_card);
+		alsa_card = NULL;
+	}
+
+	return rc;
 }
 
 static int volume_read(struct seq_file *m)
-- 
1.7.5.1
