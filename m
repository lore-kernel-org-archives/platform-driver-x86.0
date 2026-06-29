Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE98636403C;
	Mon, 29 Jun 2026 11:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782731100; cv=none; b=cPD8ebZcQhbbBgAFriBULU8DW7R7svo+yw7/vnRX1ioCfjVL6I+BuFWaZbz1Z+nlnrx2o+l819uYj75DauBjq7umzqyNkSEPpFC5hQlcMK1sfDyS/wBbXp4SyfjXAcTqWHohK3JVf0NnGv1VSTmDj2lNdKHz7vI5Az+WFoI0YW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782731100; c=relaxed/simple;
	bh=RWXWr4LIp47XCMMHyg6f6PzsPck80QUsckD0Zbfk0+s=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=j8Etu0XoXfj1X5Nbr/B2bGcY7NonQTShbXwjATpFYyXJEQ0EKjDkleCkJjBc6CcshJSf/ElN3duqInVOKsxE11etz1+oWU5XEUqaZ7fYeUkSEJRLnT1/lgRUVHkB7v1LPPlmDYFrScOJOGyKOhIO+BhT72bWHm+6rdxiR2RykIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WE4YJxCS; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WE4YJxCS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782731098; x=1814267098;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=RWXWr4LIp47XCMMHyg6f6PzsPck80QUsckD0Zbfk0+s=;
  b=WE4YJxCSjAmPk1K+ztH8Cijs1H/l3zL61IqMejVl9fPEOvvWlzsr7uXa
   8tjkp60VPqt5B36jGYNwjpx9evfqf0WOVUuRvmxaHP8ePZMxIp3jDxI3o
   35vRKUbEj8F3hwK/0dK3re1U8nw5Fn2Z5Ryo8r7qmkWbQDjCILlkA/bIh
   0Z0qPUER0d/7D8QY/XCdx8Whtiqcl//6/5vnPQov2NlnPm0oR4LjMprt1
   qMoXU9DI58IDx3aApUVt6DmBvVLOgN0+qmQGmvx5ELIRQwgrE/VvJkw5S
   u5RfSKgicUkEXwQp9HJGYH+kj3Dbj7SV7Imc9CjxTFgX9h0mqP7VK2yfe
   A==;
X-CSE-ConnectionGUID: yGjBKbqOQBStfAmJ+xwRjw==
X-CSE-MsgGUID: miUss+PUTcGpXHgS3ykyRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="108954921"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="108954921"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 04:04:57 -0700
X-CSE-ConnectionGUID: B9uOBLGgQ0qHZPzO4N1H9g==
X-CSE-MsgGUID: M9NVojWKRkyfGVM9Ox3JWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="251536888"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.42])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 04:04:55 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 29 Jun 2026 14:04:51 +0300 (EEST)
To: Marco Scardovi <scardracs@disroot.org>
cc: corentin.chary@gmail.com, denis.benato@linux.dev, 
    Hans de Goede <hansg@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
    luke@ljones.dev, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: asus-armoury: add support for G614PR
In-Reply-To: <BGkkBwKuSFuGPnRJO3Lg1g@disroot.org>
Message-ID: <e7d71740-8e69-0433-aa49-d5023bd59a98@linux.intel.com>
References: <BGkkBwKuSFuGPnRJO3Lg1g@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 27 Jun 2026, Marco Scardovi wrote:

> you around? I'd need this to be fixed to set the correct values.

I'm not sure what the context here is, whether you're just asking for the 
patch to be applied (which is entirely unnecessary, as long as the patch 
appears in the patchwork's queue, I've not lost it), or if you're saying 
there's a problem in v2 patch?

Usually, the merge window is quiet time anyway when it comes to applying 
patches so don't expect much to happen for them until clearly after rc1 
(= not right after rc1 has been published, because the piled up patch 
queue will take some time to drain and there are other things to do around 
that timeframe as well).

-- 
 i.

