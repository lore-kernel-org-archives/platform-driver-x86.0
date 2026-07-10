Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7433E43B4BE;
	Fri, 10 Jul 2026 17:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783703460; cv=none; b=Q9DDFdfH8bQmb5V+UJDt4ewk6iw9crlJXroqZSlZxHOmxvVqjlY3xfeRGVLe23zBzP1Wi4xwLubB6nV7DtT/Gr4kJIMCCaPMK9GajlYRZBf2LhHX0bxSv6WGxDz4Ho1CPWtAJ0CqJq72/0mAwOyo0pNCxnZDevdaT0r0z+nkDX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783703460; c=relaxed/simple;
	bh=iMlYPwsK3AM2VK8OokBi8GlQGWIFpFfgWPZSRxFtIPU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VUoay1LaEgekm1z2pZO2FrEd+q0DpJjgRfm2sQKU0OVH1FcOgeZ/YVf+iLsY3FR9mpwO5x5EPG3e3/4K9y+oEueV1Q8E8BHir5Bigsyw7mtnOSRChXZP3d1UpcaUXMF5GtFKJxp66h1Mm15CWRD7pfKYhiagbQRLXfmp5uE1tEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e1pLt4xq; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e1pLt4xq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783703459; x=1815239459;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=iMlYPwsK3AM2VK8OokBi8GlQGWIFpFfgWPZSRxFtIPU=;
  b=e1pLt4xqUEhF4UN4xkU57+cGWmunKfgLwD/5XPow1JXS6omtWGQ9MBWU
   dgDYraIKMjdtLyZRDsvhrlPxXIP/gc4bRGTsHdSp8DVo9TeoJdt+KN4fb
   GAIxEbXeOUT6ww7NUo7eTga6uTPkiWd5YN5wIhYxUiParbNNHj1iG3gcb
   MF1RP1kQ5m/fTjtjxpzWwbVoPrK2/7QGqYVXb5tkCk+CBluHInkED3av4
   x5c1tUDF9aDcmMSx73hPolFoI7E/GNRMjieHVUdNkfmwr+afPpl/DaV3o
   BF6QjzCS83RrNn6chdWUzqiguqOE4pyDOuWBSXv/Vc32Hv2cXbmh7jrt0
   g==;
X-CSE-ConnectionGUID: giMf/ijGRnGUUB3Cm8+SXg==
X-CSE-MsgGUID: aHvgzFNvQcKrjMC9V+n9wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84507222"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84507222"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 10:10:59 -0700
X-CSE-ConnectionGUID: iWo5t4l/TaS0F4okypoi2g==
X-CSE-MsgGUID: QGtjz+VASTOaI4ewKG4K4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="255031702"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.169])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 10:10:56 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Maximilian Luz <luzmaximilian@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, Linmao Li <lilinmao@kylinos.cn>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260706012512.524359-1-lilinmao@kylinos.cn>
References: <20260706012512.524359-1-lilinmao@kylinos.cn>
Subject: Re: [PATCH 0/2] platform/surface: Check ACPI companion during
 probe
Message-Id: <178370344996.25696.12983106316951594460.b4-ty@b4>
Date: Fri, 10 Jul 2026 20:10:49 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Mon, 06 Jul 2026 09:25:10 +0800, Linmao Li wrote:

> Since every platform driver can be forced to match a device that doesn't
> match its list of device IDs because of device_match_driver_override(),
> platform drivers that rely on the existence of a device's ACPI companion
> object should verify its presence.
> 
> Commit e4865a56d013 ("ACPI: driver: Check ACPI_COMPANION() against NULL
> during probe") added such checks to the core ACPI platform drivers, but
> two drivers under platform/surface dereference the result of
> ACPI_COMPANION() in their probe functions without checking it, leading
> to a NULL pointer dereference when force-bound to a device without an
> ACPI companion.  Add the same checks there.
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
[1/2] platform/surface: acpi-notify: Check ACPI companion before use
      commit: 2b3a5dabe89e330413af403246b648c1890f368f
[2/2] platform/surface: surfacepro3_button: Check ACPI companion before use
      (no commit info)

--
 i.

