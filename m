Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2775218B2;
	Fri, 18 Sep 2026 18:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789756078; cv=none; b=dEquzTI7wOr+60Tt1CWtBXdp/M6FOlV40GTKtdOcaTs9Iq2qg1Udia11cc8/7ZTDP6HK9VpeGwotiz8c44vixNHWigcfwspzRfyuY9cUZ94CgZXYVSnJkvzteMyIqWwzskAvJp5PeVKP4mb1RIOfo97gcGs8ZrR4qvUkUveIrEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789756078; c=relaxed/simple;
	bh=BgkaW6wj+6zFv+XnrwpXeXcQvV/ocLAYH7HtAOUdScA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ita+z5X3k2WWWqM+hgY/lYgbKpYyEx8FkUxWDNbSCyhWKEk6XOQ2RPnC8HKr48g9my/vzuftlzueJSUOXEB/1/QZvJCTPiQhVp4+WJVW+0D2iMV/yhgxABZHOSvC2nwcnpjrj69Rsh8Fkvo64h9c/dzJy78Nkj/66cEQdeAGiwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GURw9/9S; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GURw9/9S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789756075; x=1821292075;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=BgkaW6wj+6zFv+XnrwpXeXcQvV/ocLAYH7HtAOUdScA=;
  b=GURw9/9SWIPdlaqk2JybjfxMt5r5JnLF8D4u7vH7VrhjIoJQsEE+ZvIu
   5w6NvbYv3c5Oe6aAXM5UmpWZrZI9CccmtbNPnFiYtJtv+iZypK4dyBiuJ
   0KjpZa6ykp93zh7MC/1jckv/qXfbkzIPoxIehSvoFNeP1oJy4MqSIwOKw
   fHmKIgtch1hYIJ9tBpJ6fYr2Lfmdz5goHkIIFa3ZQuUkMzNHc3pK1DZjj
   cMWgGv6jmgi53g524vmZgvgzdNSXZjuRHTDbVnP3twGc994NYQc8URGKc
   z3Y/9Sr9K1Hlt12r62IwcNCdtavMxc9M5z7fboYfli2IJcpjnhZZjjCQg
   A==;
X-CSE-ConnectionGUID: proqhESBQiGXgmS8Tp6e4Q==
X-CSE-MsgGUID: o16Zhd19TLuQLE5jN5DoIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="100881278"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="100881278"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:27:52 -0700
X-CSE-ConnectionGUID: 7NSzilHxTNWi2GVmQsIUZw==
X-CSE-MsgGUID: 5dQLH8dfT4eq4ci06iFYQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="2763539"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.223])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:27:48 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, sjunhyuk1@gmail.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260917011909.75399-1-sjunhyuk1@gmail.com>
References: <20260917011909.75399-1-sjunhyuk1@gmail.com>
Subject: Re: [PATCH] platform/x86: hp-wmi: Add board 8E41 (OMEN Transcend
 14) to feature board list
Message-Id: <178975606335.29716.2385953891625117788.b4-ty@b4>
Date: Fri, 18 Sep 2026 21:27:43 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Wed, 16 Sep 2026 21:19:09 -0400, sjunhyuk1@gmail.com wrote:

> The HP OMEN Transcend 14-fb1xxx (DMI board name "8E41") is recognized
> as an Omen board by omen_thermal_profile_boards[] (so platform_profile
> switching works via the generic path), but it has no entry in
> hp_wmi_feature_boards[]. As a result active_board_params stays NULL
> for this board, is_victus_s_board is never set, and none of the
> board-specific paths that depend on a real ModelCapabilities entry
> (EC thermal-profile readback, the Victus-S GPU CTGP/PPAB WMI calls,
> the AC/battery power-source re-apply handler) ever run for it.
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
[1/1] platform/x86: hp-wmi: Add board 8E41 (OMEN Transcend 14) to feature board list
      commit: 976f48f87e7e4e2b1ee366d75e6e6451fcf3d389

--
 i.

