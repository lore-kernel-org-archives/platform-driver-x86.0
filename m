Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5D52765D7;
	Tue,  7 Apr 2026 14:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775572771; cv=none; b=IA/qUdHf/fphJV0qcjuXMjEclfoeMrLEeY2u0eq8L1KuBqlWgnfujeJ3Ybv2AKkgRasYss9rn7xT//1uqb2Kwq1sDRsOd45x/kd3542eOOcy38lonLRhERatdsVFTFWfopj4iwOH611wdrCL+N+gFB/d3PwqdZV3Bx6+v2E1PdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775572771; c=relaxed/simple;
	bh=5ENHtbK36Sajv9vKqZKB6yzYsvfvBXiS7VCV6u+0dLY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XKppdQJY/bgyOK9viJmwscUeBHeOdK2dKBc6gexz+ndOQ5SaNSTiSf19OmXSbtZj95lRdyCRjshFhRAACVEP1wQbwRhNVe5LgzAj93AARZnsqYx6mD0YfzC11Y0dQJy/TQfNGIHD1oJpgzCleDP3lCxGpBETF2BebX226lUcbEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oalqv1B4; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oalqv1B4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775572771; x=1807108771;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=5ENHtbK36Sajv9vKqZKB6yzYsvfvBXiS7VCV6u+0dLY=;
  b=Oalqv1B4DEHFFCzHWi5uYhSwFZBCMTHCLbCAMxxycly5fOGfMp5x3U5o
   r8nNqJTq3m3JD+lOwMs1iAxLeFm3jpYNIBdEHj5ivohZrSi4u9ccNra69
   JxT82KticmWuQPyl43eqOlOz/nS7Ae8oeIUzY5cURhx8CzbVsrmMmF92M
   KMpsR7rN0JINPSkL0bBG4jwpmnR1kC5wrRQbdZ73ad+OtH1hX55VYtX5i
   ZViFjEVGY66SnZP3AuVAFLd5zdbCIDYxBTJu+ZqYUC7APf1BGLDBWNa67
   /5+uc20Ma4iV7i9be3EQQrIYwtIH6JTAsoOzNT9jROCka6i5SCifThcWo
   A==;
X-CSE-ConnectionGUID: 5VW2GA+AQV2G3CMUeyVk5g==
X-CSE-MsgGUID: cziBxXxFT1O2gH5bL9J4BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="86828975"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="86828975"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 07:39:19 -0700
X-CSE-ConnectionGUID: X7Jd+fxdSeWASPUYqX3deg==
X-CSE-MsgGUID: CrhwBkNCTdWApq9RsCrlwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="251478305"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.110])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 07:39:16 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Prasanth Ksr <prasanth.ksr@dell.com>, Hans de Goede <hansg@kernel.org>, 
 Thorsten Blum <thorsten.blum@linux.dev>
Cc: Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260331160310.608857-3-thorsten.blum@linux.dev>
References: <20260331160310.608857-3-thorsten.blum@linux.dev>
Subject: Re: [PATCH v2] platform/x86: dell-wmi-sysman: Clean up security
 buffer helpers
Message-Id: <177557275163.18830.16301776719529026928.b4-ty@linux.intel.com>
Date: Tue, 07 Apr 2026 17:39:11 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 31 Mar 2026 18:03:11 +0200, Thorsten Blum wrote:

> In calculate_security_buffer(), call strlen() once and use ALIGN() to
> round up to an even size.
> 
> In populate_security_buffer(), also avoid recomputing strlen(), rename
> the u32 pointer from 'seclen' to 'seclenp' to avoid confusion with the
> new length variable, and drop the memcpy() guard since calling it with
> size 0 is a no-op and therefore safe.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: dell-wmi-sysman: Clean up security buffer helpers
      commit: 2d5821579d39621fcce1b3d19ea25a2a9cf59cd9

--
 i.

