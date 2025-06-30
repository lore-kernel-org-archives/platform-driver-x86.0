Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E35184A2B
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jun 2025 10:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751280665; cv=none; b=NDSylnHRI6Nzm/2H1CkGluu45IajhRJQdQfmNAeS0uEaZAOevskb53rESx0vqR/Jg/xOFR6Ydkk7i6hwqkUMNy6BxxZQU+kr+PuOt1G8IT2S7bp41bgVoKNUxkmkvrmjWvyq2S/WMRVKstPy9ja9OhO97J7BawsTq3BjeMdPDLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751280665; c=relaxed/simple;
	bh=Co89zZttVNtIlxqu980VzFpBHa5rGu91LRK3eN5cJPs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PkdqpM22JbMUz8rmPo/Y0B4R/mLtHb0Cg+r6lSoYpvmXenrGqdQy5Nd3AdHn+5i1wQYZvIcUDO3vYiUFW+TTgqnOk7V4y9bM+2tUNHa4ZHPkcCCoGbBCI7lnvidToQE5Eu1ZbtAltKX2tzcBD5oLaut4SVv/dCoPj9XUNbt9p28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O4fGJsxu; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O4fGJsxu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751280665; x=1782816665;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=Co89zZttVNtIlxqu980VzFpBHa5rGu91LRK3eN5cJPs=;
  b=O4fGJsxuNdqGsEP6z82ncgzgAgj5Rv05G2L/P+7xRoIK0pIzn7GvY8C8
   y1h0Mz8bxCbch7xAkOiCV//etvRS1TzONEN3WhonU6LO2YlgF+yEyfTl5
   aZWCm/qaShwdRcLgUSNlcZMtPxD6nwAN+wVyE0Td9mxtZKJy6he5fikWM
   r7uEh2idOYHO8KgIuzyaeXbcTs5jfQXXLEIz5s5h9g7JZkRri3kc2AQE9
   mRloeLJRWM9v00sWEeJynb47GNmIrt52mTVJULnCFz9WKhU3+BCkKtJ4x
   MvNTuWlCHnignLNzK72Eq0PP+YYj0pQgMZjXQtierEkGjI7fxrGLoyxIm
   w==;
X-CSE-ConnectionGUID: A1himlLERhSgnp1OL28U0Q==
X-CSE-MsgGUID: USM8q5IsQimAcl0DDzVLcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53363773"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="53363773"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 03:51:05 -0700
X-CSE-ConnectionGUID: 6WrlGGTNSWObeX9xPvHbiQ==
X-CSE-MsgGUID: h40pjbZPSz+YbYOUWuzzTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="153730718"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.65])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 03:51:02 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>
Cc: platform-driver-x86@vger.kernel.org
In-Reply-To: <20250609104620.25896-1-hansg@kernel.org>
References: <20250609104620.25896-1-hansg@kernel.org>
Subject: Re: [PATCH v2 1/2] platform/x86: x86-android-tablets: Add
 generic_lipo_4v2_battery info
Message-Id: <175128065653.8269.3372149116791542277.b4-ty@linux.intel.com>
Date: Mon, 30 Jun 2025 13:50:56 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 09 Jun 2025 12:46:19 +0200, Hans de Goede wrote:

> Move the asus_tf103c_battery_node to shared-psy-info.c and rename it to
> generic_lipo_4v2_battery_node.
> 
> This is a preparation patch for adding ovc-capacity-table info to
> the battery nodes.
> 
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] platform/x86: x86-android-tablets: Add generic_lipo_4v2_battery info
      commit: a8fc1224f2318d3e5948671d1cad458e6372d921
[2/2] platform/x86: x86-android-tablets: Add ovc-capacity-table info
      commit: be91bf40a96d567973d5c5e870d1464eb51b6c42

--
 i.

