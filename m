Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F698267B90
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Feb 2026 18:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772043864; cv=none; b=XzHKJeVmhlM9qObGs2Ka0/O0vrzlNk5IggYodeTyAhOHHXaenD4cWufXPk38uJ6R2zLktk3djv/9p7pImz4UcRjvyoGqAr1dQS37JsDqnh4g7UW+ffbk5iEb9pWPvFc3iDpQWssIvA4nbH3JnieHm8j7OQ7KNJQzwyTD0BwZnRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772043864; c=relaxed/simple;
	bh=HTWOKx0rqG8+VQ4IOyztotn7esv+T3Hu/FUNNqdH2uo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=doN0FloBD8qLQNEWpRsJwdLQy/JF//u4W97fICkPgcmYG6I94JAJx7eGBU7bmiqBCSJGWFsj44MzTzYKo0tEkhkC0/quLRm5HJs2Ra5W9dBs7AAU16YM6hSKkYXT4JdCEMy7HQfXb7aFSW/OBEPqGNTbDU5qegq49QZYGn3i31E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M08P1HVX; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M08P1HVX"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-94acd026e45so2137241.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Feb 2026 10:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772043862; x=1772648662; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H3R5Zy/MntrRZzTSxL18xHWODXzvXj+FyrYGSVV0yBs=;
        b=M08P1HVXbYUTHiVZzqjhbhXDSVzLSy3ZZHsaO8oIh/IJGpYx5qZvTR4/4oCLgwkLME
         kTlbBOr3CNXl4lzCbDPMlEjdRRY5dgyOhKDinRWsf5xJaBFWlMHL2rp3mnukiysv2Syk
         4agSoVE+CqvUh5UhLBhPnuLgDdTKvC8HMy3XkDD+r7JJbuY/N4IT5fiHmv2DmU8TZi07
         PwkDNuLk3P0u4cFZ6Hosgn62rc7bcz0GLy388820NFpT7Y1k6Bhkf2CYmQPmo2FeOMCB
         R9VfJuVIK8B2n1PJVFDrIv+PU8+A3VYRrrP3+5gshNDHP7L8wUy2/Q3kU9MmWFZgBzdp
         DELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772043862; x=1772648662;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H3R5Zy/MntrRZzTSxL18xHWODXzvXj+FyrYGSVV0yBs=;
        b=gpfSPYSqizJf0PPwGxhrc7KNWkwKk0yeF/FI2c/uUxaHlfEVfesDAu/NYbskmRLaGK
         GnBPtuPFypXeRZQPy0pM1SkLyo7t+MszCG4dnKGfm1NCDID3MpKtTLRIjDojyFGLNj+W
         JZtbLvV9kOXvuOaSukPr92YWOTiLViDhKCiwODahdTCKIUIr5wh779ka0bYgveJpf/sy
         kGZZIqti+M1E00T3+LeTvxhWsC1cWwC7SzAHrBVF7MCC0ntqjLMBYpLqmW8zg2FimTry
         QIL5nSiMkDI4SX8UtXRd+HQy/NCG4BSaIYxemIqg1KVQE3pSsgmobQnGpRhWftI62jUV
         XEJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcvGY6IXTb7pJUBMnoLdm0m8MMIPFLwuJq60mTtHkKqhnvaW+oD8j0fizKSqJeGQiJSgHHXLj0CplJ/hXCJTOdQ42E@vger.kernel.org
X-Gm-Message-State: AOJu0YwyRN0dWTzannwKWp/Otiy03JD7oDvfxSX/b2L+8p9RhTuN3P5B
	45QXNJawO8G5kD3y/DWUkvnh2uGYRN1w9+6oVFi1oBlJNjmxkjJ3JJIo
X-Gm-Gg: ATEYQzzmJ3NxcE2OJz13jedTUexIcX1pN/rJ0mi9iJhHRl4L3cqAKRTyjzJ0WzCz9f0
	N7AGbCLmo5kp8FgKFtIn8W05M0llsmYuOzdOm1UuTFvXEWP1lrpd79TEgukmf8MhXjoyWSM14r8
	rOAnJiRVsQdHnQe5TWvLmezrAp9m34fe8e3wozs4SAe/Y++nEtAduK8SZaILzuMjlZpQltLEXJZ
	UVT217Fj/APYlOkFcGIQN5sfi/+hzxrTFd0RT7iSVAc9LIdZ8Gv9tSnAfiuAVCi96a4yqq/VsAU
	CsLsb8aF/MIshdd4p3tPP5Zk0lAf6vc6uPLoU/M/bOIWriZTek3aO/uXmLPVBUW/JrIXrWnRcWx
	EvLkffp0tYwSLjEwy8q7+dqX01F4w6M7c1uOX7pqmLdEr7oBgM4MSjUDpcgyYA7HsZ5N2sZzLIy
	HYbVflMdNzybjROSs=
X-Received: by 2002:a05:6102:32c4:b0:5ef:24aa:986f with SMTP id ada2fe7eead31-5feb2e5f0c8mr6925729137.2.1772043862098;
        Wed, 25 Feb 2026 10:24:22 -0800 (PST)
Received: from localhost ([181.91.18.156])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5feb648a89esm14799048137.13.2026.02.25.10.24.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 10:24:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Feb 2026 13:24:18 -0500
Message-Id: <DGO94E8PJT90.XQ4CA7J4GYV0@gmail.com>
Subject: Re: [PATCH 2/2] platform/x86: lenovo-wmi-capdata: Add debugfs file
 for dumping capdata
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Rong Zhang" <i@rong.moe>, "Mark Pearson" <mpearson-lenovo@squebb.ca>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>, "Armin Wolf"
 <W_Armin@gmx.de>, "Hans de Goede" <hansg@kernel.org>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "Kurt Borja" <kuurtb@gmail.com>, <platform-driver-x86@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260210191938.137234-1-i@rong.moe>
 <20260210191938.137234-3-i@rong.moe>
In-Reply-To: <20260210191938.137234-3-i@rong.moe>

On Tue Feb 10, 2026 at 2:19 PM -05, Rong Zhang wrote:
> The Lenovo GameZone/Other interfaces have some delicate divergences
> among different devices. When making a bug report or adding support for
> new devices/interfaces, capdata is the most important information to
> cross-check with.
>
> Add a debugfs file (lenovo_wmi/<device_name>/capdata), so that users can
> dump capdata and include it in their reports.
>
> Since `struct capdata01' is just an extension to `struct capdata00',
> also converts the former to include the latter anonymously
> (-fms-extensions, since v6.19). In this manner type casting won't be
> confusing.
>
> Signed-off-by: Rong Zhang <i@rong.moe>

Tested-by: Kurt Borja <kuurtb@gmail.com>

> ---
>  drivers/platform/x86/lenovo/Kconfig       |   1 +
>  drivers/platform/x86/lenovo/wmi-capdata.c | 121 ++++++++++++++++++++++
>  drivers/platform/x86/lenovo/wmi-capdata.h |   4 +-
>  3 files changed, 123 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/l=
enovo/Kconfig
> index f885127b007f1..8357971c76d80 100644
> --- a/drivers/platform/x86/lenovo/Kconfig
> +++ b/drivers/platform/x86/lenovo/Kconfig
> @@ -236,6 +236,7 @@ config YT2_1380
>  config LENOVO_WMI_CAPDATA
>  	tristate
>  	depends on ACPI_WMI
> +	depends on LENOVO_WMI_HELPERS
> =20
>  config LENOVO_WMI_EVENTS
>  	tristate
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform=
/x86/lenovo/wmi-capdata.c
> index ee1fb02d8e31e..ca478b45119bc 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.c
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.c
> @@ -32,6 +32,7 @@
>  #include <linux/cleanup.h>
>  #include <linux/component.h>
>  #include <linux/container_of.h>
> +#include <linux/debugfs.h>
>  #include <linux/device.h>
>  #include <linux/dev_printk.h>
>  #include <linux/err.h>
> @@ -43,11 +44,13 @@
>  #include <linux/mutex_types.h>
>  #include <linux/notifier.h>
>  #include <linux/overflow.h>
> +#include <linux/seq_file.h>
>  #include <linux/stddef.h>
>  #include <linux/types.h>
>  #include <linux/wmi.h>
> =20
>  #include "wmi-capdata.h"
> +#include "wmi-helpers.h"
> =20
>  #define LENOVO_CAPABILITY_DATA_00_GUID "362A3AFE-3D96-4665-8530-96DAD5BB=
300E"
>  #define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3BE01=
8154"
> @@ -88,6 +91,7 @@ struct lwmi_cd_priv {
>  	struct notifier_block acpi_nb; /* ACPI events */
>  	struct wmi_device *wdev;
>  	struct cd_list *list;
> +	struct dentry *debugfs_dir;
> =20
>  	/*
>  	 * A capdata device may be a component master of another capdata device=
.
> @@ -118,6 +122,8 @@ struct cd_list {
> =20
>  static struct wmi_driver lwmi_cd_driver;
> =20
> +/* =3D=3D=3D=3D=3D=3D=3D=3D Device components =3D=3D=3D=3D=3D=3D=3D=3D *=
/
> +
>  /**
>   * lwmi_cd_match() - Match rule for the master driver.
>   * @dev: Pointer to the capability data parent device.
> @@ -471,6 +477,116 @@ EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO_WM=
I_CAPDATA");
>  DEF_LWMI_CDXX_GET_DATA(cd_fan, LENOVO_FAN_TEST_DATA, struct capdata_fan)=
;
>  EXPORT_SYMBOL_NS_GPL(lwmi_cd_fan_get_data, "LENOVO_WMI_CAPDATA");
> =20
> +/* =3D=3D=3D=3D=3D=3D=3D=3D debugfs =3D=3D=3D=3D=3D=3D=3D=3D */
> +
> +/**
> + * lwmi_cd00_show() - Dump capdata00
> + * @s: Pointer to seq_file where the capdata00 is dumped.
> + * @cd00: Pointer to a capdata00 struct to be dumped.
> + */
> +static void lwmi_cd00_show(struct seq_file *s, struct capdata00 *cd00)
> +{
> +	u8 dev =3D FIELD_GET(LWMI_ATTR_DEV_ID_MASK, cd00->id);
> +	u8 feat =3D FIELD_GET(LWMI_ATTR_FEAT_ID_MASK, cd00->id);
> +	u8 mode =3D FIELD_GET(LWMI_ATTR_MODE_ID_MASK, cd00->id);
> +	u8 type =3D FIELD_GET(LWMI_ATTR_TYPE_ID_MASK, cd00->id);
> +	bool extra =3D cd00->supported & ~(LWMI_SUPP_GET | LWMI_SUPP_SET | LWMI=
_SUPP_VALID);
> +	bool get =3D cd00->supported & LWMI_SUPP_GET;
> +	bool set =3D cd00->supported & LWMI_SUPP_SET;
> +	bool valid =3D cd00->supported & LWMI_SUPP_VALID;
> +
> +	seq_printf(s, "  id:             0x%08x [dev: %2u, feat: %2u, mode: %2u=
, type: %2u]\n",
> +		   cd00->id, dev, feat, mode, type);
> +
> +	seq_printf(s, "  supported:      0x%08x [%c%c%c%c]\n", cd00->supported,
> +		   extra ? '+' : ' ',
> +		   get   ? 'R' : ' ',
> +		   set   ? 'W' : ' ',
> +		   valid ? 'V' : ' ');
> +
> +	seq_printf(s, "  default_value:  %u\n", cd00->default_value);
> +}
> +
> +/**
> + * lwmi_cd01_show() - Dump capdata01
> + * @s: Pointer to seq_file where the capdata01 is dumped.
> + * @cd01: Pointer to a capdata01 struct to be dumped.
> + */
> +static void lwmi_cd01_show(struct seq_file *s, struct capdata01 *cd01)
> +{
> +	/* capdata01 is an extension to capdata00. */
> +	lwmi_cd00_show(s, (struct capdata00 *)cd01);
> +
> +	seq_printf(s, "  step:           %u\n", cd01->step);
> +	seq_printf(s, "  min_value:      %u\n", cd01->min_value);
> +	seq_printf(s, "  max_value:      %u\n", cd01->max_value);
> +}
> +
> +/**
> + * lwmi_cd_fan_show() - Dump capdata_fan
> + * @s: Pointer to seq_file where the capdata_fan is dumped.
> + * @cd_fan: Pointer to a capdata_fan struct to be dumped.
> + */
> +static void lwmi_cd_fan_show(struct seq_file *s, struct capdata_fan *cd_=
fan)
> +{
> +	seq_printf(s, "  id:             %u\n", cd_fan->id);
> +	seq_printf(s, "  min_rpm:        %u\n", cd_fan->min_rpm);
> +	seq_printf(s, "  max_rpm:        %u\n", cd_fan->max_rpm);
> +}
> +
> +/**
> + * lwmi_cd_debugfs_show() - Dump capability data to debugfs
> + * @s: Pointer to seq_file where the capability data is dumped.
> + * @data: unused.
> + *
> + * Return: 0
> + */
> +static int lwmi_cd_debugfs_show(struct seq_file *s, void *data)
> +{
> +	struct lwmi_cd_priv *priv =3D s->private;
> +	u8 idx;
> +
> +	guard(mutex)(&priv->list->list_mutex);
> +
> +	/* lwmi_cd_alloc() ensured priv->list->type must be a valid type. */
> +	for (idx =3D 0; idx < priv->list->count; idx++) {
> +		seq_printf(s, "%s[%u]:\n", lwmi_cd_table[priv->list->type].name, idx);
> +
> +		if (priv->list->type =3D=3D LENOVO_CAPABILITY_DATA_00)
> +			lwmi_cd00_show(s, &priv->list->cd00[idx]);
> +		else if (priv->list->type =3D=3D LENOVO_CAPABILITY_DATA_01)
> +			lwmi_cd01_show(s, &priv->list->cd01[idx]);
> +		else if (priv->list->type =3D=3D LENOVO_FAN_TEST_DATA)
> +			lwmi_cd_fan_show(s, &priv->list->cd_fan[idx]);
> +	}
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(lwmi_cd_debugfs);
> +
> +/**
> + * lwmi_cd_debugfs_add() - Create debugfs directory and files for a devi=
ce
> + * @priv: lenovo-wmi-capdata driver data.
> + */
> +static void lwmi_cd_debugfs_add(struct lwmi_cd_priv *priv)
> +{
> +	priv->debugfs_dir =3D lwmi_debugfs_create_dir(priv->wdev);
> +
> +	debugfs_create_file("capdata", 0444, priv->debugfs_dir, priv, &lwmi_cd_=
debugfs_fops);
> +}
> +
> +/**
> + * lwmi_cd_debugfs_remove() - Remove debugfs directory for a device
> + * @priv: lenovo-wmi-capdata driver data.
> + */
> +static void lwmi_cd_debugfs_remove(struct lwmi_cd_priv *priv)
> +{
> +	debugfs_remove_recursive(priv->debugfs_dir);
> +	priv->debugfs_dir =3D NULL;
> +}
> +
> +/* =3D=3D=3D=3D=3D=3D=3D=3D WMI interface =3D=3D=3D=3D=3D=3D=3D=3D */
> +
>  /**
>   * lwmi_cd_cache() - Cache all WMI data block information
>   * @priv: lenovo-wmi-capdata driver data.
> @@ -773,6 +889,8 @@ static int lwmi_cd_probe(struct wmi_device *wdev, con=
st void *context)
>  		dev_err(&wdev->dev, "failed to register %s: %d\n",
>  			info->name, ret);
>  	} else {
> +		lwmi_cd_debugfs_add(priv);
> +
>  		dev_dbg(&wdev->dev, "registered %s with %u items\n",
>  			info->name, priv->list->count);
>  	}
> @@ -783,6 +901,8 @@ static void lwmi_cd_remove(struct wmi_device *wdev)
>  {
>  	struct lwmi_cd_priv *priv =3D dev_get_drvdata(&wdev->dev);
> =20
> +	lwmi_cd_debugfs_remove(priv);
> +
>  	switch (priv->list->type) {
>  	case LENOVO_CAPABILITY_DATA_00:
>  		lwmi_cd_sub_master_del(priv);
> @@ -822,6 +942,7 @@ static struct wmi_driver lwmi_cd_driver =3D {
> =20
>  module_wmi_driver(lwmi_cd_driver);
> =20
> +MODULE_IMPORT_NS("LENOVO_WMI_HELPERS");
>  MODULE_DEVICE_TABLE(wmi, lwmi_cd_id_table);
>  MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
>  MODULE_AUTHOR("Rong Zhang <i@rong.moe>");
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform=
/x86/lenovo/wmi-capdata.h
> index 8c1df3efcc553..034a6e48be071 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.h
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
> @@ -30,9 +30,7 @@ struct capdata00 {
>  };
> =20
>  struct capdata01 {
> -	u32 id;
> -	u32 supported;
> -	u32 default_value;
> +	struct capdata00;
>  	u32 step;
>  	u32 min_value;
>  	u32 max_value;


--=20
Thanks,
 ~ Kurt

