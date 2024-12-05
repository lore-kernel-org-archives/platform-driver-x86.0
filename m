Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC12C2391A8
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Dec 2024 09:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733389395; cv=none; b=GpwMcsodxO3TVlxzBdc5wBl+v4h5rJtiJ/OIwa5/tbx4Z8J9+2Om54bSliKazNAxpitIops1RXMdZizDdSSZrrezcS4DhGsAq/361lTBxVWFn7o8JdaCUUa4FNstzHgAchfUFbzDUNIHGgEN1ZIIvq0TfCwfxx+3KWHXwEwIQMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733389395; c=relaxed/simple;
	bh=PTh7UTwllRmh/DpMinZCfJGLGawPGsN5wvkFGTRcjkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PM3y0eZ0XjG0J7hwqp95poZCBkivI8J7tpJxhl2bKUMYj9jogd6EbQNVKUCMcZJR7T0UkPInKpwJvWLc/vaniNDb+tSl7QX2aP4uH7n/GAG93fZUI6tv/J3wmpCyHcrZx74xIszvriBsLuEf58gSyTSi8FiGX2/BkNLflaAa1F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: JK/47bEHTb2BRGmzk1sK4Q==
X-CSE-MsgGUID: nXMoSALVR8GSvTTg5iVsjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="51106422"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="51106422"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 01:03:08 -0800
X-CSE-ConnectionGUID: chlwDa0LQlecxP1/BKka2w==
X-CSE-MsgGUID: Rt2A5p/fQumdo4TWt2bsFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="93923199"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 01:03:07 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1tJ7lI-000000042Ev-25zY;
	Thu, 05 Dec 2024 11:03:04 +0200
Date: Thu, 5 Dec 2024 11:03:04 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 2/8] platform/x86: x86-android-tablets: Make variables
 only used locally static
Message-ID: <Z1FsSKVp8SldyLre@smile.fi.intel.com>
References: <20241204204227.95757-1-hdegoede@redhat.com>
 <20241204204227.95757-3-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204204227.95757-3-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Dec 04, 2024 at 09:42:13PM +0100, Hans de Goede wrote:
> Commit 06f876def346 ("platform/x86: x86-android-tablets: Add support for
> Vexia EDU ATLA 10 tablet") omitted the static keyword from some variables
> which are only used inside other.c .
> 
> Add the missing static keyword to these, this fixes the following warnings:
> 
> drivers/platform/x86/x86-android-tablets/other.c:605:12: sparse: sparse: symbol 'crystal_cove_pwrsrc_psy' was not declared. Should it be static?
> drivers/platform/x86/x86-android-tablets/other.c:612:28: sparse: sparse: symbol 'vexia_edu_atla10_ulpmc_node' was not declared. Should it be static?

I believe you can shorten these lines like

  .../x86-android-tablets/<and so on>

(Note '...' instead of PDx86 root path.)

Reviewed-by: Andy Shevchenko <andy@kernel.org>

-- 
With Best Regards,
Andy Shevchenko


