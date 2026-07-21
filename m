Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C81319049B;
	Tue, 21 Jul 2026 17:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784654159; cv=none; b=hIi6zaWIj9wM0t5RlpB3suUJkYCLgllcjWnO8UrEWCX5yUUFecI7Qarz1sMrO/pNkVeBx3xpK7HQpMfTseBR3TYcDEse4qm5mCLVqLX8pRNUnjHiw1nBAe2RK798WGOzZ6nV7I+x2WhCfU8uaKTX4eaLn5iG/543MaKkfO0g2PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784654159; c=relaxed/simple;
	bh=sY/hzYyuG1yFAktnYFj21Rvcvx1IZdMf2Jdo4FKB78Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JrVLOa7oR8ntdJsAmpQvBLpidQf/s2icH8T+N2VaQ4ZS9KdZvbAy6Jhpo+f+Sy5Ra7iqwdLkf5sCh1msjvfk9xXF/NvwVtQpl+6YsEzvjP7fBqIbGYqeaBl8qazlHJ2BHiKMydYCFE1BJadxJlrfhwwlgV05vWMGaejP8QpxH3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PDVISYLj; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PDVISYLj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784654158; x=1816190158;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=sY/hzYyuG1yFAktnYFj21Rvcvx1IZdMf2Jdo4FKB78Q=;
  b=PDVISYLjR2GcPwPfyL/bcDocvWHhhSMvgcJa3YrKljjR9Pmhjs7GDnS1
   fHejvJSEeo+/8cuid7wW1GAwKgDww/z+iJifKWKm/x7kycV89ZKVNEQ8Y
   5/63x3Hqn1FkLh4tRpck68I3sehydytysXNVj+MojSohURK0ch3wSeiCk
   79Ys8+kjIF4PcdjGayVfZuSDS+uZ+NOYKOLuWUVCJjqVqAuKwNtuJaOP3
   7+TkL3HqBSpXmpBxkZffyloomN66N8ARFY3ajTyieWDzzLeZRqL3TJkRo
   F87148vpgDuKuNrW7jEBB6oB8jIdtN385wFR30CYTWvzLjfsqIV2bNvgA
   g==;
X-CSE-ConnectionGUID: LBAuhX+HR3q4IWyljBR8hw==
X-CSE-MsgGUID: Qv/jh/iqTrCN/cc3c7iQYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85464629"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="85464629"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 10:15:58 -0700
X-CSE-ConnectionGUID: 43DowzGrTRCjsb8hYuQMCQ==
X-CSE-MsgGUID: sqeU0vQZQJGqB9dmFHHUpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="257894082"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.47])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 10:15:55 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D . Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, 
 Nizar Al-Kabbani <nizar.m.kabbani@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260719090843.66777-1-nizar.m.kabbani@gmail.com>
References: <20260719090843.66777-1-nizar.m.kabbani@gmail.com>
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: map ProArt key (0x8b) to
 KEY_PROG3
Message-Id: <178465415041.18499.11634321298464665556.b4-ty@b4>
Date: Tue, 21 Jul 2026 20:15:50 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Sun, 19 Jul 2026 12:08:43 +0300, Nizar Al-Kabbani wrote:

> The dedicated "ProArt" key on the ASUS ProArt PX13 (HN7306) emits ASUS
> WMI event code 0x8b. This code is absent from the asus-nb-wmi sparse
> keymap, so pressing the key only produces a "Unknown key code 0x8b"
> message and does nothing in userspace.
> 
> On this model the key is exposed solely through the WMI interface and has
> no HID scancode, so it can only be handled inside asus-nb-wmi. Map 0x8b
> to KEY_PROG3 so the key emits a bindable event, consistent with the
> existing KEY_PROG3 mapping used for the ASUS programmable/Armoury key.
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
[1/1] platform/x86: asus-nb-wmi: map ProArt key (0x8b) to KEY_PROG3
      commit: 6303451189a6d8f304221065c44ccd597e0acbe5

--
 i.

