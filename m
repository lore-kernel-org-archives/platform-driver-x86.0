Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183E128F7
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Apr 2024 09:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714037521; cv=none; b=JRJvIuMeHrEfftnjbAMgIsJ7hD30DLkeleW2846SoyZ+gjpiYFaEzRLU94ZP3zePko3/Iq0UF6abWZjo+OnqeOtJNBslP/IYMfww6x/5uFnsN8OcoffaHgfYIT1qVJxpLznYUC0rGMba4tOIjBLjC72vQVZ+8VSYVrQvd9rDkaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714037521; c=relaxed/simple;
	bh=zxjxgIcUBXmnCb/TCr+TFzy1wu0rtPSA4V5QC1eT5zs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=NuU32uJzSOpCATDWrwq0veeu+Aq6ynQgA/xflE7lGWxxDWfBumFGe8QOzNWT08rrsYKlfSa+LXvVhbBJXGuEFjSsG3DyTISNbo3eG79bmXnFsFng4X2AhLEdFX7aeDKUoWFfDjUq+o8+gnWD6GU5MAItgGFTVVMHRw4dz9DIcXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cg81wAEY; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cg81wAEY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714037520; x=1745573520;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=zxjxgIcUBXmnCb/TCr+TFzy1wu0rtPSA4V5QC1eT5zs=;
  b=cg81wAEY70OyizkzSWDs6tW5X8KXG36vMecqnnrxRYTlLAuxnXD1buw0
   jtbB8PTHB1/cLo2cj532Y4yceM8fv/rmuZ3KiybyoGiLWE0eC1bAi0p9g
   vSrEw3jngRbscC2J94vFQLpcohn5mDcjeiyHZLbXGy0UwrLqezZM9dj0H
   yfAFjzDz7trykyE7+Dr+PZXk2RtOLwgWpAjFtQ3UuI09oWXnryGfXi2CS
   0mx+V1lc2ZdOwc0e4IXsGe+7ez60479ej7AM0kOuTFFDyIX/OIQaSjhQN
   Q1IUqWBA8nU7PF2gWk/zp1SlgiPU1KbflHEOSlN82pMIHB0r+RZ0bsC/1
   g==;
X-CSE-ConnectionGUID: iWWLgf+4ThSSLRKvpAk/9Q==
X-CSE-MsgGUID: ouVNJb0aQxigiByzNqkaSQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9580631"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="9580631"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 02:31:59 -0700
X-CSE-ConnectionGUID: zAv1TyEmS/e79CrvYPCr2Q==
X-CSE-MsgGUID: gpGPSccCT2askZwzGyY4OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="25077077"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.42])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 02:31:56 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 25 Apr 2024 12:31:50 +0300 (EEST)
To: Hans de Goede <hdegoede@redhat.com>
cc: Andy Shevchenko <andy@kernel.org>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, 
    Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
    Vishnu Sankar <vishnuocv@gmail.com>, Nitin Joshi <njoshi1@lenovo.com>, 
    ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 00/24] platform/x86: thinkpad_acpi: Refactor hotkey
 handling and add support for some new hotkeys
In-Reply-To: <20240424122834.19801-1-hdegoede@redhat.com>
Message-ID: <629d86d2-8c81-188f-67ef-f0bd20035377@linux.intel.com>
References: <20240424122834.19801-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-934710014-1714037510=:1087"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-934710014-1714037510=:1087
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 24 Apr 2024, Hans de Goede wrote:

> Hi All,
>=20
> Here is v2 of my patch-series to refactor thinkpad_acpi's hotkey handling
> and to add support for some new hotkeys on new models.
>=20
> Changes in v2:
> - Some small code style tweaks in response to reviews
> - Add various Reviewed-by and Tested-by tags

I reviewed the entire v2 series now, the small remarks were posted for the=
=20
relevant patches.

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-934710014-1714037510=:1087--
