From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH] power: supply: olpc_battery: fix the power supply name
Date: Sat, 21 Dec 2019 08:17:51 +0100
Message-ID: <20191221071751.269025-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: platform-driver-x86.vger.kernel.org

The framework is unhappy about them, because it uses the names in sysfs
attributes:

  power_supply olpc-ac: hwmon: 'olpc-ac' is not a valid name attribute, p=
lease fix
  power_supply olpc-battery: hwmon: 'olpc-battery' is not a valid name at=
tribute, please fix

See also commit 648cd48c9e56 ("hwmon: Do not accept invalid name
attributes") and commit 74d3b6419772 ("hwmon: Relax name attribute
validation for new APIs").

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 arch/x86/platform/olpc/olpc-xo1-sci.c  | 4 ++--
 arch/x86/platform/olpc/olpc-xo15-sci.c | 4 ++--
 drivers/platform/olpc/olpc-xo175-ec.c  | 4 ++--
 drivers/power/supply/olpc_battery.c    | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/x86/platform/olpc/olpc-xo1-sci.c b/arch/x86/platform/ol=
pc/olpc-xo1-sci.c
index 99a28ce2244c7..09bd195cc9012 100644
--- a/arch/x86/platform/olpc/olpc-xo1-sci.c
+++ b/arch/x86/platform/olpc/olpc-xo1-sci.c
@@ -53,7 +53,7 @@ static const char * const lid_wake_mode_names[] =3D {
=20
 static void battery_status_changed(void)
 {
-	struct power_supply *psy =3D power_supply_get_by_name("olpc-battery");
+	struct power_supply *psy =3D power_supply_get_by_name("olpc_battery");
=20
 	if (psy) {
 		power_supply_changed(psy);
@@ -63,7 +63,7 @@ static void battery_status_changed(void)
=20
 static void ac_status_changed(void)
 {
-	struct power_supply *psy =3D power_supply_get_by_name("olpc-ac");
+	struct power_supply *psy =3D power_supply_get_by_name("olpc_ac");
=20
 	if (psy) {
 		power_supply_changed(psy);
diff --git a/arch/x86/platform/olpc/olpc-xo15-sci.c b/arch/x86/platform/o=
lpc/olpc-xo15-sci.c
index 6d193bb36021b..7bc1ea6a47974 100644
--- a/arch/x86/platform/olpc/olpc-xo15-sci.c
+++ b/arch/x86/platform/olpc/olpc-xo15-sci.c
@@ -75,7 +75,7 @@ static struct kobj_attribute lid_wake_on_close_attr =3D
=20
 static void battery_status_changed(void)
 {
-	struct power_supply *psy =3D power_supply_get_by_name("olpc-battery");
+	struct power_supply *psy =3D power_supply_get_by_name("olpc_battery");
=20
 	if (psy) {
 		power_supply_changed(psy);
@@ -85,7 +85,7 @@ static void battery_status_changed(void)
=20
 static void ac_status_changed(void)
 {
-	struct power_supply *psy =3D power_supply_get_by_name("olpc-ac");
+	struct power_supply *psy =3D power_supply_get_by_name("olpc_ac");
=20
 	if (psy) {
 		power_supply_changed(psy);
diff --git a/drivers/platform/olpc/olpc-xo175-ec.c b/drivers/platform/olp=
c/olpc-xo175-ec.c
index 83ed1fbf73cfd..5e1d14e35f20b 100644
--- a/drivers/platform/olpc/olpc-xo175-ec.c
+++ b/drivers/platform/olpc/olpc-xo175-ec.c
@@ -410,7 +410,7 @@ static void olpc_xo175_ec_complete(void *arg)
 		dev_dbg(dev, "got event %.2x\n", byte);
 		switch (byte) {
 		case EVENT_AC_CHANGE:
-			psy =3D power_supply_get_by_name("olpc-ac");
+			psy =3D power_supply_get_by_name("olpc_ac");
 			if (psy) {
 				power_supply_changed(psy);
 				power_supply_put(psy);
@@ -420,7 +420,7 @@ static void olpc_xo175_ec_complete(void *arg)
 		case EVENT_BATTERY_CRITICAL:
 		case EVENT_BATTERY_SOC_CHANGE:
 		case EVENT_BATTERY_ERROR:
-			psy =3D power_supply_get_by_name("olpc-battery");
+			psy =3D power_supply_get_by_name("olpc_battery");
 			if (psy) {
 				power_supply_changed(psy);
 				power_supply_put(psy);
diff --git a/drivers/power/supply/olpc_battery.c b/drivers/power/supply/o=
lpc_battery.c
index ad0e9e0edb3f8..e0476ec06601d 100644
--- a/drivers/power/supply/olpc_battery.c
+++ b/drivers/power/supply/olpc_battery.c
@@ -88,7 +88,7 @@ static enum power_supply_property olpc_ac_props[] =3D {
 };
=20
 static const struct power_supply_desc olpc_ac_desc =3D {
-	.name =3D "olpc-ac",
+	.name =3D "olpc_ac",
 	.type =3D POWER_SUPPLY_TYPE_MAINS,
 	.properties =3D olpc_ac_props,
 	.num_properties =3D ARRAY_SIZE(olpc_ac_props),
@@ -605,7 +605,7 @@ static const struct attribute_group *olpc_bat_sysfs_g=
roups[] =3D {
  *********************************************************************/
=20
 static struct power_supply_desc olpc_bat_desc =3D {
-	.name =3D "olpc-battery",
+	.name =3D "olpc_battery",
 	.get_property =3D olpc_bat_get_property,
 	.use_for_apm =3D 1,
 };
--=20
2.24.1
