Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC631E516
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 12:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715603784; cv=none; b=YwdxFX/jD5PrJ0OFty9D/ZBRk/D6w+Kk+k9Z3Wtonr+sws9eP9h4raDbPGvD6dGy3+lkZxadUThvD0xkMa7ODFMCsSh7VdCh4umQ7vJqNTgSKZoyXfNCPjQ82Mh3yke1mb32XCxA95rVjyJF32AykC8GCV4kZizbgE7bkEL3cjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715603784; c=relaxed/simple;
	bh=AmUfZNAXXth1Zh2C5sSUVwua6XuQpYA14qh4jouvhs4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=QWMm5CNHtAr7yhPNc8bidi9QbnW+316Kx0zgGj362bmIB5XkXbEi7Vf8k0+vnXvXqmGOdjrkT5/1JPv6+V1Q5lCLHJdiq5+Gxi8IrpBrBycY9hnuCFLjGu6HY2sfjAx0aPLTl4cPPOGWDwzODhtgdxtpgld2aVNXhkbo/1r/ySM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mc2nqoMM; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mc2nqoMM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715603783; x=1747139783;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=AmUfZNAXXth1Zh2C5sSUVwua6XuQpYA14qh4jouvhs4=;
  b=mc2nqoMMgMNmmhh52jJy6jNIgiwIt00piItKKeC5u+d4GlujPGTG4FhO
   s4BWX5Cm+lX2JZTCobRboehb1d2d2FBskMzR0uHTKzksKzRu+8a7Ed9iQ
   BEQcHXbxZ2WDoeJmE6iLhSPhUmgZ40NlNbmIWM75fTzR2LarRZ5J+lk5y
   nbWj7sHNkrZY/5rcT8ONZYRxMKN38OpQz8AwDyY9KFAYMAXf+fzxjNhX3
   dBkNnEoMOx6mv4wpwtiSw3Mp4rsQ4+wTjOVqqAWUWxwg6bYc7/gpGWnIP
   kG4+ktCFPVlpn9VC5kZ/I/FwrX+sWPT7QqBLrnnVC/xCZfulgqnLi1DQ1
   g==;
X-CSE-ConnectionGUID: PhqfsX+nRraabvbcVTOnzA==
X-CSE-MsgGUID: iFnTgydRTy6iyVrh5w8oeA==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22201824"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="22201824"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 05:36:23 -0700
X-CSE-ConnectionGUID: cp8IUg+pQP6oZxBTMwCMRA==
X-CSE-MsgGUID: v8rOtIBxRriDVXVq9/t+Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="67819434"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.89])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 05:36:20 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 13 May 2024 15:36:15 +0300 (EEST)
To: Andy Shevchenko <andy.shevchenko@gmail.com>
cc: Hans de Goede <hdegoede@redhat.com>, AceLan Kao <acelan.kao@canonical.com>, 
    Kai-Heng Feng <kai.heng.feng@canonical.com>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/2] platform/x86: Add new Dell UART backlight driver
In-Reply-To: <ZkIHcGkhB6qHsyyz@smile.fi.intel.com>
Message-ID: <b12202fb-03b9-9408-84fb-654712c14c09@linux.intel.com>
References: <20240512162353.46693-1-hdegoede@redhat.com> <20240512162353.46693-2-hdegoede@redhat.com> <CAHp75VeMT+Pcvf-T9-iVqchSx1tppaeORWMmFhP66ZMg-ybmPw@mail.gmail.com> <796db4c0-e81f-4067-9deb-bef8b36979c9@redhat.com>
 <ZkIHcGkhB6qHsyyz@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-549274276-1715603732=:1286"
Content-ID: <eeb6ec61-b563-12d7-650d-da1ea1e2a39d@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-549274276-1715603732=:1286
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <47eaaf08-36b9-78ee-5dac-a1958d23a37c@linux.intel.com>

On Mon, 13 May 2024, Andy Shevchenko wrote:

> On Mon, May 13, 2024 at 12:01:55PM +0200, Hans de Goede wrote:
> > On 5/12/24 9:35 PM, Andy Shevchenko wrote:
> > > On Sun, May 12, 2024 at 7:24=E2=80=AFPM Hans de Goede <hdegoede@redha=
t.com> wrote:
>=20
> ...
>=20
> > >> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > >=20
> > > How is this being used?
> >=20
> > #include "../serdev_helpers.h"
> >=20
> > uses this.
>=20
> Yet another evidence why C code in the *.h is not a good idea.

get_serdev_controller() function is quite complex anyway to be inlined,=20
and if there's going to be another user now, it should be uninlined.

--=20
 i.
--8323328-549274276-1715603732=:1286--
