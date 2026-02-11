Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3102F309DCF
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Feb 2026 19:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770837041; cv=none; b=d1zTsnOzo2fAvQO4heZ8iSlahjM4JCzMxKWDyMrWM+l3NKDvhyrf27Yr5libemaIzWKa6xh1W7QQASMYjZUhTxnkqgdm6dQ/zBSPeOaAP/pf9v555Ur86epZ+oU8rIpZfOjw+nTAQOoRxeMeezKnI2y64cdhwtof32xegz+IMes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770837041; c=relaxed/simple;
	bh=AgX/5rVhuqT23cIuT1fvTSKpeustP7P5lrCv2eqEsUk=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Lzkx0CcwSMcLoJxmrGAtNUk5zQhwLZxFJJGIys9jD6beIXjMoBumLKTKE6B1O7sJGQ97/JUAEv0VZn6UgNa/NIWrXuGLOQKcrplRiCtugcledKzQH1hfyy9VNbtcKk/R7QhH4LkQbPOvRdMv3pwy3I65WlG4S5h+dCiPfNSLkhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CASYd2Lr; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CASYd2Lr"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-124afd03fd1so8618789c88.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Feb 2026 11:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770837039; x=1771441839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HvtIcA+7QvyOzWqUY2gqKLmetrd3vP2R16KLz8Ow1Xw=;
        b=CASYd2Lrur/m9cQaBzU5OJUETr77O288YOLLgdjSn9pwPL0kRUon1NVuIURHV2goM8
         9v65A5eDwtA0v12l449gZjbBARgETmXDQhgbMge5nyvqq9jQWptdFrFL+DG8PjQC6xlM
         O7XnZYCiUASYyXviRoCQOJXuGQNxVxoNfr37hPSfeNHyirtcTcscG8kV1Zynx7gBa3R/
         rV1pUSidurZgoeVsEBUwDjhcc0gtPZ2Y8H3FyS9jxESiOQUvh1M/xJF7JAivnAjal0VZ
         SUUxXdR4ebI6e7W2Wk7reeYsSySaXm1/VOyki2xtqHtG/0IdeBgPFz3xTeeD7gueHi1I
         xWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770837039; x=1771441839;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HvtIcA+7QvyOzWqUY2gqKLmetrd3vP2R16KLz8Ow1Xw=;
        b=H7egQBNO3vO6itBP3NbTLCDLQbPAQNlhe5F+ZOSsjUuNvr+zvnrTNV3mVZuJCliaPu
         QEKJMfBbRA0nzxHtmbwdZ7MDdpBK4uHorrrX0OaljjyM2VsH9q2wcW2NInLYGKbr5jwA
         s1p89uG04M6VrznElRLB7psoWXGEiF6jTF/EgtgO3YvYK3LDFUVKZgdpCwhIV10647sa
         ftN8NK3PJGetbuoHDSK90xoOjfvAvzZ5Rx5es5bEIFlCLgUTTx0S8z/z5AXcY+pKtmYr
         /ovwTwQF3/zSADbu/LepxhUwjVmBjdhKV5G7XXhBvhGonKqLqSnv3/OPRX1dWpbKTVAt
         d+wA==
X-Forwarded-Encrypted: i=1; AJvYcCUhak0+p6jQvlEH6v+y3a4ry8mHzVP0Opv0fVRWqlNMFztGNECmyAKEo6lhr/FoB/iLJGty6DqJMgkjWvk74EKyvCn/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7knkorR80OeiOFOh+rbRU1J2jh7EhS6v/wYhijV+B4hrOJpuC
	bd7uvi8En6boSL7eOEChtZjp2oJCOxa40izJaWi7sCXXB43MSw2n2X0R
X-Gm-Gg: AZuq6aIAuSTSsfZbIWw4Ak2w1YOn5L3xXP+oJzPcObO3PicZGwp27r+KtwilGr6jS+I
	UNaK7l4+ukAJichAjqzDS59Hhtb+PLYfVp4SrJBXuSDI1wuHzeSUwfgr2qT3a6vXwxDIOVsI1ZS
	934yY6L0m73Q7Zr7KuITyq36XPe8z7eaeYwbpIQhqtxWj/V3c4mrpxjzLH3mymUrIb5bcJwbR5y
	PGb0CBttUtde+DvrSNrCTJLKT/8nvHWGzQnwmNNMIrCjEsX65yG7/xO8Evb3HT6DBi6jj1Bg7cM
	Had99F4fYDsrg9lO/sjdieq6Ka5X6A5/mRMemJy/cNmEwJ8sFh/yfLn0tMPhPPYJFpys1YUWvX4
	2eOTZMd3a9xMcBgOid9f322tr4coJpo98hf/W6pptI3pI2oUc4MfHX1HA6AaDlwjzirTKQpR/WJ
	Rd91jSRylzptxBEz6KUPUf92E1pzFtPj9Ep/8yYEczzHYZ5G9XP2FNE9OlD1CNwjI9m6yo9Jvv9
	JBIL9GwHnNlUKRTB1I+zA==
X-Received: by 2002:a05:7300:7c0f:b0:2b8:26b8:3426 with SMTP id 5a478bee46e88-2baa7fa7375mr217250eec.13.1770837038995;
        Wed, 11 Feb 2026 11:10:38 -0800 (PST)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba9dba2de6sm1889904eec.4.2026.02.11.11.10.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 11:10:38 -0800 (PST)
Date: Wed, 11 Feb 2026 11:10:36 -0800
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Rong Zhang <i@rong.moe>
CC: Kurt Borja <kuurtb@gmail.com>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_2/2=5D_platform/x86=3A_lenovo-wmi-ca?=
 =?US-ASCII?Q?pdata=3A_Add_debugfs_file_for_dumping_capdata?=
User-Agent: Thunderbird for Android
In-Reply-To: <c557a3646d43fce65c51c0061443386699f1f320.camel@rong.moe>
References: <20260210191938.137234-1-i@rong.moe> <20260210191938.137234-3-i@rong.moe> <34161A06-2732-4819-B986-4B471B98EF44@gmail.com> <c557a3646d43fce65c51c0061443386699f1f320.camel@rong.moe>
Message-ID: <8FB96079-C8EE-4DD5-AFE0-23F7D66A2332@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On February 11, 2026 3:47:03 AM PST, Rong Zhang <i@rong=2Emoe> wrote:
>Hi Derek,
>
>On Tue, 2026-02-10 at 12:38 -0800, Derek J=2E Clark wrote:
>> On February 10, 2026 11:19:37 AM PST, Rong Zhang <i@rong=2Emoe> wrote:
>> > The Lenovo GameZone/Other interfaces have some delicate divergences
>> > among different devices=2E When making a bug report or adding support=
 for
>> > new devices/interfaces, capdata is the most important information to
>> > cross-check with=2E
>> >=20
>> > Add a debugfs file (lenovo_wmi/<device_name>/capdata), so that users =
can
>> > dump capdata and include it in their reports=2E
>> >=20
>> > Since `struct capdata01' is just an extension to `struct capdata00',
>> > also converts the former to include the latter anonymously
>> > (-fms-extensions, since v6=2E19)=2E In this manner type casting won't=
 be
>> > confusing=2E
>> >=20
>> > Signed-off-by: Rong Zhang <i@rong=2Emoe>
>> > ---
>> > drivers/platform/x86/lenovo/Kconfig       |   1 +
>> > drivers/platform/x86/lenovo/wmi-capdata=2Ec | 121 +++++++++++++++++++=
+++
>> > drivers/platform/x86/lenovo/wmi-capdata=2Eh |   4 +-
>> > 3 files changed, 123 insertions(+), 3 deletions(-)
>> >=20
>> > diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x=
86/lenovo/Kconfig
>> > index f885127b007f1=2E=2E8357971c76d80 100644
>> > --- a/drivers/platform/x86/lenovo/Kconfig
>> > +++ b/drivers/platform/x86/lenovo/Kconfig
>> > @@ -236,6 +236,7 @@ config YT2_1380
>> > config LENOVO_WMI_CAPDATA
>> > 	tristate
>> > 	depends on ACPI_WMI
>> > +	depends on LENOVO_WMI_HELPERS
>> >=20
>> > config LENOVO_WMI_EVENTS
>> > 	tristate
>> > diff --git a/drivers/platform/x86/lenovo/wmi-capdata=2Ec b/drivers/pl=
atform/x86/lenovo/wmi-capdata=2Ec
>> > index ee1fb02d8e31e=2E=2Eca478b45119bc 100644
>> > --- a/drivers/platform/x86/lenovo/wmi-capdata=2Ec
>> > +++ b/drivers/platform/x86/lenovo/wmi-capdata=2Ec
>> > @@ -32,6 +32,7 @@
>> > #include <linux/cleanup=2Eh>
>> > #include <linux/component=2Eh>
>> > #include <linux/container_of=2Eh>
>> > +#include <linux/debugfs=2Eh>
>> > #include <linux/device=2Eh>
>> > #include <linux/dev_printk=2Eh>
>> > #include <linux/err=2Eh>
>> > @@ -43,11 +44,13 @@
>> > #include <linux/mutex_types=2Eh>
>> > #include <linux/notifier=2Eh>
>> > #include <linux/overflow=2Eh>
>> > +#include <linux/seq_file=2Eh>
>> > #include <linux/stddef=2Eh>
>> > #include <linux/types=2Eh>
>> > #include <linux/wmi=2Eh>
>> >=20
>> > #include "wmi-capdata=2Eh"
>> > +#include "wmi-helpers=2Eh"
>> >=20
>> > #define LENOVO_CAPABILITY_DATA_00_GUID "362A3AFE-3D96-4665-8530-96DAD=
5BB300E"
>> > #define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3B=
E018154"
>> > @@ -88,6 +91,7 @@ struct lwmi_cd_priv {
>> > 	struct notifier_block acpi_nb; /* ACPI events */
>> > 	struct wmi_device *wdev;
>> > 	struct cd_list *list;
>> > +	struct dentry *debugfs_dir;
>> >=20
>> > 	/*
>> > 	 * A capdata device may be a component master of another capdata dev=
ice=2E
>> > @@ -118,6 +122,8 @@ struct cd_list {
>> >=20
>> > static struct wmi_driver lwmi_cd_driver;
>> >=20
>> > +/* =3D=3D=3D=3D=3D=3D=3D=3D Device components =3D=3D=3D=3D=3D=3D=3D=
=3D */
>> > +
>> > /**
>> >  * lwmi_cd_match() - Match rule for the master driver=2E
>> >  * @dev: Pointer to the capability data parent device=2E
>> > @@ -471,6 +477,116 @@ EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOV=
O_WMI_CAPDATA");
>> > DEF_LWMI_CDXX_GET_DATA(cd_fan, LENOVO_FAN_TEST_DATA, struct capdata_f=
an);
>> > EXPORT_SYMBOL_NS_GPL(lwmi_cd_fan_get_data, "LENOVO_WMI_CAPDATA");
>> >=20
>> > +/* =3D=3D=3D=3D=3D=3D=3D=3D debugfs =3D=3D=3D=3D=3D=3D=3D=3D */
>> > +
>> > +/**
>> > + * lwmi_cd00_show() - Dump capdata00
>> > + * @s: Pointer to seq_file where the capdata00 is dumped=2E
>> > + * @cd00: Pointer to a capdata00 struct to be dumped=2E
>> > + */
>> > +static void lwmi_cd00_show(struct seq_file *s, struct capdata00 *cd0=
0)
>> > +{
>> > +	u8 dev =3D FIELD_GET(LWMI_ATTR_DEV_ID_MASK, cd00->id);
>> > +	u8 feat =3D FIELD_GET(LWMI_ATTR_FEAT_ID_MASK, cd00->id);
>> > +	u8 mode =3D FIELD_GET(LWMI_ATTR_MODE_ID_MASK, cd00->id);
>> > +	u8 type =3D FIELD_GET(LWMI_ATTR_TYPE_ID_MASK, cd00->id);
>> > +	bool extra =3D cd00->supported & ~(LWMI_SUPP_GET | LWMI_SUPP_SET | =
LWMI_SUPP_VALID);
>> > +	bool get =3D cd00->supported & LWMI_SUPP_GET;
>> > +	bool set =3D cd00->supported & LWMI_SUPP_SET;
>> > +	bool valid =3D cd00->supported & LWMI_SUPP_VALID;
>>=20
>> Hi Rong,
>>=20
>> I have something that will clean this up in the series I'm working on, =
LWMI_ATTR_ID, that pushes all the FIELD_PREP into a macro=2E Perhaps it wou=
ld be worth combining this series into mine that so we can use it here as w=
ell=2E=20
>>=20
>> My series also addresses some fairly significant bugs, so I'd prefer to=
 not have to wait for this series to get approved to post it as it currentl=
y conflicts in other areas=2E
>
>Feel free to integrate this series into yours :)
>
>I have zero experience in doing so but I guess git-send-email should
>handle the author field well=2E

Hi Rong,

That sounds good=2E I should be able to retain authorship and make my edit=
s as needed=2E I'll add a CDB tag for myself if I make any significant chan=
ges beyond rebase edits, and I'll send them back to you before publishing f=
or your verification directly=2E Thanks=2E

>> > +	seq_printf(s, "  id:             0x%08x [dev: %2u, feat: %2u, mode:=
 %2u, type: %2u]\n",
>> > +		   cd00->id, dev, feat, mode, type);
>> > +
>> > +	seq_printf(s, "  supported:      0x%08x [%c%c%c%c]\n", cd00->suppor=
ted,
>> > +		   extra ? '+' : ' ',
>> > +		   get   ? 'R' : ' ',
>> > +		   set   ? 'W' : ' ',
>> > +		   valid ? 'V' : ' ');
>> > +
>> > +	seq_printf(s, "  default_value:  %u\n", cd00->default_value);
>> > +}
>> > +
>> > +/**
>> > + * lwmi_cd01_show() - Dump capdata01
>> > + * @s: Pointer to seq_file where the capdata01 is dumped=2E
>> > + * @cd01: Pointer to a capdata01 struct to be dumped=2E
>> > + */
>> > +static void lwmi_cd01_show(struct seq_file *s, struct capdata01 *cd0=
1)
>> > +{
>> > +	/* capdata01 is an extension to capdata00=2E */
>> > +	lwmi_cd00_show(s, (struct capdata00 *)cd01);
>> > +
>> > +	seq_printf(s, "  step:           %u\n", cd01->step);
>> > +	seq_printf(s, "  min_value:      %u\n", cd01->min_value);
>> > +	seq_printf(s, "  max_value:      %u\n", cd01->max_value);
>> > +}
>> > +
>> > +/**
>> > + * lwmi_cd_fan_show() - Dump capdata_fan
>> > + * @s: Pointer to seq_file where the capdata_fan is dumped=2E
>> > + * @cd_fan: Pointer to a capdata_fan struct to be dumped=2E
>> > + */
>> > +static void lwmi_cd_fan_show(struct seq_file *s, struct capdata_fan =
*cd_fan)
>> > +{
>> > +	seq_printf(s, "  id:             %u\n", cd_fan->id);
>> > +	seq_printf(s, "  min_rpm:        %u\n", cd_fan->min_rpm);
>> > +	seq_printf(s, "  max_rpm:        %u\n", cd_fan->max_rpm);
>> > +}
>> > +
>> > +/**
>> > + * lwmi_cd_debugfs_show() - Dump capability data to debugfs
>> > + * @s: Pointer to seq_file where the capability data is dumped=2E
>> > + * @data: unused=2E
>> > + *
>> > + * Return: 0
>> > + */
>> > +static int lwmi_cd_debugfs_show(struct seq_file *s, void *data)
>> > +{
>> > +	struct lwmi_cd_priv *priv =3D s->private;
>> > +	u8 idx;
>> > +
>> > +	guard(mutex)(&priv->list->list_mutex);
>> > +
>> > +	/* lwmi_cd_alloc() ensured priv->list->type must be a valid type=2E=
 */
>> > +	for (idx =3D 0; idx < priv->list->count; idx++) {
>> > +		seq_printf(s, "%s[%u]:\n", lwmi_cd_table[priv->list->type]=2Ename,=
 idx);
>> > +
>> > +		if (priv->list->type =3D=3D LENOVO_CAPABILITY_DATA_00)
>> > +			lwmi_cd00_show(s, &priv->list->cd00[idx]);
>> > +		else if (priv->list->type =3D=3D LENOVO_CAPABILITY_DATA_01)
>> > +			lwmi_cd01_show(s, &priv->list->cd01[idx]);
>> > +		else if (priv->list->type =3D=3D LENOVO_FAN_TEST_DATA)
>> > +			lwmi_cd_fan_show(s, &priv->list->cd_fan[idx]);
>> > +	}
>> > +
>> > +	return 0;
>> > +}
>> > +DEFINE_SHOW_ATTRIBUTE(lwmi_cd_debugfs);
>> > +
>> > +/**
>> > + * lwmi_cd_debugfs_add() - Create debugfs directory and files for a =
device
>> > + * @priv: lenovo-wmi-capdata driver data=2E
>> > + */
>> > +static void lwmi_cd_debugfs_add(struct lwmi_cd_priv *priv)
>> > +{
>> > +	priv->debugfs_dir =3D lwmi_debugfs_create_dir(priv->wdev);
>> > +
>> > +	debugfs_create_file("capdata", 0444, priv->debugfs_dir, priv, &lwmi=
_cd_debugfs_fops);
>> > +}
>> > +
>> > +/**
>> > + * lwmi_cd_debugfs_remove() - Remove debugfs directory for a device
>> > + * @priv: lenovo-wmi-capdata driver data=2E
>> > + */
>> > +static void lwmi_cd_debugfs_remove(struct lwmi_cd_priv *priv)
>> > +{
>> > +	debugfs_remove_recursive(priv->debugfs_dir);
>> > +	priv->debugfs_dir =3D NULL;
>> > +}
>> > +
>> > +/* =3D=3D=3D=3D=3D=3D=3D=3D WMI interface =3D=3D=3D=3D=3D=3D=3D=3D *=
/
>> > +
>> > /**
>> >  * lwmi_cd_cache() - Cache all WMI data block information
>> >  * @priv: lenovo-wmi-capdata driver data=2E
>> > @@ -773,6 +889,8 @@ static int lwmi_cd_probe(struct wmi_device *wdev,=
 const void *context)
>> > 		dev_err(&wdev->dev, "failed to register %s: %d\n",
>> > 			info->name, ret);
>> > 	} else {
>> > +		lwmi_cd_debugfs_add(priv);
>> > +
>> > 		dev_dbg(&wdev->dev, "registered %s with %u items\n",
>> > 			info->name, priv->list->count);
>> > 	}
>> > @@ -783,6 +901,8 @@ static void lwmi_cd_remove(struct wmi_device *wde=
v)
>> > {
>> > 	struct lwmi_cd_priv *priv =3D dev_get_drvdata(&wdev->dev);
>> >=20
>> > +	lwmi_cd_debugfs_remove(priv);
>> > +
>> > 	switch (priv->list->type) {
>> > 	case LENOVO_CAPABILITY_DATA_00:
>> > 		lwmi_cd_sub_master_del(priv);
>> > @@ -822,6 +942,7 @@ static struct wmi_driver lwmi_cd_driver =3D {
>> >=20
>> > module_wmi_driver(lwmi_cd_driver);
>> >=20
>> > +MODULE_IMPORT_NS("LENOVO_WMI_HELPERS");
>> > MODULE_DEVICE_TABLE(wmi, lwmi_cd_id_table);
>> > MODULE_AUTHOR("Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>");
>> > MODULE_AUTHOR("Rong Zhang <i@rong=2Emoe>");
>> > diff --git a/drivers/platform/x86/lenovo/wmi-capdata=2Eh b/drivers/pl=
atform/x86/lenovo/wmi-capdata=2Eh
>> > index 8c1df3efcc553=2E=2E034a6e48be071 100644
>> > --- a/drivers/platform/x86/lenovo/wmi-capdata=2Eh
>> > +++ b/drivers/platform/x86/lenovo/wmi-capdata=2Eh
>> > @@ -30,9 +30,7 @@ struct capdata00 {
>> > };
>> >=20
>> > struct capdata01 {
>> > -	u32 id;
>> > -	u32 supported;
>> > -	u32 default_value;
>> > +	struct capdata00;
>>=20
>> Doesn't this also require some significant changes to the usage in wmi-=
other and in the query function? We're accessing these members directly=2E
>
>No=2E As Kurt said, it utilizes a relatively new (since v6=2E19-rc1) chan=
ge
>to kbuild=2E See commit c4781dc3d1cf ("Kbuild: enable -fms-extensions")=
=2E

That's pretty neat=2E In that case this makes a lot of sense=2E

Thanks,
Derek

>Thanks,
>Rong
>
>> Thanks,=20
>> Derek
>>=20
>> > 	u32 step;
>> > 	u32 min_value;
>> > 	u32 max_value;

