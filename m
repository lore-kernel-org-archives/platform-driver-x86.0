Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313A61FDA;
	Thu,  9 Jan 2025 08:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736411690; cv=none; b=Io4n9npbTF7F/QfcbT8wetQxNa7+8cCH0wh9xkCZoXVN0IuMQDxcs23rj+dc/L96B+AZUAjL9sLnwak2F9RXRDjhhrAk28gcV2Ii9dz0NjgqNxJ0+DxxP8soneJAYkIVDf4lSyY7DuCO6gDB96MjcuA+6TFiMixt/E6yd0e1ETI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736411690; c=relaxed/simple;
	bh=EGVlCdRiyap1vP0GpkyslLcNoAzNIRwqBcWAKGshgGQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kcRXTffqt2rLpOOn/6pB61UA32cjfZxnN/TncjyxeXaDxhIe9+Gvs9W9g48WlJYSB4u6zZ2m8gcMoXiDbZhHnBnBsPdcfw4gtSqwhq74KsBtUGYErOnAXBrm7FV7pKOebwgafTmISFjV6g/gMoWByqxQDK0ssZN8J0ARVhApN7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i8fb8XG8; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i8fb8XG8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736411688; x=1767947688;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=EGVlCdRiyap1vP0GpkyslLcNoAzNIRwqBcWAKGshgGQ=;
  b=i8fb8XG8BBBRxk4PabFcn9oVZrFLg2KVh4v4ml7rIeXNgVFJTt1K7pIU
   q0wr7N883hepEZ97dCg1BNIHrlFVY2Vo8J4PDJ6thJ14BO8fxUSaKyURK
   8jfL3JdFu8D6qK2Zdp03aMvxcc8WFBeXjwydXwleQn9QPUGBOh/a7MvUb
   qNEu07nfSftcaJqPV/1/ey9cfXY3vzNznPlukEo0qkq0voKht6/n4QXxg
   YY/HEbJZW6n9GAHKwuauBy7UZ4s4qC+e6ktxvBzZQafScV3lA2SelxwUY
   iXG9eI6bAd31sNsEv07p0LewDmBsr5Mvjtg+TqI/G9FilMU1MKnI3p7c0
   g==;
X-CSE-ConnectionGUID: wfiiUjZdR5CMNfF2qInwqg==
X-CSE-MsgGUID: yPs2Kr/gT+mpdjJ9uSYZyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36822944"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; 
   d="scan'208";a="36822944"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 00:34:47 -0800
X-CSE-ConnectionGUID: ez4sk8aERdODoozIQ1eaMw==
X-CSE-MsgGUID: Tdp8+puPQZqfyYW17D/AVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="108397784"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.210])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 00:34:44 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 9 Jan 2025 10:34:40 +0200 (EET)
To: =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <thomas@t-8ch.de>
cc: Joshua Grisham <josh@joshuagrisham.com>, 
    Hans de Goede <hdegoede@redhat.com>, W_Armin@gmx.de, 
    platform-driver-x86@vger.kernel.org, corbet@lwn.net, 
    linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] platform/x86: samsung-galaxybook: Add samsung-galaxybook
 driver
In-Reply-To: <19caaf5c-dbdd-43a4-989f-35a810dbe91a@t-8ch.de>
Message-ID: <c3e7e78b-a38c-dcc2-092d-e1809ae02a4c@linux.intel.com>
References: <20241226153031.49457-1-josh@joshuagrisham.com> <fb019bc7-72ba-4b1b-9260-36cac76a5a60@t-8ch.de> <CAMF+KebS6eEGEVzrO3Bm3CfL7OYP7-XxUp7hLiDiwUrjWOEJYQ@mail.gmail.com> <19caaf5c-dbdd-43a4-989f-35a810dbe91a@t-8ch.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-263380260-1736411415=:938"
Content-ID: <8bdd376d-8e41-b552-289c-ddcb28b98d31@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-263380260-1736411415=:938
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <e76eb181-4edb-cd95-5af1-6c1161dd33ec@linux.intel.com>

On Wed, 8 Jan 2025, Thomas Wei=DFschuh wrote:
> On 2025-01-08 22:37:01+0100, Joshua Grisham wrote:
> > Hi Thomas! I was prepping my v5 patch to send in and trying to figure
> > out everything I changed for the change list comments, but I stumbled
> > on a few comments here that I wanted to ask you about as I realized I
> > did not fully address them.
> >=20
> > Den fre 3 jan. 2025 kl 20:37 skrev Thomas Wei=DFschuh <thomas@t-8ch.de>=
:
> > >
> >=20
> > > > +This driver implements the
> > > > +Documentation/userspace-api/sysfs-platform_profile.rst interface f=
or working
> > >
> > > You can make this real reST link which will be converted into a
> > > hyperlink.
> > >
> >=20
> > Here I actually tried this a few different ways (linking to the entire
> > page instead of a specific section within the page) but would always
> > get a warning and then no link when I built the docs. However, from
> > finding other examples then I found just giving the path like this is
> > actually giving me a link in both the htmldocs and pdfdocs with the
> > title of the target page exactly as I wanted... with that in mind,
> > does it seem ok to leave as-is or is there a syntax that you would
> > recommend instead to link directly to a page (and not a section within
> > a page)?
>=20
> If it works, then leave it as is.
> To exact warning would have been nice though :-)
>=20
> Did you try :ref:`userspace-api/sysfs-platform_profile`?
>=20
> > > > +static int galaxybook_acpi_method(struct samsung_galaxybook *galax=
ybook, acpi_string method,
> > > > +                               struct sawb *in_buf, size_t len, st=
ruct sawb *out_buf)
> > >
> > > in_buf and out_buf are always the same.
> > >
> > > > +{
> > > > +     struct acpi_buffer output =3D {ACPI_ALLOCATE_BUFFER, NULL};
> > > > +     union acpi_object in_obj, *out_obj;
> > > > +     struct acpi_object_list input;
> > > > +     acpi_status status;
> > > > +     int err;
> > > > +
> > > > +     in_obj.type =3D ACPI_TYPE_BUFFER;
> > > > +     in_obj.buffer.length =3D len;
> > > > +     in_obj.buffer.pointer =3D (u8 *)in_buf;
> > > > +
> > > > +     input.count =3D 1;
> > > > +     input.pointer =3D &in_obj;
> > > > +
> > > > +     status =3D acpi_evaluate_object_typed(galaxybook->acpi->handl=
e, method, &input, &output,
> > > > +                                         ACPI_TYPE_BUFFER);
> > > > +
> > > > +     if (ACPI_FAILURE(status)) {
> > > > +             dev_err(&galaxybook->acpi->dev, "failed to execute me=
thod %s; got %s\n",
> > > > +                     method, acpi_format_exception(status));
> > > > +             return -EIO;
> > > > +     }
> > > > +
> > > > +     out_obj =3D output.pointer;
> > > > +
> > > > +     if (out_obj->buffer.length !=3D len || out_obj->buffer.length=
 < SAWB_GUNM_POS + 1) {
> > > > +             dev_err(&galaxybook->acpi->dev, "failed to execute me=
thod %s; "
> > > > +                     "response length mismatch\n", method);
> > > > +             err =3D -EPROTO;
> > > > +             goto out_free;
> > > > +     }
> > > > +     if (out_obj->buffer.pointer[SAWB_RFLG_POS] !=3D RFLG_SUCCESS)=
 {
> > > > +             dev_err(&galaxybook->acpi->dev, "failed to execute me=
thod %s; "
> > > > +                     "device did not respond with success code 0x%=
x\n",
> > > > +                     method, RFLG_SUCCESS);
> > > > +             err =3D -ENXIO;
> > > > +             goto out_free;
> > > > +     }
> > > > +     if (out_obj->buffer.pointer[SAWB_GUNM_POS] =3D=3D GUNM_FAIL) =
{
> > > > +             dev_err(&galaxybook->acpi->dev,
> > > > +                     "failed to execute method %s; device responde=
d with failure code 0x%x\n",
> > > > +                     method, GUNM_FAIL);
> > > > +             err =3D -ENXIO;
> > > > +             goto out_free;
> > > > +     }
> > > > +
> > > > +     memcpy(out_buf, out_obj->buffer.pointer, len);
> > >
> > > Nit: This memcpy() could be avoided by having the ACPI core write dir=
ectly
> > > into out_buf. It would also remove the allocation.
> > >
> >=20
> > Now I have replaced in_buf and out_buf with just one parameter, buf.
> > Now it feels like I cannot write directly to it (since I am reusing
> > the same buf as the outgoing value) so have left the memcpy in place.
> > I guess I would need to choose to have 2 buffers or use one and do a
> > memcpy at the end like this (which is how I have it now in my v5
> > draft) .. am I thinking wrong here and/or is there a preference
> > between the two alternatives? I can just for now say that "usage" of
> > this function in all of the other functions feels easier to just have
> > one buffer... :)
>=20
> I'm not sure if there is a preference.
>=20
> But why can't you modify the buffer if it is shared between input and
> output? The caller already has to accept that its buffer will be
> overwritten.
> If it is overwritten once or twice should not matter.
>=20
> But maybe I'm misunderstanding.
>=20
> > > > +static int power_on_lid_open_acpi_set(struct samsung_galaxybook *g=
alaxybook, const bool value)
> > > > +{
> > > > +     struct sawb buf =3D { 0 };
> > > > +
> > > > +     buf.safn =3D SAFN;
> > > > +     buf.sasb =3D SASB_POWER_MANAGEMENT;
> > > > +     buf.gunm =3D GUNM_POWER_MANAGEMENT;
> > > > +     buf.guds[0] =3D GUDS_POWER_ON_LID_OPEN;
> > > > +     buf.guds[1] =3D GUDS_POWER_ON_LID_OPEN_SET;
> > > > +     buf.guds[2] =3D value ? 1 : 0;
> > >
> > > No need for the ternary.
> > >
> >=20
> > I did not have this before but it was requested to be added by Ilpo
> > IIRC. I am ok with either way but would just need to know which is
> > preferred between the two :)
>=20
> Then leave it as is.

Yes, in the bool -> uXX conversions, I prefer explicit values even if they=
=20
in many cases happen to match to what C implicit conversion does (if the=20
value wouldn't match to 1, you'd need to use that operator anyway).

"true" and "BIT(0)" are conceptially distinct things even if they map to=20
the same representation.

Having the explicit conversion confirms the submitter (hopefully :-))=20
spend a second to confirm that true =3D> 1 holds. Without the explicit=20
conversion, it would be hard to see what went on inside the submitter=20
head. I can ask for it today, but my perspective is long-term, say 5-10=20
years from now, the person might no longer be around and somebody ends up=
=20
staring a commit which has such a problem. Explicit conversion avoids that=
=20
ambiguity. (Obviously such problems are quire rare but could happen.)

--=20
 i.
--8323328-263380260-1736411415=:938--
