Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792533139;
	b=PAz4/LgsAKQNLzqziboExumr8cmc113p74zMavn3XtjOEKW7u9Xt6v4j+sIXlaqiRrV6
	 6IjW6QbtBghCRl3lZxThi5QI3qEK2wEu03rkme8EP2jPlyvWs9wUuiJIsa9aJ+8XF38pK
	 n21WAL5Wez7n7AFtsB6ngdKOCL0ohKZY1PbRcNWHKXX8N1njAiba4leUAP7hzOoZ8dgMx
	 LcSMRIlIwlP2JEQDwtYV0qJJvqGTWJVAeDmqfD2uaaTAbPqaGl6QbwfAfYc8YmZjk+yKa
	 5xYXww/d+gYtf1xIg4vv7zkvzhtx0cNhF+Czr9cPCx4YLywQ8p+0va00T9NVU1a9ZCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792533139;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=gInRdXBvPVqsYv+GmwNhYwuDb0wjepIYX2G1FB2lCm8=;
	b=F3Su9j15crgzLlTfarfGmW1+heFa/WM0LcjW2Ktud8feIzyCKMsI46605kd8bncN756U
	 CEsupR5UeXQRySBRP/9v/Die4WMDYDpjs2HPYNFh8jxHSJCG+oW7wr86HyVK8mTh9Z3mc
	 2DOkLyCQ6XO8qRiQh/yI7FJbpUvvXukM5CHM7ILl8I4IjMHVkktjxyB4VamnTAqjG9GB2
	 oKxosNoIpMAHRrN18K5afVMeVTyq7JvbpeW9dj8ORx97SBsTwgzXV5wS6QyrXp4tzyRY5
	 KPWFVDmqHFt7AD2/TspCCCWq7c17v4YPjUcgzYEnGUqdFbpItVUHtOrvzkSUgxb4ADA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NHG8IfeA;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC8D606A31B;
	Tue, 20 Oct 2026 21:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DC8D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NHG8IfeA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792533139; x=1824069139;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=AcRg/fr4KxaRgj195SoMtwoHYehUUP6Sk2/JT7Bm7BI=;
  b=NHG8IfeApACUbX9isrVW5S6MbyUR+ZJVKPTXYiv1fIl4QKSo4cx0XURE
   alL5KegmhMmHfjgPg9XRxvNrM5PUjE71rvSRI0WK77ZA3TEdEzSsMbGX4
   a95XAZZxE7Y/PBKGA/HVxkSlVJNeW+46X/UeZukEwqQprpxLD55COnD4V
   9GPS2mbAVfFZ4z58HJuxBOagJDO8sPEci6tPLr4F556XC6aBzbU2IrG0q
   2++yLlGteU15sIEOK/cHJddvw2CRNh3vvUm5/YFWLtrzDyhjDhXPS397v
   WpzzjcciBVrOFzwBy0DZ4o3WRQQulF3QFVdxVv6lWf68zVYwcFKDzggnn
   Q==;
X-CSE-ConnectionGUID: CV84RzZETEKwHpu+cLKxEg==
X-CSE-MsgGUID: I9hcGoczS6eCh9ULa/37Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1136308"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1136308"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 14:52:17 -0700
X-CSE-ConnectionGUID: z8ppB3SoQV+Yjo2CIeKdYw==
X-CSE-MsgGUID: 0Yxi15oiTi2sz9lk9i8AkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2979564"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.181])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 14:52:10 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: "Lee, Chun-Yi" <jlee@suse.com>, Hans de Goede <hansg@kernel.org>, 
 Dennis Nilsson <kontakt@dennisnilsson.se>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261017-acer-nitro-an16-41-v1-0-c2e7a0ee7303@dennisnilsson.se>
References: <20261017-acer-nitro-an16-41-v1-0-c2e7a0ee7303@dennisnilsson.se>
Subject: Re: [PATCH 0/2] platform/x86: acer-wmi: Add Nitro AN16-41 support
 and handle its mode key
Message-Id: <179253312359.28707.13254493672572670950.b4-ty@b4>
Date: Wed, 21 Oct 2026 00:52:03 +0300
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

On Sat, 17 Oct 2026 10:33:57 +0200, Dennis Nilsson wrote:

> The Acer Nitro AN16-41 supports the Predator Sense v4 platform profile,
> hwmon sensors and fan control, but needs predator_v4=1 to expose them,
> and its mode key does nothing because it reports key_num 0x4, which the
> driver only treats as a turbo button.
> 
> Patch 1 routes key_num 0x4 to the platform profile cycle on machines
> without the turbo LED capability, where it was previously a no-op.
> Patch 2 adds a DMI quirk for the AN16-41.
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
[1/2] platform/x86: acer-wmi: Cycle platform profile on mode key 0x4
      commit: d92df6048d22799d04c98616cc42f0601c0edcab
[2/2] platform/x86: acer-wmi: Add support for Acer Nitro AN16-41
      commit: 164de1f81266bcac60ccc1580b02241447047621

--
 i.

