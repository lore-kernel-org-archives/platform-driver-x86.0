Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9ACE3A1A45
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Feb 2026 18:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772044124; cv=none; b=Afpy94ceFrfvOAYjJ8Tm7JE+AveS1an6j2bc0flimsAn0NOvKn5JBKjg41/PrFSaX1uywhDK3adz0vlgnIeey8A3zXmFM++3QFspBYV6Z0vvHYX4vGDSRc1dWtHmRGBjSJSEAlfRcjTRBQVno7m5O02/Ej20Bz+wie/etQFaN3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772044124; c=relaxed/simple;
	bh=EKGNQblCTrM8yNIQxtP3tW9uFVx3Gb5XGlLX2hIE6Eo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=sMi8p2Pe5Iie+xYFfhIht3HXCft5J6BH4dkd+uRsRu5PsOStIy6WBHARRIKVJOYJqC9s4EfR2ifn8RbFhNo55fzFNbLibSjobBrcgaVU/e6LumgytrENT1QS40vB/RXpoXhxsVgCNUMZ7bSUBfeyPekODbyzMrVKngVNJEcG0p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l9l4ORU8; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l9l4ORU8"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2ba6aa57d5fso6626290eec.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Feb 2026 10:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772044122; x=1772648922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1jCiA+Oy5t6uMS+QrrihtlPt/gqQhS8m2TEmNyPnDKM=;
        b=l9l4ORU8XAOWNXF6oc66CGZBU99WMuJQtEIxKTH5JMcJDlVKSLNCFZzMFfg6TLcwcg
         CLg7XfVBUZKEEe/WQmoEe4ARoGCpjzho24BXSA7/7jAQ95iuk3t/02X3kaBbyDxkGBrJ
         RxQncikq3v5xhSEDiHA2NVYoYpVZPjivlWnUSPBiaJU7HM5j5s83RofF5By/AcQ7q5RR
         6Ik+n3SqZ8C4EtViZORZHpY3kxcHYKJSPpQU2kjaFLj3iVNrz0ftW88XPj6pCXnnfkV6
         FwP4ZUoCmj7uudOoV9OSjnMqbpKHz0otrrVJQ56z0r3jvvizn2v7QCvacp6Nd9UYCFFQ
         PmrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772044122; x=1772648922;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1jCiA+Oy5t6uMS+QrrihtlPt/gqQhS8m2TEmNyPnDKM=;
        b=aPj2rgKlKLDhWUca/cLKHndzFASFRyHZ8SPFSEAst7NtEH+1/ccBsTHcaUfaztBm+S
         obuf2JB+00jUXnVCU4q8tnDLfMY54WIZV9se7OJidj13Vkfkuki0+arj8UxMWhvld9+Z
         5W8K0jUE5MEVd32yP5stNi3Rmvi1UOFI+o4K8z23la0zA4uulu/haey6gj0e9lAJesUy
         HRkCVOzNpBM2xeXX6PRGLkq8keKPTk7TByiTOSPSiZ1I/fCoMxGKQxTdBF1Oq6ZPr9dI
         1o/zTh9hHeE1IWUthyEvxY3n6bsUjJiZCfrU/WiRxwLvWZTn7QQu9EdWkQJU8ZL6Lodi
         QCow==
X-Forwarded-Encrypted: i=1; AJvYcCVhbrmEm8RsVoJwJTfYf2IQP7qkQisOGbc4zxHekUH+uKrZQcjSFn101V7P28qM52yczNMJ9LUkNvG6a5GUbqkV0FaH@vger.kernel.org
X-Gm-Message-State: AOJu0YysqHaKe7j7k0YqU0k/eXZo4WFOA3SscNyp/wlT68qjJwXKGsSb
	rQEYuHNoaMv4uJ9mniFopOHY8nNWSe47oMHqWRLZiCsDEJijrZ41YIxz
X-Gm-Gg: ATEYQzz56448eEk+0B5Pmxsr0X9zTACa4eGnaJbJ+8Le5Uj1XX9KyrloxX/p1FEuTtH
	xa78HUKjYYTYUo/NL3gf5WEfyHBqlDIfAVwQ3TMtpwrBEdcF7VOmjU7vLcwdc7CLuykNOhOIO6J
	KB/3Ll7v2RTIxAtS7aDU0EbtdWSlXEzzzurFeYpj7gp6wUBPbXdef3UsanPoJUn24dD5GfSwGp9
	dkbPrcRgGGbN33qvUybRVq0y+qTiqxf8PPW7Pdp4ueEIkSziR7MuEWUvrJeffsjvJbMx0Nn9vEr
	E9Kp3NyjtmbWtiunBtqLHcD1g2CC1DQZzyCRVUawMdwRWr2dAwEW91lex6tWV1R0CUwqjBvjmrU
	dIXbET2WmBYhQp7uKD++x6YJZHDByjRiXkZthdfGeRKGwhKRKCY0I470PZZm1KLkZL6ytBSq5fi
	FULfI7OyRDljAKaUf8dKezfJKtBbj3JpsIISL+L/GmXp3HlbnoVqykBM+zkDYaVZeSRJDs1/dlG
	H4fyqeM5PtMOykQr+BBAQ==
X-Received: by 2002:a05:7300:cb11:b0:2b8:209d:5983 with SMTP id 5a478bee46e88-2bdcc075ec6mr521208eec.29.1772044121882;
        Wed, 25 Feb 2026 10:28:41 -0800 (PST)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7daa027fsm11180985eec.9.2026.02.25.10.28.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 10:28:41 -0800 (PST)
Date: Wed, 25 Feb 2026 10:28:43 -0800
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
Message-ID: <48AF1724-9E89-465E-A6C7-E8F903144529@gmail.com>
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
>

Just to follow up in this thread as well, after finding there weren't any =
conflicts I'm fine with this being an independent series=2E

Thanks,=20
Derek

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
>
>Thanks,
>Rong
>
>> Thanks,=20
>> Derek
>>=20
>> > 	u32 step;
>> > 	u32 min_value;
>> > 	u32 max_value;

