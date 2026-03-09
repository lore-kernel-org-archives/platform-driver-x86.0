Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2150E3D667C;
	Mon,  9 Mar 2026 14:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773068337; cv=none; b=M7NfyAeEKos+hT3CmCbWmjn7pjruVVQvc+TYPTA/OPPKC2KVuaLbsMcK4TbWckTrn0Sd07f4p8eiB+IMB2MZJHui60QFrDBafdCo+wScY3pOPMQwmasjGw8G0uwb/8twb8J0uY+uTDGL6+zpisbcHkgZc5RHKr0B+oLh7YOfB3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773068337; c=relaxed/simple;
	bh=S3hGUsxHZQmD7v1f0v+qWOOEFTzGMqML7tbie+Ih8ag=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=poexrzdUUMHA633EVgd7aRBfsIEma5eJM7OVfZ92kw7lcHtjoG116VO89Z4+6WTOd3uOBvc83sd9/54yJ5jXZFrpag5gvnp7zSvachxaJyaMpQEVYdO1i6Mo9+1aevL9HUs4kZCYr8p3/niRvwaDU4d5gC06YN615wcoJS4zd7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EvEoVwrp; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EvEoVwrp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773068336; x=1804604336;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=S3hGUsxHZQmD7v1f0v+qWOOEFTzGMqML7tbie+Ih8ag=;
  b=EvEoVwrpUg6qAdv0Qlc51NQ1KCygi/qEF5LuH/+/jME4zo+HqercZK1r
   54F0u+nxyzNpj/d48+oeaEdV0IlsKjeX4uXwF91uDy8mPt9HSswrloiDq
   nRGA1IT2u4qVib/a7HIEQbbdfwI/Vnb5P7axobtYIIx139I+4xndG1Oh6
   +r4KxLutI1Qhfw9JiZEmMu/Y9BZu6b77BovHMVlExCPb9+s8j+8V3F4R8
   B2sH4cj01Zm/xnTBMZiYd0SqF/BsgEdci5117j4CmiNyTs3xEP9rYDagf
   GmXTgSY304V5ucZUf40+bnAqdWwC3f9AEOUTZ1T9NNKa+HQ1g0BpbXpeX
   g==;
X-CSE-ConnectionGUID: vu1B7XvESniUaG4reYwnNQ==
X-CSE-MsgGUID: l2aPFttvScStL6eTT6/VRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="74171334"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="74171334"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 07:58:56 -0700
X-CSE-ConnectionGUID: CzNFcJ8lS7Sf8KkKe9n37A==
X-CSE-MsgGUID: pj5xud/bSuCT0XafNZm9+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="216695567"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.153])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 07:58:53 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Prasanth Ksr <prasanth.ksr@dell.com>, Hans de Goede <hansg@kernel.org>, 
 Thorsten Blum <thorsten.blum@linux.dev>
Cc: Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260305140912.258090-2-thorsten.blum@linux.dev>
References: <20260305140912.258090-2-thorsten.blum@linux.dev>
Subject: Re: [PATCH v2] platform/x86: dell-wmi-sysman: Use sysfs_emit{_at}
 in show functions
Message-Id: <177306832726.16654.299523154497646945.b4-ty@linux.intel.com>
Date: Mon, 09 Mar 2026 16:58:47 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 05 Mar 2026 15:09:13 +0100, Thorsten Blum wrote:

> Replace sprintf() with sysfs_emit() and sysfs_emit_at() in sysfs show
> functions. sysfs_emit() and sysfs_emit_at() are preferred for formatting
> sysfs output because they provide safer bounds checking.
> 
> In reset_bios_show(), use sysfs_emit_at() to avoid manual buffer size
> accounting.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: dell-wmi-sysman: Use sysfs_emit{_at} in show functions
      commit: 9b0ee949f7940786b0292329c2ae1f5dd63e69ba

--
 i.

