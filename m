Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2781E520A;
	Fri, 10 Jul 2026 17:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783703451; cv=none; b=pdvumceWnctXcCLni0/wmiYdfoDDuks9JYfxOgV8mSGT2XHn/bUpNyvtq4I0JLh7qLhqFwO8M89Zy+iqULDiMIeMsNY2Mxb/yBdCEsFV1B2xXoFxtQasNmd+Lfya+ffUDF2+RfARRocy5iZKkLPxm7b8l9Oh7FbFpkjw9rJT6/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783703451; c=relaxed/simple;
	bh=PIWhSb+GrWn3z4VQRu3GD8LD+33RmkIdltAdGHRClFA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PTMWmcMgoO3v4ej9KRvjnlZ934/0zYWiE62V2uBIYoWkJpWcxWizNWp2EgV/v3w8e88caazQMtEX/GBDz9A00o3vw8eMxnxfac7gV3bNJDksM8uicmhPCKbUQ7Ru5PA3FYaVEFhrUBNCW/9Oi6/u1qJhjryp27l/P98CAo0YMzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HhZmtpaE; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HhZmtpaE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783703450; x=1815239450;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=PIWhSb+GrWn3z4VQRu3GD8LD+33RmkIdltAdGHRClFA=;
  b=HhZmtpaEObpwB4caMJf4+NyoNX4xCVK5vjVoE26oeNYkX3M8sX++iMPH
   7/b3Q+EnlJezuygDLcWOQMwYnozXDDFLxJqz0GTQJyNYk0gh0TjAk/S4B
   pM8et5qio0ZzUflimj/ZoeIqaKaTUNu9pk0t3pH8cdRIJk2nPmYR0uIyd
   A9b2vMhs4uWG0kxb3KwrE1GgoowATMnmzcDuJa/iELkAp2V6E1rprYqPU
   VCuDDUhSqrWiHteB1dIEauuurjaRsIUOqZI8Pwod6whPOj0kzFCW5XK+4
   Kx7ojPaENsO4fukrRCHcopckVUITnOLJEx+kpc1k/0D/an4ubho8adAT/
   w==;
X-CSE-ConnectionGUID: B9FaPAtySjGiWRYZSHh7CQ==
X-CSE-MsgGUID: xf/5MsjVRieRa7wAbf6B4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="109953310"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="109953310"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 10:10:50 -0700
X-CSE-ConnectionGUID: cuW8rokXTWSOrjS91q5BQA==
X-CSE-MsgGUID: OUCkvoydQxCpffzy3Z84hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250951489"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.169])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 10:10:48 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, Vadim Pasternak <vadimp@nvidia.com>, 
 Linmao Li <lilinmao@kylinos.cn>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260706012056.524096-1-lilinmao@kylinos.cn>
References: <20260706012056.524096-1-lilinmao@kylinos.cn>
Subject: Re: [PATCH] platform/mellanox: mlxbf-pmc: Check ACPI_COMPANION()
 against NULL
Message-Id: <178370344300.25696.17449610327512423041.b4-ty@b4>
Date: Fri, 10 Jul 2026 20:10:43 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Mon, 06 Jul 2026 09:20:56 +0800, Linmao Li wrote:

> Every platform driver can be forced to match a device that doesn't match
> its list of device IDs because of device_match_driver_override(), so
> platform drivers that rely on the existence of a device's ACPI companion
> object need to verify its presence.
> 
> mlxbf_pmc_probe() passes the result of ACPI_COMPANION() to
> acpi_device_hid(), which dereferences it, so force-binding the driver to
> a device without an ACPI companion leads to a NULL pointer dereference.
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
[1/1] platform/mellanox: mlxbf-pmc: Check ACPI_COMPANION() against NULL
      commit: c38cce70adef874c2a7b5132c14d6c221401deff

--
 i.

