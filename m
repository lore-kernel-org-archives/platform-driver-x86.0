Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C51A2ECAAD3
	for <platform-driver-x86@archiver.kernel.org>; Sun, 11 Sep 2022 16:17:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbiIKQRl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 11 Sep 2022 12:17:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbiIKQRk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 11 Sep 2022 12:17:40 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C17D2BB19
        for <platform-driver-x86@vger.kernel.org>; Sun, 11 Sep 2022 09:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1662913047;
        bh=vVpRKmGnsKfjVG6J8Vg5dnuk8ER/QteMgKMttPq96+k=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=SxgZulJFOumzKzS59nGj29QqXMjgzdkywK9baPJz8nuDsrMHmNFZgWuc7/WQBJADr
         LdKIANxKr2iR4hCMndePxU/G9ulG199MvscmL0bttixEaVa/7hNbq/s0y9wSCksoEB
         9KQ88Le9h2wc7SGeQq9JKVGSheU676lsHSjsIa6s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from yoga9.fritz.box ([94.134.182.245]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N95eJ-1pRUoK2lYF-0169am; Sun, 11
 Sep 2022 18:17:27 +0200
From:   Philipp Jungkamp <p.jungkamp@gmx.net>
To:     Ike Panhc <ike.pan@canonical.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Philipp Jungkamp <p.jungkamp@gmx.net>
Subject: [PATCH] Add IdeaPad quick_charge attribute to sysfs
Date:   Sun, 11 Sep 2022 18:17:18 +0200
Message-Id: <20220911161718.24284-1-p.jungkamp@gmx.net>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fmO/nwWg/u5zt/rLhVunLgu9HV8/fHxF+qHgVUkRKZIcFC/Fo0u
 jAah4x+qTS0TnObCucurxrt4Qvs6rozq9w5F8iHm/N82v1Q2iSh+0ePQRMnZ7u8P5kbg8of
 4VG1oxcjaOKg68AwFjUsgZmYqL7sS5By33ae6ITc25XwXsHJ5qzftne2lLbPdbsuwLfODq/
 TGQOeFxNjW30iRYgJndng==
X-UI-Out-Filterresults: notjunk:1;V03:K0:frLvojgYygI=:NoqBKUiFj1nChYGczjK5Rv
 pcWn9nBXL2pOPNigJcWjtKoMSAaFCWzGvxahXox5WlHD9cJTPCNTh0HZ2l9JoSSZ1CfrF1aDq
 D03AaO13fUi2IU8iCtcQm2nZnaRtO6X2Go1NBDif3zuHgx4o4xKJq9r4leQGiE6iSsRxK5qOV
 hcOPHgMhG2L8DMxVPct+bdJYkkmZ1WSSHITbgWqLVHTOfyJpXYf4RuGWXAjouu1ofh1kT9liD
 vsmCY8OO8kVQnctOg6Dp/v1qodOK/4QIjyC1I3TZziLVDOdB6RWOz86uA6UmHwYsIz9Ig3WS7
 oscgIiXfnznrG1mQa2FpCedfBPAt2PAJ/QTPgIqq0zpUTWL/AEKFuxJuys5JbluIIU4smik9b
 MIwwK3MKTFJOkkMoqyFc03EZ9mH3xmAZTFFZyjgGJFSp8ZuL8oqKEWPuiqRMYPmGGUTEpU2mp
 W/nXyCP1E2F1QH85CeJ5qJcoNNYumIYLqEYPVTHAETCxnEuuVnu8q1BrU6xlpyXai0UKpw49v
 vdGZ+nF8910hOcw4AfTrjuN3CQA7o4R3sXjSFVMG5kkrVGp1Mt9u7RAeIRjMUVHhSvxkFTVe5
 zp9tH3p/uvmwx3AicKkIWE2S+SIze0I0n90go1d5PPTvshkvnEuf5pxz2Vtaoxun9/hMq556A
 pmBh09bavSN7rWzr4A8wmJsvXvxwVNEFuXZB9hNkzFzwjWawdoH80vd5TOCu+TAy8pOEPdPmR
 EQ30rwIXQkZK08csupCFxrBqPsm23YN/dV4zWoXolH+FJS0obIhaKaOGChZ5Nqg7JY+LLVLfQ
 nmQ0vYoLxwx4zx4eA/rOvNM31fdwrhXBovGi/Eq+GMyZOTm6B10/WgLFrHD8j9W7H7H27bR2T
 nUPCBw+r/nHfAcyy2LylVcbJZrsv0SQZXIrsGLyzfJgLoFy6QD/O9yF+Yjr3B7GXrQRKZ8a0a
 y1ja+6figEtMKCw0VCN2+1EjIjXn6bWqENVFu3DZM1ZWle088P/w4Uz4vt3ezYGw2zV3KT3DM
 dhIonMPLBtH4J7jwJeA2WawGyEK/MT8qUh6RgBlrJ4QNv/DusNBxy3I6OS5VCcX6+kLu7OvlK
 EDPXXsjb5vP5U6uxJV2v40o045aQLc7eGsKcrxjRkcOyumzOQ+0eGCEp8B7tbhMIn91XsfD/X
 B7TtZ07uhnBsqSgNw5LSXvBhNm
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

More recent IdeaPads allow USB-C quick-charging to be controlled via
ACPI. This seems to be mutually exclusive with the ACPI conservation
mode.

Expose a readable and writable 'quick_charge' sysfs attribute next when
support is indicated in ACPI.
=2D--
I deduced the indicator bits from their names in the DSDT (QCHO and
QCHX). I don't have an IdeaPad except mine on hand and can't check
whether these are indeed the intended uses or their behaviour on other
IdeaPads. I can confirm that a change in the quick_charge toggle is
visible in Lenovo Vantage when dual booting into Windows 11.

Greetings,
Philipp Jungkamp

 drivers/platform/x86/ideapad-laptop.c | 64 ++++++++++++++++++++++++++-
 1 file changed, 62 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/=
ideapad-laptop.c
index abd0c81d62c4..dea35779264a 100644
=2D-- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -54,12 +54,16 @@ enum {
 };

 enum {
-	GBMD_CONSERVATION_STATE_BIT =3D 5,
+	GBMD_QUICK_CHARGE_STATE_BIT   =3D 2,
+	GBMD_CONSERVATION_STATE_BIT   =3D 5,
+	GBMD_QUICK_CHARGE_SUPPORT_BIT =3D 17,
 };

 enum {
 	SBMC_CONSERVATION_ON  =3D 3,
 	SBMC_CONSERVATION_OFF =3D 5,
+	SBMC_QUICK_CHARGE_ON  =3D 7,
+	SBMC_QUICK_CHARGE_OFF =3D 8,
 };

 enum {
@@ -140,6 +144,7 @@ struct ideapad_private {
 		bool kbd_bl               : 1;
 		bool touchpad_ctrl_via_ec : 1;
 		bool usb_charging         : 1;
+		bool quick_charge         : 1;
 	} features;
 	struct {
 		bool initialized;
@@ -482,6 +487,12 @@ static ssize_t conservation_mode_store(struct device =
*dev,
 	if (err)
 		return err;

+	if (priv->features.quick_charge && state) {
+		err =3D exec_sbmc(priv->adev->handle, SBMC_QUICK_CHARGE_OFF);
+		if (err)
+			return err;
+	}
+
 	err =3D exec_sbmc(priv->adev->handle, state ? SBMC_CONSERVATION_ON : SBM=
C_CONSERVATION_OFF);
 	if (err)
 		return err;
@@ -491,6 +502,48 @@ static ssize_t conservation_mode_store(struct device =
*dev,

 static DEVICE_ATTR_RW(conservation_mode);

+static ssize_t quick_charge_show(struct device *dev,
+				 struct device_attribute *attr,
+				 char *buf)
+{
+	struct ideapad_private *priv =3D dev_get_drvdata(dev);
+	unsigned long result;
+	int err;
+
+	err =3D eval_gbmd(priv->adev->handle, &result);
+	if (err)
+		return err;
+
+	return sysfs_emit(buf, "%d\n", !!test_bit(GBMD_QUICK_CHARGE_STATE_BIT, &=
result));
+}
+
+static ssize_t quick_charge_store(struct device *dev,
+				  struct device_attribute *attr,
+				  const char *buf, size_t count)
+{
+	struct ideapad_private *priv =3D dev_get_drvdata(dev);
+	bool state;
+	int err;
+
+	err =3D kstrtobool(buf, &state);
+	if (err)
+		return err;
+
+	if (priv->features.conservation_mode && state) {
+		err =3D exec_sbmc(priv->adev->handle, SBMC_CONSERVATION_OFF);
+		if (err)
+			return err;
+	}
+
+	err =3D exec_sbmc(priv->adev->handle, state ? SBMC_QUICK_CHARGE_ON : SBM=
C_QUICK_CHARGE_OFF);
+	if (err)
+		return err;
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(quick_charge);
+
 static ssize_t fan_mode_show(struct device *dev,
 			     struct device_attribute *attr,
 			     char *buf)
@@ -641,6 +694,7 @@ static DEVICE_ATTR_RW(usb_charging);
 static struct attribute *ideapad_attributes[] =3D {
 	&dev_attr_camera_power.attr,
 	&dev_attr_conservation_mode.attr,
+	&dev_attr_quick_charge.attr,
 	&dev_attr_fan_mode.attr,
 	&dev_attr_fn_lock.attr,
 	&dev_attr_touchpad.attr,
@@ -660,6 +714,8 @@ static umode_t ideapad_is_visible(struct kobject *kobj=
,
 		supported =3D test_bit(CFG_CAP_CAM_BIT, &priv->cfg);
 	else if (attr =3D=3D &dev_attr_conservation_mode.attr)
 		supported =3D priv->features.conservation_mode;
+	else if (attr =3D=3D &dev_attr_quick_charge.attr)
+		supported =3D priv->features.quick_charge;
 	else if (attr =3D=3D &dev_attr_fan_mode.attr)
 		supported =3D priv->features.fan_mode;
 	else if (attr =3D=3D &dev_attr_fn_lock.attr)
@@ -1546,9 +1602,13 @@ static void ideapad_check_features(struct ideapad_p=
rivate *priv)
 	if (!read_ec_data(handle, VPCCMD_R_FAN, &val))
 		priv->features.fan_mode =3D true;

-	if (acpi_has_method(handle, "GBMD") && acpi_has_method(handle, "SBMC"))
+	if (acpi_has_method(handle, "GBMD") && acpi_has_method(handle, "SBMC")) =
{
 		priv->features.conservation_mode =3D true;

+		if (!eval_gbmd(handle,&val) && test_bit(GBMD_QUICK_CHARGE_SUPPORT_BIT, =
&val))
+			priv->features.quick_charge =3D true;
+	}
+
 	if (acpi_has_method(handle, "DYTC"))
 		priv->features.dytc =3D true;

=2D-
2.37.3

