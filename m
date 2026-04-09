Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC723C7E1A;
	Thu,  9 Apr 2026 13:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775742092; cv=none; b=p4a4MZ1SkSNkb8z5EaDZovwVOKgB9uHEmpdfVsQd2xXP9Fqady8eYbVzCH4FD6ZEzOi8+6/cRzis31fMduuUitT9wtSgOlg2zL0tyJYAfMpi7eQf+ohD/WwEqVDyxQP7F2wTfBOMhAVJxbqw2sTIPDASD8jlKxkqIO+OrWHzK+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775742092; c=relaxed/simple;
	bh=ranInEKjaHKjh6RSOMqdy/rCN/r/tTTiUBdJJdtFYps=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hLYmDmX0c8H6X+0ppu77nuv5HtqGlbc6LMWN2cWrBSGiQ7830d/6rR1XNtXAXiF8DSItET0Kb3RX598dx/j4BCJN4990TEwyQw/ZRLbcslsKmZcOfmcSgiuZ0hPL1UjEVG0kohwegi8VweUKUuEhAnual4VNn3ZFK97xuYb38iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d0On6QB9; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d0On6QB9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775742090; x=1807278090;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=ranInEKjaHKjh6RSOMqdy/rCN/r/tTTiUBdJJdtFYps=;
  b=d0On6QB95teZdSCUuMTz7jSouKO2kvITYfWVi8XbX3fsoxc9VkM0WZZI
   kgQ1Uwf7C+0VZsBNiYihV3B4koF2+R2iB+8kob2Go1YD6DZ+l7i7TRU1W
   4hnT/ITYzcqLnyp40duw5t1mIL6skBjPTjoScgPOVwCNTBb/pglIgzSPz
   sK8kjMfqf9Csupk88kVknA1QVrI+Nu4eWUOwrpCDLA5O0sBU9aK9LaMPL
   5dowKgnrCZ3BmXY8UauBUeH8dKITxEKV3oUMWwYrNlHLD4Y0FXQyJU0N1
   VJ5sJbJQyDwnSQqIVfPu+zONJK4C8Wy8yrvnwHHRmgAvkMwDzB0vxR/a8
   g==;
X-CSE-ConnectionGUID: hCHUe/tUTKOszXvDgn7Stw==
X-CSE-MsgGUID: NoSfS+mqTJqau1ovxPdOjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76708224"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="76708224"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 06:41:29 -0700
X-CSE-ConnectionGUID: k/551sLNRTKsJvaZvLVWsA==
X-CSE-MsgGUID: VeoTpCDsQPaRBA0tOL55oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="233756833"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.197])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 06:41:27 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Krishna Chomal <krishna.chomal108@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "Artem S. Tashkinov" <aros@gmx.com>
In-Reply-To: <20260403080155.169653-1-krishna.chomal108@gmail.com>
References: <20260403080155.169653-1-krishna.chomal108@gmail.com>
Subject: Re: [PATCH] platform/x86: hp-wmi: Ignore backlight and FnLock
 events
Message-Id: <177574208280.8529.8908382951281952205.b4-ty@linux.intel.com>
Date: Thu, 09 Apr 2026 16:41:22 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 03 Apr 2026 13:31:55 +0530, Krishna Chomal wrote:

> On HP OmniBook 7 the keyboard backlight and FnLock keys are handled
> directly by the firmware. However, they still trigger WMI events which
> results in "Unknown key code" warnings in dmesg.
> 
> Add these key codes to the keymap with KE_IGNORE to silence the warnings
> since no software action is needed.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: hp-wmi: Ignore backlight and FnLock events
      commit: e8c597368b8500a824c639bfb5ed0044068c6870

--
 i.

