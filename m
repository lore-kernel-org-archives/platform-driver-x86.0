Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADD3379C22;
	Tue, 18 Aug 2026 14:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787063631; cv=none; b=oy8lqCEAwT+Mhkm0BfPtyhFySJ1XPh63+j5yL9eFTu/f6NMTCyAjEIaj02GlgrGM2b/O//3dGxz4wbXVcb8LZ8wLMydiccbM79JV9JZGGPWxBhHQgCIrAPr76SvtaHo1nMJs1unTdwBNrBrcf1wBzhcuzS7SbLLKOGKIDIS2CwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787063631; c=relaxed/simple;
	bh=D4GJYhnBNZ5TRw/ZJyagH1PzwZy6hjkHEuu0d1UNVcY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gLCmiSZgH4B1GekQoJ+8b3zwnUiz6nF+Fn93gDMcDLpqfHRrOW78ZbuIu6gdrORlQEbNguPFVdJ6x1nzG0IYo3mGly3jXrkY9/WwHcYEChyvd3mWmmIo7hQdZpOkTXnOCRPVtbtScRGmSppUBg4zmbj6TmPTRDrqvctUhIPa0Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WM2j3HL5; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WM2j3HL5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787063629; x=1818599629;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=D4GJYhnBNZ5TRw/ZJyagH1PzwZy6hjkHEuu0d1UNVcY=;
  b=WM2j3HL5MEqX3zDWPWOXZDaNuAD8gppB/rLiyrHlLQV4qNQ3ZN/GvMQ/
   fVyChAmoeCS8sQz/+SQw141bJ+tvVkA/R60HBOZKK6jPRACO7o7WSXSvr
   Ua6GaSFZIWV/9YzD/XZNlXJz2Donrxkhcb+OtrgS4rHhRtpE142lZbAmz
   dzM4SFXw+lUHmVJ76DyO+h11zR6IUntUdA2cSA3ukNncmrnWJaPzkXWft
   R3KsOAZ9QKlHp0DkRML2j3OQG6QNON6fBYYhFOTJEmZbQEgWTOcctgVwr
   ohkpeOKuwUD0L4NOb3ZPToDS3GwrfKqE3/SDvoOj7O24Ug7vVdWPs2a/U
   g==;
X-CSE-ConnectionGUID: KCRH42RWR828gAi04geWdQ==
X-CSE-MsgGUID: vuurn2/tQ3GznKX8zrRV1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98712348"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="98712348"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 07:33:37 -0700
X-CSE-ConnectionGUID: iqC05Be9RRmSY/jat4UHNw==
X-CSE-MsgGUID: K8t73fnmQVqqkOMAKyEzCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="265273095"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 07:33:34 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Gladyshev Ilya <foxido@foxido.dev>, 
 Musaev Ibragim <atomicus.xyz@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Mingyou Chen <qby140326@gmail.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <178405473606.25865.4048095379503614221@gmail.com>
References: <178405473606.25865.4048095379503614221@gmail.com>
Subject: Re: [PATCH] platform/x86: redmi-wmi: report EC state change events
Message-Id: <178706360989.21379.3372926673211357885.b4-ty@b4>
Date: Tue, 18 Aug 2026 17:33:29 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Wed, 15 Jul 2026 00:45:36 +0600, Musaev Ibragim wrote:

> The Redmibook EC/firmware fully handles the keyboard backlight cycle,
> the OEM preset power mode (Fn+K) and the Fn lock toggle by itself, and
> sends a WMI event carrying the resulting state in the third payload
> byte. These events are currently swallowed with KE_IGNORE, so userspace
> never learns that the state changed and cannot give the user any
> feedback (OSD), even though the WMI event is the only notification
> channel for these EC-driven changes.
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
[1/1] platform/x86: redmi-wmi: report EC state change events
      commit: e0d6312578e1fd03738fc2ac8ac21c8bd84e965e

--
 i.

