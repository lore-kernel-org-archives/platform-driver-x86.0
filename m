Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CA3263F47
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 May 2025 13:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747833448; cv=none; b=mE+J6/jjQMlXorrYgbfW7APXSpRGIyDvlcnxY55Jho2LRNOEZ37mvukWmzrai42UqWU947t2hmAPd6UZK52+KdgnvKcmfq8BAr5Mu6txqkpsiuAZeHHq468XPCTw3tdbVVPbe3S+Dk65DzvGVKwb/EbAo0lTs9TQ+6j70J3jdD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747833448; c=relaxed/simple;
	bh=AGitY9ZKZr9kbIawVEawejU1JWnv9FkrzFdcIBwNfhg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=F6+tmgz2JASO+j2ULwnnaSFKxvshYLRjST1Q0BDKKkhtv2i09WcQxiR7ZONJfjqGZUsuROcuo3XcJbbwOwnFEwvzVug0SoHEoh4zGSke2UuG5yeaphWy0ksa66vVULp2lSAI3cX9wqN5fQGtUFwC/P+Xnmo3iazfHwq0omswCy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GSBKFgVQ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GSBKFgVQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747833447; x=1779369447;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=AGitY9ZKZr9kbIawVEawejU1JWnv9FkrzFdcIBwNfhg=;
  b=GSBKFgVQGwCaWD5Kc0Py88dluA0t/4omk7msUN3gG2tos+9SF+dSMadU
   RvCGe+Zrw1ja/vDfdEPBmiBAIL8M8HvfTdg3rpeDpzxzbAgUJfI98Owhs
   yjdyShWCpX74ZBn8KgKLKNAb/cFPVvVkHTTfnaFb9M739PqZJ6Kdb7ggR
   qHA9wd9rB+PCTDafYRaTUiSK+VhRbfj+xgP7vdcbT9riMmgqwEBmNeN0g
   P6/IrWZI2ZgMc1KdDauptzRhI67aO0SVleDztJt3AR9STuzt807IW0RcA
   4ToL448scgCLW7FjC3cRjWOlrn79C71hEbf1iSN2luLJb2WzWupCH6n8L
   Q==;
X-CSE-ConnectionGUID: sIgY9E8+TbuvEOxqgtEqIQ==
X-CSE-MsgGUID: UOsCbRhjTPGApYfnARy5oA==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="53607437"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="53607437"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 06:17:26 -0700
X-CSE-ConnectionGUID: l1eoq4CMTsaBmjA3Ean7+Q==
X-CSE-MsgGUID: kN/LLX7qQ0C5bzE9NpkiKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="139918321"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.221])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 06:17:24 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 21 May 2025 16:17:19 +0300 (EEST)
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH 4/4] platform/x86/intel/pmt: support BMG crashlog
In-Reply-To: <IA1PR11MB6418FE0AB33CEE6D7BFD5818C19EA@IA1PR11MB6418.namprd11.prod.outlook.com>
Message-ID: <6af9a2a7-549f-ec06-c426-e2981d811fea@linux.intel.com>
References: <20250516150416.210625-1-michael.j.ruhl@intel.com> <20250516150416.210625-5-michael.j.ruhl@intel.com> <c63b6778-ecf5-e025-4f16-07a35a105e89@linux.intel.com> <IA1PR11MB6418FE0AB33CEE6D7BFD5818C19EA@IA1PR11MB6418.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-605913927-1747832673=:946"
Content-ID: <e1d71b88-2bba-7432-7e9b-1416b89535a2@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-605913927-1747832673=:946
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <62f2e900-faf6-8568-11fe-4f6a752de356@linux.intel.com>

On Wed, 21 May 2025, Ruhl, Michael J wrote:

> >-----Original Message-----
> >From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> >Sent: Monday, May 19, 2025 11:52 AM
> >To: Ruhl, Michael J <michael.j.ruhl@intel.com>
> >Cc: platform-driver-x86@vger.kernel.org
> >Subject: Re: [PATCH 4/4] platform/x86/intel/pmt: support BMG crashlog
> >
> >On Fri, 16 May 2025, Michael J. Ruhl wrote:
> >
> >> The Battlemage GPU has the type 1 version 2 crashlog
> >> feature.
> >>
> >> Update the crashlog driver to support this crashlog
> >> version.
> >
> >Too short lines.
> >
> >> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> >> ---
> >>  drivers/platform/x86/intel/pmt/class.h    |   2 +
> >>  drivers/platform/x86/intel/pmt/crashlog.c | 328 +++++++++++++++++++--=
-
> >>  2 files changed, 288 insertions(+), 42 deletions(-)
> >>
> >> diff --git a/drivers/platform/x86/intel/pmt/class.h
> >b/drivers/platform/x86/intel/pmt/class.h
> >> index 6b3455a86471..9c0c7e2efecf 100644
> >> --- a/drivers/platform/x86/intel/pmt/class.h
> >> +++ b/drivers/platform/x86/intel/pmt/class.h
> >> @@ -31,6 +31,8 @@ struct telem_endpoint {
> >>  };
> >>
> >>  struct intel_pmt_header {
> >> +=09u32=09type;
> >> +=09u32=09version;
> >>  =09u32=09base_offset;
> >>  =09u32=09size;
> >>  =09u32=09guid;
> >> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c
> >b/drivers/platform/x86/intel/pmt/crashlog.c
> >> index c9bfe1c26311..700a51d2563a 100644
> >> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> >> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> >> @@ -23,10 +23,17 @@
> >>  #define CRASH_TYPE_OOBMSM=091
> >>
> >>  /* Crashlog Discovery Header */
> >> -#define CONTROL_OFFSET=09=090x0
> >> -#define GUID_OFFSET=09=090x4
> >> -#define BASE_OFFSET=09=090x8
> >> -#define SIZE_OFFSET=09=090xC
> >> +#define CONTROL_OFFSET=09=090x00
> >> +#define GUID_OFFSET=09=090x04
> >> +#define BASE_OFFSET=09=090x08
> >> +#define SIZE_OFFSET=09=090x0C
> >
> >Why did you change this group at all?
>=20
> Was going for "consistency" on the byte definitions, but then apparently =
forgot in the
> following section (0x00)...
>=20
> will remove the change.
>=20
> >> +#define TYPE1_VER0_CONTROL_OFFSET=090x0
> >> +#define TYPE1_VER0_STATUS_OFFSET=090x0
> >> +
> >> +#define TYPE1_VER2_CONTROL_OFFSET=090x14
> >> +#define TYPE1_VER2_STATUS_OFFSET=090x0
> >> +
> >>  #define GET_ACCESS(v)=09=09((v) & GENMASK(3, 0))
> >>  /* size is in bytes */
> >>  #define GET_SIZE(v)=09=09((v) * sizeof(u32))
> >> @@ -56,9 +63,37 @@ struct type1_ver0_base {
> >>  =09u32 complete:=09=091;  /* ro/v  31:31 */
> >>  };
> >>
> >> +struct type1_ver2_status {
> >> +=09u32 access_type:=094;  /* ro    0:3  */
> >> +=09u32 crash_type:=09=094;  /* ro    4:7  */
> >> +=09u32 count:=09=098;  /* ro    8:15 */
> >> +=09u32 version:=09=094;  /* ro   16:19 */
> >> +=09u32 clear_support:=091;  /* ro   20:20 */
> >> +=09u32 rsvd:=09=094;  /* ro   21:24 */
> >> +=09u32 rearmed:=09=091;  /* ro   25:25 */
> >> +=09u32 error:=09=091;  /* ro   26:26 */
> >> +=09u32 consumed:=09=091;  /* ro   27:27 */
> >> +=09u32 disable:=09=091;  /* ro   28:28 */
> >> +=09u32 cleared:=09=091;  /* ro   29:29 */
> >> +=09u32 in_progress:=091;  /* ro   30:30 */
> >> +=09u32 complete:=09=091;  /* ro   31:31 */
> >
> >See, now you're adding GENMASK()/BIT() arguments into the comment when
> >the
> >struct/C bitfield doesn't document that for you. I think this conversion
> >away from GENMASK()/BIT() was a step backwards.
> >
> >> +};
> >> +
> >> +struct type1_ver2_control {
> >> +=09u32 rsvd0:=09=0925; /* ro    0:24 */
> >> +=09u32 consumed:=09=091;  /* rw/v 25:25 */
> >> +=09u32 rsvd1:=09=091;  /* ro/v 26:26 */
> >> +=09u32 rsvd2:=09=091;  /* ro/v 27:27 */
> >
> >Why aren't these two combined?
>=20
> There was a different bit defined there before (not rsvd)  I will combine=
=2E
>=20
> >> +=09u32 rearm:=09=091;  /* rw/v 28:28 */
> >> +=09u32 manual:=09=091;  /* rw/v 29:29 */
> >> +=09u32 clear:=09=091;  /* rw/v 30:30 */
> >> +=09u32 disable:=09=091;  /* rw/v 31:31 */
> >
> >Really, they converted most bits into reserved (which is fine) but not
> >only that, they also relocated the remaining bits just because they
> >could. :-(
>=20
> Yup, which is why I was having difficulty with the BIT() definitions...

I think I managed to get confused myself about control and status ones.

> >> +};
> >> +
> >>  struct crashlog_status {
> >>  =09union {
> >>  =09=09struct type1_ver0_base stat;
> >> +=09=09struct type1_ver2_status stat2;
> >>  =09=09u32 status;
> >>  =09};
> >>  };
> >> @@ -66,6 +101,7 @@ struct crashlog_status {
> >>  struct crashlog_control {
> >>  =09union {
> >>  =09=09struct type1_ver0_base ctrl;
> >> +=09=09struct type1_ver2_control ctrl2;
> >>  =09=09u32 control;
> >>  =09};
> >>  };
> >> @@ -75,97 +111,174 @@ struct pmt_crashlog_priv {
> >>  =09struct crashlog_entry=09entry[];
> >>  };
> >>
> >> +static u32 get_control_offset(struct intel_pmt_header *hdr)
> >> +{
> >> +=09return hdr->version =3D=3D 0 ? TYPE1_VER0_CONTROL_OFFSET :
> >TYPE1_VER2_CONTROL_OFFSET;
> >> +}
> >> +
> >> +static u32 get_status_offset(struct intel_pmt_header *hdr)
> >> +{
> >> +=09return hdr->version =3D=3D 0 ? TYPE1_VER0_STATUS_OFFSET :
> >TYPE1_VER2_STATUS_OFFSET;
> >> +}
> >
> >I suggest you create some per version const version info struct which
> >holds all the relevant offsets, field bitmasks that got changed, and
> >attrs (perhaps more, the code is complex enough I didn't try to
> >understand evenything until it look cleaner). Basically, whenever you wa=
nt
> >to check what the version is and behave differently, consider if you can
> >put that somehow into the per version info struct without needed to use
> >if () / elvis op logic at all.
>=20
> So something like this:
>=20
> struct crashlog_offset {
> =09int disabled;
> =09int cleared;
> =09int manual;
> =09int complete;
> =09int rearmed;
> =09int error;
> =09int consumed;
> =09int in_progress;
> =09int set_consumed;
> =09int set_rearm;
> =09int set_manual;
> =09int set_clear;
> =09int set_disable;

Use u32 and put the mask/bit into them. But only put the ones which are=20
really different, not the ones which are the same.

> } offset;
>=20
> if (version =3D=3D 0) {
> =09offset.disabled(28);
> =09offset.set_disabled =3D BIT(28);

Not in the function code at all, you construct them like:

const struct crahslog_offset *crashlog_v0 =3D {
=09.control_offset =3D TYPE1_VER0_CONTROL_OFFSET,
=09...
=09.control_disable =3D CRASHLOG_FLAG_VER0_CONTROL_DISABLE,
};

Then, at init time, save pointer to crashlog_v0 or crashlog_v2 somewhere=20
so you don't need any ifs in the other functions as you can just deref
the correct one.

I suggest you consider removing low-value chars from those define names=20
such as "FLAG", and shortening CONTROL to CTRL, VER -> V, etc. to control=
=20
the horizontal space better.

> }
> if (version =3D=3D 2) {
> =09offset.disabled =3D BIT(28);
> =09offset.set_disabled =3D BIT(31);
> }
>=20
> ?  (or did you have a different example?)
>=20
> I am not sure I am following what you would like to see here...
>=20
> >Also now, after reading this patch, I'm even more convinced you want to
> >keep using BIT/GENMASK(), not C bitfields because the former just happen=
s
> >to be more flexible allowing the mask values to be easily put into the
> >info struct.
> >
> >>  /*
> >>   * I/O
> >>   */
> >>  static bool pmt_crashlog_complete(struct intel_pmt_entry *entry)
> >>  {
> >> +=09u32 offset =3D get_status_offset(&entry->header);
> >>  =09struct crashlog_status status =3D {
> >> -=09=09.status =3D readl(entry->disc_table + CONTROL_OFFSET),
> >> +=09=09.status =3D readl(entry->disc_table + offset),
> >>  =09};
> >>
> >>  =09/* return current value of the crashlog complete flag */
> >> -=09return status.stat.complete;
> >> +=09if (entry->header.version =3D=3D 0)
> >> +=09=09return status.stat.complete;
> >>
> >> +=09return status.stat2.complete;
> >>  }
> >>
> >>  static bool pmt_crashlog_disabled(struct intel_pmt_entry *entry)
> >>  {
> >> +=09u32 offset =3D get_status_offset(&entry->header);
> >>  =09struct crashlog_status status =3D {
> >> -=09=09.status =3D readl(entry->disc_table + CONTROL_OFFSET),
> >> +=09=09.status =3D readl(entry->disc_table + offset),
> >>  =09};
> >>
> >>  =09/* return current value of the crashlog disabled flag */
> >> -=09return status.stat.disable;
> >> +=09if (entry->header.version =3D=3D 0)
> >> +=09=09return status.stat.disable;
> >> +
> >> +=09return status.stat2.disable;
> >>  }
> >>
> >> -static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
> >> +static bool pmt_crashlog_supported(struct intel_pmt_entry *entry, u32
> >*crash_type, u32 *version)
> >>  {
> >>  =09struct crashlog_control discovery_header =3D {
> >>  =09=09.control =3D readl(entry->disc_table + CONTROL_OFFSET),
> >>  =09};
> >> -=09u32 crash_type, version;
> >>
> >> -=09crash_type =3D discovery_header.ctrl.crash_type;
> >> -=09version =3D discovery_header.ctrl.version;
> >> +=09*crash_type =3D discovery_header.ctrl.crash_type;
> >> +=09*version =3D discovery_header.ctrl.version;
> >>
> >>  =09/*
> >> -=09 * Currently we only recognize OOBMSM version 0 devices.
> >> -=09 * We can ignore all other crashlog devices in the system.
> >> +=09 * Currently we only recognize OOBMSM (type 1) and version 0 or 2
> >> +=09 * devices.
> >> +=09 *
> >> +=09 * Ignore all other crashlog devices in the system.
> >>  =09 */
> >> -=09return crash_type =3D=3D CRASH_TYPE_OOBMSM && version =3D=3D 0;
> >> +=09if (*crash_type =3D=3D CRASH_TYPE_OOBMSM && (*version =3D=3D 0 ||
> >*version =3D=3D 2))
> >> +=09=09return true;
> >> +
> >> +=09return false;
> >>  }
> >>
> >>  static void pmt_crashlog_set_disable(struct intel_pmt_entry *entry,
> >>  =09=09=09=09     bool disable)
> >>  {
> >> +=09u32 offset =3D get_control_offset(&entry->header);
> >>  =09struct crashlog_control control =3D {
> >> -=09=09.control =3D readl(entry->disc_table + CONTROL_OFFSET),
> >> +=09=09.control =3D readl(entry->disc_table + offset),
> >>  =09};
> >>
> >> -=09/* clear trigger bits so we are only modifying disable flag */
> >> -=09control.ctrl.clear =3D 0;
> >> -=09control.ctrl.manual =3D 0;
> >> -=09control.ctrl.complete =3D 0;
> >> +=09if (entry->header.version =3D=3D 0) {
> >> +=09=09/* clear trigger bits so we are only modifying disable flag */
> >> +=09=09control.ctrl.clear =3D 0;
> >> +=09=09control.ctrl.manual =3D 0;
> >> +=09=09control.ctrl.complete =3D 0;
> >>
> >> -=09if (disable)
> >> -=09=09control.ctrl.disable =3D 1;
> >> -=09else
> >> -=09=09control.ctrl.disable =3D 0;
> >> +=09=09control.ctrl.disable =3D disable;
> >> +=09} else {
> >> +=09=09control.ctrl2.manual =3D 0;
> >> +=09=09control.ctrl2.clear =3D 0;
> >>
> >> -=09writel(control.control, entry->disc_table + CONTROL_OFFSET);
> >> +=09=09control.ctrl2.disable =3D disable;
> >> +=09}
> >> +
> >> +=09writel(control.control, entry->disc_table + offset);
> >>  }
> >>
> >>  static void pmt_crashlog_set_clear(struct intel_pmt_entry *entry)
> >>  {
> >> +=09u32 offset =3D get_control_offset(&entry->header);
> >>  =09struct crashlog_control control =3D {
> >> -=09=09.control =3D readl(entry->disc_table + CONTROL_OFFSET),
> >> +=09=09.control =3D readl(entry->disc_table + offset),
> >>  =09};
> >>
> >> -=09/* clear trigger bits so we are only modifying disable flag */
> >> -=09control.ctrl.disable =3D 0;
> >> -=09control.ctrl.manual =3D 0;
> >> -=09control.ctrl.complete =3D 0;
> >> +=09if (entry->header.version =3D=3D 0) {
> >> +=09=09/* clear trigger bits so we are only modifying disable flag */
> >> +=09=09control.ctrl.disable =3D 0;
> >> +=09=09control.ctrl.manual =3D 0;
> >> +=09=09control.ctrl.complete =3D 0;
> >> +
> >> +=09=09control.ctrl.clear =3D 1;
> >> +=09} else {
> >> +=09=09control.ctrl2.disable =3D 0;
> >> +=09=09control.ctrl2.manual =3D 0;
> >>
> >> -=09control.ctrl.clear =3D 1;
> >> +=09=09control.ctrl2.clear =3D 1;
> >> +=09}
> >>
> >> -=09writel(control.control, entry->disc_table + CONTROL_OFFSET);
> >> +=09writel(control.control, entry->disc_table + offset);
> >>  }
> >>
> >>  static void pmt_crashlog_set_execute(struct intel_pmt_entry *entry)
> >>  {
> >> +=09u32 offset =3D get_control_offset(&entry->header);
> >>  =09struct crashlog_control control =3D {
> >> -=09=09.control =3D readl(entry->disc_table + CONTROL_OFFSET),
> >> +=09=09.control =3D readl(entry->disc_table + offset),
> >> +=09};
> >> +
> >> +=09if (entry->header.version =3D=3D 0) {
> >> +=09=09/* clear trigger bits so we are only modifying disable flag */
> >> +=09=09control.ctrl.disable =3D 0;
> >> +=09=09control.ctrl.clear =3D 0;
> >> +=09=09control.ctrl.complete =3D 0;
> >> +
> >> +=09=09control.ctrl.manual =3D 1;
> >> +=09} else {
> >> +=09=09control.ctrl2.disable =3D 0;
> >> +=09=09control.ctrl2.clear =3D 0;
> >> +
> >> +=09=09control.ctrl2.manual =3D 1;
> >> +=09}
> >> +
> >> +=09writel(control.control, entry->disc_table + offset);
> >> +}
> >> +
> >> +/* version 2 support */
> >> +static void pmt_crashlog_set_consumed(struct intel_pmt_entry *entry)
> >> +{
> >> +=09u32 offset =3D get_control_offset(&entry->header);
> >> +=09struct crashlog_control control =3D {
> >> +=09=09.control =3D readl(entry->disc_table + offset),
> >>  =09};
> >>
> >> -=09/* clear trigger bits so we are only modifying disable flag */
> >> -=09control.ctrl.disable =3D 0;
> >> -=09control.ctrl.clear =3D 0;
> >> -=09control.ctrl.complete =3D 0;
> >> +=09control.ctrl2.consumed =3D 1;
> >> +
> >> +=09writel(control.control, entry->disc_table + offset);
> >> +}
> >>
> >> -=09control.ctrl.manual =3D 1;
> >> +static bool pmt_crashlog_rearm(struct intel_pmt_entry *entry)
> >> +{
> >> +=09u32 offset =3D get_status_offset(&entry->header);
> >> +=09struct crashlog_status status =3D {
> >> +=09=09.status =3D readl(entry->disc_table + offset),
> >> +=09};
> >>
> >> -=09writel(control.control, entry->disc_table + CONTROL_OFFSET);
> >> +=09return status.stat2.rearmed;
> >> +}
> >> +
> >> +static void pmt_crashlog_set_rearm(struct intel_pmt_entry *entry)
> >> +{
> >> +=09u32 offset =3D get_control_offset(&entry->header);
> >> +=09struct crashlog_control control =3D {
> >> +=09=09.control =3D readl(entry->disc_table + offset),
> >> +=09};
> >> +
> >> +=09control.ctrl2.rearm =3D 1;
> >> +
> >> +=09writel(control.control, entry->disc_table + offset);
> >>  }
> >>
> >>  /*
> >> @@ -177,7 +290,7 @@ enable_show(struct device *dev, struct
> >device_attribute *attr, char *buf)
> >>  =09struct intel_pmt_entry *entry =3D dev_get_drvdata(dev);
> >>  =09int enabled =3D !pmt_crashlog_disabled(entry);
> >>
> >> -=09return sprintf(buf, "%d\n", enabled);
> >> +=09return sysfs_emit(buf, "%d\n", enabled);
> >>  }
> >>
> >>  static ssize_t
> >> @@ -251,16 +364,135 @@ trigger_store(struct device *dev, struct
> >device_attribute *attr,
> >>  }
> >>  static DEVICE_ATTR_RW(trigger);
> >>
> >> +static ssize_t consumed_store(struct device *dev, struct device_attri=
bute
> >*attr,
> >> +=09=09=09      const char *buf, size_t count)
> >> +{
> >> +=09struct crashlog_entry *entry;
> >> +=09bool consumed;
> >> +=09int result;
> >> +
> >> +=09entry =3D dev_get_drvdata(dev);
> >> +
> >> +=09result =3D kstrtobool(buf, &consumed);
> >> +=09if (result)
> >> +=09=09return result;
> >> +
> >> +=09/* set bit only */
> >> +=09if (!consumed)
> >> +=09=09return -EINVAL;
> >> +
> >> +=09mutex_lock(&entry->control_mutex);
> >
> >Please use guard() and remove the gotos.
>=20
> Will do. =20
>=20
> Thank you for your comments!
>=20
> Mike
>=20
> >> +
> >> +=09if (pmt_crashlog_disabled(&entry->entry)) {
> >> +=09=09result =3D -EBUSY;
> >> +=09=09goto err;
> >> +=09} else if (!pmt_crashlog_complete(&entry->entry)) {
> >> +=09=09result =3D -EEXIST;
> >> +=09=09goto err;
> >> +=09} else {
> >> +=09=09pmt_crashlog_set_consumed(&entry->entry);
> >> +=09}
> >> +
> >> +err:
> >> +=09mutex_unlock(&entry->control_mutex);
> >> +=09return count;
> >> +}
> >> +static DEVICE_ATTR_WO(consumed);
> >> +
> >> +static ssize_t
> >> +rearm_show(struct device *dev, struct device_attribute *attr, char *b=
uf)
> >> +{
> >> +=09struct intel_pmt_entry *entry =3D dev_get_drvdata(dev);
> >> +=09int rearmed =3D pmt_crashlog_rearm(entry);
> >> +
> >> +=09return sysfs_emit(buf, "%d\n", rearmed);
> >> +}
> >> +
> >> +static ssize_t rearm_store(struct device *dev, struct device_attribut=
e *attr,
> >> +=09=09=09   const char *buf, size_t count)
> >> +{
> >> +=09struct crashlog_entry *entry;
> >> +=09bool trigger;
> >> +=09int result;
> >> +
> >> +=09entry =3D dev_get_drvdata(dev);
> >> +
> >> +=09result =3D kstrtobool(buf, &trigger);
> >> +=09if (result)
> >> +=09=09return result;
> >> +
> >> +=09/* set only */
> >> +=09if (!trigger)
> >> +=09=09return -EINVAL;
> >> +
> >> +=09mutex_lock(&entry->control_mutex);
> >> +=09pmt_crashlog_set_rearm(&entry->entry);
> >> +=09mutex_unlock(&entry->control_mutex);
> >> +
> >> +=09return count;
> >> +}
> >> +static DEVICE_ATTR_RW(rearm);
> >> +
> >> +#define DEBUG_REGISTER_INFO
> >> +#ifdef DEBUG_REGISTER_INFO
> >> +static ssize_t
> >> +status_show(struct device *dev, struct device_attribute *attr, char *=
buf)
> >> +{
> >> +       struct intel_pmt_entry *entry =3D dev_get_drvdata(dev);
> >> +       u32 sts_off =3D get_status_offset(&entry->header);
> >> +       u32 ctl_off =3D get_control_offset(&entry->header);
> >> +       struct crashlog_status status =3D {
> >> +               .status =3D readl(entry->disc_table + sts_off),
> >> +       };
> >> +       struct crashlog_control control =3D {
> >> +               .control =3D readl(entry->disc_table + ctl_off),
> >> +       };
> >> +       int len =3D 0;
> >> +
> >> +       len +=3D sysfs_emit_at(buf, len, "clear_support: %d\n",
> >status.stat2.clear_support);
> >> +       len +=3D sysfs_emit_at(buf, len, "rearmed: %d\n", status.stat2=
=2Erearmed);
> >> +       len +=3D sysfs_emit_at(buf, len, "error: %d\n", status.stat2.e=
rror);
> >> +       len +=3D sysfs_emit_at(buf, len, "consumed: %d\n",
> >status.stat2.consumed);
> >> +       len +=3D sysfs_emit_at(buf, len, "disable: %d\n", status.stat2=
=2Edisable);
> >> +       len +=3D sysfs_emit_at(buf, len, "cleared: %d\n", status.stat2=
=2Ecleared);
> >> +       len +=3D sysfs_emit_at(buf, len, "in_progress: %d\n",
> >status.stat2.in_progress);
> >> +       len +=3D sysfs_emit_at(buf, len, "complete: %d\n", status.stat=
2.complete);
> >> +       len +=3D sysfs_emit_at(buf, len, "sts_off: 0x%02x  ctl_off: 0x=
%02x\n",
> >sts_off, ctl_off);
> >> +       len +=3D sysfs_emit_at(buf, len, "status:  0x%08x\n", status.s=
tatus);
> >> +       len +=3D sysfs_emit_at(buf, len, "control: 0x%08x\n", control.=
control);
> >> +
> >> +       return len;
> >> +}
> >> +static DEVICE_ATTR_RO(status);
> >> +#endif
> >> +
> >>  static struct attribute *pmt_crashlog_attrs[] =3D {
> >>  =09&dev_attr_enable.attr,
> >>  =09&dev_attr_trigger.attr,
> >>  =09NULL
> >>  };
> >>
> >> +static struct attribute *pmt_crashlog_ver2_attrs[] =3D {
> >> +=09&dev_attr_enable.attr,
> >> +=09&dev_attr_trigger.attr,
> >> +=09&dev_attr_consumed.attr,
> >> +=09&dev_attr_rearm.attr,
> >> +#ifdef DEBUG_REGISTER_INFO
> >> +=09&dev_attr_status.attr,
> >> +#endif
> >
> >You could use a define to hold this so you don't need to use ifdef here.
> >Check WMAX_DEV_GROUPS if you want an example what I mean.
> >
> >> +=09NULL
> >> +};
> >> +
> >>  static const struct attribute_group pmt_crashlog_group =3D {
> >>  =09.attrs=09=3D pmt_crashlog_attrs,
> >>  };
> >>
> >> +static const struct attribute_group pmt_crashlog_ver2_group =3D {
> >> +=09.attrs=09=3D pmt_crashlog_ver2_attrs,
> >> +};
> >> +
> >> +static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry, =
struct
> >device *dev);
> >> +
> >>  static int pmt_crashlog_add_endpoint(struct intel_vsec_device *ivdev,
> >>  =09=09=09=09     struct intel_pmt_entry *entry)
> >>  {
> >> @@ -286,14 +518,24 @@ static int pmt_crashlog_add_endpoint(struct
> >intel_vsec_device *ivdev,
> >>  =09return 0;
> >>  }
> >>
> >> +static const struct attribute_group *select_sysfs_grp(struct
> >intel_pmt_header *hdr)
> >> +{
> >> +=09if (hdr->version =3D=3D 0)
> >> +=09=09return &pmt_crashlog_group;
> >> +
> >> +=09return &pmt_crashlog_ver2_group;
> >> +}
> >> +
> >>  static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry,
> >>  =09=09=09=09      struct device *dev)
> >>  {
> >>  =09void __iomem *disc_table =3D entry->disc_table;
> >>  =09struct intel_pmt_header *header =3D &entry->header;
> >>  =09struct crashlog_entry *crashlog;
> >> +=09u32 version;
> >> +=09u32 type;
> >>
> >> -=09if (!pmt_crashlog_supported(entry))
> >> +=09if (!pmt_crashlog_supported(entry, &type, &version))
> >>  =09=09return 1;
> >>
> >>  =09/* initialize control mutex */
> >> @@ -303,11 +545,13 @@ static int pmt_crashlog_header_decode(struct
> >intel_pmt_entry *entry,
> >>  =09header->access_type =3D GET_ACCESS(readl(disc_table));
> >>  =09header->guid =3D readl(disc_table + GUID_OFFSET);
> >>  =09header->base_offset =3D readl(disc_table + BASE_OFFSET);
> >> +=09header->type =3D type;
> >> +=09header->version =3D version;
> >>
> >>  =09/* Size is measured in DWORDS, but accessor returns bytes */
> >>  =09header->size =3D GET_SIZE(readl(disc_table + SIZE_OFFSET));
> >>
> >> -=09entry->attr_grp =3D &pmt_crashlog_group;
> >> +=09entry->attr_grp =3D select_sysfs_grp(header);
> >>
> >>  =09return 0;
> >>  }
> >>
> >
> >--
> > i.
>=20

--=20
 i.
--8323328-605913927-1747832673=:946--
