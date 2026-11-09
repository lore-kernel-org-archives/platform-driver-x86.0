Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253200;
	b=jWohIu5wk40uN2yCV7+xPKN7kHxJnk9DzsKQU/hDCG+m4k62/tsRr7Z3sxhfAW/LBbI+
	 26vR6Rk1HMRwElIiWFY8cGVFl16hNkWZJRZadQfGujaqvPCYhIpjSa9FSzeRx2Y3d2okU
	 O+5QnOO92xi7bAVdFZQNWrFfdjfgOdBjsolG1MMpFsY6u7uou0oX9fpzltcu1m+jFIhmX
	 PHxw9JEpd3ykTlarFi9g7bx45H6ahx15QoTJXdT2rMat49yb5sk+G7Ku8FFPiwAffUM92
	 7XR7Onjh9EZKNoAeeQxju7xD4ZzWH2jK7T5wmBVUvw9c3VKozYZS4aZkcujquB3p7LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253200;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=ph1rjcGR5NztLIBopI1Y9R6m1xKgxfKrEU2lbBA7XjI=;
	b=rtoc9TxOfi3F6Ew6gZTBLgVXtcE3N7Rcd0IOMWK7OXgom3THPgY6r5HWhewsUsYBzZm+
	 b666JZgpu8TFy4obRbKyhSuB5lCISNu/XioIVYMWBufbm7YWkX7vuXWtql7eBTWE9MCEQ
	 MM5YKXITnA57vinhrExNTvVp8fWkOOXRjiM/8zwevYaFmxIDQK0ZXL1bSGULAZuWdJAja
	 VKMNaie9ewHF5qBENGh8T1YIDIRc83bCvVnHVqn5cIJcomf8s8EHbbPGAhYBnPXDti/59
	 6D3RQ+blCp7ajj6QVtPyhLgcJerfEiLrIXLAhOJmMiTU2wmqr42Cm/eakc6xms9VUGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QoDbPy+Z;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD96606A321;
	Mon,  9 Nov 2026 19:39:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDD96606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QoDbPy+Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794253200; x=1825789200;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=Y5cnJ6BHzuWCoyhnmdcNTCZjkC8NXrbXg7qP4Bx71ks=;
  b=QoDbPy+ZDvKgkuc38RNfR7OAynz18EKVf9n1p7MIrdgZ/uWjg4eHxGvN
   lRcjSWkIBh0vl0zC5Nhjg07+YUqCZbKcdpCyIXCb/AzwU0JCA+ZQV+2ac
   xiut9BasP5eYhIavTe7dKz0tDPDnlzgB4VNXE0PlCghM/lWbjTRnxvWC2
   bYz2zrDJG8bBABRFDufHeCF7LA/N/h7D3ML90ubj41zWZ0I9zZtfEEbSj
   Eb/QZRaYFVvJAl05GuwN9HWLQP1Zm4swGTVdIPBjiKRr2IvXsEFL3Z7M5
   exrDSE5Wws3FSzG0MoDSsy5wYHU99wh8wB7ASiKXOmn8iqAWv0mE9X8Vo
   g==;
X-CSE-ConnectionGUID: Qj8Y/vmmQQGQHVdbfkhZDg==
X-CSE-MsgGUID: ydVYUhxLQKS2MYs7HFecYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2867521"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2867521"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 11:40:00 -0800
X-CSE-ConnectionGUID: IqVIIpQKQvG8g5dZAvgH9A==
X-CSE-MsgGUID: fYKjVPZETpSWpslKTig0ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="9727699"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.139])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 11:39:57 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, chitranshmandhaniya@gmail.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Chitransh_Mandhaniya@dell.com
In-Reply-To: <20261017073704.606497-1-chitranshmandhaniya@gmail.com>
References: <20261017073704.606497-1-chitranshmandhaniya@gmail.com>
Subject: Re: [PATCH v4 0/2] platform/x86: dell-uart-backlight: handle stray
 EC byte in responses
Message-Id: <179425319244.10927.4769960573480398794.b4-ty@b4>
Date: Mon, 09 Nov 2026 21:39:52 +0200
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

On Sat, 17 Oct 2026 13:07:02 +0530, chitranshmandhaniya@gmail.com wrote:

> On some Dell All-in-One machines the EC sporadically inserts a spurious
> byte after the command echo in UART backlight response frames.  This
> causes a checksum mismatch and the driver returns -EIO to userspace.
> 
> Patch 1 is a preparatory refactor: extract the byte-level response
> parsing into a dedicated dell_uart_bl_receive_data() helper with no
> functional change.
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
[1/2] platform/x86: dell-uart-backlight: extract dell_uart_bl_receive_data() helper
      commit: c7d2d8e9b177c3542a566a043c055c520ebad8ca
[2/2] platform/x86: dell-uart-backlight: recover from stray EC response byte
      commit: a71b1ac1169ff29414d1a0a1d0341e3d0a9fce63

--
 i.

