Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB0126F2B9;
	Fri,  2 Jan 2026 11:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767353369; cv=none; b=OcfxKUDG5fY2AUhSAl2+DYP85OjqkSRwR8iUDpasDUS0B83Fd5Ka8bJKpk2EOWivTfIQfsmJlrer58MUwOSnHk4PV5BHMkUsaox/USGiIEiZz90QwaHWN8JBtBBKH0kySTsNbVldJN7Tf6xgaIivoXc2YpuOkR5hwc+rB7QqUIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767353369; c=relaxed/simple;
	bh=bzoQD3aA6fgfdGUgVsoRfSBnjfsOyBiLmdEBTM7Xa5s=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=I1zOE3wlze1/Z/75H0XParILsi0/uSQY2fNbFqN7DCd92d18YgTgdlKqUyJBDEaAhEoqfWFU7rkohkOLa0Vv3qpQJELiikG4/Or7/BQnrkHbmkzk6nSZTqOowBhv0a22ZLce2uWVihcmyqS2l61JkPXqwLWAZ8tv0n6evixuous=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mqNDuvKd; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mqNDuvKd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767353368; x=1798889368;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=bzoQD3aA6fgfdGUgVsoRfSBnjfsOyBiLmdEBTM7Xa5s=;
  b=mqNDuvKdTPZtpn47x/ZeBTXJns2qcP1Hj7Vqw7QPpIktIri4VhwyTzio
   0QCw8ZlHZ7vXuAvzwtp3cf8l+FC6HTcSGR82Jr/NNHmizIDlRjlqP2+mm
   +Wm+NHT6sxuJYIXvdG/LmIKfN28j+xqOmfvTPGQtYJgUtVXaXd1Hbehi7
   Uoee4GGD8b0U8+0fR+4oI4m5o3wMEQpsou0Ep8KJWSB7T6rRqheuawT5O
   BEz4lYqF4w8Ag+5LijGvR7TASaNwS8VEly/1uPTdqDAH3YMdI7qusi+nK
   mGtTYC1WJVjnC5WfMJWsxpX6PTLHqH+cX8GmpLc3uJGpO5Mxm2fYppBIj
   g==;
X-CSE-ConnectionGUID: aHkxuhDkQVmdKt3vgO1KoQ==
X-CSE-MsgGUID: BNEzZnaSTEWyiypXXgbghQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="94317424"
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="94317424"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 03:29:27 -0800
X-CSE-ConnectionGUID: YI8HiaZ+TjK7E0wFcPVg3w==
X-CSE-MsgGUID: Z5Z9FaAyRLGa32n0yWWCsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="202266702"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.45])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 03:29:26 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 2 Jan 2026 13:29:20 +0200 (EET)
To: Zilin Guan <zilin@seu.edu.cn>
cc: Hans de Goede <hansg@kernel.org>, jianhao.xu@seu.edu.cn, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86/amd: Fix memory leak in wbrf_record()
In-Reply-To: <20251230091725.1140570-1-zilin@seu.edu.cn>
Message-ID: <df87cb9d-467b-e9bd-52d6-5ca4f0c1137a@linux.intel.com>
References: <20251230064325.1036637-1-zilin@seu.edu.cn> <20251230091725.1140570-1-zilin@seu.edu.cn>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1031692739-1767353360=:969"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1031692739-1767353360=:969
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 30 Dec 2025, Zilin Guan wrote:
> On Tue, Dec 30, 2025 at 09:51:06AM+0100, Markus Elfring wrote:
> > =E2=80=A6
> > > Fix this by adding a free_tmp label and jumping to it when obj is NUL=
L,
> > > ensuring tmp is properly freed.
> >=20
> > How do you think about to increase the application of scope-based=20
> > resource management?=20
> >=20
> > Regards,
> > Markus
>=20
> Thanks for the suggestion.
>=20
> While scope-based resource management is a valid improvement, I prefer to=
=20
> keep this patch focused solely on fixing the memory leak using the=20
> existing coding style of the file. This ensures the fix is minimal and=20
> easier to backport.
>=20
> Such refactoring is arguably outside the scope of this fix.

Hi,

Lets not get too attached to the ways of the past, using __free() is
what we want to use even as a fix here. Adding goto labels adds=20
complexity, not reduces it, so I don't buy the easier backport argument
(on backport each goto target should be carefully reviewed which is=20
something __free() does not require because it simply is better=20
interface).

You just need to remember to move also the variable declaration down to=20
the alloc site as per the guidance in cleanup.h.

--=20
 i.

--8323328-1031692739-1767353360=:969--
