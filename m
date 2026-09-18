Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F14951DDED;
	Fri, 18 Sep 2026 18:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789756047; cv=none; b=DH5uKhb5WqJambLpOv58Qb9j7i5W0g9IxPgnUoBkVYTXe2O+KNdHbhjPQjoTvS9uj0HnH4g493ceGSSpLxtsZrQdD/b8zEWR8AkKp2KJNpJ4N5Le9PaXLvFNwE9TfJfQ4ws45JkDwIF1ErEdcqW9XIIL4RyyJH7HhrILTcCgibU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789756047; c=relaxed/simple;
	bh=4Yy3nhNLFGl//EfeeNNsF/NGZo+QkZ2vHRpVmWsD3Yw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NBPs7tgh+MviIK5oxpp7bwnxCl+WJGes1tDxxFv13cDL28rSAsSkg7jOBbm8vro9ePW/0aVyCiPKtRJlWd4cH21b+p99a78TkKNbGiT9kb4l5kheGIIEr2tpzJd+FuWZdl6PEJ99pCDxzEtbnzgRSLpmij3nDW/aAXS12R/B+Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=acZUZK+Y; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="acZUZK+Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789756046; x=1821292046;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=4Yy3nhNLFGl//EfeeNNsF/NGZo+QkZ2vHRpVmWsD3Yw=;
  b=acZUZK+YLVR1SX7lWp6KE9DAP2j5Ted1krOTAvJfWGjExEYQ1q0Y6eyd
   4aS6zRg7igm02OsJGbOybIjoexv7Z1zXSo6hV6VMkb+ePzzYI85Ccvf0w
   NfTmwJhhzWI6s63xce9WyOC07/GH/sYdlHyfhr5o5XAl7IZw6ZOc54gci
   xBJ1DmOeDOSKAi+ypubB8GWvf8IGON2VsbWnXs8FJWUAWfk3T9OpIFxz7
   8mPzrU/hT6JdebbYfQL2SZlguY2qtW/1zFrntP+LoISS95BZnyGmBAdr4
   13Lw23ourUGW1KpkwLwuV+Wv+lPq8KjHKGIggqKi0+SLabqMswjhITu5c
   Q==;
X-CSE-ConnectionGUID: YKKw5zl7SVmZj90pWLhv2A==
X-CSE-MsgGUID: I4YkUPvMSb2OUf1PlncjAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="100881195"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="100881195"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:27:26 -0700
X-CSE-ConnectionGUID: B4ePEV7DRsa+YQT5sBkqiQ==
X-CSE-MsgGUID: Agsz4B5iQg6ytIZzhPmG6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="2763397"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.223])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:27:23 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Hans de Goede <hansg@kernel.org>, Sanket Goswami <Sanket.Goswami@amd.com>, 
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260915202535.3689880-1-arnd@kernel.org>
References: <20260915202535.3689880-1-arnd@kernel.org>
Subject: Re: [PATCH] platform/x86/amd/pmf: fix compat ioctl handling
Message-Id: <178975603478.29716.17360914104877936757.b4-ty@b4>
Date: Fri, 18 Sep 2026 21:27:14 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Tue, 15 Sep 2026 22:25:20 +0200, Arnd Bergmann wrote:

> Build testing with -Wpadded shows a structure that is incompatible
> between 32-bit and 64-bit x86 userspace:
> 
> ./usr/include/linux/amd-pmf.h:202:1: error: padding struct size to alignment boundary with 4 bytes [-Werror=padded]
> 
> Use the 64-bit padded on all architectures here to avoid both
> the warning and allow compat ioctl handling.
> 
> [...]

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] platform/x86/amd/pmf: fix compat ioctl handling
      commit: ac523aa5562fd4761509a012a68d2462ccf6c921

--
 i.

