Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A9D187862
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Sep 2024 12:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725972332; cv=none; b=ug9gAeHan5jrwU+goxoYNfV8q6RC3YBNMJH1huIeS/dd29TJVVgp/te243qDTiNQKoeklfG8klhEsGWKa4xxi2qwXu6sWJgWJ3ulax7mQUAkWpMPG7byNyWz6s1W0SY2gDkMYwPPNOXBTSkhS29vhI2ZAZRS+EOwcLVmT80bR5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725972332; c=relaxed/simple;
	bh=xjV7tpSepMrSJxIsWtuGEDmkKl7Ds74L6NBM16nKAao=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=thzTRkTeP7ZkHRuOj/11OU2uKZ2hhy+V1P06gs6MOgglkq84r0I8SZDw9td6zgHY0ONw0pEct8glsVN0al5vrJgg4yqKs6oOSvwtcNdalY2012O6lNgYsK4BqhoehRuf0XND1rJpqIJFMY4lmdL0runYBzCkqSg5SL7paApM93w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UYCf0ynF; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UYCf0ynF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725972331; x=1757508331;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=xjV7tpSepMrSJxIsWtuGEDmkKl7Ds74L6NBM16nKAao=;
  b=UYCf0ynFxgPBzWk7jNQBVcPAZaZU4gVBSZYnXB9wXNVtvfedFYUISAuQ
   Un+tF2laUoaWr3Xat/PDtlArsr3UVTHvYAFu+qA5Jt3CTxEsmK/kp9dNA
   8r0MMVgx9sFPln2JvXCzRNnkpl60rp+Vzfls8Xvg3wzqoDeaDhRZweYlj
   zuESauhu7c69zvMVfBSsljU4nsO04MN8e7rVq/uyod41E0wGbd/qlQ6dc
   C4F9z2Ir9g1TblAliFaQ0ylHKWa5ujld8Z/cFm45YNjqTV4XL3OhnXPL6
   vGkfm0wfNxD1VhwwmHJqH2Pxyhm05UzP0ISFxE9o/iE4VeytXLM8w3Oda
   A==;
X-CSE-ConnectionGUID: zpyI4jh7Sjql7o/Kn3eaYg==
X-CSE-MsgGUID: wesmOjVmTuC4UDHKr2Cerw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24910520"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="24910520"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 05:45:25 -0700
X-CSE-ConnectionGUID: ANNBbTc7S4OOx6ycM6yZqQ==
X-CSE-MsgGUID: 6ElFBQNpRTCp7s0PkawYnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="71614836"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.224])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 05:45:22 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, 
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Cc: luke@ljones.dev, corentin.chary@gmail.com
In-Reply-To: <20240909223503.1445779-1-bas@basnieuwenhuizen.nl>
References: <20240909223503.1445779-1-bas@basnieuwenhuizen.nl>
Subject: Re: [PATCH] platform/x86: asus-wmi: Disable OOBE experience on
 Zenbook S 16
Message-Id: <172597231511.1780.17442219892855554835.b4-ty@linux.intel.com>
Date: Tue, 10 Sep 2024 15:45:15 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 10 Sep 2024 00:35:03 +0200, Bas Nieuwenhuizen wrote:

> The OOBE experience fades the keyboard backlight in & out continuously,
> and make the backlight uncontrollable using its device.
> 
> Workaround taken from
> https://wiki.archlinux.org/index.php?title=ASUS_Zenbook_UM5606&diff=next&oldid=815547
> 
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo branch. Note it will show up in the public
platform-drivers-x86/review-ilpo branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: asus-wmi: Disable OOBE experience on Zenbook S 16
      commit: d6de45e3c6f3713d3825d3e2860c11d24e0f941f

--
 i.

