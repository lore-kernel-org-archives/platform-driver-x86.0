Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8802A3C73E5;
	Thu,  7 May 2026 13:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778161454; cv=none; b=Gvp1ygyJ/WbdgJ3csBi4C9fUzDwTEwjvIqlim9lAaLaCWD46dCKjPNzzH5EcUaoc67dhLMFimrugQLke9Xfir9Pal5s9QsjJyuaeGCn3CDNPKTJD9y8T8szws8WqFuPU1dYXoNf3j66ymp18HH30iNK8lgPoOkzq1vgX8eMc18E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778161454; c=relaxed/simple;
	bh=5bxYhbPc3/cPyNFG7Vf21TxFhTBcsQQqpmSRwRnjy3I=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JSGnfcJ2A2GhCMybFFFoCd7X7NuT99CBo0OFWDh2tV8oc5V10eE1togtqVRVZavfWYDjRxtQXqP0ZNYptJW7Db7bDPdU16+3I0S0TAS2K4zAmJ2NxK2xrIlYY+zkUouBzv0aU7PleQHAV2HFQ3/nc1uLMPVLmX4gCyfhLHB5teg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W8yL/gfW; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W8yL/gfW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778161453; x=1809697453;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=5bxYhbPc3/cPyNFG7Vf21TxFhTBcsQQqpmSRwRnjy3I=;
  b=W8yL/gfWYEcAj5ohGxHHxfiCPiDy6B8FiuwxhS7HvHlR2SBeJegGH/pM
   iZAjFhMsuwu9dBQMct7wXz1aPWHqFExoTdQgBzDm5KzJCReW9tAljIXzm
   O06nLw1kCinrs3XcLltQx1KWezf1LZsffar4jisBXZWLP2qiKZa0jxPpd
   dcg+qhsJ0pI3W3O0wtmPzep5MWt51WwRoICuw4kzx5nZCWLzrmZVtIZLH
   2Jm+Lx/2VVUDupAo8LVAsEeOQcs68zB5nnrb6U6iFpL5IODphf+rb+oZm
   LOAtUqWNQFj1bqvBHMursEQ1mtDQsnQApEQnML6Wfls1eabkIRwO6CKh0
   Q==;
X-CSE-ConnectionGUID: VSnRC+KQSYemjAAQILDwlA==
X-CSE-MsgGUID: vGlo+oCgQbePyPOOYecSKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79102959"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="79102959"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 06:44:12 -0700
X-CSE-ConnectionGUID: sdHaJEp1SsySbN1gLJIScg==
X-CSE-MsgGUID: ArHHZWoSRgGN9GLJdr5Sxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="236726449"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.116])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 06:44:09 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 7 May 2026 16:44:06 +0300 (EEST)
To: Thorsten Blum <thorsten.blum@linux.dev>
cc: Prasanth Ksr <prasanth.ksr@dell.com>, Hans de Goede <hansg@kernel.org>, 
    Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: dell-wmi-sysman: use strnlen in
 strlcpy_attr
In-Reply-To: <afs5tVs4a59FRdzB@linux.dev>
Message-ID: <ed074d73-7f86-a24e-1cbf-4e02b856af05@linux.intel.com>
References: <20260502165707.242332-3-thorsten.blum@linux.dev> <fcff1484-24b6-ce49-bb5e-f7da3e711eea@linux.intel.com> <afs5tVs4a59FRdzB@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1401041204-1778161446=:983"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1401041204-1778161446=:983
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 6 May 2026, Thorsten Blum wrote:

> On Wed, May 06, 2026 at 02:53:46PM +0300, Ilpo J=E4rvinen wrote:
> > On Sat, 2 May 2026, Thorsten Blum wrote:
> >=20
> > > Use strnlen() to limit source string scanning to MAX_BUFF bytes. Retu=
rn
> > > early on error and make the "empty string means not applicable" case
> > > explicit.
> > >=20
> > > Use 'const char *' for the read-only source string while at it.
> >=20
> > Hi Thorsten,
> >=20
> > First of all, thanks for looking into these.
> >=20
> > > Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> > > ---
> > >  .../dell/dell-wmi-sysman/dell-wmi-sysman.h    |  2 +-
> > >  .../x86/dell/dell-wmi-sysman/sysman.c         | 20 ++++++++++-------=
--
> > >  2 files changed, 12 insertions(+), 10 deletions(-)
> > >=20
> > > diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysma=
n.h b/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
> > > index 5278a93fdaf7..f6943301b857 100644
> > > --- a/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
> > > +++ b/drivers/platform/x86/dell/dell-wmi-sysman/dell-wmi-sysman.h
> > > @@ -162,7 +162,7 @@ static ssize_t curr_val##_store(struct kobject *k=
obj,=09=09=09=09\
> > > =20
> > >  union acpi_object *get_wmiobj_pointer(int instance_id, const char *g=
uid_string);
> > >  int get_instance_count(const char *guid_string);
> > > -void strlcpy_attr(char *dest, char *src);
> > > +void strlcpy_attr(char *dest, const char *src);
> > > =20
> > >  int populate_enum_data(union acpi_object *enumeration_obj, int insta=
nce_id,
> > >  =09=09=09struct kobject *attr_name_kobj, u32 enum_property_count);
> > > diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/dri=
vers/platform/x86/dell/dell-wmi-sysman/sysman.c
> > > index 51d25fdc1389..6c9911accefc 100644
> > > --- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> > > +++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
> > > @@ -234,18 +234,20 @@ static const struct kobj_type attr_name_ktype =
=3D {
> > >   * @dest: Where to copy the string to
> > >   * @src: Where to copy the string from
> > >   */
> > > -void strlcpy_attr(char *dest, char *src)
> > > +void strlcpy_attr(char *dest, const char *src)
> > >  {
> > > -=09size_t len =3D strlen(src) + 1;
> > > +=09size_t len =3D strnlen(src, MAX_BUFF);
> > > =20
> > > -=09if (len > 1 && len <=3D MAX_BUFF)
> > > -=09=09strscpy(dest, src, len);
> > > -
> > > -=09/*len can be zero because any property not-applicable to attribut=
e can
> > > -=09 * be empty so check only for too long buffers and log error
> > > -=09 */
> > > -=09if (len > MAX_BUFF)
> > > +=09if (len =3D=3D MAX_BUFF) {
> > >  =09=09pr_err("Source string returned from BIOS is out of bound!\n");
> > > +=09=09return;
> > > +=09}
> > > +
> > > +=09/* Empty string means "not applicable" and is skipped intentional=
ly. */
> > > +=09if (len =3D=3D 0)
> > > +=09=09return;
> > > +
> > > +=09strscpy(dest, src, len + 1);
> >=20
> > And how exactly is this last line different from strscpy(dest, serc,=20
> > MAX_BUFF);
> >=20
> > ?
>=20
> The result is the same, but happy to use MAX_BUFF instead.

The size should be related to the output buffer(!) and not come from=20
length of the input (using input len is unsound way to engineer this). In=
=20
that sense, MAX_BUFF is better than using len, but see my question about=20
patch order below.

> However,
> since we already know the length of the source string and that it is
> NUL-terminated within the first MAX_BUFF bytes, we could just use
> memcpy(dest, src, len + 1) directly.

Using memcpy() would be wrong direction to take. It doesn't validate the=20
output length any better against the output buffer size than the current=20
approach does.

> > I agree something should be done here but I don't like this approach. T=
he=20
> > length passed to strscpy() should be "Size of the destination buffer" b=
ut=20
> > your approach calculated the length of the source string (?!):
> >=20
> > /**
> >  * strscpy - Copy a C-string into a sized buffer
> >  * @dst: Where to copy the string to
> >  * @src: Where to copy the string from
> >  * @...: Size of destination buffer (optional)
> >=20
> > So, to make it safe and sound logically, to me it looks more like the=
=20
> > _caller_ should pass the output buffer's size to this function. Or=20
> > alternatively, this function could be wrapped with a macro such that th=
e=20
> > sizeof(*dest) can still be checked to be of correct length.
>=20
> I have some other changes queued up and would prefer to change this in a
> follow-up patch since there are quite a few call sites that need to be
> updated.

Why exactly you have to make this change first at all? Can't this just be=
=20
placed after the other changes and done properly right away. Do those=20
other changes touch this same function so changing order is not easy?

> > Also, this function presents itself with str*() name like a generic str=
ing=20
> > copy function but what it really is more attr_check_and_copy(), it migh=
t=20
> > not copy anything if the checks fail.
>=20
> OK, I'll take this into account when changing the function signature.


--=20
 i.

--8323328-1401041204-1778161446=:983--
