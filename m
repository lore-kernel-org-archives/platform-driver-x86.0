Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C21447884D;
	Mon, 11 May 2026 17:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778522013; cv=none; b=KSdprcwRcs/OUahyK9X9gALYzCcSgLpCzlNhnNwwzMEUzH+gDNEXm9i7eiivJFZROA+m4wd+ew/zmEqocGPUUBlpobu+BfJt1DjEkwVUUg+kIQusmJ7clCtiGRtEteMTKFfpA4r31wUie9w/uEXDcZFzfrbmSSf2suAg7fFSyzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778522013; c=relaxed/simple;
	bh=Kf1yltgq7pjtvqEJ7kXKk4an/9jSH8eQpPADBXhg6Hc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ntKu7c3+tZNv0liegz7Ikmuyq24K0T0IJuMu2FNiUgIKck9E7MknFOL2UDs5dKKJ+VHVLVLjBsNC8nZa1j9rR9/mur87u1UnxaUmHoXvGkhEq9Atwu6rw22SvAkUVgxX/Uk8aTsdDYGEHJ32zn02cxauSqD9KxuoxvZjXIJEFhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YktJosFA; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YktJosFA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778522010; x=1810058010;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=Kf1yltgq7pjtvqEJ7kXKk4an/9jSH8eQpPADBXhg6Hc=;
  b=YktJosFAE9pNrpi3PgLhl4IP6noSjKAQ82Saa5v8++olLEV8gTjecAAp
   2IHJiL7LeJmEJTQpaqByo9io4Sf+kTQOb1k0AeoqiRhuYslPFDT8t+yKz
   bedy6fTk4UYYhZdNjEyhPTno9Rm011SxHmMzIlRqaCoLXRtEl/v+sdmv7
   lF/7ZlYWzZK5QPVYi0Xcy68sUSAaYzTWtqiBK1S6pV62Kv4t/YMYVQkfI
   UzKI4z1DS2KclQ7LFUOCqECnoXGwJcjAvPhhUaonanXYU3kX4OS2CSndb
   Nl+8P74glpjpxANcxCTWfSayUzPkz+7qU9otcDNJrRgF7NEBydYFx1isL
   A==;
X-CSE-ConnectionGUID: 0t9zGj5UTi+z/te1TLDfAA==
X-CSE-MsgGUID: bVdC5GbcRCymp97Z+HLF8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="83033398"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="83033398"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 10:53:29 -0700
X-CSE-ConnectionGUID: gXu+odB4QRKUCKibJlUUhg==
X-CSE-MsgGUID: bBR2TK3wTTCNQscRXEHVQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="234857731"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.28])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 10:53:26 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: hansg@kernel.org, platform-driver-x86@vger.kernel.org, 
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
In-Reply-To: <20260429015210.1863316-1-mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca>
 <20260429015210.1863316-1-mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH v2] platform/x86: thinkpad_acpi: Add debugfs entry to
 display HWDD raw
Message-Id: <177852200183.27853.3134965400121530608.b4-ty@linux.intel.com>
Date: Mon, 11 May 2026 20:53:21 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 28 Apr 2026 21:51:59 -0400, Mark Pearson wrote:

> The Lenovo diagnostics and support team have requested a mechanism
> to get the raw data from the HWDD commands to support customer debug
> situations.
> 
> Add a debugfs entry to display the HWDD raw data.
> 
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: thinkpad_acpi: Add debugfs entry to display HWDD raw
      commit: 165e81354eefd5551358112773f24027aac59d5a

--
 i.

