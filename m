Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8602D3A1BB
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 Dec 2023 13:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hKQzv/M8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702905055; x=1734441055;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=x49bGU1HT4iJyMcHAJqe92alYOxVER7S5DCsE13WcA4=;
  b=hKQzv/M8h9S0fqILWjC0Jlu57dwALm+58Jz/bEDWh7yR2K014wzXsNgW
   Mm/bG9csYOzoFoH9DGh/Z6FXstEHTqfrZTggjFgQciiqDx6E1nZDwKXno
   Y5i/FMCiY7utc55vIgv6fyoBtvG85b9k6cc8AlhAp2AP4JmxIrZumWpPD
   VO2kb2RhU+sa5fpebPA1BJ7s7nzYrqsiOSVXkOvN2wkYOBxHFgEkyYO47
   EG06Kv45eoXApR5GUXOjtNLW1qiyxRH9mFJnlAusFGx3U88pj3PWu8AET
   rxc5LxgQt9tL+T7yfVKnDw1icx39mAIIQHcfUTdEJV2tOD+9ZxQF6FwaI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="461954292"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="461954292"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 05:10:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="768838720"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="768838720"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.246.35.56])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 05:10:52 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 Mario Limonciello <mario.limonciello@amd.com>
Cc: "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Goswami Sanket <Sanket.Goswami@amd.com>
In-Reply-To: <20231212045006.97581-1-mario.limonciello@amd.com>
References: <20231212045006.97581-1-mario.limonciello@amd.com>
Subject: Re: [PATCH 0/4] Add a workaround for Framework 13 spurious IRQ1
Message-Id: <170290504658.2622.2039861505699399779.b4-ty@linux.intel.com>
Date: Mon, 18 Dec 2023 15:10:46 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3

On Mon, 11 Dec 2023 22:50:02 -0600, Mario Limonciello wrote:

> The 13" Framework laptop EC emits a spurious keyboard interrupt on every
> resume from hardware sleep.  When a user closes the lid on an already
> suspended system this causes the system to wake up.
> 
> This series adjusts the previous Cezanne quirk (which has a much different
> root cause) to be able to apply to other systems too. The Framework 13"
> system is added to the list it will apply to.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo branch. Note it will show up in the public
platform-drivers-x86/review-ilpo branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/4] platform/x86/amd/pmc: Move platform defines to header
      commit: 85980669a863514dd47761efd6c1bc4677a2ae08
[2/4] platform/x86/amd/pmc: Only run IRQ1 firmware version check on Cezanne
      commit: 2d53c0ab61e62302d7b62d660fe76de2bff6bf45
[3/4] platform/x86/amd/pmc: Move keyboard wakeup disablement detection to pmc-quirks
      commit: b614a4bd73efeddc2b20d9e6deb6c2710373802b
[4/4] platform/x86/amd/pmc: Disable keyboard wakeup on AMD Framework 13
      commit: a55bdad5dfd1efd4ed9ffe518897a21ca8e4e193

--
 i.

