Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74D79454;
	Mon, 21 Oct 2024 07:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729494051; cv=none; b=VWi+Sd3EaD5I8sx6Au0T6NEQwO+SD74Srb/jx/M3tp6vy96eneX4NWdtX/On6nPSL93cv3HH8tgo3Mllxf2YZCpQkbEhTVfBhB+8HViImsNvTegGvKMCnmhezI8liPvkdMuvL6G3yqNXztjSfbpJmi2HkS8deuS/WF+tDgPB0rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729494051; c=relaxed/simple;
	bh=MlELaK8WcZVLOcmW5R45RLH+7kzKB04vhG0TSFXxhY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uVK9KyQz2k2kAHrFu7u/jtX/4Tbsbm1Ttc+qeGkNyKd0ARz84AZVEfXYcL6Ar0xqHV0B+LhkrT78Kfxo/XU8iKodViftbBJjextzCq6zOFUwSGZx8MkWhLIU39k0GyFxi9ypZMB6tUR5cmYIsa7GULOlMWVep5wLjFPoIjkJ1FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nAsw5tiX; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nAsw5tiX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729494050; x=1761030050;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MlELaK8WcZVLOcmW5R45RLH+7kzKB04vhG0TSFXxhY8=;
  b=nAsw5tiXAKvB+3+yiUF2+ea5vQ+6tmf4/O6uEgEVBeBy6/7kmHbXSjSr
   MSTwv9MzfHZnA6XW8pExFgsAdL/aMkIgj/m+PEz9FJXCjb2NJdUegt5KK
   FbjB4+bxhE3G0bledWaFoFZPeuYU5PImva4RpfoKmNCxogkvhp+v5FDoB
   Su9z2Uxw3zJBLTT1thzqf9YMgPxAfadTZrE8VROEMR68htfO4ocjl6xyR
   nYfAIgT5IeTAaWDGqV9HS2MPLHno+n2Qsxm6JHIS4WUjfI41T2OOlwDoT
   ppqqkg8/FPT9hIih9/wk6VVf6JfXeBUrII0tjcO3RDJ05j6lAe0ZgOpAy
   Q==;
X-CSE-ConnectionGUID: lUFVDAjBQ2m3UJr1eokWkA==
X-CSE-MsgGUID: 6Qi8DKn9TEm+Am4stSG1Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="28840710"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="28840710"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 00:00:49 -0700
X-CSE-ConnectionGUID: rv2QVlBySG+cgOxEabNUPQ==
X-CSE-MsgGUID: g4a8SoJaSfmcQn6L0dqVFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="79443740"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 21 Oct 2024 00:00:47 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id A261B12B; Mon, 21 Oct 2024 10:00:46 +0300 (EEST)
Date: Mon, 21 Oct 2024 10:00:46 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Ferry Toth <fntoth@gmail.com>
Subject: Re: [PATCH v1 3/3] platform/x86: intel_scu_ipc: Save a copy of the
 entire struct intel_scu_ipc_data
Message-ID: <20241021070046.GX275077@black.fi.intel.com>
References: <20241016115033.858574-1-andriy.shevchenko@linux.intel.com>
 <20241016115033.858574-4-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241016115033.858574-4-andriy.shevchenko@linux.intel.com>

On Wed, Oct 16, 2024 at 02:48:26PM +0300, Andy Shevchenko wrote:
> Save a copy of the entire struct intel_scu_ipc_data for easier
> maintenance in case of expanding (adding new members become simpler).
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
