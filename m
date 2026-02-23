Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9195313539
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Feb 2026 16:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771864428; cv=none; b=BTxmhoVDDy0Q3/1AXnBdBuFjveVd9FbLEHLMj2EU8an5D0drevcdZPv+uvGP5BnuuJJfbd+z5FIpDmhtq0NspZ68u3QsOA4ucHIvQb5p/YYnZTqYcEJaDO8vXG/HSXNZZNnOdhpLjRwcX7lk++UOX5Ax7i8ofW++zSLqBmXdCV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771864428; c=relaxed/simple;
	bh=CLAeEDl0IaAEDpoSsCK4KxkqWoiXMoUok30+DBIlAEE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ACd8pROHsG40iXHVTAb8agua+GI8Y14vZ7v79rwvloDhYm8TAhVzo+aTP89uzzu5DxFTMiA5ndB0QRn+yqONaIgQsOIeHiE2I5OeSeNLKQaY9jyFbjtHsZqgi8Uk3zqlPVgXrEIfx+G+9mrhgIWkmcn+gEu0St86l5qlI8bm8Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lb7IkPOa; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lb7IkPOa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771864428; x=1803400428;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=CLAeEDl0IaAEDpoSsCK4KxkqWoiXMoUok30+DBIlAEE=;
  b=Lb7IkPOaACy3+6LWX1Q53SODfVyrTlyGscelG0uMBpACxzQLRgK4GlUZ
   ViDo7/9RaR8uO0CiOaSjwCm6AbWTh7twC9TJn4kc/dDhbFhD/6qLvdD7W
   Ay6RP9mKg3ce62YOVvd7KlxBXx9yeQy1CrTdzE6lW9SRcWpJYlIErm1CC
   +m5/Ipm0aKs13giaMCOhaj1HIFVODAhojZ7XE1xAl/7DoshbwzTYYPm1D
   5pg34U4lUvurQkuaNeWhripGsFwNMIGz/Uv9nH7Ni7vCM0hzCBXmFo5qW
   C3ciTwibCmEE9Vd1q+S5yp/hdcXWq2JshWO/+TbcR6bnR3O6dC++sj9CT
   w==;
X-CSE-ConnectionGUID: WxUCgOamSZ2FCEjaIrctUg==
X-CSE-MsgGUID: Y5oqbm/BT5SHqCXzb7f0uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="75473108"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="75473108"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 08:33:47 -0800
X-CSE-ConnectionGUID: YGwRyzBjSHqR5wmaE5kIEw==
X-CSE-MsgGUID: +jw2CIvUSCiR94jkwy2jyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="246205203"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.30])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 08:33:46 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Andy Shevchenko <andy@kernel.org>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: platform-driver-x86@vger.kernel.org, Yajat Kumar <yajatapps3@gmail.com>
In-Reply-To: <20260217132346.34535-1-johannes.goede@oss.qualcomm.com>
References: <20260217132346.34535-1-johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add quirk for
 y-inverted Goodix touchscreen on SUPI S10
Message-Id: <177186441883.17917.2889102327076049826.b4-ty@linux.intel.com>
Date: Mon, 23 Feb 2026 18:33:38 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 17 Feb 2026 14:23:46 +0100, Hans de Goede wrote:

> The touchscreen on the SUPI S10 tablet reports inverted Y coordinates,
> causing touch input to be mirrored vertically relative to the display.
> 
> Add a quirk to set the "touchscreen-inverted-y" boolean device-property
> on the touchscreen device, so that the goodix_ts driver will fixup
> the coordinates.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: touchscreen_dmi: Add quirk for y-inverted Goodix touchscreen on SUPI S10
      commit: 7d87ed70fc95482c12edf9493c249b6413be485e

--
 i.

