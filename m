Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7D321D5AA
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 May 2025 15:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747755275; cv=none; b=M+PfMavwiEydNI/YD8r/UR+yuJ4bl4EyMKCiUNLMk+xarCDCMcnYxrYSv/huleldPTwuJgxv83FCw9U8HLScbWZbc1Kjn3ezjGvEdT5mKQ1vbvHIhQEqWgASi5sjaajxQhOkLijGbpvcS5DHkA6wlcsZ9+eqExAxZdlgCxmd2O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747755275; c=relaxed/simple;
	bh=U1/XQzd2dTqiM4qO33YDJL/eXEnkyFSnsG6Ov7l/VEY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=RjAW56Y68pqWr5eR+H2UOh8/hnJaEcKgoBIY/mIp78wYlpX4xhAlzqgaNy+GevNdZdVReFMIcteBoq13Eoz6WuWO8Axoi59YPOUyQHYAqcwJ8mGjQ3DyTHfB3F4OTAnBDvLBI7bnwsP+cLXexMQ2aREQujgOqe/dVMYzoazzQ6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gn5rnvm3; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gn5rnvm3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747755274; x=1779291274;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=U1/XQzd2dTqiM4qO33YDJL/eXEnkyFSnsG6Ov7l/VEY=;
  b=Gn5rnvm3A62zXMgZOX8tsz5Gbqd6NvkUyDCxd58bHjTq20RJ9DGvpsw/
   +tXOQSszwphemRBNyXwrlHnfmlfNtokWex3+BpTDo63f+G6H3TXzqyYuy
   d8Oeg5ccK5shHVdqDZG0+sATJBxfm1uEODOFZ4lR7YEMMrprv5dUlXhdD
   DknjDWr0FiN2HfetrOE/Mxu78fo3UCQ3gW3chkKgkNizXZDvyZ0TKsq8G
   T23TNOC5r2X9KiEmNjh0qXdH6BqpYemQ9+BJzkpIl/ahpLC6qQY5NOhjK
   rZ/rvsDNVWn/BT+1m7W5nFv1/hoUMlNCaGTg99zpGAUkoWHJ3uXyNy8+q
   A==;
X-CSE-ConnectionGUID: Z9jXTABKQ5SMTA5cSQxN3Q==
X-CSE-MsgGUID: MYrol/ehR6aFztUDlflovw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="60734477"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="60734477"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 08:34:33 -0700
X-CSE-ConnectionGUID: Tm41UuSOQl+5oX3FGQY+pg==
X-CSE-MsgGUID: s+9dZhUuQJuS+RKWNvdDqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="144471256"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 08:34:31 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 May 2025 18:34:28 +0300 (EEST)
To: Mario Limonciello <superm1@kernel.org>
cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    Hans de Goede <hdegoede@redhat.com>, 
    "open list:AMD PMF DRIVER" <platform-driver-x86@vger.kernel.org>, 
    Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v4 1/3] platform/x86/amd: pmf: Use device managed
 allocations
In-Reply-To: <48a625cd-b599-4905-9f4a-41199e628fdb@kernel.org>
Message-ID: <c0b5155f-c7f7-7c3d-551f-ca1c931e8f9f@linux.intel.com>
References: <20250515162351.2111468-1-superm1@kernel.org> <20250515162351.2111468-2-superm1@kernel.org> <4570e60a-c313-56ac-d85b-072aa3395ec2@linux.intel.com> <45179f82-f423-4093-a748-9411b983b57f@kernel.org> <83097abc-0adb-f916-4d10-672f0ec3d41e@linux.intel.com>
 <82933030-59fe-436f-a43e-934f00c20bfa@kernel.org> <98c29162-be08-b1ee-4ab0-43c77b17bc1a@linux.intel.com> <48a625cd-b599-4905-9f4a-41199e628fdb@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1619784704-1747755268=:936"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1619784704-1747755268=:936
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 20 May 2025, Mario Limonciello wrote:

> On 5/20/2025 10:19 AM, Ilpo J=C3=A4rvinen wrote:
> > On Fri, 16 May 2025, Mario Limonciello wrote:
> >=20
> > > On 5/16/2025 1:36 AM, Ilpo J=C3=A4rvinen wrote:
> > > > On Fri, 16 May 2025, Mario Limonciello wrote:
> > > > > On 5/16/25 01:04, Ilpo J=C3=A4rvinen wrote:
> > > > > > On Thu, 15 May 2025, Mario Limonciello wrote:
> > > > > >=20
> > > > > > > From: Mario Limonciello <mario.limonciello@amd.com>
> > > > > > >=20
> > > > > > > If setting up smart PC fails for any reason then this can lea=
d to
> > > > > > > a double free when unloading amd-pmf.  This is because dev->b=
uf
> > > > > > > was
> > > > > > > freed but never set to NULL and is again freed in
> > > > > > > amd_pmf_remove().
> > > > > > >=20
> > > > > > > To avoid subtle allocation bugs in failures leading to a doub=
le
> > > > > > > free
> > > > > > > change all allocations into device managed allocations.
> > > > > > >=20
> > > > > > > Fixes: 5b1122fc4995f ("platform/x86/amd/pmf: fix cleanup in
> > > > > > > amd_pmf_init_smart_pc()")
> > > > > > > Link:
> > > > > > > https://lore.kernel.org/r/20250512211154.2510397-2-superm1@ke=
rnel.org
> > > > > > > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > > > > > > ---
> > > > > > > v4:
> > > > > > >     * Handle failures from memory allocation on sideload (Ilp=
o)
> > > > > > >     * Allocate memory before copying from user (Ilpo)
> > > > > > > ---
> > > > > > >     drivers/platform/x86/amd/pmf/core.c   |  3 +-
> > > > > > >     drivers/platform/x86/amd/pmf/tee-if.c | 58
> > > > > > > +++++++++------------------
> > > > > > >     2 files changed, 20 insertions(+), 41 deletions(-)
> > > > > > >=20
> > > > > > > diff --git a/drivers/platform/x86/amd/pmf/core.c
> > > > > > > b/drivers/platform/x86/amd/pmf/core.c
> > > > > > > index 96821101ec773..395c011e837f1 100644
> > > > > > > --- a/drivers/platform/x86/amd/pmf/core.c
> > > > > > > +++ b/drivers/platform/x86/amd/pmf/core.c
> > > > > > > @@ -280,7 +280,7 @@ int amd_pmf_set_dram_addr(struct amd_pmf_=
dev
> > > > > > > *dev,
> > > > > > > bool alloc_buffer)
> > > > > > >     =09=09=09dev_err(dev->dev, "Invalid CPU id:
> > > > > > > 0x%x",
> > > > > > > dev->cpu_id);
> > > > > > >     =09=09}
> > > > > > >     -=09=09dev->buf =3D kzalloc(dev->mtable_size,
> > > > > > > GFP_KERNEL);
> > > > > > > +=09=09dev->buf =3D devm_kzalloc(dev->dev, dev->mtable_size,
> > > > > > > GFP_KERNEL);
> > > > > > >     =09=09if (!dev->buf)
> > > > > > >     =09=09=09return -ENOMEM;
> > > > > > >     =09}
> > > > > > > @@ -493,7 +493,6 @@ static void amd_pmf_remove(struct
> > > > > > > platform_device
> > > > > > > *pdev)
> > > > > > >     =09mutex_destroy(&dev->lock);
> > > > > > >     =09mutex_destroy(&dev->update_mutex);
> > > > > > >     =09mutex_destroy(&dev->cb_mutex);
> > > > > > > -=09kfree(dev->buf);
> > > > > > >     }
> > > > > > >       static const struct attribute_group *amd_pmf_driver_gro=
ups[]
> > > > > > > =3D {
> > > > > > > diff --git a/drivers/platform/x86/amd/pmf/tee-if.c
> > > > > > > b/drivers/platform/x86/amd/pmf/tee-if.c
> > > > > > > index d3bd12ad036ae..6d85601812225 100644
> > > > > > > --- a/drivers/platform/x86/amd/pmf/tee-if.c
> > > > > > > +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> > > > > > > @@ -350,38 +350,30 @@ static ssize_t amd_pmf_get_pb_data(stru=
ct
> > > > > > > file
> > > > > > > *filp, const char __user *buf,
> > > > > > >     =09=09=09=09   size_t length, loff_t *pos)
> > > > > > >     {
> > > > > > >     =09struct amd_pmf_dev *dev =3D filp->private_data;
> > > > > > > -=09unsigned char *new_policy_buf;
> > > > > > >     =09int ret;
> > > > > > >       =09/* Policy binary size cannot exceed POLICY_BUF_MAX_S=
Z
> > > > > > > */
> > > > > > >     =09if (length > POLICY_BUF_MAX_SZ || length =3D=3D 0)
> > > > > > >     =09=09return -EINVAL;
> > > > > > >     -=09/* re-alloc to the new buffer length of the policy
> > > > > > > binary */
> > > > > > > -=09new_policy_buf =3D memdup_user(buf, length);
> > > > > > > -=09if (IS_ERR(new_policy_buf))
> > > > > > > -=09=09return PTR_ERR(new_policy_buf);
> > > > > > > -
> > > > > > > -=09kfree(dev->policy_buf);
> > > > > > > -=09dev->policy_buf =3D new_policy_buf;
> > > > > > > +=09devm_kfree(dev->dev, dev->policy_buf);
> > > > > > > +=09dev->policy_buf =3D devm_kzalloc(dev->dev, length, GFP_KE=
RNEL);
> > > > > > > +=09if (IS_ERR(dev->policy_buf))
> > > > > > > +=09=09return -ENOMEM;
> > > > > > >     =09dev->policy_sz =3D length;
> > > > > > >     -=09if (!amd_pmf_pb_valid(dev)) {
> > > > > > > -=09=09ret =3D -EINVAL;
> > > > > > > -=09=09goto cleanup;
> > > > > > > -=09}
> > > > > > > +=09if (copy_from_user(dev->policy_buf, buf, length))
> > > > > > > +=09=09return -EFAULT;
> > > > > >=20
> > > > > > Previously, if anything failed here, the old buffer was left in
> > > > > > place.
> > > > > > I always assumed it was intentional. But after your change, fir=
st
> > > > > > thing
> > > > > > that happens is freeing the old policy_buf.
> > > > >=20
> > > > > Yeah; in order to do devm without a double malloc it needs to be
> > > > > cleared
> > > > > immediately.
> > > >=20
> > > > I'm feeling like I must be missing something here, but I just fail =
to
> > > > see
> > > > why the order _has to be_ changed when changing kfree() -> devm_kfr=
ee().
> > >=20
> > > Because the policy is coming in from userspace and you need to have
> > > somewhere
> > > that is the right size to copy it to.
> > >=20
> > > As you mentioned wanting to remove the double malloc in the earlier
> > > version
> > > this is the way to do it.
> > >=20
> > > IE when using copy_from_user() instead of memdup_user() the memory mu=
st
> > > "already" be allocated.  That's what is done now with devm_kzalloc().
> >=20
> > Hi Mario,
> >=20
> > Why can't you do:
> >=20
> > =09/* re-alloc to the new buffer length of the policy binary */
> > =09new_policy_buf =3D devm_kzalloc(dev->dev, length, GFP_KERNEL);
> > =09if (!new_policy_buf)
> > =09=09return -ENOMEM;
> >=20
> > =09if (copy_from_user(new_policy_buf, buf, length)) {
> > =09=09devm_kfree(new_policy_buf);
> > =09=09return -EFAULT;
> > =09}
> >=20
> > =09devm_kfree(dev->policy_buf);

I seem to have forgotten dev->dev from these devm_kfree() args.

> > =09ev->policy_buf =3D new_policy_buf;
> >=20
> > ?
> >=20
> > That follows pretty much what the old code did with new_policy_buf
> > variable, but allocation related calls are now devm_*().
>=20
> Thanks for the suggestion!  I hadn't thought about using a second pointer=
 like
> that.
>
> Technically the devm_kfree(new_policy_buf) under the copy_from_user() fai=
lure
> shouldn't be needed though, right?  Because it will still be freed when t=
he
> device is freed.

Yes, but that would mean that memory is retained unused until the device=20
is freed which doesn't sound the best idea. Given this can fail multiple=20
times too, it's sort of memleak like behavior even if that memory is=20
accounted for in the very end thanks to graciousness of devm.

> > > Are you suggesting some sort of way to keep it in the same order and
> > > subvert
> > > device managed allocations and "steal" the pointer?  Glib has a conce=
pt
> > > like
> > > this, but I wasn't aware of a way to do in the kernel.
> > >=20
> > > >=20
> > > > > But this is a debugfs sideloading interface.  If you send a bad
> > > > > binary you can just try again with a good one.
> > > > >=20
> > > > > >=20
> > > > > > We're long past the point where I've started to lose confidence=
 in
> > > > > > this
> > > > > > patch :-(. Could we like just make the minimal changes here to
> > > > > > convert
> > > > > > into devm_*() and nothing more? If you want to make any other
> > > > > > changes,
> > > > > > be
> > > > > > it reordering logic, removal of the local variable, or whatever=
,
> > > > > > please
> > > > > > put those into own patch(es) and properly justify them.
> > > > > >=20
> > > > >=20
> > > > > If we're aiming for a total minimal patch that just fixes the mos=
t
> > > > > immediate
> > > > > issue that's v1 of this series [1].
> > > >=20
> > > > As spelled out very clearly in the above comment, I'm aiming to a p=
atch
> > > > which converts this to devm_*() without other changes. If you want =
to do
> > > > other changes, they should be in their own patch.
> > >=20
> > > I guess if there's a way to do this without changing the order I will=
 do
> > > it,
> > > but I don't see one RN.
> >=20
> >=20
>=20

--=20
 i.

--8323328-1619784704-1747755268=:936--
