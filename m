Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854232E8DEA;
	Mon, 22 Dec 2025 14:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766414596; cv=none; b=oHc/lGz2qWxze4MxsQSmCT1dFox0SbZpU0+aorhbMcWwiFQ37DDNXvhCQOW7mHjLSKAhtKsX6agBgHq0RHXnL+92Oyz51uvJTjCt2VikwFmoutrwH2jU0r0cukxowJhUMbbrMQYE+7ZnkbMfh+4tQCitndz08bTOrJseWxD7dls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766414596; c=relaxed/simple;
	bh=FttNrptDdFdTR9ddpKtaTeR6FdhFZUKVYD3Asg/sKhs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sg/OttLR6JKYRbCaeyX9W4/AOtYPKiQhDhq+6GJMM+VttLhu+DIB9AbnoMxAJlIGgjMmDm0qDqZoOiRIZ9KlGm7nJJdpecyQSFuRhCzCl6SWbPa3DHerexX0ePWnvQq0XdDMFWl2Kk4UqjM4nKC/+QKQgX7yfuNZZypfHSxmgPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ar8gSXkK; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ar8gSXkK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766414595; x=1797950595;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=FttNrptDdFdTR9ddpKtaTeR6FdhFZUKVYD3Asg/sKhs=;
  b=ar8gSXkKgu1iOA9bpSrSYJcdVCSWxq9El20LnCXqHF3ctGllrKsAbEit
   PXEfsDXIkDJ/26UZjIo0hnspMUo4kd8jeayGOTMRv+XTW4eSngFc7jQyN
   YHQUiExm4tsA0FqvigjA7eFGmAfT+HrMIfn2VtnEiRKXLmpS17cj7Zlum
   HX3g8s6q0KpArbU4wVhZnzYCL92voYJI+JJSZ9jWHVnUl+iQc7NPvgNRW
   NA6wXt6mgpVqIA3Of0STy2zya5fBqTYdCBVlvHr/uupxsmTzoqUhjq650
   SVDEVcUxTOYYgncCQS3CBnOulYL4+H2dQ85R49lZsDU6qomjWk6ecSEQk
   g==;
X-CSE-ConnectionGUID: QNti3ypBSea1rThOOTKrZQ==
X-CSE-MsgGUID: MoyDFNN9TNO+k6xtuIVQCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68206151"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68206151"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 06:43:14 -0800
X-CSE-ConnectionGUID: 15IQfqwiRL2r8pVroSiyGw==
X-CSE-MsgGUID: /pqaisR6S7ahp6T1zqF5Lg==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 06:43:11 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: "Lee, Chun-Yi" <jlee@suse.com>, Hans de Goede <hansg@kernel.org>, 
 Maxim Mikityanskiy <maxtram95@gmail.com>, 
 Matthew Garrett <matthew.garrett@nebula.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251217103617.27668-2-fourier.thomas@gmail.com>
References: <20251217103617.27668-2-fourier.thomas@gmail.com>
Subject: Re: [PATCH] platform/x86: msi-laptop: add missing
 sysfs_remove_group()
Message-Id: <176641458414.16407.5262493932992224552.b4-ty@linux.intel.com>
Date: Mon, 22 Dec 2025 16:43:04 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 17 Dec 2025 11:36:13 +0100, Thomas Fourier wrote:

> A sysfs group is created in msi_init() when old_ec_model is enabled, but
> never removed. Remove the msipf_old_attribute_group in that case.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: msi-laptop: add missing sysfs_remove_group()
      commit: 1461209cf813b6ee6d40f29b96b544587df6d2b1

--
 i.

