Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E242110;
	Mon, 29 Dec 2025 17:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767029556; cv=none; b=AO1EnAPLknxBFPxkDyk4Gs0PKvFDLsCgmKxurpsI/jJM8YWU99yJxoC+PeT+Qr26fcymzUN642JecAvK4eQNypBDE28Z0Ws+i9208WWxwcz+SctByFFSls3HdQRDN1kbChD4KE0zRk5dkrlJEVWALVdtA8lRZxkjDj0g6bRwVss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767029556; c=relaxed/simple;
	bh=KpxL2JLR8dicxc350W4fZEOKuUm50f4F9Hn5DYhY2Q4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=bpJ5G8byisMg4oTDFsVIpV3HHhtGvn5FESMAdlHz9Wm3J/YbdGTZyBu4uVKCoxTgkLSeccz2IBnYpLbpdtNNJLbUNpwqZDvtQnYHq5Y5roZYC3tIhNvFrdwgTGnYRzgYVicvw6Y7bpKvsb+aM54pHRfHzEoNlYFa+ae8df4jW2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OTXw+AY8; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OTXw+AY8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767029554; x=1798565554;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=KpxL2JLR8dicxc350W4fZEOKuUm50f4F9Hn5DYhY2Q4=;
  b=OTXw+AY8dCyBn2Moe/o+0z3AJpHh7tOAsmjo5plzqmdbdgdu4aYMEm2Q
   zHdnQyK/TirikBZ6XgCYbHjLsJShFcZRRMdEG9aKd2omvCVP6L/tya7M1
   UCyNgFtX9MEmcmrSR8riSivZ91RgmgMuiMTLOl/pDjJt3JvMbYvNxdNdm
   UDLdHPAYDpZpvq9vyOdSFI5wPgCrWlkDn1LN+PtQ0DFC75ZjsCbAoS9AW
   tP3hmktsnSQPwDK+pmbaCsSJktisaQsBf8DoQbPEopSo4YR4rEkE7/lGY
   PYtrUGUFjljm/wu1H4Q94HbDkhuy8Rw/YezBieuoylemyhqoIKYs3A/JS
   g==;
X-CSE-ConnectionGUID: CGq/b0wgR56Sb5/paubNjg==
X-CSE-MsgGUID: 7L4UyhPlSyCkAfj45y6jiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="86062616"
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="86062616"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 09:32:32 -0800
X-CSE-ConnectionGUID: 7Z+RHPA0Q/mawbvx28u/LQ==
X-CSE-MsgGUID: wigKmESrRkmLH3C44Y6Y/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="205860080"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.30])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 09:32:29 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 29 Dec 2025 19:32:26 +0200 (EET)
To: Benjamin Philip <benjamin.philip495@gmail.com>
cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, 
    "Derek J . Clark" <derekjohn.clark@gmail.com>, 
    Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH 4/5] platform/x86: think-lmi: fix column limit overflow
In-Reply-To: <877bu5gr48.fsf@gmail.com>
Message-ID: <69c27b14-5943-eab1-407c-209d8d484bc1@linux.intel.com>
References: <CAMEXYWcY-7Kn8V1EwZ=fUPFWDwnAHEuferY9Ap0zO6xfmXx4JQ@mail.gmail.com> <20251223191932.946794-1-benjamin.philip495@gmail.com> <CAMEXYWf_m8PL-ZGAv_1ufLp_1ryQK15ziaO90_OxmMV4VkpTPQ@mail.gmail.com> <572f5363-c23b-435f-a36b-7b708704a3c1@app.fastmail.com>
 <CAMEXYWf9TF=O_vZTSsc4T7Go4dVw=xw5zZfGWKhGWu8d4eHwrg@mail.gmail.com> <3b1fe510-4849-1950-1086-bc52bc43e65d@linux.intel.com> <877bu5gr48.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-768491810-1767028960=:23015"
Content-ID: <b19a388d-bc55-8725-1703-3a7046242286@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-768491810-1767028960=:23015
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <a042242e-8b6f-efd8-e011-1fab87b9b939@linux.intel.com>

On Mon, 29 Dec 2025, Benjamin Philip wrote:
> Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com> writes:
> > On Wed, 24 Dec 2025, Benjamin Philip wrote:
> >> "Mark Pearson" <mpearson-lenovo@squebb.ca> writes:
> >> > On Tue, Dec 23, 2025, at 2:24 PM, Benjamin Philip wrote:
> >> >> This commit handles some column limit overflows (that occur after f=
ixing
> >> >> their alignment), i.e. the following check:
> >> >>
> >> >> CHECK: line length of ... exceeds 100 columns
> >> >>
> >> >> by defining a constant opt, and replacing the offending
> >> >> expression with opt.
> >> >>
> >> >> Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
> >> >> ---
> >> >>  drivers/platform/x86/lenovo/think-lmi.c | 31 +++++++++++++++------=
----
> >> >>  1 file changed, 19 insertions(+), 12 deletions(-)
> >> >>
> >> >> diff --git a/drivers/platform/x86/lenovo/think-lmi.c
> >> >> b/drivers/platform/x86/lenovo/think-lmi.c
> >> >> index 1ada4d800383..07ba0d84720a 100644
> >> >> --- a/drivers/platform/x86/lenovo/think-lmi.c
> >> >> +++ b/drivers/platform/x86/lenovo/think-lmi.c
> >> >> @@ -1083,12 +1083,13 @@ static ssize_t type_show(struct kobject *ko=
bj,
> >> >> struct kobj_attribute *attr,
> >> >>  }
> >> >>
> >> >>  static ssize_t current_value_store(struct kobject *kobj,
> >> >> -=09=09struct kobj_attribute *attr,
> >> >> -=09=09const char *buf, size_t count)
> >> >> +=09=09=09=09   struct kobj_attribute *attr, const char *buf,
> >> >> +=09=09=09=09   size_t count)
> >> >>  {
> >> >>  =09struct tlmi_attr_setting *setting =3D to_tlmi_attr_setting(kobj=
);
> >> >>  =09char *set_str =3D NULL, *new_setting =3D NULL;
> >> >>  =09char *auth_str =3D NULL;
> >> >> +=09const char *opt;
> >> >>  =09int ret;
> >> >>
> >> >>  =09if (!tlmi_priv.can_set_bios_settings)
> >> >> @@ -1163,10 +1164,11 @@ static ssize_t current_value_store(struct k=
object *kobj,
> >> >>  =09=09=09ret =3D tlmi_save_bios_settings("");
> >> >>  =09} else { /* old non-opcode based authentication method (depreca=
ted) */
> >> >>  =09=09if (tlmi_priv.pwd_admin->pwd_enabled && tlmi_priv.pwd_admin-=
>password[0]) {
> >> >> +=09=09=09opt =3D encoding_options[tlmi_priv.pwd_admin->encoding];
> >> >>  =09=09=09auth_str =3D kasprintf(GFP_KERNEL, "%s,%s,%s;",
> >> >> -=09=09=09=09=09tlmi_priv.pwd_admin->password,
> >> >> -=09=09=09=09=09encoding_options[tlmi_priv.pwd_admin->encoding],
> >> >> -=09=09=09=09=09tlmi_priv.pwd_admin->kbdlang);
> >> >> +=09=09=09=09=09     tlmi_priv.pwd_admin->password,
> >> >> +=09=09=09=09=09     opt,
> >> >> +=09=09=09=09=09     tlmi_priv.pwd_admin->kbdlang);
> >> >>  =09=09=09if (!auth_str) {
> >> >>  =09=09=09=09ret =3D -ENOMEM;
> >> >>  =09=09=09=09goto out;
> >> >> @@ -1299,6 +1301,7 @@ static ssize_t save_settings_store(struct
> >> >> kobject *kobj, struct kobj_attribute *
> >> >>  =09=09=09=09   const char *buf, size_t count)
> >> >>  {
> >> >>  =09char *auth_str =3D NULL;
> >> >> +=09const char *opt;
> >> >>  =09int ret =3D 0;
> >> >>  =09int cmd;
> >> >>
> >> >> @@ -1347,9 +1350,10 @@ static ssize_t save_settings_store(struct
> >> >> kobject *kobj, struct kobj_attribute *
> >> >>  =09=09=09ret =3D tlmi_save_bios_settings("");
> >> >>  =09=09} else { /* old non-opcode based authentication method (depr=
ecated) */
> >> >>  =09=09=09if (tlmi_priv.pwd_admin->pwd_enabled && tlmi_priv.pwd_adm=
in->password[0]) {
> >> >> +=09=09=09=09opt =3D encoding_options[tlmi_priv.pwd_admin->encoding=
];
> >> >>  =09=09=09=09auth_str =3D kasprintf(GFP_KERNEL, "%s,%s,%s;",
> >> >>  =09=09=09=09=09=09     tlmi_priv.pwd_admin->password,
> >> >> -=09=09=09=09=09=09     encoding_options[tlmi_priv.pwd_admin->encod=
ing],
> >> >> +=09=09=09=09=09=09     opt,
> >> >>  =09=09=09=09=09=09     tlmi_priv.pwd_admin->kbdlang);
> >> >>  =09=09=09=09if (!auth_str) {
> >> >>  =09=09=09=09=09ret =3D -ENOMEM;
> >> >> @@ -1381,11 +1385,13 @@ static ssize_t save_settings_store(struct
> >> >> kobject *kobj, struct kobj_attribute *
> >> >>  static struct kobj_attribute save_settings =3D __ATTR_RW(save_sett=
ings);
> >> >>
> >> >>  /* ---- Debug
> >> >> interface---------------------------------------------------------
> >> >> */
> >> >> -static ssize_t debug_cmd_store(struct kobject *kobj, struct
> >> >> kobj_attribute *attr,
> >> >> -=09=09=09=09const char *buf, size_t count)
> >> >> +static ssize_t debug_cmd_store(struct kobject *kobj,
> >> >> +=09=09=09       struct kobj_attribute *attr, const char *buf,
> >> >> +=09=09=09       size_t count)
> >> >>  {
> >> >>  =09char *set_str =3D NULL, *new_setting =3D NULL;
> >> >>  =09char *auth_str =3D NULL;
> >> >> +=09const char *opt;
> >> >>  =09int ret;
> >> >>
> >> >>  =09if (!tlmi_priv.can_debug_cmd)
> >> >> @@ -1397,10 +1403,11 @@ static ssize_t debug_cmd_store(struct kobje=
ct
> >> >> *kobj, struct kobj_attribute *attr
> >> >>  =09=09return -ENOMEM;
> >> >>
> >> >>  =09if (tlmi_priv.pwd_admin->pwd_enabled && tlmi_priv.pwd_admin->pa=
ssword[0]) {
> >> >> +=09=09opt =3D encoding_options[tlmi_priv.pwd_admin->encoding];
> >> >>  =09=09auth_str =3D kasprintf(GFP_KERNEL, "%s,%s,%s;",
> >> >> -=09=09=09=09tlmi_priv.pwd_admin->password,
> >> >> -=09=09=09=09encoding_options[tlmi_priv.pwd_admin->encoding],
> >> >> -=09=09=09=09tlmi_priv.pwd_admin->kbdlang);
> >> >> +=09=09=09=09     tlmi_priv.pwd_admin->password,
> >> >> +=09=09=09=09     opt,
> >> >> +=09=09=09=09     tlmi_priv.pwd_admin->kbdlang);
> >> >>  =09=09if (!auth_str) {
> >> >>  =09=09=09ret =3D -ENOMEM;
> >> >>  =09=09=09goto out;
> >> >> @@ -1775,7 +1782,7 @@ static int tlmi_analyze(struct wmi_device *wd=
ev)
> >> >>  =09=09=09=09=09=09ffs(tlmi_priv.pwdcfg.ext.hdd_user_password) - 1;
> >> >>  =09=09=09}
> >> >>  =09=09=09if (tlmi_priv.pwdcfg.ext.nvme_user_password ||
> >> >> -=09=09=09=09=09tlmi_priv.pwdcfg.ext.nvme_master_password) {
> >> >> +=09=09=09    tlmi_priv.pwdcfg.ext.nvme_master_password) {
> >> >>  =09=09=09=09tlmi_priv.pwd_nvme->pwd_enabled =3D true;
> >> >>  =09=09=09=09if (tlmi_priv.pwdcfg.ext.nvme_master_password)
> >> >>  =09=09=09=09=09tlmi_priv.pwd_nvme->index =3D
> >> >> --
> >> >> 2.52.0
> >> >
> >> > I'll defer to the pdx86 reviewers for this set of changes.
> >> >
> >> > This seems to me to make things more complicated than needed, purely=
=20
> >> > to address a 100 column limit. I personally don't like the change.=
=20
> >> >
> >> > Nothing wrong with the code, and if more experienced maintainers pre=
fer it, I'm happy to defer to them. Otherwise it seems to me noise for the =
sake of noise I'm afraid
> >> >
> >> > Mark
> >>=20
> >> An alternative could be to set this a constant pwd_admin to
> >> tlmi_priv.pwd_admin. There are 13 other references to
> >> tlmi_priv.pwd_admin in one function alone, so maybe it might be a more
> >> meaningful improvement?
> >
> > Hi,
> >
> > The general theme in this driver seems to be that tlmi_priv.pwd_admin=
=20
> > usually causes long lines so introducing a local variable for it in suc=
h=20
> > functions would certainly help.
> >
> > This probably came to be when pwd_admin was migrated over into tlmi_pri=
v=20
> > which certainly was correct place for it, but case with the cost of add=
ing=20
> > into the line lengths.
> >
>=20
> In this case, would you prefer that a local variable for pwd_admin be
> introduced instead of variables for values in the long lines?=20

Mark who's the maintainer seems to be against it, so I don't want to step
too strongly on his lot in this. It's merely my opinion how we normally=20
handle cases like this (I probably didn't express that clearly enough).

That being said, I think there are very good reasons for the 100 limit=20
but it also varies how imporant the bit that is very right columnwise is=20
(and function parameters that don't contain odd logic in them are quite=20
low on that list, only little above container_of() boilerplate).

> >> Then again, the question arises why we aren't following the same patte=
rn
> >> for all the other heavily used fields under tlmi_priv. Adding more
> >> constants seems to be wrong way forward.
> >
> > Locally it might make sense on case by case basis, to me it looks=20
> > business as usual to store things into function local vars to control=
=20
> > deref line lengths.
> >
> >> Another option would be to move repeated functionality into other
> >> functions (all the column limit violations seem to be identical and
> >> involve encoding_options and kasprintf in the same way), but a refacto=
r
> >> of this nature seemed *way* beyond the scope of a simple code syle cle=
an
> >> up.
> >>=20
> >> Thus, assigning the required value to a small constant seemed to be th=
e
> >> best immediate solution. I can see why you feel it adds complexity.
> >> Typically in a dynamic language (or even in a declare-as-you-need code
> >> style in C) this is a trivial change, whereas in a top-of-block style
> >> this does seem to add some cruft.
> >>=20
> >> Perhaps we should drop this patch for now? Nevertheless, I think the
> >> column limit violations, long functions, and repeated lines are a sign
> >> that some refactoring is in order.
> >>=20
> >> Thoughts?
> >
> > As a general note on these changes, I'm wondering if you're planning on=
=20
> > doing these checkpatch cleanups for a large number of drivers beyond th=
ose=20
> > you've already submitted (which you likely won't be able to test for=20
> > real)?
> >
> > I'm asking this because "fixing" in-tree checkpatch errors/warnings is=
=20
> > generally not considered something one should be doing without other wo=
rk=20
> > on the particular drivers (which normally implies proper testing beyond=
=20
> > compiling). Checkpatch has its uses, but this is not one of them.
> >
> > --=20
> >  i.
>=20
> As of right now, I planned to send a checkpatch cleanup for
> thinkpad-acpi at something point, but nothing more than that. I
> understand why any fixes imply proper testing. In the case of this
> patchset I can definitely test the changes, since the machine I created
> these patches uses this driver.
>=20
> I would have thought that checkpatch "fixes" would have some value alone
> (although minimal). I'm guessing you do not encourage coccinelle, sparse
> or kasan "fixes" without prior work as well?

I do run sparse almost daily here and it's warnings are much more valuable=
=20
over checkpatch's (excluding the recent addition of "error: bad constant=20
expression" madness thanks to Kees (IIRC) which I now have to filter away=
=20
~forever)!

I'm also under impression that kasan also points out problems which are=20
not pure stylistics preferences.

However, when we start to remove extra parenthesis because checkpatch has=
=20
some rule that doesn't like using parenthesis to group logic, and somebody=
=20
has to spend cycles to review those patches, I think we've reached a point=
=20
of negative returns. It's surprisingly hard to visually check such patch=20
for correct nesting, so there's a real risk as well with it.

I'm not entirely convinced by all checkpatch rules to begin with, one=20
needs to take its output with a grain of salt.

> I'm sorry if these cleanups have been just noise and a misuse of
> checkpatch. My intention with these patches was to get a feel for the
> development process, the code base and the tooling before moving
> towards any "real" contributions.

It's just finding a logic issue has way more value than pure syntax=20
changes. Perhaps checkpatch doesn't teach much about tools needed for=20
"real" contributions ;-) (I can see some value in learning to deal with=20
the patch submission and feedback process though).

And if you really intend to work with these drivers beyond cleanup you're=
=20
now submitting to, I certainly find it less disruptive than doing it on a=
=20
large-scale to random things.

--=20
 i.
--8323328-768491810-1767028960=:23015--
