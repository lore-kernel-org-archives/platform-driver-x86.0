Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BBF377561;
	Thu, 11 Jun 2026 08:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781166025; cv=none; b=Z/MWW+BQBECQ7ELc3Vw7JM/LAnEn0MM/sFl0UiwK6zHBe2Ol5RO72M6I+gExdYFsToKhIbRZ9c8Uw2IeTM5ARO+ACPsEbmDLHzNHVTFx4uNUQd+7GimBKFcyuKOMOpawXCiPLwS0CTZOzu233p8/TtW24fjtm8P+PdZY+MyJ4e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781166025; c=relaxed/simple;
	bh=EyiyWj7q9eI6RfcdGwHrun5NpY3X9CuO5XfoAt0Inno=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=iovd7fWt32fi/pbjmBRgUN6q3huDKCbnlFd5ONwUCEtZsD5UYY47FuJAbNpbocy9+oVYxWImQgJlBr9hq5/6+nzRGpmMCdiAMIO94vyVFf6giiyog5+nOnj0az8rPDiuxLSWTZNxJTY1a9WQW+bsSBQ/tym5vY1cNtAbgACNlqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mOWFSY95; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mOWFSY95"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781166023; x=1812702023;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=EyiyWj7q9eI6RfcdGwHrun5NpY3X9CuO5XfoAt0Inno=;
  b=mOWFSY95E9XCUb5f/9Prl79r2Cj6waJAy0H4rkb/0O/YQQePZhoyoET5
   Zcx3vnIAr/GCXowaTock09TBgsbTEhuw+RILci+P8d/cVL16E+Um9Ut4U
   eyokz7Q6I93pXwZ6Na2kTsQEvBhmHGLHqvmf8sHNsttIa9w/rLKWNEDeQ
   BlWreLcfUvJXDJRR7iwJc2WUa4g7IfJw3JJ+5j3JknZtPQxl8giGtdwop
   QCysjDpzki4QmMbp3o9YXsaAzvWAhx0IooF5lEyf/7pwsW7zkyxODLDmH
   K0a3YtYT47zUyjMqxtST5vUF16JAAA2+XaF9ZGKRc/bhoOJmpKKxm34Ts
   g==;
X-CSE-ConnectionGUID: b/r7DfJrSAK7/H4OMTfbnw==
X-CSE-MsgGUID: ooYjdG6DTQKsDTNMY/sFAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="107411881"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="107411881"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 01:20:22 -0700
X-CSE-ConnectionGUID: oBRXLGaoTailaLGihuuWgA==
X-CSE-MsgGUID: EhiUEK5UTkmidhBJPygVIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="243470627"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.157])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 01:20:18 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 11 Jun 2026 11:20:14 +0300 (EEST)
To: "M K, Muralidhara" <muralimk@amd.com>
cc: Muralidhara M K <muralidhara.mk@amd.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Subject: Re: [PATCH v4 4/7] platform/x86/amd/hsmp: Source metric-table size
 from firmware
In-Reply-To: <7d496898-ecc1-42d7-bbcd-1251038f332e@amd.com>
Message-ID: <210d3a07-bf77-b525-b03f-02fea5e4e833@linux.intel.com>
References: <20260528093954.2461272-1-muralidhara.mk@amd.com> <20260528093954.2461272-5-muralidhara.mk@amd.com> <3ccdf8eb-861a-970a-5c05-96c1ec54b473@linux.intel.com> <7d496898-ecc1-42d7-bbcd-1251038f332e@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-2117879531-1781166014=:1126"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2117879531-1781166014=:1126
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 11 Jun 2026, M K, Muralidhara wrote:
> On 6/10/2026 4:35 PM, Ilpo J=C3=A4rvinen wrote:
> > Caution: This message originated from an External Source. Use proper ca=
ution
> > when opening attachments, clicking links, or responding.
> >=20
> >=20
> > On Thu, 28 May 2026, Muralidhara M K wrote:
> >=20
> > > The driver hard-codes the metric-table region size to
> > > sizeof(struct hsmp_metric_table). That is correct for HSMP protocol
> > > version 6 but mis-sizes the ioremap of the SMU DRAM region on newer
> > > platforms: Family 1Ah Model 50h-5Fh exposes a ~13 KB
> > > hsmp_metric_table_zen6, and the table is expected to keep growing
> > > on future firmware. The same hard-coded value also forces
> > > hsmp_metric_tbl_read() to reject any read that follows the actual
> > > firmware layout.
> > >=20
> > > Pick up the table size from firmware instead. SMU on Family 1Ah
> > > Model 50h and later populates HSMP_GET_METRIC_TABLE_DRAM_ADDR's
> > > args[2] with the DRAM region size in bytes; older firmware leaves
> > > it 0. Bump the descriptor's response_sz to 3 so the field is read,
> > > store the value in hsmp_pdev.hsmp_table_size at probe time, and
> > > fall back to sizeof(struct hsmp_metric_table) when firmware reports
> > > 0. Use hsmp_table_size both for the devm_ioremap() of the region
> > > and as the upper bound for hsmp_metric_tbl_read().
> > >=20
> > > Behaviour on existing protocol-version-6 hardware is unchanged:
> > > firmware returns 0, the fallback yields the same value as the
> > > previous hard-coded one, and both the ioremap and the size check
> > > produce the same result as before.
> > >=20
> > > The ioctl interface added later in this series uses the same
> > > hsmp_table_size to validate the userspace request and to copy out
> > > the full firmware-reported region.
> > >=20
> > > Co-developed-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
> > > Signed-off-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
> > > Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
> > > ---
> > >   arch/x86/include/uapi/asm/amd_hsmp.h |  5 +++--
> > >   drivers/platform/x86/amd/hsmp/hsmp.c | 11 ++++++++---
> > >   drivers/platform/x86/amd/hsmp/hsmp.h |  1 +
> > >   3 files changed, 12 insertions(+), 5 deletions(-)
> > >=20
> > > diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h
> > > b/arch/x86/include/uapi/asm/amd_hsmp.h
> > > index fce271282348..438ac38d0dc8 100644
> > > --- a/arch/x86/include/uapi/asm/amd_hsmp.h
> > > +++ b/arch/x86/include/uapi/asm/amd_hsmp.h
> > > @@ -365,11 +365,12 @@ static const struct hsmp_msg_desc
> > > hsmp_msg_desc_table[]
> > >        {0, 0, HSMP_GET},
> > >=20
> > >        /*
> > > -      * HSMP_GET_METRIC_TABLE_DRAM_ADDR, num_args =3D 0, response_sz=
 =3D 2
> > > +      * HSMP_GET_METRIC_TABLE_DRAM_ADDR, num_args =3D 0, response_sz=
 =3D 3
> > >         * output: args[0] =3D lower 32 bits of the address
> > >         * output: args[1] =3D upper 32 bits of the address
> > > +      * output: args[2] =3D DRAM region size in bytes
> > >         */
> > > -     {0, 2, HSMP_GET},
> > > +     {0, 3, HSMP_GET},
> > >=20
> > >        /*
> > >         * HSMP_SET_XGMI_PSTATE_RANGE, num_args =3D 1, response_sz =3D=
 0
> > > diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c
> > > b/drivers/platform/x86/amd/hsmp/hsmp.c
> > > index 9bad58fef304..cf9392f99298 100644
> > > --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> > > +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> > > @@ -356,8 +356,7 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *=
sock,
> > > char *buf, size_t size)
> > >                return -ENOMEM;
> > >        }
> > >=20
> > > -     /* Do not support lseek(), also don't allow more than the size =
of
> > > metric table */
> > > -     if (size !=3D sizeof(struct hsmp_metric_table)) {
> > > +     if (size !=3D hsmp_pdev.hsmp_table_size) {
> > >                dev_err(sock->dev, "Wrong buffer size\n");
> > >                return -EINVAL;
> > >        }
> > > @@ -398,8 +397,14 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
> > >                dev_err(sock->dev, "Invalid DRAM address for metric
> > > table\n");
> > >                return -ENOMEM;
> > >        }
> > > +     /* SMU returns table size from Family 1Ah Model 50h and forward=
 */
> > > +     if (msg.args[2])
> > > +             hsmp_pdev.hsmp_table_size =3D msg.args[2];
> > > +     else
> > > +             hsmp_pdev.hsmp_table_size =3D sizeof(struct
> > > hsmp_metric_table);
> > > +
> > >        sock->metric_tbl_addr =3D devm_ioremap(sock->dev, dram_addr,
> > > -                                          sizeof(struct
> > > hsmp_metric_table));
> > > +                                          hsmp_pdev.hsmp_table_size)=
;
> > >        if (!sock->metric_tbl_addr) {
> > >                dev_err(sock->dev, "Failed to ioremap metric table
> > > addr\n");
> > >                return -ENOMEM;
> > > diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h
> > > b/drivers/platform/x86/amd/hsmp/hsmp.h
> > > index b153527e0a0d..e7f051475728 100644
> > > --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> > > +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> > > @@ -55,6 +55,7 @@ struct hsmp_plat_device {
> > >        u32 proto_ver;
> > >        u16 num_sockets;
> > >        bool is_probed;
> > > +     size_t hsmp_table_size;
> >=20
> > Please add types.h include.
> >=20
> In hsmp.h, size_t becomes visible without adding anything new, because th=
e
> file already includes linux/device.h, and that pulls in linux/types.h

Please don't rely on indirect include paths. The rule for includes is=20
Include What You Use.

There are some exceptions to the general rule such as linux/xx.h=20
including asm/xx.h, in such case you only need to add linux/xx.h.

--=20
 i.

--8323328-2117879531-1781166014=:1126--
