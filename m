Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9441A8418
	for <platform-driver-x86@vger.kernel.org>; Mon,  7 Apr 2025 10:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744021673; cv=none; b=tLxhBcUts/6+55TEe5n1Sb5T3AhBUhEjAG4PxxI3zM4UpD/A75Brc7wxv4QfjXOC472DcM0FioZ9mvtEK3euak4N+nGQ0RoiunNuyy2PreUyflnSYwFuK0/iuJUe/JoR6xun0rIlx7qoMHxFSuM7SeNjnPaEbPkDqz233dP4TCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744021673; c=relaxed/simple;
	bh=W/iO+H+267zKi8dUYZJn54B7Sgm5T81biokopS5rmeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M+l4bIvFdNXdo+7D8c9aB+U/ACN88yEwzdok6IfzCiuZkGMdTZmnGIKE8FjtS+KkHOFKvbyj+WjlfTI9ozckN7/vspsFK1e1c9G1827a9SUs6hyJl+qEwkKJM5ocMvXe4GKkNJkyRfrE1sC+TLbINGNU7CDFBwqJorUP3QRFOSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: QTb+nP3oTfOejoqGWFG0Iw==
X-CSE-MsgGUID: 1sHZwgZQT3mfeck5+uDAPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="45519781"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45519781"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 03:27:50 -0700
X-CSE-ConnectionGUID: ZvoHvj03RwGQziUauedaHg==
X-CSE-MsgGUID: CYY6fk5cRGu9F9XQLizX0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="151106828"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 03:27:49 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1u1jhj-0000000A24w-0sya;
	Mon, 07 Apr 2025 13:27:47 +0300
Date: Mon, 7 Apr 2025 13:27:46 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/2] platform/x86: x86-android-tablets: Add "9v" to Vexia
 EDU ATLA 10 tablet symbols
Message-ID: <Z_OoouVSgw1xOpur@smile.fi.intel.com>
References: <20250407092017.273124-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407092017.273124-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 07, 2025 at 11:20:15AM +0200, Hans de Goede wrote:
> The Vexia EDU ATLA 10 tablet comes in 2 different versions with
> significantly different mainboards. The only outward difference is that
> the charging barrel on one is marked 5V and the other is marked 9V.
> 
> Both need to be handled by the x86-android-tablets code. Add 9v to
> the symbols for the existing support for the 9V Vexia EDU ATLA 10 tablet
> symbols to prepare for adding support for the 5V version.
> 
> All this patch does is s/vexia_edu_atla10_info/vexia_edu_atla10_9v_info/

And period :-)

All this patch does is s/vexia_edu_atla10_info/vexia_edu_atla10_9v_info/.

-- 
With Best Regards,
Andy Shevchenko


