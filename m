Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DB3111A8
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2024 13:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731505976; cv=none; b=BL+ZFLeJhFMVocm9ls50IKKdDG/Z3UccpXX17peW8I60fKcsF6mLYGf0Cdb6SNCyrmFDACxwoTnmMCPST1khAD+pUloC4Y5YdHwiXlNu2YCoR164aAy/1tfjfFbz8tVI7S1PwtNNFyCnw7EOCdw+GUiWNcCBn3LWUbcKVgDb5Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731505976; c=relaxed/simple;
	bh=fDcOyK+3aefhJQrbz3AVfybZ0a5wynhg4eL0BAJPHs4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Matjat/3Q5sXckpsaZc/Rz5jZ7ODbwqWRbETiYvorOfdM/pXgevuh5mobsWISGPFGroldKDG7qkWl0dSaY6QHL0XhUgZIterSOL3p2EwmDzCOQMhYXgQqCv6Xufktu0cetIcsbscO86u4WKz+Jcok4gOEEXbUQfrpowpXyZ9VwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hFinEYW3; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hFinEYW3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731505975; x=1763041975;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=fDcOyK+3aefhJQrbz3AVfybZ0a5wynhg4eL0BAJPHs4=;
  b=hFinEYW3NAHn7zSr273acer523LTuzWqMLZztKxB/gw6T6oRZi0e9KrD
   l73lL9WaD8Y5+t7YFcv3XJdt9/5XaSnkATXUhBDujq0pcjTIx5d1W0/Xn
   8bo+dpUKMK0tY5FlmH0jfiVko4Up5gsZZTjEyjXMomJyNbIAEWHyRc/Ui
   rFMLe2lySlKEfJWLqaFq3nXvGZw/pUmN5Zfcd+t5+adh9+GXtI5ApOVjY
   Hm/oqzeDOQKqQ0+s8aR1QdGHgCQPZhY2maz1RWiGRCMw3N10IQkl0h7AS
   J393k9GUnTH/RBx4vkpZQZyaSr4U0EUf5ccWLd7a62OqACGqSD26Wd1KQ
   g==;
X-CSE-ConnectionGUID: /zAg9ZpBS9OrYp1Jyf3g9Q==
X-CSE-MsgGUID: PH3I0T6mQ/CAdYtDqRvS0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="35107479"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="35107479"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 05:52:55 -0800
X-CSE-ConnectionGUID: BCVHisWSQrKMe6MV89Uq/g==
X-CSE-MsgGUID: mBhyZYEaTLyL44FmHfF8tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; 
   d="scan'208";a="92957439"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.181])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 05:52:42 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hdegoede@redhat.com, platform-driver-x86@vger.kernel.org, 
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: perry.yuan@amd.com, mario.limonciello@amd.com, Shyam-sundar.S-k@amd.com, 
 W_Armin@gmx.de
In-Reply-To: <20241112170307.3745777-1-Basavaraj.Natikar@amd.com>
References: <20241112170307.3745777-1-Basavaraj.Natikar@amd.com>
Subject: Re: [PATCH v6 0/2] Add support of AMD 3D V-Cache optimizer driver
Message-Id: <173150595442.1884.9291069778902598738.b4-ty@linux.intel.com>
Date: Wed, 13 Nov 2024 15:52:34 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Tue, 12 Nov 2024 22:33:05 +0530, Basavaraj Natikar wrote:

> AMD 3D V-Cache Technology significantly enhances per-core performance by
> increasing the amount of L3 cache available—up to three times compared
> to traditional architectures. This large cache allows for quicker access
> to frequently used data, minimizing latency and boosting overall
> efficiency in tasks that depend heavily on rapid data retrieval.
> 
> To fully leverage this technology, the AMD 3D V-Cache Optimizer has been
> developed. This patch series introduces two distinct modes: Frequency
> mode and Cache mode.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo branch. Note it will show up in the public
platform-drivers-x86/review-ilpo branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] platform/x86/amd: amd_3d_vcache: Add AMD 3D V-Cache optimizer driver
      commit: 5a67c0d1c8bdcdba5dff49cfbf0d4c453b827a9d
[2/2] platform/x86/amd: amd_3d_vcache: Add sysfs ABI documentation
      commit: bd17863a708692bbd7a265212daf8a3aa4a3d0b7

--
 i.

