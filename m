Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EE1298271
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 May 2025 11:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310306; cv=none; b=MjbCK8SvF7Fgat2CgHfAxp29W06uE/RbQ/FwUgno1DkiOT2wKmEQlIwLeNQh4z0Maw5agGcrsWdc50jn2K7jrsxt0dhDsM8F0Jrjfd1GEeOLEmAAeFpDJpnVLpVqgfqoDOOhvnP7Q+3k3m2684I7cS8bTDcgdadbYCsUmIwF/wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310306; c=relaxed/simple;
	bh=zqgfsDZ4vd5ZGQRrZoNuxe5E3xLOBYweUGKekLavlmw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Y/xX279URJsXjriP/exc6dG5cSLxVrq7JwNOdiP0q2JqSFaSEwpnNe7Rgxb14SXJAhrO2TNHfwU1QTIUj6xr2lpMcd4KzMymP3axrae2EqesWxn7Q+30DtYLA0gZs5LJrvumaaa2JkAldYQ2Zeht/Ev7JL/Y0gABI38GKl6BkEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LDntw4mW; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LDntw4mW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747310305; x=1778846305;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=zqgfsDZ4vd5ZGQRrZoNuxe5E3xLOBYweUGKekLavlmw=;
  b=LDntw4mWu7GCOLQYBEAJt87gKxMesY64iD77nwtk90oIsZm52fJ4ZeS3
   yGgFxG5wxKhV7I1pJfA13HJbAJuewmgQeCeaBowo6pS4s5QwbDzEhk8ju
   T1y7QAMg+VBAqyQg1A6doeqflp4wIkE9seUQ/DagkX5pUKWUZhqKdQfGf
   TUlBIPU1dqxSpGTlAOCj6bzBtSJglpP1yHLd61Dxh4N27KGZc51wC+38H
   q19hu2AowyUeNJCxiFKDpu2fJKF+PrZs/ogcGibRHKE0aDNq2/3rPLfO8
   ILOC+tA4746DiKhURmJIc3plFLevBXiPfCxOxgA7YoP+uOM1bZkEBvrbr
   w==;
X-CSE-ConnectionGUID: 58NQ2a2LQk+2dXr4SqyIHw==
X-CSE-MsgGUID: 4WZrXQMbSz6rvVtfCyh+Og==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49225976"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="49225976"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 04:58:24 -0700
X-CSE-ConnectionGUID: FIx6PpDsQsaFxq9xLhl1PA==
X-CSE-MsgGUID: Sx+uvGXLSs2qYuaGW7pylA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="143301311"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.157])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 04:58:23 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 15 May 2025 14:58:19 +0300 (EEST)
To: Mario Limonciello <superm1@kernel.org>
cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    Hans de Goede <hdegoede@redhat.com>, 
    "open list:AMD PMF DRIVER" <platform-driver-x86@vger.kernel.org>, 
    Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v3 1/3] platform/x86/amd: pmf: Use device managed
 allocations
In-Reply-To: <ecdac8e8-cebc-45bd-a232-1b8f6fc4e029@kernel.org>
Message-ID: <e4e8846a-eb10-8be4-9f4f-7a26169140a7@linux.intel.com>
References: <20250512211154.2510397-1-superm1@kernel.org> <20250512211154.2510397-2-superm1@kernel.org> <e344db1e-6978-3e99-2c4e-13d2df0a11e0@linux.intel.com> <ecdac8e8-cebc-45bd-a232-1b8f6fc4e029@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-666466902-1747295137=:1298"
Content-ID: <a8de9a00-767e-e8fb-e9d4-0b74b8aac433@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-666466902-1747295137=:1298
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <d0dac410-81e4-ddd7-7616-47a3828f8d2a@linux.intel.com>

On Wed, 14 May 2025, Mario Limonciello wrote:
> On 5/14/2025 5:21 AM, Ilpo J=E4rvinen wrote:
> > On Mon, 12 May 2025, Mario Limonciello wrote:
> >=20
> > > From: Mario Limonciello <mario.limonciello@amd.com>
> > >=20
> > > If setting up smart PC fails for any reason then this can lead to
> > > a double free when unloading amd-pmf.  This is because dev->buf was
> > > freed but never set to NULL and is again freed in amd_pmf_remove().
> > >=20
> > > To avoid subtle allocation bugs in failures leading to a double free
> > > change all allocations into device managed allocations.
> > >=20
> > > Fixes: 5b1122fc4995f ("platform/x86/amd/pmf: fix cleanup in
> > > amd_pmf_init_smart_pc()")
> > > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > > ---
> > >   drivers/platform/x86/amd/pmf/core.c   |  3 +-
> > >   drivers/platform/x86/amd/pmf/tee-if.c | 48 +++++++++---------------=
---
> > >   2 files changed, 16 insertions(+), 35 deletions(-)
> > >=20
> > > diff --git a/drivers/platform/x86/amd/pmf/core.c
> > > b/drivers/platform/x86/amd/pmf/core.c
> > > index 96821101ec77..395c011e837f 100644
> > > --- a/drivers/platform/x86/amd/pmf/core.c
> > > +++ b/drivers/platform/x86/amd/pmf/core.c
> > > @@ -280,7 +280,7 @@ int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev=
,
> > > bool alloc_buffer)
> > >   =09=09=09dev_err(dev->dev, "Invalid CPU id: 0x%x",
> > > dev->cpu_id);
> > >   =09=09}
> > >   -=09=09dev->buf =3D kzalloc(dev->mtable_size, GFP_KERNEL);
> > > +=09=09dev->buf =3D devm_kzalloc(dev->dev, dev->mtable_size,
> > > GFP_KERNEL);
> > >   =09=09if (!dev->buf)
> > >   =09=09=09return -ENOMEM;
> > >   =09}
> > > @@ -493,7 +493,6 @@ static void amd_pmf_remove(struct platform_device
> > > *pdev)
> > >   =09mutex_destroy(&dev->lock);
> > >   =09mutex_destroy(&dev->update_mutex);
> > >   =09mutex_destroy(&dev->cb_mutex);
> > > -=09kfree(dev->buf);
> > >   }
> > >     static const struct attribute_group *amd_pmf_driver_groups[] =3D =
{
> > > diff --git a/drivers/platform/x86/amd/pmf/tee-if.c
> > > b/drivers/platform/x86/amd/pmf/tee-if.c
> > > index d3bd12ad036a..513dbbe3f214 100644
> > > --- a/drivers/platform/x86/amd/pmf/tee-if.c
> > > +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> > > @@ -362,26 +362,20 @@ static ssize_t amd_pmf_get_pb_data(struct file
> > > *filp, const char __user *buf,
> > >   =09if (IS_ERR(new_policy_buf))
> > >   =09=09return PTR_ERR(new_policy_buf);
> > >   -=09kfree(dev->policy_buf);
> > > -=09dev->policy_buf =3D new_policy_buf;
> > > +=09devm_kfree(dev->dev, dev->policy_buf);
> > > +=09dev->policy_buf =3D devm_kmemdup(dev->dev, new_policy_buf,
> > > dev->policy_sz, GFP_KERNEL);
> >=20
> > So now there are two memdups??=20
>=20
> Is there a safe way to do it without the double memdups that I'm missing?

Why doing it in two stages, first devm_kmalloc() then copy from user,=20
wouldn't be safe?

> I didn't see a helper for device managed memory to copy from user like
> memdup_user() does.

There seemingly isn't. I'm not sure how common use case this is as devm is=
=20
typically an init thing, not something called from fops, so it might not=20
be worth adding devm_kmemdup_user() for this. But I haven't looked if=20
there are other cases in the kernel sources that could use it (it's not
a one-liner with grep and both patterns are extremely frequent, maybe=20
coccinelle could find the relevant ones easily if there are others in=20
case you want to look).

> > And there's no error handling either?!
>=20
> Whoops; will fix.
>=20
> >=20
> > >   =09dev->policy_sz =3D length;
> > > +=09kfree(new_policy_buf);
> > >   -=09if (!amd_pmf_pb_valid(dev)) {
> > > -=09=09ret =3D -EINVAL;
> > > -=09=09goto cleanup;
> > > -=09}
> > > +=09if (!amd_pmf_pb_valid(dev))
> >=20
> > Due to lack of error handling, this can deref NULL.
> >=20
> > > +=09=09return -EINVAL;
> > >     =09amd_pmf_hex_dump_pb(dev);
> > >   =09ret =3D amd_pmf_start_policy_engine(dev);
> > >   =09if (ret < 0)
> > > -=09=09goto cleanup;
> > > +=09=09return ret;
> > >     =09return length;
> > > -
> > > -cleanup:
> > > -=09kfree(dev->policy_buf);
> > > -=09dev->policy_buf =3D NULL;
> > > -=09return ret;
> > >   }
> > >     static const struct file_operations pb_fops =3D {
> > > @@ -532,13 +526,13 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *d=
ev)
> > >   =09dev->policy_base =3D devm_ioremap_resource(dev->dev, dev->res);
> > >   =09if (IS_ERR(dev->policy_base)) {
> > >   =09=09ret =3D PTR_ERR(dev->policy_base);
> > > -=09=09goto err_free_dram_buf;
> > > +=09=09goto err_cancel_work;
> > >   =09}
> > >   -=09dev->policy_buf =3D kzalloc(dev->policy_sz, GFP_KERNEL);
> > > +=09dev->policy_buf =3D devm_kzalloc(dev->dev, dev->policy_sz, GFP_KE=
RNEL);
> > >   =09if (!dev->policy_buf) {
> > >   =09=09ret =3D -ENOMEM;
> > > -=09=09goto err_free_dram_buf;
> > > +=09=09goto err_cancel_work;
> > >   =09}
> > >     =09memcpy_fromio(dev->policy_buf, dev->policy_base,
> > > dev->policy_sz);
> > > @@ -546,21 +540,21 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *d=
ev)
> > >   =09if (!amd_pmf_pb_valid(dev)) {
> > >   =09=09dev_info(dev->dev, "No Smart PC policy present\n");
> > >   =09=09ret =3D -EINVAL;
> > > -=09=09goto err_free_policy;
> > > +=09=09goto err_cancel_work;
> > >   =09}
> > >     =09amd_pmf_hex_dump_pb(dev);
> > >   -=09dev->prev_data =3D kzalloc(sizeof(*dev->prev_data), GFP_KERNEL)=
;
> > > +=09dev->prev_data =3D devm_kzalloc(dev->dev, sizeof(*dev->prev_data)=
,
> > > GFP_KERNEL);
> > >   =09if (!dev->prev_data) {
> > >   =09=09ret =3D -ENOMEM;
> > > -=09=09goto err_free_policy;
> > > +=09=09goto err_cancel_work;
> > >   =09}
> > >     =09for (i =3D 0; i < ARRAY_SIZE(amd_pmf_ta_uuid); i++) {
> > >   =09=09ret =3D amd_pmf_tee_init(dev, &amd_pmf_ta_uuid[i]);
> > >   =09=09if (ret)
> > > -=09=09=09goto err_free_prev_data;
> > > +=09=09=09goto err_cancel_work;
> > >     =09=09ret =3D amd_pmf_start_policy_engine(dev);
> > >   =09=09switch (ret) {
> > > @@ -575,7 +569,7 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev=
)
> > >   =09=09default:
> > >   =09=09=09ret =3D -EINVAL;
> > >   =09=09=09amd_pmf_tee_deinit(dev);
> > > -=09=09=09goto err_free_prev_data;
> > > +=09=09=09goto err_cancel_work;
> > >   =09=09}
> > >     =09=09if (status)
> > > @@ -584,7 +578,7 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev=
)
> > >     =09if (!status && !pb_side_load) {
> > >   =09=09ret =3D -EINVAL;
> > > -=09=09goto err_free_prev_data;
> > > +=09=09goto err_cancel_work;
> > >   =09}
> > >     =09if (pb_side_load)
> > > @@ -600,12 +594,6 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *de=
v)
> > >   =09if (pb_side_load && dev->esbin)
> > >   =09=09amd_pmf_remove_pb(dev);
> > >   =09amd_pmf_tee_deinit(dev);
> > > -err_free_prev_data:
> > > -=09kfree(dev->prev_data);
> > > -err_free_policy:
> > > -=09kfree(dev->policy_buf);
> > > -err_free_dram_buf:
> > > -=09kfree(dev->buf);
> > >   err_cancel_work:
> > >   =09cancel_delayed_work_sync(&dev->pb_work);
> > >   @@ -621,11 +609,5 @@ void amd_pmf_deinit_smart_pc(struct amd_pmf_de=
v
> > > *dev)
> > >   =09=09amd_pmf_remove_pb(dev);
> > >     =09cancel_delayed_work_sync(&dev->pb_work);
> > > -=09kfree(dev->prev_data);
> > > -=09dev->prev_data =3D NULL;
> > > -=09kfree(dev->policy_buf);
> > > -=09dev->policy_buf =3D NULL;
> > > -=09kfree(dev->buf);
> > > -=09dev->buf =3D NULL;
> > >   =09amd_pmf_tee_deinit(dev);
> > >   }
> > >=20
> >=20
>=20

--=20
 i.
--8323328-666466902-1747295137=:1298--
