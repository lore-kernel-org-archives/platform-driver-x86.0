Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47C57C433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri, 30 Sep 2022 11:16:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231644AbiI3LQt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 30 Sep 2022 07:16:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231654AbiI3LQR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 30 Sep 2022 07:16:17 -0400
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43FD238A2C
        for <platform-driver-x86@vger.kernel.org>; Fri, 30 Sep 2022 03:59:26 -0700 (PDT)
Date:   Fri, 30 Sep 2022 10:59:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1664535564; x=1664794764;
        bh=dNx4FiLclj2H30eUl3SUVNHnttDDzpc0pAfvniSxedM=;
        h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
         Subject:Reply-To:Feedback-ID:Message-ID;
        b=scRWUWosrqYvv3FwZuNG/1aaVN6a0RpAM5rUHatZ+9bHDtO6mrgaK6gY3Dj+h0tPS
         68vC1UMaEBdpTvAQrK4akljXtfN0+7s9usTaKqJKpDn+MoxdsDYj0/pdh07VH8UCp8
         ht1xbUpE4Gi5bCTczBgzdOPa3okEOlSNjgQQykJxEVmSoUa1W9OszGD5LAASNb5dgA
         DuV71L2HMed9TQwR8jnHsA7cJT1NvD/NeYDt801G0rY0Geki0uurT/13mAT3isAEKD
         Np/Hh3aXhWrltLj++MGVnk8+5rb7GZ13+iL8QSXEIHUSjHv/WuKiCU1jjW9OA2K3sm
         3yKaUsZAHPUJA==
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v1] platform/x86: use PLATFORM_DEVID_NONE instead of -1
Message-ID: <20220930104857.2796923-1-pobrn@protonmail.com>
Feedback-ID: 20568564:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Use the `PLATFORM_DEVID_NONE` constant instead of
hard-coding -1 when creating a platform device.

No functional changes are intended.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
---
Since this is a trivial change, I did not CC
the driver maintainers separately. I can send
a new version if that is deemed necessary.

 drivers/platform/x86/acer-wmi.c           | 2 +-
 drivers/platform/x86/acerhdf.c            | 2 +-
 drivers/platform/x86/amd/hsmp.c           | 2 +-
 drivers/platform/x86/amilo-rfkill.c       | 3 ++-
 drivers/platform/x86/asus-laptop.c        | 2 +-
 drivers/platform/x86/compal-laptop.c      | 2 +-
 drivers/platform/x86/dell/alienware-wmi.c | 2 +-
 drivers/platform/x86/dell/dcdbas.c        | 2 +-
 drivers/platform/x86/dell/dell-laptop.c   | 2 +-
 drivers/platform/x86/dell/dell_rbu.c      | 2 +-
 drivers/platform/x86/eeepc-laptop.c       | 2 +-
 drivers/platform/x86/fujitsu-laptop.c     | 2 +-
 drivers/platform/x86/hdaps.c              | 2 +-
 drivers/platform/x86/hp-wmi.c             | 2 +-
 drivers/platform/x86/huawei-wmi.c         | 2 +-
 drivers/platform/x86/intel/oaktrail.c     | 2 +-
 drivers/platform/x86/mlx-platform.c       | 2 +-
 drivers/platform/x86/msi-laptop.c         | 2 +-
 drivers/platform/x86/panasonic-laptop.c   | 2 +-
 drivers/platform/x86/samsung-laptop.c     | 2 +-
 drivers/platform/x86/sony-laptop.c        | 2 +-
 drivers/platform/x86/tc1100-wmi.c         | 2 +-
 drivers/platform/x86/thinkpad_acpi.c      | 4 ++--
 drivers/platform/x86/topstar-laptop.c     | 2 +-
 drivers/platform/x86/winmate-fm07-keys.c  | 2 +-
 25 files changed, 27 insertions(+), 26 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wm=
i.c
index 9610742fe6aa..18224f9a5bc0 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -2463,7 +2463,7 @@ static int __init acer_wmi_init(void)
 =09=09goto error_platform_register;
 =09}

-=09acer_platform_device =3D platform_device_alloc("acer-wmi", -1);
+=09acer_platform_device =3D platform_device_alloc("acer-wmi", PLATFORM_DEV=
ID_NONE);
 =09if (!acer_platform_device) {
 =09=09err =3D -ENOMEM;
 =09=09goto error_device_alloc;
diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf.=
c
index 3463629f8764..d2c0fc38c201 100644
--- a/drivers/platform/x86/acerhdf.c
+++ b/drivers/platform/x86/acerhdf.c
@@ -676,7 +676,7 @@ static int __init acerhdf_register_platform(void)
 =09if (err)
 =09=09return err;

-=09acerhdf_dev =3D platform_device_alloc("acerhdf", -1);
+=09acerhdf_dev =3D platform_device_alloc("acerhdf", PLATFORM_DEVID_NONE);
 =09if (!acerhdf_dev) {
 =09=09err =3D -ENOMEM;
 =09=09goto err_device_alloc;
diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsm=
p.c
index a0c54b838c11..521c6a229362 100644
--- a/drivers/platform/x86/amd/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp.c
@@ -392,7 +392,7 @@ static int __init hsmp_plt_init(void)
 =09if (ret)
 =09=09return ret;

-=09amd_hsmp_platdev =3D platform_device_alloc(DRIVER_NAME, -1);
+=09amd_hsmp_platdev =3D platform_device_alloc(DRIVER_NAME, PLATFORM_DEVID_=
NONE);
 =09if (!amd_hsmp_platdev) {
 =09=09ret =3D -ENOMEM;
 =09=09goto drv_unregister;
diff --git a/drivers/platform/x86/amilo-rfkill.c b/drivers/platform/x86/ami=
lo-rfkill.c
index 493e169c8f61..3e313c4d538d 100644
--- a/drivers/platform/x86/amilo-rfkill.c
+++ b/drivers/platform/x86/amilo-rfkill.c
@@ -150,7 +150,8 @@ static int __init amilo_rfkill_init(void)
 =09if (rc)
 =09=09return rc;

-=09amilo_rfkill_pdev =3D platform_device_register_simple(KBUILD_MODNAME, -=
1,
+=09amilo_rfkill_pdev =3D platform_device_register_simple(KBUILD_MODNAME,
+=09=09=09=09=09=09=09    PLATFORM_DEVID_NONE,
 =09=09=09=09=09=09=09    NULL, 0);
 =09if (IS_ERR(amilo_rfkill_pdev)) {
 =09=09rc =3D PTR_ERR(amilo_rfkill_pdev);
diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus=
-laptop.c
index 4d2d32bfbe2a..47b2f8bb6fb5 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -1633,7 +1633,7 @@ static int asus_platform_init(struct asus_laptop *asu=
s)
 {
 =09int result;

-=09asus->platform_device =3D platform_device_alloc(ASUS_LAPTOP_FILE, -1);
+=09asus->platform_device =3D platform_device_alloc(ASUS_LAPTOP_FILE, PLATF=
ORM_DEVID_NONE);
 =09if (!asus->platform_device)
 =09=09return -ENOMEM;
 =09platform_set_drvdata(asus->platform_device, asus);
diff --git a/drivers/platform/x86/compal-laptop.c b/drivers/platform/x86/co=
mpal-laptop.c
index 72e1523edd31..e10d2f64dfad 100644
--- a/drivers/platform/x86/compal-laptop.c
+++ b/drivers/platform/x86/compal-laptop.c
@@ -1060,7 +1060,7 @@ static int __init compal_init(void)
 =09if (ret)
 =09=09goto err_backlight;

-=09compal_device =3D platform_device_alloc(DRIVER_NAME, -1);
+=09compal_device =3D platform_device_alloc(DRIVER_NAME, PLATFORM_DEVID_NON=
E);
 =09if (!compal_device) {
 =09=09ret =3D -ENOMEM;
 =09=09goto err_platform_driver;
diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x=
86/dell/alienware-wmi.c
index f21248255529..a34e07ef2c79 100644
--- a/drivers/platform/x86/dell/alienware-wmi.c
+++ b/drivers/platform/x86/dell/alienware-wmi.c
@@ -791,7 +791,7 @@ static int __init alienware_wmi_init(void)
 =09ret =3D platform_driver_register(&platform_driver);
 =09if (ret)
 =09=09goto fail_platform_driver;
-=09platform_device =3D platform_device_alloc("alienware-wmi", -1);
+=09platform_device =3D platform_device_alloc("alienware-wmi", PLATFORM_DEV=
ID_NONE);
 =09if (!platform_device) {
 =09=09ret =3D -ENOMEM;
 =09=09goto fail_platform_device1;
diff --git a/drivers/platform/x86/dell/dcdbas.c b/drivers/platform/x86/dell=
/dcdbas.c
index 42beafbc54b2..0ecb7b164750 100644
--- a/drivers/platform/x86/dell/dcdbas.c
+++ b/drivers/platform/x86/dell/dcdbas.c
@@ -716,7 +716,7 @@ static struct platform_driver dcdbas_driver =3D {

 static const struct platform_device_info dcdbas_dev_info __initconst =3D {
 =09.name=09=09=3D DRIVER_NAME,
-=09.id=09=09=3D -1,
+=09.id=09=09=3D PLATFORM_DEVID_NONE,
 =09.dma_mask=09=3D DMA_BIT_MASK(32),
 };

diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86=
/dell/dell-laptop.c
index 1321687d923e..e92c3ad06d69 100644
--- a/drivers/platform/x86/dell/dell-laptop.c
+++ b/drivers/platform/x86/dell/dell-laptop.c
@@ -2193,7 +2193,7 @@ static int __init dell_init(void)
 =09ret =3D platform_driver_register(&platform_driver);
 =09if (ret)
 =09=09goto fail_platform_driver;
-=09platform_device =3D platform_device_alloc("dell-laptop", -1);
+=09platform_device =3D platform_device_alloc("dell-laptop", PLATFORM_DEVID=
_NONE);
 =09if (!platform_device) {
 =09=09ret =3D -ENOMEM;
 =09=09goto fail_platform_device1;
diff --git a/drivers/platform/x86/dell/dell_rbu.c b/drivers/platform/x86/de=
ll/dell_rbu.c
index e9f4b30dcafa..9f51e0fcab04 100644
--- a/drivers/platform/x86/dell/dell_rbu.c
+++ b/drivers/platform/x86/dell/dell_rbu.c
@@ -645,7 +645,7 @@ static int __init dcdrbu_init(void)
 =09spin_lock_init(&rbu_data.lock);

 =09init_packet_head();
-=09rbu_device =3D platform_device_register_simple("dell_rbu", -1, NULL, 0)=
;
+=09rbu_device =3D platform_device_register_simple("dell_rbu", PLATFORM_DEV=
ID_NONE, NULL, 0);
 =09if (IS_ERR(rbu_device)) {
 =09=09pr_err("platform_device_register_simple failed\n");
 =09=09return PTR_ERR(rbu_device);
diff --git a/drivers/platform/x86/eeepc-laptop.c b/drivers/platform/x86/eee=
pc-laptop.c
index ba08c9235f76..a388a28b6f2a 100644
--- a/drivers/platform/x86/eeepc-laptop.c
+++ b/drivers/platform/x86/eeepc-laptop.c
@@ -444,7 +444,7 @@ static int eeepc_platform_init(struct eeepc_laptop *eee=
pc)
 {
 =09int result;

-=09eeepc->platform_device =3D platform_device_alloc(EEEPC_LAPTOP_FILE, -1)=
;
+=09eeepc->platform_device =3D platform_device_alloc(EEEPC_LAPTOP_FILE, PLA=
TFORM_DEVID_NONE);
 =09if (!eeepc->platform_device)
 =09=09return -ENOMEM;
 =09platform_set_drvdata(eeepc->platform_device, eeepc);
diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/f=
ujitsu-laptop.c
index 80929380ec7e..b543d117b12c 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -543,7 +543,7 @@ static int fujitsu_laptop_platform_add(struct acpi_devi=
ce *device)
 =09struct fujitsu_laptop *priv =3D acpi_driver_data(device);
 =09int ret;

-=09priv->pf_device =3D platform_device_alloc("fujitsu-laptop", -1);
+=09priv->pf_device =3D platform_device_alloc("fujitsu-laptop", PLATFORM_DE=
VID_NONE);
 =09if (!priv->pf_device)
 =09=09return -ENOMEM;

diff --git a/drivers/platform/x86/hdaps.c b/drivers/platform/x86/hdaps.c
index 9996485f5295..f11f726d2062 100644
--- a/drivers/platform/x86/hdaps.c
+++ b/drivers/platform/x86/hdaps.c
@@ -547,7 +547,7 @@ static int __init hdaps_init(void)
 =09if (ret)
 =09=09goto out_region;

-=09pdev =3D platform_device_register_simple("hdaps", -1, NULL, 0);
+=09pdev =3D platform_device_register_simple("hdaps", PLATFORM_DEVID_NONE, =
NULL, 0);
 =09if (IS_ERR(pdev)) {
 =09=09ret =3D PTR_ERR(pdev);
 =09=09goto out_driver;
diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index da0d25c67e57..627a6d0eaf83 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -1519,7 +1519,7 @@ static int __init hp_wmi_init(void)

 =09if (bios_capable) {
 =09=09hp_wmi_platform_dev =3D
-=09=09=09platform_device_register_simple("hp-wmi", -1, NULL, 0);
+=09=09=09platform_device_register_simple("hp-wmi", PLATFORM_DEVID_NONE, NU=
LL, 0);
 =09=09if (IS_ERR(hp_wmi_platform_dev)) {
 =09=09=09err =3D PTR_ERR(hp_wmi_platform_dev);
 =09=09=09goto err_destroy_input;
diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawe=
i-wmi.c
index eac3e6b4ea11..5873c2663a65 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -871,7 +871,7 @@ static __init int huawei_wmi_init(void)
 =09if (err)
 =09=09goto pdrv_err;

-=09pdev =3D platform_device_register_simple("huawei-wmi", -1, NULL, 0);
+=09pdev =3D platform_device_register_simple("huawei-wmi", PLATFORM_DEVID_N=
ONE, NULL, 0);
 =09if (IS_ERR(pdev)) {
 =09=09err =3D PTR_ERR(pdev);
 =09=09goto pdev_err;
diff --git a/drivers/platform/x86/intel/oaktrail.c b/drivers/platform/x86/i=
ntel/oaktrail.c
index 1a09a75bd16d..7c5c623630c1 100644
--- a/drivers/platform/x86/intel/oaktrail.c
+++ b/drivers/platform/x86/intel/oaktrail.c
@@ -317,7 +317,7 @@ static int __init oaktrail_init(void)
 =09=09goto err_driver_reg;
 =09}

-=09oaktrail_device =3D platform_device_alloc(DRIVER_NAME, -1);
+=09oaktrail_device =3D platform_device_alloc(DRIVER_NAME, PLATFORM_DEVID_N=
ONE);
 =09if (!oaktrail_device) {
 =09=09pr_warn("Unable to allocate platform device\n");
 =09=09ret =3D -ENOMEM;
diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx=
-platform.c
index 5e072a0666f4..2fac05a17a5c 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -5181,7 +5181,7 @@ static int __init mlxplat_init(void)
 =09if (!dmi_check_system(mlxplat_dmi_table))
 =09=09return -ENODEV;

-=09mlxplat_dev =3D platform_device_register_simple(MLX_PLAT_DEVICE_NAME, -=
1,
+=09mlxplat_dev =3D platform_device_register_simple(MLX_PLAT_DEVICE_NAME, P=
LATFORM_DEVID_NONE,
 =09=09=09=09=09mlxplat_lpc_resources,
 =09=09=09=09=09ARRAY_SIZE(mlxplat_lpc_resources));

diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-l=
aptop.c
index 2f850396e9a7..6b18ec543ac3 100644
--- a/drivers/platform/x86/msi-laptop.c
+++ b/drivers/platform/x86/msi-laptop.c
@@ -1066,7 +1066,7 @@ static int __init msi_init(void)

 =09/* Register platform stuff */

-=09msipf_device =3D platform_device_alloc("msi-laptop-pf", -1);
+=09msipf_device =3D platform_device_alloc("msi-laptop-pf", PLATFORM_DEVID_=
NONE);
 =09if (!msipf_device) {
 =09=09ret =3D -ENOMEM;
 =09=09goto fail_platform_driver;
diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86=
/panasonic-laptop.c
index d9a095d2c0eb..ad3083f9946d 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -1034,7 +1034,7 @@ static int acpi_pcc_hotkey_add(struct acpi_device *de=
vice)
 =09/* optical drive initialization */
 =09if (ACPI_SUCCESS(check_optd_present())) {
 =09=09pcc->platform =3D platform_device_register_simple("panasonic",
-=09=09=09-1, NULL, 0);
+=09=09=09PLATFORM_DEVID_NONE, NULL, 0);
 =09=09if (IS_ERR(pcc->platform)) {
 =09=09=09result =3D PTR_ERR(pcc->platform);
 =09=09=09goto out_backlight;
diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/s=
amsung-laptop.c
index cc30cf08f32d..b4aa8ba35d2d 100644
--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -1474,7 +1474,7 @@ static int __init samsung_platform_init(struct samsun=
g_laptop *samsung)
 {
 =09struct platform_device *pdev;

-=09pdev =3D platform_device_register_simple("samsung", -1, NULL, 0);
+=09pdev =3D platform_device_register_simple("samsung", PLATFORM_DEVID_NONE=
, NULL, 0);
 =09if (IS_ERR(pdev))
 =09=09return PTR_ERR(pdev);

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony=
-laptop.c
index 07ef05f727a2..765fcaba4d12 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -584,7 +584,7 @@ static int sony_pf_add(void)
 =09if (ret)
 =09=09goto out;

-=09sony_pf_device =3D platform_device_alloc("sony-laptop", -1);
+=09sony_pf_device =3D platform_device_alloc("sony-laptop", PLATFORM_DEVID_=
NONE);
 =09if (!sony_pf_device) {
 =09=09ret =3D -ENOMEM;
 =09=09goto out_platform_registered;
diff --git a/drivers/platform/x86/tc1100-wmi.c b/drivers/platform/x86/tc110=
0-wmi.c
index 9072eb302618..ded26213c420 100644
--- a/drivers/platform/x86/tc1100-wmi.c
+++ b/drivers/platform/x86/tc1100-wmi.c
@@ -233,7 +233,7 @@ static int __init tc1100_init(void)
 =09if (!wmi_has_guid(GUID))
 =09=09return -ENODEV;

-=09tc1100_device =3D platform_device_alloc("tc1100-wmi", -1);
+=09tc1100_device =3D platform_device_alloc("tc1100-wmi", PLATFORM_DEVID_NO=
NE);
 =09if (!tc1100_device)
 =09=09return -ENOMEM;

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/th=
inkpad_acpi.c
index 8fbe21ebcc52..6a823b850a77 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -11715,7 +11715,7 @@ static int __init thinkpad_acpi_module_init(void)
 =09=09tp_features.quirks =3D dmi_id->driver_data;

 =09/* Device initialization */
-=09tpacpi_pdev =3D platform_device_register_simple(TPACPI_DRVR_NAME, -1,
+=09tpacpi_pdev =3D platform_device_register_simple(TPACPI_DRVR_NAME, PLATF=
ORM_DEVID_NONE,
 =09=09=09=09=09=09=09NULL, 0);
 =09if (IS_ERR(tpacpi_pdev)) {
 =09=09ret =3D PTR_ERR(tpacpi_pdev);
@@ -11726,7 +11726,7 @@ static int __init thinkpad_acpi_module_init(void)
 =09}
 =09tpacpi_sensors_pdev =3D platform_device_register_simple(
 =09=09=09=09=09=09TPACPI_HWMON_DRVR_NAME,
-=09=09=09=09=09=09-1, NULL, 0);
+=09=09=09=09=09=09PLATFORM_DEVID_NONE, NULL, 0);
 =09if (IS_ERR(tpacpi_sensors_pdev)) {
 =09=09ret =3D PTR_ERR(tpacpi_sensors_pdev);
 =09=09tpacpi_sensors_pdev =3D NULL;
diff --git a/drivers/platform/x86/topstar-laptop.c b/drivers/platform/x86/t=
opstar-laptop.c
index f7761d98c0fd..6d18fbf8762b 100644
--- a/drivers/platform/x86/topstar-laptop.c
+++ b/drivers/platform/x86/topstar-laptop.c
@@ -192,7 +192,7 @@ static int topstar_platform_init(struct topstar_laptop =
*topstar)
 {
 =09int err;

-=09topstar->platform =3D platform_device_alloc(TOPSTAR_LAPTOP_CLASS, -1);
+=09topstar->platform =3D platform_device_alloc(TOPSTAR_LAPTOP_CLASS, PLATF=
ORM_DEVID_NONE);
 =09if (!topstar->platform)
 =09=09return -ENOMEM;

diff --git a/drivers/platform/x86/winmate-fm07-keys.c b/drivers/platform/x8=
6/winmate-fm07-keys.c
index 2c90c5c7eca2..465ffad81a65 100644
--- a/drivers/platform/x86/winmate-fm07-keys.c
+++ b/drivers/platform/x86/winmate-fm07-keys.c
@@ -161,7 +161,7 @@ static int __init fm07keys_init(void)
 =09=09return ret;
 =09}

-=09dev =3D platform_device_register_simple(DRV_NAME, -1, NULL, 0);
+=09dev =3D platform_device_register_simple(DRV_NAME, PLATFORM_DEVID_NONE, =
NULL, 0);
 =09if (IS_ERR(dev)) {
 =09=09ret =3D PTR_ERR(dev);
 =09=09pr_err("fm07keys: failed to allocate device, err =3D %d\n", ret);
--
2.37.3


