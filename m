Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489646;
	b=C7jG20IIfLGLyNxlhRfY1vaZTQc/xmBspFcw2yCZT1fQ+P9oMnqqh6UMrkXfeioIc2p4
	 t543SsZ8KRLaYP3Tz6FMLpOs/AkvaTQBGl4/GAW0SbmY26s2X3vYbSsscdoXL9kb58y3O
	 NOvGG1MXIfuMc7OyK689leFgARIe85br7cUbrfPhmq/vJFo0rKYqVd/ci4A3SYr0S6wN4
	 Qf6qH+ra2miB39EdiEsy+udYfIJ06ALCSAZBItPMetwuA9hOitLmxqftmUc8XRPa+hUUd
	 4ARn/8mXocv22UKQOUDVQyJBOtuSIoY2lSOJwprg39/G7od/d62LcINTugz8Pa9IjBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489646;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=BauxcBgDfmgQKp2/drCBBfs0X0Z+HVLI8LpvI87ldWM=;
	b=xBShIDgX1OobKvBDK6UAidXC4/FVBmqoghNAj+CwDTNhlTxukuWjWHWHLbl8BFf4RoLi
	 Bh9hDyoPslNPooOWNLkHoRr21PpRgs9tOSx15ob+PR53Hd4+Xk2HnWGh5MVsOEAXE/BP+
	 xhi5XJU37u5x5z+txaPaa52EfYFaH/Hd3HFx8c8kpOW++E4taNhDZ/k19vYX9LKQ4ZBQ/
	 gqcEpgd2MUS3qVs/FbzHqJtO3J1NfN4ZTD5nMCVrAMgBeBL2sso1TwGeTALb/yR/PO23W
	 1hfTtv1fDMv7WrBxC5t9eF7Nxkq/Ex0KQVuXqdyz/B2j27zz2CmX78V7pN4hbqgs1PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="AdAC/6Pc";
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AAA606A890;
	Thu, 12 Nov 2026 13:20:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26AAA606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AdAC/6Pc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794489646; x=1826025646;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=6tGv3AFw8zzmZWfiJf0nT/JrWH5deiRbrJrYk+29TFA=;
  b=AdAC/6PcYSOz3iZGWoHiMwzmGHzhhkxj7qFveymY6UutBcWtQiE1l8Dn
   WTW6mfe13IhDaONMu1h5oqwviqaPKpsub7d0g3sjTOH9k2FHnGp/kWxTG
   MLNPZbdKPRyfS4gRQDeEy3ohIYsE0+eMj9+LBKw+3QUp5RUgxHNbkZ5fV
   cCQ1VAWIWZIU1Rd6k3qrCBZF/0St3ufRmjbXhqUqS6+BUfpqTI+yPuzL/
   zi5+Iuq/y/yyjBHsPcH+uZMR9nTfNubEGG7MI4/Wd1X/tew6H/mv5eMWv
   DQdEsx5WEbsAaf0mGJ8T5lCEdQYsRi4B0MKzMFZA4wZ5uw8lMC7/PlzFp
   A==;
X-CSE-ConnectionGUID: bigV3xdbQH6zERTK9w95JQ==
X-CSE-MsgGUID: uDBgHjX4QpmwkDo2jvQTzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3309427"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3309427"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 05:20:45 -0800
X-CSE-ConnectionGUID: FLDDfmghTnGOauCWZY9xKA==
X-CSE-MsgGUID: 3GoXGL36QG2vU0H8c8aabg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8586269"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.68])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 05:20:42 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, 
 Edward O'Callaghan <quasisec@google.com>, 
 Mario Limonciello <mario.limonciello@dell.com>, 
 "Darren Hart (VMware)" <dvhart@infradead.org>, 
 Rosen Penev <rosenp@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261111214440.5473-1-rosenp@gmail.com>
References: <20261111214440.5473-1-rosenp@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-smbios: Accumulate supported
 commands across 0xDA tables
Message-Id: <179448963691.10339.3902049525564166933.b4-ty@b4>
Date: Thu, 12 Nov 2026 15:20:36 +0200
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

On Wed, 11 Nov 2026 13:44:40 -0800, Rosen Penev wrote:

> parse_da_table() runs once for every SMBIOS 0xDA structure and assigns
> da_supported_commands from each one, so the last structure wins. Some
> systems expose several 0xDA structures where only some fill in
> supportedCmds. On a Dell Precision M4800 there are seven: the first six
> report 0x40361f5f and the last reports 0, which leaves
> da_supported_commands at 0.
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
[1/1] platform/x86: dell-smbios: Accumulate supported commands across 0xDA tables
      commit: e0b520a508b254a17cd8937cf832bf4befaa8624

--
 i.

