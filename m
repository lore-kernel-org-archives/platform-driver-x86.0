Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B691336EC7;
	Mon, 12 Jan 2026 18:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768241482; cv=none; b=sYqF7peOhPxnKppth/M+L1ygFWLOtsvyDUhEyyEywKtHpixbVpUD+JS6OtKjIZBg/uqmjyriWOtFzmTc2Zz8zHrM6TjVK/Cq4SrjVqesnIdP86Ulhf2rnpz5j5R7715QJZOjSCeNoT1DWnXYL1QV7nw+SdvELv+sH8WcSNnocug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768241482; c=relaxed/simple;
	bh=/KLQXz2NNIZ2+NznPVGmdBCIfGtlqCpRNDu4767I9Mk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=F3Lmb6A3fCP+KLZSI8h9pXLW5/DlgIDnt9B8XRHIfstu9eHahXU8CShRD/Fq9uKbJUPEwcL7vGyd64p1T5OodaMQiXtn7CF5qjnmIDNWWNqwSilGQHuqbRSPBRIsfrzEWmOG+Uj9eKDkQ55O4TVzplEKvuObGmvKnNRoF56sijQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AP6j+q6D; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AP6j+q6D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768241481; x=1799777481;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=/KLQXz2NNIZ2+NznPVGmdBCIfGtlqCpRNDu4767I9Mk=;
  b=AP6j+q6DFo290m1VE6f5IiNx3p4YqsyWf0koeFJcpvDFMsDRjg4D9qSP
   crYO4JaL/Mvto82lcNyFxFtmwOJ+iKifQt/me9HDI/yeeXG28E/3YWHzy
   GMWaGiyV3JrH+jJgQcxThpNeOwsoV4pqb90q4uz68wPU0gUsPUfyWH/0z
   /bXTGtv1y26d7/hBzIUkHRTvOM2APyP9KYbjsLRvB6l2JPOa17OoETiR2
   43TYolcgDVCYsYcnlEiAbH+X3EUQtfcnp2xnpSMjZnUSAPYi3IlbumvCA
   ms7rERbgsYAJ1KkZhQiajsvmL3BFcKtMTy0TrYNe8z+JrZUmL0wZCFsnt
   Q==;
X-CSE-ConnectionGUID: QVbO0Hl3R46AosiWnHMOYQ==
X-CSE-MsgGUID: xZRpXouAT4qhR3e0a9oJ+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80162869"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="80162869"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 10:11:21 -0800
X-CSE-ConnectionGUID: CIzlXUJNStiPtt/oaJlvsw==
X-CSE-MsgGUID: p+cpguJiTgCdao7GAGgEZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="208992204"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.111])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 10:11:17 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 12 Jan 2026 20:11:15 +0200 (EET)
To: Armin Wolf <W_Armin@gmx.de>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, linux@weissschuh.net, 
    Dell.Client.Kernel@dell.com, corbet@lwn.net, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 4/9] platform/wmi: Add kunit test for the string
 conversion code
In-Reply-To: <e1b3bc91-bc89-4a6e-8f80-f9ac25b2bedb@gmx.de>
Message-ID: <0edb4c4a-5177-c535-dd7f-f7062797d86d@linux.intel.com>
References: <20260109214619.7289-1-W_Armin@gmx.de> <20260109214619.7289-5-W_Armin@gmx.de> <c8c399b0-7eda-a12a-61b4-9777e07c98ae@linux.intel.com> <e1b3bc91-bc89-4a6e-8f80-f9ac25b2bedb@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-613519053-1768241475=:1026"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-613519053-1768241475=:1026
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 12 Jan 2026, Armin Wolf wrote:

> Am 12.01.26 um 17:34 schrieb Ilpo J=C3=A4rvinen:
>=20
> > On Fri, 9 Jan 2026, Armin Wolf wrote:
> >=20
> > > The string conversion frunctions provided by the WMI driver core
> > > have no dependencies on the remaining WMI API, making them suitable
> > > for unit tests.
> > >=20
> > > Implement such a unit test using kunit. Those unit tests verify that
> > > converting between WMI strings and UTF8 strings works as expected.
> > > They also verify that edge cases are handled correctly.
> > >=20
> > > Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> > > ---
> > >   drivers/platform/wmi/tests/Kconfig        |  11 +
> > >   drivers/platform/wmi/tests/Makefile       |   3 +
> > >   drivers/platform/wmi/tests/string_kunit.c | 278 +++++++++++++++++++=
+++
> > >   3 files changed, 292 insertions(+)
> > >   create mode 100644 drivers/platform/wmi/tests/string_kunit.c
> > >=20
> > > diff --git a/drivers/platform/wmi/tests/Kconfig
> > > b/drivers/platform/wmi/tests/Kconfig
> > > index efcbcb51c251..f7f0f3c540f5 100644
> > > --- a/drivers/platform/wmi/tests/Kconfig
> > > +++ b/drivers/platform/wmi/tests/Kconfig
> > > @@ -14,3 +14,14 @@ config ACPI_WMI_MARSHALLING_KUNIT_TEST
> > >   =09  to the KUnit documentation in Documentation/dev-tools/kunit/.
> > >     =09  If unsure, say N.
> > > +
> > > +config ACPI_WMI_STRING_KUNIT_TEST
> > > +=09tristate "KUnit Test for ACPI-WMI string conversion" if
> > > !KUNIT_ALL_TESTS
> > > +=09depends on KUNIT
> > > +=09default KUNIT_ALL_TESTS
> > > +=09help
> > > +=09  This builds unit tests for the ACPI-WMI string conversion code.
> > > +=09  For more information on KUnit and unit tests in general, please
> > > refer
> > > +=09  to the KUnit documentation in Documentation/dev-tools/kunit/.
> > > +
> > > +=09  If unsure, say N.
> > > diff --git a/drivers/platform/wmi/tests/Makefile
> > > b/drivers/platform/wmi/tests/Makefile
> > > index 252c3125353a..62c438e26259 100644
> > > --- a/drivers/platform/wmi/tests/Makefile
> > > +++ b/drivers/platform/wmi/tests/Makefile
> > > @@ -6,3 +6,6 @@
> > >     wmi_marshalling_kunit-y=09=09=09=09:=3D marshalling_kunit.o
> > >   obj-$(CONFIG_ACPI_WMI_MARSHALLING_KUNIT_TEST)=09+=3D
> > > wmi_marshalling_kunit.o
> > > +
> > > +wmi_string_kunit-y=09=09=09=09:=3D string_kunit.o
> > > +obj-$(CONFIG_ACPI_WMI_STRING_KUNIT_TEST)=09+=3D wmi_string_kunit.o
> > > diff --git a/drivers/platform/wmi/tests/string_kunit.c
> > > b/drivers/platform/wmi/tests/string_kunit.c
> > > new file mode 100644
> > > index 000000000000..9aa3ffa85090
> > > --- /dev/null
> > > +++ b/drivers/platform/wmi/tests/string_kunit.c
> > > @@ -0,0 +1,278 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +/*
> > > + * KUnit test for the ACPI-WMI string conversion code.
> > > + *
> > > + * Copyright (C) 2025 Armin Wolf <W_Armin@gmx.de>
> > > + */
> > > +
> > > +#include <linux/module.h>
> > > +#include <linux/slab.h>
> > > +#include <linux/string.h>
> > > +#include <linux/wmi.h>
> > > +
> > > +#include <kunit/resource.h>
> > > +#include <kunit/test.h>
> > > +
> > > +#include <asm/byteorder.h>
> > > +
> > > +struct wmi_string_param {
> > > +=09const char *name;
> > > +=09const struct wmi_string *wmi_string;
> > > +=09/*
> > > +=09 * Remember that using sizeof() on a struct wmi_string will
> > > +=09 * always return a size of two bytes due to the flexible
> > > +=09 * array member!
> > > +=09 */
> > > +=09size_t wmi_string_length;
> > > +=09const u8 *utf8_string;
> > > +=09size_t utf8_string_length;
> > > +};
> > > +
> > > +#define TEST_WMI_STRING_LENGTH 12
> > > +
> > > +static const struct wmi_string test_wmi_string =3D {
> > > +=09.length =3D cpu_to_le16(10),
> > > +=09.chars =3D {
> > > +=09=09cpu_to_le16(u'T'),
> > I've applied this to for-next and intend to keep these there but FYI th=
ese
> > trigger sparse errors. I don't know if they're fixable or not with
> > reasonable effort on kernel side.
>=20
> To me it seems that sparse ignores the u-prefix signaling that the charac=
ter
> constant
> has a length of 16-bits, but good catch.
>=20
> If this really is a problem then gcc would issue a warning anyway (happen=
ed
> when i was
> using the =F0=9F=90=A7 character which does not fit into a 16-bit charact=
er constant).

I guess I'll have to add another filter to my build-test.sh for this file.=
=20
I already -v -e 'error: bad constant expression' filter in use. Sadly=20
sparse seems to be rotting.

--=20
 i.

--8323328-613519053-1768241475=:1026--
