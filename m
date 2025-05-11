Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5D625F968
	for <platform-driver-x86@vger.kernel.org>; Sun, 11 May 2025 20:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746995406; cv=none; b=fKJqXOfI6cVS4UzczWN3CjnHL19paoFb7eBpuU5Ak+sXB4XCmzx0z3xtyXW6IlAW6L3Dqjo0ClGVZ5HY0DRwsLjHI5y29Oa8X8lEdpB7TtrJNtjcDi2kMx6abcBt3aEhyY5yFIeW8MssQyMNyn1jzrzKNzhkFZNXaqS9zGqofG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746995406; c=relaxed/simple;
	bh=NPXQKuSmb+Zo8f0GeIWkOzfOMoaEsbzMGbNt4Pr45Do=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JNDDnSuPknxnPRz4qfsQMFuz/+KJ6w6F6buKKZZQHvMoiQYOSxAYLWhPTfTBkp/KyEGbkgNsZocQ+REamPLNuOItU6TtJTVy5yhY1MC1O2pHoSVSfxWsyhH/hDFuXPggR0OdTbj1ZKJ+pdSkrQh//mHkrpGOz5MdnU6DsOImhyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RawtNUbh; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RawtNUbh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746995404; x=1778531404;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=NPXQKuSmb+Zo8f0GeIWkOzfOMoaEsbzMGbNt4Pr45Do=;
  b=RawtNUbhncDfgexiTk8CGi+IQIttycLMGjShi5v9dSkQqQJb2aG9UuVw
   VZDNknHYu5Q/eKcVG9TDIauZAGMKrBQlGRGw/azbnSCaBJuA5tFD3b8Xq
   0Ntlh4OsGg0m/3hWc9oUzSeeaiTki+8EvJI/2L3Ilt5TL4I9YeBYp4iOH
   EGsasl96lirYuAvDIUkjePbqyk6e9MRdyuiyqfR/ZiJZu6W1k6Za12QMh
   Cx5O6mhTdVuJPOD2QsfadcCLbkAvvWsm+IkbelK4Y+TX5XjxGjau4ZHx1
   gHnmUR+8PeF4xORyt/A7r686IjzJX8HdfmXOegzm7qzaWOIgn+U0wgVR+
   A==;
X-CSE-ConnectionGUID: xpUkJEd2Sfyh/4Vju0aJlg==
X-CSE-MsgGUID: 3FYsB6mpQ5ewZ/tHIfzbFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="48935761"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="48935761"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 13:30:03 -0700
X-CSE-ConnectionGUID: gan2u+JzSIGtgPIh45LfKA==
X-CSE-MsgGUID: xJjZyZqcQduNhRiPdQkelg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="142296282"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.117])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 13:30:02 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Sun, 11 May 2025 23:29:58 +0300 (EEST)
To: Suma Hegde <Suma.Hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [v4 1/3] platform/x86/amd/hsmp: Use a single DRIVER_VERSION for
 all hsmp modules
In-Reply-To: <3984e564-3f62-4f20-978e-4eb6b21dda1b@amd.com>
Message-ID: <51600738-dddf-358a-6b9a-045786e7d746@linux.intel.com>
References: <20250506101542.200811-1-suma.hegde@amd.com> <0f6fcfc6-f79f-e5fc-fa3e-6a6b6a5956c8@linux.intel.com> <3984e564-3f62-4f20-978e-4eb6b21dda1b@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1643332376-1746995398=:1007"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1643332376-1746995398=:1007
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sun, 11 May 2025, Suma Hegde wrote:
> On 5/8/2025 8:04 PM, Ilpo J=C3=A4rvinen wrote:
> > Caution: This message originated from an External Source. Use proper ca=
ution
> > when opening attachments, clicking links, or responding.
> >=20
> >=20
> > On Tue, 6 May 2025, Suma Hegde wrote:
> >=20
> > > Use a single DRIVER_VERSION for the plat, hsmp and acpi modules,
> > > as all these modules are connected to a common functionality.
> > >=20
> > > Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> > > Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.co=
m>
> > > ---
> > > Changes since v3:
> > > None
> > >=20
> > > This patch is rebased on
> > > https://lore.kernel.org/platform-driver-x86/20250425102357.266790-1-s=
uma.hegde@amd.com/T/#u
> > >=20
> > > Changes since v2:
> > > Update the commit message and description
> > >=20
> > > Changes since v1:
> > > None
> > >=20
> > >   drivers/platform/x86/amd/hsmp/acpi.c | 1 -
> > >   drivers/platform/x86/amd/hsmp/hsmp.c | 2 --
> > >   drivers/platform/x86/amd/hsmp/hsmp.h | 2 ++
> > >   drivers/platform/x86/amd/hsmp/plat.c | 1 -
> > >   4 files changed, 2 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/drivers/platform/x86/amd/hsmp/acpi.c
> > > b/drivers/platform/x86/amd/hsmp/acpi.c
> > > index eaae044e4f82..12f4950afcd9 100644
> > > --- a/drivers/platform/x86/amd/hsmp/acpi.c
> > > +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> > > @@ -28,7 +28,6 @@
> > >   #include "hsmp.h"
> > >=20
> > >   #define DRIVER_NAME          "hsmp_acpi"
> > > -#define DRIVER_VERSION               "2.3"
> > This fails to apply on top of the review-ilpo-next branch, I've no idea=
 on
> > what commit this is based on. Could you please rebase and check if the
> > entire series is fine wrt. the changes what this is based on vs what's =
in
> > the review-ilpo-next branch.
>=20
>=20
> This patch series is re based on
> https://lore.kernel.org/platform-driver-x86/20250425102357.266790-1-suma.=
hegde@amd.com/T/#u
> (I added this as part of changelog)
>=20
> I rechecked by applying this series on review-ilpo-next + the above patch=
=2E It
> applies clean.
>=20
> Could you please take the above mentioned dependent patch and apply this
> series?

Hi,

Ah, I didn't realize that so thanks. Yes, I intend to merge fixes where=20
that change currently sits into for-next anyway to resolve a few conflicts=
=20
so it should take care of this too.

--=20
 i.

>=20
>=20
> Thanks and Regards,
>=20
> Suma
>=20
> > --
> >   i.
> >=20
> > >   /* These are the strings specified in ACPI table */
> > >   #define MSG_IDOFF_STR                "MsgIdOffset"
> > > diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c
> > > b/drivers/platform/x86/amd/hsmp/hsmp.c
> > > index a3ac09a90de4..3df34d7436a9 100644
> > > --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> > > +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> > > @@ -32,8 +32,6 @@
> > >   #define HSMP_WR                      true
> > >   #define HSMP_RD                      false
> > >=20
> > > -#define DRIVER_VERSION               "2.4"
> > > -
> > >   /*
> > >    * When same message numbers are used for both GET and SET operatio=
n,
> > >    * bit:31 indicates whether its SET or GET operation.
> > > diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h
> > > b/drivers/platform/x86/amd/hsmp/hsmp.h
> > > index d58d4f0c20d5..7877cb97993b 100644
> > > --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> > > +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> > > @@ -25,6 +25,8 @@
> > >   #define HSMP_DEVNODE_NAME    "hsmp"
> > >   #define ACPI_HSMP_DEVICE_HID    "AMDI0097"
> > >=20
> > > +#define DRIVER_VERSION               "2.4"
> > > +
> > >   struct hsmp_mbaddr_info {
> > >        u32 base_addr;
> > >        u32 msg_id_off;
> > > diff --git a/drivers/platform/x86/amd/hsmp/plat.c
> > > b/drivers/platform/x86/amd/hsmp/plat.c
> > > index 81931e808bbc..4f03fdf988c1 100644
> > > --- a/drivers/platform/x86/amd/hsmp/plat.c
> > > +++ b/drivers/platform/x86/amd/hsmp/plat.c
> > > @@ -24,7 +24,6 @@
> > >   #include "hsmp.h"
> > >=20
> > >   #define DRIVER_NAME          "amd_hsmp"
> > > -#define DRIVER_VERSION               "2.3"
> > >=20
> > >   /*
> > >    * To access specific HSMP mailbox register, s/w writes the SMN add=
ress
> > > of HSMP mailbox
> > >=20
>=20
--8323328-1643332376-1746995398=:1007--
