Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BBCFC433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Jan 2021 18:22:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4DE2F23441
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Jan 2021 18:22:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727851AbhAMSWd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 13 Jan 2021 13:22:33 -0500
Received: from mail2.protonmail.ch ([185.70.40.22]:26280 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726385AbhAMSWc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Jan 2021 13:22:32 -0500
Date:   Wed, 13 Jan 2021 18:21:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610562108;
        bh=WypS/mQ7Bcw5YU+gDNdIXzxr4CA5eWGEajvvrVc38z0=;
        h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
        b=h9i6LkOTYACQC1sus5AWnEd8/8el+srV1VIVg+7AHL/mENam7teOraUOn1PzKNSRK
         F3COafQazhrxuI/ZgLAlAdTedjxkc9un+fEFufk0txSEfjG72UBoxORJPUn/5oOiPw
         2hBNeawr0SeeuLl5Bd2Lw+Q7iPesMxKuIjrOOZp8=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v2 12/24] platform/x86: ideapad-laptop: rework and create new ACPI helpers
Message-ID: <20210113182016.166049-13-pobrn@protonmail.com>
In-Reply-To: <20210113182016.166049-1-pobrn@protonmail.com>
References: <20210113182016.166049-1-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Create dedicated helper functions for accessing the main ACPI methods:
GBMD, SMBC, HALS, SALS; and utilize them. Use `unsigned long` consistently
in every ACPI helper wherever possible. Change names to better express
purpose. Do not assign values to output parameters in case of failure.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index 5f36e77d9058..c3234e0931a9 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -119,41 +119,47 @@ MODULE_PARM_DESC(no_bt_rfkill, "No rfkill for bluetoo=
th.");
  */
 #define IDEAPAD_EC_TIMEOUT (200) /* in ms */
=20
-static int read_method_int(acpi_handle handle, const char *method, int *va=
l)
+static int eval_int(acpi_handle handle, const char *method, unsigned long =
*val)
 {
-=09acpi_status status;
+=09acpi_status acpi_err;
 =09unsigned long long result;
=20
-=09status =3D acpi_evaluate_integer(handle, (char *)method, NULL, &result)=
;
-=09if (ACPI_FAILURE(status)) {
-=09=09*val =3D -1;
+=09acpi_err =3D acpi_evaluate_integer(handle, (char *)method, NULL, &resul=
t);
+=09if (ACPI_FAILURE(acpi_err))
 =09=09return -EIO;
-=09}
 =09*val =3D result;
 =09return 0;
+}
=20
+static int eval_simple_method(acpi_handle handle, char *method, u64 arg)
+{
+=09acpi_status acpi_err =3D acpi_execute_simple_method(handle, method, arg=
);
+=09return ACPI_FAILURE(acpi_err) ? -EIO : 0;
 }
=20
-static int method_gbmd(acpi_handle handle, unsigned long *ret)
+static int eval_gbmd(acpi_handle handle, unsigned long *val)
 {
-=09int result, val;
+=09return eval_int(handle, "GBMD", val);
+}
=20
-=09result =3D read_method_int(handle, "GBMD", &val);
-=09*ret =3D val;
-=09return result;
+static int eval_smbc(acpi_handle handle, unsigned long arg)
+{
+=09return eval_simple_method(handle, "SMBC", arg);
 }
=20
-static int method_int1(acpi_handle handle, char *method, int cmd)
+static int eval_hals(acpi_handle handle, unsigned long *val)
 {
-=09acpi_status status;
+=09return eval_int(handle, "HALS", val);
+}
=20
-=09status =3D acpi_execute_simple_method(handle, method, cmd);
-=09return ACPI_FAILURE(status) ? -EIO : 0;
+static int eval_sals(acpi_handle handle, unsigned long arg)
+{
+=09return eval_simple_method(handle, "SALS", arg);
 }
=20
-static int method_vpcr(acpi_handle handle, int cmd, int *ret)
+static int eval_vpcr(acpi_handle handle, unsigned long cmd, unsigned long =
*val)
 {
-=09acpi_status status;
+=09acpi_status acpi_err;
 =09unsigned long long result;
 =09struct acpi_object_list params;
 =09union acpi_object in_obj;
@@ -163,22 +169,20 @@ static int method_vpcr(acpi_handle handle, int cmd, i=
nt *ret)
 =09in_obj.type =3D ACPI_TYPE_INTEGER;
 =09in_obj.integer.value =3D cmd;
=20
-=09status =3D acpi_evaluate_integer(handle, "VPCR", &params, &result);
+=09acpi_err =3D acpi_evaluate_integer(handle, "VPCR", &params, &result);
=20
-=09if (ACPI_FAILURE(status)) {
-=09=09*ret =3D -1;
+=09if (ACPI_FAILURE(acpi_err))
 =09=09return -EIO;
-=09}
-=09*ret =3D result;
+=09*val =3D result;
 =09return 0;
=20
 }
=20
-static int method_vpcw(acpi_handle handle, int cmd, int data)
+static int eval_vpcw(acpi_handle handle, unsigned long cmd, unsigned long =
data)
 {
 =09struct acpi_object_list params;
 =09union acpi_object in_obj[2];
-=09acpi_status status;
+=09acpi_status acpi_err;
=20
 =09params.count =3D 2;
 =09params.pointer =3D in_obj;
@@ -187,55 +191,50 @@ static int method_vpcw(acpi_handle handle, int cmd, i=
nt data)
 =09in_obj[1].type =3D ACPI_TYPE_INTEGER;
 =09in_obj[1].integer.value =3D data;
=20
-=09status =3D acpi_evaluate_object(handle, "VPCW", &params, NULL);
-=09if (status !=3D AE_OK)
+=09acpi_err =3D acpi_evaluate_object(handle, "VPCW", &params, NULL);
+=09if (ACPI_FAILURE(acpi_err))
 =09=09return -EIO;
 =09return 0;
 }
=20
-static int read_ec_data(acpi_handle handle, int cmd, unsigned long *data)
+static int read_ec_data(acpi_handle handle, unsigned long cmd, unsigned lo=
ng *data)
 {
-=09int val, err;
-=09unsigned long int end_jiffies;
+=09int err;
+=09unsigned long int end_jiffies, val;
=20
-=09err =3D method_vpcw(handle, 1, cmd);
+=09err =3D eval_vpcw(handle, 1, cmd);
 =09if (err)
 =09=09return err;
=20
 =09for (end_jiffies =3D jiffies + msecs_to_jiffies(IDEAPAD_EC_TIMEOUT) + 1=
;
 =09     time_before(jiffies, end_jiffies);) {
 =09=09schedule();
-=09=09err =3D method_vpcr(handle, 1, &val);
+=09=09err =3D eval_vpcr(handle, 1, &val);
 =09=09if (err)
 =09=09=09return err;
-=09=09if (val =3D=3D 0) {
-=09=09=09err =3D method_vpcr(handle, 0, &val);
-=09=09=09if (err)
-=09=09=09=09return err;
-=09=09=09*data =3D val;
-=09=09=09return 0;
-=09=09}
+=09=09if (val =3D=3D 0)
+=09=09=09return eval_vpcr(handle, 0, data);
 =09}
 =09acpi_handle_err(handle, "timeout in %s\n", __func__);
 =09return -ETIMEDOUT;
 }
=20
-static int write_ec_cmd(acpi_handle handle, int cmd, unsigned long data)
+static int write_ec_cmd(acpi_handle handle, unsigned long cmd, unsigned lo=
ng data)
 {
-=09int val, err;
-=09unsigned long int end_jiffies;
+=09int err;
+=09unsigned long end_jiffies, val;
=20
-=09err =3D method_vpcw(handle, 0, data);
+=09err =3D eval_vpcw(handle, 0, data);
 =09if (err)
 =09=09return err;
-=09err =3D method_vpcw(handle, 1, cmd);
+=09err =3D eval_vpcw(handle, 1, cmd);
 =09if (err)
 =09=09return err;
=20
 =09for (end_jiffies =3D jiffies + msecs_to_jiffies(IDEAPAD_EC_TIMEOUT) + 1=
;
 =09     time_before(jiffies, end_jiffies);) {
 =09=09schedule();
-=09=09err =3D method_vpcr(handle, 1, &val);
+=09=09err =3D eval_vpcr(handle, 1, &val);
 =09=09if (err)
 =09=09=09return err;
 =09=09if (val =3D=3D 0)
@@ -286,7 +285,7 @@ static int debugfs_status_show(struct seq_file *s, void=
 *data)
 =09=09=09   value ? "On" : "Off", value);
 =09seq_puts(s, "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D\n");
=20
-=09if (!method_gbmd(priv->adev->handle, &value)) {
+=09if (!eval_gbmd(priv->adev->handle, &value)) {
 =09=09seq_printf(s, "Conservation mode:\t%s(%lu)\n",
 =09=09=09   test_bit(GBMD_CONSERVATION_STATE_BIT, &value) ? "On" : "Off",
 =09=09=09   value);
@@ -468,7 +467,7 @@ static ssize_t conservation_mode_show(struct device *de=
v,
 =09unsigned long result;
 =09int err;
=20
-=09err =3D method_gbmd(priv->adev->handle, &result);
+=09err =3D eval_gbmd(priv->adev->handle, &result);
 =09if (err)
 =09=09return err;
 =09return sysfs_emit(buf, "%u\n", test_bit(GBMD_CONSERVATION_STATE_BIT, &r=
esult));
@@ -486,9 +485,8 @@ static ssize_t conservation_mode_store(struct device *d=
ev,
 =09if (ret)
 =09=09return ret;
=20
-=09ret =3D method_int1(priv->adev->handle, "SBMC", state ?
-=09=09=09=09=09      SMBC_CONSERVATION_ON :
-=09=09=09=09=09      SMBC_CONSERVATION_OFF);
+=09ret =3D eval_smbc(priv->adev->handle,
+=09=09=09state ? SMBC_CONSERVATION_ON : SMBC_CONSERVATION_OFF);
 =09if (ret)
 =09=09return ret;
 =09return count;
@@ -501,15 +499,13 @@ static ssize_t fn_lock_show(struct device *dev,
 =09=09=09    char *buf)
 {
 =09struct ideapad_private *priv =3D dev_get_drvdata(dev);
-=09unsigned long result;
-=09int hals;
-=09int fail =3D read_method_int(priv->adev->handle, "HALS", &hals);
+=09unsigned long hals;
+=09int fail =3D eval_hals(priv->adev->handle, &hals);
=20
 =09if (fail)
 =09=09return fail;
=20
-=09result =3D hals;
-=09return sysfs_emit(buf, "%u\n", test_bit(HALS_FNLOCK_STATE_BIT, &result)=
);
+=09return sysfs_emit(buf, "%u\n", test_bit(HALS_FNLOCK_STATE_BIT, &hals));
 }
=20
 static ssize_t fn_lock_store(struct device *dev,
@@ -524,9 +520,8 @@ static ssize_t fn_lock_store(struct device *dev,
 =09if (ret)
 =09=09return ret;
=20
-=09ret =3D method_int1(priv->adev->handle, "SALS", state ?
-=09=09=09  SALS_FNLOCK_ON :
-=09=09=09  SALS_FNLOCK_OFF);
+=09ret =3D eval_sals(priv->adev->handle,
+=09=09=09state ? SALS_FNLOCK_ON : SALS_FNLOCK_OFF);
 =09if (ret)
 =09=09return ret;
 =09return count;
@@ -1016,7 +1011,7 @@ static const struct dmi_system_id hw_rfkill_list[] =
=3D {
 static int ideapad_acpi_add(struct platform_device *pdev)
 {
 =09int ret, i;
-=09int cfg;
+=09unsigned long cfg;
 =09struct ideapad_private *priv;
 =09struct acpi_device *adev;
 =09acpi_status acpi_err;
@@ -1025,7 +1020,7 @@ static int ideapad_acpi_add(struct platform_device *p=
dev)
 =09if (ret)
 =09=09return -ENODEV;
=20
-=09if (read_method_int(adev->handle, "_CFG", &cfg))
+=09if (eval_int(adev->handle, "_CFG", &cfg))
 =09=09return -ENODEV;
=20
 =09priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
--=20
2.30.0

