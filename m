Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DF1204F93;
	Mon, 29 Dec 2025 10:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767004437; cv=none; b=D20T4ZDXpCpIaGOy0jxFftXW23RYExLPzREnDF0Y3qUc8GUex5YONPz88DYIliI43TRzBgg4Xe+FxnYVk8bPzrPp2fH6w5Escp2LNgpcr2uZ48sXKx75GpigeLO/qe2y0jeNZ71k10wEjDDAysmaMe44fMAfjPR66tGUq4HmX+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767004437; c=relaxed/simple;
	bh=mU0aZWkZH+F1wbIlty8+BJt3JC1qrLnnBuYpv+G67P4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=rh1KpxT1IUCwEGCzyIQVjz6azjObqhLT3b3uNwMB4KMr/bEOZ5xf4u52Dfc9tjtDn93JcchgLeYPO+7nCmThYbyTct5zooSF+DSkF4z/95YAxr7YQfHBNV4A+ryFih3laRM6ErpB+hzrIvrabQwzmbv69Umm5U0idELblITluzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zc5kVHjj; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zc5kVHjj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767004436; x=1798540436;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=mU0aZWkZH+F1wbIlty8+BJt3JC1qrLnnBuYpv+G67P4=;
  b=Zc5kVHjjADciMrWC9+8TlQxwHxMBd9Frfv/UzCjbjfRKLB80IyGUFkvP
   COm7/rR7jsvEbDhsz8G3+DQfZRI+8SDVhgJqFXdcodgRqSF+WgU9BJ+kd
   hGewi8h66P1yYEEaym8Z3TLctMNSxtSzRladtvCQU08C+i8Ul3hP0vtBM
   ew4l9Ed1uZ8HP7UXs5cUkE7UYeGWtPFEyj8u3ZPS/IlFs4eyZMQ0FimJt
   izKIDGQDT/BkrNawqCYyq4C15jll3Abw2EGxC14Chx8vmtL52NTgbWu1P
   pdtEpFwl/Vfo2/CMXm7vtNCOLfFuUYEzSLVRKY+oicoOEYN5D0M+L3Vys
   w==;
X-CSE-ConnectionGUID: tiBiJeugQ/GS1LuDC5bAsQ==
X-CSE-MsgGUID: LhHWZ8ipRWysIMNZG7rZIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="91270132"
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="91270132"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 02:33:55 -0800
X-CSE-ConnectionGUID: 58LWT8wPQnewYtNrfpVf1w==
X-CSE-MsgGUID: ip7CjJO9SQiRjCAj9nFGyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="200517500"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.30])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 02:33:48 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 29 Dec 2025 12:33:44 +0200 (EET)
To: Denis Benato <denis.benato@linux.dev>, 
    Denis Benato <benato.denis96@gmail.com>
cc: Krzysztof Kozlowski <krzk@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
    platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
    =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Mateusz Schyboll <dragonn@op.pl>
Subject: Re: [PATCH 3/3] platform/x86: asus-armoury: add keyboard control
 firmware attributes
In-Reply-To: <158ff4a5-027e-4b0f-8dff-f3227cfddc2e@kernel.org>
Message-ID: <d81a7a8b-6199-a82f-45ab-d94e9f024435@linux.intel.com>
References: <20251225143007.2684239-1-denis.benato@linux.dev> <20251225143007.2684239-4-denis.benato@linux.dev> <3b2d6500-0f54-42bc-bc9d-3bbe0fbef5c8@kernel.org> <1aada2dd-c689-4e29-a47e-ab5c82f21b89@gmail.com>
 <158ff4a5-027e-4b0f-8dff-f3227cfddc2e@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 26 Dec 2025, Krzysztof Kozlowski wrote:

> On 26/12/2025 12:46, Denis Benato wrote:
> > 
> > On 12/26/25 12:06, Krzysztof Kozlowski wrote:
> >> On 25/12/2025 15:30, Denis Benato wrote:
> >>> +ASUS_ATTR_GROUP_BOOL(kbd_leds_shutdown, "kbd_leds_shutdown",
> >>> +		     "Keyboard backlight while system is shutdown");
> >>> +
> >>>  static ssize_t gpu_mux_mode_current_value_store(struct kobject *kobj,
> >>>  						struct kobj_attribute *attr,
> >>>  						const char *buf, size_t count)
> >>> @@ -867,6 +1043,35 @@ static bool has_valid_limit(const char *name, const struct power_limits *limits)
> >>>  	return limit_value > 0;
> >>>  }
> >>>  
> >>> +static struct asus_armoury_kbd_status *asus_init_kbd_state(void)
> >>> +{
> >>> +	int err;
> >>> +	u32 kbd_status;
> >>> +	struct asus_armoury_kbd_status *kbd_state __free(kfree) = NULL;
> >> This is an undesired syntax explicitly documented as one to avoid. You
> >> need here proper assignment, not NULL. Please don't use cleanup.h if you
> >> do not intend to follow it because it does not make the code simpler.
> > Hello and thank you for your feedback!
> > 
> > I have used __free here to match a previous comment from Ilpo:
> > https://lore.kernel.org/all/25bd0c90-2de0-ef66-c18d-661180b71fd4@linux.intel.com/
> > and I figured that since this is the same exact pattern as that it would have made
> > sense to use it.
> > 
> > May I ask you to elaborate further please? If there is a more effective way to take
> > advantage of cleanup.h I will very much consider it.
> 
> Just read the doc before using it. It is very, very clear what is the
> recommended syntax,

The documentation is in include/linux/cleanup.h itself (search for "NULL" 
to find the relevant part towards the end of the long comment).

And please still use __free(), we just want to avoid using its 
anti-patterns.

-- 
 i.

