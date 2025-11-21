Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECA32F25E1;
	Fri, 21 Nov 2025 17:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763744452; cv=none; b=oiYmssIBeBFcRBCWn6rw5aXUPKqCz1+M+7uLnZJqUcQZpruuxFuOoxCvPmdbgFA3fRxBawNL8UtmiMD6c9K7kF3/mUbWMTW8T+A5F3GCmgboc1cjLDJ2etZSg7VbK02q6eTs2hxgUjs5KNHgMo+wOFJcKOyCXM//zPaV5WFy3FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763744452; c=relaxed/simple;
	bh=BTdE8axIu73L0dkxd+IWvfO7b8Nnt9UEJ2Mj5bcFQdI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lVq4Z5tK3RIepknYk1ksZduLx/iLODvNJ8S4NmyMTTILR9vMw9uRM3WgCEHvcQonLvdIvC2i4ut42JU1MqiqIPTpRQAIkZ6uQQmwA/OHbB/6kCf9uc/pWCIfs8KFOFrV6NPzA8inRRLpCW+kAuGkIxkWIuwgOL/YxlPb8UWK07w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JQCDTq9A; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JQCDTq9A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763744450; x=1795280450;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=BTdE8axIu73L0dkxd+IWvfO7b8Nnt9UEJ2Mj5bcFQdI=;
  b=JQCDTq9AdrqV3dPCbj5T0HOGYmSsGXpX/63VMM4abx8YY5vTF3ajrbxT
   03xlEJZMVrCKTACRw1qe6LLqIMnZioipwDtN+Xj49oKWNM/G5r/mTTWJU
   0pI3K5eKIQ7v1OlAM2peD6c77HXdeT1oaLQvccFYtMPkgNdOrG/mZr8EJ
   fDCoiXdC+J2sZjtCJjgxmkz9bze2p+QHPLtO2Azuu4WJVAZVuJIfsjGtb
   r3ghI2CWKS2qQCkW11L0BtfvxoAOAtp6cxM4mAZZ+9NfesZ0+S9+m55VG
   iRO0cHr0c9du7vOGJ/SoyVvdrTRjMlItDn7fWLEia048J5IS5k2Pc1e5w
   Q==;
X-CSE-ConnectionGUID: dAmls2wrQaKcsZRsfJixRw==
X-CSE-MsgGUID: nSA/1ilNRlSBkqD1bXXapQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="69707545"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="69707545"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 09:00:49 -0800
X-CSE-ConnectionGUID: 9Q+spaFDRA+I+iZUFfeVqg==
X-CSE-MsgGUID: zQlDz4MUQHKHHMF8AQn2Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="222692839"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.50])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 09:00:46 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-kernel@vger.kernel.org, Denis Benato <denis.benato@linux.dev>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
 "Luke D . Jones" <luke@ljones.dev>, Mateusz Schyboll <dragonn@op.pl>, 
 Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20251120025413.1686540-1-denis.benato@linux.dev>
References: <20251120025413.1686540-1-denis.benato@linux.dev>
Subject: Re: [PATCH] platform/x86: asus-armoury: add support for FA507UV
Message-Id: <176374444205.14895.6015376555883517447.b4-ty@linux.intel.com>
Date: Fri, 21 Nov 2025 19:00:42 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 20 Nov 2025 03:54:13 +0100, Denis Benato wrote:

> Add TDP data for laptop mode FA507UV.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: asus-armoury: add support for FA507UV
      commit: a9b0869720e1734e600563b62cd5e28d11e45622

--
 i.

