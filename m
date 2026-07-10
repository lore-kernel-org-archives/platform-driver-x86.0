Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6D840800F;
	Fri, 10 Jul 2026 10:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783679167; cv=none; b=l22jEx23bna0fjxUxagCQVgDc0whyBk9ya9AcOgmdTkwvK2ak9U8apmh0eDFjQ5pV93CqTxxmoQwTP0ErJneF28hRor1gbu9zrOKyMYC7ivsyvh61StxyUasX35WNF8mS56EoGjgcKwvcMhgRVIUhLGycja6gLxH/cYdpNp0wig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783679167; c=relaxed/simple;
	bh=rd2qEjwSDGZwwxicC/7nqyudWahmEJFxpw6yL2rHXeI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GWbVY4OPY2D2aK2Kaexelmfz8i8cyyYClRe0Rw3CtmAdK387qWOnvnr3dQlE7SopBEr3wwouym5FBE1NlC7pUO4GR+c/9ZfW4UzaXoTypoRePichIUpwzvhutbs6j0LmtiknaLlr2fMlFwiMsL9NPuoONzFBzSyQoA0tPHTXIFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QN00K3b3; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QN00K3b3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783679166; x=1815215166;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=rd2qEjwSDGZwwxicC/7nqyudWahmEJFxpw6yL2rHXeI=;
  b=QN00K3b3rjJqIxiMb7RlqNb2oiBu5E5TasauUQJTofiKrbPywuNywKGl
   /NfhlmD3hEzdaAkL+MTK2Nsj/0MUObwvnliIEZ/VEE7iopaKHCc+f5Ouj
   0py2kjXKFiiVvClvcybvvC5G3Ouel0ulbqAWy7nM8wDZthopdzbuXFkKX
   Ek/9LcaLc8qos0BC3odb3YvoRcq9qS6V66Scqx9+JjUlMJ8BgjwpHooDt
   TBcnK1GBvhhlZJ4sJoDVd6B4eDk4pwiEnxEoffnSWJCA1m/Yaq8oaUiFt
   45ZWMOfkndHdLQl9H/9h+o+GKiwrlSD+Ol/veEEo2HcsfW2h/L5nZOkBq
   Q==;
X-CSE-ConnectionGUID: mRCSKYvHQoOBaxp0FMF2QA==
X-CSE-MsgGUID: QrUd7MK2TJWWbEPkrcAt4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88061175"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="88061175"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 03:26:04 -0700
X-CSE-ConnectionGUID: Bc03sOPLS12M/jwZhjkiAA==
X-CSE-MsgGUID: Ecka0WbVQduz6xIDu5RvJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="254948010"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.169])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 03:26:01 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 10 Jul 2026 13:25:57 +0300 (EEST)
To: Mingyou Chen <qby140326@gmail.com>
cc: W_Armin@gmx.de, foxido@foxido.dev, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, nika@nikableh.moe, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v1 3/4] MAINTAINERS: Add maintainer entry of bitland-mifs-wmi
 driver
In-Reply-To: <20260709122337.17417-4-qby140326@gmail.com>
Message-ID: <8a74deac-ca82-d7b8-e665-f99c837aa7cd@linux.intel.com>
References: <20260709122337.17417-1-qby140326@gmail.com> <20260709122337.17417-4-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 9 Jul 2026, Mingyou Chen wrote:

> Add a new maintainer entry for the bitland-mifs-wmi
> platform driver

Don't leave lines short but fill the lines up to 72 chars.

Missing final stop (.).

> 
> Signed-off-by: Mingyou Chen <qby140326@gmail.com>
> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6d9b69c1df4c..b92bc4816fa6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22768,6 +22768,13 @@ S:	Maintained
>  T:	git https://github.com/pkshih/rtw.git
>  F:	drivers/net/wireless/realtek/rtw89/
>  
> +BITLAND LAPTOP DRIVER
> +M:	Mingyou Chen <qby140326@gmail.com>
> +M:	Gladyshev Ilya <foxido@foxido.dev>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	drivers/platform/x86/bitland-mifs-wmi.c
> +
>  REDPINE WIRELESS DRIVER
>  L:	linux-wireless@vger.kernel.org
>  S:	Orphan
> 

-- 
 i.

