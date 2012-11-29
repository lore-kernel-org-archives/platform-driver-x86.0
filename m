From: joeyli <jlee@suse.com>
Subject: Re: [PATCH 3/6] msi-laptop: Code cleanups
Date: Thu, 29 Nov 2012 16:10:40 +0800
Message-ID: <1354176640.21227.1212.camel@linux-s257.site>
References: <1353796141-1470-1-git-send-email-maxtram95@gmail.com>
	 <1353796141-1470-4-git-send-email-maxtram95@gmail.com>
	 <1354072310.21227.962.camel@linux-s257.site>
	 <CAKErNvozZ9GZjRUbeqiz53=5x4EMi+ST7YFfM5BQvhZPZ8P4kA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:38711 "EHLO
	smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752664Ab2K2ILl (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 29 Nov 2012 03:11:41 -0500
In-Reply-To: <CAKErNvozZ9GZjRUbeqiz53=5x4EMi+ST7YFfM5BQvhZPZ8P4kA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Maxim Mikityanskiy <maxtram95@gmail.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "Lee, Chun-Yi" <jlee@novell.com>, Matthew Garrett <mjg@redhat.com>

=E6=96=BC =E4=B8=89=EF=BC=8C2012-11-28 =E6=96=BC 19:32 +0200=EF=BC=8CMa=
xim Mikityanskiy =E6=8F=90=E5=88=B0=EF=BC=9A
> 2012/11/28 joeyli <jlee@suse.com>:
> > =E6=96=BC =E6=97=A5=EF=BC=8C2012-11-25 =E6=96=BC 00:28 +0200=EF=BC=8C=
Maxim Mikityanskiy =E6=8F=90=E5=88=B0=EF=BC=9A
> >> Replaced msi_init_rfkill() by msi_update_rfkill(), removed delays =
by
> >> replacing delayed works by just works and made msi_laptop_i8042_fi=
lter()
> >> filter out KEY_TOUCHPAD_TOGGLE when sending KEY_TOUCHPAD_ON and
> >> KEY_TOUCHPAD_OFF.
> >
> > Please separate to 2 patches, one for touchpad key and other one fo=
r
> > rfkill.
> >
> > And,
> > I am not agree for the clean up to msi_init_rfkill unless it causes
> > problem on U90/U100. Did you find any issue on U90/U100?
>=20
> In original code, we call get_wireless_state_ec_standard() in
> rfkill_init() in order to get initial rfkill state from hardware and
> after a second we call msi_init_rfkill() that sets rfkill state and
> writes it to hardware. msi_update_rfkill() reads rfkill state from
> hardware and sets it immediately. On U90/U100 writing to EC confuses
> it. In patch 4 I add a quirk in set_device_state() that blocks writin=
g
> to EC so msi_init_rfkill() should not cause any issue, but we would
> have unneeded 1 second delay and function calls.
>=20
> > I delay 1 magic second for msi_rfkill_init because there have other=
 MSI
> > model need a delay time after we set SCM mode through write EC
> > register.
> > So, please don't change the code for msi_init_rfkill delay work, ju=
st
> > keep it works with other MSI shipping machines.
>=20
> What do you think if I remove delay only for U90/U100 and keep it for
> other models?

Please consider to include this patch[1] to your msi-laptop patch set.
This patch introduced quirk_entry and merged quirk tables to
msi_dmi_table.

Currently I don't have msi machine on my hand, so I didn't test this
patch. Just feel free to modify or even separate it for put to your
patches.

And, I put a quirk that name is ec_delay, please consider to use this
quirk in your patch for add the 1 second (and 0.5 second) for other SCM
machines.

>=20
> >>
> >> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
> >> ---
> >>  drivers/platform/x86/msi-laptop.c | 67 ++++++++++++++------------=
-------------
> >>  1 file changed, 24 insertions(+), 43 deletions(-)
> >>
> >> diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/=
x86/msi-laptop.c
> >> index 7ba107a..3b6f494 100644
> >> --- a/drivers/platform/x86/msi-laptop.c
> >> +++ b/drivers/platform/x86/msi-laptop.c
> >> @@ -600,8 +600,23 @@ static const struct rfkill_ops rfkill_threeg_=
ops =3D {
> >>       .set_block =3D rfkill_threeg_set
> >>  };
=2E..
> >>  static bool msi_laptop_i8042_filter(unsigned char data, unsigned =
char str,
> >>                               struct serio *port)
> >> @@ -662,14 +664,16 @@ static bool msi_laptop_i8042_filter(unsigned=
 char data, unsigned char str,
> >>               extended =3D false;
> >>               switch (data) {
> >>               case 0xE4:
> >> -                     schedule_delayed_work(&msi_touchpad_work,
> >> -                             round_jiffies_relative(0.5 * HZ));
> >> -                     break;
> >> +                     schedule_work(&msi_touchpad_work);
> >
> > Don't remove the 0.5 magic delay, please! It will cause other shipp=
ed
> > MSI machines got problem could not capture the real change of EC
> > register.
>=20
> The same question here.
>=20

Here the same, please consider to use this quirk in your patch for add
the 0.5 second for other SCM machines.

> >> +             case 0x64:
> >> +                     /* Filter out KEY_TOUCHPAD_TOGGLE and send o=
nly
> >> +                      * KEY_TOUCHPAD_ON and KEY_TOUCHPAD_OFF
> >> +                      */
> >> +                     return true;
> >
> > Why this patch filter out 0x64 key? What's the scan code emitted wh=
en
> > press the touchpad on/off Fn key on U100? Does it emit
> > KEY_TOUCHPAD_TOGGLE and KEY_TOUCHPAD_ON/OFF at the same time?
>=20
> 0xE4 stands for Fn+F3 release and 0x64 stands for Fn+F3 press. So, if
> we do not use msi-laptop driver, we will get KEY_TOUCHPAD_TOGGLE
> (maybe from i8042 driver). If we load msi-laptop driver, it hooks
> Fn+F3 release and sends KEY_TOUCHPAD_ON/OFF, so userspace will receiv=
e
> KEY_TOUCHPAD_TOGGLE before KEY_TOUCHPAD_ON/OFF. So we need to filter
> out both Fn+F3 press and release, so that KEY_TOUCHPAD_TOGGLE will no=
t
> be sent.

OK, understood!

> >>               case 0x54:
> >>               case 0x62:
> >>               case 0x76:
> >> -                     schedule_delayed_work(&msi_rfkill_work,
> >> -                             round_jiffies_relative(0.5 * HZ));
> >> +                     schedule_work(&msi_rfkill_work);
> >>                       break;
> >>               }
=2E..

> >>       platform_device_del(msipf_device);
> >> @@ -976,7 +958,6 @@ static void __exit msi_cleanup(void)
> >>       if (load_scm_model) {
> >>               i8042_remove_filter(msi_laptop_i8042_filter);
> >>               msi_laptop_input_destroy();
> >> -             cancel_delayed_work_sync(&msi_rfkill_work);
> >>               rfkill_cleanup();
> >>       }


Thanks a lot!
Joey Lee

[1]

From 79db5e187ac10aea5f142ce0a352dcd17442c190 Mon Sep 17 00:00:00 2001
=46rom: "Lee, Chun-Yi" <jlee@suse.com>
Date: Fri, 30 Nov 2012 01:22:21 +0800
Subject: [PATCH] msi-laptop: merge quirk tables to one

This patch introduced a quirk_entry struct, then we merged all quirk ta=
bles to
msi_dmi_table. Then we can more easily to set different quirk attribute=
s for different
machine.

Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
---
 drivers/platform/x86/msi-laptop.c |  125 +++++++++++++++++++++--------=
--------
 1 file changed, 72 insertions(+), 53 deletions(-)

diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/m=
si-laptop.c
index 16e9863..2447128 100644
--- a/drivers/platform/x86/msi-laptop.c
+++ b/drivers/platform/x86/msi-laptop.c
@@ -119,29 +119,35 @@ static const struct key_entry msi_laptop_keymap[]=
 =3D {
=20
 static struct input_dev *msi_laptop_input_dev;
=20
-static bool old_ec_model;
 static int wlan_s, bluetooth_s, threeg_s;
 static int threeg_exists;
+static struct rfkill *rfk_wlan, *rfk_bluetooth, *rfk_threeg;
=20
-/* Some MSI 3G netbook only have one fn key to control Wlan/Bluetooth/=
3G,
- * those netbook will load the SCM (windows app) to disable the origin=
al
- * Wlan/Bluetooth control by BIOS when user press fn key, then control
- * Wlan/Bluetooth/3G by SCM (software control by OS). Without SCM, use=
r
- * cann't on/off 3G module on those 3G netbook.
- * On Linux, msi-laptop driver will do the same thing to disable the
- * original BIOS control, then might need use HAL or other userland
- * application to do the software control that simulate with SCM.
- * e.g. MSI N034 netbook
- */
-static bool load_scm_model;
+/* MSI laptop quirks */
+struct quirk_entry {
+	u8 old_ec_model;
+
+	/* Some MSI 3G netbook only have one fn key to control Wlan/Bluetooth=
/3G,
+	 * those netbook will load the SCM (windows app) to disable the origi=
nal
+	 * Wlan/Bluetooth control by BIOS when user press fn key, then contro=
l
+	 * Wlan/Bluetooth/3G by SCM (software control by OS). Without SCM, us=
er
+	 * cann't on/off 3G module on those 3G netbook.
+	 * On Linux, msi-laptop driver will do the same thing to disable the
+	 * original BIOS control, then might need use HAL or other userland
+	 * application to do the software control that simulate with SCM.
+	 * e.g. MSI N034 netbook
+	 */
+	u8 load_scm_model;
+	u8 ec_delay;
=20
-/* Some MSI Wind netbooks (e.g. MSI Wind U100) need loading SCM to get=
 some
- * features working (e.g. ECO mode), but we cannot change Wlan/Bluetoo=
th state
- * in software and we can only read its state.
- */
-static bool ec_read_only;
+	/* Some MSI Wind netbooks (e.g. MSI Wind U100) need loading SCM to ge=
t some
+	 * features working (e.g. ECO mode), but we cannot change Wlan/Blueto=
oth state
+	 * in software and we can only read its state.
+	 */
+	u8 ec_read_only;
+};
=20
-static struct rfkill *rfk_wlan, *rfk_bluetooth, *rfk_threeg;
+static struct quirk_entry *quirks;
=20
 /* Hardware access */
=20
@@ -213,7 +219,7 @@ static ssize_t set_device_state(const char *buf, si=
ze_t count, u8 mask)
 	if (sscanf(buf, "%i", &status) !=3D 1 || (status < 0 || status > 1))
 		return -EINVAL;
=20
-	if (ec_read_only)
+	if (quirks->ec_read_only)
 		return -EOPNOTSUPP;
=20
 	/* read current device state */
@@ -314,7 +320,7 @@ static ssize_t show_wlan(struct device *dev,
=20
 	int ret, enabled =3D 0;
=20
-	if (old_ec_model) {
+	if (quirks->old_ec_model) {
 		ret =3D get_wireless_state(&enabled, NULL);
 	} else {
 		ret =3D get_wireless_state_ec_standard();
@@ -338,7 +344,7 @@ static ssize_t show_bluetooth(struct device *dev,
=20
 	int ret, enabled =3D 0;
=20
-	if (old_ec_model) {
+	if (quirks->old_ec_model) {
 		ret =3D get_wireless_state(NULL, &enabled);
 	} else {
 		ret =3D get_wireless_state_ec_standard();
@@ -363,7 +369,7 @@ static ssize_t show_threeg(struct device *dev,
 	int ret;
=20
 	/* old msi ec not support 3G */
-	if (old_ec_model)
+	if (quirks->old_ec_model)
 		return -ENODEV;
=20
 	ret =3D get_wireless_state_ec_standard();
@@ -566,9 +572,29 @@ static struct platform_device *msipf_device;
=20
 /* Initialization */
=20
-static int dmi_check_cb(const struct dmi_system_id *id)
+static struct quirk_entry quirk_old_ec_model =3D {
+	.old_ec_model =3D 1,
+};
+
+static struct quirk_entry quirk_load_scm_model =3D {
+	.load_scm_model =3D 1,
+	.ec_delay =3D 1,
+};
+
+static struct quirk_entry quirk_load_scm_ro_model =3D {
+	.load_scm_model =3D 1,
+	.ec_read_only =3D 1,
+};
+
+static int dmi_check_cb(const struct dmi_system_id *dmi)
 {
-	pr_info("Identified laptop model '%s'\n", id->ident);
+	pr_info("Identified laptop model '%s'\n", dmi->ident);
+
+	if (dmi->driver_data)
+		quirks =3D dmi->driver_data;
+	else
+		quirks =3D &quirk_load_scm_model;
+
 	return 1;
 }
=20
@@ -582,6 +608,7 @@ static struct dmi_system_id __initdata msi_dmi_tabl=
e[] =3D {
 			DMI_MATCH(DMI_CHASSIS_VENDOR,
 				  "MICRO-STAR INT'L CO.,LTD")
 		},
+		.driver_data =3D &quirk_old_ec_model,
 		.callback =3D dmi_check_cb
 	},
 	{
@@ -592,6 +619,7 @@ static struct dmi_system_id __initdata msi_dmi_tabl=
e[] =3D {
 			DMI_MATCH(DMI_PRODUCT_VERSION, "0581"),
 			DMI_MATCH(DMI_BOARD_NAME, "MS-1058")
 		},
+		.driver_data =3D &quirk_old_ec_model,
 		.callback =3D dmi_check_cb
 	},
 	{
@@ -602,6 +630,7 @@ static struct dmi_system_id __initdata msi_dmi_tabl=
e[] =3D {
 			DMI_MATCH(DMI_BOARD_VENDOR, "MSI"),
 			DMI_MATCH(DMI_BOARD_NAME, "MS-1412")
 		},
+		.driver_data =3D &quirk_old_ec_model,
 		.callback =3D dmi_check_cb
 	},
 	{
@@ -613,12 +642,9 @@ static struct dmi_system_id __initdata msi_dmi_tab=
le[] =3D {
 			DMI_MATCH(DMI_CHASSIS_VENDOR,
 				  "MICRO-STAR INT'L CO.,LTD")
 		},
+		.driver_data =3D &quirk_old_ec_model,
 		.callback =3D dmi_check_cb
 	},
-	{ }
-};
-
-static struct dmi_system_id __initdata msi_load_scm_models_dmi_table[]=
 =3D {
 	{
 		.ident =3D "MSI N034",
 		.matches =3D {
@@ -628,6 +654,7 @@ static struct dmi_system_id __initdata msi_load_scm=
_models_dmi_table[] =3D {
 			DMI_MATCH(DMI_CHASSIS_VENDOR,
 			"MICRO-STAR INTERNATIONAL CO., LTD")
 		},
+		.driver_data =3D &quirk_load_scm_model,
 		.callback =3D dmi_check_cb
 	},
 	{
@@ -639,6 +666,7 @@ static struct dmi_system_id __initdata msi_load_scm=
_models_dmi_table[] =3D {
 			DMI_MATCH(DMI_CHASSIS_VENDOR,
 			"MICRO-STAR INTERNATIONAL CO., LTD")
 		},
+		.driver_data =3D &quirk_load_scm_model,
 		.callback =3D dmi_check_cb
 	},
 	{
@@ -648,6 +676,7 @@ static struct dmi_system_id __initdata msi_load_scm=
_models_dmi_table[] =3D {
 				"MICRO-STAR INTERNATIONAL CO., LTD"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "MS-N014"),
 		},
+		.driver_data =3D &quirk_load_scm_model,
 		.callback =3D dmi_check_cb
 	},
 	{
@@ -657,6 +686,7 @@ static struct dmi_system_id __initdata msi_load_scm=
_models_dmi_table[] =3D {
 				"Micro-Star International"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "CR620"),
 		},
+		.driver_data =3D &quirk_load_scm_model,
 		.callback =3D dmi_check_cb
 	},
 	{
@@ -666,12 +696,9 @@ static struct dmi_system_id __initdata msi_load_sc=
m_models_dmi_table[] =3D {
 				"Micro-Star International Co., Ltd."),
 			DMI_MATCH(DMI_PRODUCT_NAME, "U270 series"),
 		},
+		.driver_data =3D &quirk_load_scm_model,
 		.callback =3D dmi_check_cb
 	},
-	{ }
-};
-
-static struct dmi_system_id __initdata msi_load_scm_ro_models_dmi_tabl=
e[] =3D {
 	{
 		.ident =3D "MSI U90/U100",
 		.matches =3D {
@@ -679,6 +706,7 @@ static struct dmi_system_id __initdata msi_load_scm=
_ro_models_dmi_table[] =3D {
 				"MICRO-STAR INTERNATIONAL CO., LTD"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "U90/U100"),
 		},
+		.driver_data =3D &quirk_load_scm_ro_model,
 		.callback =3D dmi_check_cb
 	},
 	{ }
@@ -727,7 +755,7 @@ static const struct rfkill_ops rfkill_threeg_ops =3D=
 {
=20
 static bool msi_rfkill_set_state(struct rfkill *rfkill, bool blocked)
 {
-	if (ec_read_only)
+	if (quirks->ec_read_only)
 		return rfkill_set_hw_state(rfkill, blocked);
 	else
 		return rfkill_set_sw_state(rfkill, blocked);
@@ -877,7 +905,7 @@ static int msi_laptop_resume(struct device *device)
 	u8 data;
 	int result;
=20
-	if (!load_scm_model)
+	if (!quirks->load_scm_model)
 		return 0;
=20
 	/* set load SCM to disable hardware control by fn key */
@@ -935,7 +963,7 @@ static int __init load_scm_model_init(struct platfo=
rm_device *sdev)
 	u8 data;
 	int result;
=20
-	if (!ec_read_only) {
+	if (!quirks->ec_read_only) {
 		/* allow userland write sysfs file  */
 		dev_attr_bluetooth.store =3D store_bluetooth;
 		dev_attr_wlan.store =3D store_wlan;
@@ -992,21 +1020,12 @@ static int __init msi_init(void)
 	if (acpi_disabled)
 		return -ENODEV;
=20
-	if (force || dmi_check_system(msi_dmi_table))
-		old_ec_model =3D 1;
+	dmi_check_system(msi_dmi_table);
+	if (force)
+		quirks =3D &quirk_old_ec_model;
=20
-	if (!old_ec_model) {
+	if (!quirks->old_ec_model)
 		get_threeg_exists();
-		if (dmi_check_system(msi_load_scm_models_dmi_table))
-			load_scm_model =3D 1;
-		else if (dmi_check_system(msi_load_scm_ro_models_dmi_table)) {
-			load_scm_model =3D 1;
-			ec_read_only =3D 1;
-		}
-	}
-
-	if (!old_ec_model && dmi_check_system(msi_load_scm_models_dmi_table))
-		load_scm_model =3D 1;
=20
 	if (auto_brightness < 0 || auto_brightness > 2)
 		return -EINVAL;
@@ -1043,7 +1062,7 @@ static int __init msi_init(void)
 	if (ret)
 		goto fail_platform_device1;
=20
-	if (load_scm_model && (load_scm_model_init(msipf_device) < 0)) {
+	if (quirks->load_scm_model && (load_scm_model_init(msipf_device) < 0)=
) {
 		ret =3D -EINVAL;
 		goto fail_platform_device1;
 	}
@@ -1053,7 +1072,7 @@ static int __init msi_init(void)
 	if (ret)
 		goto fail_platform_device2;
=20
-	if (!old_ec_model) {
+	if (!quirks->old_ec_model) {
 		if (threeg_exists)
 			ret =3D device_create_file(&msipf_device->dev,
 						&dev_attr_threeg);
@@ -1074,7 +1093,7 @@ static int __init msi_init(void)
=20
 fail_platform_device2:
=20
-	if (load_scm_model) {
+	if (quirks->load_scm_model) {
 		i8042_remove_filter(msi_laptop_i8042_filter);
 		rfkill_cleanup();
 	}
@@ -1097,14 +1116,14 @@ fail_backlight:
=20
 static void __exit msi_cleanup(void)
 {
-	if (load_scm_model) {
+	if (quirks->load_scm_model) {
 		i8042_remove_filter(msi_laptop_i8042_filter);
 		msi_laptop_input_destroy();
 		rfkill_cleanup();
 	}
=20
 	sysfs_remove_group(&msipf_device->dev.kobj, &msipf_attribute_group);
-	if (!old_ec_model && threeg_exists)
+	if (!quirks->old_ec_model && threeg_exists)
 		device_remove_file(&msipf_device->dev, &dev_attr_threeg);
 	platform_device_unregister(msipf_device);
 	platform_driver_unregister(&msipf_driver);
--=20
1.7.10.4
