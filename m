From: Andy Lutomirski <luto-DPNOqEs/LNQ@public.gmane.org>
Subject: [PATCH v2] thinkpad-acpi: Improve hardware volume
	controls
Date: Tue, 10 May 2011 06:44:43 -0400
Message-ID: <69d2f9a611a13c12b775a61194162e940ad2cc1a.1305024005.git.luto@mit.edu>
References: <BANLkTikgKj9yBUTLiFVj4tP2LNSzbExo1A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <BANLkTikgKj9yBUTLiFVj4tP2LNSzbExo1A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
Cc: ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Andy Lutomirski <luto-3s7WtUTddSA@public.gmane.org>, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

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

(This will need some adjustment on machines that have hardware
*volume* control instead of just mute, I suspect.  I don't own
any such machines, though.)

Signed-off-by: Andy Lutomirski <luto-3s7WtUTddSA@public.gmane.org>
---

Changes from v1:
 - Read HAUM on startup, which gives the correct default (toggle)
   on X220 and should preserve the "none" behavior on systems that
   set acpi_osi=Linux.
 - Enable all of the controls on systems with hardware volume control,
   for ease of testing.
 - Back out HKEY modifications that didn't do anything -- that code
   was already correct.

 drivers/platform/x86/thinkpad_acpi.c |  271 ++++++++++++++++++++++++++++++++++
 1 files changed, 271 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 4025d84..a277dd0 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -6453,6 +6453,15 @@ static struct ibm_struct brightness_driver_data = {
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
@@ -6502,12 +6511,28 @@ enum tpacpi_volume_capabilities {
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
@@ -6667,6 +6692,192 @@ unlock:
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
+bool volume_input_filter(struct input_handle *handle,
+			 unsigned int type, unsigned int code, int value)
+{
+	if (volume_autocontrol == TPACPI_VOL_AUTO_NONE)
+		return false;  /* Full software control */
+
+	/* XXX: This is an absurd way to generate alsa notifications. */
+
+	if (code == KEY_MUTE) {
+		/* Notify ALSA but eat the keystroke. */
+		volume_alsa_notify_change();
+		return true;
+	} else if (code == KEY_VOLUMEUP || code == KEY_VOLUMEDOWN) {
+		/* Notify ALSA but keep the keystroke. */
+		volume_alsa_notify_change();
+	}
+
+	return false;
+}
+
+static int volume_input_connect(struct input_handler *handler,
+				struct input_dev *dev,
+				const struct input_device_id *id)
+{
+	struct input_handle *handle;
+	int error;
+
+	handle = kzalloc(sizeof(struct input_handle), GFP_KERNEL);
+	if (!handle)
+		return -ENOMEM;
+
+	handle->dev = dev;
+	handle->handler = handler;
+	handle->name = "thinkpad_acpi";
+
+	error = input_register_handle(handle);
+	if (error)
+                goto err_free_handle;
+
+	error = input_open_device(handle);
+	if (error)
+		goto err_unregister_handle;
+
+	dbg_printk(TPACPI_DBG_MIXER,
+		   "Filtering input device %s\n", dev->phys);
+
+	return 0;
+
+err_unregister_handle:
+	input_unregister_handle(handle);
+err_free_handle:
+	kfree(handle);
+	return error;
+}
+
+static void volume_input_disconnect(struct input_handle *handle)
+{
+	input_close_device(handle);
+	input_unregister_handle(handle);
+	kfree(handle);
+}
+
+static const struct input_device_id input_handler_ids[] = {
+	{
+		.flags = INPUT_DEVICE_ID_MATCH_EVBIT |
+			INPUT_DEVICE_ID_MATCH_KEYBIT |
+			INPUT_DEVICE_ID_MATCH_BUS,
+		.bustype = BUS_I8042,
+		.evbit = { BIT_MASK(EV_KEY) },
+		.keybit = { [BIT_WORD(KEY_MUTE)] = BIT_MASK(KEY_MUTE) },
+	},
+	{}
+};
+
+static struct input_handler tpacpi_input_handler = {
+	.name = "thinkpad_acpi",
+	.connect = volume_input_connect,
+	.disconnect = volume_input_disconnect,
+	.filter = volume_input_filter,
+	.id_table = input_handler_ids,
+};
+
+static bool input_handler_registered = false;
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
@@ -6774,6 +6985,10 @@ static void volume_suspend(pm_message_t state)
 
 static void volume_resume(void)
 {
+	if (volume_autocontrol_configurable &&
+	    volume_set_autocontrol(volume_autocontrol) < 0)
+		printk(TPACPI_ERR "failed to restore volume autocontrol\n");
+
 	volume_alsa_notify_change();
 }
 
@@ -6784,6 +6999,11 @@ static void volume_shutdown(void)
 
 static void volume_exit(void)
 {
+	sysfs_remove_group(&tpacpi_pdev->dev.kobj, &volume_attr_group);
+
+	if (input_handler_registered)
+		input_unregister_handler(&tpacpi_input_handler);
+
 	if (alsa_card) {
 		snd_card_free(alsa_card);
 		alsa_card = NULL;
@@ -6998,7 +7218,58 @@ static int __init volume_init(struct ibm_init_struct *iibm)
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
+		if (input_register_handler(&tpacpi_input_handler) == 0)
+			input_handler_registered = true;
+		else
+			printk(TPACPI_ERR
+			       "failed to register input handler\n");
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
+	if (input_handler_registered) {
+		input_unregister_handler(&tpacpi_input_handler);
+		input_handler_registered = false;
+	}
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
1.7.4.4


------------------------------------------------------------------------------
Achieve unprecedented app performance and reliability
What every C/C++ and Fortran developer should know.
Learn how Intel has extended the reach of its next-generation tools
to help boost performance applications - inlcuding clusters.
http://p.sf.net/sfu/intel-dev2devmay
