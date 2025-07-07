Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C825C1CAA92
	for <platform-driver-x86@vger.kernel.org>; Mon,  7 Jul 2025 12:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751890227; cv=none; b=fH3N4RmcBOEP+WYQiZpjXTxNeeAlUAnjzk5nGtokXVBCJC6Z5p3gi1U8Lels8Ce5VCpq4OERAL/BgZt2BfQNSL/mHleIKmv/K052ijuCafJV+PSP4iyiY7fW5neHjUC5e7H3cnYrNlbmmNSQhyH26Pt2Y8ps4pg3C7fvx+15RNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751890227; c=relaxed/simple;
	bh=rjWkPyUPezpn8EWE82LI3qZiLFZCRUZStLXkxldCUjM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=TKEf1/tql72GX7gORlsHAMrBGOk/QukUBQQXwV3r/RZCRsseOAPYNIlS2lxEeWpmxEuBy0cQeTLH7Lsd4w1bsUhZCv79l7VhiR0Lv5/1tCi5ZdY2VeapVb1C/fvwN8DfP22xrWlCcoxPOB6Ycqm7OwIqHgy1jz5Xm+rAMH1CowA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e5wyiPps; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e5wyiPps"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751890226; x=1783426226;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=rjWkPyUPezpn8EWE82LI3qZiLFZCRUZStLXkxldCUjM=;
  b=e5wyiPpsgHjBG1ymn+5SBCNTZAhK9sVB8BivfbYspHP14GdsJJsLscRz
   FCXz13DrweJ6fVDo7MWi4hZl6+q0F6QTi3p6lAji9vf/8dkuJ0wr6Yt39
   dvbsd+YkOqj5nMDJbg2FsxO64ovXEMAVmW1t8Ou/5GrLlgZIsyaSbDb81
   faTmB6tny3rXG5tQgW9dTEQ6LPW5932JL4OxINPCTUiM5ohB2+xEGFVci
   PQ7vqNSwQi1dhGCEqYH8Z8xXvfjIRtRZpVIwXjuoE9WOTM0gYKKch1GpM
   oBUiHfw71tPQsV4YlXvzZGUIrUkgLRuVfaFjJaqSsQyldq519nJKiUh2z
   w==;
X-CSE-ConnectionGUID: mg94VXmGSVWHL7QdQ6LbxQ==
X-CSE-MsgGUID: rUIfqz38TYeg07woe86kCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="41731931"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; 
   d="scan'208";a="41731931"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 05:10:25 -0700
X-CSE-ConnectionGUID: MkRUhnUjTBursiPhTVHQPw==
X-CSE-MsgGUID: me77F5fLQTKLN0vdMS5Hyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; 
   d="scan'208";a="159542390"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.104])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 05:10:23 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 7 Jul 2025 15:10:19 +0300 (EEST)
To: Suma Hegde <Suma.Hegde@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [PATCH] platform/x86/amd/hsmp: Use guard mutex to synchronize
 probe
In-Reply-To: <52bbb308-f4d3-4b31-a683-49fcc0594f5c@amd.com>
Message-ID: <14e27a87-1277-b4be-b44d-249c46aa7b33@linux.intel.com>
References: <20250625100216.1462594-1-suma.hegde@amd.com> <ada3eca0-4c86-c3ee-816c-a3635b4ad110@linux.intel.com> <4fc05197-688a-454f-aadb-7a297db7a594@kernel.org> <afa69b1c-b992-4897-8bac-5b6f4b77a27e@amd.com> <50c8002b-cfee-8d2d-a7d4-cfde81ccafe7@linux.intel.com>
 <52bbb308-f4d3-4b31-a683-49fcc0594f5c@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1539520492-1751890219=:941"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1539520492-1751890219=:941
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 7 Jul 2025, Suma Hegde wrote:
> On 6/27/2025 1:25 PM, Ilpo J=C3=A4rvinen wrote:
> > Caution: This message originated from an External Source. Use proper ca=
ution
> > when opening attachments, clicking links, or responding.
> >=20
> >=20
> > On Fri, 27 Jun 2025, Suma Hegde wrote:
> >=20
> > > Hi Ilpo and Hans,
> > >=20
> > >=20
> > > Thank you for the review.
> > >=20
> > >=20
> > > On 6/27/2025 12:23 AM, Hans de Goede wrote:
> > > > Caution: This message originated from an External Source. Use prope=
r
> > > > caution
> > > > when opening attachments, clicking links, or responding.
> > > >=20
> > > >=20
> > > > Hi,
> > > >=20
> > > > On 26-Jun-25 18:31, Ilpo J=C3=A4rvinen wrote:
> > > > > On Wed, 25 Jun 2025, Suma Hegde wrote:
> > > > >=20
> > > > > In the shortlog, drop word "guard". This should also mention ACPI=
 as
> > > > > the
> > > > > legacy probe is not affected.
> > >=20
> > > Sure, will drop the guard and will mention ACPI.
> > >=20
> > > > > > When async probing is used, 2 hsmp_acpi_probe() calls can race =
and
> > > > > > make a mess of things.
> > > > > Too vague wording.
> > > I will revise the commit message to enhance clarity.
> > >=20
> > > > > > So, add guard mutex to synchronize them.
> > > > > >=20
> > > > > > Suggested-by: Hans de Goede <hdegoede@redhat.com>
> > > > > > Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> > > > > > Reviewed-by: Naveen Krishna Chatradhi
> > > > > > <naveenkrishna.chatradhi@amd.com>
> > > > > > ---
> > > > > >    drivers/platform/x86/amd/hsmp/acpi.c | 6 ++++++
> > > > > >    1 file changed, 6 insertions(+)
> > > > > >=20
> > > > > > diff --git a/drivers/platform/x86/amd/hsmp/acpi.c
> > > > > > b/drivers/platform/x86/amd/hsmp/acpi.c
> > > > > > index 2f1faa82d13e..ab2b65f16d1d 100644
> > > > > > --- a/drivers/platform/x86/amd/hsmp/acpi.c
> > > > > > +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> > > > > > @@ -15,11 +15,13 @@
> > > > > >    #include <linux/array_size.h>
> > > > > >    #include <linux/bits.h>
> > > > > >    #include <linux/bitfield.h>
> > > > > > +#include <linux/cleanup.h>
> > > > > >    #include <linux/device.h>
> > > > > >    #include <linux/dev_printk.h>
> > > > > >    #include <linux/ioport.h>
> > > > > >    #include <linux/kstrtox.h>
> > > > > >    #include <linux/module.h>
> > > > > > +#include <linux/mutex.h>
> > > > > >    #include <linux/platform_device.h>
> > > > > >    #include <linux/sysfs.h>
> > > > > >    #include <linux/uuid.h>
> > > > > > @@ -44,6 +46,8 @@ struct hsmp_sys_attr {
> > > > > >        u32 msg_id;
> > > > > >    };
> > > > > >=20
> > > > > > +static DEFINE_MUTEX(hsmp_lock);
> > > > > > +
> > > > > >    static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32
> > > > > > offset,
> > > > > >                              u32 *value, bool write)
> > > > > >    {
> > > > > > @@ -585,6 +589,8 @@ static int hsmp_acpi_probe(struct
> > > > > > platform_device
> > > > > > *pdev)
> > > > > >        if (!hsmp_pdev)
> > > > > >                return -ENOMEM;
> > > > > >=20
> > > > > > +    guard(mutex)(&hsmp_lock);
> > > > > > +
> > > > > >        if (!hsmp_pdev->is_probed) {
> > > > > >                hsmp_pdev->num_sockets =3D amd_num_nodes();
> > > > > >                if (hsmp_pdev->num_sockets =3D=3D 0 ||
> > > > > > hsmp_pdev->num_sockets
> > > > > > > MAX_AMD_NUM_NODES)
> > > > > So is it just the ->sock alloc and misc dev registration that req=
uire
> > > > > protection? (The latter doesn't even seem to require that if a lo=
cal
> > > > > variable carries that information over.)
> > > Yes, the rest of the code, aside from the remove function mentioned b=
elow
> > > by
> > > Hans, doesn't require protection as it uses local variables.
> > >=20
> > > Additionally, we have a semaphore in place to protect the other criti=
cal
> > > section.
> > >=20
> > > > Another review note:
> > > >=20
> > > > hsmp_pdev->is_probed is also used in remove() so that needs a
> > > > guard(mutex)(&hsmp_lock); too.
> > > This was overlooked. I'll make sure to add it.
> > Hmm... I was going to suggest replacing ->is_probed with
> > devm_add_action_or_reset() but then started to think probe/remove
> > ordering between different pdevs.
> >=20
> > Is there anything that guarantees ->sock isn't teared down too early, t=
hat
> > is, pdev that did the allocation should be removed last to not prematur=
ely
> > free ->sock?
> Currently, there is no assurance that the pdev responsible for the alloca=
tion
> will be the last one removed.
>=20
> Should I implement reference counting to address this? The reference coun=
t
> could be initialized to num_sockets and incremented in probe and

I think you want to initialize it to zero as otherwise it won't reach=20
zero ever on removal.

> decremented with each removal, freeing the "sock" when the count reaches =
zero.
> Socket allocation will be performed using kmalloc instead of devm_alloc.

Yes, it would be better to use counter (I think you can replace is_probed=
=20
with it).

You'll still need the mutex though to ensure the concurrent probes all see=
=20
the allocated sock as the allocating one and some other pdev could race=20
otherwise.


One more potentially problematic scenario is partial state where not all=20
pdevs are there yet/aren't there anymore. hsmp_send_message() seems to=20
assume sock[n] is always valid, but that's not true unless all sockets=20
have already probed and none removed yet.

--=20
 i.

--8323328-1539520492-1751890219=:941--
