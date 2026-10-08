Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D284A3B1EC0;
	Thu,  8 Oct 2026 17:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791481119; cv=none; b=pfh/ic4dnLdhGqXjUTjz0sokKBDem2U7780wERYosjfUyhqa30ojf9oB7ApLtBMXzaIEQfY/I8dP2Ju/6hWllkJFKvVq2B0eDoypjtky6eu6rFe1MnHrcrUAg85kLWya5dQrxXNLiS8BhNF7+V739IzTmfS5Xqhqms5BzDHbX68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791481119; c=relaxed/simple;
	bh=tH8d8O42s+tzqmqItv83UbysnA84EhNZf/dJEZXmXXY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OehyssvA/2+2sfb885gh8qCxHzcGtvWBD8RiD1W5KDbjCsu3PrFZYnqv10Bm18Ha9TnV9XPG0Bj9v4BDZzJssDTdYpVCh4/aCVGZ+96S5/CKVFnaOUO/XyvA3X8RGFLzLk/U3/V4Yzy+j5fNMAZUjvZK94MEUqJGsoKGLSSCMPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ICbR4MhH; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ICbR4MhH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791481118; x=1823017118;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=tH8d8O42s+tzqmqItv83UbysnA84EhNZf/dJEZXmXXY=;
  b=ICbR4MhHZofRPp7w/kuxvyvxyBrhHS+iOMA+gSth53lxbMb+SUG1zZzh
   Uv05XrRqNUULRQHk2CM7FSAgBkkn8vy1D3zydHAvmHyY+V5FkuIXwTzaY
   YZtGLJtTqDgS0tffrdPbhXpwTSrme9Yoe7a6ly2vfleKs8tNvtrJNe2So
   +ItMqdJaSB31rYGwh5kGyXzsiHP7e5UPROdJ+YuQaTiOeQ913LcSS1jpI
   paWigMFmW38Fstu6gwUu/77RtM1j6JHNgrU6s6K13AJrL3VMUUvVhyvhW
   Td/ylR2HLRzFNVwwjLa0BBVlbApDWyqETDJFRfGSi6B1hNr/wjYMUsA7V
   g==;
X-CSE-ConnectionGUID: k4+HrvgcS0qVe9Hdp/Xunw==
X-CSE-MsgGUID: WviMO41ZQAOVcX7Q03m2JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="279920"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="279920"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 10:38:37 -0700
X-CSE-ConnectionGUID: 4BPhJrC7Qi6Pu1JAN5u98A==
X-CSE-MsgGUID: zZPLrQnzSQSTuX3Hck16kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="1919402"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.140])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 10:38:35 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Armin Wolf <W_Armin@gmx.de>
Cc: wse@tuxedocomputers.com, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261007144101.323289-1-W_Armin@gmx.de>
References: <20261007144101.323289-1-W_Armin@gmx.de>
Subject: Re: [PATCH v2 0/5] platform/x86: uniwill-laptop: Lightbar fixes
Message-Id: <179148110928.29028.17146158167227573018.b4-ty@b4>
Date: Thu, 08 Oct 2026 20:38:29 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Wed, 07 Oct 2026 16:38:53 +0200, Armin Wolf wrote:

> This patch series mainly deals with various issues inside the code
> responsible for controlling the lightbar on supported devices.
> 
> The first patch utilizes the improved multicolor LED API to report
> the correct brightness of the lightbar to userspace. The next two
> patches fix issues discovered inside the code for controlling
> animations, while the fourth patch fixes an issue with the naming
> of the LEDs in general. The last patch also adds support for another
> variant of the Intel NUC x15 laptop kit.
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
[1/5] platform/x86: uniwill-laptop: Report correct lightbar brightness
      commit: de41d8b4d0dbb81c81cd99c245238d878a3e1951
[2/5] platform/x86: uniwill-laptop: Implement rainbow animation as trigger
      commit: 59e4e406b6c08ad41f3ad86db6d42b82d8539c12
[3/5] platform/x86: uniwill-laptop: Fix breathing animation on Intel QC
      commit: 969a3bfa474e35828e142d0160f393a97d9bf0ee
[4/5] platform/x86: uniwill-laptop: Label multicolor LEDs correctly
      commit: 42e6b269fc1134a3fcce57539034ee496e2c1344
[5/5] platform/x86: uniwill-laptop: Extend support for the Intel NUC x15
      commit: 7a159a14ce0f5d5a3c2f835f39986ec5539ae374

--
 i.

