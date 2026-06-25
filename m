Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290AE34753A
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jun 2026 11:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782388462; cv=none; b=MxEt7FmVgOS96U8NimAMfeL6sdcTdW06rYNzdguohw/6rpo4wDMnzw3SlfTBcCm2r5aJUAHbwq67JdT5f4ziJQ4fJ+cti2RmT7T6mhirehIQpbL4l7LTu0DVBuaNeE/bgZUlwH3plHiEhmKyQFTEvd1KF1aJxdqvLBwvkB1/0Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782388462; c=relaxed/simple;
	bh=Ei2iOCMv4pEnqQl4/OR+DBFAgdwYewxXuuK1fOJejdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ISJpOrUi2qTSJam+kSa93S9CKJ71a3lyvagsH90uvR7Rb8I23Q+tyUL1uq8qiqlOGjr551L83crVrgHV7mkQ6h5l91dMXuyDF/5919zwFco15tOoP4/q0EmWXKLDdnRAFLEvrsOAidZXmtirLQHqhlK/Ar64nggz5CmFpyzMcE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ooqVtORz; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ooqVtORz"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8e59f64471eso18703326d6.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jun 2026 04:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782388459; x=1782993259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PUOpUAvXJA3ROIyaq5lhwloRHnQR7KKg6TXZDLpnkxY=;
        b=ooqVtORzEhUGMcHzYVPziQLqF/hz99enumztkdLvhOF+fnCmVorJHOhsDkWodWN+d8
         atD2Fq51Ex/JzCZ2taVB3je5xszYl8A/rlrTDjvOSyriMoUJYnH0tn9PSkYBXE3C5/Pg
         Hte7oySRj5Qhj8ay64JGR2YJYo9fPsqNH3DekhkoI1GJo3gGYcD7AB+REwfXSVQ6w0fA
         sLTa0Cdr4V8k0N6DqlqYXn3cnrPb1tzppL93NlpMp+HCOSyxisGG/BVIUXW9gtpk/LoL
         9Gxl8NDYnZlmJD32rAzjxzKbSxjiLb83OFegthZx2aCBfzwcoSPfqdFQOaLehTEhX352
         S2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782388459; x=1782993259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PUOpUAvXJA3ROIyaq5lhwloRHnQR7KKg6TXZDLpnkxY=;
        b=k7dcX+bjLMqOuylAS3Wj0yG1RgzyNxyR8S5JAFkkOIZ2W3KdsqRnp1XhkaZDOytY91
         /Jp2A+oS/379rgTGx0OC0/xPg5x+zsR0e1H8bsnd49186whuG+fsgOouoe+Ii9l63a52
         Bl3yYjxFRgsbArkrzB1b+ItUHVxgMSCxv5KPTXmD22VpxfDZpaRx7v8BktvDLEoucdyc
         JN7SLXcSVgmBoxEZf4x4Lj3dLDw5+8RM3CkeiDMeTGlxDEC+/GTPpmeDXJ6dKxtC+xuJ
         RLnyM2z8PH2Ba4w6+4CsUIThwsRytNPhB3mD3CWp5Wsy1Oh60R26ReKi5PwDWSJ+4R+h
         gXvg==
X-Gm-Message-State: AOJu0YwnSht6hEn+b0ssSfQ+ly9TLYVQt/lQE3JzlJIayTlvmF+faPk5
	/xXEPVlWGROSB/70bQANA+UmSUcStnZMm6JLQ6cXKF/X1VLEGkVvZG7i+dE6Vr2uOga1Ug==
X-Gm-Gg: AfdE7clirlK/xLUSzISlIXC8WIU3y5lgUpllgAY7q2ePidviWjSD8CckeJ8/G/mvkWo
	b2poEXDTKvVrdiH8HMC/hOFBpnm47iMwD0tlKhKljB0jhMtiv/iL2R+rc8U6CQc1HTWGgKj/YXk
	Yu1FwvnHoGBW8PDHXBRsD40K586g6FUgd6W5LN1NUgL/NoJ9ds3Cu3ik6tXfqOrJ48Wz1muwzJX
	ui5gxbq4EpUMycKs3DJ0bK/WJRr9FbRSk0xXzLKKWKdBHvDulU9O4Vz7ZaUMMZkSBv0FJjYGmwR
	5G/q9746Rw23e8uTq4yJVPDaE2mdNgcSJei0G0Pw70TiAxqIYtMijIyePSLatWSTdDwvIREWCcv
	PNYblk4oG8AQXExM0X/vX9zZpax0PtsbP+IsxEPUCL1N2o6CBVc81kAiLQZP6lh9EfcitB6NWGh
	oTJcULSv5UbtUcUspCL4Eg3/xKr0ll2rjnBRvtkryAQCVZ
X-Received: by 2002:ad4:5b83:0:b0:8dd:ace4:6f17 with SMTP id 6a1803df08f44-8e6d8001417mr37482126d6.10.1782388458767;
        Thu, 25 Jun 2026 04:54:18 -0700 (PDT)
Received: from localhost ([112.204.126.243])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-8df8268ef00sm176885836d6.40.2026.06.25.04.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 04:54:18 -0700 (PDT)
From: Alex Yeo <alexyeo362@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: alexyeo362@gmail.com,
	Kenneth Chan <kenneth.t.chan@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [RFC PATCH v3] platform/x86: panasonic-laptop: add fan speed mode for newer models
Date: Thu, 25 Jun 2026 19:50:31 +0800
Message-ID: <20260625115034.773908-1-alexyeo362@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <b687f9d8-a996-2f04-d803-e267cf140b57@linux.intel.com>
References: <b687f9d8-a996-2f04-d803-e267cf140b57@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I have a CF-SR4 and Linux works out of the box. Compared to
previous models, this one seems to have the fans running at high speed
by default when the computer starts.

When Windows 11 is booted up, the high fan speeds persist just until the
login screen. Once the login screen shows up, the fan spins down.

I had suspected that this might be the laptop ramping down the fans when
the OS declares that it is Windows but this does not seem to be the
case.

After analyzing the DSDT and SSDT of the computer, I have found the
following:

File ssdt10.dsl under \_SB.PC00.LPCB.EC0:

Name (CEFM, Zero)
Method (SEFM, 1, Serialized)
{
    CEFM = Arg0
    REFM ()
}

Method (REFM, 0, Serialized)
{
    If ((\S0IX == 0x03))
    {
        Local0 = 0x05
    }
    ElseIf ((CEFM == Zero))
    {
        Local0 = Zero
    }
    Else
    {
        Local0 = 0x02
    }

    \_SB.PC00.LPCB.EC0.EC88 (0xB5, 0x79, Local0, Zero)
}

\_SB.PC00.LPCB.EC0.CEFM would seem be the current value
for the fan profile. On startup, this is set to 0.

Based on the code SEFM seems the be the method to set the fan
profile and REFM is executed right after.

I don't have access to information as to what the argument officially
means but based on testing, any number above zero makes the fans spin
down and behave like the older models where it stops or runs at low
speed when its cool and ramps up when the processor gets hot.

The only relevant values for CEFM seem to be just 0 and any number above
that just gets treated the same. I personally use just 0 and 1.
0 seems to be the high fan speed mode and 1 makes it behave like
Windows.

Giving 0 as an argument reverts the fan back to the way it was during
startup where the lowest fan speed is quite high and when load is
applied, it seems to ramp up to an even higher speed which I think would
be its 100%.

A value of 1 seems to have its max speed capped lower than 0.

For both modes, fan management is still automatic.

fan_mode only shows up in sysfs only if \_SB.PC00.LPCB.EC0.CEFM and
\_SB.PC00.LPCB.EC0.SEFM are both present which should mean it should not
show up on unsupported models. I have tried not hiding it and it just
outputs a generic error when the value is read.

I also saw that variables such as eco_mode are kept in memory, however
for fan_mode I rely on getting and setting the value via ACPI.

Signed-off-by: Alex Yeo <alexyeo362@gmail.com>
---
> Can we somehow read how fast the fan currently spins so the information
> could be exposed through hwmon?
> 
> You may want to look more information about hwmon and pwm as to me it
> sounds pretty a good match to the fan control (based on your explanation
> about about OS controlling fan speed in 0-100 range).

Thank you for pointing out hwmon and pwm. I have made significant
changes and rewrote the fan control so its registered as an hwmon pwm
device. I have also added it to the thermal subsystem.
All the fan sysfs functions have been removed.

> Thus, you should simply add the missing includes finally now when you add
> more code that uses stuff from those includes.

I have also added the missing includes:
> +#include <linux/printk.h>
> +#include <linux/sysfs.h>

And I have added the following as I intend to use hwmon, thermal and
DMI:
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/thermal.h>
> +#include <linux/dmi.h>

I have added this for the errors I used such as EOPNOTSUPP:
> +#include <asm-generic/errno.h>

To play it safe, I think I should only assume that the fan works for my
specific model. I have looked into the other drivers and how this can be
implemented . Using quirks seems to be the standard way.

> +/* DMI matching for quirks copied from asus-nb-wmi.c */
> +static int dmi_matched(const struct dmi_system_id *dmi)
> +{
> +	pr_info("Identified laptop model '%s'\n", dmi->ident);
> +	quirks = dmi->driver_data;
> +	return 1;
> +}
> +
> +static const struct dmi_system_id pcc_quirks[] = {
> +	{
> +		.callback = dmi_matched,
> +		.ident = "Panasonic Connect Co., Ltd. CFSR4-1",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Panasonic Connect Co., Ltd."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "CFSR4-1"),
> +		},
> +		.driver_data = &quirk_cf_sr4,
> +	},
> +	{},
>  };

I had based it from asus-nb-wmi.c
The hwmon and thermal cooling (cdev) device registration will not happen
unless the vendor and product name match.

> +	/* use hwmon convention for pwm_mode */
> +	if (state == ACPI_PCC_FAN_PWM_AUTO) {
> +		*pwm_mode = HWMON_PCC_FAN_PWM_AUTO;
> +	} else if (state != 0 && state > 0) {
> +		*pwm_mode = HWMON_PCC_FAN_PWM_MANUAL;
> +	} else {

In this part, I originally used the actual numerical values for the fan
being in EC mode and in manual mode. However, it may be confusing so I
declared it:

> +#define ACPI_PCC_FAN_PWM_AUTO	0x00
> +#define ACPI_PCC_FAN_PWM_MANUAL	0x01
> +#define HWMON_PCC_FAN_PWM_AUTO	0x00
> +#define HWMON_PCC_FAN_PWM_MANUAL	0x01

The values are the same but I made the distinction between the hwmon
standard value and what the ACPI function returns.
This might be useful for readability or if it is changed
or modified in the future.

> +	struct thermal_cooling_device	*pwm_fan_cdev;

While I did register the hwmon device with devm so it does not need
cleanup, this is not the case with the thermal cooling device. I added
it to the pcc_acpi struct so it can be properly cleaned up when the
driver is unloaded.

Currently, with an unmodified driver, there is a fan exposed by ACPI but
it always reads N/A when viewed using the sensors command:

acpi_fan-isa-0000
Adapter: ISA adapter
fan1:             N/A

The output is the same regardless of whether or not the fan is
controlled by the EC or manually.

When the computer starts up, control is always handed over to the
EC. Even on a restart, the BIOS will switch it back to EC control.
When a Linux OS boots up, it is expected that the PWM fan will read
N/A as the value from _FST (fan status) is not related at all to the
actual speed the fan is running.

panasonic_pwm_fan-isa-0000
Adapter: ISA adapter
pwm1:              N/A

When in manual mode, it will look like the ff:

panasonic_pwm_fan-isa-0000
Adapter: ISA adapter
pwm1:              0%  MANUAL CONTROL

I do have a question I want to ask regarding fan control. There is an
ACPI command that needs to be called first to set the fan to manual
control. When in EC mode, setting the fan speed via _FSL will not do
anything. This is why the code will check the current fan mode first
before setting the fan level.

Should the code automatically set the fan to manual mode first when the
fan speed is set?

For example,
$ echo 50 | sudo tee "/sys/devices/platform/MAT0019:00/hwmon/hwmon6/pwm1"

If the following is executed and the fan is still controlled by the EC,
should the driver automatically run the command to switch the fan into
manual mode? The current behavior is it does for both hwmon and thermal.

For the hwmon and thermal device I have named it the following:
hwmon: "panasonic_pwm_fan"
> +		hwmon_dev = devm_hwmon_device_register_with_info(
> +			&pdev->dev, "panasonic_pwm_fan", NULL,
> +			&pcc_pwm_fan_hwmon_chip_info, NULL);
thermal: "Panasonic_PWM_Fan"
> +		pcc->pwm_fan_cdev = thermal_cooling_device_register(
> +			"Panasonic_PWM_Fan", NULL, &pcc_pwm_fan_cdev_ops);

If it would be more helpful I can put these into a #define at the top of
the file.

I am currently using this patch on my computer and it works with
thermald. Though I need to specify which cooling device type to use.

The way the fan works:
\_SB.PC00.LPCB.EC0.SEFM - 0 for EC and 1 for manual (there is a 5 but
that seems to be reserved for S01X sleep)

\_SB.PC00.LPCB.EC0.TFN1._FSL - accepts 0-100 and appears to be the
standard _FSL function defined in the ACPI spec but in a non-standard
path. If set without setting the fan mode, it is ignored by the system.
0 turns off the fan and 100 sets it to full speed. When the command is
given, the EC slowly ramps up the fan speed (not instant).

\_SB.PC00.LPCB.EC0.TFN1._FST - the second element contains the current
fan speed. This is only reflective of actual speed when the fan mode is
set to manual.

When in manual mode, the EC intervenes to turn the fan on if the
processor gets hot (around ~90 degrees Celsius).

The fan would be controlled like this from the OS:
In the case of hwmon:
$ echo 0 | sudo tee /sys/class/hwmon/hwmon6/pwm1 # turn fan off
$ echo 255 | sudo tee /sys/class/hwmon/hwmon6/pwm1 # full speed
$ echo 70 | sudo tee /sys/class/hwmon/hwmon6/pwm1 # any value in between
$ echo 0 | sudo tee /sys/class/hwmon/hwmon6/pwm1_enable # EC mode
$ echo 1 | sudo tee /sys/class/hwmon/hwmon6/pwm1_enable # manual mode

Setting a speed via hwmon will automatically put the fan into manual
mode. This will be reflected when pwm1_enable is called.

For thermal:
$ echo 0 | sudo tee /sys/class/thermal/cooling_device14/cur_state # off
$ echo 100 | sudo tee /sys/class/thermal/cooling_device14/cur_state # max
$ echo 50 | sudo tee /sys/class/thermal/cooling_device14/cur_state # 50%

The driver always queries the current state of the fan (both the fan
speed and the fan mode) from ACPI and does not retain the state within
the module.

To summarize, I have added hwmon and thermal for the fan. To prevent
this from affecting other models, I have implemented quirks that use DMI
vendor and product name.

For thermald I currently use the thermal subsystem to control the fan
via trip points. With this patch and thermald, it is now set and forget on my
computer (the fan is not stuck at ~80% anymore).

I have also added one more modification that was not mentioned
earlier.

> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

I have added this at the top of the file so that messages from this
module are more easily identified.

> [93927.430133] Unknown hotkey event: 0x0031
I get a lot of these on dmesg and having it be:
> [93927.430133] panasonic_laptop: Unknown hotkey event: 0x0031
instead makes it easier to determine where this is from.
(happens when I press the fn key)


> So what happens if you do echo -1 instead? Your changelog only talked
> about positive values.

> +	/* check if within bounds */
> +	if (set_pwm_speed < 0 || set_pwm_speed > 100) {
> +		pr_err("%s: error: fan speed level out of bounds\n", __func__);
> +		result = -EIO;
> +		goto out;
> +	}

For this one I have added checks to make sure only values 0-100 are set.
Its not sysfs input so kstrtouint is not used anymore.

Thank you for taking a look.

 drivers/platform/x86/panasonic-laptop.c | 461 +++++++++++++++++++++++-
 1 file changed, 447 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index b83113c26f88..59419cdd857e 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -119,6 +119,9 @@
  *		- v0.1  start from toshiba_acpi driver written by John Belmonte
  */
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/printk.h>
 #include <linux/acpi.h>
 #include <linux/backlight.h>
 #include <linux/bits.h>
@@ -136,6 +139,12 @@
 #include <linux/types.h>
 #include <linux/uaccess.h>
 #include <acpi/video.h>
+#include <linux/sysfs.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/thermal.h>
+#include <linux/dmi.h>
+#include <asm-generic/errno.h>
 
 MODULE_AUTHOR("Hiroshi Miura <miura@da-cha.org>");
 MODULE_AUTHOR("David Bronaugh <dbronaugh@linuxboxen.org>");
@@ -164,6 +173,17 @@ MODULE_LICENSE("GPL");
 
 #define ACPI_PCC_INPUT_PHYS	"panasonic/hkey0"
 
+/* Define fan PWM modes */
+#define ACPI_PCC_FAN_PWM_AUTO		0x00
+#define ACPI_PCC_FAN_PWM_MANUAL	0x01
+#define HWMON_PCC_FAN_PWM_AUTO		0x00
+#define HWMON_PCC_FAN_PWM_MANUAL	0x01
+
+/* Define quirks for this driver */
+struct quirk_entry {
+	bool has_ospm_pwm_fan;
+};
+
 /* LCD_TYPEs: 0 = Normal, 1 = Semi-transparent
    ECO_MODEs: 0x03 = off, 0x83 = on
 */
@@ -238,19 +258,50 @@ static const struct key_entry panasonic_keymap[] = {
 };
 
 struct pcc_acpi {
-	acpi_handle		handle;
-	unsigned long		num_sifr;
-	int			sticky_key;
-	int			eco_mode;
-	int			mute;
-	int			ac_brightness;
-	int			dc_brightness;
-	int			current_brightness;
-	u32			*sinf;
-	struct acpi_device	*device;
-	struct input_dev	*input_dev;
-	struct backlight_device	*backlight;
-	struct platform_device	*platform;
+	acpi_handle			handle;
+	unsigned long			num_sifr;
+	int				sticky_key;
+	int				eco_mode;
+	int				mute;
+	int				ac_brightness;
+	int				dc_brightness;
+	int				current_brightness;
+	u32				*sinf;
+	struct acpi_device		*device;
+	struct input_dev		*input_dev;
+	struct backlight_device		*backlight;
+	struct platform_device		*platform;
+	struct thermal_cooling_device	*pwm_fan_cdev;
+};
+
+/*
+ * Declare quirks and apply matches
+ */
+static struct quirk_entry *quirks;
+
+static struct quirk_entry quirk_cf_sr4 = {
+	.has_ospm_pwm_fan = true,
+};
+
+/* DMI matching for quirks copied from asus-nb-wmi.c */
+static int dmi_matched(const struct dmi_system_id *dmi)
+{
+	pr_info("Identified laptop model '%s'\n", dmi->ident);
+	quirks = dmi->driver_data;
+	return 1;
+}
+
+static const struct dmi_system_id pcc_quirks[] = {
+	{
+		.callback = dmi_matched,
+		.ident = "Panasonic Connect Co., Ltd. CFSR4-1",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Panasonic Connect Co., Ltd."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "CFSR4-1"),
+		},
+		.driver_data = &quirk_cf_sr4,
+	},
+	{},
 };
 
 /*
@@ -415,7 +466,6 @@ static const struct backlight_ops pcc_backlight_ops = {
 	.update_status	= bl_set_status,
 };
 
-
 /* returns ACPI_SUCCESS if methods to control optical drive are present */
 
 static acpi_status check_optd_present(void)
@@ -507,6 +557,179 @@ static int set_optd_power_state(int new_state)
 	return result;
 }
 
+/* get OSPM fan mode */
+
+static int pcc_pwm_fan_mode_read(int *pwm_mode)
+{
+	unsigned long long state;
+	acpi_status status;
+	int result;
+
+	/* BIOS default is zero which seems to be some sort of failsafe mode */
+	status = acpi_evaluate_integer(NULL, "\\_SB.PC00.LPCB.EC0.CEFM", NULL,
+				       &state);
+	if (ACPI_FAILURE(status)) {
+		pr_err("error: cannot get fan mode via CEFM\n");
+		result = -EIO;
+		goto out;
+	}
+
+	/* use hwmon convention for pwm_mode */
+	if (state == ACPI_PCC_FAN_PWM_AUTO) {
+		*pwm_mode = HWMON_PCC_FAN_PWM_AUTO;
+	} else if (state != 0 && state > 0) {
+		*pwm_mode = HWMON_PCC_FAN_PWM_MANUAL;
+	} else {
+		/* unknown */
+		result = -EINVAL;
+		goto out;
+	}
+
+	result = AE_OK;
+
+out:
+	return result;
+}
+
+/* set OSPM fan mode */
+
+static int pcc_pwm_fan_mode_set(int pwm_mode)
+{
+	acpi_status status;
+	int result;
+
+	union acpi_object param[1];
+	struct acpi_object_list input;
+
+	param[0].type = ACPI_TYPE_INTEGER;
+	param[0].integer.value = pwm_mode;
+	input.count = 1; /* takes one arg */
+	input.pointer = param;
+
+	status = acpi_evaluate_object(NULL, "\\_SB.PC00.LPCB.EC0.SEFM", &input,
+				      NULL);
+	if (ACPI_FAILURE(status)) {
+		pr_err("error: cannot set fan mode via SEFM\n");
+		result = -EINVAL;
+		goto out;
+	}
+
+	result = AE_OK;
+
+out:
+	return result;
+}
+
+/* read PWM fan speed */
+
+static int pcc_pwm_fan_speed_read(int *pwm_speed)
+{
+	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *obj;
+	acpi_status status;
+	int pwm_mode;
+	int result;
+
+
+	/* Get fan status first */
+	/* If fan is not in manual mode, it will return a bogus value */
+	status = pcc_pwm_fan_mode_read(&pwm_mode);
+	if (ACPI_FAILURE(status)) {
+		pr_err("%s: failed to get fan status\n", __func__);
+		result = -EIO;
+		goto out;
+	}
+
+	if (pwm_mode == HWMON_PCC_FAN_PWM_AUTO) {
+		result = -ENODATA; /* Indeterminate value */
+		goto out;
+	}
+
+	/* get pwm speed */
+	status = acpi_evaluate_object(NULL, "\\_SB.PC00.LPCB.EC0.TFN1._FST",
+				      NULL, &buffer);
+	if (ACPI_FAILURE(status)) {
+		pr_err("%s: failed to get pwm speed\n", __func__);
+		result = -EIO;
+		goto out;
+	}
+
+	obj = buffer.pointer;
+
+	/* the structure should have 3 values */
+	if (!obj || obj->type != ACPI_TYPE_PACKAGE || obj->package.count < 2) {
+		pr_err("Invalid _FST package structure (expected 3)\n");
+		result = -EINVAL;
+		goto out;
+	}
+
+	/* the second element should be the pwm speed as an int */
+	if (obj->package.elements[1].type != ACPI_TYPE_INTEGER) {
+		pr_err("_FST element at index 1 is not an integer\n");
+		result = -EINVAL;
+		goto out;
+	}
+
+	*pwm_speed = obj->package.elements[1].integer.value;
+	result = AE_OK;
+
+out:
+	kfree(buffer.pointer);
+	return result;
+}
+
+/* set PWM fan speed */
+
+static int pcc_pwm_fan_speed_set(int set_pwm_speed)
+{
+	struct acpi_object_list input;
+	union acpi_object param[1];
+	acpi_status status;
+	int pwm_mode;
+	int result;
+
+	/* Get fan status. set to manual if not set */
+	status = pcc_pwm_fan_mode_read(&pwm_mode);
+	if (ACPI_FAILURE(status)) {
+		pr_err("%s: failed to get fan status\n", __func__);
+		result = -EIO;
+		goto out;
+	}
+
+	if (pwm_mode == HWMON_PCC_FAN_PWM_AUTO) {
+		status = pcc_pwm_fan_mode_set(HWMON_PCC_FAN_PWM_MANUAL);
+		if (ACPI_FAILURE(status)) {
+			pr_err("%s: set fan PWM to manual failed\n", __func__);
+			result = -EIO;
+			goto out;
+		}
+	}
+
+	/* check if within bounds */
+	if (set_pwm_speed < 0 || set_pwm_speed > 100) {
+		pr_err("%s: error: fan speed level out of bounds\n", __func__);
+		result = -EIO;
+		goto out;
+	}
+
+	param[0].type = ACPI_TYPE_INTEGER;
+	param[0].integer.value = set_pwm_speed;
+	input.count = 1; /* takes one arg */
+	input.pointer = param;
+
+	status = acpi_evaluate_object(NULL, "\\_SB.PC00.LPCB.EC0.TFN1._FSL",
+				      &input, NULL);
+	if (ACPI_FAILURE(status)) {
+		pr_err("Setting of fan speed via ._FSL failed.\n");
+		result = -EINVAL;
+		goto out;
+	}
+
+	result = AE_OK;
+
+out:
+	return result;
+}
 
 /* sysfs user interface functions */
 
@@ -676,6 +899,7 @@ static ssize_t ac_brightness_show(struct device *dev, struct device_attribute *a
 	return sysfs_emit(buf, "%u\n", pcc->sinf[SINF_AC_CUR_BRIGHT]);
 }
 
+
 static ssize_t ac_brightness_store(struct device *dev, struct device_attribute *attr,
 				   const char *buf, size_t count)
 {
@@ -825,6 +1049,178 @@ static const struct attribute_group pcc_attr_group = {
 	.is_visible	= pcc_sysfs_is_visible,
 };
 
+/* hwmon */
+
+static const struct hwmon_channel_info *const pcc_pwm_fan_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_ENABLE), NULL
+};
+
+static int pcc_pwm_fan_hwmon_read(struct device *dev,
+				  enum hwmon_sensor_types type, u32 attr,
+				  int channel, long *val)
+{
+	acpi_status status;
+	int pwm_speed;
+	int pwm_mode;
+
+	if (type != hwmon_pwm)
+		return -EOPNOTSUPP;
+
+	switch (attr) {
+	case hwmon_pwm_input:
+		status = pcc_pwm_fan_speed_read(&pwm_speed);
+		if (ACPI_FAILURE(status)) {
+			pr_err("%s: failed to get fan pwm speed\n", __func__);
+			return -ENODATA;
+		}
+		*val = (pwm_speed * 255) / 100;
+		return 0;
+	case hwmon_pwm_enable:
+		status = pcc_pwm_fan_mode_read(&pwm_mode);
+		if (ACPI_FAILURE(status)) {
+			pr_err("%s: failed to get fan pwm mode\n", __func__);
+			return -ENODATA;
+		}
+		if (pwm_mode == HWMON_PCC_FAN_PWM_AUTO) {
+			*val = HWMON_PCC_FAN_PWM_AUTO;
+		} else if (pwm_mode == HWMON_PCC_FAN_PWM_MANUAL) {
+			*val = HWMON_PCC_FAN_PWM_MANUAL;
+		} else { /* Invalid value */
+			return -EIO;
+		}
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int pcc_pwm_fan_hwmon_write(struct device *dev,
+				   enum hwmon_sensor_types type, u32 attr,
+				   int channel, long val)
+{
+	int pwm_speed_vendor_val;
+	acpi_status status;
+
+	if (type != hwmon_pwm)
+		return -EOPNOTSUPP;
+
+	switch (attr) {
+	case hwmon_pwm_enable:
+		if (val == HWMON_PCC_FAN_PWM_AUTO) {
+			status = pcc_pwm_fan_mode_set(HWMON_PCC_FAN_PWM_AUTO);
+			if (ACPI_FAILURE(status)) {
+				pr_err("%s: failed to set fan to auto mode\n", __func__);
+				return -EIO;
+			}
+			return 0;
+		} else if (val == HWMON_PCC_FAN_PWM_MANUAL) {
+			status = pcc_pwm_fan_mode_set(HWMON_PCC_FAN_PWM_MANUAL);
+			if (ACPI_FAILURE(status)) {
+				pr_err("%s: failed to set fan to manual mode\n", __func__);
+				return -EIO;
+			}
+			return 0;
+		}
+		return -EINVAL;
+	case hwmon_pwm_input:
+		val = clamp_val(val, 0, 255);
+		pwm_speed_vendor_val = (val * 100) / 255;
+
+		status = pcc_pwm_fan_speed_set(pwm_speed_vendor_val);
+		if (ACPI_FAILURE(status)) {
+			pr_err("%s: failed to set fan pwm\n", __func__);
+			return -EIO;
+		}
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static umode_t pcc_pwm_fan_hwmon_is_visible(const void *data,
+					    enum hwmon_sensor_types type,
+					    u32 attr, int channel)
+{
+	if (type != hwmon_pwm)
+		return 0;
+
+	return 0644;
+}
+
+static const struct hwmon_ops pcc_pwm_fan_hwmon_ops = {
+	.is_visible = pcc_pwm_fan_hwmon_is_visible,
+	.read = pcc_pwm_fan_hwmon_read,
+	.write = pcc_pwm_fan_hwmon_write,
+};
+
+static const struct hwmon_chip_info pcc_pwm_fan_hwmon_chip_info = {
+	.ops = &pcc_pwm_fan_hwmon_ops,
+	.info = pcc_pwm_fan_hwmon_info,
+};
+
+/* thermal interface */
+static int pcc_pwm_fan_thermal_max_state(struct thermal_cooling_device *cdev,
+					 unsigned long *state)
+{
+	*state = 100; /* range of 0-100 as per UEFI spec */
+	return 0;
+}
+static int
+pcc_pwm_fan_thermal_get_current_pwm(struct thermal_cooling_device *cdev,
+				    unsigned long *state)
+{
+	acpi_status status;
+	int current_pwm;
+	int pwm_mode;
+
+	status = pcc_pwm_fan_mode_read(&pwm_mode);
+	if (ACPI_FAILURE(status)) {
+		pr_err("%s: failed to get fan pwm mode\n", __func__);
+		return -ENODATA;
+	}
+	if (pwm_mode == HWMON_PCC_FAN_PWM_AUTO) {
+		*state = 100; /* Return failsafe value on EC mode */
+		return 0;
+	}
+
+	status = pcc_pwm_fan_speed_read(&current_pwm);
+	if (ACPI_FAILURE(status)) {
+		pr_err("%s: failed to get fan pwm mode\n", __func__);
+		return -ENODATA;
+	}
+
+	if (current_pwm > 100)
+		current_pwm = 100;
+	if (current_pwm < 0)
+		return -EINVAL;
+
+	*state = current_pwm;
+
+	return 0;
+}
+static int pcc_pwm_fan_thermal_set_fan_pwm(struct thermal_cooling_device *cdev,
+					   unsigned long state)
+{
+	acpi_status status;
+	int set_pwm;
+
+	if (state > 100 || state < 0)
+		return -EINVAL;
+
+	set_pwm = state;
+	status = pcc_pwm_fan_speed_set(set_pwm);
+	if (ACPI_FAILURE(status)) {
+		pr_err("%s: failed to set fan speed pwm\n", __func__);
+		return -EIO;
+	}
+
+	return 0;
+}
+static const struct thermal_cooling_device_ops pcc_pwm_fan_cdev_ops = {
+	.get_max_state = pcc_pwm_fan_thermal_max_state,
+	.get_cur_state = pcc_pwm_fan_thermal_get_current_pwm,
+	.set_cur_state = pcc_pwm_fan_thermal_set_fan_pwm,
+};
 
 /* hotkey input device driver */
 
@@ -981,8 +1377,10 @@ static int acpi_pcc_hotkey_resume(struct device *dev)
 
 static int acpi_pcc_hotkey_probe(struct platform_device *pdev)
 {
+	const struct dmi_system_id *dmi_id;
 	struct backlight_properties props;
 	struct acpi_device *device;
+	struct device *hwmon_dev;
 	struct pcc_acpi *pcc;
 	int num_sifr, result;
 
@@ -1026,6 +1424,17 @@ static int acpi_pcc_hotkey_probe(struct platform_device *pdev)
 	strscpy(acpi_device_name(device), ACPI_PCC_DEVICE_NAME);
 	strscpy(acpi_device_class(device), ACPI_PCC_CLASS);
 
+	/*
+	 * Perform quirk detection
+	 */
+	dmi_id = dmi_first_match(pcc_quirks);
+	if (dmi_id) {
+		pcc->quirks = dmi_id->driver_data;
+		pr_info("Quirk detect: Enabled quirks for %s\n", dmi_id->ident);
+	} else {
+		pcc->quirks = NULL;
+	}
+
 	result = acpi_pcc_init_input(pcc);
 	if (result) {
 		pr_err("Error installing keyinput handler\n");
@@ -1097,6 +1506,27 @@ static int acpi_pcc_hotkey_probe(struct platform_device *pdev)
 	}
 
 	i8042_install_filter(panasonic_i8042_filter, NULL);
+
+	/* has_ospm_pwm_fan - add hwmon and thermal if present */
+	if (pcc->quirks->has_ospm_pwm_fan) {
+		pr_info("has_ospm_pwm_fan quirk: adding hwmon for %s\n", dmi_id->ident);
+		hwmon_dev = devm_hwmon_device_register_with_info(
+			&pdev->dev, "panasonic_pwm_fan", NULL,
+			&pcc_pwm_fan_hwmon_chip_info, NULL);
+		if (IS_ERR(hwmon_dev)) {
+			pr_err("has_ospm_pwm_fan: Failed to register hwmon device\n");
+			return PTR_ERR(hwmon_dev);
+		}
+
+		pr_info("has_ospm_pwm_fan quirk: adding thermal for %s\n", dmi_id->ident);
+		pcc->pwm_fan_cdev = thermal_cooling_device_register(
+			"Panasonic_PWM_Fan", NULL, &pcc_pwm_fan_cdev_ops);
+		if (IS_ERR(pcc->pwm_fan_cdev)) {
+			pr_warn("has_ospm_pwm_fan: Failed to register thermal cdev\n");
+			pcc->pwm_fan_cdev = NULL;
+		}
+	}
+
 	return 0;
 
 out_platform:
@@ -1124,6 +1554,9 @@ static void acpi_pcc_hotkey_remove(struct platform_device *pdev)
 	struct acpi_device *device = ACPI_COMPANION(&pdev->dev);
 	struct pcc_acpi *pcc = acpi_driver_data(device);
 
+	if (pcc->pwm_fan_cdev)
+		thermal_cooling_device_unregister(pcc->pwm_fan_cdev);
+
 	i8042_remove_filter(panasonic_i8042_filter);
 
 	if (pcc->platform) {
-- 
2.54.0

