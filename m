Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1081F8691;
	Thu, 10 Sep 2026 01:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789002410; cv=none; b=DD1ByrxCqIgB2MhTMIjboC7jb2l7cm1J5CnkBfsHPS6sjxnpXKEfpiom5l+kHa7Ad4ZcGm1+4B3teOAZ0RO88sQ37FUkdIXQYxTdeJ7+rgJ7H1uxtRDEj5tE2NYP4Egy5jEK3aanm4mogKpFLGq6/ZDVo6AQMsq/VkJUUwunTQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789002410; c=relaxed/simple;
	bh=GeE1Q8uDnu/o0jAwuPdKbPsrxI/kSLSR0Ei+69Z1KY0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kFTAAVVD9thpqK/Wo3QH9L7M7U6aDiKGfaRyobrxZGZOUjqxB8J1k9r6D0nQpPHH1U6pJPPi34VsLthHcfIGpyfIa9Qe8vtlr/djHl8FD250YrBoDHj0tkG7aEU2d4p5Eafov6jU9n9HHPoAibPVTFZyoJbz+N/9rFHuFVF42tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=df2huNoc; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="df2huNoc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789002408; x=1820538408;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=GeE1Q8uDnu/o0jAwuPdKbPsrxI/kSLSR0Ei+69Z1KY0=;
  b=df2huNocLeanRpKJBhQksfkNR9i7Qym9EFp+o1obAmYx6WA7QUhfWdVZ
   qPG25pq1qxxCsTteTgkzR2UHXVuAnja1kv9yJVmUq4yzedkFDZgPTrOwf
   BROH8Eqr+/e1rhoiYRDSy2qvc9BlW9EECDLiX/IRAmbIENkhJItuTeHSV
   4nFR/dg2KMHUhG/c6i7UheOBc2rPnuckCzNWmiBLXnXXpAeMjph/WuJ5h
   LMvn7XHTKjjwbruoGCWp9+Aah/q1fGxN2C9Ay3JZKGH7hdlOBAFSwo2fW
   QQGjEL63UbIzbsk8bim9XlcTs+qydyVjPhWNIR/pGTUOR5iY+Li/emdCv
   Q==;
X-CSE-ConnectionGUID: xKBAQHTbRuC5Hem7ot1tLw==
X-CSE-MsgGUID: ruYWHwFWQnSQSLE1dUSxhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100104126"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="100104126"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 18:06:48 -0700
X-CSE-ConnectionGUID: ygYYpyxoQ2uhL0C2PVLhDw==
X-CSE-MsgGUID: 6xVUrJhoTI+99jD2pm78cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="265271573"
Received: from ssimmeri-mobl2.amr.corp.intel.com (HELO [10.125.111.187]) ([10.125.111.187])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 18:06:35 -0700
Message-ID: <90220ff3830673fafbfba39b84e91c06d8afa712.camel@linux.intel.com>
Subject: Re: [PATCH] tools intel-speed-select: Fix signed shift UB in BIT()
 macro
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: liujing <liujing@cmss.chinamobile.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 09 Sep 2026 18:06:34 -0700
In-Reply-To: <20260903082817.5203-1-liujing@cmss.chinamobile.com>
References: <20260903082817.5203-1-liujing@cmss.chinamobile.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-09-03 at 16:28 +0800, liujing wrote:
> From: Liu Jing <liujing@cmss.chinamobile.com>
>=20
> The BIT() macro is defined as `(1 << (x))` with a signed integer 1.
> When x >=3D 31, this causes signed integer overflow which is undefined
> behavior in C. This macro is used with BIT(31) in isst-core.c and
> isst-core-mbox.c.
>=20
> Fix it by using `1U` instead of `1` to perform an unsigned shift,
> matching the kernel's own BIT() definition which uses unsigned.
>=20
> Signed-off-by: Liu Jing <liujing@cmss.chinamobile.com>


Applied to
https://git.kernel.org/pub/scm/linux/kernel/git/spandruvada/linux.git/log/?=
h=3Dfor-sst-v7.4.rc1


Thanks,
Srinivas

> ---
> --- a/tools/power/x86/intel-speed-select/isst.h
> +++ b/tools/power/x86/intel-speed-select/isst.h
> @@ -30,7 +30,7 @@
> =C2=A0
> =C2=A0#include <linux/isst_if.h>
> =C2=A0
> -#define BIT(x) (1 << (x))
> +#define BIT(x) (1U << (x))
> =C2=A0#define BIT_ULL(nr) (1ULL << (nr))
> =C2=A0#define GENMASK(h, l) (((~0UL) << (l)) & (~0UL >> (sizeof(long) * 8
> - 1 - (h))))
> =C2=A0#define GENMASK_ULL(h,
> l)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 \
>=20
>=20
>=20
