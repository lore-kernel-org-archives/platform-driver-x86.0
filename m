Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064C43803F3;
	Thu,  9 Apr 2026 13:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775742108; cv=none; b=imGDwlek6G2Ld5nZxZEKqjyySmi6+F6khnvX82JcNEtJex/w2k3f3F+6mxy0zfxgnEkwdFJmJVkypfjr13U3SqSynv27f9dCiUUXEfuRMX0ZlI0K2VUkcvj3Bb+Sbn8GR6BFWV4TeI7yBldGccNh+W+Zes4xuL6Cwx1jSS5UTt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775742108; c=relaxed/simple;
	bh=P/9EhUqnRFT+/dq2wHpS5xKXiVdJPi2GNfsiihnNh00=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=No+OhA0Ni09E2qnE/fQXH0aDFt9Pxm1m4Ur5ReO2r0YUDiqLxAh7T+0njtN/iBhrEsy1fI/23s5QNq7F/FE3SYlh6bfv4uTgrYkih/z7apr1NP8M3Q/y1ipahWGOZDIz5fSTm76V7Dxwk/WIny/n6WaXOdnFazE19CgFMQ2KYxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W05RkMcO; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W05RkMcO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775742107; x=1807278107;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=P/9EhUqnRFT+/dq2wHpS5xKXiVdJPi2GNfsiihnNh00=;
  b=W05RkMcOwm9PQrzgA7RiFWIFbmPc1OuFPpaZKslxKSNe6GXU3JGdov8z
   cK5EXK20UGvEOOgj/Gz5ojDL7LQd6cV1Wulrmzx3tO1Wwxw/utQknY0ab
   4jsXDTIwl/1S2oc1K/jgFS5L23rX92mB+7LlSboowEzGYlLdO3Zt7Fz/K
   R/mm4LHuNpkWHsOFjaw3c/khe0bVnzxjUIqHUyzcvXhaBcSR7fN+2kGjf
   jUVM4lNpsxk1+iK4tCxhuHHJvDaOc+2x6M6ogDt8T6wj0v+WquLH9Fci3
   Tbd7RKKFZ4oNLIJNhgQqdWKWHDW1OO3GNR/2Ziv4vOx3ypNJ1Hh+G5+NR
   Q==;
X-CSE-ConnectionGUID: QuYwSsLEQwSkxBh+tskvqw==
X-CSE-MsgGUID: 2EcAObT2RLiDRAe9Ypzv6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76865632"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="76865632"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 06:41:46 -0700
X-CSE-ConnectionGUID: 0EyqH0ZAQRu0dFlNnnWN8A==
X-CSE-MsgGUID: k4lIHrpGSJi/7ERgU7h3Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="228705981"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.197])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 06:41:43 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 Hans de Goede <hansg@kernel.org>, Daniil Bulgar <bulgardaniil18@gmail.com>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 "Derek J . Clark" <derekjohn.clark@gmail.com>, 
 ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260407190546.109900-1-bulgardaniil18@gmail.com>
References: <e4723a5a-0bdd-4062-af38-ca5f4a4f6d1d@app.fastmail.com>
 <20260407190546.109900-1-bulgardaniil18@gmail.com>
Subject: Re: [PATCH v2] platform/x86: thinkpad_acpi: remove obsolete TODO
 comment
Message-Id: <177574209815.8529.13587003512311476776.b4-ty@linux.intel.com>
Date: Thu, 09 Apr 2026 16:41:38 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 07 Apr 2026 21:05:46 +0200, Daniil Bulgar wrote:

> This patch removes the obsolete TODO comment regarding fan speed
> presets in fan_write_cmd_speed. After discussion with the
> maintainers, it was decided that fixed presets (low/medium/high)
> are not suitable due to platform-specific variations.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: thinkpad_acpi: remove obsolete TODO comment
      commit: a29b5cd42f5bc6ba1be6422f61f3f05bab707ce8

--
 i.

