Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED80C20F085
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jan 2025 13:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737638678; cv=none; b=d549ELTKOdjdjJB5vpScdLlgPt0cI6rKHAId5RevfwU6amAVtEEuyOl+ymdHxyKYw/pYieI+GKAd/ClqZklUmWT3+LLKn+hCwAvppTxFMpewIoLGfOsD8xBC/LXXfEwQoY6KY9dMn5YDDbTo/rkXXGuhSFr4ZNN+hT3ONQZ5IH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737638678; c=relaxed/simple;
	bh=pHZI8SqJ7nruyjj5gex/Pw13wuku1HFLXU0de56Q9pI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ry1kIMSvAF7uvH2n4iJT2mQEsoI/dkbnDW06YU1DVB1ALSd/xNQtbIuEKE8ttyhxU2/9eKMA0nnlCtxUg+LLEVLx+FnQs74y941ImcJdM3E5OxhgMvEuW9Z/3o7CWCAcxzPf93Dee+63W3RDrLFiuhDBAuWFo5i47VDx64H7qvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I4+uijXp; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I4+uijXp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737638677; x=1769174677;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=pHZI8SqJ7nruyjj5gex/Pw13wuku1HFLXU0de56Q9pI=;
  b=I4+uijXpexyDVXms1JAKeqV5iZcwA/SjLgyJv3kkEHrOWDUXy3bzEYSI
   3x9v/1kdl6o8FmvQFCstTcINgOvlTcD9ErGY04g87xTG31RpsvvC0CVqt
   vQ05heCyU+Jnsr6KQ0MC6T9oX1w200Ty2b/kc/KeFBvHvP7QiFNZTTJ+6
   b3cTuFqPtvVWoETjpNWPOmNdjXjJ9axK6Hv7AT62gSE3RaLc/CqR2Ax8l
   jcp8Nh/t077w4bsmAPLXviAVtPD+x3OigEVcuH+egzEwplOujCXEV/lH+
   j4Kqn/WcVOfGJULflUh7tm5U2itbQvYBefAMdepsle90j+RXJ18njzeLO
   g==;
X-CSE-ConnectionGUID: uAhEuTJNQg+hiIDpwSc0tA==
X-CSE-MsgGUID: uqQ4lB0vRxKb6fP1ilMMqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="48725424"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="48725424"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 05:24:12 -0800
X-CSE-ConnectionGUID: r6+GlQ0MQXyKMfXUNQejmQ==
X-CSE-MsgGUID: 9B4FLxvRQRGyRgAWJLK2Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108327594"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.22])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 05:24:09 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 23 Jan 2025 15:24:05 +0200 (EET)
To: Vadim Pasternak <vadimp@nvidia.com>
cc: Hans de Goede <hdegoede@redhat.com>, Michael Shych <michaelsh@nvidia.com>, 
    Ciju Rajan K <crajank@nvidia.com>, Felix Radensky <fradensky@nvidia.com>, 
    Oleksandr Shamray <oleksandrs@nvidia.com>, 
    "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH v3 06/10] platform/mellanox: mlxreg-dpu: Add initial
 support for Nvidia DPU
In-Reply-To: <PH7PR12MB6668C4BE1A84ACDA230863F3AFE02@PH7PR12MB6668.namprd12.prod.outlook.com>
Message-ID: <6f3db7af-2a5a-5def-cf60-72be03f73653@linux.intel.com>
References: <20250116075919.34270-1-vadimp@nvidia.com> <20250116075919.34270-7-vadimp@nvidia.com> <908880b1-88e6-de66-c55f-af08c682603f@linux.intel.com> <PH7PR12MB6668C4BE1A84ACDA230863F3AFE02@PH7PR12MB6668.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-690957184-1737636161=:1068"
Content-ID: <8a172cf9-54e4-a87f-3e05-6e0d65e1cb69@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-690957184-1737636161=:1068
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <d801bcc9-da3c-3910-fdb0-9e55e279d66c@linux.intel.com>

On Thu, 23 Jan 2025, Vadim Pasternak wrote:

> Hi Ilpo!
>=20
> > -----Original Message-----
> > From: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> > Sent: Friday, 17 January 2025 18:59
> > To: Vadim Pasternak <vadimp@nvidia.com>
> > Cc: Hans de Goede <hdegoede@redhat.com>; Michael Shych
> > <michaelsh@nvidia.com>; Ciju Rajan K <crajank@nvidia.com>; Felix Radens=
ky
> > <fradensky@nvidia.com>; Oleksandr Shamray <oleksandrs@nvidia.com>;
> > platform-driver-x86@vger.kernel.org
> > Subject: Re: [PATCH v3 06/10] platform/mellanox: mlxreg-dpu: Add initia=
l
> > support for Nvidia DPU
> >=20
> > On Thu, 16 Jan 2025, Vadim Pasternak wrote:
> >=20
> > > Provide platform support for Nvidia (DPU) Data Processor Unit for the
> > > Smart Switch SN4280.
> > >
> > > The Smart Switch equipped with:
> > > - Nvidia COME module based on AMD EPYC=E2=84=A2 Embedded 3451 CPU.
> > > - Nvidia Spectrum-3 ASIC.
> > > - Four DPUs, each equipped with Nvidia BF3 ARM based processor and
> > >   with Lattice LFD2NX-40 FPGA device.
> > > - 28xQSFP-DD external ports.
> > > - Two power supplies.
> > > - Four cooling drawers.
> > >
> > > Drivers provides support for the platform management and monitoring o=
f
> > > DPU components.
> > > It includes support for health events, resets and boot progress
> > > indications logic, implemented by FPGA device.
> > >
> > > Reviewed-by: Ciju Rajan K <crajank@nvidia.com>
> > > Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> > > ---
> > > Comments pointed out by Ilpo:
> > > - Fix s/pltaform/platform.
> > > - Remove semicolon from structure description.
> > > - In routine mlxreg_dpu_copy_hotplug_data() use 'const struct' for th=
e
> > >   third argument.
> > > - In mlxreg_dpu_copy_hotplug_data() remove redunadant
> > devm_kmemdup()
> > >   call.
> > > - Fix identifications in mlxreg_dpu_config_init().
> > > - Remove label 'fail_register_io" from error flow.
> > > - One line for devm_regmap_init_i2c() call in mlxreg_dpu_probe().
> > > ---
> > >  drivers/platform/mellanox/Kconfig      |  12 +
> > >  drivers/platform/mellanox/Makefile     |   1 +
> > >  drivers/platform/mellanox/mlxreg-dpu.c | 615
> > > +++++++++++++++++++++++++
> > >  3 files changed, 628 insertions(+)
> > >  create mode 100644 drivers/platform/mellanox/mlxreg-dpu.c


> > > +static int
> > > +mlxreg_dpu_copy_hotplug_data(struct device *dev, struct mlxreg_dpu
> > *mlxreg_dpu,
> > > +=09=09=09     const struct mlxreg_core_hotplug_platform_data
> > *hotplug_data)
> > > +{
> > > +=09struct mlxreg_core_item *item;
> > > +=09int i;
> > > +
> > > +=09mlxreg_dpu->hotplug_data =3D devm_kmemdup(dev, hotplug_data,
> > > +=09=09=09=09=09=09sizeof(*mlxreg_dpu-
> > >hotplug_data), GFP_KERNEL);
> > > +=09if (!mlxreg_dpu->hotplug_data)
> > > +=09=09return -ENOMEM;
> > > +
> > > +=09item =3D mlxreg_dpu->hotplug_data->items;
> > > +=09for (i =3D 0; i < mlxreg_dpu->hotplug_data->counter; i++, item++)=
 {
> >=20
> > This still has the same issue wrt. what is assigned to item. The item r=
elated
> > code on the two lines above this point do nothing because the variable'=
s value
> > will be overwritten by this:
> >=20
> > > +=09=09item =3D devm_kmemdup(dev, &hotplug_data->items[i],
> > sizeof(*item),
> > > +GFP_KERNEL);
> >=20
> > What is the intent here? The allocated item will be left dangling, only=
 thing that
> > holds pointer to it after this iteration complets is the devm machinery=
, is that
> > the intention here? Or did you perhaps want to put it into the ->items =
(which
> > btw is no longer allocated at all since you didn't replace the memdup w=
ith
> > kcalloc)?
> >=20
> > If you don't understand what I'm trying to tell here, please try to exp=
lain what
> > this loop does, in terms of where you want the allocated item be stored=
 into?
>=20
> Then intension was to copy 'mlxreg_dpu_default_hotplug_data' to
> 'mlxreg_dpu->hotplug_data' and then copy to this structure all
> underling fields: mlxreg_dpu_default_hotplug_data.items[i] and
> for each item 'mlxreg_dpu_default_hotplug_data.items[i.data[]'.

It is what I assumed, the patch just didn't do that correctly.

I'm bit worried about the extra pointers both the struct=20
mlxreg_core_hotplug_platform_data and mlxreg_core_data have but I assume=20
you know what you're doing and those are either NULL or filled with a=20
value that is not expected to change.

In any case, it's feels a bit heavy handed to copy the entire struct while=
=20
I suspect you'll be only altering part of the fields within them but I=20
didn't have time to track which fields are actually being changed (beyond=
=20
checking that some fields were indeed changed so it couldn't just become a=
=20
const pointer).

> I can do it with the below code:
>=20
> =09mlxreg_dpu->hotplug_data =3D devm_kmemdup(dev, hotplug_data,
> =09=09=09=09=09=09sizeof(*mlxreg_dpu->hotplug_data), GFP_KERNEL);
> =09if (!mlxreg_dpu->hotplug_data)
> =09=09return -ENOMEM;
>=20
> =09mlxreg_dpu->hotplug_data->items =3D kcalloc(hotplug_data->counter, siz=
eof(*item),
> =09=09=09=09=09=09  GFP_KERNEL);

You should use devm_* given the other is devm too.

While sizeof(*item) is not inccorect, it should be=20
sizeof(*mlxreg_dpu->hotplug_data->items) to match the destination.

Another observation that is somewhat unrelated to this patch is that=20
"counter" is probably not a very good name for the number of elements in=20
the ->items array. So I suggested additional patch renaming that to=20
"count" or "item_count".

> =09if (!mlxreg_dpu->hotplug_data->items)
> =09=09return -ENOMEM;
>=20
> =09item =3D mlxreg_dpu->hotplug_data->items;
> =09for (i =3D 0; i < hotplug_data->counter; i++, item++) {
> =09=09memcpy(item, &hotplug_data->items[i], sizeof(*item));

Yes, this makes more sense than doing item =3D devm_kmemdup(...) here!
(This line is where the main problem with your earlier submissions was.)

But thinking this more now without the extra kmemdup hindering my=20
thoughts, I think the devm_kmemdup() here (in v2) was just extra and you=20
can do it like in v2 (error handling not shown):

=09mlxreg_dpu->hotplug_data =3D devm_kmemdup(...);
=09mlxreg_dpu->hotplug_data->items =3D devm_kmemdup(...);

=09item =3D mlxreg_dpu->hotplug_data->items;
=09for (i =3D 0; i < hotplug_data->counter; i++, item++) {
=09=09/* Nothing here for item itself, item was already duplicated above */

=09=09item->data =3D devm_kmemdup(...);
=09}

This partially reverses my position I gave in the comment to v2 (back then=
=20
I wasn't yet fully following what was going on here and unsure if I=20
guessed your intent right). So, you can do devm_kmemdup() also for=20
->items; you just don't want to duplicate it again within this loop.

> =09=09item->data =3D kcalloc(hotplug_data->items[i].count, sizeof(*item->=
data),
> =09=09=09=09     GFP_KERNEL);

devm_kcalloc(), although I think this could use devm_kmemdup() as=20
mentioned above.

> =09=09if (!item->data)
> =09=09=09goto kcalloc_fail;
>=20
> =09=09data =3D item->data;
> =09=09for (j =3D 0; j < hotplug_data->items[i].count; j++, data++)
> =09=09=09memcpy(data, &hotplug_data->items[i].data[j], sizeof(*data));
> =09}
>=20
> Does it look OK?

It's better, makes sense now although I think it can be cleaned up as=20
suggested above. :-)

> > > +=09=09if (!item)
> > > +=09=09=09return -ENOMEM;
> > > +=09=09item->data =3D devm_kmemdup(dev, hotplug_data-
> > >items[i].data,
> > > +=09=09=09=09=09  hotplug_data->items[i].count *
> > sizeof(item->data),
> > > +=09=09=09=09=09  GFP_KERNEL);
> > > +=09=09if (!item->data)
> > > +=09=09=09return -ENOMEM;
> > > +=09}
> > > +
> > > +=09return 0;
> > > +}


--=20
 i.
--8323328-690957184-1737636161=:1068--
