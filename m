Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECDC280A5B;
	Wed, 11 Feb 2026 11:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770810744; cv=pass; b=inUyYDIbH6dt6jW1l5wZKNabk4eczhJQAThWcWelNVlicPlewApq2+7KKff23832h8ZzLcVKbtpaWvaISk+bZX7S+o6Lznx2mf6WO4bmJnYrUKA24/bqzLl2/T4lgvpptJc0JQRozxLyacg1xlM9nSBLXqYoBhzUbpkAqqw6eN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770810744; c=relaxed/simple;
	bh=CClFUj25gYZeLS2bZ1XouRVb2qIpknHZKq3O+yMciec=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Oj1NR+PdKd2TugUECh2uihoc9yDjSAJFtaQcTeoZqw4z2/8UVWyNqQdQ9Sx0vqt9x7g4zOAGLZtdHtFa39FzkDnjEXyQdc+/ioR8SWjOTAAXTtAwY/CcHDsxx2Tpvcf1nS1lthzTCoBSqeJH1Qt6GX2qdYCk3ezezD1MGug2/9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=aECz0LdO; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="aECz0LdO"
ARC-Seal: i=1; a=rsa-sha256; t=1770810732; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ky6NeQaBq3PrTr7uSQil6rfkTIVduMulgRJz6pCvLyBqEZO/KWgq2VPYe8y/tmOSglSvRasaWeG6eYIvCSZpKxrIcz1n5HAwdjp3hqPfYuQNhS2LQoD2WfcL5EndjHLDJW63br6e+uSLXe3iN+sEMtqLQuWj8MAEIwK0FrogyhI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770810732; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=g75cHajuH2vGJRvbLxhZi2YZJzPBLq2+gs4Pk14YHBQ=; 
	b=LRueYKlsqGYG/WBvK3a1+TaqqpIe0yblO/E+Pevux90yr38HDsqbqB07uctnAXORADHv5gVxjKLssET2IpD5esRUcsquieeBN7hhTf34Xsj1aWb6FspkoUc4HBDVj/3xADJhgRX0gwO9BpCIzwSUSnPW8wTbyfD44z+gXUGSjuM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770810732;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=g75cHajuH2vGJRvbLxhZi2YZJzPBLq2+gs4Pk14YHBQ=;
	b=aECz0LdOHp3eOUBdIS7E1Zi2qLnB0WEx3YLHPpDvT5WsxvTfOhTeqJV/tuqGUM8x
	K4fRdqbe0OuSG3PLERdtW2TvL0f3T2jfs03xi1gKLFfUZ2RQLUb/iTWV75kMAjsQXVF
	BKCSBOWUBkVTpdOxYMjoZTcppNK4YpU9UHWWADLRuV9zfwVGpm/7QiiL3BBAzsiIVfw
	lZjIIcTjnvqLqQ9TN3c0yhkaU0Q5DIeyJTwMHGozdpY8bhhtNPAGzMK2HdtihGxm56Z
	95xKPfzmrOKRID6mqbLPjkI025McGZd9x0s4cv5s8DIPYmHUdyulqxpwi68FvgOX4fl
	neUJ3lS/wA==
Received: by mx.zohomail.com with SMTPS id 1770810730390488.4656423740504;
	Wed, 11 Feb 2026 03:52:10 -0800 (PST)
Message-ID: <c557a3646d43fce65c51c0061443386699f1f320.camel@rong.moe>
Subject: Re: [PATCH 2/2] platform/x86: lenovo-wmi-capdata: Add debugfs file
 for dumping capdata
From: Rong Zhang <i@rong.moe>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: Kurt Borja <kuurtb@gmail.com>, Mark Pearson
 <mpearson-lenovo@squebb.ca>,  Armin Wolf <W_Armin@gmx.de>, Hans de Goede
 <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
In-Reply-To: <34161A06-2732-4819-B986-4B471B98EF44@gmail.com>
References: <20260210191938.137234-1-i@rong.moe>
				 <20260210191938.137234-3-i@rong.moe>
				 <34161A06-2732-4819-B986-4B471B98EF44@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Feb 2026 19:47:03 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-8 
X-ZohoMailClient: External

Hi Derek,

On Tue, 2026-02-10 at 12:38 -0800, Derek J. Clark wrote:
> On February 10, 2026 11:19:37 AM PST, Rong Zhang <i@rong.moe> wrote:
> > The Lenovo GameZone/Other interfaces have some delicate divergences
> > among different devices. When making a bug report or adding support for
> > new devices/interfaces, capdata is the most important information to
> > cross-check with.
> >=20
> > Add a debugfs file (lenovo_wmi/<device_name>/capdata), so that users ca=
n
> > dump capdata and include it in their reports.
> >=20
> > Since `struct capdata01' is just an extension to `struct capdata00',
> > also converts the former to include the latter anonymously
> > (-fms-extensions, since v6.19). In this manner type casting won't be
> > confusing.
> >=20
> > Signed-off-by: Rong Zhang <i@rong.moe>
> > ---
> > drivers/platform/x86/lenovo/Kconfig       |   1 +
> > drivers/platform/x86/lenovo/wmi-capdata.c | 121 ++++++++++++++++++++++
> > drivers/platform/x86/lenovo/wmi-capdata.h |   4 +-
> > 3 files changed, 123 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86=
/lenovo/Kconfig
> > index f885127b007f1..8357971c76d80 100644
> > --- a/drivers/platform/x86/lenovo/Kconfig
> > +++ b/drivers/platform/x86/lenovo/Kconfig
> > @@ -236,6 +236,7 @@ config YT2_1380
> > config LENOVO_WMI_CAPDATA
> > 	tristate
> > 	depends on ACPI_WMI
> > +	depends on LENOVO_WMI_HELPERS
> >=20
> > config LENOVO_WMI_EVENTS
> > 	tristate
> > diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platfo=
rm/x86/lenovo/wmi-capdata.c
> > index ee1fb02d8e31e..ca478b45119bc 100644
> > --- a/drivers/platform/x86/lenovo/wmi-capdata.c
> > +++ b/drivers/platform/x86/lenovo/wmi-capdata.c
> > @@ -32,6 +32,7 @@
> > #include <linux/cleanup.h>
> > #include <linux/component.h>
> > #include <linux/container_of.h>
> > +#include <linux/debugfs.h>
> > #include <linux/device.h>
> > #include <linux/dev_printk.h>
> > #include <linux/err.h>
> > @@ -43,11 +44,13 @@
> > #include <linux/mutex_types.h>
> > #include <linux/notifier.h>
> > #include <linux/overflow.h>
> > +#include <linux/seq_file.h>
> > #include <linux/stddef.h>
> > #include <linux/types.h>
> > #include <linux/wmi.h>
> >=20
> > #include "wmi-capdata.h"
> > +#include "wmi-helpers.h"
> >=20
> > #define LENOVO_CAPABILITY_DATA_00_GUID "362A3AFE-3D96-4665-8530-96DAD5B=
B300E"
> > #define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3BE0=
18154"
> > @@ -88,6 +91,7 @@ struct lwmi_cd_priv {
> > 	struct notifier_block acpi_nb; /* ACPI events */
> > 	struct wmi_device *wdev;
> > 	struct cd_list *list;
> > +	struct dentry *debugfs_dir;
> >=20
> > 	/*
> > 	 * A capdata device may be a component master of another capdata devic=
e.
> > @@ -118,6 +122,8 @@ struct cd_list {
> >=20
> > static struct wmi_driver lwmi_cd_driver;
> >=20
> > +/* =3D=3D=3D=3D=3D=3D=3D=3D Device components =3D=3D=3D=3D=3D=3D=3D=3D=
 */
> > +
> > /**
> >  * lwmi_cd_match() - Match rule for the master driver.
> >  * @dev: Pointer to the capability data parent device.
> > @@ -471,6 +477,116 @@ EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO_=
WMI_CAPDATA");
> > DEF_LWMI_CDXX_GET_DATA(cd_fan, LENOVO_FAN_TEST_DATA, struct capdata_fan=
);
> > EXPORT_SYMBOL_NS_GPL(lwmi_cd_fan_get_data, "LENOVO_WMI_CAPDATA");
> >=20
> > +/* =3D=3D=3D=3D=3D=3D=3D=3D debugfs =3D=3D=3D=3D=3D=3D=3D=3D */
> > +
> > +/**
> > + * lwmi_cd00_show() - Dump capdata00
> > + * @s: Pointer to seq_file where the capdata00 is dumped.
> > + * @cd00: Pointer to a capdata00 struct to be dumped.
> > + */
> > +static void lwmi_cd00_show(struct seq_file *s, struct capdata00 *cd00)
> > +{
> > +	u8 dev =3D FIELD_GET(LWMI_ATTR_DEV_ID_MASK, cd00->id);
> > +	u8 feat =3D FIELD_GET(LWMI_ATTR_FEAT_ID_MASK, cd00->id);
> > +	u8 mode =3D FIELD_GET(LWMI_ATTR_MODE_ID_MASK, cd00->id);
> > +	u8 type =3D FIELD_GET(LWMI_ATTR_TYPE_ID_MASK, cd00->id);
> > +	bool extra =3D cd00->supported & ~(LWMI_SUPP_GET | LWMI_SUPP_SET | LW=
MI_SUPP_VALID);
> > +	bool get =3D cd00->supported & LWMI_SUPP_GET;
> > +	bool set =3D cd00->supported & LWMI_SUPP_SET;
> > +	bool valid =3D cd00->supported & LWMI_SUPP_VALID;
>=20
> Hi Rong,
>=20
> I have something that will clean this up in the series I'm working on, LW=
MI_ATTR_ID, that pushes all the FIELD_PREP into a macro. Perhaps it would b=
e worth combining this series into mine that so we can use it here as well.=
=20
>=20
> My series also addresses some fairly significant bugs, so I'd prefer to n=
ot have to wait for this series to get approved to post it as it currently =
conflicts in other areas.

Feel free to integrate this series into yours :)

I have zero experience in doing so but I guess git-send-email should
handle the author field well.

> > +	seq_printf(s, "  id:             0x%08x [dev: %2u, feat: %2u, mode: %=
2u, type: %2u]\n",
> > +		   cd00->id, dev, feat, mode, type);
> > +
> > +	seq_printf(s, "  supported:      0x%08x [%c%c%c%c]\n", cd00->supporte=
d,
> > +		   extra ? '+' : ' ',
> > +		   get   ? 'R' : ' ',
> > +		   set   ? 'W' : ' ',
> > +		   valid ? 'V' : ' ');
> > +
> > +	seq_printf(s, "  default_value:  %u\n", cd00->default_value);
> > +}
> > +
> > +/**
> > + * lwmi_cd01_show() - Dump capdata01
> > + * @s: Pointer to seq_file where the capdata01 is dumped.
> > + * @cd01: Pointer to a capdata01 struct to be dumped.
> > + */
> > +static void lwmi_cd01_show(struct seq_file *s, struct capdata01 *cd01)
> > +{
> > +	/* capdata01 is an extension to capdata00. */
> > +	lwmi_cd00_show(s, (struct capdata00 *)cd01);
> > +
> > +	seq_printf(s, "  step:           %u\n", cd01->step);
> > +	seq_printf(s, "  min_value:      %u\n", cd01->min_value);
> > +	seq_printf(s, "  max_value:      %u\n", cd01->max_value);
> > +}
> > +
> > +/**
> > + * lwmi_cd_fan_show() - Dump capdata_fan
> > + * @s: Pointer to seq_file where the capdata_fan is dumped.
> > + * @cd_fan: Pointer to a capdata_fan struct to be dumped.
> > + */
> > +static void lwmi_cd_fan_show(struct seq_file *s, struct capdata_fan *c=
d_fan)
> > +{
> > +	seq_printf(s, "  id:             %u\n", cd_fan->id);
> > +	seq_printf(s, "  min_rpm:        %u\n", cd_fan->min_rpm);
> > +	seq_printf(s, "  max_rpm:        %u\n", cd_fan->max_rpm);
> > +}
> > +
> > +/**
> > + * lwmi_cd_debugfs_show() - Dump capability data to debugfs
> > + * @s: Pointer to seq_file where the capability data is dumped.
> > + * @data: unused.
> > + *
> > + * Return: 0
> > + */
> > +static int lwmi_cd_debugfs_show(struct seq_file *s, void *data)
> > +{
> > +	struct lwmi_cd_priv *priv =3D s->private;
> > +	u8 idx;
> > +
> > +	guard(mutex)(&priv->list->list_mutex);
> > +
> > +	/* lwmi_cd_alloc() ensured priv->list->type must be a valid type. */
> > +	for (idx =3D 0; idx < priv->list->count; idx++) {
> > +		seq_printf(s, "%s[%u]:\n", lwmi_cd_table[priv->list->type].name, idx=
);
> > +
> > +		if (priv->list->type =3D=3D LENOVO_CAPABILITY_DATA_00)
> > +			lwmi_cd00_show(s, &priv->list->cd00[idx]);
> > +		else if (priv->list->type =3D=3D LENOVO_CAPABILITY_DATA_01)
> > +			lwmi_cd01_show(s, &priv->list->cd01[idx]);
> > +		else if (priv->list->type =3D=3D LENOVO_FAN_TEST_DATA)
> > +			lwmi_cd_fan_show(s, &priv->list->cd_fan[idx]);
> > +	}
> > +
> > +	return 0;
> > +}
> > +DEFINE_SHOW_ATTRIBUTE(lwmi_cd_debugfs);
> > +
> > +/**
> > + * lwmi_cd_debugfs_add() - Create debugfs directory and files for a de=
vice
> > + * @priv: lenovo-wmi-capdata driver data.
> > + */
> > +static void lwmi_cd_debugfs_add(struct lwmi_cd_priv *priv)
> > +{
> > +	priv->debugfs_dir =3D lwmi_debugfs_create_dir(priv->wdev);
> > +
> > +	debugfs_create_file("capdata", 0444, priv->debugfs_dir, priv, &lwmi_c=
d_debugfs_fops);
> > +}
> > +
> > +/**
> > + * lwmi_cd_debugfs_remove() - Remove debugfs directory for a device
> > + * @priv: lenovo-wmi-capdata driver data.
> > + */
> > +static void lwmi_cd_debugfs_remove(struct lwmi_cd_priv *priv)
> > +{
> > +	debugfs_remove_recursive(priv->debugfs_dir);
> > +	priv->debugfs_dir =3D NULL;
> > +}
> > +
> > +/* =3D=3D=3D=3D=3D=3D=3D=3D WMI interface =3D=3D=3D=3D=3D=3D=3D=3D */
> > +
> > /**
> >  * lwmi_cd_cache() - Cache all WMI data block information
> >  * @priv: lenovo-wmi-capdata driver data.
> > @@ -773,6 +889,8 @@ static int lwmi_cd_probe(struct wmi_device *wdev, c=
onst void *context)
> > 		dev_err(&wdev->dev, "failed to register %s: %d\n",
> > 			info->name, ret);
> > 	} else {
> > +		lwmi_cd_debugfs_add(priv);
> > +
> > 		dev_dbg(&wdev->dev, "registered %s with %u items\n",
> > 			info->name, priv->list->count);
> > 	}
> > @@ -783,6 +901,8 @@ static void lwmi_cd_remove(struct wmi_device *wdev)
> > {
> > 	struct lwmi_cd_priv *priv =3D dev_get_drvdata(&wdev->dev);
> >=20
> > +	lwmi_cd_debugfs_remove(priv);
> > +
> > 	switch (priv->list->type) {
> > 	case LENOVO_CAPABILITY_DATA_00:
> > 		lwmi_cd_sub_master_del(priv);
> > @@ -822,6 +942,7 @@ static struct wmi_driver lwmi_cd_driver =3D {
> >=20
> > module_wmi_driver(lwmi_cd_driver);
> >=20
> > +MODULE_IMPORT_NS("LENOVO_WMI_HELPERS");
> > MODULE_DEVICE_TABLE(wmi, lwmi_cd_id_table);
> > MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> > MODULE_AUTHOR("Rong Zhang <i@rong.moe>");
> > diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platfo=
rm/x86/lenovo/wmi-capdata.h
> > index 8c1df3efcc553..034a6e48be071 100644
> > --- a/drivers/platform/x86/lenovo/wmi-capdata.h
> > +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
> > @@ -30,9 +30,7 @@ struct capdata00 {
> > };
> >=20
> > struct capdata01 {
> > -	u32 id;
> > -	u32 supported;
> > -	u32 default_value;
> > +	struct capdata00;
>=20
> Doesn't this also require some significant changes to the usage in wmi-ot=
her and in the query function? We're accessing these members directly.

No. As Kurt said, it utilizes a relatively new (since v6.19-rc1) change
to kbuild. See commit c4781dc3d1cf ("Kbuild: enable -fms-extensions").

Thanks,
Rong

> Thanks,=20
> Derek
>=20
> > 	u32 step;
> > 	u32 min_value;
> > 	u32 max_value;
