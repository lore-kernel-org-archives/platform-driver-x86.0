From: Eric Curtin <ericcurtin17@gmail.com>
Subject: [PATCH] Remove logging for "Unsupported brightness interface"
Date: Sat, 16 Jan 2016 22:48:01 +0000
Message-ID: <CANpvso7bPLEsxnv6pORJS6mPwf809um08tA7u5dPAzpxSNOFRw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:36211 "EHLO
	mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752931AbcAPWsD (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 16 Jan 2016 17:48:03 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: ibm-acpi@hmh.eng.br, Darren Hart <dvhart@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, Kernel development list <linux-kernel@vger.kernel.org>

Message gets logged on machines that are well supported. Fixed one
checkpatch.pl ERROR and ran the file through checkpatch.pl --fix to fix other
problems and reviewed the changes the script made.

Signed-off-by: Eric Curtin <ericcurtin17@gmail.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 357 ++++++++++++++++-------------------
 1 file changed, 162 insertions(+), 195 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c
b/drivers/platform/x86/thinkpad_acpi.c
index 0bed473..200a6b0 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -31,11 +31,11 @@
  *  2007-10-20 changelog trimmed down
  *
  *  2007-03-27  0.14 renamed to thinkpad_acpi and moved to
- *   drivers/misc.
+ * drivers/misc.
  *
  *  2006-11-22 0.13 new maintainer
- *   changelog now lives in git commit history, and will
- *   not be updated further in-file.
+ * changelog now lives in git commit history, and will
+ * not be updated further in-file.
  *
  *  2005-03-17 0.11 support for 600e, 770x
  *    thanks to Jamie Lentin <lentinj@dial.pipex.com>
@@ -260,7 +260,7 @@ struct tp_acpi_drv_struct {
  const struct acpi_device_id *hid;
  struct acpi_driver *driver;

- void (*notify) (struct ibm_struct *, u32);
+ void (*notify)(struct ibm_struct *, u32);
  acpi_handle *handle;
  u32 type;
  struct acpi_device *device;
@@ -269,12 +269,12 @@ struct tp_acpi_drv_struct {
 struct ibm_struct {
  char *name;

- int (*read) (struct seq_file *);
- int (*write) (char *);
- void (*exit) (void);
- void (*resume) (void);
- void (*suspend) (void);
- void (*shutdown) (void);
+ int (*read)(struct seq_file *);
+ int (*write)(char *);
+ void (*exit)(void);
+ void (*resume)(void);
+ void (*suspend)(void);
+ void (*shutdown)(void);

  struct list_head all_drivers;

@@ -292,7 +292,7 @@ struct ibm_struct {
 struct ibm_init_struct {
  char param[32];

- int (*init) (struct ibm_init_struct *);
+ int (*init)(struct ibm_init_struct *);
  umode_t base_procfs_mode;
  struct ibm_struct *data;
 };
@@ -574,6 +574,7 @@ static int acpi_evalf(acpi_handle handle,
  va_start(ap, fmt);
  while (*fmt) {
  char c = *(fmt++);
+
  switch (c) {
  case 'd': /* int */
  in_objs[params.count].integer.value = va_arg(ap, int);
@@ -581,8 +582,8 @@ static int acpi_evalf(acpi_handle handle,
  break;
  /* add more types as needed */
  default:
- pr_err("acpi_evalf() called "
-       "with invalid format character '%c'\n", c);
+ pr_err("acpi_evalf() called with invalid format character '%c'\n",
+       c);
  va_end(ap);
  return 0;
  }
@@ -610,8 +611,8 @@ static int acpi_evalf(acpi_handle handle,
  break;
  /* add more types as needed */
  default:
- pr_err("acpi_evalf() called "
-       "with invalid format character '%c'\n", res_type);
+ pr_err("acpi_evalf() called with invalid format character '%c'\n",
+       res_type);
  return 0;
  }

@@ -699,6 +700,7 @@ static acpi_status __init
tpacpi_acpi_handle_locate_callback(acpi_handle handle,
  u32 level, void *context, void **return_value)
 {
  struct acpi_device *dev;
+
  if (!strcmp(context, "video")) {
  if (acpi_bus_get_device(handle, &dev))
  return AE_OK;
@@ -781,8 +783,8 @@ static int __init setup_acpi_notify(struct ibm_struct *ibm)
  ibm->acpi->type, dispatch_acpi_notify, ibm);
  if (ACPI_FAILURE(status)) {
  if (status == AE_ALREADY_EXISTS) {
- pr_notice("another device driver is already "
-  "handling %s events\n", ibm->name);
+ pr_notice("another device driver is already handling %s events\n",
+  ibm->name);
  } else {
  pr_err("acpi_install_notify_handler(%s) failed: %s\n",
        ibm->name, acpi_format_exception(status));
@@ -1086,8 +1088,7 @@ static void printk_deprecated_attribute(const
char * const what,
  const char * const details)
 {
  tpacpi_log_usertask("deprecated sysfs attribute");
- pr_warn("WARNING: sysfs attribute %s is deprecated and "
- "will be removed. %s\n",
+ pr_warn("WARNING: sysfs attribute %s is deprecated and will be removed. %s\n",
  what, details);
 }

@@ -1371,7 +1372,7 @@ static ssize_t
tpacpi_rfk_sysfs_enable_store(const enum tpacpi_rfk_id id,
 static int tpacpi_rfk_procfs_read(const enum tpacpi_rfk_id id, struct
seq_file *m)
 {
  if (id >= TPACPI_RFK_SW_MAX)
- seq_printf(m, "status:\t\tnot supported\n");
+ seq_puts(m, "status:\t\tnot supported\n");
  else {
  int status;

@@ -1388,7 +1389,7 @@ static int tpacpi_rfk_procfs_read(const enum
tpacpi_rfk_id id, struct seq_file *
  seq_printf(m, "status:\t\t%s\n",
  (status == TPACPI_RFK_RADIO_ON) ?
  "enabled" : "disabled");
- seq_printf(m, "commands:\tenable, disable\n");
+ seq_puts(m, "commands:\tenable, disable\n");
  }

  return 0;
@@ -1819,8 +1820,7 @@ static void __init tpacpi_check_outdated_fw(void)
  * best if the user upgrades the firmware anyway.
  */
  pr_warn("WARNING: Outdated ThinkPad BIOS/EC firmware\n");
- pr_warn("WARNING: This firmware may be missing critical bug "
- "fixes and/or important features\n");
+ pr_warn("WARNING: This firmware may be missing critical bug fixes
and/or important features\n");
  }
 }

@@ -2162,8 +2162,7 @@ static int hotkey_mask_set(u32 mask)
  * a given event.
  */
  if (!hotkey_mask_get() && !rc && (fwmask & ~hotkey_acpi_mask)) {
- pr_notice("asked for hotkey mask 0x%08x, but "
-  "firmware forced it to 0x%08x\n",
+ pr_notice("asked for hotkey mask 0x%08x, but firmware forced it to 0x%08x\n",
   fwmask, hotkey_acpi_mask);
  }

@@ -2188,10 +2187,9 @@ static int hotkey_user_mask_set(const u32 mask)
     (mask == 0xffff || mask == 0xffffff ||
      mask == 0xffffffff)) {
  tp_warned.hotkey_mask_ff = 1;
- pr_notice("setting the hotkey mask to 0x%08x is likely "
-  "not the best way to go about it\n", mask);
- pr_notice("please consider using the driver defaults, "
-  "and refer to up-to-date thinkpad-acpi "
+ pr_notice("setting the hotkey mask to 0x%08x is likely not the best
way to go about it\n",
+  mask);
+ pr_notice("please consider using the driver defaults, and refer to
up-to-date thinkpad-acpi "
   "documentation\n");
  }

@@ -2567,16 +2565,14 @@ static void hotkey_poll_setup(const bool may_warn)
  NULL, TPACPI_NVRAM_KTHREAD_NAME);
  if (IS_ERR(tpacpi_hotkey_task)) {
  tpacpi_hotkey_task = NULL;
- pr_err("could not create kernel thread "
-       "for hotkey polling\n");
+ pr_err("could not create kernel thread for hotkey polling\n");
  }
  }
  } else {
  hotkey_poll_stop_sync();
  if (may_warn && (poll_driver_mask || poll_user_mask) &&
     hotkey_poll_freq == 0) {
- pr_notice("hot keys 0x%08x and/or events 0x%08x "
-  "require polling, which is currently "
+ pr_notice("hot keys 0x%08x and/or events 0x%08x require polling,
which is currently "
   "disabled\n",
   poll_user_mask, poll_driver_mask);
  }
@@ -2793,12 +2789,10 @@ static ssize_t hotkey_source_mask_store(struct
device *dev,
  mutex_unlock(&hotkey_mutex);

  if (rc < 0)
- pr_err("hotkey_source_mask: "
-       "failed to update the firmware event mask!\n");
+ pr_err("hotkey_source_mask: failed to update the firmware event mask!\n");

  if (r_ev)
- pr_notice("hotkey_source_mask: "
-  "some important events were disabled: 0x%04x\n",
+ pr_notice("hotkey_source_mask: some important events were disabled: 0x%04x\n",
   r_ev);

  tpacpi_disclose_usertask("hotkey_source_mask", "set to 0x%08lx\n", t);
@@ -2848,6 +2842,7 @@ static ssize_t hotkey_radio_sw_show(struct device *dev,
    char *buf)
 {
  int res;
+
  res = hotkey_get_wlsw();
  if (res < 0)
  return res;
@@ -2874,6 +2869,7 @@ static ssize_t hotkey_tablet_mode_show(struct device *dev,
    char *buf)
 {
  int res, s;
+
  res = hotkey_get_tablet_mode(&s);
  if (res < 0)
  return res;
@@ -3058,8 +3054,7 @@ static void hotkey_exit(void)
  if (((tp_features.hotkey_mask &&
       hotkey_mask_set(hotkey_orig_mask)) |
      hotkey_status_set(false)) != 0)
- pr_err("failed to restore hot key mask "
-       "to BIOS defaults\n");
+ pr_err("failed to restore hot key mask to BIOS defaults\n");
 }

 static void __init hotkey_unmap(const unsigned int scancode)
@@ -3372,8 +3367,7 @@ static int __init hotkey_init(struct
ibm_init_struct *iibm)
  /* Paranoia check AND init hotkey_all_mask */
  if (!acpi_evalf(hkey_handle, &hotkey_all_mask,
  "MHKA", "qd")) {
- pr_err("missing MHKA handler, "
-       "please report this to %s\n",
+ pr_err("missing MHKA handler, please report this to %s\n",
        TPACPI_MAIL);
  /* Fallback: pre-init for FN+F3,F4,F12 */
  hotkey_all_mask = 0x080cU;
@@ -3489,11 +3483,9 @@ static int __init hotkey_init(struct
ibm_init_struct *iibm)
  * userspace. tpacpi_detect_brightness_capabilities() must have
  * been called before this point  */
  if (acpi_video_get_backlight_type() != acpi_backlight_vendor) {
- pr_info("This ThinkPad has standard ACPI backlight "
- "brightness control, supported by the ACPI "
+ pr_info("This ThinkPad has standard ACPI backlight brightness
control, supported by the ACPI "
  "video driver\n");
- pr_notice("Disabling thinkpad-acpi brightness events "
-  "by default...\n");
+ pr_notice("Disabling thinkpad-acpi brightness events by default...\n");

  /* Disable brightness up/down on Lenovo thinkpads when
  * ACPI is handling them, otherwise it is plain impossible
@@ -3653,7 +3645,7 @@ static bool
adaptive_keyboard_hotkey_notify_hotkey(unsigned int scancode)
  adaptive_keyboard_prev_mode = current_mode;
  adaptive_keyboard_mode_is_saved = true;

- if (adaptive_keyboard_set_mode (FUNCTION_MODE) < 0)
+ if (adaptive_keyboard_set_mode(FUNCTION_MODE) < 0)
  return false;
  return true;

@@ -3833,14 +3825,12 @@ static bool hotkey_notify_6xxx(const u32 hkey,
  /* recommended action: immediate sleep/hibernate */
  break;
  case TP_HKEY_EV_ALARM_SENSOR_HOT:
- pr_crit("THERMAL ALARM: "
- "a sensor reports something is too hot!\n");
+ pr_crit("THERMAL ALARM: a sensor reports something is too hot!\n");
  /* recommended action: warn user through gui, that */
  /* some internal component is too hot */
  break;
  case TP_HKEY_EV_ALARM_SENSOR_XHOT:
- pr_alert("THERMAL EMERGENCY: "
- "a sensor reports something is extremely hot!\n");
+ pr_alert("THERMAL EMERGENCY: a sensor reports something is extremely hot!\n");
  /* recommended action: immediate sleep/hibernate */
  break;
  case TP_HKEY_EV_AC_CHANGED:
@@ -3959,8 +3949,8 @@ static void hotkey_notify(struct ibm_struct
*ibm, u32 event)
  }
  if (!known_ev) {
  pr_notice("unhandled HKEY event 0x%04x\n", hkey);
- pr_notice("please report the conditions when this "
-  "event happened to %s\n", TPACPI_MAIL);
+ pr_notice("please report the conditions when this event happened to %s\n",
+  TPACPI_MAIL);
  }

  /* netlink events */
@@ -3994,8 +3984,7 @@ static void hotkey_resume(void)

  if (hotkey_status_set(true) < 0 ||
     hotkey_mask_set(hotkey_acpi_mask) < 0)
- pr_err("error while attempting to reset the event "
-       "firmware interface\n");
+ pr_err("error while attempting to reset the event firmware interface\n");

  tpacpi_send_radiosw_update();
  hotkey_tablet_mode_notify_change();
@@ -4018,7 +4007,7 @@ static int hotkey_read(struct seq_file *m)
  int res, status;

  if (!tp_features.hotkey) {
- seq_printf(m, "status:\t\tnot supported\n");
+ seq_puts(m, "status:\t\tnot supported\n");
  return 0;
  }

@@ -4034,10 +4023,10 @@ static int hotkey_read(struct seq_file *m)
  seq_printf(m, "status:\t\t%s\n", enabled(status, 0));
  if (hotkey_all_mask) {
  seq_printf(m, "mask:\t\t0x%08x\n", hotkey_user_mask);
- seq_printf(m, "commands:\tenable, disable, reset, <mask>\n");
+ seq_puts(m, "commands:\tenable, disable, reset, <mask>\n");
  } else {
- seq_printf(m, "mask:\t\tnot supported\n");
- seq_printf(m, "commands:\tenable, disable, reset\n");
+ seq_puts(m, "mask:\t\tnot supported\n");
+ seq_puts(m, "commands:\tenable, disable, reset\n");
  }

  return 0;
@@ -4047,11 +4036,9 @@ static void hotkey_enabledisable_warn(bool enable)
 {
  tpacpi_log_usertask("procfs hotkey enable/disable");
  if (!WARN((tpacpi_lifecycle == TPACPI_LIFE_RUNNING || !enable),
-  pr_fmt("hotkey enable/disable functionality has been "
- "removed from the driver.  "
+  pr_fmt("hotkey enable/disable functionality has been removed from
the driver.  "
  "Hotkeys are always enabled.\n")))
- pr_err("Please remove the hotkey=enable module "
-       "parameter, it is deprecated.  "
+ pr_err("Please remove the hotkey=enable module parameter, it is deprecated.  "
        "Hotkeys are always enabled.\n");
 }

@@ -4709,8 +4696,7 @@ static void video_exit(void)
  dbg_printk(TPACPI_DBG_EXIT,
    "restoring original video autoswitch mode\n");
  if (video_autosw_set(video_orig_autosw))
- pr_err("error while trying to restore original "
- "video autoswitch mode\n");
+ pr_err("error while trying to restore original video autoswitch mode\n");
 }

 static int video_outputsw_get(void)
@@ -4881,7 +4867,7 @@ static int video_read(struct seq_file *m)
  int status, autosw;

  if (video_supported == TPACPI_VIDEO_NONE) {
- seq_printf(m, "status:\t\tnot supported\n");
+ seq_puts(m, "status:\t\tnot supported\n");
  return 0;
  }

@@ -4897,18 +4883,18 @@ static int video_read(struct seq_file *m)
  if (autosw < 0)
  return autosw;

- seq_printf(m, "status:\t\tsupported\n");
+ seq_puts(m, "status:\t\tsupported\n");
  seq_printf(m, "lcd:\t\t%s\n", enabled(status, 0));
  seq_printf(m, "crt:\t\t%s\n", enabled(status, 1));
  if (video_supported == TPACPI_VIDEO_NEW)
  seq_printf(m, "dvi:\t\t%s\n", enabled(status, 3));
  seq_printf(m, "auto:\t\t%s\n", enabled(autosw, 0));
- seq_printf(m, "commands:\tlcd_enable, lcd_disable\n");
- seq_printf(m, "commands:\tcrt_enable, crt_disable\n");
+ seq_puts(m, "commands:\tlcd_enable, lcd_disable\n");
+ seq_puts(m, "commands:\tcrt_enable, crt_disable\n");
  if (video_supported == TPACPI_VIDEO_NEW)
- seq_printf(m, "commands:\tdvi_enable, dvi_disable\n");
- seq_printf(m, "commands:\tauto_enable, auto_disable\n");
- seq_printf(m, "commands:\tvideo_switch, expand_toggle\n");
+ seq_puts(m, "commands:\tdvi_enable, dvi_disable\n");
+ seq_puts(m, "commands:\tauto_enable, auto_disable\n");
+ seq_puts(m, "commands:\tvideo_switch, expand_toggle\n");

  return 0;
 }
@@ -5112,16 +5098,16 @@ static int light_read(struct seq_file *m)
  int status;

  if (!tp_features.light) {
- seq_printf(m, "status:\t\tnot supported\n");
+ seq_puts(m, "status:\t\tnot supported\n");
  } else if (!tp_features.light_status) {
- seq_printf(m, "status:\t\tunknown\n");
- seq_printf(m, "commands:\ton, off\n");
+ seq_puts(m, "status:\t\tunknown\n");
+ seq_puts(m, "commands:\ton, off\n");
  } else {
  status = light_get_status();
  if (status < 0)
  return status;
  seq_printf(m, "status:\t\t%s\n", onoff(status, 0));
- seq_printf(m, "commands:\ton, off\n");
+ seq_puts(m, "commands:\ton, off\n");
  }

  return 0;
@@ -5206,10 +5192,10 @@ static int cmos_read(struct seq_file *m)
  /* cmos not supported on 570, 600e/x, 770e, 770x, A21e, A2xm/p,
    R30, R31, T20-22, X20-21 */
  if (!cmos_handle)
- seq_printf(m, "status:\t\tnot supported\n");
+ seq_puts(m, "status:\t\tnot supported\n");
  else {
- seq_printf(m, "status:\t\tsupported\n");
- seq_printf(m, "commands:\t<cmd> (<cmd> is 0-21)\n");
+ seq_puts(m, "status:\t\tsupported\n");
+ seq_puts(m, "commands:\t<cmd> (<cmd> is 0-21)\n");
  }

  return 0;
@@ -5595,8 +5581,7 @@ static int __init led_init(struct ibm_init_struct *iibm)
  }

 #ifdef CONFIG_THINKPAD_ACPI_UNSAFE_LEDS
- pr_notice("warning: userspace override of important "
-  "firmware LEDs is enabled\n");
+ pr_notice("warning: userspace override of important firmware LEDs is
enabled\n");
 #endif
  return 0;
 }
@@ -5608,14 +5593,15 @@ static int __init led_init(struct ibm_init_struct *iibm)
 static int led_read(struct seq_file *m)
 {
  if (!led_supported) {
- seq_printf(m, "status:\t\tnot supported\n");
+ seq_puts(m, "status:\t\tnot supported\n");
  return 0;
  }
- seq_printf(m, "status:\t\tsupported\n");
+ seq_puts(m, "status:\t\tsupported\n");

  if (led_supported == TPACPI_LED_570) {
  /* 570 */
  int i, status;
+
  for (i = 0; i < 8; i++) {
  status = led_get_status(i);
  if (status < 0)
@@ -5708,10 +5694,10 @@ static int __init beep_init(struct
ibm_init_struct *iibm)
 static int beep_read(struct seq_file *m)
 {
  if (!beep_handle)
- seq_printf(m, "status:\t\tnot supported\n");
+ seq_puts(m, "status:\t\tnot supported\n");
  else {
- seq_printf(m, "status:\t\tsupported\n");
- seq_printf(m, "commands:\t<cmd> (<cmd> is 0-17)\n");
+ seq_puts(m, "status:\t\tsupported\n");
+ seq_puts(m, "commands:\t<cmd> (<cmd> is 0-17)\n");
  }

  return 0;
@@ -5927,7 +5913,7 @@ static struct sensor_device_attribute
sensor_dev_attr_thermal_temp_input[] = {
 };

 #define THERMAL_ATTRS(X) \
- &sensor_dev_attr_thermal_temp_input[X].dev_attr.attr
+ (&sensor_dev_attr_thermal_temp_input[X].dev_attr.attr)

 static struct attribute *thermal_temp_input_attr[] = {
  THERMAL_ATTRS(8),
@@ -5999,13 +5985,11 @@ static int __init thermal_init(struct
ibm_init_struct *iibm)
  if (ta1 == 0) {
  /* This is sheer paranoia, but we handle it anyway */
  if (acpi_tmp7) {
- pr_err("ThinkPad ACPI EC access misbehaving, "
-       "falling back to ACPI TMPx access "
+ pr_err("ThinkPad ACPI EC access misbehaving, falling back to ACPI
TMPx access "
        "mode\n");
  thermal_read_mode = TPACPI_THERMAL_ACPI_TMP07;
  } else {
- pr_err("ThinkPad ACPI EC access misbehaving, "
-       "disabling thermal sensors access\n");
+ pr_err("ThinkPad ACPI EC access misbehaving, disabling thermal
sensors access\n");
  thermal_read_mode = TPACPI_THERMAL_NONE;
  }
  } else {
@@ -6082,14 +6066,14 @@ static int thermal_read(struct seq_file *m)
  if (unlikely(n < 0))
  return n;

- seq_printf(m, "temperatures:\t");
+ seq_puts(m, "temperatures:\t");

  if (n > 0) {
  for (i = 0; i < (n - 1); i++)
  seq_printf(m, "%d ", t.temp[i] / 1000);
  seq_printf(m, "%d\n", t.temp[i] / 1000);
  } else
- seq_printf(m, "not supported\n");
+ seq_puts(m, "not supported\n");

  return 0;
 }
@@ -6434,20 +6418,21 @@ static const struct tpacpi_quirk
brightness_quirk_table[] __initconst = {
  */
 static void __init tpacpi_detect_brightness_capabilities(void)
 {
- unsigned int b;
+ const unsigned int b = tpacpi_check_std_acpi_brightness_support();

  vdbg_printk(TPACPI_DBG_INIT,
     "detecting firmware brightness interface capabilities\n");

  /* we could run a quirks check here (same table used by
- * brightness_init) if needed */
+ * brightness_init) if needed
+ */

  /*
  * We always attempt to detect acpi support, so as to switch
  * Lenovo Vista BIOS to ACPI brightness mode even if we are not
  * going to publish a backlight interface
  */
- b = tpacpi_check_std_acpi_brightness_support();
+
  switch (b) {
  case 16:
  bright_maxlvl = 15;
@@ -6459,7 +6444,6 @@ static void __init
tpacpi_detect_brightness_capabilities(void)
  pr_info("detected a 8-level brightness capable ThinkPad\n");
  break;
  default:
- pr_info("Unsupported brightness interface\n");
  tp_features.bright_unkfw = 1;
  bright_maxlvl = b - 1;
  }
@@ -6486,25 +6470,21 @@ static int __init brightness_init(struct
ibm_init_struct *iibm)

  if (!brightness_enable) {
  dbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_BRGHT,
-   "brightness support disabled by "
-   "module parameter\n");
+   "brightness support disabled by module parameter\n");
  return 1;
  }

  if (acpi_video_get_backlight_type() != acpi_backlight_vendor) {
  if (brightness_enable > 1) {
- pr_info("Standard ACPI backlight interface "
- "available, not loading native one\n");
+ pr_info("Standard ACPI backlight interface available, not loading
native one\n");
  return 1;
  } else if (brightness_enable == 1) {
- pr_warn("Cannot enable backlight brightness support, "
- "ACPI is already handling it.  Refer to the "
+ pr_warn("Cannot enable backlight brightness support, ACPI is already
handling it.  Refer to the "
  "acpi_backlight kernel parameter.\n");
  return 1;
  }
  } else if (tp_features.bright_acpimode && brightness_enable > 1) {
- pr_notice("Standard ACPI backlight interface not "
-  "available, thinkpad_acpi native "
+ pr_notice("Standard ACPI backlight interface not available,
thinkpad_acpi native "
   "brightness control enabled\n");
  }

@@ -6548,6 +6528,7 @@ static int __init brightness_init(struct
ibm_init_struct *iibm)
  &props);
  if (IS_ERR(ibm_backlight_device)) {
  int rc = PTR_ERR(ibm_backlight_device);
+
  ibm_backlight_device = NULL;
  pr_err("Could not register backlight device\n");
  return rc;
@@ -6556,10 +6537,10 @@ static int __init brightness_init(struct
ibm_init_struct *iibm)
  "brightness is supported\n");

  if (quirks & TPACPI_BRGHT_Q_ASK) {
- pr_notice("brightness: will use unverified default: "
-  "brightness_mode=%d\n", brightness_mode);
- pr_notice("brightness: please report to %s whether it works well "
-  "or not on your ThinkPad\n", TPACPI_MAIL);
+ pr_notice("brightness: will use unverified default: brightness_mode=%d\n",
+  brightness_mode);
+ pr_notice("brightness: please report to %s whether it works well or
not on your ThinkPad\n",
+  TPACPI_MAIL);
  }

  /* Added by mistake in early 2007.  Probably useless, but it could
@@ -6569,8 +6550,7 @@ static int __init brightness_init(struct
ibm_init_struct *iibm)
  backlight_update_status(ibm_backlight_device);

  vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_BRGHT,
- "brightness: registering brightness hotkeys "
- "as change notification\n");
+ "brightness: registering brightness hotkeys as change notification\n");
  tpacpi_hotkey_driver_mask_set(hotkey_driver_mask
  | TP_ACPI_HKEY_BRGHTUP_MASK
  | TP_ACPI_HKEY_BRGHTDWN_MASK);
@@ -6604,10 +6584,10 @@ static int brightness_read(struct seq_file *m)

  level = brightness_get(NULL);
  if (level < 0) {
- seq_printf(m, "level:\t\tunreadable\n");
+ seq_puts(m, "level:\t\tunreadable\n");
  } else {
  seq_printf(m, "level:\t\t%d\n", level);
- seq_printf(m, "commands:\tup, down\n");
+ seq_puts(m, "commands:\tup, down\n");
  seq_printf(m, "commands:\tlevel <level> (<level> is 0-%d)\n",
        bright_maxlvl);
  }
@@ -7233,8 +7213,8 @@ static int __init volume_init(struct
ibm_init_struct *iibm)
  return -EINVAL;

  if (volume_mode == TPACPI_VOL_MODE_UCMS_STEP) {
- pr_err("UCMS step volume mode not implemented, "
-       "please contact %s\n", TPACPI_MAIL);
+ pr_err("UCMS step volume mode not implemented, please contact %s\n",
+       TPACPI_MAIL);
  return 1;
  }

@@ -7247,8 +7227,7 @@ static int __init volume_init(struct
ibm_init_struct *iibm)
  */
  if (!alsa_enable) {
  vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_MIXER,
-    "ALSA mixer disabled by parameter, "
-    "not loading volume subdriver...\n");
+    "ALSA mixer disabled by parameter, not loading volume subdriver...\n");
  return 1;
  }

@@ -7326,10 +7305,10 @@ static int volume_read(struct seq_file *m)
  u8 status;

  if (volume_get_status(&status) < 0) {
- seq_printf(m, "level:\t\tunreadable\n");
+ seq_puts(m, "level:\t\tunreadable\n");
  } else {
  if (tp_features.mixer_no_level_control)
- seq_printf(m, "level:\t\tunsupported\n");
+ seq_puts(m, "level:\t\tunsupported\n");
  else
  seq_printf(m, "level:\t\t%d\n",
  status & TP_EC_AUDIO_LVL_MSK);
@@ -7338,13 +7317,12 @@ static int volume_read(struct seq_file *m)
  onoff(status, TP_EC_AUDIO_MUTESW));

  if (volume_control_allowed) {
- seq_printf(m, "commands:\tunmute, mute\n");
+ seq_puts(m, "commands:\tunmute, mute\n");
  if (!tp_features.mixer_no_level_control) {
  seq_printf(m,
        "commands:\tup, down\n");
  seq_printf(m,
-       "commands:\tlevel <level>"
-       " (<level> is 0-%d)\n",
+       "commands:\tlevel <level> (<level> is 0-%d)\n",
        TP_EC_VOLUME_MAX);
  }
  }
@@ -7368,10 +7346,8 @@ static int volume_write(char *buf)
  if (!volume_control_allowed && tpacpi_lifecycle != TPACPI_LIFE_INIT) {
  if (unlikely(!tp_warned.volume_ctrl_forbidden)) {
  tp_warned.volume_ctrl_forbidden = 1;
- pr_notice("Console audio control in monitor mode, "
-  "changes are not allowed\n");
- pr_notice("Use the volume_control=1 module parameter "
-  "to enable volume control\n");
+ pr_notice("Console audio control in monitor mode, changes are not allowed\n");
+ pr_notice("Use the volume_control=1 module parameter to enable
volume control\n");
  }
  return -EPERM;
  }
@@ -7440,7 +7416,7 @@ static struct ibm_struct volume_driver_data = {

 #define alsa_card NULL

-static void inline volume_alsa_notify_change(void)
+static inline void volume_alsa_notify_change(void)
 {
 }

@@ -7465,33 +7441,33 @@ static struct ibm_struct volume_driver_data = {
  * FAN ACCESS MODES
  *
  * TPACPI_FAN_RD_ACPI_GFAN:
- * ACPI GFAN method: returns fan level
+ * ACPI GFAN method: returns fan level
  *
- * see TPACPI_FAN_WR_ACPI_SFAN
- * EC 0x2f (HFSP) not available if GFAN exists
+ * see TPACPI_FAN_WR_ACPI_SFAN
+ * EC 0x2f (HFSP) not available if GFAN exists
  *
  * TPACPI_FAN_WR_ACPI_SFAN:
- * ACPI SFAN method: sets fan level, 0 (stop) to 7 (max)
+ * ACPI SFAN method: sets fan level, 0 (stop) to 7 (max)
  *
- * EC 0x2f (HFSP) might be available *for reading*, but do not use
- * it for writing.
+ * EC 0x2f (HFSP) might be available *for reading*, but do not use
+ * it for writing.
  *
  * TPACPI_FAN_WR_TPEC:
- * ThinkPad EC register 0x2f (HFSP): fan control loop mode
- * Supported on almost all ThinkPads
+ * ThinkPad EC register 0x2f (HFSP): fan control loop mode
+ * Supported on almost all ThinkPads
  *
- * Fan speed changes of any sort (including those caused by the
- * disengaged mode) are usually done slowly by the firmware as the
- * maximum amount of fan duty cycle change per second seems to be
- * limited.
+ * Fan speed changes of any sort (including those caused by the
+ * disengaged mode) are usually done slowly by the firmware as the
+ * maximum amount of fan duty cycle change per second seems to be
+ * limited.
  *
- * Reading is not available if GFAN exists.
- * Writing is not available if SFAN exists.
+ * Reading is not available if GFAN exists.
+ * Writing is not available if SFAN exists.
  *
- * Bits
+ * Bits
  * 7 automatic mode engaged;
- *   (default operation mode of the ThinkPad)
- * fan level is ignored in this mode.
+ * (default operation mode of the ThinkPad)
+ * fan level is ignored in this mode.
  * 6 full speed mode (takes precedence over bit 7);
  * not available on all thinkpads.  May disable
  * the tachometer while the fan controller ramps up
@@ -7504,9 +7480,9 @@ static struct ibm_struct volume_driver_data = {
  * 7 map to the same speed as level 7 in these models.
  * 2-0 fan level (0..7 usually)
  * 0x00 = stop
- * 0x07 = max (set when temperatures critical)
- * Some ThinkPads may have other levels, see
- * TPACPI_FAN_WR_ACPI_FANS (X31/X40/X41)
+ * 0x07 = max (set when temperatures critical)
+ * Some ThinkPads may have other levels, see
+ * TPACPI_FAN_WR_ACPI_FANS (X31/X40/X41)
  *
  * FIRMWARE BUG: on some models, EC 0x2f might not be initialized at
  * boot. Apparently the EC does not initialize it, so unless ACPI DSDT
@@ -7515,7 +7491,7 @@ static struct ibm_struct volume_driver_data = {
  * For firmware bugs, refer to:
  * http://thinkwiki.org/wiki/Embedded_Controller_Firmware#Firmware_Issues
  *
- * ----
+ * ----
  *
  * ThinkPad EC register 0x84 (LSB), 0x85 (MSB):
  * Main fan tachometer reading (in RPM)
@@ -7563,18 +7539,18 @@ static struct ibm_struct volume_driver_data = {
  * as follows: STOP LOW LOW MED MED HIGH HIGH HIGH HIGH
  * (this map is stored on FAN0..FAN8 as "0,1,1,2,2,3,3,3,3")
  *
- * The speeds are stored on handles
- * (FANA:FAN9), (FANC:FANB), (FANE:FAND).
+ * The speeds are stored on handles
+ * (FANA:FAN9), (FANC:FANB), (FANE:FAND).
  *
- * There are three default speed sets, accessible as handles:
- * FS1L,FS1M,FS1H; FS2L,FS2M,FS2H; FS3L,FS3M,FS3H
+ * There are three default speed sets, accessible as handles:
+ * FS1L,FS1M,FS1H; FS2L,FS2M,FS2H; FS3L,FS3M,FS3H
  *
- * ACPI DSDT switches which set is in use depending on various
- * factors.
+ * ACPI DSDT switches which set is in use depending on various
+ * factors.
  *
- * TPACPI_FAN_WR_TPEC is also available and should be used to
- * command the fan.  The X31/X40/X41 seems to have 8 fan levels,
- * but the ACPI tables just mention level 7.
+ * TPACPI_FAN_WR_TPEC is also available and should be used to
+ * command the fan.  The X31/X40/X41 seems to have 8 fan levels,
+ * but the ACPI tables just mention level 7.
  */

 enum { /* Fan control constants */
@@ -7604,8 +7580,8 @@ enum fan_control_access_mode {
 };

 enum fan_control_commands {
- TPACPI_FAN_CMD_SPEED = 0x0001, /* speed command */
- TPACPI_FAN_CMD_LEVEL = 0x0002, /* level command  */
+ TPACPI_FAN_CMD_SPEED = 0x0001, /* speed command */
+ TPACPI_FAN_CMD_LEVEL = 0x0002, /* level command  */
  TPACPI_FAN_CMD_ENABLE = 0x0004, /* enable/disable cmd,
  * and also watchdog cmd */
 };
@@ -7653,8 +7629,7 @@ TPACPI_HANDLE(sfan, ec, "SFAN", /* 570 */
 static void fan_quirk1_setup(void)
 {
  if (fan_control_initial_status == 0x07) {
- pr_notice("fan_init: initial fan status is unknown, "
-  "assuming it is in auto mode\n");
+ pr_notice("fan_init: initial fan status is unknown, assuming it is
in auto mode\n");
  tp_features.fan_ctrl_status_undef = 1;
  }
 }
@@ -8049,8 +8024,8 @@ static void fan_watchdog_fire(struct work_struct *ignored)
  pr_notice("fan watchdog: enabling fan\n");
  rc = fan_set_enable();
  if (rc < 0) {
- pr_err("fan watchdog: error %d while enabling fan, "
-       "will try again later...\n", -rc);
+ pr_err("fan watchdog: error %d while enabling fan, will try again later...\n",
+       -rc);
  /* reschedule for later */
  fan_watchdog_reset();
  }
@@ -8060,13 +8035,13 @@ static void fan_watchdog_fire(struct
work_struct *ignored)
  * SYSFS fan layout: hwmon compatible (device)
  *
  * pwm*_enable:
- * 0: "disengaged" mode
- * 1: manual mode
- * 2: native EC "auto" mode (recommended, hardware default)
+ * 0: "disengaged" mode
+ * 1: manual mode
+ * 2: native EC "auto" mode (recommended, hardware default)
  *
  * pwm*: set speed in manual mode, ignored otherwise.
- * 0 is level 0; 255 is level 7. Intermediate points done with linear
- * interpolation.
+ * 0 is level 0; 255 is level 7. Intermediate points done with linear
+ * interpolation.
  *
  * fan*_input: tachometer reading, RPM
  *
@@ -8074,7 +8049,7 @@ static void fan_watchdog_fire(struct work_struct *ignored)
  * SYSFS fan layout: extensions
  *
  * fan_watchdog (driver):
- * fan watchdog interval in seconds, 0 disables (default), max 120
+ * fan watchdog interval in seconds, 0 disables (default), max 120
  */

 /* sysfs fan pwm1_enable ----------------------------------------------- */
@@ -8347,8 +8322,7 @@ static int __init fan_init(struct ibm_init_struct *iibm)
  "secondary fan support enabled\n");
  }
  } else {
- pr_err("ThinkPad ACPI EC access misbehaving, "
-       "fan status and control unavailable\n");
+ pr_err("ThinkPad ACPI EC access misbehaving, fan status and control
unavailable\n");
  return 1;
  }
  }
@@ -8447,8 +8421,8 @@ static void fan_suspend(void)
  fan_control_resume_level = 0;
  rc = fan_get_status_safe(&fan_control_resume_level);
  if (rc < 0)
- pr_notice("failed to read fan level for later "
-  "restore during resume: %d\n", rc);
+ pr_notice("failed to read fan level for later restore during resume: %d\n",
+  rc);

  /* if it is undefined, don't attempt to restore it.
  * KEEP THIS LAST */
@@ -8546,41 +8520,38 @@ static int fan_read(struct seq_file *m)

  if (status & TP_EC_FAN_FULLSPEED)
  /* Disengaged mode takes precedence */
- seq_printf(m, "level:\t\tdisengaged\n");
+ seq_puts(m, "level:\t\tdisengaged\n");
  else if (status & TP_EC_FAN_AUTO)
- seq_printf(m, "level:\t\tauto\n");
+ seq_puts(m, "level:\t\tauto\n");
  else
  seq_printf(m, "level:\t\t%d\n", status);
  break;

  case TPACPI_FAN_NONE:
  default:
- seq_printf(m, "status:\t\tnot supported\n");
+ seq_puts(m, "status:\t\tnot supported\n");
  }

  if (fan_control_commands & TPACPI_FAN_CMD_LEVEL) {
- seq_printf(m, "commands:\tlevel <level>");
+ seq_puts(m, "commands:\tlevel <level>");

  switch (fan_control_access_mode) {
  case TPACPI_FAN_WR_ACPI_SFAN:
- seq_printf(m, " (<level> is 0-7)\n");
+ seq_puts(m, " (<level> is 0-7)\n");
  break;

  default:
- seq_printf(m, " (<level> is 0-7, "
-       "auto, disengaged, full-speed)\n");
+ seq_printf(m, " (<level> is 0-7, auto, disengaged, full-speed)\n");
  break;
  }
  }

  if (fan_control_commands & TPACPI_FAN_CMD_ENABLE)
  seq_printf(m, "commands:\tenable, disable\n"
-       "commands:\twatchdog <timeout> (<timeout> "
-       "is 0 (off), 1-120 (seconds))\n");
+       "commands:\twatchdog <timeout> (<timeout> is 0 (off), 1-120
(seconds))\n");

  if (fan_control_commands & TPACPI_FAN_CMD_SPEED)
- seq_printf(m, "commands:\tspeed <speed>"
-       " (<speed> is 0-65535)\n");
+ seq_printf(m, "commands:\tspeed <speed> (<speed> is 0-65535)\n");

  return 0;
 }
@@ -8774,6 +8745,7 @@ static int mute_led_init(struct ibm_init_struct *iibm)

  for (i = 0; i < TPACPI_LED_MAX; i++) {
  struct tp_led_table *t = &led_tables[i];
+
  if (ACPI_SUCCESS(acpi_get_handle(hkey_handle, t->name, &temp)))
  mute_led_on_off(t, false);
  else
@@ -8796,6 +8768,7 @@ static void mute_led_resume(void)

  for (i = 0; i < TPACPI_LED_MAX; i++) {
  struct tp_led_table *t = &led_tables[i];
+
  if (t->state >= 0)
  mute_led_on_off(t, t->state);
  }
@@ -9088,8 +9061,7 @@ static int __must_check __init get_thinkpad_model_data(
  tp->ec_release = (ec_fw_string[4] << 8)
  | ec_fw_string[5];
  } else {
- pr_notice("ThinkPad firmware release %s "
-  "doesn't match the known patterns\n",
+ pr_notice("ThinkPad firmware release %s doesn't match the known patterns\n",
   ec_fw_string);
  pr_notice("please report this to %s\n",
   TPACPI_MAIL);
@@ -9280,8 +9252,7 @@ MODULE_PARM_DESC(debug, "Sets debug level bit-mask");

 module_param(force_load, bool, 0444);
 MODULE_PARM_DESC(force_load,
- "Attempts to load the driver even on a "
- "mis-identified ThinkPad when true");
+ "Attempts to load the driver even on a mis-identified ThinkPad when true");

 module_param_named(fan_control, fan_control_allowed, bool, 0444);
 MODULE_PARM_DESC(fan_control,
@@ -9289,8 +9260,7 @@ MODULE_PARM_DESC(fan_control,

 module_param_named(brightness_mode, brightness_mode, uint, 0444);
 MODULE_PARM_DESC(brightness_mode,
- "Selects brightness control strategy: "
- "0=auto, 1=EC, 2=UCMS, 3=EC+NVRAM");
+ "Selects brightness control strategy: 0=auto, 1=EC, 2=UCMS, 3=EC+NVRAM");

 module_param(brightness_enable, uint, 0444);
 MODULE_PARM_DESC(brightness_enable,
@@ -9299,18 +9269,15 @@ MODULE_PARM_DESC(brightness_enable,
 #ifdef CONFIG_THINKPAD_ACPI_ALSA_SUPPORT
 module_param_named(volume_mode, volume_mode, uint, 0444);
 MODULE_PARM_DESC(volume_mode,
- "Selects volume control strategy: "
- "0=auto, 1=EC, 2=N/A, 3=EC+NVRAM");
+ "Selects volume control strategy: 0=auto, 1=EC, 2=N/A, 3=EC+NVRAM");

 module_param_named(volume_capabilities, volume_capabilities, uint, 0444);
 MODULE_PARM_DESC(volume_capabilities,
- "Selects the mixer capabilites: "
- "0=auto, 1=volume and mute, 2=mute only");
+ "Selects the mixer capabilites: 0=auto, 1=volume and mute, 2=mute only");

 module_param_named(volume_control, volume_control_allowed, bool, 0444);
 MODULE_PARM_DESC(volume_control,
- "Enables software override for the console audio "
- "control when true");
+ "Enables software override for the console audio control when true");

 module_param_named(software_mute, software_mute_requested, bool, 0444);
 MODULE_PARM_DESC(software_mute,
-- 
2.5.0
