Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020781DF75B
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 Aug 2025 08:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755591686; cv=none; b=kyLpi/F/012HEUTfptt9c18iBY6guIFTarj9NQTcWvoAl6s31/VIduoTOt7SCv2Ilg3aBqL3ZAtFGiT6rroTjyhYFpzGTNcCtiv+Z4vI3j8N2KnfaIs7ex0NFgCfHJSRk88zlNxWIpnugDiDFAfPr264Xh3jn2LiFcneJhrmcrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755591686; c=relaxed/simple;
	bh=NpdDQpgUAJKNjgHebUDf5xR2ZPtYBp1hcykrgBItzhM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=itGTZfCzBG6EUWqAByZ+1nQ6cY2QvNd4a2M14zyfQofmjyCaBzoQAybofBcKrn2DTB5pQgGnpxVZfv9YDmlUPCD40RIrJQYfQZ1lKGI3UaJqyNAT4uAroaCPbY63bSTvDvQAKZqq8DLFm4zOvJ6orjanZO1++MtOa/zHixfcd8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dUgu50zB; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dUgu50zB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755591685; x=1787127685;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=NpdDQpgUAJKNjgHebUDf5xR2ZPtYBp1hcykrgBItzhM=;
  b=dUgu50zBzHV4HZnlC+C5AdTe+SHXX2jugpB+9mITJ8pj3pQH4q6X6sBb
   8dbYafMFriNChFAociJGY6uxYzd6+iLoDDNxgi2YPS2VqnWWLNQvmznZF
   g3Ek2aSzc1T2dLGkEwWFJtpxkBVVrgKPiv1ryQdjau1h1kWvn73npf43Q
   4xIoQPg3XwbhobQdFYngA5V09DjNiy8HPUo9IdZBxOqjC2BUsURU0l8Md
   BwxVl4M3u0+BMDqIU/P3NJQlNWRSC9AZZreD01mkyWszVcSPhjycKa/hV
   1iwbdYU46MshpFNymuNq3Xz6UyZDNxGW66ZM7wWNC9cJ7ZPKjukar4eW1
   g==;
X-CSE-ConnectionGUID: 13gsTCwfTfWJD3mjJXZhrA==
X-CSE-MsgGUID: dXlkB4AiQgKt2M0+dZ9K4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57975349"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="57975349"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 01:21:25 -0700
X-CSE-ConnectionGUID: gxKL9+R7TjGZBFbQFwhLxg==
X-CSE-MsgGUID: S1EXe/HKS4WztnoxPSQWVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="168021767"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.120])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 01:21:22 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 19 Aug 2025 11:21:16 +0300 (EEST)
To: Suma Hegde <Suma.Hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [PATCH v2 4/4] platform/x86/amd/hsmp: Ensure initialization of
 the sock struct in hsmp_send_message()
In-Reply-To: <534f7096-8ecb-490e-9aca-ee4ecde44e17@amd.com>
Message-ID: <4af1ad53-ba50-e916-123e-f0ac3e2ca951@linux.intel.com>
References: <20250723051251.3009625-1-suma.hegde@amd.com> <20250723051251.3009625-5-suma.hegde@amd.com> <11a77699-49f4-ac5f-4bce-6dedae7f0170@linux.intel.com> <dd58fb6a-021c-4467-9873-7832e2185ca2@amd.com> <534f7096-8ecb-490e-9aca-ee4ecde44e17@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1576189467-1755591676=:949"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1576189467-1755591676=:949
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sat, 2 Aug 2025, Suma Hegde wrote:
> On 7/24/2025 2:50 PM, Suma Hegde wrote:
> > On 7/23/2025 12:40 PM, Ilpo J=C3=A4rvinen wrote:
> > > On Wed, 23 Jul 2025, Suma Hegde wrote:
> > >=20
> > > > If all sockets are not probed, invoking hsmp_send_message() might r=
esult
> > > > in
> > > > unexpected behavior due to accessing an uninitialized socket struct=
ure.
> > > >=20
> > > > The initialization of the sock structure can be confirmed if sock->=
dev
> > > > is initialized.
> > > >=20
> > > > Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> > > > Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.=
com>
> > > > ---
> > > > Changes since v1:
> > > > New patch to address the partial probe/removal issue.
> > > >=20
> > > > =C2=A0 drivers/platform/x86/amd/hsmp/acpi.c | 4 ++++
> > > > =C2=A0 drivers/platform/x86/amd/hsmp/hsmp.c | 3 +++
> > > > =C2=A0 2 files changed, 7 insertions(+)
> > > >=20
> > > > diff --git a/drivers/platform/x86/amd/hsmp/acpi.c
> > > > b/drivers/platform/x86/amd/hsmp/acpi.c
> > > > index 15c4cedc2759..a2d91d4a3e02 100644
> > > > --- a/drivers/platform/x86/amd/hsmp/acpi.c
> > > > +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> > > > @@ -617,6 +617,10 @@ static int hsmp_acpi_probe(struct platform_dev=
ice
> > > > *pdev)
> > > >=20
> > > > =C2=A0 static void hsmp_acpi_remove(struct platform_device *pdev)
> > > > =C2=A0 {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 struct hsmp_socket *sock =3D dev_get_drvd=
ata(&pdev->dev);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 sock->dev =3D NULL;
> > > > +
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 guard(mutex)(&hsmp_lock);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * We register only one m=
isc_device even on multi-socket system.
> > > > diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c
> > > > b/drivers/platform/x86/amd/hsmp/hsmp.c
> > > > index e05d824045d6..a4420db42781 100644
> > > > --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> > > > +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> > > > @@ -219,6 +219,9 @@ int hsmp_send_message(struct hsmp_message *msg)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return -ENODEV;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sock =3D &hsmp_pdev.sock[msg->=
sock_ind];
> > > >=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 if (!sock->dev)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return -ENODEV;
> > > > +
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D down_interruptible(&so=
ck->hsmp_sem);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return ret;
> > > This is still racy. AFAICT, nothing prevents assigning NULL into sock=
->dev
> > > because of remove while hsmp_send_message() is running and that can r=
esult
> > > in dereferencing NULL.
> >=20
> > Could you please suggest on how to resolve this issue?

Maybe rwsem would help, remove takes it for write and accessor for read.
But I've not really looked deeply into the details (summer time and=20
everything).

> I will relocate hsmp_fops to acpi.c and plat.c from hsmp.c. Consequently,=
 the
> module reference
>=20
> count for hsmp_acpi should be incremented when the device file is opened.
>=20
> Does this solution address the issue adequately? Is it acceptable?

I'm not sure how that addresses the NULL assignment, but perhaps I'll just=
=20
need to see the code to follow it or maybe you were trying to suggest a=20
solution into some entirely different problem?

--=20
 i.

--8323328-1576189467-1755591676=:949--
