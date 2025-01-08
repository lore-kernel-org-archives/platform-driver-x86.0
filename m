Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E88194A6B;
	Wed,  8 Jan 2025 09:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736329044; cv=none; b=i+mzKqlOENMfZZnNASx+5/Q5wTbKsgxd/32wiChsL2GdjxGKgZVesn0PN5xIQzD+qtKmKvS81c4NxN0l17TpizORM0vvL5x2xOxcX/g8kyPVgwKlpztvpgNpQmQ+95qjLunfg8d4ftuo6KbZ2pPw0G8h5q+fg0d437EIQpE7psE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736329044; c=relaxed/simple;
	bh=4yX6WkLrA/zkhyFpNjqD/1hXJ5fy5zSQ8FVukTiwn3Y=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XmrmlyqDge7NCBoc6KmmyrRxwUbKb5ZyDSjP7ERKiJ2cxcuFQYBttfq6BgPpb1sV+FUe2fyVxw3iDgJtQokEUy8Vf/d3BkYqky1ooBViCQLxFXwqSV42+SdIpo/HdNLxnbP3WD/iMS5BLtyx2V/665tVLDzyrrJDQI3Xn4dQ8sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aLk8a0zb; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aLk8a0zb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736329042; x=1767865042;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=4yX6WkLrA/zkhyFpNjqD/1hXJ5fy5zSQ8FVukTiwn3Y=;
  b=aLk8a0zbchv4jcrwAVoqrM/SasnZtBM9pCDJ4Jf48Q1y+91jvAMTbj7h
   v5QQuVnhpZ3e7ksJckn/96mVRU5nqehJ45ZUv08wOw8mjxrSGJXQyoryP
   TPVz0A6QLl5t0cMNovP7uYcG8T89dXH1CNpcv5papoHIkYrLU7ydwI6P+
   thjUCIoIMiulmPmlum1OQWGXYiZhMuFcAiNMXRu+0fa9S0HK1EBQO8GYT
   diJ+HyUoE23egX5rojL2GR3OJJVl7ne4D5QbuynE9QNBiJIqfPKPdAakX
   GLp/nqDW27Sb2IAn/OEVE7I3qbnqEP+NUWHd2VxZO5npnfGc2fzZrK0jX
   w==;
X-CSE-ConnectionGUID: tvgoalWZQCSsZ+h0qXi+Qg==
X-CSE-MsgGUID: GcCkMipST3iOfz2Tzkt+Og==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="59010771"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="59010771"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 01:37:14 -0800
X-CSE-ConnectionGUID: WhTAuBsWQS283loDZRsd2Q==
X-CSE-MsgGUID: ws95QPgKQ4SfNY8eQc+ZnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="107912940"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.87])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 01:37:10 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 8 Jan 2025 11:37:07 +0200 (EET)
To: Derek John Clark <derekjohn.clark@gmail.com>
cc: Mario Limonciello <superm1@kernel.org>, 
    Hans de Goede <hdegoede@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
    Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>, 
    Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, 
    "Cody T . -H . Chiu" <codyit@gmail.com>, 
    John Martens <johnfanv2@gmail.com>, platform-driver-x86@vger.kernel.org, 
    linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/4] platform/x86: Add Lenovo Other Mode WMI Driver
In-Reply-To: <CAFqHKTnJwpgABhkGH6Z=AFC5=YzMLPb7qzX5p-V+tHzsW6RHOg@mail.gmail.com>
Message-ID: <b76e4a39-3386-4540-d775-813624af34d1@linux.intel.com>
References: <20250102004854.14874-1-derekjohn.clark@gmail.com> <20250102004854.14874-5-derekjohn.clark@gmail.com> <8620c791-4cf0-44fe-9869-18be4baed465@kernel.org> <CAFqHKTmd12wZdCK_-+SbGNdvwzXTawmu9ob3_k1cHoy0XBVS-Q@mail.gmail.com>
 <5914557f-ba32-825a-a483-8ffe0311a61f@linux.intel.com> <CAFqHKTnJwpgABhkGH6Z=AFC5=YzMLPb7qzX5p-V+tHzsW6RHOg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-207786947-1736329027=:1082"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-207786947-1736329027=:1082
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 7 Jan 2025, Derek John Clark wrote:
> On Tue, Jan 7, 2025 at 10:21=E2=80=AFAM Ilpo J=C3=A4rvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> >
> > On Thu, 2 Jan 2025, Derek John Clark wrote:
> > > On Wed, Jan 1, 2025 at 7:40=E2=80=AFPM Mario Limonciello <superm1@ker=
nel.org> wrote:
> > > > On 1/1/25 18:47, Derek J. Clark wrote:
> > > > > Adds lenovo-wmi-other.c which provides a driver for the Lenovo
> > > > > "Other Mode" WMI interface that comes on some Lenovo "Gaming
> > > > > Series" hardware. Provides a firmware-attributes class which
> > > > > enables the use of tunable knobs for SPL, SPPT, and FPPT.
> > > > >
> > > > > v2:
> > > > > - Use devm_kzalloc to ensure driver can be instanced, remove glob=
al
> > > > >    reference.
> > > > > - Ensure reverse Christmas tree for all variable declarations.
> > > > > - Remove extra whitespace.
> > > > > - Use guard(mutex) in all mutex instances, global mutex.
> > > > > - Use pr_fmt instead of adding the driver name to each pr_err.
> > > > > - Remove noisy pr_info usage.
> > > > > - Rename other_method_wmi to lenovo_wmi_om_priv and om_wmi to pri=
v.
> > > > > - Use list to get the lenovo_wmi_om_priv instance in some macro
> > > > >    called functions as the data provided by the macros that use i=
t
> > > > >    doesn't pass a member of the struct for use in container_of.
> > > > > - Do not rely on GameZone interface to grab the current fan mode.
> > > > >
> > > > > Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>


> > > > > +static int other_method_fw_attr_add(struct lenovo_wmi_om_priv *p=
riv)
> > > > > +{
> > > > > +     int err, i;
> > > > > +
> > > > > +     err =3D fw_attributes_class_get(&fw_attr_class);
> > > > > +     if (err) {
> > > > > +             pr_err("Failed to get firmware_attributes_class: %u=
\n", err);
> > > > > +             return err;
> > > > > +     }
> > > > > +
> > > > > +     priv->fw_attr_dev =3D device_create(fw_attr_class, NULL, MK=
DEV(0, 0),
> > > > > +                                       NULL, "%s", FW_ATTR_FOLDE=
R);
> > > > > +     if (IS_ERR(priv->fw_attr_dev)) {
> > > > > +             err =3D PTR_ERR(priv->fw_attr_dev);
> > > > > +             pr_err("Failed to create firmware_attributes_class =
device: %u\n",
> > > > > +                    err);
> > > > > +             goto fail_class_get;
> > > > > +     }
> > > > > +
> > > > > +     priv->fw_attr_kset =3D kset_create_and_add("attributes", NU=
LL,
> > > > > +                                              &priv->fw_attr_dev=
->kobj);
> > > > > +     if (!priv->fw_attr_kset) {
> > > > > +             err =3D -ENOMEM;
> > > > > +             pr_err("Failed to create firmware_attributes_class =
kset: %u\n",
> > > > > +                    err);
> > > > > +             goto err_destroy_classdev;
> > > > > +     }
> > > > > +
> > > > > +     for (i =3D 0; i < ARRAY_SIZE(capdata01_attr_groups) - 1; i+=
+) {
> > > > > +             err =3D attr_capdata01_setup(
> > > > > +                     capdata01_attr_groups[i].tunable_attr);
> > > > > +             if (err) {
> > > > > +                     pr_err("Failed to populate capability data =
for %s: %u\n",
> > > > > +                            capdata01_attr_groups[i].attr_group-=
>name, err);
> > > >
> > > > This specific error could be a bit noisy because it's a dependency =
on
> > > > the other driver in case one attribute returns not supported.
> > > >
> > > > Could you instead detect EOPNOTSUPP specifically and only show erro=
r if
> > > > not EOPNOTSUPP?
> > > >
> > >
> > > Easy fix, will do. I'll also add a wmi_dev_exists() here before the
> > > loop to exit early.
> > >
> > > > > +                     continue;
> > > > > +             }
> > > > > +
> > > > > +             err =3D sysfs_create_group(&priv->fw_attr_kset->kob=
j,
> > > > > +                                      capdata01_attr_groups[i].a=
ttr_group);
> > > > > +             if (err) {
> > > > > +                     pr_err("Failed to create sysfs-group for %s=
: %u\n",
> > > > > +                            capdata01_attr_groups[i].attr_group-=
>name, err);
> > > > > +                     goto err_remove_groups;
> > > > > +             }
> > > > > +     }
> > > > > +
> > > > > +     return 0;
> > > > > +
> > > > > +err_remove_groups:
> > > > > +     while (i-- > 0) {
> > > > > +             sysfs_remove_group(&priv->fw_attr_kset->kobj,
> > > > > +                                capdata01_attr_groups[i].attr_gr=
oup);
> > > > > +     }
> > > > > +
> > > > > +     return err;
> > > > > +
> > > > > +err_destroy_classdev:
> > > > > +     device_destroy(fw_attr_class, MKDEV(0, 0));
> > > > > +
> > > > > +     return err;
> > > > > +
> > > > > +fail_class_get:
> > > > > +     fw_attributes_class_put();
> > > > > +
> > > > > +     return err;
> >
> > I highly suspect the intermediate return errs in the previous labels wi=
ll
> > cause leaks. Don't you want to rollback everything on error?
>=20
> To clarify, you mean remove the returns in each fail case before
> fail_class_get so they will fall through? That would make more sense,
> yeah.

Yes, the returns before the fail_class_get label and before the=20
err_destroy_classdev label.

Both seemed to break the usual rollback pattern and it looked to me when
I tracked the callchains an error here will lead to a probe failure so I'd=
=20
expect you want to rollback everything in case of an error, not just the=20
latest step. (In some cases probe is allowed to succeed partially but I=20
didn't see any indication of that here.)

--=20
 i.

--8323328-207786947-1736329027=:1082--
