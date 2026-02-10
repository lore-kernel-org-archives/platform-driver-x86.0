Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5474033120C
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 20:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770755925; cv=none; b=NFxnuA1dn5RNn5rzEjN872PBz4vZILhXczt307/rmlH9jH4Quurrx7THtqw1cFj5DJaGuoPjdL8htX2T3LY+aCmwCfeLH0i0mDk93mtsOTbGzBhhvsHyq4agozr7txUbqDFBEIgK6EGbgp9WQbCPblbGzzzWsbqRDbSRYRpmVzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770755925; c=relaxed/simple;
	bh=h8DdezPklEcf8d5+qgkK5I05Yg3WNY2Lk9bd0TxvKgI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Ns589QIATMkkxGRXCtlmdzOv49Up/a84qKKFYg1yiEulnlaijSDkCT1gn6+IduniexISoRMud6hBVDdKsfZ93AaaRnjbNZDwkppm/3xj2ogqVhCra2Qo3WqtmIDA1J2Hzx3gceieh9MLQrPjxN/82F628vE8b6yxpR/LUkcKr90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lUb7M/BO; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lUb7M/BO"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1270adc5121so1579507c88.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 12:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770755923; x=1771360723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0wd4iCp54goUvFYhob0ng7Y4ogLL550iWX92wbJKSHg=;
        b=lUb7M/BOl/Vnva1ZesIYs15qaHy1UwH5+Z3NLa8gHQ7LJN2HBZCovji6FACiTCtdm+
         eUlNbWpiCK/r1CtAIK3oRqpg+9fk6jfNOVWIQronQVWFYvZKOOzK2wN5dLbPsYh+JtKa
         NbhwbWbECJpbi3fkXFas5psqxOO7UvJwialb1ZPTfjXYZQSnPKQNB9uzgc8SvVbNAv3A
         mtW0NzTFo/DHBSUoY5cLcmEZk9VdT/tp7yGPZWp+ZwI/9cc5nOkn322pvG8YcqvgyrFu
         1/o18fYgp6HO16atBV39mG9dqtNUHMC6t9Yx+plJ8YnJa4dEUB/OebeA/1im/wX1I/LP
         dnIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770755923; x=1771360723;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0wd4iCp54goUvFYhob0ng7Y4ogLL550iWX92wbJKSHg=;
        b=EJPouAaeh/Fj4HFi9+0KHoPI5U54lKRoFOWdZ2BPdNNfgyNTy3HN0c2Rwnx5DM3lgE
         0RTkyXtFfybTM+VaG68qmh71m2lsw9wpo6y/cnDTZfb9PUelIps1LJqwAt2rk93/OHk1
         hHf1o7Dfz3g6ZVaF36abs1RH3nt+OEfLSFXydBIA6dtys5DhDC4sg4Ix+yEDDz/GUorZ
         gIYyNellh0Iebehdn9tQvnAOfno5SBi8EdbIVoJEu71D2bW6pv+kNjtFPhi8hjKm8qwr
         AgQ492dRFtSWF4G0af1NtM1G2ho30M1fbXqxhIKAsOfoJm9msvkp5dDQFFzitLDAusar
         CVOg==
X-Forwarded-Encrypted: i=1; AJvYcCWKo9VKQQ2PfVKMZW5ME/yDzIjKRHw5/jw80uJddZggp42xvOVX589eYFac6NJIwJ7ZfJwNhJYUXlVR+HD9ULqinAMM@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi25BAtvcFBATMoqeUx3m02syHKTMOkYi+oKT3jkMKTZykT5Se
	gRMFOKLKfXUJh81ojvEHSrLwZ1dk9mpXec+Hr87eRyWAohjpuJatPf6t
X-Gm-Gg: AZuq6aKEeZ2VoblPktSBqrHhcl3gcNMkM0uxZPF6B/5fVUwxPsdjg1MsEWedhhVmdEO
	c80QOr9V2HLj6Ebv2lU2ls1oINpkwaFCVLOTbjcbi1T6B0UQX9TQZiN9ywGN1y2pO3CWTisAKas
	BWQqr+DbThsYZg3oxBZgjIy+CSmofQh7PNEV7QpmFrBhAlmUwJOl1Zop/wNk43HgUcwTP7c9lOG
	j9GrDk8Aew+ReuGsoXvjloKuSuKJiX8cL2vrAlrqQ0y+LuYIgXgrgEXH4yHAim7TD3uWnFcBudt
	u6khuxi3QvXGxj1qS0bOpptEjRTu2bZqTl0+KBYb5GFm9Dqzjp/Gx/+91uFUKEFentKwYg56B28
	bEBpzL1dcV+FdDaDtoRMs+oIfRZFPFysux+g9dB/NJiMdQR/wqqC6gsYBwn0aaVkfZxdKC+W+XX
	ucbx6BRdaJkWUuNbfBvIMB671mUWax79ZA/Z8ookOw/QPZT8x9BC6kjXFzMifeLGIeo4Kk+ltrs
	X1ByvrYZTgHrS6h9lVmwg==
X-Received: by 2002:a05:7022:419c:b0:119:e56b:98bf with SMTP id a92af1059eb24-12704059fc5mr7319446c88.38.1770755923058;
        Tue, 10 Feb 2026 12:38:43 -0800 (PST)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855af6452sm10528387eec.9.2026.02.10.12.38.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 12:38:42 -0800 (PST)
Date: Tue, 10 Feb 2026 12:38:42 -0800
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Rong Zhang <i@rong.moe>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_2/2=5D_platform/x86=3A_lenovo-wmi-ca?=
 =?US-ASCII?Q?pdata=3A_Add_debugfs_file_for_dumping_capdata?=
User-Agent: Thunderbird for Android
In-Reply-To: <20260210191938.137234-3-i@rong.moe>
References: <20260210191938.137234-1-i@rong.moe> <20260210191938.137234-3-i@rong.moe>
Message-ID: <34161A06-2732-4819-B986-4B471B98EF44@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On February 10, 2026 11:19:37 AM PST, Rong Zhang <i@rong=2Emoe> wrote:
>The Lenovo GameZone/Other interfaces have some delicate divergences
>among different devices=2E When making a bug report or adding support for
>new devices/interfaces, capdata is the most important information to
>cross-check with=2E
>
>Add a debugfs file (lenovo_wmi/<device_name>/capdata), so that users can
>dump capdata and include it in their reports=2E
>
>Since `struct capdata01' is just an extension to `struct capdata00',
>also converts the former to include the latter anonymously
>(-fms-extensions, since v6=2E19)=2E In this manner type casting won't be
>confusing=2E
>
>Signed-off-by: Rong Zhang <i@rong=2Emoe>
>---
> drivers/platform/x86/lenovo/Kconfig       |   1 +
> drivers/platform/x86/lenovo/wmi-capdata=2Ec | 121 ++++++++++++++++++++++
> drivers/platform/x86/lenovo/wmi-capdata=2Eh |   4 +-
> 3 files changed, 123 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/l=
enovo/Kconfig
>index f885127b007f1=2E=2E8357971c76d80 100644
>--- a/drivers/platform/x86/lenovo/Kconfig
>+++ b/drivers/platform/x86/lenovo/Kconfig
>@@ -236,6 +236,7 @@ config YT2_1380
> config LENOVO_WMI_CAPDATA
> 	tristate
> 	depends on ACPI_WMI
>+	depends on LENOVO_WMI_HELPERS
>=20
> config LENOVO_WMI_EVENTS
> 	tristate
>diff --git a/drivers/platform/x86/lenovo/wmi-capdata=2Ec b/drivers/platfo=
rm/x86/lenovo/wmi-capdata=2Ec
>index ee1fb02d8e31e=2E=2Eca478b45119bc 100644
>--- a/drivers/platform/x86/lenovo/wmi-capdata=2Ec
>+++ b/drivers/platform/x86/lenovo/wmi-capdata=2Ec
>@@ -32,6 +32,7 @@
> #include <linux/cleanup=2Eh>
> #include <linux/component=2Eh>
> #include <linux/container_of=2Eh>
>+#include <linux/debugfs=2Eh>
> #include <linux/device=2Eh>
> #include <linux/dev_printk=2Eh>
> #include <linux/err=2Eh>
>@@ -43,11 +44,13 @@
> #include <linux/mutex_types=2Eh>
> #include <linux/notifier=2Eh>
> #include <linux/overflow=2Eh>
>+#include <linux/seq_file=2Eh>
> #include <linux/stddef=2Eh>
> #include <linux/types=2Eh>
> #include <linux/wmi=2Eh>
>=20
> #include "wmi-capdata=2Eh"
>+#include "wmi-helpers=2Eh"
>=20
> #define LENOVO_CAPABILITY_DATA_00_GUID "362A3AFE-3D96-4665-8530-96DAD5BB=
300E"
> #define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3BE01=
8154"
>@@ -88,6 +91,7 @@ struct lwmi_cd_priv {
> 	struct notifier_block acpi_nb; /* ACPI events */
> 	struct wmi_device *wdev;
> 	struct cd_list *list;
>+	struct dentry *debugfs_dir;
>=20
> 	/*
> 	 * A capdata device may be a component master of another capdata device=
=2E
>@@ -118,6 +122,8 @@ struct cd_list {
>=20
> static struct wmi_driver lwmi_cd_driver;
>=20
>+/* =3D=3D=3D=3D=3D=3D=3D=3D Device components =3D=3D=3D=3D=3D=3D=3D=3D *=
/
>+
> /**
>  * lwmi_cd_match() - Match rule for the master driver=2E
>  * @dev: Pointer to the capability data parent device=2E
>@@ -471,6 +477,116 @@ EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO_WM=
I_CAPDATA");
> DEF_LWMI_CDXX_GET_DATA(cd_fan, LENOVO_FAN_TEST_DATA, struct capdata_fan)=
;
> EXPORT_SYMBOL_NS_GPL(lwmi_cd_fan_get_data, "LENOVO_WMI_CAPDATA");
>=20
>+/* =3D=3D=3D=3D=3D=3D=3D=3D debugfs =3D=3D=3D=3D=3D=3D=3D=3D */
>+
>+/**
>+ * lwmi_cd00_show() - Dump capdata00
>+ * @s: Pointer to seq_file where the capdata00 is dumped=2E
>+ * @cd00: Pointer to a capdata00 struct to be dumped=2E
>+ */
>+static void lwmi_cd00_show(struct seq_file *s, struct capdata00 *cd00)
>+{
>+	u8 dev =3D FIELD_GET(LWMI_ATTR_DEV_ID_MASK, cd00->id);
>+	u8 feat =3D FIELD_GET(LWMI_ATTR_FEAT_ID_MASK, cd00->id);
>+	u8 mode =3D FIELD_GET(LWMI_ATTR_MODE_ID_MASK, cd00->id);
>+	u8 type =3D FIELD_GET(LWMI_ATTR_TYPE_ID_MASK, cd00->id);
>+	bool extra =3D cd00->supported & ~(LWMI_SUPP_GET | LWMI_SUPP_SET | LWMI=
_SUPP_VALID);
>+	bool get =3D cd00->supported & LWMI_SUPP_GET;
>+	bool set =3D cd00->supported & LWMI_SUPP_SET;
>+	bool valid =3D cd00->supported & LWMI_SUPP_VALID;

Hi Rong,

I have something that will clean this up in the series I'm working on, LWM=
I_ATTR_ID, that pushes all the FIELD_PREP into a macro=2E Perhaps it would =
be worth combining this series into mine that so we can use it here as well=
=2E=20

My series also addresses some fairly significant bugs, so I'd prefer to no=
t have to wait for this series to get approved to post it as it currently c=
onflicts in other areas=2E

>+	seq_printf(s, "  id:             0x%08x [dev: %2u, feat: %2u, mode: %2u=
, type: %2u]\n",
>+		   cd00->id, dev, feat, mode, type);
>+
>+	seq_printf(s, "  supported:      0x%08x [%c%c%c%c]\n", cd00->supported,
>+		   extra ? '+' : ' ',
>+		   get   ? 'R' : ' ',
>+		   set   ? 'W' : ' ',
>+		   valid ? 'V' : ' ');
>+
>+	seq_printf(s, "  default_value:  %u\n", cd00->default_value);
>+}
>+
>+/**
>+ * lwmi_cd01_show() - Dump capdata01
>+ * @s: Pointer to seq_file where the capdata01 is dumped=2E
>+ * @cd01: Pointer to a capdata01 struct to be dumped=2E
>+ */
>+static void lwmi_cd01_show(struct seq_file *s, struct capdata01 *cd01)
>+{
>+	/* capdata01 is an extension to capdata00=2E */
>+	lwmi_cd00_show(s, (struct capdata00 *)cd01);
>+
>+	seq_printf(s, "  step:           %u\n", cd01->step);
>+	seq_printf(s, "  min_value:      %u\n", cd01->min_value);
>+	seq_printf(s, "  max_value:      %u\n", cd01->max_value);
>+}
>+
>+/**
>+ * lwmi_cd_fan_show() - Dump capdata_fan
>+ * @s: Pointer to seq_file where the capdata_fan is dumped=2E
>+ * @cd_fan: Pointer to a capdata_fan struct to be dumped=2E
>+ */
>+static void lwmi_cd_fan_show(struct seq_file *s, struct capdata_fan *cd_=
fan)
>+{
>+	seq_printf(s, "  id:             %u\n", cd_fan->id);
>+	seq_printf(s, "  min_rpm:        %u\n", cd_fan->min_rpm);
>+	seq_printf(s, "  max_rpm:        %u\n", cd_fan->max_rpm);
>+}
>+
>+/**
>+ * lwmi_cd_debugfs_show() - Dump capability data to debugfs
>+ * @s: Pointer to seq_file where the capability data is dumped=2E
>+ * @data: unused=2E
>+ *
>+ * Return: 0
>+ */
>+static int lwmi_cd_debugfs_show(struct seq_file *s, void *data)
>+{
>+	struct lwmi_cd_priv *priv =3D s->private;
>+	u8 idx;
>+
>+	guard(mutex)(&priv->list->list_mutex);
>+
>+	/* lwmi_cd_alloc() ensured priv->list->type must be a valid type=2E */
>+	for (idx =3D 0; idx < priv->list->count; idx++) {
>+		seq_printf(s, "%s[%u]:\n", lwmi_cd_table[priv->list->type]=2Ename, idx=
);
>+
>+		if (priv->list->type =3D=3D LENOVO_CAPABILITY_DATA_00)
>+			lwmi_cd00_show(s, &priv->list->cd00[idx]);
>+		else if (priv->list->type =3D=3D LENOVO_CAPABILITY_DATA_01)
>+			lwmi_cd01_show(s, &priv->list->cd01[idx]);
>+		else if (priv->list->type =3D=3D LENOVO_FAN_TEST_DATA)
>+			lwmi_cd_fan_show(s, &priv->list->cd_fan[idx]);
>+	}
>+
>+	return 0;
>+}
>+DEFINE_SHOW_ATTRIBUTE(lwmi_cd_debugfs);
>+
>+/**
>+ * lwmi_cd_debugfs_add() - Create debugfs directory and files for a devi=
ce
>+ * @priv: lenovo-wmi-capdata driver data=2E
>+ */
>+static void lwmi_cd_debugfs_add(struct lwmi_cd_priv *priv)
>+{
>+	priv->debugfs_dir =3D lwmi_debugfs_create_dir(priv->wdev);
>+
>+	debugfs_create_file("capdata", 0444, priv->debugfs_dir, priv, &lwmi_cd_=
debugfs_fops);
>+}
>+
>+/**
>+ * lwmi_cd_debugfs_remove() - Remove debugfs directory for a device
>+ * @priv: lenovo-wmi-capdata driver data=2E
>+ */
>+static void lwmi_cd_debugfs_remove(struct lwmi_cd_priv *priv)
>+{
>+	debugfs_remove_recursive(priv->debugfs_dir);
>+	priv->debugfs_dir =3D NULL;
>+}
>+
>+/* =3D=3D=3D=3D=3D=3D=3D=3D WMI interface =3D=3D=3D=3D=3D=3D=3D=3D */
>+
> /**
>  * lwmi_cd_cache() - Cache all WMI data block information
>  * @priv: lenovo-wmi-capdata driver data=2E
>@@ -773,6 +889,8 @@ static int lwmi_cd_probe(struct wmi_device *wdev, con=
st void *context)
> 		dev_err(&wdev->dev, "failed to register %s: %d\n",
> 			info->name, ret);
> 	} else {
>+		lwmi_cd_debugfs_add(priv);
>+
> 		dev_dbg(&wdev->dev, "registered %s with %u items\n",
> 			info->name, priv->list->count);
> 	}
>@@ -783,6 +901,8 @@ static void lwmi_cd_remove(struct wmi_device *wdev)
> {
> 	struct lwmi_cd_priv *priv =3D dev_get_drvdata(&wdev->dev);
>=20
>+	lwmi_cd_debugfs_remove(priv);
>+
> 	switch (priv->list->type) {
> 	case LENOVO_CAPABILITY_DATA_00:
> 		lwmi_cd_sub_master_del(priv);
>@@ -822,6 +942,7 @@ static struct wmi_driver lwmi_cd_driver =3D {
>=20
> module_wmi_driver(lwmi_cd_driver);
>=20
>+MODULE_IMPORT_NS("LENOVO_WMI_HELPERS");
> MODULE_DEVICE_TABLE(wmi, lwmi_cd_id_table);
> MODULE_AUTHOR("Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>");
> MODULE_AUTHOR("Rong Zhang <i@rong=2Emoe>");
>diff --git a/drivers/platform/x86/lenovo/wmi-capdata=2Eh b/drivers/platfo=
rm/x86/lenovo/wmi-capdata=2Eh
>index 8c1df3efcc553=2E=2E034a6e48be071 100644
>--- a/drivers/platform/x86/lenovo/wmi-capdata=2Eh
>+++ b/drivers/platform/x86/lenovo/wmi-capdata=2Eh
>@@ -30,9 +30,7 @@ struct capdata00 {
> };
>=20
> struct capdata01 {
>-	u32 id;
>-	u32 supported;
>-	u32 default_value;
>+	struct capdata00;

Doesn't this also require some significant changes to the usage in wmi-oth=
er and in the query function? We're accessing these members directly=2E

Thanks,=20
Derek

> 	u32 step;
> 	u32 min_value;
> 	u32 max_value;

