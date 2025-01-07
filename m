Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8391F1913;
	Tue,  7 Jan 2025 15:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736265590; cv=none; b=sKbhslaNpzSBNZ3AiorDnog+1aUMcOpM9R7JQ1wK4NUgGMHTng4e+vL5xE2zFseIG46IPCwWQx3XayY8yl9Zb06Z3UXb6OeMtt5jk6YqC7K/a+NE5mRD93O7XXMzK5aIEgMveA6cFt6UCkr4D7ouzow+d83HvHKH3Mx1ODXsgRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736265590; c=relaxed/simple;
	bh=v74791Wgo97UaF8bjnJAPHz6EibnAULJrLR9XHIrqes=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=U5nS0Fp8l5F2T6Y4HjHVC29nu0hFCSgRvxvaLM8fikkVnRIMrXce0KkvIBQYUYnR4N4PstgfVlsk7Hg3BPzJ1Upfoq2IbjvMxv0bbZ9Zd7NJCRus06D+9wdpA2NJUPtg7jb5Pix4z208Gn8If7SxkR8vswaMJ5+TMbAHDgp3L54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=djcnX8/b; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="djcnX8/b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736265590; x=1767801590;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=v74791Wgo97UaF8bjnJAPHz6EibnAULJrLR9XHIrqes=;
  b=djcnX8/b0wUZ381mso1i2F/KWRf/0eSapdHDMMYEYIO2ZZXLU0P+mXwE
   tIBz7WvHbtb9n3uOmEIMIp8T7YlrlwV6IeOhhDFJ9Qv7/GHoGC+Z87SQq
   B6/tr7D9FaVNP1cK+SLFtT2zXfOxtBCg9pzm+xnOk+61vHnrr7Zd8eHbB
   SEgqCauq7KYDEBY4du6xvM5208Nuy+YPzLWLsrwq2jFVtr1UWcGpAG6rz
   YIgcNjQ2i4GG4wMbLcH8nyDOr0liwJwGR/YjkGhCM8RuH5qOffA6nU66a
   f+jN3tFCx3yJ32Oh4kIHHq2NSPl/uDtUq40xtbL+0ep+860qb0ZrlsCUU
   g==;
X-CSE-ConnectionGUID: sxPLbzFtSq612ktUnlQNiw==
X-CSE-MsgGUID: ZDrKe+PzQUaGJRqKpmuUEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="40224301"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="40224301"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 07:59:49 -0800
X-CSE-ConnectionGUID: c7JQF/nuSjKsVbFDyJwb5g==
X-CSE-MsgGUID: EKhy7z2PT1aEM4BrXBV7og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106825276"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.206])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 07:59:45 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc: Hans de Goede <hdegoede@redhat.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <c8f28c002ca3c66fbeeb850904a1f43118e17200.1736184606.git.mail@maciej.szmigiero.name>
References: <c8f28c002ca3c66fbeeb850904a1f43118e17200.1736184606.git.mail@maciej.szmigiero.name>
Subject: Re: [PATCH v2] platform/x86/amd/pmc: Only disable IRQ1 wakeup
 where i8042 actually enabled it
Message-Id: <173626558051.4330.18326031399092092467.b4-ty@linux.intel.com>
Date: Tue, 07 Jan 2025 17:59:40 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 06 Jan 2025 18:40:34 +0100, Maciej S. Szmigiero wrote:

> Wakeup for IRQ1 should be disabled only in cases where i8042 had actually
> enabled it, otherwise "wake_depth" for this IRQ will try to drop below zero
> and there will be an unpleasant WARN() logged:
> kernel: atkbd serio0: Disabling IRQ1 wakeup source to avoid platform firmware bug
> kernel: ------------[ cut here ]------------
> kernel: Unbalanced IRQ 1 wake disable
> kernel: WARNING: CPU: 10 PID: 6431 at kernel/irq/manage.c:920 irq_set_irq_wake+0x147/0x1a0
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/amd/pmc: Only disable IRQ1 wakeup where i8042 actually enabled it
      commit: dd410d784402c5775f66faf8b624e85e41c38aaf

--
 i.

