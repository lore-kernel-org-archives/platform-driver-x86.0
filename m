Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 734B0C4361B
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Dec 2020 01:40:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34D122311F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Dec 2020 01:40:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725804AbgLPBks (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Dec 2020 20:40:48 -0500
Received: from mail1.protonmail.ch ([185.70.40.18]:16735 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgLPBks (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Dec 2020 20:40:48 -0500
Date:   Wed, 16 Dec 2020 01:39:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1608082804;
        bh=DgmPUx3W/67QFGkNXd324J/JN4g6wAdathSdkmCLLY0=;
        h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
        b=hsnVjJNnthZTPL/EF61TLVLLa77WAHOVOcWTGdAJoRI+bUkE8MO/Z2b9/jH3eiWCC
         SxYdUc1Tq0X+lp9ym+iAK0Vw2oDnxJqIsZC0Y3wg0lpgHZ3nRWWx/0EEaO3w/QBp7R
         8bkU4cyi3fsaLrszyo44GkTo5iZCo9c9Iywvjekk=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH 12/24] platform/x86: ideapad-laptop: rework and create new ACPI helpers
Message-ID: <20201216013857.360987-13-pobrn@protonmail.com>
In-Reply-To: <20201216013857.360987-1-pobrn@protonmail.com>
References: <20201216013857.360987-1-pobrn@protonmail.com>
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

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index ffe41bf5585f..795978e0d13e 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -117,41 +117,47 @@ MODULE_PARM_DESC(no_bt_rfkill, "No rfkill for bluetoo=
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
@@ -161,22 +167,20 @@ static int method_vpcr(acpi_handle handle, int cmd, i=
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
@@ -185,55 +189,50 @@ static int method_vpcw(acpi_handle handle, int cmd, i=
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
@@ -284,7 +283,7 @@ static int debugfs_status_show(struct seq_file *s, void=
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
@@ -466,7 +465,7 @@ static ssize_t conservation_mode_show(struct device *de=
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
@@ -484,9 +483,8 @@ static ssize_t conservation_mode_store(struct device *d=
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
@@ -499,15 +497,13 @@ static ssize_t fn_lock_show(struct device *dev,
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
@@ -522,9 +518,8 @@ static ssize_t fn_lock_store(struct device *dev,
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
@@ -1009,7 +1004,7 @@ static const struct dmi_system_id hw_rfkill_list[] =
=3D {
 static int ideapad_acpi_add(struct platform_device *pdev)
 {
 =09int ret, i;
-=09int cfg;
+=09unsigned long cfg;
 =09struct ideapad_private *priv;
 =09struct acpi_device *adev;
 =09acpi_status acpi_err;
@@ -1018,7 +1013,7 @@ static int ideapad_acpi_add(struct platform_device *p=
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
2.29.2


