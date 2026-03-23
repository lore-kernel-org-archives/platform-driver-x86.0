Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A557738E5DF;
	Mon, 23 Mar 2026 10:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774262816; cv=none; b=ZzSbsdJ2/7PJMXPDBeqWCRmS7EMTr/tC3j4y/JSRYhYtpZ5sMNQowkWSPg+ZBTRQSBs7oYNnF9BMwHvlaGjlz9iErWfDURijLsdYSmU+W3D4PVpjKELPfq2Jnyao1JAmayPSc1B2grNmWok0Z28Rwv+E7+A2n24hLbmwTbQUQs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774262816; c=relaxed/simple;
	bh=nhEWNAnh/HZAYacRddawkbg7KeeeXdeBHRxKvHX+C8M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LbDnSZfjiRgoz6asoNDkgtrQFcMJz9dvyOY3q4z08vveWd6zt321aE2F0PyCEJhg1AyQyY6mL5zL+4woJ1QHkqc0ojiasWKKc9KNHJ83pGf6vSHa0fxFhCrdO74PzKrCDvxCozpCnWrWxfTq7IIzDMwjiQDCdE7iIiOvwUYhVfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VMXouTfX; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VMXouTfX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774262816; x=1805798816;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=nhEWNAnh/HZAYacRddawkbg7KeeeXdeBHRxKvHX+C8M=;
  b=VMXouTfXqGhbtyxxBfDcBS4h7LgGeFIy6T4zS2iVBLCmSRmuWHd+d+7U
   rBU3k8sZJ3oo9Zn1RtbGqc1rUteEaRF6ktGtT2ib/hXxnYY08p1cU3tpW
   Vq7MSZk0O4Tfa5DK6yRI43KOQ0C/2TzV/vEdHUJkXpdr1FCGyZXM1OVkN
   nHWR6Hymzbkc/LaiVkHmU8sLv4xUD8hBjwTRqnJc5/6GoCVE33OYmfvvY
   PAbwHKq4U37Bi9biHRsMCsyIf1E/9wGc+NM9zYOa069S8MfjUU59Jw0pg
   1+pWR2tdeKlc2CfeK4ROoLAafleXoD2UEECi/qIVXauwWVdGU9rjf7Nxq
   A==;
X-CSE-ConnectionGUID: yCzD2qEbR+exHaIlBJbmZQ==
X-CSE-MsgGUID: vUXdHD85Tt2EBfxkE4DBIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75226729"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="75226729"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 03:46:55 -0700
X-CSE-ConnectionGUID: EJiVZVkjQROO88lRXqCHsg==
X-CSE-MsgGUID: DWCnQhj6TZWdwJgtS7k6tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="261901787"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.49])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 03:46:53 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Maximilian Luz <luzmaximilian@gmail.com>, 
 Hans de Goede <hansg@kernel.org>
In-Reply-To: <20260320221143.3237791-1-andriy.shevchenko@linux.intel.com>
References: <20260320221143.3237791-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] platform/surface: hotplug: Correct inclusion
 for GPIO APIs
Message-Id: <177426280724.8512.8716370470923229607.b4-ty@linux.intel.com>
Date: Mon, 23 Mar 2026 12:46:47 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 20 Mar 2026 23:11:43 +0100, Andy Shevchenko wrote:

> The modern GPIO APIs are available for users via linux/gpio/consumer.h.
> The linux/gpio.h is legacy header that is subject to remove. Hence
> replace the latter by the former in the driver.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/surface: hotplug: Correct inclusion for GPIO APIs
      commit: c62bf0b0c7608b0b47548e0f52d65183ad6ce2eb

--
 i.

