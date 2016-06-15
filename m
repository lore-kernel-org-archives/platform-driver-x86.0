From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH v3 4/4] dell-wmi: Generate one sparse keymap for all machines
Date: Wed, 15 Jun 2016 21:49:13 +0200
Message-ID: <1466020153-10877-5-git-send-email-pali.rohar@gmail.com>
References: <1466020153-10877-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1466020153-10877-1-git-send-email-pali.rohar@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: Mario Limonciello <mario_limonciello@dell.com>, Andy Lutomirski <luto@kernel.org>, Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

This patch reworks code for generating sparse keymap and processing WMI
events. It unifies procedure for generating sparse keymap and also unif=
ies
big switch code for processing WMI events of different types. After thi=
s
patch dell-wmi driver does not differ between "old" and "new" hotkey ty=
pe.

It constructs sparse keymap table with all WMI codes. It is because on =
some
laptops (e.g. Dell Latitude E6440) ACPI/firmware send both event types =
(old
and new).

Each WMI code in sparse keymap table is prefixed by 16bit event type, s=
o it
does not change functionality on laptops with "old" hotkey support (tho=
se
without scancodes in DMI).

This allow us to distinguish between same WMI codes with different type=
s in
sparse keymap. Thanks to this WMI events of type 0x0011 were moved from=
 big
switch into sparse keymap table too.

This patch also fixes possible bug in parsing WMI event buffer introduc=
ed
in commit 5ea2559726b7 ("dell-wmi: Add support for new Dell systems"). =
That
commit changed buffer type from int* to u16* without fixing code. More =
at:
http://lkml.iu.edu/hypermail/linux/kernel/1507.0/01950.html

Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
Tested-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
Reviewed-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
---
 drivers/platform/x86/dell-wmi.c |  215 +++++++++++++++++++------------=
--------
 1 file changed, 104 insertions(+), 111 deletions(-)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/del=
l-wmi.c
index 41ae79d..b8ad055 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -80,12 +80,13 @@ static const struct dmi_system_id dell_wmi_smbios_l=
ist[] __initconst =3D {
 };
=20
 /*
+ * Keymap for WMI events of type 0x0000
+ *
  * Certain keys are flagged as KE_IGNORE. All of these are either
  * notifications (rather than requests for change) or are also sent
  * via the keyboard controller so should not be sent again.
  */
-
-static const struct key_entry dell_wmi_legacy_keymap[] __initconst =3D=
 {
+static const struct key_entry dell_wmi_keymap_type_0000[] __initconst =
=3D {
 	{ KE_IGNORE, 0x003a, { KEY_CAPSLOCK } },
=20
 	/* Key code is followed by brightness level */
@@ -183,12 +184,8 @@ static const struct key_entry dell_wmi_legacy_keym=
ap[] __initconst =3D {
 	{ KE_IGNORE, 0xe0f7, { KEY_MUTE } },
 	{ KE_IGNORE, 0xe0f8, { KEY_VOLUMEDOWN } },
 	{ KE_IGNORE, 0xe0f9, { KEY_VOLUMEUP } },
-
-	{ KE_END, 0 }
 };
=20
-static bool dell_new_hk_type;
-
 struct dell_bios_keymap_entry {
 	u16 scancode;
 	u16 keycode;
@@ -202,6 +199,7 @@ struct dell_bios_hotkey_table {
=20
 struct dell_dmi_results {
 	int err;
+	int keymap_size;
 	struct key_entry *keymap;
 };
=20
@@ -250,10 +248,12 @@ static const u16 bios_to_linux_keycode[256] __ini=
tconst =3D {
 };
=20
 /*
+ * Keymap for WMI events of type 0x0010
+ *
  * These are applied if the 0xB2 DMI hotkey table is present and doesn=
't
  * override them.
  */
-static const struct key_entry dell_wmi_extra_keymap[] __initconst =3D =
{
+static const struct key_entry dell_wmi_keymap_type_0010[] __initconst =
=3D {
 	/* Fn-lock */
 	{ KE_IGNORE, 0x151, { KEY_RESERVED } },
=20
@@ -273,21 +273,39 @@ static const struct key_entry dell_wmi_extra_keym=
ap[] __initconst =3D {
 	{ KE_IGNORE, 0x155, { KEY_RESERVED } },
 };
=20
+/*
+ * Keymap for WMI events of type 0x0011
+ */
+static const struct key_entry dell_wmi_keymap_type_0011[] __initconst =
=3D {
+	/* Battery unplugged */
+	{ KE_IGNORE, 0xfff0, { KEY_RESERVED } },
+
+	/* Battery inserted */
+	{ KE_IGNORE, 0xfff1, { KEY_RESERVED } },
+
+	/* Keyboard backlight level changed */
+	{ KE_IGNORE, 0x01e1, { KEY_RESERVED } },
+	{ KE_IGNORE, 0x02ea, { KEY_RESERVED } },
+	{ KE_IGNORE, 0x02eb, { KEY_RESERVED } },
+	{ KE_IGNORE, 0x02ec, { KEY_RESERVED } },
+	{ KE_IGNORE, 0x02f6, { KEY_RESERVED } },
+};
+
 static struct input_dev *dell_wmi_input_dev;
=20
-static void dell_wmi_process_key(int reported_key)
+static void dell_wmi_process_key(int type, int code)
 {
 	const struct key_entry *key;
=20
 	key =3D sparse_keymap_entry_from_scancode(dell_wmi_input_dev,
-						reported_key);
+						(type << 16) | code);
 	if (!key) {
-		pr_info("Unknown key with scancode 0x%x pressed\n",
-			reported_key);
+		pr_info("Unknown key with type 0x%04x and code 0x%04x pressed\n",
+			type, code);
 		return;
 	}
=20
-	pr_debug("Key %x pressed\n", reported_key);
+	pr_debug("Key with type 0x%04x and code 0x%04x pressed\n", type, code=
);
=20
 	/* Don't report brightness notifications that will also come via ACPI=
 */
 	if ((key->keycode =3D=3D KEY_BRIGHTNESSUP ||
@@ -295,7 +313,7 @@ static void dell_wmi_process_key(int reported_key)
 	    acpi_video_handles_brightness_key_presses())
 		return;
=20
-	if (reported_key =3D=3D 0xe025 && !wmi_requires_smbios_request)
+	if (type =3D=3D 0x0000 && code =3D=3D 0xe025 && !wmi_requires_smbios_=
request)
 		return;
=20
 	sparse_keymap_report_entry(dell_wmi_input_dev, key, 1, true);
@@ -333,18 +351,6 @@ static void dell_wmi_notify(u32 value, void *conte=
xt)
=20
 	buffer_entry =3D (u16 *)obj->buffer.pointer;
 	buffer_size =3D obj->buffer.length/2;
-
-	if (!dell_new_hk_type) {
-		if (buffer_size >=3D 3 && buffer_entry[1] =3D=3D 0x0)
-			dell_wmi_process_key(buffer_entry[2]);
-		else if (buffer_size >=3D 2)
-			dell_wmi_process_key(buffer_entry[1]);
-		else
-			pr_info("Received unknown WMI event\n");
-		kfree(obj);
-		return;
-	}
-
 	buffer_end =3D buffer_entry + buffer_size;
=20
 	/*
@@ -379,62 +385,18 @@ static void dell_wmi_notify(u32 value, void *cont=
ext)
 		pr_debug("Process buffer (%*ph)\n", len*2, buffer_entry);
=20
 		switch (buffer_entry[1]) {
-		case 0x00:
-			for (i =3D 2; i < len; ++i) {
-				switch (buffer_entry[i]) {
-				case 0xe043:
-					/* NIC Link is Up */
-					pr_debug("NIC Link is Up\n");
-					break;
-				case 0xe044:
-					/* NIC Link is Down */
-					pr_debug("NIC Link is Down\n");
-					break;
-				case 0xe045:
-					/* Unknown event but defined in DSDT */
-				default:
-					/* Unknown event */
-					pr_info("Unknown WMI event type 0x00: "
-						"0x%x\n", (int)buffer_entry[i]);
-					break;
-				}
-			}
+		case 0x0000: /* One key pressed or event occurred */
+			if (len > 2)
+				dell_wmi_process_key(0x0000, buffer_entry[2]);
+			/* Other entries could contain additional information */
 			break;
-		case 0x10:
-			/* Keys pressed */
+		case 0x0010: /* Sequence of keys pressed */
+		case 0x0011: /* Sequence of events occurred */
 			for (i =3D 2; i < len; ++i)
-				dell_wmi_process_key(buffer_entry[i]);
-			break;
-		case 0x11:
-			for (i =3D 2; i < len; ++i) {
-				switch (buffer_entry[i]) {
-				case 0xfff0:
-					/* Battery unplugged */
-					pr_debug("Battery unplugged\n");
-					break;
-				case 0xfff1:
-					/* Battery inserted */
-					pr_debug("Battery inserted\n");
-					break;
-				case 0x01e1:
-				case 0x02ea:
-				case 0x02eb:
-				case 0x02ec:
-				case 0x02f6:
-					/* Keyboard backlight level changed */
-					pr_debug("Keyboard backlight level "
-						 "changed\n");
-					break;
-				default:
-					/* Unknown event */
-					pr_info("Unknown WMI event type 0x11: "
-						"0x%x\n", (int)buffer_entry[i]);
-					break;
-				}
-			}
+				dell_wmi_process_key(buffer_entry[1],
+						     buffer_entry[i]);
 			break;
-		default:
-			/* Unknown event */
+		default: /* Unknown event */
 			pr_info("Unknown WMI event type 0x%x\n",
 				(int)buffer_entry[1]);
 			break;
@@ -459,7 +421,6 @@ static bool have_scancode(u32 scancode, const struc=
t key_entry *keymap, int len)
 }
=20
 static void __init handle_dmi_entry(const struct dmi_header *dm,
-
 				    void *opaque)
=20
 {
@@ -467,7 +428,6 @@ static void __init handle_dmi_entry(const struct dm=
i_header *dm,
 	struct dell_bios_hotkey_table *table;
 	int hotkey_num, i, pos =3D 0;
 	struct key_entry *keymap;
-	int num_bios_keys;
=20
 	if (results->err || results->keymap)
 		return;		/* We already found the hotkey table. */
@@ -491,8 +451,7 @@ static void __init handle_dmi_entry(const struct dm=
i_header *dm,
 		return;
 	}
=20
-	keymap =3D kcalloc(hotkey_num + ARRAY_SIZE(dell_wmi_extra_keymap) + 1=
,
-			 sizeof(struct key_entry), GFP_KERNEL);
+	keymap =3D kcalloc(hotkey_num, sizeof(struct key_entry), GFP_KERNEL);
 	if (!keymap) {
 		results->err =3D -ENOMEM;
 		return;
@@ -529,31 +488,15 @@ static void __init handle_dmi_entry(const struct =
dmi_header *dm,
 		pos++;
 	}
=20
-	num_bios_keys =3D pos;
-
-	for (i =3D 0; i < ARRAY_SIZE(dell_wmi_extra_keymap); i++) {
-		const struct key_entry *entry =3D &dell_wmi_extra_keymap[i];
-
-		/*
-		 * Check if we've already found this scancode.  This takes
-		 * quadratic time, but it doesn't matter unless the list
-		 * of extra keys gets very long.
-		 */
-		if (!have_scancode(entry->code, keymap, num_bios_keys)) {
-			keymap[pos] =3D *entry;
-			pos++;
-		}
-	}
-
-	keymap[pos].type =3D KE_END;
-
 	results->keymap =3D keymap;
+	results->keymap_size =3D pos;
 }
=20
 static int __init dell_wmi_input_setup(void)
 {
 	struct dell_dmi_results dmi_results =3D {};
-	int err;
+	struct key_entry *keymap;
+	int err, i, pos =3D 0;
=20
 	dell_wmi_input_dev =3D input_allocate_device();
 	if (!dell_wmi_input_dev)
@@ -577,21 +520,71 @@ static int __init dell_wmi_input_setup(void)
 		goto err_free_dev;
 	}
=20
-	if (dmi_results.keymap) {
-		dell_new_hk_type =3D true;
+	keymap =3D kcalloc(dmi_results.keymap_size +
+			 ARRAY_SIZE(dell_wmi_keymap_type_0000) +
+			 ARRAY_SIZE(dell_wmi_keymap_type_0010) +
+			 ARRAY_SIZE(dell_wmi_keymap_type_0011) +
+			 1,
+			 sizeof(struct key_entry), GFP_KERNEL);
+	if (!keymap) {
+		kfree(dmi_results.keymap);
+		err =3D -ENOMEM;
+		goto err_free_dev;
+	}
=20
-		err =3D sparse_keymap_setup(dell_wmi_input_dev,
-					  dmi_results.keymap, NULL);
+	/* Append table with events of type 0x0010 which comes from DMI */
+	for (i =3D 0; i < dmi_results.keymap_size; i++) {
+		keymap[pos] =3D dmi_results.keymap[i];
+		keymap[pos].code |=3D (0x0010 << 16);
+		pos++;
+	}
+
+	kfree(dmi_results.keymap);
+
+	/* Append table with extra events of type 0x0010 which are not in DMI=
 */
+	for (i =3D 0; i < ARRAY_SIZE(dell_wmi_keymap_type_0010); i++) {
+		const struct key_entry *entry =3D &dell_wmi_keymap_type_0010[i];
=20
 		/*
-		 * Sparse keymap library makes a copy of keymap so we
-		 * don't need the original one that was allocated.
+		 * Check if we've already found this scancode.  This takes
+		 * quadratic time, but it doesn't matter unless the list
+		 * of extra keys gets very long.
 		 */
-		kfree(dmi_results.keymap);
-	} else {
-		err =3D sparse_keymap_setup(dell_wmi_input_dev,
-					  dell_wmi_legacy_keymap, NULL);
+		if (dmi_results.keymap_size &&
+		    have_scancode(entry->code | (0x0010 << 16),
+				  keymap, dmi_results.keymap_size)
+		   )
+			continue;
+
+		keymap[pos] =3D *entry;
+		keymap[pos].code |=3D (0x0010 << 16);
+		pos++;
+	}
+
+	/* Append table with events of type 0x0011 */
+	for (i =3D 0; i < ARRAY_SIZE(dell_wmi_keymap_type_0011); i++) {
+		keymap[pos] =3D dell_wmi_keymap_type_0011[i];
+		keymap[pos].code |=3D (0x0011 << 16);
+		pos++;
 	}
+
+	/*
+	 * Now append also table with "legacy" events of type 0x0000. Some of
+	 * them are reported also on laptops which have scancodes in DMI.
+	 */
+	for (i =3D 0; i < ARRAY_SIZE(dell_wmi_keymap_type_0000); i++) {
+		keymap[pos] =3D dell_wmi_keymap_type_0000[i];
+		pos++;
+	}
+
+	keymap[pos].type =3D KE_END;
+
+	err =3D sparse_keymap_setup(dell_wmi_input_dev, keymap, NULL);
+	/*
+	 * Sparse keymap library makes a copy of keymap so we don't need the
+	 * original one that was allocated.
+	 */
+	kfree(keymap);
 	if (err)
 		goto err_free_dev;
=20
--=20
1.7.9.5
