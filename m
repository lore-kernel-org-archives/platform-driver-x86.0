Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDC524A067;
	Fri,  8 May 2026 15:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778252916; cv=none; b=rmMs/VWI+V23MWvVwVSg6TcKaTZq8YwJY05xkIbx+gU1ZvdIYKFGP72yxzf/J/RgvIJcGwRqxsru5oX+FXE7uvblps1mDh4dO2frZ502GQaxB9zJoXkHKH9N7fdDqYtM10Lnn05SNJPA5KxAMOwX00H/kYmXAcH5L5EZ8rzuaCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778252916; c=relaxed/simple;
	bh=5j+7IxvxGxLxhC/J1OCz4SJbHvbK7oRfS44irvsW6wU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=VWAcKovxRJ+BV2SeHETRzljyAOnjtj0jh7TOG8N5U416Synby86uBou++TSf9ktzaoqQN+jYs3+HZIGxfwQISXp1SZ2lWIW0KZ7CppE5jcA9/aFzSb7mwIxz3hB132IuEAFGnj0Kgx/bIdSEKNkyKFs2bskT6t0iSpIN9JXmUDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KxWR8HAD; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KxWR8HAD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778252914; x=1809788914;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=5j+7IxvxGxLxhC/J1OCz4SJbHvbK7oRfS44irvsW6wU=;
  b=KxWR8HADFOGpdhrTkL8wKIGvPZ69UUvESCPwUo2sk+7zSqedQtUB09ch
   4MhAm4Zx/j3vOv4qqc0r+IZNDOe+1vARsxiMIfUNTV0rXZDHXEFdJD4mO
   p9VLlYuAoY9sGsM5AQLCghJ9DDd/LbI7lx59vWftlDewKHzFf8DFoY64R
   ZWTAS9pKM/D9Z/EYTe5KUMBNoV+xxqhJ6J2pmb4TvH90mwFuipcOswS5C
   j4aXyUgNTK1g1OcC9+0UtDVTQ4tKhjVtX/7zDi/ZEw3YzLn+JKjXNqRV0
   4L61MxLbr7zUJSI+U4YTwl3nGm10vNJL4SQFO811OQtLbomlEcIvaPKJ8
   g==;
X-CSE-ConnectionGUID: vCJSt1Z+QjefMEFzahwfew==
X-CSE-MsgGUID: /fa1BObPQPSyRk9/jReF2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="78365213"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="78365213"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 08:08:33 -0700
X-CSE-ConnectionGUID: UKdLCdzgSZi/Jks25sM3mw==
X-CSE-MsgGUID: fRnmKDh2TiCWKZpeioeCAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="236725098"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.100])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 08:08:28 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 8 May 2026 18:08:24 +0300 (EEST)
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
    Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>, 
    Rong Zhang <i@rong.moe>, Kurt Borja <kuurtb@gmail.com>, 
    "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, 
    =?ISO-8859-15?Q?N=EDcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>, 
    marshall@shzj.cc, hyacinth@shzj.cc, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v11 15/15] platform/x86: lenovo-wmi-capdata: Add debugfs
 file for dumping capdata
In-Reply-To: <20260507180507.912966-16-derekjohn.clark@gmail.com>
Message-ID: <f7938f65-b38c-8d96-3e2f-b66c943d5f03@linux.intel.com>
References: <20260507180507.912966-1-derekjohn.clark@gmail.com> <20260507180507.912966-16-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 May 2026, Derek J. Clark wrote:

> From: Rong Zhang <i@rong.moe>
> 
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
> Tested-by: Kurt Borja <kuurtb@gmail.com>
> Signed-off-by: Rong Zhang <i@rong.moe>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
>  drivers/platform/x86/lenovo/Kconfig       |   1 +
>  drivers/platform/x86/lenovo/wmi-capdata.c | 120 ++++++++++++++++++++++
>  drivers/platform/x86/lenovo/wmi-capdata.h |   4 +-
>  3 files changed, 122 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/lenovo/Kconfig
> index b9a5d18caa1e..4443f40ef8aa 100644
> --- a/drivers/platform/x86/lenovo/Kconfig
> +++ b/drivers/platform/x86/lenovo/Kconfig
> @@ -236,6 +236,7 @@ config YT2_1380
>  config LENOVO_WMI_CAPDATA
>  	tristate
>  	depends on ACPI_WMI
> +	depends on LENOVO_WMI_HELPERS
>  
>  config LENOVO_WMI_EVENTS
>  	tristate
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/x86/lenovo/wmi-capdata.c
> index 169665be4dcf..b5e2c16d638f 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.c
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.c
> @@ -31,6 +31,7 @@
>  #include <linux/cleanup.h>
>  #include <linux/component.h>
>  #include <linux/container_of.h>
> +#include <linux/debugfs.h>
>  #include <linux/device.h>
>  #include <linux/dev_printk.h>
>  #include <linux/err.h>
> @@ -42,6 +43,7 @@
>  #include <linux/mutex_types.h>
>  #include <linux/notifier.h>
>  #include <linux/overflow.h>
> +#include <linux/seq_file.h>
>  #include <linux/stddef.h>
>  #include <linux/types.h>
>  #include <linux/wmi.h>
> @@ -88,6 +90,7 @@ struct lwmi_cd_priv {
>  	struct notifier_block acpi_nb; /* ACPI events */
>  	struct wmi_device *wdev;
>  	struct cd_list *list;
> +	struct dentry *debugfs_dir;
>  
>  	/*
>  	 * A capdata device may be a component master of another capdata device.
> @@ -118,6 +121,8 @@ struct cd_list {
>  
>  static struct wmi_driver lwmi_cd_driver;
>  
> +/* ======== Device components ======== */
> +
>  /**
>   * lwmi_cd_match() - Match rule for the master driver.
>   * @dev: Pointer to the capability data parent device.
> @@ -471,6 +476,116 @@ EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO_WMI_CAPDATA");
>  DEF_LWMI_CDXX_GET_DATA(cd_fan, LENOVO_FAN_TEST_DATA, struct capdata_fan);
>  EXPORT_SYMBOL_NS_GPL(lwmi_cd_fan_get_data, "LENOVO_WMI_CAPDATA");
>  
> +/* ======== debugfs ======== */
> +
> +/**
> + * lwmi_cd00_show() - Dump capdata00
> + * @s: Pointer to seq_file where the capdata00 is dumped.
> + * @cd00: Pointer to a capdata00 struct to be dumped.
> + */
> +static void lwmi_cd00_show(struct seq_file *s, struct capdata00 *cd00)
> +{
> +	u8 dev = FIELD_GET(LWMI_ATTR_DEV_ID_MASK, cd00->id);
> +	u8 feat = FIELD_GET(LWMI_ATTR_FEAT_ID_MASK, cd00->id);
> +	u8 mode = FIELD_GET(LWMI_ATTR_MODE_ID_MASK, cd00->id);
> +	u8 type = FIELD_GET(LWMI_ATTR_TYPE_ID_MASK, cd00->id);
> +	bool extra = cd00->supported & ~(LWMI_SUPP_GET | LWMI_SUPP_SET | LWMI_SUPP_VALID);
> +	bool get = cd00->supported & LWMI_SUPP_GET;
> +	bool set = cd00->supported & LWMI_SUPP_SET;
> +	bool valid = cd00->supported & LWMI_SUPP_VALID;
> +
> +	seq_printf(s, "  id:             0x%08x [dev: %2u, feat: %2u, mode: %2u, type: %2u]\n",
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

Hpmf, so anonymous struct leads to this now.

I wonder if we could wrap it with an union to have both named access to it 
(to get the pointer without casting) while retaining anonymous access to 
its members:

struct capdata01 {
	union {
		struct capdata00;
		struct capdata00 cd00;
	};
	...

...If it's not possible, then I'll have to accept the cast I guess.

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
> +static void lwmi_cd_fan_show(struct seq_file *s, struct capdata_fan *cd_fan)
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
> +	struct lwmi_cd_priv *priv = s->private;
> +	u8 idx;
> +
> +	guard(mutex)(&priv->list->list_mutex);
> +
> +	/* lwmi_cd_alloc() ensured priv->list->type must be a valid type. */
> +	for (idx = 0; idx < priv->list->count; idx++) {
> +		seq_printf(s, "%s[%u]:\n", lwmi_cd_table[priv->list->type].name, idx);
> +
> +		if (priv->list->type == LENOVO_CAPABILITY_DATA_00)
> +			lwmi_cd00_show(s, &priv->list->cd00[idx]);
> +		else if (priv->list->type == LENOVO_CAPABILITY_DATA_01)
> +			lwmi_cd01_show(s, &priv->list->cd01[idx]);
> +		else if (priv->list->type == LENOVO_FAN_TEST_DATA)
> +			lwmi_cd_fan_show(s, &priv->list->cd_fan[idx]);
> +	}
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(lwmi_cd_debugfs);
> +
> +/**
> + * lwmi_cd_debugfs_add() - Create debugfs directory and files for a device
> + * @priv: lenovo-wmi-capdata driver data.
> + */
> +static void lwmi_cd_debugfs_add(struct lwmi_cd_priv *priv)
> +{
> +	priv->debugfs_dir = lwmi_debugfs_create_dir(priv->wdev);
> +
> +	debugfs_create_file("capdata", 0444, priv->debugfs_dir, priv, &lwmi_cd_debugfs_fops);
> +}
> +
> +/**
> + * lwmi_cd_debugfs_remove() - Remove debugfs directory for a device
> + * @priv: lenovo-wmi-capdata driver data.
> + */
> +static void lwmi_cd_debugfs_remove(struct lwmi_cd_priv *priv)
> +{
> +	debugfs_remove_recursive(priv->debugfs_dir);
> +	priv->debugfs_dir = NULL;
> +}
> +
> +/* ======== WMI interface ======== */
> +
>  /**
>   * lwmi_cd_cache() - Cache all WMI data block information
>   * @priv: lenovo-wmi-capdata driver data.
> @@ -773,6 +888,8 @@ static int lwmi_cd_probe(struct wmi_device *wdev, const void *context)
>  		dev_err(&wdev->dev, "failed to register %s: %d\n",
>  			info->name, ret);
>  	} else {
> +		lwmi_cd_debugfs_add(priv);
> +
>  		dev_dbg(&wdev->dev, "registered %s with %u items\n",
>  			info->name, priv->list->count);
>  	}
> @@ -783,6 +900,8 @@ static void lwmi_cd_remove(struct wmi_device *wdev)
>  {
>  	struct lwmi_cd_priv *priv = dev_get_drvdata(&wdev->dev);
>  
> +	lwmi_cd_debugfs_remove(priv);
> +
>  	switch (priv->list->type) {
>  	case LENOVO_CAPABILITY_DATA_00:
>  		lwmi_cd_sub_master_del(priv);
> @@ -822,6 +941,7 @@ static struct wmi_driver lwmi_cd_driver = {
>  
>  module_wmi_driver(lwmi_cd_driver);
>  
> +MODULE_IMPORT_NS("LENOVO_WMI_HELPERS");
>  MODULE_DEVICE_TABLE(wmi, lwmi_cd_id_table);
>  MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
>  MODULE_AUTHOR("Rong Zhang <i@rong.moe>");
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform/x86/lenovo/wmi-capdata.h
> index e0a30f2c0c87..0df3ae534ed5 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.h
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
> @@ -38,9 +38,7 @@ struct capdata00 {
>  };
>  
>  struct capdata01 {
> -	u32 id;
> -	u32 supported;
> -	u32 default_value;
> +	struct capdata00;
>  	u32 step;
>  	u32 min_value;
>  	u32 max_value;
> 

-- 
 i.

