Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594D837BE6C;
	Mon, 29 Jun 2026 14:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782744755; cv=none; b=UDhkB7+yn7Ms67Aqwsx8/SkWKRI4oILHU50qT5dtJrUXHef3fEACdI4UuplNarzLN8ihsGzF+aYOLnIqH4lAvjmXlXWXmqF6E6wJR8Rl9lGABbtp5UqOYCJMjF2qyujabn4lWQofY/JOhWc45ZZodZM2B6brzNVIwtB9TelOuDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782744755; c=relaxed/simple;
	bh=IrAIRcK0ULaDnANt7bXx7W6LMfkqQkl8wWjGlZ2g9Rw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=KghSd350xOhxmQphKraMWbpoAxIDtM3RHFUrEig1jmmdwU4C28x8Ubs67tyPFxctC9lAdyw4pqESIU0fg3DqYxVbvs48+d81IITWUkYnFmT4LrI8dca7ZZDyhMOnhgtCunehQOVyQDXDOZdBWfQ3nbuUh0pSUIwYBYENX3A6iVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QDkpGKMX; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QDkpGKMX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782744755; x=1814280755;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=IrAIRcK0ULaDnANt7bXx7W6LMfkqQkl8wWjGlZ2g9Rw=;
  b=QDkpGKMX8qpLcTxhcrn1TylG9E58PVMOG0hwgE569o27AuN8QpUJOPF0
   A4UM5YmoUMdgAELk313FJyk83BjFAAJzbMh3UGL/9s0eE7mExc8jyUQe2
   kAPv5RCXHqH7kz9xnLTm3c9wwTaIifyvauBmfvOQ4i7sEzwcm+9ZCw/p+
   RLFtqMO1C7rsT4XtzntdxrbnoHPYUNlPny55JBNKpMi7VJ/e2+gsM6eub
   qjbTrcQAgZDsqGF5BQ5MVF0dwO0Na9ETkfLboPYcz3XenPES1FT/7Lh0c
   q+rnVywvl3UkcGVKrnN4fkUs3iw2ZoJOVxtuq4DaQoJVua5eOOZ4WWjeO
   w==;
X-CSE-ConnectionGUID: OMDIVQAERUmv+K5NzapznQ==
X-CSE-MsgGUID: XJA2nF2aSvWRgDR9g3Yyeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="87343193"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="87343193"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 07:52:34 -0700
X-CSE-ConnectionGUID: UF/w0xl/Rway8vHfnwwC3w==
X-CSE-MsgGUID: kaWvKmO/TLCS4SEXnXc+DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; 
   d="scan'208";a="249351458"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.42])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 07:52:31 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 29 Jun 2026 17:52:28 +0300 (EEST)
To: "M K, Muralidhara" <muralimk@amd.com>
cc: Muralidhara M K <muralidhara.mk@amd.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/4] platform/x86/amd/hsmp: Pass struct device explicitly
 to ACPI mailbox parsers
In-Reply-To: <fa120fd2-3ebd-4ef9-9882-773123ab2505@amd.com>
Message-ID: <368950aa-c12f-5dfe-93cc-dc8d4854e340@linux.intel.com>
References: <20260629073923.1595696-1-muralidhara.mk@amd.com> <20260629073923.1595696-4-muralidhara.mk@amd.com> <74e6fd67-4c10-8efa-7565-dab0dd008b5d@linux.intel.com> <fa120fd2-3ebd-4ef9-9882-773123ab2505@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-265294142-1782744748=:1167"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-265294142-1782744748=:1167
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 29 Jun 2026, M K, Muralidhara wrote:
> On 6/29/2026 6:16 PM, Ilpo J=C3=A4rvinen wrote:
> > Caution: This message originated from an External Source. Use proper ca=
ution
> > when opening attachments, clicking links, or responding.
> >=20
> >=20
> > On Mon, 29 Jun 2026, Muralidhara M K wrote:
> >=20
> > > hsmp_read_acpi_crs() and hsmp_read_acpi_dsd() read the ACPI handle an=
d
> > > emit error messages via sock->dev.  Pass the struct device explicitly=
 to
> > > both helpers instead of reading it back from sock->dev.
> > >=20
> > > This is a pure refactor with no functional change; it prepares for
> > > publishing sock->dev as the data-plane readiness gate only after the
> > > socket has been fully initialized, so the parsers must not depend on
> > > sock->dev already being set.
> > >=20
> > > Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
> > > Link:
> > > https://lore.kernel.org/platform-driver-x86/20260625123337.886435-5-m=
uralidhara.mk@amd.com/T/#u
> > > [1]
> > > ---
> > >   drivers/platform/x86/amd/hsmp/acpi.c | 22 +++++++++++-----------
> > >   1 file changed, 11 insertions(+), 11 deletions(-)
> > >=20
> > > diff --git a/drivers/platform/x86/amd/hsmp/acpi.c
> > > b/drivers/platform/x86/amd/hsmp/acpi.c
> > > index 8c3185ae6395..f7fbba4c6b66 100644
> > > --- a/drivers/platform/x86/amd/hsmp/acpi.c
> > > +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> > > @@ -107,7 +107,7 @@ static acpi_status hsmp_resource(struct acpi_reso=
urce
> > > *res, void *data)
> > >        return AE_OK;
> > >   }
> > >=20
> > > -static int hsmp_read_acpi_dsd(struct hsmp_socket *sock)
> > > +static int hsmp_read_acpi_dsd(struct hsmp_socket *sock, struct devic=
e
> > > *dev)
> > >   {
> > >        struct acpi_buffer buf =3D { ACPI_ALLOCATE_BUFFER, NULL };
> > >        union acpi_object *guid, *mailbox_package;
> > > @@ -116,10 +116,10 @@ static int hsmp_read_acpi_dsd(struct hsmp_socke=
t
> > > *sock)
> > >        int ret =3D 0;
> > >        int j;
> > >=20
> > > -     status =3D acpi_evaluate_object_typed(ACPI_HANDLE(sock->dev), "=
_DSD",
> > > NULL,
> > > +     status =3D acpi_evaluate_object_typed(ACPI_HANDLE(dev), "_DSD",=
 NULL,
> > >                                            &buf, ACPI_TYPE_PACKAGE);
> > >        if (ACPI_FAILURE(status)) {
> > > -             dev_err(sock->dev, "Failed to read mailbox reg offsets =
from
> > > DSD table, err: %s\n",
> > > +             dev_err(dev, "Failed to read mailbox reg offsets from D=
SD
> > > table, err: %s\n",
> > >                        acpi_format_exception(status));
> > >                return -ENODEV;
> > >        }
> > > @@ -142,7 +142,7 @@ static int hsmp_read_acpi_dsd(struct hsmp_socket
> > > *sock)
> > >        guid =3D &dsd->package.elements[0];
> > >        mailbox_package =3D &dsd->package.elements[1];
> > >        if (!is_acpi_hsmp_uuid(guid) || mailbox_package->type !=3D
> > > ACPI_TYPE_PACKAGE) {
> > > -             dev_err(sock->dev, "Invalid hsmp _DSD table data\n");
> > > +             dev_err(dev, "Invalid hsmp _DSD table data\n");
> > >                ret =3D -EINVAL;
> > >                goto free_buf;
> > >        }
> > > @@ -192,14 +192,14 @@ static int hsmp_read_acpi_dsd(struct hsmp_socke=
t
> > > *sock)
> > >        return ret;
> > >   }
> > >=20
> > > -static int hsmp_read_acpi_crs(struct hsmp_socket *sock)
> > > +static int hsmp_read_acpi_crs(struct hsmp_socket *sock, struct devic=
e
> > > *dev)
> > >   {
> > >        acpi_status status;
> > >=20
> > > -     status =3D acpi_walk_resources(ACPI_HANDLE(sock->dev),
> > > METHOD_NAME__CRS,
> > > +     status =3D acpi_walk_resources(ACPI_HANDLE(dev), METHOD_NAME__C=
RS,
> > >                                     hsmp_resource, sock);
> > >        if (ACPI_FAILURE(status)) {
> > > -             dev_err(sock->dev, "Failed to look up MP1 base address =
from
> > > CRS method, err: %s\n",
> > > +             dev_err(dev, "Failed to look up MP1 base address from C=
RS
> > > method, err: %s\n",
> > >                        acpi_format_exception(status));
> > >                return -EINVAL;
> > >        }
> > > @@ -207,10 +207,10 @@ static int hsmp_read_acpi_crs(struct hsmp_socke=
t
> > > *sock)
> > >                return -EINVAL;
> > >=20
> > >        /* The mapped region should be un-cached */
> > > -     sock->virt_base_addr =3D devm_ioremap_uc(sock->dev,
> > > sock->mbinfo.base_addr,
> > > +     sock->virt_base_addr =3D devm_ioremap_uc(dev, sock->mbinfo.base=
_addr,
> > >                                               sock->mbinfo.size);
> > >        if (!sock->virt_base_addr) {
> > > -             dev_err(sock->dev, "Failed to ioremap MP1 base address\=
n");
> > > +             dev_err(dev, "Failed to ioremap MP1 base address\n");
> > >                return -ENOMEM;
> > >        }
> > >=20
> > > @@ -232,12 +232,12 @@ static int hsmp_parse_acpi_table(struct device =
*dev,
> > > u16 sock_ind)
> > >        dev_set_drvdata(dev, sock);
> > >=20
> > >        /* Read MP1 base address from CRS method */
> > > -     ret =3D hsmp_read_acpi_crs(sock);
> > > +     ret =3D hsmp_read_acpi_crs(sock, dev);
> > >        if (ret)
> > >                return ret;
> > >=20
> > >        /* Read mailbox offsets from DSD table */
> > > -     return hsmp_read_acpi_dsd(sock);
> > > +     return hsmp_read_acpi_dsd(sock, dev);
> >=20
> > It would probably make more sense to have the arguments other way aroun=
d
> > (dev, sock) in both of these calls as dev is "complete" and we're still
> > filling sock at this point.
> >=20
> Thanks I will fix this.
>=20
> Ilpo, could you please confirm whether patches 0001 and 0002 have already=
 been
> accepted in the maintainer branch, or if I should resubmit them as v2 alo=
ng
> with patches 0003 and 0004 ?

I've not applied any patches yet in this cycle so please resubmit the=20
whole series.

--=20
 i.

--8323328-265294142-1782744748=:1167--
