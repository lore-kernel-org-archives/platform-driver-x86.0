Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975391AA7B7
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Dec 2024 14:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733839415; cv=none; b=V388N1jbnYjYyZyeqlt5BqhK6duEGWGUdHD5prYG/KnciCm6EMH+DYO7+5lCQ/DNVhrU+iiqIPUiARYMOUqlrFjzsENfuewBCZiNb0LJs6rP9IXVzPb+CC7HZ7mHOo/ppnKZoXkqLqvef+6IbCSCA7HbZl6dk6zgbywS5Qn8NtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733839415; c=relaxed/simple;
	bh=Ba0fpIjUgUMQXw5LejR+upfwrBjTq2zkgbp2tU/dxdo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DXrSl9WT4no/AsSNoh9A+KOp5lkqS13mcN3m7XjOFSvnpE2omCpgenQjuQautVyLT2BpAmdX8QXV4xqSmysDBH89SPi7nuWFiXjzx1WpXVHiWi7ZsolM/pENSibTRD/TGzgctuiixqtrQ0JtoU3mRQSLizeAGr0UXJZ8U/N51HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JKdcSvHk; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JKdcSvHk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733839415; x=1765375415;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=Ba0fpIjUgUMQXw5LejR+upfwrBjTq2zkgbp2tU/dxdo=;
  b=JKdcSvHkK4ysQArbLICgbD9yYc4ElKnWJ0NGkUFy+NQM57LrxrD9D3jp
   TPT+qNHFGUCjK0fgNQqnc1z0q4mGuKW+q0mvwPQCGmT/Z6rnt2p+WLhPp
   yaE+3Qcwbohn2omaIzhOFjMdxWXo6S4NQUjZVT67ktQb9gv+Xi3yzQqMk
   c5X/iLQTA23+10l5W+Mpv0Mun48HSkS4h6CUKDhAPHZM7e2e0yoHOpNH1
   uP+Jz6QbaCwoV0KlkWQCWZ+R8chljjcUHqHPx5OmlnnUXv5DhT5Lx3bd1
   BgjdksgyVe5d1EX4XKausrLiHRyygWBpquJRuVhOlPbXPwS2Unav+mkR1
   w==;
X-CSE-ConnectionGUID: f9iMoDo4RlKoUPWxAgL99Q==
X-CSE-MsgGUID: 1wAPXVQeRPCDkn7sWvEqtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="33912673"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="33912673"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 06:03:34 -0800
X-CSE-ConnectionGUID: rnYWhXV/RbqHoKkIUhMhpQ==
X-CSE-MsgGUID: 5ehzbsGyQjuBzIt4Mrq7Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="100226250"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.56])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 06:03:33 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Cc: platform-driver-x86@vger.kernel.org
In-Reply-To: <20241209220522.25288-1-hdegoede@redhat.com>
References: <20241209220522.25288-1-hdegoede@redhat.com>
Subject: Re: [PATCH v2 1/4] platform/x86: int3472: Check for adev == NULL
Message-Id: <173383940908.11345.14548868603532011488.b4-ty@linux.intel.com>
Date: Tue, 10 Dec 2024 16:03:29 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 09 Dec 2024 23:05:19 +0100, Hans de Goede wrote:

> Not all devices have an ACPI companion fwnode, so adev might be NULL. This
> can e.g. (theoretically) happen when a user manually binds one of
> the int3472 drivers to another i2c/platform device through sysfs.
> 
> Add a check for adev not being set and return -ENODEV in that case to
> avoid a possible NULL pointer deref in skl_int3472_get_acpi_buffer().
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/4] platform/x86: int3472: Check for adev == NULL
      commit: cd2fd6eab480dfc247b737cf7a3d6b009c4d0f1c
[2/4] platform/x86: int3472: Make "pin number mismatch" message a debug message
      commit: 1dd0cb9cabf37fbe20f0a66e4c3972cb21240aed
[3/4] platform/x86: int3472: Fix skl_int3472_handle_gpio_resources() return value
      commit: 6718d42b6eb28228a554db6c8973693ad5320006
[4/4] platform/x86: int3472: Debug log the sensor name
      commit: cc115abc1f9b55092c11c183ebff9ad921251609

--
 i.

