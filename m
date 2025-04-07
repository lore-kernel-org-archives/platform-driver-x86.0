Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EBA1F754E
	for <platform-driver-x86@vger.kernel.org>; Mon,  7 Apr 2025 15:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039458; cv=none; b=IBpbSESSGlwcyruHlaCSUpYBqU7Xcf3qo2ylqr2jpzIfn/lzMTPBP2nT4S6McSkVyV529kuaBlheyN+k/cWS2qdUr2MOziYg6q5l9YNJZdINf6u2NCIHUPXvrtDFd7bl0QUngdJK5DAYlf0naYjxw3zUpx3zFFXEDeCI4wRTAGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039458; c=relaxed/simple;
	bh=bGwcxgJ5xPsKO+720mSNK35hGvXFfiCjKaX9VUo7n6Q=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=sqxhHG+DB8s6cHjYOwb2n8KiHNjsvo4DYIcihGNOEhKr7JnO+WwAL7MVnmlt0bRyhYGBlWwgvwSuVowb8AzbYkn0ckL63fswMT0vqxxt4nqVjPBBoC8TvM5KtPgHlagOXaUX0XvOzcGIUvCoFlHgeDLvTSkX3gAHAgVmpnaAXN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fjouDqhk; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fjouDqhk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744039457; x=1775575457;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=bGwcxgJ5xPsKO+720mSNK35hGvXFfiCjKaX9VUo7n6Q=;
  b=fjouDqhkdyt0lC2bqfJo/B+Gq0ZPhZq74blnicmIfS+MQocuFjoBb0rj
   Bjkd1eRXr4WdL9sDtI5byaGgz0OTjo4rdqt1UjfXpWs5bYFe5IguPJj60
   I0x5ppghv1yEwsT/S+BA4Z9qs6TCV3LJluCNuCxOkbHnhk3VwprHsL3kE
   TIIlmaPfMDQgOQUW7RJcqwB45CktUDoQJ+ox3p2qswBCf7YORe0KkAQIG
   COtq/sJ3j2wt5iqv8wzvUyS2Va6iCaN7YVzX6Ruwk8ksG0lCqNzStkPj5
   DFXpWHM2uZdzNrngkwsYtPXLro7M2vBUTngmUBX2fuSzGxOPtUxnGnKc6
   w==;
X-CSE-ConnectionGUID: Fuhs+YksS0eDVWTdiQxPiQ==
X-CSE-MsgGUID: N/tbdLItRi27pP16duTVcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49284429"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="49284429"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:24:16 -0700
X-CSE-ConnectionGUID: cQ2N6GL4Tvu9LDxIWxg5zg==
X-CSE-MsgGUID: afHeb/rURGWTbtOYHa/LDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="127856521"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.229])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:24:15 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 7 Apr 2025 18:24:12 +0300 (EEST)
To: Hans de Goede <hdegoede@redhat.com>
cc: Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/2] platform/x86: x86-android-tablets: Add "9v" to Vexia
 EDU ATLA 10 tablet symbols
In-Reply-To: <ba58d467-1525-496b-b8ba-b14aa04307a1@redhat.com>
Message-ID: <6268e571-1422-c020-4445-bd20b683b003@linux.intel.com>
References: <20250407092017.273124-1-hdegoede@redhat.com> <Z_OoouVSgw1xOpur@smile.fi.intel.com> <ba58d467-1525-496b-b8ba-b14aa04307a1@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 7 Apr 2025, Hans de Goede wrote:
> On 7-Apr-25 12:27, Andy Shevchenko wrote:
> > On Mon, Apr 07, 2025 at 11:20:15AM +0200, Hans de Goede wrote:
> >> The Vexia EDU ATLA 10 tablet comes in 2 different versions with
> >> significantly different mainboards. The only outward difference is that
> >> the charging barrel on one is marked 5V and the other is marked 9V.
> >>
> >> Both need to be handled by the x86-android-tablets code. Add 9v to
> >> the symbols for the existing support for the 9V Vexia EDU ATLA 10 tablet
> >> symbols to prepare for adding support for the 5V version.
> >>
> >> All this patch does is s/vexia_edu_atla10_info/vexia_edu_atla10_9v_info/
> > 
> > And period :-)
> > 
> > All this patch does is s/vexia_edu_atla10_info/vexia_edu_atla10_9v_info/.
> 
> It feels a bit silly to send a v2 just to add a period to the commit msg.
> 
> Ilpo do you want me to send a v2 of this series?

No, you don't have to send a new version because of that. I'll try to 
remember to add the period there while applying but I won't have regrets 
if I fail to remember it, TBH. :-)

-- 
 i.

