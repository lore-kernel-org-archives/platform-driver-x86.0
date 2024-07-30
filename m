Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1C61946DA
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jul 2024 12:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722343668; cv=none; b=hLYwKncJ5n8H0lF+K3sDDUt7niI+I7x1uOQLDmM3J/8TmtOgV3Y1vhf6UEfDjXlQWDSarXsuqmuOShXrzGmjysjhdqvS/asiVS36fza4KVGjhCXxcHWHYJvgkYshj2qgZww7cKhQrtYld1I5V15j2h6NlcdWDgekE9Y0yeubos4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722343668; c=relaxed/simple;
	bh=fFZImm84OmcmSxSIDj6a6eh17HcyD4cfj8bM07PC8YA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FgYKQnA+YAcWktt7i8qroHKhy8MSy3FlV0XvWwEQ/Yrpj+V9qWJolXaCVwAovPNNkaI/yJOZM0FcHXd6SrGfouDvg7bzzNZFP57JLdigwuKR8jwEhYZVCQJUcGrY4fU8wRpcPt4N+o7Gu7qttZnWM588p2SkzIfPETZNs1qXW2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VSNWQQ0k; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VSNWQQ0k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722343667; x=1753879667;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=fFZImm84OmcmSxSIDj6a6eh17HcyD4cfj8bM07PC8YA=;
  b=VSNWQQ0kiQu8Ii8/ltZUx0o/Chi6YDauCu5J9xXWeOa0qTKAZllxIwtp
   VzIZCCHZeKFnhcnmh1pDCI+04v6XzcsvsJoVkx3pmhu1jaRGatQF26NSs
   rtJ+OERYPFjSj50QC6pRi/kZoF3+2WJdJ7H1hp9MtnqmLdwrS6o08Lky2
   SALFAvESbEIPfvmOkYpZ0suRkj3/kQJwyFsI9jr4dChjr8BQf3bEkhM97
   KpQWAK70Fe6OTQgbD6nNhCWVrQnyJpkcWbP7EV4SMcMN/4cYaUr1DPFEC
   UuIt0674wXhdazjNsSeAlg3SixBf7KcRVdmpgN+0HIaZeBozk/gcDyb5Y
   A==;
X-CSE-ConnectionGUID: F9Gg4qKYS4OYTAjNm/5eIA==
X-CSE-MsgGUID: FT0hSjkuQ4aAu8Vnu6YncQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="24020027"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="24020027"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 05:47:46 -0700
X-CSE-ConnectionGUID: +dtuEX6cRquICZBH9JgDhw==
X-CSE-MsgGUID: hXSxD+WZQiilh/Cyo4YhpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="54582371"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.25])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 05:47:45 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, 
 En-Wei Wu <en-wei.wu@canonical.com>, Kostadin Stoilov <kmstoilov@gmail.com>
In-Reply-To: <20240729120443.14779-1-hdegoede@redhat.com>
References: <20240729120443.14779-1-hdegoede@redhat.com>
Subject: Re: [PATCH v2] platform/x86: intel-vbtn: Protect ACPI notify
 handler against recursion
Message-Id: <172234365999.2712.1805398197076221699.b4-ty@linux.intel.com>
Date: Tue, 30 Jul 2024 15:47:39 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 29 Jul 2024 14:04:43 +0200, Hans de Goede wrote:

> Since commit e2ffcda16290 ("ACPI: OSL: Allow Notify () handlers to run on
> all CPUs") ACPI notify handlers like the intel-vbtn notify_handler() may
> run on multiple CPU cores racing with themselves.
> 
> This race gets hit on Dell Venue 7140 tablets when undocking from
> the keyboard, causing the handler to try and register priv->switches_dev
> twice, as can be seen from the dev_info() message getting logged twice:
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo branch. Note it will show up in the public
platform-drivers-x86/review-ilpo branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: intel-vbtn: Protect ACPI notify handler against recursion
      commit: e075c3b13a0a142dcd3151b25d29a24f31b7b640

--
 i.

