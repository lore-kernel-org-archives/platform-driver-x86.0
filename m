Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CFF397E96
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 20:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774901096; cv=pass; b=LE3M8fVxLvM3M7X7SsAnbRTUB+c5e/YAW0FTJkHxyxWkkT/9tLYa3LWYZZo9TbAuEEudrIbu0Y/AO94EbyZdgEqfXCcUjeYNoSAgGvWxfZhwFSjEnHLC7Wh8QMO+pd5ZYDN84qGC6G7LKf0KkpyPrr41TFHPFyAPjeujbfTpf5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774901096; c=relaxed/simple;
	bh=KJuJuhqUaZ55M8ruejRz7A3V09B3RWMTzMHuYnfDh/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a+D7vJLodaQq8xsmp6rxmABbHtY5dFPWpENH7EP7AZeZk2BXrJ+Kn7QsicsLHFir5uEWW5I/xkKv6GWEEkZqTpZmhMOHCtSF5+YgxicpwO9oRv2yiOxWTcj7lKFnhwpQIk2uhoq/XIrlbW6DbjoCKlEgOWkCfZQXMkNFA1MN2OQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Liirv87A; arc=pass smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Liirv87A"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-89fc4147f2eso39341196d6.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Mar 2026 13:04:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774901093; cv=none;
        d=google.com; s=arc-20240605;
        b=EiCpY6Is7dMlaQo9CoDJwNoVBp29elzQQ28+lmeM3zVRex3XKBKjVDhJ1q2bHEWHgB
         vCbaRrwrNOCZUKBR5h9qkja+Bj8N4EHE1K4pFZRXfQtNd0zzi1mTWm8VKasnI10qa7xN
         sztq02a6WRsdXxbZIxkFwIvcZwDhsE2L0j0JO2sfkislxK3ns0AQrYFH7U6WjW+RX5y+
         G1oR2kRQe+wjkA40kc0TEThtfyg/rwkQBlhi5fWmgMRpqwR3nkdXujskeKj6SNp9l94x
         TM9F2rNeaXVx0gDJWcVhXjzaaLrRiZUefemR91Bd3cmEMHjRQJAiS9fyy1NwPrep55SR
         ld6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oSkfhNu1ynunF/nJxn9CMmPexHLJKgIbYNXwLG1ZZTI=;
        fh=+IXApnZQLEMdcyH+y/d50TyMXGS0pSgJ239qKOPztH0=;
        b=AKxFlJKNoHCxRNyhKpSZ9ZA4gT4CNMsZwxJkPEPfXXlNt31eNJtjyNaTLlQVPpJeHa
         Z+ixt/QqovsqfBxTg0+MhXN00RJnHnIfBxNMIfzxiZ7DQRoAD3Xv1z2KJMZhL5CEyGZj
         DQcMhG22hYs9gBnw1ZLn/NfvLoxBpTB/VvmTbhhO6ghp+N+xGj78m6R9we+GBcesPUc9
         +LwF430+RC4ZPmx6J28Hpa2gIoG1bov2HaQ+Vb0oa4JVxwIavyImxQEVLGugCm54ELCS
         Se7q8JbFNPP1PN8Blb8UhYZhmq5Erpzs3Mixb3+81flw8BzQJ7EFbTB+BAe4s30WhDFv
         u87g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774901093; x=1775505893; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oSkfhNu1ynunF/nJxn9CMmPexHLJKgIbYNXwLG1ZZTI=;
        b=Liirv87AstAdm5ulkGdu8ebYdkZxvHLBy1DgAp0lAyaUyXNHQsLs3Q3DVtnCoUJwBX
         yXNM9uJ1Hyq0D1/OjUScGkBGWkxtUyj30ZWP/05z7camrBCMWx98dWT4sciMzM9azMG6
         LBQS62bDzTyMVrdR0E4pJv308atqxkQDrvMDxAJ8xChJnWRJnJXY621K+FeZrvaDO0ke
         HHTQIJGaNgU28qBaJKAJwk3/DsvE/ADKpTtTZgeG2L+xL5jECgQvHcLIAprVSfRWNpPe
         ZjmwJIfBWKc+lFNYR/cbFLs/jBKG0a80yCyN6KpQz1agos96SLX0Jl8D8Ytvw16zY3Tb
         4ejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774901093; x=1775505893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oSkfhNu1ynunF/nJxn9CMmPexHLJKgIbYNXwLG1ZZTI=;
        b=by73ePP22c0L/UEyEozxQh5hzJd+JGhlDKCtJQX2Doa+cv08fhijNMcXby1HlNdhSr
         KkGDjmss5ALz0kMdJGUJS6Av1b37u3WA+/Ka5c3gnNXuw4Dj9IEA0D+7jLk2DSZiKLI1
         mh3ejZkeGFG8+QoYUreoTZV/sblEhM5yY4pacd/rSU88FtHuMbLwkupezwiMHmreuLZt
         RB5SRmHz8pLwhpzLVDPZDLVi55C068Yxy4DT+fuuCBYS3l+hSKI91va54FGRKZsjM6U9
         fX+VrKpCqgeApuaOZtakr0nt/xSeKDsztIibgM1F6XsOlnUpaf2RmpiQeU71Wwpu6yXS
         KfIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSY9oolwuP0WSCypiN7kDhyfvxE/qxdZz0lJvR92pVSmbJAkYDOI+NYFiVV8XZgV1qiD/xtHJeCPKHRbfcwp3dL74g@vger.kernel.org
X-Gm-Message-State: AOJu0YxEetstLra40JG+d8qGjWgTx7aFOjuR/xTSOYUWp4t9IlRc00Gm
	1NkgW2VCLAxnoMusiOj5S9IanXYaVCwBQZYnLRtiCUIYGVWLCrza6CegOue9LzPaqVxVyEdBmqt
	THVYWf4ZnLD28+7lS5kjIYegTlubu3O8=
X-Gm-Gg: ATEYQzxP+hKhQ5toU89KZNPC9CL6UD06vwY3DRC014jX6HtSkgHRyx+z+8k3xBZ4GTn
	LIbXzSx8Zpa33+MLZtjTJEKtSVMerGCeuT1clpP9gvJ6lsNCwwJ1cLbEZi3aPfQw4sB3vp+LUV3
	FHnHdowsgAdqrKytoFVKmnQhsaWP+TvD8F0LgEkiaFQtv4fhcZyjrA9lLpKJbfAO4FiMacyluIL
	P05rTTi662XacI4luk+DT6SlsR8oTKkh3LaZevjD2JV9hxffwLkjT9NcfYH0XLVJ49Rdtx2o7/u
	003/n16Y
X-Received: by 2002:a05:6214:20e2:b0:89c:ac72:2f6e with SMTP id
 6a1803df08f44-89ce8f2cfd2mr188112966d6.43.1774901092614; Mon, 30 Mar 2026
 13:04:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <861d0276a759461be446df8e996d196037c9b581.camel@rong.moe>
 <20260326161724.72186-1-i@rong.moe> <d824bf55-8c1a-1374-04f9-aff9ffdaaa0d@linux.intel.com>
 <afa0c48c0adac075411dae92ff9079e52c77a3fe.camel@rong.moe>
In-Reply-To: <afa0c48c0adac075411dae92ff9079e52c77a3fe.camel@rong.moe>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Mon, 30 Mar 2026 13:04:41 -0700
X-Gm-Features: AQROBzCUCvaRnIMxt9qXTKpRMu_60KmC2N-WJ-TFOAoyaYdRkGu52ecrs59LVC0
Message-ID: <CAFqHKTkSQsEDeFif8+OrAm2tr2VQjx7N0UEdXxJRmy+N_4i==g@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: lenovo: Decouple lenovo-wmi-gamezone and lenovo-wmi-other
To: Rong Zhang <i@rong.moe>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hansg@kernel.org>, oe-kbuild-all@lists.linux.dev, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
	Jonathan Corbet <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 8:21=E2=80=AFAM Rong Zhang <i@rong.moe> wrote:
>
> Hi Ilpo,
>
> On Fri, 2026-03-27 at 13:25 +0200, Ilpo J=C3=A4rvinen wrote:
> > On Fri, 27 Mar 2026, Rong Zhang wrote:
> >
> > > Currently, lenovo-wmi-gamezone depends on lenovo-wmi-other as the for=
mer
> > > imports symbols from the latter. The imported symbols are just used t=
o
> > > register a notifier block. However, there is no runtime dependency
> > > between both drivers, and either of them can run without the other,
> > > which is the major purpose of using the notifier framework.
> > >
> > > Such a link-time dependency is non-optimal. A previous attempt to "fi=
x"
> > > it made LENOVO_WMI_GAMEZONE select LENOVO_WMI_TUNING, which was
> > > fundamentally broken and resulted in undefined Kconfig behavior, as
> > > `select' cannot be used on a symbol with potentially unmet dependenci=
es.
> > >
> > > Decouple both drivers by moving the thermal mode notifier chain to
> > > lenovo-wmi-helpers. Methods for notifier block (un)registration are
> > > exported for lenovo-wmi-gamezone, while a method for querying the
> > > current thermal mode are exported for lenovo-wmi-other.
> > >
> > > This turns the dependency graph from
> > >
> > >             +------------ lenovo-wmi-gamezone
> > >             |                     |
> > >             v                     |
> > >     lenovo-wmi-helpers            |
> > >             ^                     |
> > >             |                     V
> > >             +------------ lenovo-wmi-other
> > >
> > > into
> > >
> > >             +------------ lenovo-wmi-gamezone
> > >             |
> > >             v
> > >     lenovo-wmi-helpers
> > >             ^
> > >             |
> > >             +------------ lenovo-wmi-other
> > >
> > > To make it clear, the name of the notifier chain is also renamed from
> > > `om_chain_head' to `tm_chain_head', indicating that it's used to quer=
y
> > > the current thermal mode.
> > >
> > > No functional change intended.
> > >
> > > Fixes: 6e38b9fcbfa3 ("platform/x86: lenovo: gamezone needs "other mod=
e"")
> > > Cc: stable@vger.kernel.org
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202603252259.gHvJDyh3-l=
kp@intel.com/
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202603260302.X0NjQOda-l=
kp@intel.com/
> > > Signed-off-by: Rong Zhang <i@rong.moe>
> > > ---
> > >  drivers/platform/x86/lenovo/Kconfig        |   1 -
> > >  drivers/platform/x86/lenovo/wmi-gamezone.c |   4 +-
> > >  drivers/platform/x86/lenovo/wmi-helpers.c  | 102 +++++++++++++++++++=
+
> > >  drivers/platform/x86/lenovo/wmi-helpers.h  |   8 ++
> > >  drivers/platform/x86/lenovo/wmi-other.c    | 104 +------------------=
--
> > >  drivers/platform/x86/lenovo/wmi-other.h    |  16 ----
> > >  6 files changed, 113 insertions(+), 122 deletions(-)
> > >  delete mode 100644 drivers/platform/x86/lenovo/wmi-other.h
> > >
> > > diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x=
86/lenovo/Kconfig
> > > index f885127b007f..09b1b055d2e0 100644
> > > --- a/drivers/platform/x86/lenovo/Kconfig
> > > +++ b/drivers/platform/x86/lenovo/Kconfig
> > > @@ -252,7 +252,6 @@ config LENOVO_WMI_GAMEZONE
> > >     select ACPI_PLATFORM_PROFILE
> > >     select LENOVO_WMI_EVENTS
> > >     select LENOVO_WMI_HELPERS
> > > -   select LENOVO_WMI_TUNING
> > >     help
> > >       Say Y here if you have a WMI aware Lenovo Legion device and wou=
ld like to use the
> > >       platform-profile firmware interface to manage power usage.
> > > diff --git a/drivers/platform/x86/lenovo/wmi-gamezone.c b/drivers/pla=
tform/x86/lenovo/wmi-gamezone.c
> > > index c7fe7e3c9f17..92020225db27 100644
> > > --- a/drivers/platform/x86/lenovo/wmi-gamezone.c
> > > +++ b/drivers/platform/x86/lenovo/wmi-gamezone.c
> > > @@ -23,7 +23,6 @@
> > >  #include "wmi-events.h"
> > >  #include "wmi-gamezone.h"
> > >  #include "wmi-helpers.h"
> > > -#include "wmi-other.h"
> > >
> > >  #define LENOVO_GAMEZONE_GUID "887B54E3-DDDC-4B2C-8B88-68A26A8835D0"
> > >
> > > @@ -383,7 +382,7 @@ static int lwmi_gz_probe(struct wmi_device *wdev,=
 const void *context)
> > >             return ret;
> > >
> > >     priv->mode_nb.notifier_call =3D lwmi_gz_mode_call;
> > > -   return devm_lwmi_om_register_notifier(&wdev->dev, &priv->mode_nb)=
;
> > > +   return devm_lwmi_tm_register_notifier(&wdev->dev, &priv->mode_nb)=
;
> > >  }
> > >
> > >  static const struct wmi_device_id lwmi_gz_id_table[] =3D {
> > > @@ -405,7 +404,6 @@ module_wmi_driver(lwmi_gz_driver);
> > >
> > >  MODULE_IMPORT_NS("LENOVO_WMI_EVENTS");
> > >  MODULE_IMPORT_NS("LENOVO_WMI_HELPERS");
> > > -MODULE_IMPORT_NS("LENOVO_WMI_OTHER");
> > >  MODULE_DEVICE_TABLE(wmi, lwmi_gz_id_table);
> > >  MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> > >  MODULE_DESCRIPTION("Lenovo GameZone WMI Driver");
> > > diff --git a/drivers/platform/x86/lenovo/wmi-helpers.c b/drivers/plat=
form/x86/lenovo/wmi-helpers.c
> > > index 7379defac500..5a88bccb5037 100644
> > > --- a/drivers/platform/x86/lenovo/wmi-helpers.c
> > > +++ b/drivers/platform/x86/lenovo/wmi-helpers.c
> > > @@ -21,11 +21,16 @@
> > >  #include <linux/errno.h>
> > >  #include <linux/export.h>
> > >  #include <linux/module.h>
> > > +#include <linux/notifier.h>
> > >  #include <linux/unaligned.h>
> > >  #include <linux/wmi.h>
> > >
> > > +#include "wmi-gamezone.h"
> > >  #include "wmi-helpers.h"
> > >
> > > +/* Thermal mode notifier chain. */
> > > +static BLOCKING_NOTIFIER_HEAD(tm_chain_head);
> > > +
> > >  /**
> > >   * lwmi_dev_evaluate_int() - Helper function for calling WMI methods=
 that
> > >   * return an integer.
> > > @@ -84,6 +89,103 @@ int lwmi_dev_evaluate_int(struct wmi_device *wdev=
, u8 instance, u32 method_id,
> > >  };
> > >  EXPORT_SYMBOL_NS_GPL(lwmi_dev_evaluate_int, "LENOVO_WMI_HELPERS");
> > >
> > > +/**
> > > + * lwmi_tm_register_notifier() - Add a notifier to the blocking noti=
fier chain
> > > + * @nb: The notifier_block struct to register
> > > + *
> > > + * Call blocking_notifier_chain_register to register the notifier bl=
ock to the
> > > + * thermal mode notifier chain.
> > > + *
> > > + * Return: 0 on success, %-EEXIST on error.
> > > + */
> > > +int lwmi_tm_register_notifier(struct notifier_block *nb)
> > > +{
> > > +   return blocking_notifier_chain_register(&tm_chain_head, nb);
> > > +}
> > > +EXPORT_SYMBOL_NS_GPL(lwmi_tm_register_notifier, "LENOVO_WMI_HELPERS"=
);
> > > +
> > > +/**
> > > + * lwmi_tm_unregister_notifier() - Remove a notifier from the blocki=
ng notifier
> > > + * chain.
> > > + * @nb: The notifier_block struct to register
> > > + *
> > > + * Call blocking_notifier_chain_unregister to unregister the notifie=
r block from the
> > > + * thermal mode notifier chain.
> > > + *
> > > + * Return: 0 on success, %-ENOENT on error.
> > > + */
> > > +int lwmi_tm_unregister_notifier(struct notifier_block *nb)
> > > +{
> > > +   return blocking_notifier_chain_unregister(&tm_chain_head, nb);
> > > +}
> > > +EXPORT_SYMBOL_NS_GPL(lwmi_tm_unregister_notifier, "LENOVO_WMI_HELPER=
S");
> > > +
> > > +/**
> > > + * devm_lwmi_tm_unregister_notifier() - Remove a notifier from the b=
locking
> > > + * notifier chain.
> > > + * @data: Void pointer to the notifier_block struct to register.
> > > + *
> > > + * Call lwmi_tm_unregister_notifier to unregister the notifier block=
 from the
> > > + * thermal mode notifier chain.
> > > + *
> > > + * Return: 0 on success, %-ENOENT on error.
> > > + */
> > > +static void devm_lwmi_tm_unregister_notifier(void *data)
> > > +{
> > > +   struct notifier_block *nb =3D data;
> > > +
> > > +   lwmi_tm_unregister_notifier(nb);
> > > +}
> > > +
> > > +/**
> > > + * devm_lwmi_tm_register_notifier() - Add a notifier to the blocking=
 notifier
> > > + * chain.
> > > + * @dev: The parent device of the notifier_block struct.
> > > + * @nb: The notifier_block struct to register
> > > + *
> > > + * Call lwmi_tm_register_notifier to register the notifier block to =
the
> > > + * thermal mode notifier chain. Then add devm_lwmi_tm_unregister_not=
ifier
> > > + * as a device managed action to automatically unregister the notifi=
er block
> > > + * upon parent device removal.
> > > + *
> > > + * Return: 0 on success, or an error code.
> > > + */
> > > +int devm_lwmi_tm_register_notifier(struct device *dev,
> > > +                              struct notifier_block *nb)
> > > +{
> > > +   int ret;
> > > +
> > > +   ret =3D lwmi_tm_register_notifier(nb);
> > > +   if (ret < 0)
> > > +           return ret;
> > > +
> > > +   return devm_add_action_or_reset(dev, devm_lwmi_tm_unregister_noti=
fier,
> > > +                                   nb);
> > > +}
> > > +EXPORT_SYMBOL_NS_GPL(devm_lwmi_tm_register_notifier, "LENOVO_WMI_HEL=
PERS");
> > > +
> > > +/**
> > > + * lwmi_tm_notifier_call() - Call functions for the notifier call ch=
ain.
> > > + * @mode: Pointer to a thermal mode enum to retrieve the data from.
> > > + *
> > > + * Call blocking_notifier_call_chain to retrieve the thermal mode fr=
om the
> > > + * lenovo-wmi-gamezone driver.
> > > + *
> > > + * Return: 0 on success, or an error code.
> > > + */
> > > +int lwmi_tm_notifier_call(enum thermal_mode *mode)
> > > +{
> > > +   int ret;
> > > +
> > > +   ret =3D blocking_notifier_call_chain(&tm_chain_head,
> > > +                                      LWMI_GZ_GET_THERMAL_MODE, &mod=
e);
> > > +   if ((ret & ~NOTIFY_STOP_MASK) !=3D NOTIFY_OK)
> > > +           return -EINVAL;
> > > +
> > > +   return 0;
> > > +}
> > > +EXPORT_SYMBOL_NS_GPL(lwmi_tm_notifier_call, "LENOVO_WMI_HELPERS");
> > > +
> > >  MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> > >  MODULE_DESCRIPTION("Lenovo WMI Helpers Driver");
> > >  MODULE_LICENSE("GPL");
> > > diff --git a/drivers/platform/x86/lenovo/wmi-helpers.h b/drivers/plat=
form/x86/lenovo/wmi-helpers.h
> > > index 20fd21749803..651a039228ed 100644
> > > --- a/drivers/platform/x86/lenovo/wmi-helpers.h
> > > +++ b/drivers/platform/x86/lenovo/wmi-helpers.h
> > > @@ -7,6 +7,8 @@
> > >
> > >  #include <linux/types.h>
> > >
> > > +struct device;
> > > +struct notifier_block;
> > >  struct wmi_device;
> > >
> > >  struct wmi_method_args_32 {
> > > @@ -17,4 +19,10 @@ struct wmi_method_args_32 {
> > >  int lwmi_dev_evaluate_int(struct wmi_device *wdev, u8 instance, u32 =
method_id,
> > >                       unsigned char *buf, size_t size, u32 *retval);
> > >
> > > +int lwmi_tm_register_notifier(struct notifier_block *nb);
> > > +int lwmi_tm_unregister_notifier(struct notifier_block *nb);
> > > +int devm_lwmi_tm_register_notifier(struct device *dev,
> > > +                              struct notifier_block *nb);
> > > +int lwmi_tm_notifier_call(enum thermal_mode *mode);
> >
> > This enum is not introduced earlier within this header?
>
> Hmm, no. Declaring a opaque enum earlier should be enough to fix it, as
> wmi-gamezone.h shouldn't be included here. Derek, what do you think?

I think it makes more sense at this point to move everything from
wmi_gamezone.h into wmi_helpers.h. This prevents wmi_capdata.c from
needing to import wmi_gamezone.h, since the thermal mode enum will be
moved (now used by capdata, gamezone, and other). Then the only thing
in the gamezone header would be the gamezone_events_type enum, which
is only used by gamezone and helpers anyway, so that can safely move
and we can delete the entire file. To make that enum name more generic
I'll rename it in the move from gamezone_events_type to
lwmi_event_type (the enum isn't directly referenced anywhere anyway).

If that works for everyone I'll add one more patch to do the move &
cleanup before  "platform/x86: lenovo-wmi-other: Add lwmi_attr_id()
function" where I'm adding the .._NONE thermal mode. That will keep
the purpose of each patch clean and avoid me needing to modify your
patches too much.

Thanks,
Derek.

> Thanks,
> Rong
