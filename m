Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5344F797D;
	Tue, 13 Oct 2026 17:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791911642; cv=none; b=oPzYIdiDrT2sbukxY8GUtaIxH9Aeg/xR5iXSSw0kBJXlWIZab859xPaYGAFV16o4mhVYWXUs0rHhS/kZrowp98lMCn60t2ZRe2v0A/O4jpcCKq46d2Flv+NB5QE8VG4kAHlsWXqqwrYursmgYIEn6BkwlYQg9pgcODxhlSAlkfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791911642; c=relaxed/simple;
	bh=9nlt+18NrRMJ7S8N2uVdvOMt2RPfB2bA47UwhU1ntXg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Q1xal6QeDAZxkFJcpHeYjOh43IOgVcHe7OHETOJZ2R0qGLtUKdRlSj/YmFB36yHHsISwpCT/UKXGyKffsmbw2oDOt1dq2v0Dut3p3Tvg2rzXWLaClaiw2kB2WuLU0fd6iNhp8CL4W4wAbp8qI1F75tTYchAMIBtgOs9B5tFcTqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UtgR1KVK; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UtgR1KVK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791911641; x=1823447641;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=9nlt+18NrRMJ7S8N2uVdvOMt2RPfB2bA47UwhU1ntXg=;
  b=UtgR1KVKVuVhfIH+4sUIoeV0YQtRbAK1AyfzInIJOStlp3X4xP1shO2Z
   awRveds2Hf+NS9kJMniKuM+5YNW0cCOrASSMXgTRx3du1ovW8t55dE/G0
   Ek/vKglshcHDkbPZfSqBXNCBhl2dmyVuKe3/uPX7uELWyDB7PEsvZaGiR
   RrPaM5p/i/1mMHnqkezWPzWJWW4wqzCovYQiji2nVJm16y188itNQEoTi
   QMdfONBrZMgIvYcOvXxBWquUBITRRFypxWUE7evQblhalnh7u5DQL33hY
   s81seBxaHYbgMebPJQL7QNLdJ181bx8mxbAzlQPyNc1BuZ8h84EC3zVSc
   g==;
X-CSE-ConnectionGUID: Pdz8vEegQZ6Vm76i9au8sA==
X-CSE-MsgGUID: N7ydk0eiTvqTWBg49ZQ9zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="654215"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="654215"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 10:14:01 -0700
X-CSE-ConnectionGUID: S0ad3VuESFeXvAgQlQ5l9A==
X-CSE-MsgGUID: zh4nLjdeR9us/LBVvA1/rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1246745"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.106])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 10:13:58 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 13 Oct 2026 20:13:55 +0300 (EEST)
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
    Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
    Hans de Goede <hansg@kernel.org>, 
    David E Box <david.e.box@linux.intel.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 17/20] platform/x86/intel/tpmi: Use scnprintf() to
 build the debugfs names
In-Reply-To: <cefad53c-3bc5-4c1e-9fed-9e6eae3bac41@linux.intel.com>
Message-ID: <7929c6ca-d2d3-d616-db8f-1af5c800bfdd@linux.intel.com>
References: <20261006183037.1507007-1-sathyanarayanan.kuppuswamy@linux.intel.com> <20261006183037.1507007-18-sathyanarayanan.kuppuswamy@linux.intel.com> <as0-s6JyjfA2zY-B@ashevche-desk.local> <24aaf825-ae8b-b19d-4f7f-d5fedc5bcd44@linux.intel.com>
 <as32iyeK1okylcYI@ashevche-desk.local> <cefad53c-3bc5-4c1e-9fed-9e6eae3bac41@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1513346938-1791911635=:21507"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1513346938-1791911635=:21507
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 13 Oct 2026, Kuppuswamy Sathyanarayanan wrote:
> On 10/13/2026 2:14 AM, Andy Shevchenko wrote:
> > On Tue, Oct 13, 2026 at 11:42:00AM +0300, Ilpo J=C3=A4rvinen wrote:
> >> On Mon, 12 Oct 2026, Andy Shevchenko wrote:
> >>> On Tue, Oct 06, 2026 at 11:30:34AM -0700, Kuppuswamy Sathyanarayanan =
wrote:
> >>>> snprintf() is on its way out in favour of scnprintf(). Neither of th=
e two
> >>>> callers in tpmi_dbgfs_register() looks at the return value, so the
> >>>> difference in what the two return does not matter here.
> >>>
> >>> I believe I asked it already: Why do we care? Do you get any compilat=
ion
> >>> warning (assuming `make W=3D1`)?
> >>
> >> I do care that we've two functions for essentially the same thing and=
=20
> >> would prefer to have just one that remains (and obviously that would b=
e=20
> >> the c variant).
> >=20
> > I see, thanks for the hint, but it's not clear from the commit message.
>=20
> Agreed. There is no W=3D1 warning behind this. It is only about convergin=
g
> on scnprintf(), as Ilpo explained. Below is a reworded commit message
> that says so directly.
>=20
> Ilpo, would you prefer that I send a v5 with this change, or are you
> fine with updating the commit message when you apply the series?
>=20
> ---
> platform/x86/intel/tpmi: Use scnprintf() to build the debugfs names
>=20
> The kernel has both snprintf() and scnprintf() for formatting into a
> fixed size buffer. The preference is to settle on scnprintf() and stop
> adding snprintf() users, so that only one of the two remains in use.
>=20
> Convert the two callers in tpmi_dbgfs_register(). Neither of them looks
> at the return value, so the difference in what the two functions return
> does not matter here.=20
>=20
> No functional change intended.
>=20
> Suggested-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@lin=
ux.intel.com

Hi,

The proposed text seems fine.

I'm afraid I might forget to change it so sending v5 is safer from that=20
perspective. Closing an old version from patchwork is pretty simple for=20
me.

--=20
 i.

--8323328-1513346938-1791911635=:21507--
