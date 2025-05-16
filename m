Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A77224B09
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 May 2025 06:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747377420; cv=none; b=IUmYwbqNgmtPy0VeWYX3BU3ervtyfwCIMDWZbM/arvQpvHA3ldapp3mdFTsAYjdEAvzoywbl0NdxMhfxo++LI8GotXI8lpmGmOEsDsXyby6y19LfKxqthMpK/3qfkDeDkaAc5B/GhaPL9P70gd4T4NoCgMEs7e0JrAo63cFPFns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747377420; c=relaxed/simple;
	bh=Vvns1EA1sc87QlB1NJDb3faqNq0JXEfOBfF0xC1CItM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=IuC+DQSrAPmFZbnYBNa46sq1sA+oG0BHnFwg13tNr9tHiBjcecLZq6nyJ1yZXL/fiZ72Q3JEgDioMu5bQ7kRyHQwaID/Z275OY1X1R/Yd8dtOrtCWZuaxhUq2LFon4oiYuunJBgebtKhJDor0DKLPT45otCeLevO7ROvuKSD0Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DMr96TlD; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DMr96TlD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747377419; x=1778913419;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Vvns1EA1sc87QlB1NJDb3faqNq0JXEfOBfF0xC1CItM=;
  b=DMr96TlDrx92ygUqNZ1Far+/P478fe9/sRtd8kSONB2YsWZlXW8A+72N
   cr9KCc6ZWP4UdN+s1cMsfR+11zxHmbOLW2/bvoj0duKAq5+tPDIvJY1Zg
   Pk08jOH9cMg5xR6jMILMLXSxVP/t5iqj3JFvZQwOXxYNEHhy6qGPZ+Zh4
   R6XZ1DxTW3uC8geZl8qyiIJoo7BE5OrgzxJigr1Kh1zkejB6CzFK/FqAw
   tBkFNfoVmYgzupL/g+zRClCFE0wH//3YTvMkk3zKd9tv39/Snx/js1CoX
   36RmBSGqfka3SXTjs6TURfK6YPsXPaK0ev+tS0abIGuu9cBYD7tyDBHg5
   A==;
X-CSE-ConnectionGUID: 6epqvM09RbGoDLkALUj/1w==
X-CSE-MsgGUID: HJZQWoGJSVa1enLzAthfVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="53153954"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="53153954"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 23:36:59 -0700
X-CSE-ConnectionGUID: GzXuVIR0QYC5ZLZdtmIqjg==
X-CSE-MsgGUID: RLpZLjo8Sjeb1IxLpcnDTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="175730331"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.94])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 23:36:56 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 16 May 2025 09:36:53 +0300 (EEST)
To: Mario Limonciello <superm1@kernel.org>
cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    Hans de Goede <hdegoede@redhat.com>, 
    "open list:AMD PMF DRIVER" <platform-driver-x86@vger.kernel.org>, 
    Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v4 1/3] platform/x86/amd: pmf: Use device managed
 allocations
In-Reply-To: <45179f82-f423-4093-a748-9411b983b57f@kernel.org>
Message-ID: <83097abc-0adb-f916-4d10-672f0ec3d41e@linux.intel.com>
References: <20250515162351.2111468-1-superm1@kernel.org> <20250515162351.2111468-2-superm1@kernel.org> <4570e60a-c313-56ac-d85b-072aa3395ec2@linux.intel.com> <45179f82-f423-4093-a748-9411b983b57f@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1643543815-1747377413=:1009"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1643543815-1747377413=:1009
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 16 May 2025, Mario Limonciello wrote:
> On 5/16/25 01:04, Ilpo J=C3=A4rvinen wrote:
> > On Thu, 15 May 2025, Mario Limonciello wrote:
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
> > > Link:
> > > https://lore.kernel.org/r/20250512211154.2510397-2-superm1@kernel.org
> > > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> > > ---
> > > v4:
> > >   * Handle failures from memory allocation on sideload (Ilpo)
> > >   * Allocate memory before copying from user (Ilpo)
> > > ---
> > >   drivers/platform/x86/amd/pmf/core.c   |  3 +-
> > >   drivers/platform/x86/amd/pmf/tee-if.c | 58 +++++++++---------------=
---
> > >   2 files changed, 20 insertions(+), 41 deletions(-)
> > >=20
> > > diff --git a/drivers/platform/x86/amd/pmf/core.c
> > > b/drivers/platform/x86/amd/pmf/core.c
> > > index 96821101ec773..395c011e837f1 100644
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
> > > index d3bd12ad036ae..6d85601812225 100644
> > > --- a/drivers/platform/x86/amd/pmf/tee-if.c
> > > +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> > > @@ -350,38 +350,30 @@ static ssize_t amd_pmf_get_pb_data(struct file
> > > *filp, const char __user *buf,
> > >   =09=09=09=09   size_t length, loff_t *pos)
> > >   {
> > >   =09struct amd_pmf_dev *dev =3D filp->private_data;
> > > -=09unsigned char *new_policy_buf;
> > >   =09int ret;
> > >     =09/* Policy binary size cannot exceed POLICY_BUF_MAX_SZ */
> > >   =09if (length > POLICY_BUF_MAX_SZ || length =3D=3D 0)
> > >   =09=09return -EINVAL;
> > >   -=09/* re-alloc to the new buffer length of the policy binary */
> > > -=09new_policy_buf =3D memdup_user(buf, length);
> > > -=09if (IS_ERR(new_policy_buf))
> > > -=09=09return PTR_ERR(new_policy_buf);
> > > -
> > > -=09kfree(dev->policy_buf);
> > > -=09dev->policy_buf =3D new_policy_buf;
> > > +=09devm_kfree(dev->dev, dev->policy_buf);
> > > +=09dev->policy_buf =3D devm_kzalloc(dev->dev, length, GFP_KERNEL);
> > > +=09if (IS_ERR(dev->policy_buf))
> > > +=09=09return -ENOMEM;
> > >   =09dev->policy_sz =3D length;
> > >   -=09if (!amd_pmf_pb_valid(dev)) {
> > > -=09=09ret =3D -EINVAL;
> > > -=09=09goto cleanup;
> > > -=09}
> > > +=09if (copy_from_user(dev->policy_buf, buf, length))
> > > +=09=09return -EFAULT;
> >=20
> > Previously, if anything failed here, the old buffer was left in place.
> > I always assumed it was intentional. But after your change, first thing
> > that happens is freeing the old policy_buf.
>=20
> Yeah; in order to do devm without a double malloc it needs to be cleared
> immediately.

I'm feeling like I must be missing something here, but I just fail to see=
=20
why the order _has to be_ changed when changing kfree() -> devm_kfree().

> But this is a debugfs sideloading interface.  If you send a bad
> binary you can just try again with a good one.
>=20
> >=20
> > We're long past the point where I've started to lose confidence in this
> > patch :-(. Could we like just make the minimal changes here to convert
> > into devm_*() and nothing more? If you want to make any other changes, =
be
> > it reordering logic, removal of the local variable, or whatever, please
> > put those into own patch(es) and properly justify them.
> >=20
>=20
> If we're aiming for a total minimal patch that just fixes the most immedi=
ate
> issue that's v1 of this series [1].

As spelled out very clearly in the above comment, I'm aiming to a patch=20
which converts this to devm_*() without other changes. If you want to do=20
other changes, they should be in their own patch.

> Through the course of the discussion obviously there were more things rai=
sed
> by Dan, and I feel that v4 is more robust.
>=20
> Maybe the right answer is to just pick up v1 for 6.15-rc, and this series=
 for
> 6.16?  Or if you want this to have more time in -next I can just resubmit=
 it
> after 6.16-rc1 and we aim for 6.17 with it.
>=20
> [1]
> https://lore.kernel.org/platform-driver-x86/20250506131130.1446262-1-supe=
rm1@kernel.org/#t
>=20

--=20
 i.

--8323328-1643543815-1747377413=:1009--
