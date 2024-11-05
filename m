Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476671D0950
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Nov 2024 09:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730799904; cv=none; b=rXjwU/8TUgR2INN+A1v0QqneppB5KQZD29e5a7DudGBuJE1BldWbog8MXhQvhxUEvYNS9y1KJhah7DyZ6StWhjkCv3SanjFS/oX35cApB21FlZ5hL+mmP9k/Wt+nuFgRFBVj1eG7rrWdBc8401LvEqG+vadEyJ0KMMKGA46nBhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730799904; c=relaxed/simple;
	bh=PvlgxGvfqngRx2LrjnXXtxk3uL6wJdlOdLt5IXUW2lk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=TDGBswtb8tc2kEbi0pLDSmaI/KEnUO+HV3PtIK+34ggYpD9fcY61DtZsCewJun23lB1dvOVB/3OkZkmZdyaAKiCnHz6+xT0ECxcEpP31bxcx0Bo/KJAV0bSo3iieKRlOrx5MKAX4p9PXflJzP7ddlPiQkh2vEg4eFOgYlfdjArY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bWW9+MxY; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bWW9+MxY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730799902; x=1762335902;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=PvlgxGvfqngRx2LrjnXXtxk3uL6wJdlOdLt5IXUW2lk=;
  b=bWW9+MxYkI0RmRouyngEgB7+ZFuCtRXRhRkaUnx/SEchvnjH2zYkPa1W
   FrfSIP7gp71Gfmcn7+bVy+qIR/RdU1lhxP5HwmSbTefqaJ4x1v/edrhon
   RBTmcLOia0Zl7yJ9Pi7ymGmdwCBFgnGtQ27s5HVTsY/BWtNoOauv5MrtO
   ZWvLA/0qhkfjAUNCQ8hjEgldRww0VDK7iMBOynntdb/ejB37Qb1eWMWXz
   SwxJ+vOHobjIkOWox3tbWk4juiPCrFpjZ91HCqKHsRs8dL4lQCBnhJeEb
   afMK1pWTYR9go9fo92/vkJ3gQCpZCBRZ+EEI4MhaXETPe3JPly27nI1HJ
   g==;
X-CSE-ConnectionGUID: ED63iyWkTQ6Ic6hsyvJnbg==
X-CSE-MsgGUID: x26mDF3UQ3GjNbGTPPXFdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="41163377"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="41163377"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 01:45:02 -0800
X-CSE-ConnectionGUID: 1VBgD/dNT9mXjgoPS6bZxw==
X-CSE-MsgGUID: TKbQaC6TRk2sK8aR/EHcag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="114738980"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.201])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 01:45:00 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 5 Nov 2024 11:44:57 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, Sanket.Goswami@amd.com, 
    platform-driver-x86@vger.kernel.org, 
    Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v2 3/8] platform/x86/amd/pmc: Define enum for S2D/PMC
 msg_port
In-Reply-To: <051c7469-3b9d-4bb0-8370-1dfc489d16c3@amd.com>
Message-ID: <311cb5fc-b350-189a-9029-367a934c929b@linux.intel.com>
References: <20241029155440.3499273-1-Shyam-sundar.S-k@amd.com> <20241029155440.3499273-4-Shyam-sundar.S-k@amd.com> <1bf70e8a-5e28-57f3-1cba-41adf83f5a3b@linux.intel.com> <051c7469-3b9d-4bb0-8370-1dfc489d16c3@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1769942986-1730799897=:949"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1769942986-1730799897=:949
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 5 Nov 2024, Shyam Sundar S K wrote:
> On 11/1/2024 15:58, Ilpo J=C3=A4rvinen wrote:
> > On Tue, 29 Oct 2024, Shyam Sundar S K wrote:
> >=20
> >> To distinguish between the PMC message port and the S2D (Spill to DRAM=
)
> >> message port, replace the use of 0 and 1 with an enum.
> >>
> >> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> >> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> >> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> >> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >> ---
> >>  drivers/platform/x86/amd/pmc/mp1_stb.c | 13 +++++++++----
> >>  1 file changed, 9 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/platform/x86/amd/pmc/mp1_stb.c b/drivers/platform=
/x86/amd/pmc/mp1_stb.c
> >> index 5efec020ecac..2b06861c479b 100644
> >> --- a/drivers/platform/x86/amd/pmc/mp1_stb.c
> >> +++ b/drivers/platform/x86/amd/pmc/mp1_stb.c
> >> @@ -47,6 +47,11 @@ enum s2d_arg {
> >>  =09S2D_DRAM_SIZE,
> >>  };
> >> =20
> >> +enum s2d_msg_port {
> >> +=09MSG_PORT_PMC,
> >> +=09MSG_PORT_S2D,
> >> +};
> >> +
> >>  struct amd_stb_v2_data {
> >>  =09size_t size;
> >>  =09u8 data[] __counted_by(size);
> >> @@ -156,7 +161,7 @@ static int amd_stb_debugfs_open_v2(struct inode *i=
node, struct file *filp)
> >>  =09=09dev_err(dev->dev, "error writing to STB: %d\n", ret);
> >> =20
> >>  =09/* Spill to DRAM num_samples uses separate SMU message port */
> >> -=09dev->msg_port =3D 1;
> >> +=09dev->msg_port =3D MSG_PORT_S2D;
> >> =20
> >>  =09ret =3D amd_pmc_send_cmd(dev, 0, &val, STB_FORCE_FLUSH_DATA, 1);
> >>  =09if (ret)
> >> @@ -173,7 +178,7 @@ static int amd_stb_debugfs_open_v2(struct inode *i=
node, struct file *filp)
> >>  =09/* Get the num_samples to calculate the last push location */
> >>  =09ret =3D amd_pmc_send_cmd(dev, S2D_NUM_SAMPLES, &num_samples, dev->=
s2d_msg_id, true);
> >>  =09/* Clear msg_port for other SMU operation */
> >> -=09dev->msg_port =3D 0;
> >> +=09dev->msg_port =3D MSG_PORT_PMC;
> >>  =09if (ret) {
> >>  =09=09dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n"=
, ret);
> >>  =09=09return ret;
> >> @@ -266,7 +271,7 @@ int amd_s2d_init(struct amd_pmc_dev *dev)
> >>  =09=09=09=09    &amd_stb_debugfs_fops);
> >> =20
> >>  =09/* Spill to DRAM feature uses separate SMU message port */
> >> -=09dev->msg_port =3D 1;
> >> +=09dev->msg_port =3D MSG_PORT_S2D;
> >> =20
> >>  =09amd_pmc_send_cmd(dev, S2D_TELEMETRY_SIZE, &size, dev->s2d_msg_id, =
true);
> >>  =09if (size !=3D S2D_TELEMETRY_BYTES_MAX)
> >> @@ -284,7 +289,7 @@ int amd_s2d_init(struct amd_pmc_dev *dev)
> >>  =09stb_phys_addr =3D ((u64)phys_addr_hi << 32 | phys_addr_low);
> >> =20
> >>  =09/* Clear msg_port for other SMU operation */
> >> -=09dev->msg_port =3D 0;
> >> +=09dev->msg_port =3D MSG_PORT_PMC;
> >> =20
> >>  =09dev->stb_virt_addr =3D devm_ioremap(dev->dev, stb_phys_addr, dev->=
dram_size);
> >>  =09if (!dev->stb_virt_addr)
> >=20
> > This change is incomplete, you missed all places using it:
> >=20
> > if (dev->msg_port) {=20
> >=20
> > + add helper for this:
> >=20
> > dev->msg_port ? "S2D" : "PMC"
> >=20
>=20
>=20
> I am not sure if I understand your comment fully. Can you please
> elaborate?

There are users of dev->msg_port that should be also touched by this=20
change but weren't.

For the printing, I suggested a helper function which returns the correct=
=20
string so you don't need to do the compare within print argument.

--=20
 i.

--8323328-1769942986-1730799897=:949--
