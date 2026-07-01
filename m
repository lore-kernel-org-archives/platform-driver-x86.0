Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF4547DF88;
	Wed,  1 Jul 2026 11:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782905462; cv=none; b=Vmvsa1xOzQMAb1RMyjF9CjPIcG2NXreWe+9HUuE9pnKjjpU7jHNVXxl9so8lcNUZ+6T+R/8Ia4Bq1qfHI7BBdT0EziRKg5USA9rwwi9tTfsSqKA7bYBXSKO1KafgWLNIShEDsX+Hw2OoHOQFFrXAr9S2GWYdbUUcUsfKTd0UIPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782905462; c=relaxed/simple;
	bh=c4NydMCrejmqA3Zao1YFpwLWee1fdw1zOF37HHbt864=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WqE24QastSAoy7AP4KL/qNLJXSy8F3hzjIVRwfQL+Pn4U744nmfnTnm5V+oUdXFbWCqb2u9xtcZ0XlptVewFN030j7/HYW4lprW/eOgVWzHc8w4Z/tKQjcp+kFQu7x16G3bc/ir4EIMyXxHKUu1xYH291TJsRAJo5QYBKxIAn6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lMKq31z+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lMKq31z+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782905462; x=1814441462;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=c4NydMCrejmqA3Zao1YFpwLWee1fdw1zOF37HHbt864=;
  b=lMKq31z+EjG2BRsPcnc6owrnaqsuaxtxqYcgE0xpVjLW4vwF8DLkJk7V
   0Klrz9b7AWGZH8J/MWCMuQLosldo5msNSTg6YmGi/miDXn+ApijBYA7Ia
   wZXUpafDRq9YNnnU0nsryCul/ooK6Cw/pqxhiGuKez8zVSH94TxW3AerY
   mGmeZ3zGJEYNbfRPo5yeCRj/UDjR5LgYYYsHQAwdxtI9Bn/UbuNaTjyRB
   CC+dWu2H/+WWPB1qEnYSac7oP3oQz8NSXSQQzM6SVFz0Jrzym8PitRx0T
   Vlgwx4kNQgd3yZW1sXlNrxHE/IwutPza0XKdoROilZ/QqNcgrqZfaGegj
   g==;
X-CSE-ConnectionGUID: ZrYz86toQkSrTDRyO0alwA==
X-CSE-MsgGUID: c6+5Nny1Q4yfgvcMrHXvuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83509553"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="83509553"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 04:31:02 -0700
X-CSE-ConnectionGUID: C3rsrXm/S12irhfqmMlO6A==
X-CSE-MsgGUID: q3FtWFGgQQ2RWYW3R7+fgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="275761512"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.83])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 04:30:59 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J . Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Julian Haarmann <julian.haarmann@student.kit.edu>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260614203235.235724-1-julian.haarmann@student.kit.edu>
References: <20260614203235.235724-1-julian.haarmann@student.kit.edu>
Subject: Re: [PATCH v2] platform/x86: lenovo/ymc: Only match lower byte in
 WMI lid switch query response
Message-Id: <178290545459.22449.4751997923150004234.b4-ty@b4>
Date: Wed, 01 Jul 2026 14:30:54 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Sun, 14 Jun 2026 22:30:26 +0200, Julian Haarmann wrote:

> On newer Lenovo Yoga devices like the "Yoga 9 2-in-1 14IPH11 - Type 83SE",
> the hinge switch WMI query returns extra data in the upper bits
> (e.g. 0x50001 laptop mode, 0x50002 tablet mode, ect.).
> 
> The driver previously checked for exact matches (0x01 laptop, 0x02 tablet,
> ect.) causing newer switches to not work.
> 
> [...]

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent or clearly a regression fix.

The list of commits applied:
[1/1] platform/x86: lenovo/ymc: Only match lower byte in WMI lid switch query response
      commit: ace16d4d3f38c74d5934b7f7fb31c601ab32cd87

--
 i.

