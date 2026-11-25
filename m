Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596196;
	b=DB68iEYR126tMv1CC7UeRcXStUynwJkNb9+1/gQ574ACHDgXemGo0VeVJvL+3xZCY2Oo
	 EK/WRYq95dfbMlJrWjffe0fquq9kvs7rzlCKoeNhy0pNegPLO0BJkMtcjSDm4g+FeprPk
	 3tZo4C0eXWAJZ+UMy8OCNjjqlKbBf2pATZ2idUQgVR63HZ7lXVolrb39ZVviIAxO8NlfM
	 cIA5iHtPgP3wHs1nR8P9LQ2ykb9eBR2lICn8nZumi/SE8Eu1uN+0qnBVNSYdQKUgTg9bl
	 Q4Q/GdwN75OsEjIFD00U9WcWAlCcHYh1oYBSLjXZbcTJ81oDz/0r+0GxJsYcV1Uc4fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596196;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=T0aV6xwlGfZKCz7sxzaw0UTzhGMaPZfXP9O3SvQDRzo=;
	b=tb1acPGfl7nyectyhm6yj2vBblgjRxazWKcFic2miTrVcQPcXHlCmgThd/I1d66FHm9H
	 eou3L8KRrKmVv2Der3lR8Lb1unuQJavNyYvRMgF1ZJSKgBcSGfFlsvy6fLzfRRcszDr0x
	 u8jR7Fws3w0oqnq4goI+Io4RBtqTLySYHegkGyXgbpDUUUgpYn/NmmKCPyOiK8l83btAd
	 ujRwGWLOIFMqoVCkYNB6oA8RWT4PV8CVcvWpZDGYZZ3tVElLyx5HOMCAmKYZ2c+E6Zj7E
	 /xROiRpgMxLaVSg+v9n/7vFBF8/rYo8fxy4UqwHGPlcg/qoogcnIqvK5hJ6KpZjg/tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=Bpw8OkhB;
	arc=none smtp.remote-ip=109.224.244.116
Received: from mail-244116.protonmail.ch (mail-244116.protonmail.ch [109.224.244.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BB3606A683
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 08:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05BB3606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=Bpw8OkhB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795596193; x=1795855393;
	bh=T0aV6xwlGfZKCz7sxzaw0UTzhGMaPZfXP9O3SvQDRzo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Bpw8OkhB4Y+8LuoCHZBYhKU4C1NE1FOxPh0yn3WUoBDs2bRis/6Z+vbRphad+X98B
	 4gnbyKxr/YnFikcSBVpUArD7aGo5AC4dE2S7ufRbS/ubGcI5lE9O/8M3pXCP1w7QxH
	 RfBSkRh+aCgrHWdw1joINZXJsDrXQggmiL3WlsoZMhD5/Wbthaes1tC4HkJ0/8aAtr
	 EwgrQ4uGXlOrzi8ztrvOTbanw/r2nx5QdaZG6GpjhhwIZ13amyR/b9WoWTqjz2FIlT
	 VbXmyxCCe/ZGZo8hF4C5OJFRZCVJumJiIDKyJPJWoUk9grYzyGYuWZ88Mp6kxrDLOv
	 vEfI7mHlqPDkw==
Date: Wed, 25 Nov 2026 08:43:07 +0000
To: Fuwei Xie <12313607@mail.sustech.edu.cn>
From: =?utf-8?Q?Eren_=C3=96zen?= <erenozen@protonmail.com>
Cc: ilpo.jarvinen@linux.intel.com, hansg@kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, yhshzh0@gmail.com
Subject: Re: [RFC PATCH v3 0/5] platform/x86: huawei-wmi: expose native firmware power profiles
Message-ID: <QXyyjD0WtiiXyud6K1vZI9r7jScmkJsS_FC-tqfI1IeLF359IrJjxdfRd_9tC_x6AH_y2RV4hFu6cpOWhw5HgQqfSmgS_9LXuf6Fl9VPipU=@protonmail.com>
In-Reply-To: <CCE496207C6C15CE+20261125074048.50842-1-12313607@mail.sustech.edu.cn>
References: <4F34E5193B4633F6+20261124172651.37716-1-12313607@mail.sustech.edu.cn> <hCsVvRfdJna6QMofi0p51idPd_JLLislzGzqFjePf9_91ayfS92LIselCT-narFk2u5zTRqLQsKFnz4bgRrNmjY5EKgq9UYj0n_CfmaCJjs=@protonmail.com> <CCE496207C6C15CE+20261125074048.50842-1-12313607@mail.sustech.edu.cn>
Feedback-ID: 19860221:user:proton
X-Pm-Message-ID: b2c10bd715acfd7f2da76285830889f90fc40f98
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Fuwei,

On Wed, Nov 25, 2026 at 03:40:44PM +0800, Fuwei Xie wrote:
> Thanks for trying this out and for catching the silent fallback to
> \SBTT. I'd appreciate a copy of the diff you tested.

Sure, it's below. Since my last mail I've also run it on the CREM-WXX9
(BIOS 2.32): built out of tree against the Fedora 7.3.4-300 kernel and
loaded in place of the stock module, on top of your five v3 patches:

- the thresholds read back correctly in charge modes 1 and 2, and as
  0/100 in modes 0 and 4 (mode 3 not re-run),
- the original bug case works: writing 75/80 while the EC is in
  smart-charge mode 4 puts it back in mode 1 with 75/80,
- writing 0/100 and the power_supply start/end attributes work,
- reloading the module in mode 1 and in mode 4 reports the right
  values, and the kernel log shows nothing beyond the usual probe
  messages (no lockdep on this kernel, though).

It also builds in-tree on for-next 61c0dac952b9 with W=3D1 and sparse. I
didn't re-measure the charging current this time; the EC side is the
same as with the original patch, and I checked the \GBCM and \GBTT
state after every step instead.

The diff is against for-next 61c0dac952b9 with your five v3 patches
applied. Compared with my v1 patch, only the charge-mode calls changed:

- huawei_wmi_charge_mode_get() takes the huawei pointer, returns
  negative errors from huawei_wmi_cmd(), requires at least two data
  bytes, and reads the mode and the parameter from data[0] and data[1].
- huawei_wmi_charge_mode_set() holds wmi_lock across the \GBCM read
  and the \SBCM write.
- huawei_wmi_battery_get() takes wmi_lock around its own \GBCM read.
- the probe check calls huawei_wmi_charge_mode_get() under wmi_lock.

As before, I used Claude for the rebase, the test script and to draft
this mail; I've reviewed the diff and checked the results against the
test log.

Thanks,
Eren

diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawe=
i-wmi.c
index ff80050..f8b449d 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -38,6 +38,8 @@
 enum {
 =09BATTERY_THRESH_GET=09=09=3D 0x00001103, /* \GBTT */
 =09BATTERY_THRESH_SET=09=09=3D 0x00001003, /* \SBTT */
+=09BATTERY_CHARGE_MODE_GET=09=09=3D 0x00001603, /* \GBCM */
+=09BATTERY_CHARGE_MODE_SET=09=09=3D 0x00001503, /* \SBCM */
 =09FN_LOCK_GET=09=09=09=3D 0x00000604, /* \GFRS */
 =09FN_LOCK_SET=09=09=09=3D 0x00000704, /* \SFRS */
 =09MICMUTE_LED_SET=09=09=09=3D 0x00000b04, /* \SMLS */
@@ -68,6 +70,7 @@ struct huawei_wmi {
 =09struct wmi_device *wdev;
 =09struct notifier_block profile_notifier;
 =09bool battery_available;
+=09bool charge_mode_available;
 =09bool fn_lock_available;
=20
 =09struct huawei_wmi_debug debug;
@@ -413,11 +416,93 @@ static void huawei_wmi_leds_setup(struct device *dev)
=20
 /* Battery protection */
=20
+/*
+ * Newer firmware also implements \GBCM and \SBCM ("battery charge mode").
+ * \GBCM returns the charge mode in byte 1, a parameter of unknown meaning
+ * in byte 2 and a pair of thresholds in bytes 3 and 4, and \SBCM takes th=
e
+ * same four values in bytes 2 to 5 of its argument. Thresholds set throug=
h
+ * \SBCM are also returned by \GBTT, but \SBTT does not update the ones
+ * returned by \GBCM. huawei_wmi_cmd() strips the status byte, so the mode
+ * and the parameter end up in data[0] and data[1].
+ *
+ * In charge modes 1 to 3 the EC does not charge above the end threshold
+ * returned by \GBTT, and a 0/0 pair means that charging is not limited.
+ * In charge modes 0 and 4 it charges past the end threshold. \SBTT,
+ * which turns a 0/100 request into 0/0, switches the EC to charge mode 4
+ * ("smart charge") in that case, and a later \SBTT write does not
+ * necessarily switch it back. So write the thresholds through \SBCM in
+ * charge mode 1 instead.
+ */
+#define HWMI_CHARGE_MODE_THRESHOLDS=091
+#define HWMI_CHARGE_MODE_PRESET_LAST=093
+
+static int huawei_wmi_charge_mode_get(struct huawei_wmi *huawei, u8 *mode,=
 u8 *param)
+{
+=09u8 data[0xff];
+=09int len;
+
+=09len =3D huawei_wmi_cmd(huawei, BATTERY_CHARGE_MODE_GET, data, sizeof(da=
ta));
+=09if (len < 0)
+=09=09return len;
+=09if (len < 2)
+=09=09return -ENODATA;
+
+=09if (mode)
+=09=09*mode =3D data[0];
+=09if (param)
+=09=09*param =3D data[1];
+
+=09return 0;
+}
+
+static int huawei_wmi_charge_mode_set(struct huawei_wmi *huawei, int start=
, int end)
+{
+=09union hwmi_arg arg;
+=09u8 param;
+=09int err;
+
+=09guard(mutex)(&huawei->wmi_lock);
+=09err =3D huawei_wmi_charge_mode_get(huawei, NULL, &param);
+=09if (err)
+=09=09return err;
+
+=09if (start =3D=3D 0 && end =3D=3D 100)
+=09=09end =3D 0;
+
+=09arg.cmd =3D BATTERY_CHARGE_MODE_SET;
+=09arg.args[2] =3D HWMI_CHARGE_MODE_THRESHOLDS;
+=09arg.args[3] =3D param;
+=09arg.args[4] =3D start;
+=09arg.args[5] =3D end;
+
+=09return huawei_wmi_cmd(huawei, arg.cmd, NULL, 0);
+}
+
 static int huawei_wmi_battery_get(struct huawei_wmi *huawei, int *start, i=
nt *end)
 {
 =09u8 data[0xff];
 =09int len;
=20
+=09if (huawei->charge_mode_available) {
+=09=09u8 mode;
+=09=09int err;
+
+=09=09scoped_guard(mutex, &huawei->wmi_lock)
+=09=09=09err =3D huawei_wmi_charge_mode_get(huawei, &mode, NULL);
+=09=09if (err)
+=09=09=09return err;
+
+=09=09/* The thresholds are not used in the other charge modes. */
+=09=09if (mode < HWMI_CHARGE_MODE_THRESHOLDS ||
+=09=09    mode > HWMI_CHARGE_MODE_PRESET_LAST) {
+=09=09=09if (start)
+=09=09=09=09*start =3D 0;
+=09=09=09if (end)
+=09=09=09=09*end =3D 100;
+=09=09=09return 0;
+=09=09}
+=09}
+
 =09scoped_guard(mutex, &huawei->wmi_lock)
 =09=09len =3D huawei_wmi_cmd(huawei, BATTERY_THRESH_GET, data, sizeof(data=
));
 =09if (len < 0)
@@ -433,6 +518,10 @@ static int huawei_wmi_battery_get(struct huawei_wmi *h=
uawei, int *start, int *en
 =09if (end)
 =09=09*end =3D data[len - 1];
=20
+=09/* A 0/0 pair means that charging is not limited. */
+=09if (huawei->charge_mode_available && end && !*end)
+=09=09*end =3D 100;
+
 =09return 0;
 }
=20
@@ -444,6 +533,9 @@ static int huawei_wmi_battery_set(struct huawei_wmi *hu=
awei, int start, int end)
 =09if (start < 0 || end < 0 || start > 100 || end > 100)
 =09=09return -EINVAL;
=20
+=09if (huawei->charge_mode_available)
+=09=09return huawei_wmi_charge_mode_set(huawei, start, end);
+
 =09arg.cmd =3D BATTERY_THRESH_SET;
 =09arg.args[2] =3D start;
 =09arg.args[3] =3D end;
@@ -607,6 +699,17 @@ static void huawei_wmi_battery_setup(struct device *de=
v)
 {
 =09struct huawei_wmi *huawei =3D dev_get_drvdata(dev);
=20
+=09/*
+=09 * Only trust the \GBCM status if the firmware actually implements the
+=09 * methods, in case the HWMI dispatcher of some model reports success
+=09 * for unknown functions.
+=09 */
+=09if (acpi_has_method(NULL, "\\GBCM") && acpi_has_method(NULL, "\\SBCM"))=
 {
+=09=09scoped_guard(mutex, &huawei->wmi_lock)
+=09=09=09huawei->charge_mode_available =3D
+=09=09=09=09!huawei_wmi_charge_mode_get(huawei, NULL, NULL);
+=09}
+
 =09huawei->battery_available =3D true;
 =09if (huawei_wmi_battery_get(huawei, NULL, NULL)) {
 =09=09huawei->battery_available =3D false;

