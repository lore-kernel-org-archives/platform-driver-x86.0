Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104174;
	b=OPvp7Ur7vRyrsw38unsSM7lNCSA7FJenYleKYQE7pXvgazN22jvT3owSVBd8CgclYsn5
	 nZxywMPnGEi7YFQ7E7X8LnOIzPbZi4f+1Goc7/A55A84j9PbMcVQZEQ2IeFdPX9Su+fgz
	 cc+AFxJp8x2BHkGi2xnNSAxaXLyU3zu5Z3LCjMEEPMaiFBw94SFIjktpfA5mJ431T6Mex
	 1l4J9ksLqsi7uCx3oeb6KKiRfXJpwsPN+kvRmF6YyvYVA5mzoClFwZh754CBxnh5VD2/8
	 t0SuICpFDdjvWSWK2ukJoWMa7930EQrevGhJCp0TcIPR6ZNq7Pd9VDEvUW50GkxRp6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104174;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=mnfWgQObWu3OaV2ZpOPrQbH0Xgpg2WwPDkEUFbn7rRQ=;
	b=qeJ3RxYO8hIm3LkxYY7yRV1de6ZAhxfAgsoEPftQswvuN86FK1YGPYqeC8/kcu9jJAJc
	 UcqokVtdAA7bBx7NtM+aCNmy+JuNNWz199RW1aPOUkgHnsa4/zvsdbleXaXUID2wnKiJv
	 pQUHiHLQoxjtyYaZwfw0eKmlE+cGLFvJnLBkI986hCekKhC/+K5D3oBN8iYMx62akWu0k
	 tqZUcg50BO/prFN06PXNZIj7L0xVR9+uzYKnwv90A1z99HF0usEdjnKx1NSQE50fTggfT
	 oYt1g4EESGflgcvRWFuigXcj/auqeMhKfKHF+QovRPuDTObpRx+KV6w9dB8bWnsojZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JDSJIA44;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F63B606A325;
	Thu, 19 Nov 2026 16:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F63B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JDSJIA44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795104174; x=1826640174;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=hL+jXt2LhODe5e9e1Rs6rjIEEb8DV65fDb3USMWDgaI=;
  b=JDSJIA443rIxD9oWkdUHjNcS9zvLe8O6OFf2jpRROd+XBazj0nENRVtz
   ev/U3KYgd4+GzsFgtdWGJLsgvlvr6vi6O8Jp0b+2d9SG1YgewJ3ZRIk2R
   iRAFll8RfTP36neDoyo7H7xPpepfYtD2vlu1DQG9hWmZ4KIuWnAqaXtm+
   G/7V5KDA4sytyZ0KG+zOrDw/X0LlY9A8epYKU5lusdUB0qsQqKP6A9EPX
   p2TKW6zqAHCj5S6UPu8n33Ms8k2x1Vx2HPAIGCuenkDKUOkUhjVVEgnBk
   2HMH2J6h6lZ4W0KqNn4P0Kf4TWUKiFBl9tKr5ukfBz5frScGQMZ0j+Pb0
   g==;
X-CSE-ConnectionGUID: VLhjI+72Q5mo4Xs3falwpw==
X-CSE-MsgGUID: Ymi9jMWPTEWstoNROyKltA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3951188"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3951188"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 08:02:38 -0800
X-CSE-ConnectionGUID: KK5FHSJwQ7CdQD8RdswmZA==
X-CSE-MsgGUID: V6/FXFEoSmOSGJFa8l2jEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10459362"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.132])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 08:02:35 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Carlos Baiget Orts <asinfreedom@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20261030-lg-16u70q-quirk-v1-1-946f25fea731@gmail.com>
References: <20261030-lg-16u70q-quirk-v1-1-946f25fea731@gmail.com>
Subject: Re: [PATCH] platform/x86/amd/pmc: Add LG Ultra PC 16U70Q to quirks
 list
Message-Id: <179510414953.21358.3031318713313160564.b4-ty@b4>
Date: Thu, 19 Nov 2026 18:02:29 +0200
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

On Fri, 30 Oct 2026 00:24:33 +0100, Carlos Baiget Orts wrote:

> The LG Ultra PC 16U70Q (Ryzen 7 5825U) spends ~5 seconds in the noirq
> resume phase on every s2idle resume. This is the same NVMe SMI handler
> issue seen on other Cezanne systems. Skipping it with s2idle_bug_mmio
> brings it down to ~32 ms.
> 
> As on the other Cezanne systems, the entry must also keep the spurious
> IRQ1 (8042) wakeup workaround. Otherwise the system wakes up immediately
> from s2idle, so use quirk_s2idle_spurious_8042.
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
[1/1] platform/x86/amd/pmc: Add LG Ultra PC 16U70Q to quirks list
      commit: 052ced271b8266a9052a4c6123271ce2bd3c1b27

--
 i.

