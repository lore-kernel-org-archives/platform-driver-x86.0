From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v10 03/10] firmware: Rename FW_OPT_NOFALLBACK to FW_OPT_NOFALLBACK_SYSFS
Date: Tue, 10 Dec 2019 12:51:10 +0100
Message-ID: <20191210115117.303935-4-hdegoede@redhat.com>
References: <20191210115117.303935-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191210115117.303935-1-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Peter Jones <pjones@redhat.com>, Dave Olsthoorn <dave@bewaar.me>, x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-input@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

This is a preparation patch for adding a new platform fallback mechanism,
which will have its own enable/disable FW_OPT_xxx option.

Note this also fixes a typo in one of the re-wordwrapped comments:
enfoce -> enforce.

Acked-by: Luis Chamberlain <mcgrof@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/base/firmware_loader/fallback.c | 11 ++++++-----
 drivers/base/firmware_loader/firmware.h | 16 ++++++++--------
 drivers/base/firmware_loader/main.c     |  2 +-
 3 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/base/firmware_loader/fallback.c b/drivers/base/firmwar=
e_loader/fallback.c
index 62ee90b4db56..8704e1bae175 100644
--- a/drivers/base/firmware_loader/fallback.c
+++ b/drivers/base/firmware_loader/fallback.c
@@ -606,7 +606,7 @@ static bool fw_run_sysfs_fallback(enum fw_opt opt_flags=
)
 =09=09return false;
 =09}
=20
-=09if ((opt_flags & FW_OPT_NOFALLBACK))
+=09if ((opt_flags & FW_OPT_NOFALLBACK_SYSFS))
 =09=09return false;
=20
 =09/* Also permit LSMs and IMA to fail firmware sysfs fallback */
@@ -630,10 +630,11 @@ static bool fw_run_sysfs_fallback(enum fw_opt opt_fla=
gs)
  * interface. Userspace is in charge of loading the firmware through the s=
ysfs
  * loading interface. This sysfs fallback mechanism may be disabled comple=
tely
  * on a system by setting the proc sysctl value ignore_sysfs_fallback to t=
rue.
- * If this false we check if the internal API caller set the @FW_OPT_NOFAL=
LBACK
- * flag, if so it would also disable the fallback mechanism. A system may =
want
- * to enfoce the sysfs fallback mechanism at all times, it can do this by
- * setting ignore_sysfs_fallback to false and force_sysfs_fallback to true=
.
+ * If this is false we check if the internal API caller set the
+ * @FW_OPT_NOFALLBACK_SYSFS flag, if so it would also disable the fallback
+ * mechanism. A system may want to enforce the sysfs fallback mechanism at=
 all
+ * times, it can do this by setting ignore_sysfs_fallback to false and
+ * force_sysfs_fallback to true.
  * Enabling force_sysfs_fallback is functionally equivalent to build a ker=
nel
  * with CONFIG_FW_LOADER_USER_HELPER_FALLBACK.
  **/
diff --git a/drivers/base/firmware_loader/firmware.h b/drivers/base/firmwar=
e_loader/firmware.h
index 7ecd590e67fe..8656e5239a80 100644
--- a/drivers/base/firmware_loader/firmware.h
+++ b/drivers/base/firmware_loader/firmware.h
@@ -27,16 +27,16 @@
  *=09firmware file lookup on storage is avoided. Used for calls where the
  *=09file may be too big, or where the driver takes charge of its own
  *=09firmware caching mechanism.
- * @FW_OPT_NOFALLBACK: Disable the fallback mechanism. Takes precedence ov=
er
- *=09&FW_OPT_UEVENT and &FW_OPT_USERHELPER.
+ * @FW_OPT_NOFALLBACK_SYSFS: Disable the sysfs fallback mechanism. Takes
+ *=09precedence over &FW_OPT_UEVENT and &FW_OPT_USERHELPER.
  */
 enum fw_opt {
-=09FW_OPT_UEVENT =3D         BIT(0),
-=09FW_OPT_NOWAIT =3D         BIT(1),
-=09FW_OPT_USERHELPER =3D     BIT(2),
-=09FW_OPT_NO_WARN =3D        BIT(3),
-=09FW_OPT_NOCACHE =3D        BIT(4),
-=09FW_OPT_NOFALLBACK =3D     BIT(5),
+=09FW_OPT_UEVENT=09=09=09=3D BIT(0),
+=09FW_OPT_NOWAIT=09=09=09=3D BIT(1),
+=09FW_OPT_USERHELPER=09=09=3D BIT(2),
+=09FW_OPT_NO_WARN=09=09=09=3D BIT(3),
+=09FW_OPT_NOCACHE=09=09=09=3D BIT(4),
+=09FW_OPT_NOFALLBACK_SYSFS=09=09=3D BIT(5),
 };
=20
 enum fw_status {
diff --git a/drivers/base/firmware_loader/main.c b/drivers/base/firmware_lo=
ader/main.c
index 249add8c5e05..57133a9dad09 100644
--- a/drivers/base/firmware_loader/main.c
+++ b/drivers/base/firmware_loader/main.c
@@ -877,7 +877,7 @@ int request_firmware_direct(const struct firmware **fir=
mware_p,
 =09__module_get(THIS_MODULE);
 =09ret =3D _request_firmware(firmware_p, name, device, NULL, 0,
 =09=09=09=09FW_OPT_UEVENT | FW_OPT_NO_WARN |
-=09=09=09=09FW_OPT_NOFALLBACK);
+=09=09=09=09FW_OPT_NOFALLBACK_SYSFS);
 =09module_put(THIS_MODULE);
 =09return ret;
 }
--=20
2.23.0
