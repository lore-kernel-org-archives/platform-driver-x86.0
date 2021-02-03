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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B724C433E0
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 21:57:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3AF5B64E4E
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 21:57:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232446AbhBCV5K (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Feb 2021 16:57:10 -0500
Received: from mail2.protonmail.ch ([185.70.40.22]:55328 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232401AbhBCV44 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 16:56:56 -0500
Date:   Wed, 03 Feb 2021 21:56:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1612389371;
        bh=m6cWswUvZxAX9U/Iq10b+aJq/dBh0o2Uj+FAblNWLFA=;
        h=Date:To:From:Reply-To:Subject:From;
        b=I0FmE7T+UAdH7aX8qfgJ/hc+++XRJeIBRInq3TLLZ5rLKZ4nauKo11p8v3R1+g/ak
         2L4UT7x2KdO0KmPa0LQI3bHAp66fpWrJVnduacP1WL+rUU0KHtw8ljuq8p1PHjoWoe
         y4oZ49fSHk9QLE9wCvXZLXvR4hHoFVPNI7C+Ulv8=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v3 17/29] platform/x86: ideapad-laptop: rework and create new ACPI helpers
Message-ID: <20210203215403.290792-18-pobrn@protonmail.com>
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
index e74f25ec4a27..c8ab660cdacc 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -129,84 +129,78 @@ MODULE_PARM_DESC(no_bt_rfkill, "No rfkill for bluetoo=
th.");
  */
 #define IDEAPAD_EC_TIMEOUT (200) /* in ms */
=20
-static int read_method_int(acpi_handle handle, const char *method, int *va=
l)
+static int eval_int(acpi_handle handle, const char *name, unsigned long *r=
es)
 {
-=09acpi_status status;
 =09unsigned long long result;
+=09acpi_status status;
=20
-=09status =3D acpi_evaluate_integer(handle, (char *)method, NULL, &result)=
;
-=09if (ACPI_FAILURE(status)) {
-=09=09*val =3D -1;
+=09status =3D acpi_evaluate_integer(handle, (char *)name, NULL, &result);
+=09if (ACPI_FAILURE(status))
 =09=09return -EIO;
-=09}
-=09*val =3D result;
+=09*res =3D result;
 =09return 0;
-
 }
=20
-static int method_gbmd(acpi_handle handle, unsigned long *ret)
+static int exec_simple_method(acpi_handle handle, const char *name, unsign=
ed long arg)
 {
-=09int result, val;
+=09acpi_status status =3D acpi_execute_simple_method(handle, (char *)name,=
 arg);
=20
-=09result =3D read_method_int(handle, "GBMD", &val);
-=09*ret =3D val;
-=09return result;
+=09return ACPI_FAILURE(status) ? -EIO : 0;
 }
=20
-static int method_int1(acpi_handle handle, char *method, int cmd)
+static int eval_gbmd(acpi_handle handle, unsigned long *res)
 {
-=09acpi_status status;
-
-=09status =3D acpi_execute_simple_method(handle, method, cmd);
-=09return ACPI_FAILURE(status) ? -EIO : 0;
+=09return eval_int(handle, "GBMD", res);
 }
=20
-static int method_dytc(acpi_handle handle, int cmd, int *ret)
+static int exec_smbc(acpi_handle handle, unsigned long arg)
 {
-=09acpi_status status;
-=09unsigned long long result;
-=09struct acpi_object_list params;
-=09union acpi_object in_obj;
-
-=09params.count =3D 1;
-=09params.pointer =3D &in_obj;
-=09in_obj.type =3D ACPI_TYPE_INTEGER;
-=09in_obj.integer.value =3D cmd;
+=09return exec_simple_method(handle, "SMBC", arg);
+}
=20
-=09status =3D acpi_evaluate_integer(handle, "DYTC", &params, &result);
+static int eval_hals(acpi_handle handle, unsigned long *res)
+{
+=09return eval_int(handle, "HALS", res);
+}
=20
-=09if (ACPI_FAILURE(status)) {
-=09=09*ret =3D -1;
-=09=09return -EIO;
-=09}
-=09*ret =3D result;
-=09return 0;
+static int exec_sals(acpi_handle handle, unsigned long arg)
+{
+=09return exec_simple_method(handle, "SALS", arg);
 }
=20
-static int method_vpcr(acpi_handle handle, int cmd, int *ret)
+static int eval_int_with_arg(acpi_handle handle, const char *name, unsigne=
d long arg, unsigned long *res)
 {
-=09acpi_status status;
-=09unsigned long long result;
 =09struct acpi_object_list params;
+=09unsigned long long result;
 =09union acpi_object in_obj;
+=09acpi_status status;
=20
 =09params.count =3D 1;
 =09params.pointer =3D &in_obj;
 =09in_obj.type =3D ACPI_TYPE_INTEGER;
-=09in_obj.integer.value =3D cmd;
+=09in_obj.integer.value =3D arg;
=20
-=09status =3D acpi_evaluate_integer(handle, "VPCR", &params, &result);
-
-=09if (ACPI_FAILURE(status)) {
-=09=09*ret =3D -1;
+=09status =3D acpi_evaluate_integer(handle, (char *)name, &params, &result=
);
+=09if (ACPI_FAILURE(status))
 =09=09return -EIO;
-=09}
-=09*ret =3D result;
+
+=09if (res)
+=09=09*res =3D result;
+
 =09return 0;
+}
=20
+static int eval_dytc(acpi_handle handle, unsigned long cmd, unsigned long =
*res)
+{
+=09return eval_int_with_arg(handle, "DYTC", cmd, res);
+}
+
+static int eval_vpcr(acpi_handle handle, unsigned long cmd, unsigned long =
*res)
+{
+=09return eval_int_with_arg(handle, "VPCR", cmd, res);
 }
=20
-static int method_vpcw(acpi_handle handle, int cmd, int data)
+static int eval_vpcw(acpi_handle handle, unsigned long cmd, unsigned long =
data)
 {
 =09struct acpi_object_list params;
 =09union acpi_object in_obj[2];
@@ -220,17 +214,17 @@ static int method_vpcw(acpi_handle handle, int cmd, i=
nt data)
 =09in_obj[1].integer.value =3D data;
=20
 =09status =3D acpi_evaluate_object(handle, "VPCW", &params, NULL);
-=09if (status !=3D AE_OK)
+=09if (ACPI_FAILURE(status))
 =09=09return -EIO;
 =09return 0;
 }
=20
-static int read_ec_data(acpi_handle handle, int cmd, unsigned long *data)
+static int read_ec_data(acpi_handle handle, unsigned long cmd, unsigned lo=
ng *data)
 {
-=09unsigned long int end_jiffies;
-=09int val, err;
+=09unsigned long end_jiffies, val;
+=09int err;
=20
-=09err =3D method_vpcw(handle, 1, cmd);
+=09err =3D eval_vpcw(handle, 1, cmd);
 =09if (err)
 =09=09return err;
=20
@@ -238,30 +232,25 @@ static int read_ec_data(acpi_handle handle, int cmd, =
unsigned long *data)
=20
 =09while (time_before(jiffies, end_jiffies)) {
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
-=09unsigned long int end_jiffies;
-=09int val, err;
+=09unsigned long end_jiffies, val;
+=09int err;
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
@@ -269,7 +258,7 @@ static int write_ec_cmd(acpi_handle handle, int cmd, un=
signed long data)
=20
 =09while (time_before(jiffies, end_jiffies)) {
 =09=09schedule();
-=09=09err =3D method_vpcr(handle, 1, &val);
+=09=09err =3D eval_vpcr(handle, 1, &val);
 =09=09if (err)
 =09=09=09return err;
 =09=09if (val =3D=3D 0)
@@ -317,7 +306,7 @@ static int debugfs_status_show(struct seq_file *s, void=
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
@@ -498,7 +487,7 @@ static ssize_t conservation_mode_show(struct device *de=
v,
 =09unsigned long result;
 =09int err;
=20
-=09err =3D method_gbmd(priv->adev->handle, &result);
+=09err =3D eval_gbmd(priv->adev->handle, &result);
 =09if (err)
 =09=09return err;
 =09return sysfs_emit(buf, "%d\n", !!test_bit(GBMD_CONSERVATION_STATE_BIT, =
&result));
@@ -516,9 +505,7 @@ static ssize_t conservation_mode_store(struct device *d=
ev,
 =09if (ret)
 =09=09return ret;
=20
-=09ret =3D method_int1(priv->adev->handle, "SBMC", state ?
-=09=09=09=09=09      SMBC_CONSERVATION_ON :
-=09=09=09=09=09      SMBC_CONSERVATION_OFF);
+=09ret =3D exec_smbc(priv->adev->handle, state ? SMBC_CONSERVATION_ON : SM=
BC_CONSERVATION_OFF);
 =09if (ret)
 =09=09return ret;
 =09return count;
@@ -531,15 +518,13 @@ static ssize_t fn_lock_show(struct device *dev,
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
-=09return sysfs_emit(buf, "%d\n", !!test_bit(HALS_FNLOCK_STATE_BIT, &resul=
t));
+=09return sysfs_emit(buf, "%d\n", !!test_bit(HALS_FNLOCK_STATE_BIT, &hals)=
);
 }
=20
 static ssize_t fn_lock_store(struct device *dev,
@@ -554,9 +539,7 @@ static ssize_t fn_lock_store(struct device *dev,
 =09if (ret)
 =09=09return ret;
=20
-=09ret =3D method_int1(priv->adev->handle, "SALS", state ?
-=09=09=09  SALS_FNLOCK_ON :
-=09=09=09  SALS_FNLOCK_OFF);
+=09ret =3D exec_sals(priv->adev->handle, state ? SALS_FNLOCK_ON : SALS_FNL=
OCK_OFF);
 =09if (ret)
 =09=09return ret;
 =09return count;
@@ -700,32 +683,31 @@ int dytc_profile_get(struct platform_profile_handler =
*pprof,
  *  - enable CQL
  *  If not in CQL mode, just run the command
  */
-int dytc_cql_command(struct ideapad_private *priv, int command, int *outpu=
t)
+int dytc_cql_command(struct ideapad_private *priv, unsigned long cmd, unsi=
gned long *output)
 {
-=09int err, cmd_err, dummy;
-=09int cur_funcmode;
+=09int err, cmd_err, cur_funcmode;
=20
 =09/* Determine if we are in CQL mode. This alters the commands we do */
-=09err =3D method_dytc(priv->adev->handle, DYTC_CMD_GET, output);
+=09err =3D eval_dytc(priv->adev->handle, DYTC_CMD_GET, output);
 =09if (err)
 =09=09return err;
=20
 =09cur_funcmode =3D (*output >> DYTC_GET_FUNCTION_BIT) & 0xF;
 =09/* Check if we're OK to return immediately */
-=09if ((command =3D=3D DYTC_CMD_GET) && (cur_funcmode !=3D DYTC_FUNCTION_C=
QL))
+=09if (cmd =3D=3D DYTC_CMD_GET && cur_funcmode !=3D DYTC_FUNCTION_CQL)
 =09=09return 0;
=20
 =09if (cur_funcmode =3D=3D DYTC_FUNCTION_CQL) {
-=09=09err =3D method_dytc(priv->adev->handle, DYTC_DISABLE_CQL, &dummy);
+=09=09err =3D eval_dytc(priv->adev->handle, DYTC_DISABLE_CQL, NULL);
 =09=09if (err)
 =09=09=09return err;
 =09}
=20
-=09cmd_err =3D method_dytc(priv->adev->handle, command,=09output);
+=09cmd_err =3D eval_dytc(priv->adev->handle, cmd, output);
 =09/* Check return condition after we've restored CQL state */
=20
 =09if (cur_funcmode =3D=3D DYTC_FUNCTION_CQL) {
-=09=09err =3D method_dytc(priv->adev->handle, DYTC_ENABLE_CQL, &dummy);
+=09=09err =3D eval_dytc(priv->adev->handle, DYTC_ENABLE_CQL, NULL);
 =09=09if (err)
 =09=09=09return err;
 =09}
@@ -742,7 +724,6 @@ int dytc_profile_set(struct platform_profile_handler *p=
prof,
 {
 =09struct ideapad_dytc_priv *dytc;
 =09struct ideapad_private *priv;
-=09int output;
 =09int err;
=20
 =09dytc =3D container_of(pprof, struct ideapad_dytc_priv, pprof);
@@ -754,7 +735,7 @@ int dytc_profile_set(struct platform_profile_handler *p=
prof,
=20
 =09if (profile =3D=3D PLATFORM_PROFILE_BALANCED) {
 =09=09/* To get back to balanced mode we just issue a reset command */
-=09=09err =3D method_dytc(priv->adev->handle, DYTC_CMD_RESET, &output);
+=09=09err =3D eval_dytc(priv->adev->handle, DYTC_CMD_RESET, NULL);
 =09=09if (err)
 =09=09=09goto unlock;
 =09} else {
@@ -767,7 +748,7 @@ int dytc_profile_set(struct platform_profile_handler *p=
prof,
 =09=09/* Determine if we are in CQL mode. This alters the commands we do *=
/
 =09=09err =3D dytc_cql_command(priv,
 =09=09=09=09DYTC_SET_COMMAND(DYTC_FUNCTION_MMC, perfmode, 1),
-=09=09=09=09&output);
+=09=09=09=09NULL);
 =09=09if (err)
 =09=09=09goto unlock;
 =09}
@@ -781,8 +762,8 @@ int dytc_profile_set(struct platform_profile_handler *p=
prof,
 static void dytc_profile_refresh(struct ideapad_private *priv)
 {
 =09enum platform_profile_option profile;
-=09int output, err;
-=09int perfmode;
+=09unsigned long output;
+=09int err, perfmode;
=20
 =09mutex_lock(&priv->dytc->mutex);
 =09err =3D dytc_cql_command(priv, DYTC_CMD_GET, &output);
@@ -800,9 +781,10 @@ static void dytc_profile_refresh(struct ideapad_privat=
e *priv)
=20
 static int ideapad_dytc_profile_init(struct ideapad_private *priv)
 {
-=09int err, output, dytc_version;
+=09int err, dytc_version;
+=09unsigned long output;
=20
-=09err =3D method_dytc(priv->adev->handle, DYTC_CMD_QUERY, &output);
+=09err =3D eval_dytc(priv->adev->handle, DYTC_CMD_QUERY, &output);
 =09/* For all other errors we can flag the failure */
 =09if (err)
 =09=09return err;
@@ -1292,16 +1274,16 @@ static const struct dmi_system_id hw_rfkill_list[] =
=3D {
 static int ideapad_acpi_add(struct platform_device *pdev)
 {
 =09int ret, i;
-=09int cfg;
 =09struct ideapad_private *priv;
 =09struct acpi_device *adev;
 =09acpi_status status;
+=09unsigned long cfg;
=20
 =09ret =3D acpi_bus_get_device(ACPI_HANDLE(&pdev->dev), &adev);
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


