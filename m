Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118BA30F7FB
	for <platform-driver-x86@vger.kernel.org>; Thu, 28 Aug 2025 12:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756382894; cv=none; b=E/cAm2hyVrOHZVEQwurrh4Gil8qoMIQxukFX+dEj6cZcQiU20HAUpIrlwmapjKhwWPdQWpipRWZvIjA2gzjXzPxM+1f5ltPUJ2T6HKV1V/PHPYXddzLaOXkDShjYYLUhy4QGimwhpIoXHBBF2ijw8UDxWGJT3fOFyDdEra+aEsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756382894; c=relaxed/simple;
	bh=Im6hEnJY+ANKdk+G/k4X5dBt3bisUIspWc3OQGXJpuw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MJOmUiCtOj0zYCoi6Mho2Jl4fodVu0w9JC/byfkeW4mFSQi1QLdgVV96UYhzju9P9RUySxXnDvuoQRKPSohARLPlY4R4lOe5f6OyJur2zeFkqSkeq5u41aJZ0acrUuAuUlxBgBl/aA+eg9Qs4+8oTe8+hF/Owk/yxSpJ63LrT8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZIF6BkRn; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZIF6BkRn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756382893; x=1787918893;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=Im6hEnJY+ANKdk+G/k4X5dBt3bisUIspWc3OQGXJpuw=;
  b=ZIF6BkRnHUYG4CDBKHLjK54ea3f5eE9r6l3rN1LKDD1sHN9wXC+HJoF4
   QDQVeN7eEIQrgvBcxkid6PM5tRJDSXxQJAn1iZq6bAs+FDMhWe4O0arxg
   C2Hg5Hpv0z6HbCcQH0cZaDCbGhvRCJCIUxjx44hPOkfJU8tnc5Kdjvtv3
   JRXrOJXvuvztwJLpUO5D5x95/qmXvj4BG+MA15SDgmELsCI5uV7KQgc03
   tjz23GZw2xLZFgP38BPuY5vMVqj+aQH+e4NdeUynTvqTIDAQIbi++Ep1H
   cfy6Sbyc42aZ5rbzjnFu+s4V2a84qpVdbyGOSYfss0WvmqugJueMmQ/Zm
   w==;
X-CSE-ConnectionGUID: zSicF96zRmOStSQycEvDyA==
X-CSE-MsgGUID: NNzojufxQq6AzOiwht/ssA==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58749742"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="58749742"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 05:08:13 -0700
X-CSE-ConnectionGUID: YP1Qxa8JT1eVHow/eWo6zw==
X-CSE-MsgGUID: gFYlBLG+TrWJnYMboxQGng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="175375451"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.99])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 05:08:10 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Yen-Chi Huang <jesse.huang@portwell.com.tw>, 
 Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250813191416.6860-2-wsa+renesas@sang-engineering.com>
References: <20250813191416.6860-2-wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2] platform/x86: portwell-ec: don't print superfluous
 errors
Message-Id: <175638288570.13908.13643395419185818250.b4-ty@linux.intel.com>
Date: Thu, 28 Aug 2025 15:08:05 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 13 Aug 2025 21:13:44 +0200, Wolfram Sang wrote:

> The watchdog core will handle error messages already.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: portwell-ec: don't print superfluous errors
      commit: ba9eddc43f2f05a99d3f7535c9367845aca35904

--
 i.

