Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777229476;
	Sun, 29 Dec 2024 17:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735492774; cv=none; b=GevkSRUOvF9btWdySzo4k0Ci6YidVrlqS2/sjcr9GTNQn5SXT42WtRlF/2qFuAJMYA3+kza6irlYVB0In9wA0jPZICySlLIKmfKg+lDPDVP0Xf2WrMZ21TmyQKn27NOUCLd+Ljk2kn8BZczpGEt9VrXmjGeANZanW9a3CR4NOKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735492774; c=relaxed/simple;
	bh=8HgokGNm7NBfstqKLFn41NEXp9ol0FIxRoHaMjDBozM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=QuKdmkTNRUe6v46zlXLjXEDgMOdhzTUfm2bPWTvvw5C+VMqJxCXfuFCLYkkjQ8MKlLx/lMMh1BJQELdTDLh1OJRSNFJYcN1t6kxtiy5GCk6CEDQhJTORm54ni8ro1IjlTijVfnwGH44XSPcXurccjGRNzJiiohYeBJVMMSXKXIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CbCsjd+A; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CbCsjd+A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735492772; x=1767028772;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=8HgokGNm7NBfstqKLFn41NEXp9ol0FIxRoHaMjDBozM=;
  b=CbCsjd+AZgOiqPQOCy/G4AbhGKfgM+4PDTeDGLr66gh7AF/d7XZyPxOp
   K5dvESqfKqdMaWZaOZ7mJZMQ7bGVfCxnAK2v0Sk3brHtxkVXOIcl+Fk65
   wk8JcCUd87YKsANqTTsRlWXsVzPBAObLDnAizXVQeAHevsRu8dVh+wFBD
   FimgPvnEXS3QDGqBrsqtZynThkaWUgVAgoPigyU+8bf+0IopBhFRNxgjN
   Bj5dxk2pDDWU7akwjW9k3FintTZCesOLTrh6BHwnLXkGcyX9ETgXdF+Ij
   mJEYSZrM/MDbI7E+gMmO0Z0LppnZ21SsoJLxevDeGyfoXHiJdvoM9yTzp
   g==;
X-CSE-ConnectionGUID: txExfj7IQROEnoN/p87xeg==
X-CSE-MsgGUID: MnaIUg/1TIChRTif/ve9fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="35682343"
X-IronPort-AV: E=Sophos;i="6.12,274,1728975600"; 
   d="scan'208";a="35682343"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2024 09:19:31 -0800
X-CSE-ConnectionGUID: 2wr191kuRdujelTzHdW/QA==
X-CSE-MsgGUID: LsbPcxfnQ96yZh2jOTciKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100443580"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.202])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2024 09:19:29 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Sun, 29 Dec 2024 19:19:25 +0200 (EET)
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    Mario Limonciello <mario.limonciello@amd.com>, 
    Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86/amd/pmc: Only disable IRQ1 wakeup where
 i8042 actually enabled it
In-Reply-To: <3f0cdfa5-5aa5-4c17-b364-70383a6b6f31@maciej.szmigiero.name>
Message-ID: <e27e0e0e-a3a9-7b11-4e7d-27274eab604f@linux.intel.com>
References: <d5ed5ffc88fed17e1b1eb988c942e44fb540a68b.1735490591.git.mail@maciej.szmigiero.name> <a5781d0a-0a58-a708-1f8f-f9ade14ade52@linux.intel.com> <3f0cdfa5-5aa5-4c17-b364-70383a6b6f31@maciej.szmigiero.name>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-890807236-1735492765=:20332"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-890807236-1735492765=:20332
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sun, 29 Dec 2024, Maciej S. Szmigiero wrote:

> On 29.12.2024 17:58, Ilpo J=C3=A4rvinen wrote:
> > On Sun, 29 Dec 2024, Maciej S. Szmigiero wrote:
> >=20
> > > Wakeup for IRQ1 should be disabled only in cases where i8042 had actu=
ally
> > > enabled it, otherwise "wake_depth" for this IRQ will try do drop belo=
w
> > > zero
> > > and there will be an unpleasant WARN() logged:
> > > kernel: atkbd serio0: Disabling IRQ1 wakeup source to avoid platform
> > > firmware bug
> > > kernel: ------------[ cut here ]------------
> > > kernel: Unbalanced IRQ 1 wake disable
> > > kernel: WARNING: CPU: 10 PID: 6431 at kernel/irq/manage.c:920
> > > irq_set_irq_wake+0x147/0x1a0
> > >=20
> > > To fix this call the PMC suspend handler only from the same set of
> > > dev_pm_ops handlers as i8042_pm_suspend() is called, which currently =
means
> > > just the ".suspend" handler.
> > > Previously, the code would use DEFINE_SIMPLE_DEV_PM_OPS() to define i=
ts
> > > dev_pm_ops, which also called this handler on ".freeze" and ".powerof=
f".
> > >=20
> > > To reproduce this issue try hibernating (S4) the machine after a fres=
h
> > > boot
> > > without putting it into s2idle first.
> > >=20
> > > Fixes: 8e60615e8932 ("platform/x86/amd: pmc: Disable IRQ1 wakeup for
> > > RN/CZN")
> > > Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
> > > ---
> > >   drivers/platform/x86/amd/pmc/pmc.c | 8 +++++++-
> > >   1 file changed, 7 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/platform/x86/amd/pmc/pmc.c
> > > b/drivers/platform/x86/amd/pmc/pmc.c
> > > index 26b878ee5191..a254debb9256 100644
> > > --- a/drivers/platform/x86/amd/pmc/pmc.c
> > > +++ b/drivers/platform/x86/amd/pmc/pmc.c
> > > @@ -947,6 +947,10 @@ static int amd_pmc_suspend_handler(struct device
> > > *dev)
> > >   {
> > >   =09struct amd_pmc_dev *pdev =3D dev_get_drvdata(dev);
> > >   +=09/*
> > > +=09 * Must be called only from the same set of dev_pm_ops handlers
> > > +=09 * as i8042_pm_suspend() is called: currently just from .suspend.
> > > +=09 */
> > >   =09if (pdev->disable_8042_wakeup && !disable_workarounds) {
> > >   =09=09int rc =3D amd_pmc_wa_irq1(pdev);
> > >   @@ -959,7 +963,9 @@ static int amd_pmc_suspend_handler(struct devic=
e
> > > *dev)
> > >   =09return 0;
> > >   }
> > >   -static DEFINE_SIMPLE_DEV_PM_OPS(amd_pmc_pm, amd_pmc_suspend_handle=
r,
> > > NULL);
> > > +static const struct dev_pm_ops amd_pmc_pm =3D {
> > > +=09.suspend =3D amd_pmc_suspend_handler,
> > > +};
> >=20
> > ???
> >=20
> > I cannot see what this change is supposed to achieve.
> >=20
> > #define _DEFINE_DEV_PM_OPS(name, \
> >                             suspend_fn, resume_fn, \
> >                             runtime_suspend_fn, runtime_resume_fn, idle=
_fn)
> > \
> > const struct dev_pm_ops name =3D { \
> >          SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
> >          RUNTIME_PM_OPS(runtime_suspend_fn, runtime_resume_fn, idle_fn)=
 \
> > }
> >=20
> > #define DEFINE_SIMPLE_DEV_PM_OPS(name, suspend_fn, resume_fn) \
> >          _DEFINE_DEV_PM_OPS(name, suspend_fn, resume_fn, NULL, NULL, NU=
LL)
> >=20
> > #define SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
> >          .suspend =3D pm_sleep_ptr(suspend_fn), \
> >          .resume =3D pm_sleep_ptr(resume_fn), \
> >          .freeze =3D pm_sleep_ptr(suspend_fn), \
> >          .thaw =3D pm_sleep_ptr(resume_fn), \
> >          .poweroff =3D pm_sleep_ptr(suspend_fn), \
> >          .restore =3D pm_sleep_ptr(resume_fn),
> >=20
> > #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
> >=20
> > Under what circumstances does this change result in some difference?
> >=20
>=20
> .freeze and .poweroff are now both NULL, just like in the i8042 driver.
>=20
> As I wrote in the commit message:
> > > Previously, the code would use DEFINE_SIMPLE_DEV_PM_OPS() to define i=
ts
> > > dev_pm_ops, *which also called this handler on ".freeze" and ".powero=
ff".*

Also, please avoid using "previously" like this. I interpreted it like=20
some old kernel did that.

--=20
 i.

--8323328-890807236-1735492765=:20332--
