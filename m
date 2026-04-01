Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B89E3090D9;
	Wed,  1 Apr 2026 18:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775068900; cv=pass; b=mQaQgtaiGdfuR7WDSbHRMCULcW51kJswBMUuT8IRID0u6JYMt0roCmOo1ga/DCMShBrbSo/ztVRw+9JE0wN7cP53gob94hTGqiM/VSpqY885GU7Jl9GyIU8+tCO24OBWP3C5TQexbhWTynuEZiu/3MNAUB9a/8oy4EAwe/zRSMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775068900; c=relaxed/simple;
	bh=qwKRVaI5WinSgSKesEREfATPmk+F1Axjnr1rJJt6IZA=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=pfx5pUsYY9373gNATu4rF5mluC+4LkOB6pYOYnkD+Qn+d0VVRsDOk0NrRYdRRKcCVyVR0IAMmpHo8g5LPKJgacs5GQnp8ZIQgxOm+CvZx8E/OQYptCS7TvARyrZnTfLha8sj28q5AoruUvc5pWkkeiZ1tB6KQq0xsVI6KSrQ6PE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=LW/wV6jf; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="LW/wV6jf"
ARC-Seal: i=1; a=rsa-sha256; t=1775068890; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mrr6sGJ1QAfm+VFjs1N8ewksnsWnxO+UY5Bkzgq3fWpiSWvMo5hij1By0tcJ/iaH/BEUrEjceIBAgSFexeAQJhHiWep3J+P3rWreFKFyCbCwcsjAqSfmqOXvWCxn5n/JPSL6ljPXJOc81XkyClHkOynz6Sr75zdeipV9zrNJR2E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775068890; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jAR1fUUHlAnqZH9BxmXcLu6mXDC2BJJsMRd981AWEmI=; 
	b=DV1wChog81ncZlDV7LyJeSN5IE9jUjaGaBr7lupw+XY7WMrXUa99cw3vqKAEeL1se8T3gxNTxTlY8D6lGpPS7sNgh2W+YwACXdbnrUQgKoDb4ebOeT9HZeeVE/rlYLgH6tRNnCFHF3xUrbeH4/nie8ZXHWipX3mPeNLn7m4p8I0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775068890;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=jAR1fUUHlAnqZH9BxmXcLu6mXDC2BJJsMRd981AWEmI=;
	b=LW/wV6jfkc5uOLWpMfn55LTuINzRJxVZGOBaXXM+EnChiqlXwGqMevfQKnVAFxyy
	L7E/xA+ngLLjeZFoh5qaocboE1Q/i/aPqIr9GLdTzwJkL5YnISCzm4qWNnmihL6EWdd
	ZTvDLgIdfbP36cJxe2K9VUCC2LFgpaNiTGsDuJfbY9r5YD/bYx1nGN+VNfDL8uqzmH6
	v+cSk/ygqvslrtmJwGSKnQZIHrMbuBp5LY5279azBtp+XOz3IeuAtS1ZP04vgj/Ko93
	HQB9XOXrNOOKWNwDh+w/iwD+meVjVtuV2rOc8v2kM2XD36PevswDoEohINGrr51D0VI
	E3TWobKe4w==
Received: by mx.zohomail.com with SMTPS id 1775068888725270.67369156988616;
	Wed, 1 Apr 2026 11:41:28 -0700 (PDT)
Message-ID: <d31a9882ef2d72ddd4197f8fa08b38dcc1e1b687.camel@rong.moe>
Subject: Re: [PATCH v6 12/13] platform/x86: lenovo-wmi-helpers: Add helper
 for creating per-device debugfs dir
From: Rong Zhang <i@rong.moe>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede
 <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Jonathan Corbet
	 <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260331181208.421552-13-derekjohn.clark@gmail.com>
References: <20260331181208.421552-1-derekjohn.clark@gmail.com>
	 <20260331181208.421552-13-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Apr 2026 02:35:20 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Derek,

On Tue, 2026-03-31 at 18:12 +0000, Derek J. Clark wrote:
> From: Rong Zhang <i@rong.moe>
>=20
> We are about to add debugfs support for lenovo-wmi-capdata. Let's setup
> a debugfs directory called "lenovo_wmi" for tidiness, so that any
> lenovo-wmi-* device can put its subdirectory under the directory.
> Subdirectories will be named after the corresponding WMI devices.
>=20
> Signed-off-by: Rong Zhang <i@rong.moe>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
>  drivers/platform/x86/lenovo/wmi-helpers.c | 34 +++++++++++++++++++++++
>  drivers/platform/x86/lenovo/wmi-helpers.h |  2 ++
>  2 files changed, 36 insertions(+)
>=20
> diff --git a/drivers/platform/x86/lenovo/wmi-helpers.c b/drivers/platform=
/x86/lenovo/wmi-helpers.c
> index e1cf869224d2..52a0c6a5a4bf 100644
> --- a/drivers/platform/x86/lenovo/wmi-helpers.c
> +++ b/drivers/platform/x86/lenovo/wmi-helpers.c
> @@ -17,6 +17,8 @@
>   */
> =20
>  #include <linux/acpi.h>
> +#include <linux/debugfs.h>
> +#include <linux/device.h>
>  #include <linux/cleanup.h>
>  #include <linux/errno.h>
>  #include <linux/export.h>
> @@ -185,6 +187,38 @@ int lwmi_tm_notifier_call(enum thermal_mode *mode)
>  }
>  EXPORT_SYMBOL_NS_GPL(lwmi_tm_notifier_call, "LENOVO_WMI_HELPERS");
> =20
> +static struct dentry *lwmi_debugfs_dir;
> +
> +/**
> + * lwmi_debugfs_create_dir() - Helper function for creating a debugfs di=
rectory
> + * for a device.
> + * @wdev: Pointer to the WMI device to be called.
> + *
> + * Caller must remove the directory with debugfs_remove_recursive() on d=
evice
> + * removal.
> + *
> + * Return: Pointer to the created directory.
> + */
> +struct dentry *lwmi_debugfs_create_dir(struct wmi_device *wdev)
> +{
> +	return debugfs_create_dir(dev_name(&wdev->dev), lwmi_debugfs_dir);
> +}
> +EXPORT_SYMBOL_NS_GPL(lwmi_debugfs_create_dir, "LENOVO_WMI_HELPERS");
> +
> +static int __init lwmi_helpers_init(void)
> +{
> +	lwmi_debugfs_dir =3D debugfs_create_dir("lenovo_wmi", NULL);
> +
> +	return 0;
> +}
> +module_init(lwmi_helpers_init)

I missed it before. This should be `subsys_initcall(lwmi_helpers_init)'
so that it can be initialized first if both wmi-helpers and wmi-capdata
are built into the kernel statically (i.e., =3Dy).

Found by sashiko.dev.

https://sashiko.dev/#/patchset/20260331181208.421552-1-derekjohn.clark%40gm=
ail.com

module_exit(lwmi_helpers_exit) has no effect when built into the kernel
so that's fine.

Thanks,
Rong

> +
> +static void __exit lwmi_helpers_exit(void)
> +{
> +	debugfs_remove_recursive(lwmi_debugfs_dir);
> +}
> +module_exit(lwmi_helpers_exit)
> +
>  MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
>  MODULE_DESCRIPTION("Lenovo WMI Helpers Driver");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/lenovo/wmi-helpers.h b/drivers/platform=
/x86/lenovo/wmi-helpers.h
> index ed7db3ebba6c..039fe61003ce 100644
> --- a/drivers/platform/x86/lenovo/wmi-helpers.h
> +++ b/drivers/platform/x86/lenovo/wmi-helpers.h
> @@ -16,6 +16,8 @@ struct wmi_method_args_32 {
>  	u32 arg1;
>  };
> =20
> +struct dentry *lwmi_debugfs_create_dir(struct wmi_device *wdev);
> +
>  enum lwmi_event_type {
>  	LWMI_GZ_GET_THERMAL_MODE =3D 0x01,
>  };
