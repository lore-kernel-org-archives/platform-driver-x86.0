Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0894E51E428
	for <platform-driver-x86@vger.kernel.org>; Fri, 18 Sep 2026 18:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755904; cv=none; b=hSoY0rZQZSOOpsKcAv+ltqrtJqD+FYb6bw9yfp8sN3KpQBnAD7f8TZ+c73xZeoe3MZy//nTBdgP8fQkta2Gc8SsJ/8jwrv5Sw7kmykHX/9Jxlel8M50jm8DyO6ZeYHKUdKkLk2gpuRbWEYrbtlKF4Kv74yajtwnZitMmuN9pCSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755904; c=relaxed/simple;
	bh=3RZfnPHn1y0Qt21UiwNDUvs6G3nXFC7UP90fbrHvV3k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l1Rxru+pt9qLU7xt8zX7kwXouTynHb+xTInPO6r2aUtykikZxGNtVW0PkVnnMOqlbuMOwvQin9/Kt4Ske4dX0dgatngS31Rg/DUhTOymaR4B5V8jLbZKz0sPrb0qzSIegi05rykdXvUQpYG9D/lefNkIy/F5MwJggKesFrdOlYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yh6uw8CI; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yh6uw8CI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789755903; x=1821291903;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=3RZfnPHn1y0Qt21UiwNDUvs6G3nXFC7UP90fbrHvV3k=;
  b=Yh6uw8CIMDS7tYEXDnmAyWm6fPtco13Bn+kUAnWp149anm1HdbsS56lo
   U19zGNLb5YkNzn2glJPJLwycA5xGsYJl8SyPn82Z2FTWHmNR6pkakhKrx
   o1VrOI5N9avdDvQwi6HT4S7T1yMBedVvokcAiQ3mw2jHVBULGLTa6o80n
   ZvgLDXfKUvWaMzLuDzLfoMvDq6CbIJZEIawZgR/ND91ZRYqYm0Q6gLzZw
   LM62qsb4W5oQfHK8e2lpSFa1wRAWlQ5rUaKdbRO+QrVINl1wsecs0/HYH
   lZuWqZq0z+2ohV3e8JkyNgMwhVs4jED7zuaomOBSWn9d2gaKcRiB0ly6M
   g==;
X-CSE-ConnectionGUID: 7cXG6HviSUyP3K5XvhISOQ==
X-CSE-MsgGUID: odg2x/qSTbCO9SBZUw6DUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="107785020"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="107785020"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:25:02 -0700
X-CSE-ConnectionGUID: Mkco7CT8TQaVBRBeV8QTCw==
X-CSE-MsgGUID: bC0US/2LS/aJL82/fNZ2zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="2726968"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.223])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:25:00 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Sebastian Reichel <sre@kernel.org>, 
 David Stephenson <git@davidstephenson.net>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>
In-Reply-To: <20260825193556.133277-1-git@davidstephenson.net>
References: <20260825193556.133277-1-git@davidstephenson.net>
Subject: Re: [PATCH] platform: arm64: thinkpad-t14s-ec: don't send
 KEY_KBDILLUMTOGGLE on Fn+Space
Message-Id: <178975589490.29716.11621877814351272958.b4-ty@b4>
Date: Fri, 18 Sep 2026 21:24:54 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Tue, 25 Aug 2026 19:36:21 +0000, David Stephenson wrote:

> On the T14s, the EC already steps the keyboard backlight when you press
> Fn+Space: off, then low, then high.
> 
> We report that change with t14s_kbd_bl_update() (brightness_hw_changed).
> We then also send KEY_KBDILLUMTOGGLE.
> 
> The extra key is the problem. Desktops treat it as "please toggle the
> light." GNOME calls Keyboard.Toggle() and changes the LED itself. That
> fights the EC's three steps. The on-screen bar also stays empty,
> because Toggle() always returns 0%.
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
[1/1] platform: arm64: thinkpad-t14s-ec: don't send KEY_KBDILLUMTOGGLE on Fn+Space
      commit: 2782e0c22e155cc0852114dcf9bb98c209b06853

--
 i.

