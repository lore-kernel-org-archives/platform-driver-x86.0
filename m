Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D594A5C57;
	Tue, 15 Sep 2026 11:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789471938; cv=none; b=lAPmNPFtw3khUi/idJ4xZeN1htAyCEjEx4jkBql9pFohdh4jloijOra8ARUgdkL00MDNk54ERZetKJlpi9OvA9amFhkUWffXbHXtddSjachsRcQir+TRI2XUbnKJDT+yDXrrueNoIU7kc1TnIGn6Uq93AczyX82WgubZHJ8Gi50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789471938; c=relaxed/simple;
	bh=M9I5mcLnC78qkiTpRPDV1F6I8YYOLqHH4suEw1y3BJE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Wu69LaqxHc77oeRrOsVTo8OhDOswtYG4CNmdjHb939jD7sgEzc9u3cYC4U5K8tif9BYUAabXpCOyJSSBYPjA8z1Ye6JNm6cIv0UH3A5y4dBfYkJXMBnrKKuPift8B93/bnb6TFXrT8+idrWJtZMfZyKpfajcHcYzlicV+p/b8IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mc2095eq; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mc2095eq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789471937; x=1821007937;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=M9I5mcLnC78qkiTpRPDV1F6I8YYOLqHH4suEw1y3BJE=;
  b=mc2095eqPV5iP3aicfGSOdreXpmqlOgL5NAoPwEvaBZtx4sIRU0O1TRA
   lul8FWZEIv5di6pV5ue6IRAWaufspoqL4BO0xIPxY8mNzk666MeXnzFXe
   zJQMxyNT3yxY3Y7R9ZP+NEd8QVOp5TaIWxpN0zxDYQ+dQD3isTKLL6Nns
   oY0Fi1pDieQxQKGCrhEpJnaeRDD8Zs76LCsU0f+JSYlZt9hP00euuZzoA
   Mb3g7jhGdu2wI+FelHQaTr0PHFQt0QYIWtKvHCbwtA3eah3MnF/4kSTWk
   +w9bXw/llZX1MKPDgnOBdWSi/demSdn1+LbdHhWtamXDF0quCvq4VUSAp
   w==;
X-CSE-ConnectionGUID: Lvo1hUvcT0KJkX3FyU5hUA==
X-CSE-MsgGUID: osB1wzXSSdyCU4rW6/RaWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101180373"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="101180373"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 04:32:16 -0700
X-CSE-ConnectionGUID: M+KzKsfARw2jQ+Dp5aDJAA==
X-CSE-MsgGUID: 1n9Cbg2HRTSWIGDcBBS8nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="272504559"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 04:32:13 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: ikepanhc@gmail.com, hansg@kernel.org, 
 Navon John Lukose <navonjohnlukose@gmail.com>
Cc: mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260914134216.1295740-1-navonjohnlukose@gmail.com>
References: <20260914134216.1295740-1-navonjohnlukose@gmail.com>
Subject: Re: [PATCH v2] platform/x86: ideapad-laptop: Add Yoga Pro 7
 14IAH10 Mode key
Message-Id: <178947192781.31094.700364847954165356.b4-ty@b4>
Date: Tue, 15 Sep 2026 14:32:07 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Mon, 14 Sep 2026 19:12:16 +0530, Navon John Lukose wrote:

> The F9 "Mode" key emits WMI fn-key event 0x46, which the keymap does not
> cover, so it reaches userspace as KEY_UNKNOWN and cannot be remapped from
> there. Under Windows it opens a performance profile chooser. The Fn+Q
> button already cycles platform_profile through
> ideapad_check_special_buttons(), so map 0x46 to KEY_PROG4 as a
> user-assignable key rather than cycling the profile a second way.
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
[1/1] platform/x86: ideapad-laptop: Add Yoga Pro 7 14IAH10 Mode key
      commit: 8aed0be6b8b719d33a020d07294236e3250dd319

--
 i.

