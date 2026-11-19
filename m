Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104178;
	b=2dmio+8pqbQS9Z4usZO7A0SVpJqwMW532kMrPeeY+4aj28KGQDo7jIVRxUaAwYs2TVkp
	 uNpn5ljxRltdiJSGmDyx3sz81urOAdRPm8PiuvKBUIVfW+h7Vse25tUwg9YR7WJ+QfwSQ
	 1GBpe/kiVG0lHKEkZCaX4nwF+Mqz4MqlIWYdNB82n/9gXnWdn4DqjC7kFAiAW60oICmcg
	 L6QeY3gy5155PL8aEfBiTJFYzt9tSw9YN4vgXYs8tNKMs8+U175ZiHEwqqOcSpzS+b5ZU
	 1Mj7vgZ+qYgAG6adJsGLzuH9Aw6sMNvlWFo14gYTibdxbuA9F/MEsmpgmrdxLjan2WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104178;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=eazclCm+yJz2lxPwxeX6ZMQ+7OTOEK327ttS+q3whLk=;
	b=T5XuB+4uS/aol0Lcy4Fow6ktVDN7G8cUY90+TBv1pWJKL3+VLuVaHQt/Npne2fPOxqjO
	 zIUfcM1v0w/bGWp/ct9QD7boLciDeWbGj5YJdXtXwkDeYq5kP/Bs2okDKrp6OcP/At2PY
	 pP8xULI5tW4EjGZTii+337v0hvcPQ7Vvak76Z0Q0CeKFSBrmh/yHQ5cFCis9e4DQvpwxc
	 nhw+HJjoORS0xkCm3qFTuMipd3tOLsUla2rW84QgDq6NMHY1Cd0jzPj0hBrgMdclPk+y4
	 W+TIl0naXOpXj7ye8pC8l4PR/kJ8wIlXMeQNDyVCRSF/ZMRhapu8gXRBiWO24u6aGDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Cr8UQiRJ;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30127606A320;
	Thu, 19 Nov 2026 16:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30127606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Cr8UQiRJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795104178; x=1826640178;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=5KqTjLlAiE0FjS2SvvV7s4nPG5K8n3yI8xsyTal93cI=;
  b=Cr8UQiRJOL63X4ap9g27RrS869KNL8SEwwcUAYc5VwdsHDBqbIjF8M3a
   H2KDuFMHAioWRzsu+3AqHZpWBTPpmdc++oM3lGNpf8pPRV4Usea0dGKlE
   qypFPdtl9HXySx+5ZZVP2Oss92ROhyr8c2EdDi++eok38v0LAy4bukXZl
   P4Yrjc2e28YkPpkTdt5jNjhOGvzohwmVvlBIk6036H8gHvoCTWS93japI
   zXfwn6xMVhkri5fAo13WGNdg5sbth2uXt81HzXYmgPAhxj+ze4XjGguGz
   zlDhTJJrOjNdlmQtnx5nUpabmfAVwJhGnWhY7qNk8x1d72PHLk5ih+peZ
   A==;
X-CSE-ConnectionGUID: BC2ZP5uCQRW7v80Kt+zSTw==
X-CSE-MsgGUID: mxqk/QVhQ8actGFx8uS4rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3951210"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3951210"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 08:02:45 -0800
X-CSE-ConnectionGUID: j3hqTlguSyiznRCxK3vxTQ==
X-CSE-MsgGUID: rtKQzVShSWyvlNhk8ZEQ0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10459419"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.132])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 08:02:43 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, 
 Sergei Volkov <taranarmo@gmail.com>
Cc: hansg@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261102155409.3061761-1-taranarmo@gmail.com>
References: <20261102155409.3061761-1-taranarmo@gmail.com>
Subject: Re: [PATCH] platform/x86: hp-wmi: Add OmniBook 7 14-fr0xxx to
 charge_behaviour quirks
Message-Id: <179510415722.21358.13491460719452294709.b4-ty@b4>
Date: Thu, 19 Nov 2026 18:02:37 +0200
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

On Mon, 02 Nov 2026 15:34:38 +0100, Sergei Volkov wrote:

> Extend the hp-wmi charge_behaviour quirk table with the HP OmniBook 7
> 14-fr0xxx (board 8E3B). The machine exposes battery charge mode control
> through the same GBCO/SBCO WMI command 0x2b path as the Spectre 8C15/8C17
> boards: inhibit-charge stops charging on AC, force-discharge discharges
> on AC, and auto restores charging. As on other HP designs, the firmware
> retains the mode across reboot, which the existing setup seed already
> handles.
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
[1/1] platform/x86: hp-wmi: Add OmniBook 7 14-fr0xxx to charge_behaviour quirks
      commit: c05ab7245825603c04cacb47f0e2536abb6e3991

--
 i.

