Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7723F7E77;
	Wed,  1 Apr 2026 11:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775042988; cv=none; b=KMAVOUfvO9aL103S3W+OgLGnIWCczqHjx3fTdYwbTPkfUEydv9DaffBw+Z7F1wJeRbuJCh5Y3M/36xG/PsOx/2v9h6aGZUHRbLx4s/d1SiJ4HZM9Cfj1wh5FGBL7dprotNBFcOgSTldH+nvOdrBEOi81ojT5d4aSmwO+Zfdbj5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775042988; c=relaxed/simple;
	bh=8Ud6DJzeDjHZIPXqSPtaiohY+0MC3Jzmxw7xt955yWc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=EAyxYF+YZ10am0xXL9VmISebR1otNpWEwBNKgOpHOUQP89DHhf9CPOxRfrCx4QH9ESLrrgNGAbonBQ92n8IposleKxnnH8JfLOMqDcTKrIypSSNxepCSMkKXaE3Szda5wa8j2AsX89UFN9KVwhAlzNhEn+P0Tk+Reu5pt2dyhLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GRqHCYdG; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GRqHCYdG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775042986; x=1806578986;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=8Ud6DJzeDjHZIPXqSPtaiohY+0MC3Jzmxw7xt955yWc=;
  b=GRqHCYdGbUw1zJX8aFyzhtAxarDuVRw99Sm2eDqaD5nf/NjZVp2aCzsa
   +rRBWShFto5AWD8vexOT3uXIS1anc4ICVqOdLRiEEjQqVNrwPuvtjmj+/
   DBNdWk35sM2M3pN0LH7OOnjRiM8qyLqFwz2OaZY1iRqFnfM0t4xcWbGst
   UFZ7pdUwcMrDc4A1ETpVG0retWRYMJKA7q1ekEwroLsocMCQ2vqfl8HJM
   rLAuqwf6Q9N3txFVUbSasBq8wEOGVls1Q2/J9egy9uuL4P6HJLCBgCMuM
   PaxXVCGMVWzZWcULJGq/1mHjLEiaiLXmPRu8Psaj/pdJadbNBNtgZCxnZ
   w==;
X-CSE-ConnectionGUID: syUjVUgiRbCk5fp8IksaJA==
X-CSE-MsgGUID: X5NaiKKPS2Ou5HUAfDSOVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="93658864"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="93658864"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 04:29:45 -0700
X-CSE-ConnectionGUID: 1X5aesQnRq6o7t0TTS1qwA==
X-CSE-MsgGUID: 6s5Iwd2dT8SCD3GjqFO6AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="223771411"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.192])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 04:29:41 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 1 Apr 2026 14:29:37 +0300 (EEST)
To: "Ramalingam, Muthusamy" <muthus@amd.com>
cc: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Muralidhara M K <muralimk@amd.com>
Subject: Re: [PATCH 2/2] platform/x86/amd/hsmp: Add support for variable-sized
 metrics tables
In-Reply-To: <f2df9d24-6dc0-4359-b325-e5037865758a@amd.com>
Message-ID: <6ca38d8c-6419-57fa-cc08-50cd53e8408a@linux.intel.com>
References: <20260305105050.2940904-1-muthusamy.ramalingam@amd.com> <20260305105050.2940904-3-muthusamy.ramalingam@amd.com> <81915669-87e0-f06d-7a91-eaec41ecc0e1@linux.intel.com> <f2df9d24-6dc0-4359-b325-e5037865758a@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1845452601-1775042977=:973"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1845452601-1775042977=:973
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 1 Apr 2026, Ramalingam, Muthusamy wrote:

> Hi Ilpo,
>=20
> Thank you for the suggestions. I will update version v2 shortly to addres=
s the
> comments listed below.
>=20
> On 31-03-2026 02:13 pm, Ilpo J=C3=A4rvinen wrote:
> > On Thu, 5 Mar 2026, Muthusamy Ramalingam wrote:
> >=20
> > > Add support for the new metrics table format introduced in AMD Family=
 1Ah
> > > Model 50h-5Fh processors with HSMP protocol version 7.
> > >=20
> > > Use CPU family/model and protocol versions to map respective
> > > variable-sized
> > > metric table configurations.
> > > The exported hsmp_metric_tbl_read() function provides offset support =
for
> > > variable-sized tables.
> >=20
> > This patch should be split into multiple changes.
> Sure.
> >=20
> > > Co-developed-by: Muralidhara M K <muralimk@amd.com>
> > > Signed-off-by: Muralidhara M K <muralimk@amd.com>
> > > Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
> > > ---
> > >   arch/x86/include/uapi/asm/amd_hsmp.h | 86 +++++++++++++++++++++++++=
+++
> > >   drivers/platform/x86/amd/hsmp/acpi.c |  9 +--
> > >   drivers/platform/x86/amd/hsmp/hsmp.c | 83 ++++++++++++++++++++++---=
--
> > >   drivers/platform/x86/amd/hsmp/hsmp.h |  3 +-
> > >   drivers/platform/x86/amd/hsmp/plat.c |  3 +-
> > >   5 files changed, 164 insertions(+), 20 deletions(-)
> > >=20
> > > --- a/drivers/platform/x86/amd/hsmp/acpi.c
> > > +++ b/drivers/platform/x86/amd/hsmp/acpi.c

> > > @@ -403,8 +424,44 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
> > >   =09=09dev_err(sock->dev, "Invalid DRAM address for metric table\n")=
;
> > >   =09=09return -ENOMEM;
> > >   =09}
> > > -=09sock->metric_tbl_addr =3D devm_ioremap(sock->dev, dram_addr,
> > > -=09=09=09=09=09     sizeof(struct
> > > hsmp_metric_table));
> > > +
> > > +=09/* Get metric table version */
> > > +=09msg_tbl_ver.sock_ind    =3D sock_ind;
> > > +=09msg_tbl_ver.response_sz =3D
> > > hsmp_msg_desc_table[HSMP_GET_METRIC_TABLE_VER].response_sz;
> > > +=09msg_tbl_ver.msg_id      =3D HSMP_GET_METRIC_TABLE_VER;
> > > +
> > > +=09ret =3D hsmp_send_message(&msg_tbl_ver);
> > > +=09if (ret)
> > > +=09=09return ret;
> > > +
> > > +=09table_ver =3D msg_tbl_ver.args[0];
> > > +
> > > +=09hsmp_pdev.hsmp_table_size =3D 0;
> >=20
> > Is this necessary?
>
> Yes, We want this for unsupported family check.

Isn't this initialized to its default value which is 0? So why it needs to=
=20
be explicitly done again?

--=20
 i.

--8323328-1845452601-1775042977=:973--
