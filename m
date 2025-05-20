Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C0C25229C
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 May 2025 15:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747754364; cv=none; b=mtQaI/5Uk3zZstbgEXVss+ZzgfUr68+Dgd6ZMovWqtw+2NROd6ukuGBZqI+s/mSUEdSxnEcyXWJO3vPXMaDdJ73ATls+Kp+of4k1WBMFNzLsyCc+kIwxVSCLUcd+0VEm9/Qm7W8x4C9/PdILpcpKcTN2kb3mq73d2Z3XEq2/1TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747754364; c=relaxed/simple;
	bh=EvvHTHztSk0aCl4YqdnSmfwLQi7f2MTi8t+pXv5vxlM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=AB2LPWlQEO8GxEczkZisxrGgybpUF3D2Ly+jTnoKyxzXbW/pF0bPJTitrCkD7nd0R/JsYOYXErlCUww1P64qHptlzGU7/dkYIz1XE7u3uYQabANcYdV2SD8UJsnisj+VMGPXjIdOUpyH6f+KQAVRjYIn3jwiySTiusBZAcJlI7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JtYFx5/D; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JtYFx5/D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747754363; x=1779290363;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=EvvHTHztSk0aCl4YqdnSmfwLQi7f2MTi8t+pXv5vxlM=;
  b=JtYFx5/DoS3syHOmrXevhyIPLshCHCJEcg5HzZqz0PBD+8/ZaUjiE5Nq
   7sA2mP/AK3SBTyk5PBX3nu+iThiw+vRk0kuJvUAwW42rUMgwFu1JZZ1zD
   oau9pifruiTb7Kn5T1RjSfMY0cGu6cJkhGQTqShJC8wbFUM5cF4/CJ5KO
   eR+2rIyk4K7tw1P7rEqhQRas/aOYk6/SZDSJbC8+2tlVvF2TkzIt8VR3S
   9LhdAAfRg+yU5vvAudyD0C6px2HS6V+DL6XxKDD9qBdQuRTzoHVI+DdLE
   G2Npk5cH4DHZBntNlHMbgRfxsolwK/sFOsj56g1H1n6zSwZCLc4B5yBE7
   w==;
X-CSE-ConnectionGUID: qWKeAocJQMSLZxmzp9eljg==
X-CSE-MsgGUID: 3SmcDVQKQT2KWhpKsE6VxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="53362023"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="53362023"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 08:19:22 -0700
X-CSE-ConnectionGUID: ROJvCUXfSA2ci1qVPiJxLQ==
X-CSE-MsgGUID: eh20hB6lRoORZTge5by7jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="144859446"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 08:19:20 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 May 2025 18:19:17 +0300 (EEST)
To: Mario Limonciello <superm1@kernel.org>
cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    Hans de Goede <hdegoede@redhat.com>, 
    "open list:AMD PMF DRIVER" <platform-driver-x86@vger.kernel.org>, 
    Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v4 1/3] platform/x86/amd: pmf: Use device managed
 allocations
In-Reply-To: <82933030-59fe-436f-a43e-934f00c20bfa@kernel.org>
Message-ID: <98c29162-be08-b1ee-4ab0-43c77b17bc1a@linux.intel.com>
References: <20250515162351.2111468-1-superm1@kernel.org> <20250515162351.2111468-2-superm1@kernel.org> <4570e60a-c313-56ac-d85b-072aa3395ec2@linux.intel.com> <45179f82-f423-4093-a748-9411b983b57f@kernel.org> <83097abc-0adb-f916-4d10-672f0ec3d41e@linux.intel.com>
 <82933030-59fe-436f-a43e-934f00c20bfa@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-2037354445-1747754357=:936"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2037354445-1747754357=:936
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 16 May 2025, Mario Limonciello wrote:

> On 5/16/2025 1:36 AM, Ilpo J=C3=A4rvinen wrote:
> > On Fri, 16 May 2025, Mario Limonciello wrote:
> > > On 5/16/25 01:04, Ilpo J=C3=A4rvinen wrote:
> > > > On Thu, 15 May 2025, Mario Limonciello wrote:
> > > >=20
> > > > > From: Mario Limonciello <mario.limonciello@amd.com>
> > > > >=20
> > > > > If setting up smart PC fails for any reason then this can lead to
> > > > > a double free when unloading amd-pmf.  This is because dev->buf w=
as
> > > > > freed but never set to NULL and is again freed in amd_pmf_remove(=
).
> > > > >=20
> > > > > To avoid subtle allocation bugs in failures leading to a double f=
ree
> > > > > change all allocations into device managed allocations.
> > > > >=20
> > > > > Fixes: 5b1122fc4995f ("platform/x86/amd/pmf: fix cleanup in
> > > > > amd_pmf_init_smart_pc()")
> > > > > Link:
> > > > > https://lore.kernel.org/r/20250512211154.2510397-2-superm1@kernel=
=2Eorg
> > > > > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > > > > ---
> > > > > v4:
> > > > >    * Handle failures from memory allocation on sideload (Ilpo)
> > > > >    * Allocate memory before copying from user (Ilpo)
> > > > > ---
> > > > >    drivers/platform/x86/amd/pmf/core.c   |  3 +-
> > > > >    drivers/platform/x86/amd/pmf/tee-if.c | 58
> > > > > +++++++++------------------
> > > > >    2 files changed, 20 insertions(+), 41 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/platform/x86/amd/pmf/core.c
> > > > > b/drivers/platform/x86/amd/pmf/core.c
> > > > > index 96821101ec773..395c011e837f1 100644
> > > > > --- a/drivers/platform/x86/amd/pmf/core.c
> > > > > +++ b/drivers/platform/x86/amd/pmf/core.c
> > > > > @@ -280,7 +280,7 @@ int amd_pmf_set_dram_addr(struct amd_pmf_dev =
*dev,
> > > > > bool alloc_buffer)
> > > > >    =09=09=09dev_err(dev->dev, "Invalid CPU id: 0x%x",
> > > > > dev->cpu_id);
> > > > >    =09=09}
> > > > >    -=09=09dev->buf =3D kzalloc(dev->mtable_size, GFP_KERNEL);
> > > > > +=09=09dev->buf =3D devm_kzalloc(dev->dev, dev->mtable_size,
> > > > > GFP_KERNEL);
> > > > >    =09=09if (!dev->buf)
> > > > >    =09=09=09return -ENOMEM;
> > > > >    =09}
> > > > > @@ -493,7 +493,6 @@ static void amd_pmf_remove(struct platform_de=
vice
> > > > > *pdev)
> > > > >    =09mutex_destroy(&dev->lock);
> > > > >    =09mutex_destroy(&dev->update_mutex);
> > > > >    =09mutex_destroy(&dev->cb_mutex);
> > > > > -=09kfree(dev->buf);
> > > > >    }
> > > > >      static const struct attribute_group *amd_pmf_driver_groups[]=
 =3D {
> > > > > diff --git a/drivers/platform/x86/amd/pmf/tee-if.c
> > > > > b/drivers/platform/x86/amd/pmf/tee-if.c
> > > > > index d3bd12ad036ae..6d85601812225 100644
> > > > > --- a/drivers/platform/x86/amd/pmf/tee-if.c
> > > > > +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> > > > > @@ -350,38 +350,30 @@ static ssize_t amd_pmf_get_pb_data(struct f=
ile
> > > > > *filp, const char __user *buf,
> > > > >    =09=09=09=09   size_t length, loff_t *pos)
> > > > >    {
> > > > >    =09struct amd_pmf_dev *dev =3D filp->private_data;
> > > > > -=09unsigned char *new_policy_buf;
> > > > >    =09int ret;
> > > > >      =09/* Policy binary size cannot exceed POLICY_BUF_MAX_SZ */
> > > > >    =09if (length > POLICY_BUF_MAX_SZ || length =3D=3D 0)
> > > > >    =09=09return -EINVAL;
> > > > >    -=09/* re-alloc to the new buffer length of the policy binary =
*/
> > > > > -=09new_policy_buf =3D memdup_user(buf, length);
> > > > > -=09if (IS_ERR(new_policy_buf))
> > > > > -=09=09return PTR_ERR(new_policy_buf);
> > > > > -
> > > > > -=09kfree(dev->policy_buf);
> > > > > -=09dev->policy_buf =3D new_policy_buf;
> > > > > +=09devm_kfree(dev->dev, dev->policy_buf);
> > > > > +=09dev->policy_buf =3D devm_kzalloc(dev->dev, length, GFP_KERNEL=
);
> > > > > +=09if (IS_ERR(dev->policy_buf))
> > > > > +=09=09return -ENOMEM;
> > > > >    =09dev->policy_sz =3D length;
> > > > >    -=09if (!amd_pmf_pb_valid(dev)) {
> > > > > -=09=09ret =3D -EINVAL;
> > > > > -=09=09goto cleanup;
> > > > > -=09}
> > > > > +=09if (copy_from_user(dev->policy_buf, buf, length))
> > > > > +=09=09return -EFAULT;
> > > >=20
> > > > Previously, if anything failed here, the old buffer was left in pla=
ce.
> > > > I always assumed it was intentional. But after your change, first t=
hing
> > > > that happens is freeing the old policy_buf.
> > >=20
> > > Yeah; in order to do devm without a double malloc it needs to be clea=
red
> > > immediately.
> >=20
> > I'm feeling like I must be missing something here, but I just fail to s=
ee
> > why the order _has to be_ changed when changing kfree() -> devm_kfree()=
=2E
>=20
> Because the policy is coming in from userspace and you need to have somew=
here
> that is the right size to copy it to.
>=20
> As you mentioned wanting to remove the double malloc in the earlier versi=
on
> this is the way to do it.
>=20
> IE when using copy_from_user() instead of memdup_user() the memory must
> "already" be allocated.  That's what is done now with devm_kzalloc().

Hi Mario,

Why can't you do:

=09/* re-alloc to the new buffer length of the policy binary */
=09new_policy_buf =3D devm_kzalloc(dev->dev, length, GFP_KERNEL);
=09if (!new_policy_buf)
=09=09return -ENOMEM;

=09if (copy_from_user(new_policy_buf, buf, length)) {
=09=09devm_kfree(new_policy_buf);
=09=09return -EFAULT;
=09}

=09devm_kfree(dev->policy_buf);
=09ev->policy_buf =3D new_policy_buf;

?

That follows pretty much what the old code did with new_policy_buf=20
variable, but allocation related calls are now devm_*().

> Are you suggesting some sort of way to keep it in the same order and subv=
ert
> device managed allocations and "steal" the pointer?  Glib has a concept l=
ike
> this, but I wasn't aware of a way to do in the kernel.
>=20
> >=20
> > > But this is a debugfs sideloading interface.  If you send a bad
> > > binary you can just try again with a good one.
> > >=20
> > > >=20
> > > > We're long past the point where I've started to lose confidence in =
this
> > > > patch :-(. Could we like just make the minimal changes here to conv=
ert
> > > > into devm_*() and nothing more? If you want to make any other chang=
es,
> > > > be
> > > > it reordering logic, removal of the local variable, or whatever, pl=
ease
> > > > put those into own patch(es) and properly justify them.
> > > >=20
> > >=20
> > > If we're aiming for a total minimal patch that just fixes the most
> > > immediate
> > > issue that's v1 of this series [1].
> >=20
> > As spelled out very clearly in the above comment, I'm aiming to a patch
> > which converts this to devm_*() without other changes. If you want to d=
o
> > other changes, they should be in their own patch.
>=20
> I guess if there's a way to do this without changing the order I will do =
it,
> but I don't see one RN.


--=20
 i.

--8323328-2037354445-1747754357=:936--
