Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515592F1FC4
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Dec 2025 14:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766414580; cv=none; b=gvJjZIMZEimnwrqrN4NTsT5VtMTAIciHiYnda95t3YC8JENxuNRMZkLah/M2ptZjjdDDmUGZdReNOlYAauaWNYBTOGEaoIGtVmMZsXEsC9QBOb2UkuPI71UxzeLjZCgfdBhd/PeAwwfle27UpskRf+MoInSohoWiEKHfX9jm4SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766414580; c=relaxed/simple;
	bh=mAEM3Q3n1/srSOIK5oMQjy7hjDEphlonumoF6AoBcz0=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XP/PMn/Dybax8LIb9+Nkt3FMkm7ioUDLTZd4FzBHcRAwk8j4XReYNFpNyUb4gNMxNlXV9hGZuzZLprFVwvEluWjwChXU+5mHCLwvuEKkxxOmDiayzJ2/lZOJJyu/F6hK51ToL4G+pEXG9JJUT+9ke3bXu1pbZ742/PAAYLOfJ8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=URZTw0Op; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="URZTw0Op"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766414579; x=1797950579;
  h=from:to:in-reply-to:references:subject:message-id:date:
   mime-version:content-transfer-encoding;
  bh=mAEM3Q3n1/srSOIK5oMQjy7hjDEphlonumoF6AoBcz0=;
  b=URZTw0OptS6+w3JRRk7O3kp7YJNjpxbfESekpB9B23U6OMsqVVxjkD0+
   jpD48jobNCnPo1IDLo/KisALN+3uMHnZoA69hwlgsLheij8kv/iDSEQ+j
   dyu49A4rsMv+bkTzkgsWkzQEP+sJ1Nr93NHD9ncBaq7Y4SZm3fvXYsfTm
   UKFqRl9nEBQvWhuGdCnJ88LC+0GbBaUkggN0AlnOrZIXrmMandCXAclLY
   n6uQDfLbi/7aS51CePMRob0TQCLrSNAK/Y4hhvTRUCrIsQ4Bm/aTeXyia
   KHiJxyotJocomoauRTkOwrjKb8VH41Er8cbQTGRrg1DmGerGUrNtd5aDV
   Q==;
X-CSE-ConnectionGUID: 3tRBmY23RkOugVqNsjyCMg==
X-CSE-MsgGUID: XFXyZHKPQVO9eGc7sfHdpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68206131"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68206131"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 06:42:58 -0800
X-CSE-ConnectionGUID: XnH8fzQJQZ6ex9dBCd8etg==
X-CSE-MsgGUID: umvvFZhNTIGnLXQhdBTHTw==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 06:42:56 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, 
 Dmytro Bagrii <dimich.dmb@gmail.com>
In-Reply-To: <20251128161523.6224-1-dimich.dmb@gmail.com>
References: <20251128161523.6224-1-dimich.dmb@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-lis3lv02d: Add Latitude 5400
Message-Id: <176641457051.16407.12354871668227696144.b4-ty@linux.intel.com>
Date: Mon, 22 Dec 2025 16:42:50 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 28 Nov 2025 18:15:23 +0200, Dmytro Bagrii wrote:

> Add accelerometer address 0x29 for Dell Latitude 5400.
> 
> The address is verified as below:
> 
>     $ cat /sys/class/dmi/id/product_name
>     Latitude 5400
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: dell-lis3lv02d: Add Latitude 5400
      commit: a5b9fdd33c59a964a26d12c39b636ef85a25b074

--
 i.

