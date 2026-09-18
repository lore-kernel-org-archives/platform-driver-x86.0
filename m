Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19C151EDE0;
	Fri, 18 Sep 2026 18:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789756007; cv=none; b=GsBmJUwPcMy6NkOof++9mRB9K3PhLfZsNhmz7Ip2jybAEHVmbGKGb/hQ98VTf3x1yWjAc03DgZX/uAj4VQQzXKE9vpydcN74MIipB+/EhR/40E7Z7/lYHw3dl71Qf9FG/nkFkpluUcjaPdiWh25nQXxG1spTThiGxYBT+InNiCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789756007; c=relaxed/simple;
	bh=JGVbUpHbfsbWUGJnZ7qBGTpO8N6e82OZuHsvsbqkm/Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FXTJKwsnvPNDURm0pSPn1nJc/O/kVNMIEDgWX+JnTB9jDf01CKLjbGxknnBSsSeYuY+OuqDhpvMNvmYCYKcwGk8Ze9kvmla4TNOFPRLb9P/lPyQFH8Sn90fVcYb7y/GvBfvGzsQIXrnQkrwcR1Qu0xUq4JA6aO9RpIlr69cwKH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LnjJzaDt; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LnjJzaDt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789756006; x=1821292006;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=JGVbUpHbfsbWUGJnZ7qBGTpO8N6e82OZuHsvsbqkm/Y=;
  b=LnjJzaDtzi9ntV16+p/V4VxdUaM0HrQJS1V0mWtunN0ln6qgtAm+m9No
   S68SGpHaQaNF5NxMQk0bGWwbAGL0NjuS0vwu2l+oRaoYA2UHz4gkzl8eN
   rIEkxSyNydaGC9CoVdk6OpaxipkqRwyrYFx5SmgdnlUC+8G/yN0bX7p0s
   4nHlOqplyHIvM14hdjbyKbbvEM+8XQxpN54X2bVp0fyYADQTAqAbR0Fe7
   N/3NBYh1lEtNVrKD+csFc8IGqVMdAEAx9eXxH6JZYOqbdl2ohzpARvYdG
   +cITCKYw28svR+PK9YVlEKDuraVDpjOyUXt1GNOlQ4MmN2v2RwZy2RrlR
   A==;
X-CSE-ConnectionGUID: rLwlXHqeTCqK3dMS9mAXWw==
X-CSE-MsgGUID: jXlYapLKRNOveclkCfE8Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="77847134"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="77847134"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:26:46 -0700
X-CSE-ConnectionGUID: jyW8D0Q0STiOq6rkRUhVnA==
X-CSE-MsgGUID: LwsbpbD7TdqwFyc5u+F/jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="297975641"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.223])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:26:43 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Walid Elonok <walidelonk@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260913054645.58692-1-walidelonk@gmail.com>
References: <20260913054645.58692-1-walidelonk@gmail.com>
Subject: Re: [PATCH] platform/x86: hp-wmi: Add support for HP Laptop
 15-fd1xxx (board 8DE1)
Message-Id: <178975599873.29716.663655296005854317.b4-ty@b4>
Date: Fri, 18 Sep 2026 21:26:38 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Sun, 13 Sep 2026 06:46:45 +0100, Walid Elonok wrote:

> On the HP Laptop 15-fd1xxx (motherboard ID 8DE1), hp-wmi currently falls
> back to the legacy HPWMI_FAN_SPEED_GET_QUERY (0x11) command because the
> board is not listed in hp_wmi_feature_boards[].
> 
> In HP BIOS DSDT table (e.g. BIOS F.26), method GM11 (query 0x11) is a
> dummy stub that returns 4 bytes of 0x00 with return code 0 (success),
> causing the driver to report 0 RPM via hwmon even while the fan is
> actively spinning.
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
[1/1] platform/x86: hp-wmi: Add support for HP Laptop 15-fd1xxx (board 8DE1)
      commit: 850188bb14416b0fa1956f94c79324a0d50f9a60

--
 i.

