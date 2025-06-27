Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516702264A7
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Jun 2025 07:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751010916; cv=none; b=J7ra8pNCU+CtZAPFcVDJ3xDCM3VUw57qO3+8t/KzPEFnDmrnlEdoBz5ryDGFMfoO01S0PFRGgJKDrWPt6mlh86/oEzqJVN54Pn1y09YqDm5hAKxonyiY21TtyazO6OMgZMIDFE9lyF5TPLCQlPgLaVqDNVZ3IlRR485SMcN/1f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751010916; c=relaxed/simple;
	bh=//yWp7lbYQytf87ljZQ5n1tImnhemDA1xHD1ZH3LC6U=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=QTvShud9JAS4t7VBE8AhYuNOb+/4vp3pC2pWJ7sxLvAgSkrZM8IHGt1MAT40O0Lutd9KiURjpGluV3CkeO5uw4Fpy9dwNE7PO0yJbTGKKERlOYa3Fas1cOoVivf5JaspHqEizz7KBPgd3y7N4P55irMUgE4PTdcVj0U4+fKWqZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XAnjRLtt; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XAnjRLtt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751010914; x=1782546914;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=//yWp7lbYQytf87ljZQ5n1tImnhemDA1xHD1ZH3LC6U=;
  b=XAnjRLttctE/HcPLcI2DFjgsWeIdg4FFLMDuKt6Bnlyx930iVCelXCM4
   sFc6REIyvLFQsn71/SATj1IlVagPxGlRrI2uerQT2KIAXy7df664M89nE
   9SnZI31TQqry6W0cvD5iOKKCOpGAWeaCrOOGJo+NmGOfU4ja3T4ri4ciQ
   eMtR60eEWY3/FAhIM5XiLzI/v/WKKYiUmZwjrIIEoNrqMS1rRDUbL443z
   CWtJXYE2ce1RzrklJ3CYYt2K/UnUsuEpjzIKUh/UA/3lP5fd/acRMDx5B
   ee3SiiC3XPg6a90zOTwGAuYWYEPivdOWuej90/PIhWA0TnrUUDmOXTMZ+
   w==;
X-CSE-ConnectionGUID: iu2Jz5e4TTutMeCx8yuolg==
X-CSE-MsgGUID: /oE3emPOQsGX/n9t71HpMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="78759511"
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="78759511"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 00:55:14 -0700
X-CSE-ConnectionGUID: R9Uxo1gPR+aQrYIx+BaysA==
X-CSE-MsgGUID: l+RVQjizSPqpm3iDIzKVZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="152917074"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.71])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 00:55:11 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 27 Jun 2025 10:55:07 +0300 (EEST)
To: Suma Hegde <Suma.Hegde@amd.com>, Hans de Goede <hansg@kernel.org>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [PATCH] platform/x86/amd/hsmp: Use guard mutex to synchronize
 probe
In-Reply-To: <afa69b1c-b992-4897-8bac-5b6f4b77a27e@amd.com>
Message-ID: <50c8002b-cfee-8d2d-a7d4-cfde81ccafe7@linux.intel.com>
References: <20250625100216.1462594-1-suma.hegde@amd.com> <ada3eca0-4c86-c3ee-816c-a3635b4ad110@linux.intel.com> <4fc05197-688a-454f-aadb-7a297db7a594@kernel.org> <afa69b1c-b992-4897-8bac-5b6f4b77a27e@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-939149494-1751010907=:1730"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-939149494-1751010907=:1730
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 27 Jun 2025, Suma Hegde wrote:

> Hi Ilpo and Hans,
>=20
>=20
> Thank you for the review.
>=20
>=20
> On 6/27/2025 12:23 AM, Hans de Goede wrote:
> > Caution: This message originated from an External Source. Use proper ca=
ution
> > when opening attachments, clicking links, or responding.
> >=20
> >=20
> > Hi,
> >=20
> > On 26-Jun-25 18:31, Ilpo J=C3=A4rvinen wrote:
> > > On Wed, 25 Jun 2025, Suma Hegde wrote:
> > >=20
> > > In the shortlog, drop word "guard". This should also mention ACPI as =
the
> > > legacy probe is not affected.
>=20
>=20
> Sure, will drop the guard and will mention ACPI.
>=20
> > > > When async probing is used, 2 hsmp_acpi_probe() calls can race and
> > > > make a mess of things.
> > > Too vague wording.
>=20
> I will revise the commit message to enhance clarity.
>=20
> > > > So, add guard mutex to synchronize them.
> > > >=20
> > > > Suggested-by: Hans de Goede <hdegoede@redhat.com>
> > > > Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> > > > Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.=
com>
> > > > ---
> > > >   drivers/platform/x86/amd/hsmp/acpi.c | 6 ++++++
> > > >   1 file changed, 6 insertions(+)
> > > >=20
> > > > diff --git a/drivers/platform/x86/amd/hsmp/acpi.c
> > > > b/drivers/platform/x86/amd/hsmp/acpi.c
> > > > index 2f1faa82d13e..ab2b65f16d1d 100644
> > > > --- a/drivers/platform/x86/amd/hsmp/acpi.c
> > > > +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> > > > @@ -15,11 +15,13 @@
> > > >   #include <linux/array_size.h>
> > > >   #include <linux/bits.h>
> > > >   #include <linux/bitfield.h>
> > > > +#include <linux/cleanup.h>
> > > >   #include <linux/device.h>
> > > >   #include <linux/dev_printk.h>
> > > >   #include <linux/ioport.h>
> > > >   #include <linux/kstrtox.h>
> > > >   #include <linux/module.h>
> > > > +#include <linux/mutex.h>
> > > >   #include <linux/platform_device.h>
> > > >   #include <linux/sysfs.h>
> > > >   #include <linux/uuid.h>
> > > > @@ -44,6 +46,8 @@ struct hsmp_sys_attr {
> > > >       u32 msg_id;
> > > >   };
> > > >=20
> > > > +static DEFINE_MUTEX(hsmp_lock);
> > > > +
> > > >   static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offse=
t,
> > > >                             u32 *value, bool write)
> > > >   {
> > > > @@ -585,6 +589,8 @@ static int hsmp_acpi_probe(struct platform_devi=
ce
> > > > *pdev)
> > > >       if (!hsmp_pdev)
> > > >               return -ENOMEM;
> > > >=20
> > > > +    guard(mutex)(&hsmp_lock);
> > > > +
> > > >       if (!hsmp_pdev->is_probed) {
> > > >               hsmp_pdev->num_sockets =3D amd_num_nodes();
> > > >               if (hsmp_pdev->num_sockets =3D=3D 0 || hsmp_pdev->num=
_sockets
> > > > > MAX_AMD_NUM_NODES)
> > > So is it just the ->sock alloc and misc dev registration that require
> > > protection? (The latter doesn't even seem to require that if a local
> > > variable carries that information over.)
>=20
> Yes, the rest of the code, aside from the remove function mentioned below=
 by
> Hans, doesn't require protection as it uses local variables.
>=20
> Additionally, we have a semaphore in place to protect the other critical
> section.
>=20
> > Another review note:
> >=20
> > hsmp_pdev->is_probed is also used in remove() so that needs a
> > guard(mutex)(&hsmp_lock); too.
>=20
> This was overlooked. I'll make sure to add it.

Hmm... I was going to suggest replacing ->is_probed with=20
devm_add_action_or_reset() but then started to think probe/remove=20
ordering between different pdevs.

Is there anything that guarantees ->sock isn't teared down too early, that=
=20
is, pdev that did the allocation should be removed last to not prematurely=
=20
free ->sock?

--=20
 i.

--8323328-939149494-1751010907=:1730--
