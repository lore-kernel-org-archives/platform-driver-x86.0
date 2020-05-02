From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 2/5] platform/x86: intel-vbtn: Split keymap into buttons and switches parts
Date: Sat,  2 May 2020 20:29:48 +0200
Message-ID: <20200502182951.114231-3-hdegoede@redhat.com>
References: <20200502182951.114231-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20200502182951.114231-1-hdegoede@redhat.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Mario Limonciello <mario.limonciello@dell.com>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Split the sparse keymap into 2 separate keymaps, a buttons and a switches
keymap and combine the 2 to a single map again in intel_vbtn_input_setup(=
).

This is a preparation patch for not telling userspace that we have switch=
es
when we do not have them (and for doing the same for the buttons).

Fixes: de9647efeaa9 ("platform/x86: intel-vbtn: Only activate tablet mode=
 switch on 2-in-1's")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel-vbtn.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/int=
el-vbtn.c
index 191894d648bb..634096cef21a 100644
--- a/drivers/platform/x86/intel-vbtn.c
+++ b/drivers/platform/x86/intel-vbtn.c
@@ -40,14 +40,20 @@ static const struct key_entry intel_vbtn_keymap[] =3D=
 {
 	{ KE_IGNORE, 0xC7, { KEY_VOLUMEDOWN } },	/* volume-down key release */
 	{ KE_KEY,    0xC8, { KEY_ROTATE_LOCK_TOGGLE } },	/* rotate-lock key pre=
ss */
 	{ KE_KEY,    0xC9, { KEY_ROTATE_LOCK_TOGGLE } },	/* rotate-lock key rel=
ease */
+};
+
+static const struct key_entry intel_vbtn_switchmap[] =3D {
 	{ KE_SW,     0xCA, { .sw =3D { SW_DOCK, 1 } } },		/* Docked */
 	{ KE_SW,     0xCB, { .sw =3D { SW_DOCK, 0 } } },		/* Undocked */
 	{ KE_SW,     0xCC, { .sw =3D { SW_TABLET_MODE, 1 } } },	/* Tablet */
 	{ KE_SW,     0xCD, { .sw =3D { SW_TABLET_MODE, 0 } } },	/* Laptop */
-	{ KE_END },
 };
=20
+#define KEYMAP_LEN \
+	(ARRAY_SIZE(intel_vbtn_keymap) + ARRAY_SIZE(intel_vbtn_switchmap) + 1)
+
 struct intel_vbtn_priv {
+	struct key_entry keymap[KEYMAP_LEN];
 	struct input_dev *input_dev;
 	bool wakeup_mode;
 };
@@ -55,13 +61,29 @@ struct intel_vbtn_priv {
 static int intel_vbtn_input_setup(struct platform_device *device)
 {
 	struct intel_vbtn_priv *priv =3D dev_get_drvdata(&device->dev);
-	int ret;
+	int ret, keymap_len =3D 0;
+
+	if (true) {
+		memcpy(&priv->keymap[keymap_len], intel_vbtn_keymap,
+		       ARRAY_SIZE(intel_vbtn_keymap) *
+		       sizeof(struct key_entry));
+		keymap_len +=3D ARRAY_SIZE(intel_vbtn_keymap);
+	}
+
+	if (true) {
+		memcpy(&priv->keymap[keymap_len], intel_vbtn_switchmap,
+		       ARRAY_SIZE(intel_vbtn_switchmap) *
+		       sizeof(struct key_entry));
+		keymap_len +=3D ARRAY_SIZE(intel_vbtn_switchmap);
+	}
+
+	priv->keymap[keymap_len].type =3D KE_END;
=20
 	priv->input_dev =3D devm_input_allocate_device(&device->dev);
 	if (!priv->input_dev)
 		return -ENOMEM;
=20
-	ret =3D sparse_keymap_setup(priv->input_dev, intel_vbtn_keymap, NULL);
+	ret =3D sparse_keymap_setup(priv->input_dev, priv->keymap, NULL);
 	if (ret)
 		return ret;
=20
--=20
2.26.0
