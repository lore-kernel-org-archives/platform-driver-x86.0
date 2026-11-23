Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458041;
	b=3eLu43vMXrdVg85MusTRc12NuacDy8725KECQSG6Rva+jjWTdJL0ctZ/+Mo31IJCDs6U
	 +q4Ab+HiK7Gid6OQH0mAXvZ6Drx+QX/oCg9Mp8TGvtTC+lG+mOFG7KFQ0CPUT5B8NIQfs
	 L3JXdy0CJX52pD2KXn8uBt1U3PiQXeTkrIpu0MVWPlWKyt0JTUm/RV3UjNDyKNlxHMJIK
	 aXb3ljSXcmWvB/B/Ly0WHU6bGbYRoZLaZ+r1zLPsV2OwAR/OUwrnmgeUScSxIkZFhLMpx
	 gzVcu24O9RcSpPr4LoTWSPzxZ6q5sbjb5Lsq31wxO79IEg8iG/12DO09ynkGgYh7JNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458041;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=1QWGXdyVGyj0nIa2fw+QwUp1+gEhSnwoEOg+0cQbjQA=;
	b=EGZKyfIH6taqM4gWwvdpAVU2h+1zpjdl/nBF6O9M1/iZ2Vg+FDzCLukdSRGfJCGWb2fM
	 CUhAj+lGQvg0B5Q+OPBaFtUEEbPu7QePUp0aoCZyfq/1ppWGn7Me97YlWskHErBemVCJV
	 iWdpkBdnZEU/8CqS42IShtox21fH/zNXuJB1PFmX28cQHv1bQohLbszft0fP2aN+HTpXN
	 TX2ni6vfrU03ZBUfk4hlYgipDO1vJfS37oV9CSVXJ/pwheHlgEKltR20V5gq35e05RhkI
	 Bj6ZE8j/b0IleZc0WSPYrdEcae2fFbODMEiRULqUJvR4nbeJE6vAQvEaZC4/cPd6Zrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KrHIBOYb;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE51606A31E;
	Mon, 23 Nov 2026 18:20:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DE51606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KrHIBOYb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795458042; x=1826994042;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=g5vmfKziU23s5E76Ba1UJgJASQtkmpMHmmyUd676ZMo=;
  b=KrHIBOYbLQCQIniHWp2RcBxTGAHKQ+sItRQT96d2pDALQ61QLQYhn98x
   8tMauhuUF9oq5q4085yzfUK5EAA54NEFrVUw3mv7H0nUCf0mz3BV1tISV
   5NvPTgXr4VaFaHB9sQfcWu9w9tq8HgLFybsaTtbF54ZZQCJS29ph6k+cY
   p2lEMq6ORqzPP+YawVuk52A5uSuPgfj2k/WhEM6rd+58oYqfkIl6ryIiy
   FITCfk3y22ZagQhLhj/dZj0lUQY+SYCXfHAawHW//y3hQrq+T6/q0w7gC
   Jhl73MeLKiTKiJa2bOMvwUuEL2det4o2x3OK5KKhz96SMxLANrKOiv8ik
   Q==;
X-CSE-ConnectionGUID: Gj72ecLgQ3yrC2xjY76owg==
X-CSE-MsgGUID: +6FX8iMNQnuhWb6uroao3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4313702"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4313702"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 10:20:41 -0800
X-CSE-ConnectionGUID: kpXsyVdwSli3WUek9ytOMA==
X-CSE-MsgGUID: I48vrKBJTKiLEYNgK9oezw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11738225"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.225])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 10:20:38 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Joshua Grisham <josh@joshuagrisham.com>, 
 Jamil Khan <khanjamilahmed202@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261112165433.64461-1-khanjamilahmed202@gmail.com>
References: <20261112165433.64461-1-khanjamilahmed202@gmail.com>
Subject: Re: [PATCH] platform/x86: samsung-galaxybook: Re-enable ACPI
 features on resume
Message-Id: <179545803285.12968.5318331181096127448.b4-ty@b4>
Date: Mon, 23 Nov 2026 20:20:32 +0200
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Thu, 12 Nov 2026 22:24:32 +0530, Jamil Khan wrote:

> The driver enables the ACPI device (SDLS) and its features (notifications,
> power management, keyboard backlight, block recording) only at probe time.
> On a Galaxy Book4 (750XGK, SAM0430) this state is lost across hibernation,
> and after restore every CSFI call fails:
> 
>   acpi SAM0430:00: failed to execute CSFI; device responded with failure code 0xff
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
[1/1] platform/x86: samsung-galaxybook: Re-enable ACPI features on resume
      commit: 94b6cb8cada6c91b9d070a815348f3ca900ca144

--
 i.

