Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C307205AC2
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Feb 2025 13:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738589890; cv=none; b=XTn6nkbWba6gsdIJYiVxLzExI9qDbqcedhN/5se5vdi3vy5BM2zQqjVEaQWn5Ir8SWTLwC+E34JfluDLQfh9fKa3JWPPfHCL+V3k5WXHmz1175I1ugi7g2rR0QuYfxKWyngIYUH4xiMOW08oXB4RHULZp3mmzsTlbELJ3WEsQMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738589890; c=relaxed/simple;
	bh=fM/ZRClWraXI3Z+8kTcI4xdgHN00SXkwdtH/eiVnaN4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cHygwSV7NkuHPsXUlEO1e9Bqux2Se9yiyBp+SKLKunM9FDY1uZXgS/uJ9bY6aYA7yvvgqApohJ5C9X3WQUzIjSCVkXViZp9m+qaFpwjGcyWhQG3vWm8EuInGBU6FJ65Hjjuxh9WFj453uBKF7RvqonzYorc6bqMyU+c65USMico=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IkMwVwyG; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IkMwVwyG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738589888; x=1770125888;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=fM/ZRClWraXI3Z+8kTcI4xdgHN00SXkwdtH/eiVnaN4=;
  b=IkMwVwyGeLxsJv/M1RhCNgG2FxnS0Lb2vxedBZ849HjIMdjcBhLQb1TS
   Hiff3bkhCIjsTUlaUiD/sRNRANkAh+ZIuTmufzb9gA7gWmIvUhzT34qzc
   bW/JU7B8ArL+m9DKRPhqIHVU3bHk9MV1U41uNjfdBcEXH/h0g8M6D3KjZ
   6fSfRdUnX4WH5vlg8x+KkaOIT1Jvz+5ffuBzHgNmx1BBgNRQkh5Wt7VHb
   hdmDfYrldPgPdGHZweIT0DwoUH+ihOnH/tdK3sJdv28NaD3SxWUz3sLEA
   tnrYKrbhoKMnD+umrcXSrpUKx1bjY9UBwoDFN2m1ix25tcV6EYKBnpRbl
   Q==;
X-CSE-ConnectionGUID: sqKaNbDaT2ajeIjowUr/tg==
X-CSE-MsgGUID: bOX0c9DnQye8OfIi7rHk5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="26682750"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="26682750"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:38:08 -0800
X-CSE-ConnectionGUID: FhLyt8pdTlC6uiRWnfbtlA==
X-CSE-MsgGUID: 9Q1OIl9wRmSx3RnHes42kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="115325244"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.194])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:38:06 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hdegoede@redhat.com, Thomas Zimmermann <tzimmermann@suse.de>
Cc: platform-driver-x86@vger.kernel.org
In-Reply-To: <20250131095235.125533-1-tzimmermann@suse.de>
References: <20250131095235.125533-1-tzimmermann@suse.de>
Subject: Re: [PATCH 0/2] platform/x86: Do not include <linux/fb.h>
Message-Id: <173858988194.2591.15690592935614698000.b4-ty@linux.intel.com>
Date: Mon, 03 Feb 2025 15:38:01 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 31 Jan 2025 10:51:08 +0100, Thomas Zimmermann wrote:

> These two drivers include <linux/fb.h>, presumably for backlight
> support. It's no longer need, so remove the include statement.
> 
> Thomas Zimmermann (2):
>   platform/x86: compal-laptop: Do not include <linux/fb.h>
>   platform/x86: thinkpad-acpi: Do not include <linux/fb.h>
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] platform/x86: compal-laptop: Do not include <linux/fb.h>
      commit: e87af94c0794ae19c7ed58996d847f1466f67446
[2/2] platform/x86: thinkpad-acpi: Do not include <linux/fb.h>
      commit: 1bcfd16b12265ff29c2e2d8c977a9dcbf2649020

--
 i.

