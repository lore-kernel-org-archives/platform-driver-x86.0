Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7CD2C21EC
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Feb 2026 08:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771921537; cv=none; b=Y1H520nWtFgXOXmBUpWYbzl1uZ6OtQc1scikwFx5pypbKqArL/WM7BU6y6rB9P3mtP/kkwXMeRD4i5JLGmtS5DJUDK/1GcyLNNmKtuOdZXEwYRXtCrWN4vkzMG4cU/qno7zaDo62tYyyDIOivVA6BL0n8ub61WyXTJ/TPRGiOGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771921537; c=relaxed/simple;
	bh=hbuz87GtgcUdJzsaMWSCs3NnPyvyzpGU2X6nniRdWTo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=no6UEFBuulu+yCGEm3B7mtPecnUlmLhnlLNF502yNnkU6DcSKJDeCjRziGQrUpn2lHuHtTIZP5tZC7VJdtvMKIEtVxUz6nfqn2hM1R+9rS/26JO3tF7dEm8NJAZZOuYMqcGhgSj9JdtQ/Qso4dhnbMpFJlb5pZGOr/aq5duzTI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VD8EXGkB; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VD8EXGkB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771921536; x=1803457536;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=hbuz87GtgcUdJzsaMWSCs3NnPyvyzpGU2X6nniRdWTo=;
  b=VD8EXGkBEkvx2Ky68qScwrxMUFUtoO/r+ylnvDt5NcJ8l0ui5+gzoRkP
   HzLWu9KRJgEobU6uUiW5s6OcNwdj/j0WoRq1KWP3nXnheFmPOStHBgAIv
   3ZQ4PPUWy0sOUUJrYd2cplB4J2CvDB03kBt4DUmDAy41WnM7iUptG2lcW
   rMCilL1dy3y5UEcXu89Qo0u9Zd6vWnwkUhPuE4r+W0TGKDhYvJ0P7Xe6l
   ijz3p0V5AuLnsz8LfkdFXBlnR9pkaV5AHWmwR1XiIW4dMQ3KolC0AVVCe
   WajpdvPuMDkFQXYyPDcWAuWuoFAmnvjnhvZ59ArKK1BDqTS5WsmFSr05m
   g==;
X-CSE-ConnectionGUID: ZvZb52zZQcyuMCJ60OGLlg==
X-CSE-MsgGUID: W982D6I4TFmAFKn4zZLCrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72633781"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="72633781"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 00:25:35 -0800
X-CSE-ConnectionGUID: VPrT5hdHSZGyi2PHDXmx6Q==
X-CSE-MsgGUID: UkD7OdOeSRiIzWqrxMiqxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="220396267"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.133])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 00:25:33 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 24 Feb 2026 10:25:29 +0200 (EET)
To: Daniel Kamil Kozar <dkk089@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, jorge.lopez2@hp.com, 
    mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org
Subject: Re: [hp-bioscfg] warning from kobject on module load, OmniBook 7
 14-fr0220
In-Reply-To: <20260223224947.12052-1-dkk089@gmail.com>
Message-ID: <2534dbeb-857b-75c9-4f72-76de278cb8d5@linux.intel.com>
References: <42962490-6817-d7b2-c6ae-a300676a001a@linux.intel.com> <20260223224947.12052-1-dkk089@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 23 Feb 2026, Daniel Kamil Kozar wrote:

> Hi Ilpo.
> Thanks. I can confirm that these messages are gone when using 6.18.13. Sorry
> about the false alarm.

No problem at all. Thanks for testing!

-- 
 i.

