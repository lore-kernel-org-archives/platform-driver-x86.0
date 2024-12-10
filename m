Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073EC7082A
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Dec 2024 14:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733839400; cv=none; b=agDqQD8tuaOr7fzZtIAYMF53J8gvLvhd/HOBXaRN5crlh/l6vpHG+9fQeT/j83LXShpGXp/VcwTKQ+o2TDZJFrjo4WxlUZ3Hl8fUYPy0B4557vzAcLDwQ5e/JTHfvR0uWVlnSqO6AHvP239XNMEZgrW6J+JvVNwSKYk1iJpZqVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733839400; c=relaxed/simple;
	bh=5uKH+2gLTCU9QvXu+B2HBl0CqsMCzWC60BKdcIGSch4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dT3YcZi6tIzOumiLyMaJjV5P4LPcJTHnhU4QFFqgiYH9fbEr1QH3QY6RmVKMtk14KmM+9twiw5emlf003LNVywn6nrIWBGFJLHpEv3+5JKLylPRKu7Eg8z4FriHGGSK5QAu9zRAD6cN6bvPXcAZGZLabX7JLY/a4ZB38dcrQDtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RWPwjasZ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RWPwjasZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733839399; x=1765375399;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=5uKH+2gLTCU9QvXu+B2HBl0CqsMCzWC60BKdcIGSch4=;
  b=RWPwjasZT5aPOYZvCMWktDTb/F+9uJNKqV2QmL1f5ADew/Ca+xLfUKD9
   zd3YIrk7POrh3neWSuUc3XTiEdIRzELZukHao733hvXAJOTRICZTLDK3J
   ZekKCu+AnFIC/oqnMOjvrDoPoSiB/4jbk1bf651hKTIlSNS/0lII9+ilI
   unw9lOp2NIz7hO4i802U6cjCp1ZXFTbStVaBARUPSII0ni6pPpxN2oUKY
   yQgjg5R8/jV0qh3nhKgoKhDklc+W6ArYT5D317JcBvtSHgyBWpPd/xtb3
   pGEsYZQMqwKpRV9n+mPgJBvAgY7aXTJ5lf79J36VOq2jP5nB9HVRcX/sL
   g==;
X-CSE-ConnectionGUID: Z+74gbTwQveMLiAtqqHPMQ==
X-CSE-MsgGUID: je4+2xMmScu3zJwt1p2JpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="33912618"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="33912618"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 06:03:19 -0800
X-CSE-ConnectionGUID: eEDUDJN7QA6Lc9FUn4C44A==
X-CSE-MsgGUID: 2GtY1ujDSRKjrU6ctqi0Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="100226116"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.56])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 06:03:17 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Cc: platform-driver-x86@vger.kernel.org
In-Reply-To: <20241204204227.95757-1-hdegoede@redhat.com>
References: <20241204204227.95757-1-hdegoede@redhat.com>
Subject: Re: [PATCH v3 0/8] platform/x86: x86-android-tablets: Add
 Bluetooth support for Vexia EDU ATLA 10
Message-Id: <173383939291.11345.11132923951479975681.b4-ty@linux.intel.com>
Date: Tue, 10 Dec 2024 16:03:12 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 04 Dec 2024 21:42:11 +0100, Hans de Goede wrote:

> Here is a patch-series for adding Bluetooth support for the Vexia EDU ATLA
> 10 tablet to x86-android-tablets.
> 
> Due to the LPSS UARTs being enumerated through PCI rather than through
> ACPI, this is somewhat involved. Just like how this special case needed
> some extra work for instantiating the various i2c-clients.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/8] platform/x86: x86-android-tablets: Add missing __init to get_i2c_adap_by_*()
      commit: 981fd70a5ac4347368fa8a3329b7d67f1c567ee7
[2/8] platform/x86: x86-android-tablets: Make variables only used locally static
      commit: f6728073baa172be6223512fffd72796de891536
[3/8] platform/x86: serdev_helpers: Check for serial_ctrl_uid == NULL
      commit: 478b00a623d6c8ae23a1be7bcc96cb5497045cef
[4/8] platform/x86: serdev_helpers: Add get_serdev_controller_from_parent() helper
      commit: a6593c5c50455852cd3b2b51e09bdec90b99738f
[5/8] platform/x86: x86-android-tablets: Change x86_instantiate_serdev() prototype
      commit: c1007dd139b6f8b2b00ba7bdce32a94c3da34dbe
[6/8] platform/x86: x86-android-tablets: Store serdev-controller ACPI HID + UID in a union
      commit: dd6db239cb30ef1ccc0084a530839c9897009a6f
[7/8] platform/x86: x86-android-tablets: Add support for getting serdev-controller by PCI parent
      commit: 7d28fb4d16fb8ad2309616ee3bdcdbf161c13dc5
[8/8] platform/x86: x86-android-tablets: Add Bluetooth support for Vexia EDU ATLA 10
      commit: c0f1bfc141ea52ea039bd17537b46b705ff8a93d

--
 i.

