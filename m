Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F66384CE9;
	Tue,  1 Sep 2026 11:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788261237; cv=none; b=uLGA8H/aMN39jIXhEFqmb9rSPVrPZ7kCkaTg+fkAA6H47PGVXFIdwA5uIgq0lmUC+t4+d7RYbwIWbiLovVpptbU3fTmq5bzjGx3du7hT/2BZOAzFsomD+GCw9wAsE77obOppvDQPEIlP1GLsPjifmk8SK1Do2bZLGurRuxcSy1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788261237; c=relaxed/simple;
	bh=S2nNUquQwB0cPhyvsaXaBqfuZkCaMaMzO3imIERMhi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JexxMK3S4HIQKSIE5MgijIoemuSeb1J3sXdSD+uuSIXHAwIOEFSPUk2CXX23pFDc1y+cZUaQT5jyI+iLgzVSlj/1Bn17wjaE9RLEsDDMh0Om95EN/RbYjYIuNH6oTihj5PZKD/yEgOo2aP6ecx5yZYyhY8hGuKgELfbBtlzG32A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nt6ou9De; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nt6ou9De"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788261236; x=1819797236;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S2nNUquQwB0cPhyvsaXaBqfuZkCaMaMzO3imIERMhi4=;
  b=nt6ou9DeBgsL6HzNXBGrHmDS4E9uBHI99md3LJctVc0VyFHM7Q+XwppQ
   aACxpk5l9j/oYcvve4uCXwzRHHrEz+Tkj1/KZkgchztwcXrReFLJ9Zo+u
   ARmZd898y3tmoga0T8ESglS/N+1we2KcXt/UhkndwUjncrpO9lyAZDutO
   s1H8RA+vdf2vPKGuTIbi4tgqssEVw5XIzmxCVCzkO4CGw4B/aYofvv6fz
   cOqHNAsPBfdyH0qg1bphPA7GgmoI4NmXZz65zkOv22M7TS/jH1SJc5XLH
   Z79E5ABnKWcpOYfBAx8jsFcl7TbhkV86uI/HgXWYBwwrnKGClVaKy5hR3
   w==;
X-CSE-ConnectionGUID: FxvbnwuwR568aftio5lEOQ==
X-CSE-MsgGUID: WET1a/WIT4GQTnamj7ZJ4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="111456396"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="111456396"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 04:13:55 -0700
X-CSE-ConnectionGUID: xv7AXqDwRqWbKWMPHJbK8A==
X-CSE-MsgGUID: 3r24Wv6TT3Oqw0T5dI0iZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="264793155"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.222])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 04:13:52 -0700
Date: Tue, 1 Sep 2026 14:13:50 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Thierry Chatard <tchatard@gmail.com>
Cc: linux-kernel@vger.kernel.org, hansg@kernel.org, lee@kernel.org,
	platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com, linux-media@vger.kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net,
	v.vitovt@gmail.com
Subject: Re: [PATCH v10 5/8] platform/x86: int3472: tps68470: use a common
 always-on VIO regulator init_data
Message-ID: <apazbhgCdpZdZM9b@ashevche-desk.local>
References: <20260831160754.9857-1-tchatard@gmail.com>
 <20260831160754.9857-6-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831160754.9857-6-tchatard@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Aug 31, 2026 at 06:07:51PM +0200, Thierry Chatard wrote:
> The surface_go and intel_nvl board data define byte-identical VIO
> regulator init_data (1.8006 V, apply_uV, always_on). Replace both with a
> single shared common_tps68470_vio_reg_init_data so new boards with the
> same requirement can reuse it instead of duplicating the definition.
> 
> No functional change.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


