From: Andrew Lutomirski <luto@mit.edu>
Subject: Re: [PATCH v5] thinkpad-acpi: Improve hardware volume controls
Date: Fri, 12 Sep 2014 15:07:27 -0700
Message-ID: <CAObL_7F-w3f8R039JcenMeGpWx3dXrb6V3tVgxny7SJy717NNQ@mail.gmail.com>
References: <f51437579321e4bc26282fdc747e6c0c7657d2ad.1305837576.git.luto@mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-la0-f44.google.com ([209.85.215.44]:50087 "EHLO
	mail-la0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752164AbaILWHv (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 12 Sep 2014 18:07:51 -0400
Received: by mail-la0-f44.google.com with SMTP id mc6so1798954lab.17
        for <platform-driver-x86@vger.kernel.org>; Fri, 12 Sep 2014 15:07:48 -0700 (PDT)
In-Reply-To: <f51437579321e4bc26282fdc747e6c0c7657d2ad.1305837576.git.luto@mit.edu>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Andy Lutomirski <luto@mit.edu>, Matthew Garrett <mjg59@srcf.ucam.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Thu, May 19, 2011 at 1:41 PM, Andy Lutomirski <luto@mit.edu> wrote:
> From: Andy Lutomirski <luto@MIT.EDU>
>
> ThinkPads have hardware volume controls and three buttons to control
> them.  (These are separate from the standard mixer.)  By default,
> the buttons are:
>
>  - Mute: Mutes the hardware volume control and generates KEY_MUTE.
>  - Up: Unmutes, generates KEY_VOLUMEUP, and increases volume if
>    applicable.  (Newer thinkpads only have hardware mute/unmute.)
>  - Down: Unmutes, generates KEY_VOLUMEDOWN, and decreases volume
>    if applicable.
>
> This behavior is unfortunate, since modern userspace will also
> handle the hotkeys and change the other mixer.  If the software
> mixer is muted and the hardware mixer is unmuted and you push mute,
> hilarity ensues as they both switch state.

This patch seems to have fallen into oblivion.  My X220s still has
screwy mute controls.  (To reproduce in GNOME 3, get into an unmuted,
nonzero volume state, then press volume down a bunch of times until a
mute icon shows up, then press mute, then press volume up.  You are
now have no sound until you fiddle with the hardware controls a bunch
and undo it.)

I can rebase this to 3.17-whatever, but I'm also somewhat inclined to
get rid of all the compatibility bits and just modify the driver to
force all Thinkpads into nonmagical software-only mode.  The latter
approach will be *much* simpler

Thoughts?

--Andy

>
> For better or worse, the ThinkPad ACPI code checks _OSI(Linux) and
> changes the behavior of the buttons to generate keypresses and do
> nothing else.  This is an improvement, since the hardware mixer
> isn't really necessary.  We only set _OSI(Linux) on a very small
> set of modles, though.
>
> It's worse on very new ThinkPads like the X220, which have a mute
> indicator controlled by the hardware mixer.  The only way to make
> it work is to have the mute button control the hardware mixer (or
> to have some userspace hack to change the hardware mixer when you
> ask for "mute").
>
> It turns out that we can ask ACPI for one of three behaviors
> directly on very new models.  They are "latch" (the default),
> "none" (no automatic control), and "toggle" (mute unmutes when
> muted).  So we let the user control the mode through sysfs, and
> we don't generate KEY_MUTE in any mode other than "none".
>
> (Actually, that's a lie.  No model I've tested gets all of these
> modes quite right, we we just emulate them in software.)
>
> As an added bonus, we fix an old bug: the hardware mute control
> doesn't generate an ALSA change notification on newer ThinkPads.
>
> Signed-off-by: Andy Lutomirski <luto@mit.edu>
> ---
>
> Changes from v4:
>  - Don't lose volume_autocontrol sysfs setting on resume.
>
> Changes from v3:
>  - Emulate autocontrol instead of letting firmware do it.  This is much
>    better behaved on X200s and on X220 it lets us turn off typematic repeat
>    of the mute button (which is IMO just silly).
>  - Wait 1ms when changing volume -- the X200s gets inconsistent results
>    otherwise (and 200us is not long enough).
>
> Changes from v2:
>  - Use an i8042 platform filter instead of an input filter.
>  - Don't generate ALSA notification on hotkey release.
>
> Changes from v1:
>  - Read HAUM on startup, which gives the correct default (toggle)
>    on X220 and should preserve the "none" behavior on systems that
>    set acpi_osi=Linux.
>  - Enable all of the controls on systems with hardware volume control,
>    for ease of testing.
>  - Back out HKEY modifications that didn't do anything -- that code
>    was already correct.
>
>  drivers/platform/x86/thinkpad_acpi.c |  379 +++++++++++++++++++++++++++++++++-
>  1 files changed, 378 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 562fcf0..28972d4 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -73,6 +73,8 @@
>  #include <linux/leds.h>
>  #include <linux/rfkill.h>
>  #include <asm/uaccess.h>
> +#include <linux/i8042.h>
> +#include <linux/serio.h>
>
>  #include <linux/dmi.h>
>  #include <linux/jiffies.h>
> @@ -6454,6 +6456,15 @@ static struct ibm_struct brightness_driver_data = {
>   * bits 3-0 (volume).  Other bits in NVRAM may have other functions,
>   * such as bit 7 which is used to detect repeated presses of MUTE,
>   * and we leave them unchanged.
> + *
> + * The firmware can optionally automatically change the volume
> + * in response to user input.  Historically, we've assumed that this
> + * feature is off (and we've quirked _OSI="Linux" to get this behavior),
> + * so, if we can't find the explicit control we keep the historical
> + * behavior.
> + *
> + * On new Lenovos (e.g. X220), the mute button has an indicator light,
> + * so it's nice to get this right.
>   */
>
>  #ifdef CONFIG_THINKPAD_ACPI_ALSA_SUPPORT
> @@ -6503,12 +6514,29 @@ enum tpacpi_volume_capabilities {
>         TPACPI_VOL_CAP_MAX
>  };
>
> +enum tpacpi_volume_autocontrol {
> +       TPACPI_VOL_AUTO_LATCH  = 0,     /* Mute mutes; up/down unmutes */
> +       /* 1 might be the same as 2 */
> +       TPACPI_VOL_AUTO_NONE   = 2,     /* No automatic control at all */
> +       TPACPI_VOL_AUTO_TOGGLE = 3,     /* Mute toggles; up/down unmutes */
> +};
> +
> +static const char *tpacpi_volume_autocontrol_names[] = {
> +       [TPACPI_VOL_AUTO_LATCH] = "latch",
> +       [TPACPI_VOL_AUTO_NONE] = "none",
> +       [TPACPI_VOL_AUTO_TOGGLE] = "toggle",
> +};
> +
>  static enum tpacpi_volume_access_mode volume_mode =
>         TPACPI_VOL_MODE_MAX;
>
>  static enum tpacpi_volume_capabilities volume_capabilities;
>  static int volume_control_allowed;
>
> +static enum tpacpi_volume_autocontrol volume_autocontrol = TPACPI_VOL_AUTO_NONE;
> +static enum tpacpi_volume_autocontrol initial_volume_autocontrol;
> +static bool volume_autocontrol_configurable = false;
> +
>  /*
>   * Used to syncronize writers to TP_EC_AUDIO and
>   * TP_NVRAM_ADDR_MIXER, as we need to do read-modify-write
> @@ -6586,6 +6614,12 @@ static int volume_set_status_ec(const u8 status)
>
>         dbg_printk(TPACPI_DBG_MIXER, "set EC mixer to 0x%02x\n", status);
>
> +       /*
> +        * On X200s, it can take awhile for reads to become
> +        * correct.
> +        */
> +       msleep(1);
> +
>         return 0;
>  }
>
> @@ -6612,8 +6646,15 @@ static int __volume_set_mute_ec(const bool mute)
>
>         if (n != s) {
>                 rc = volume_set_status_ec(n);
> -               if (!rc)
> +               if (!rc) {
>                         rc = 1;
> +
> +                       /*
> +                        * On X200s, it can take awhile for reads to become
> +                        * correct.
> +                        */
> +                       msleep(1);
> +               }
>         }
>
>  unlock:
> @@ -6621,6 +6662,22 @@ unlock:
>         return rc;
>  }
>
> +static int volume_toggle_mute(void)
> +{
> +       int rc;
> +       u8 s;
> +
> +       if (mutex_lock_killable(&volume_mutex) < 0)
> +               return -EINTR;
> +
> +       rc = volume_get_status_ec(&s);
> +       if (rc == 0)
> +               rc = volume_set_status_ec(s ^ TP_EC_AUDIO_MUTESW_MSK);
> +
> +       mutex_unlock(&volume_mutex);
> +       return rc;
> +}
> +
>  static int volume_alsa_set_mute(const bool mute)
>  {
>         dbg_printk(TPACPI_DBG_MIXER, "ALSA: trying to %smute\n",
> @@ -6668,6 +6725,306 @@ unlock:
>         return rc;
>  }
>
> +static int volume_write_autocontrol(enum tpacpi_volume_autocontrol val)
> +{
> +       int rc = 0;
> +       int result;
> +
> +       if (!volume_autocontrol_configurable)
> +               return -EIO;
> +
> +       if (mutex_lock_killable(&volume_mutex) < 0)
> +               return -EINTR;
> +
> +       if (!acpi_evalf(ec_handle, &result, "SAUM", "qdd", (int)val)) {
> +               rc = -EIO;
> +               goto out;
> +       }
> +
> +       /* On success, SAUM returns what it programmed. */
> +       if (result != val) {
> +               rc = -EIO;
> +               goto out;
> +       }
> +
> +out:
> +       mutex_unlock(&volume_mutex);
> +       return rc;
> +}
> +
> +/* This should only be used at startup.  We keep a shadow for later use. */
> +static int volume_read_autocontrol(enum tpacpi_volume_autocontrol *ret)
> +{
> +       int result;
> +
> +       if (!acpi_evalf(ec_handle, &result, "HAUM", "qd"))
> +               return -EIO;
> +
> +       if (result < 0 ||
> +           result >= ARRAY_SIZE(tpacpi_volume_autocontrol_names) ||
> +           !tpacpi_volume_autocontrol_names[result])
> +               return -EINVAL;
> +
> +       *ret = result;
> +       return 0;
> +}
> +
> +static void volume_alsa_notify_change(void);
> +
> +/*
> + * Intercept mute, volume up, and volume down, and emulate what firmware
> + * wants to do.  (The firmware does it differently on different models,
> + * and every model I've tested gets it at least a little wrong.)
> + */
> +
> +static void volume_emulate_mute_worker(struct work_struct *work)
> +{
> +       if (volume_autocontrol == TPACPI_VOL_AUTO_TOGGLE) {
> +               volume_toggle_mute();
> +               volume_alsa_notify_change();
> +       } else {
> +               if (__volume_set_mute_ec(true) == 1)
> +                       volume_alsa_notify_change();
> +       }
> +
> +}
> +static struct work_struct volume_emulate_mute_work;
> +
> +static bool volume_emulate_mute(void)
> +{
> +       if (volume_autocontrol == TPACPI_VOL_AUTO_NONE) {
> +               return false;  /* just pass the event */
> +       } else {
> +               queue_work(tpacpi_wq, &volume_emulate_mute_work);
> +               return true;
> +       }
> +}
> +
> +static void volume_emulate_updown_worker(struct work_struct *work)
> +{
> +       if (__volume_set_mute_ec(false) == 1)
> +               volume_alsa_notify_change();
> +
> +       /*
> +        * There are no known models that have both SAUM and hardware
> +        * volume (as opposed to just mute), so that's all we do.
> +        */
> +}
> +static struct work_struct volume_emulate_updown_work;
> +
> +static void volume_emulate_updown(void)
> +{
> +       if (volume_autocontrol != TPACPI_VOL_AUTO_NONE)
> +               queue_work(tpacpi_wq, &volume_emulate_updown_work);
> +}
> +
> +static bool tpacpi_i8042_filter(unsigned char data, unsigned char str,
> +                               struct serio *port)
> +{
> +       bool steal_event = false;
> +
> +       /* Was the last event extended and, if so, what was its str? */
> +       static bool extended;
> +       static unsigned char extended_str;
> +       static struct serio *extended_port;
> +
> +       bool prev_extended;
> +       unsigned char prev_extended_str;
> +       struct serio *prev_extended_port;
> +
> +       /* Which buttons are pressed? */
> +       static bool mute_pressed = false;
> +       /* Don't mess with the AUX port. */
> +       if (port->id.type != SERIO_8042_XL)
> +               return false;
> +
> +       /* Save the previous extended prefix, if any */
> +       prev_extended = extended;
> +       prev_extended_str = extended_str;
> +       prev_extended_port = extended_port;
> +       extended = 0;
> +
> +       /* Paranoia: we shouldn't see AUX messages here. */
> +       WARN_ON_ONCE(str & 0x20);
> +
> +       if (data == 0xe0) {
> +               /* Beginning of an extended event.  Steal it for now. */
> +               extended = true;
> +               extended_str = str;
> +               extended_port = port;
> +               steal_event = true;
> +       } else if (prev_extended) {
> +               /* Rest of an extended event.  Which one? */
> +               switch (data) {
> +               case 0x20: /* press mute (or hold mute) */
> +                       if (mute_pressed) {
> +                               steal_event = true;  /* no typematic repeat */
> +                       } else {
> +                               steal_event = volume_emulate_mute();
> +                               mute_pressed = true;
> +                       }
> +                       break;
> +
> +               case 0xA0: /* release mute */
> +                       steal_event =
> +                               (volume_autocontrol != TPACPI_VOL_AUTO_NONE);
> +                       mute_pressed = false;
> +                       break;
> +
> +               case 0x2E: /* volume up */
> +               case 0x30: /* volume down */
> +                       volume_emulate_updown();
> +                       volume_alsa_notify_change();
> +                       break;
> +               }
> +       }
> +
> +       /* Reinject the previous 0xe0 if we ate it. */
> +       if (!steal_event && prev_extended &&
> +           !WARN_ON_ONCE(prev_extended_port != port))
> +               serio_interrupt(port, 0xe0,
> +                               (prev_extended_str & 80) ? SERIO_PARITY : 0);
> +
> +       return steal_event;
> +}
> +
> +static ssize_t volume_autocontrol_show(struct device *dev,
> +                                      struct device_attribute *attr,
> +                                      char *buf)
> +{
> +       ssize_t ret;
> +
> +       ret = mutex_lock_killable(&volume_mutex);
> +       if (ret < 0)
> +               return ret;
> +
> +       ret = snprintf(buf, PAGE_SIZE, "%s\n",
> +                      tpacpi_volume_autocontrol_names[volume_autocontrol]);
> +
> +       mutex_unlock(&volume_mutex);
> +       return ret;
> +}
> +
> +static ssize_t volume_autocontrol_store(struct device *dev,
> +                                       struct device_attribute *attr,
> +                                       const char *buf, size_t count)
> +{
> +       int i;
> +       const char *p;
> +       size_t len;
> +
> +       p = memchr(buf, '\n', count);
> +       len = p ? p - buf : count;
> +
> +       for (i = 0; i < ARRAY_SIZE(tpacpi_volume_autocontrol_names); i++) {
> +               const char *name = tpacpi_volume_autocontrol_names[i];
> +               if (name && !strncmp(name, buf, len)) {
> +                       int ret = mutex_lock_killable(&volume_mutex);
> +                       if (ret == 0) {
> +                               volume_autocontrol = i;
> +                               mutex_unlock(&volume_mutex);
> +                       }
> +                       if (ret < 0)
> +                               return ret;
> +                       return count;
> +               }
> +       }
> +
> +       return -EINVAL;
> +}
> +
> +static struct device_attribute dev_attr_volume_autocontrol =
> +       __ATTR(volume_autocontrol, 0,
> +               volume_autocontrol_show, volume_autocontrol_store);
> +
> +static struct attribute *volume_attributes[] = {
> +       &dev_attr_volume_autocontrol.attr,
> +       NULL
> +};
> +
> +static const struct attribute_group volume_attr_group = {
> +       .attrs = volume_attributes,
> +};
> +
> +static int volume_autocontrol_init(void)
> +{
> +       int rc = 0;
> +
> +       /* Try to initialize autocontrol */
> +       volume_autocontrol_configurable = true;
> +       rc = volume_read_autocontrol(&initial_volume_autocontrol);
> +       if (rc != 0) {
> +               vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_MIXER,
> +                           "failed to read volume autocontrol\n");
> +               goto out;
> +       }
> +
> +       /* Write the value we just read, to make sure we can restore. */
> +       rc = volume_write_autocontrol(initial_volume_autocontrol);
> +       if (rc != 0) {
> +               vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_MIXER,
> +                           "failed test write to volume autocontrol\n");
> +               goto out_norestore;
> +       }
> +
> +       /* Turn off hardware control, because we'll emulate it. */
> +       rc = volume_write_autocontrol(TPACPI_VOL_AUTO_NONE);
> +       if (rc != 0) {
> +               printk(TPACPI_ERR
> +                      "failed to disable hardware volume autocontrol\n");
> +               goto out_norestore;
> +       }
> +
> +       /* We're in business.  Install the i8042 filter for emulation. */
> +       INIT_WORK(&volume_emulate_mute_work, volume_emulate_mute_worker);
> +       INIT_WORK(&volume_emulate_updown_work, volume_emulate_updown_worker);
> +       rc = i8042_install_filter(&tpacpi_i8042_filter);
> +       if (rc != 0) {
> +               printk(TPACPI_ERR "failed to register i8042 filter\n");
> +               goto out;
> +       }
> +
> +       dev_attr_volume_autocontrol.attr.mode =
> +               (volume_autocontrol_configurable ? S_IWUSR | S_IRUGO : S_IRUGO);
> +       rc = sysfs_create_group(&tpacpi_pdev->dev.kobj, &volume_attr_group);
> +       if (rc != 0)
> +               printk(TPACPI_ERR "failed to init volume_autocontrol group\n");
> +
> +       volume_autocontrol = initial_volume_autocontrol;
> +       vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_MIXER,
> +                   "volume autocontrol available; initial state %d\n",
> +                   (int)initial_volume_autocontrol);
> +
> +out:
> +       if (rc)
> +               volume_write_autocontrol(initial_volume_autocontrol);
> +
> +out_norestore:
> +       if (rc) {
> +               volume_autocontrol_configurable = false;
> +               i8042_remove_filter(&tpacpi_i8042_filter);  /* always safe */
> +
> +               /* Maintain historical behavior. */
> +               volume_autocontrol = TPACPI_VOL_AUTO_NONE;
> +       }
> +
> +       return rc;
> +}
> +
> +void volume_autocontrol_exit(void)
> +{
> +       i8042_remove_filter(&tpacpi_i8042_filter);  /* always safe */
> +
> +       if (work_pending(&volume_emulate_mute_work) ||
> +           work_pending(&volume_emulate_updown_work))
> +               flush_workqueue(tpacpi_wq);
> +
> +       volume_write_autocontrol(initial_volume_autocontrol);
> +       volume_autocontrol_configurable = false;
> +       sysfs_remove_group(&tpacpi_pdev->dev.kobj, &volume_attr_group);
> +
> +}
> +
>  static int volume_alsa_set_volume(const u8 vol)
>  {
>         dbg_printk(TPACPI_DBG_MIXER,
> @@ -6775,6 +7132,10 @@ static void volume_suspend(pm_message_t state)
>
>  static void volume_resume(void)
>  {
> +       if (volume_autocontrol_configurable &&
> +           volume_write_autocontrol(TPACPI_VOL_AUTO_NONE) < 0)
> +               printk(TPACPI_ERR "failed to restore volume autocontrol\n");
> +
>         volume_alsa_notify_change();
>  }
>
> @@ -6785,6 +7146,8 @@ static void volume_shutdown(void)
>
>  static void volume_exit(void)
>  {
> +       volume_autocontrol_exit();
> +
>         if (alsa_card) {
>                 snd_card_free(alsa_card);
>                 alsa_card = NULL;
> @@ -6999,7 +7362,21 @@ static int __init volume_init(struct ibm_init_struct *iibm)
>                         | TP_ACPI_HKEY_VOLDWN_MASK
>                         | TP_ACPI_HKEY_MUTE_MASK);
>
> +       rc = volume_autocontrol_init();
> +       if (rc < 0)
> +               goto err;
> +
>         return 0;
> +
> +err:
> +       i8042_remove_filter(&tpacpi_i8042_filter);
> +
> +       if (alsa_card) {
> +               snd_card_free(alsa_card);
> +               alsa_card = NULL;
> +       }
> +
> +       return rc;
>  }
>
>  static int volume_read(struct seq_file *m)
> --
> 1.7.5.1
>
