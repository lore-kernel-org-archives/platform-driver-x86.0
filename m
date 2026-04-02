Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A150519F115;
	Thu,  2 Apr 2026 16:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775147508; cv=none; b=CZ9YxDaeQdKMe2E0sxe06elokw5oLnDXvw5WUHt5GIEn1Yw1X1Y1eCcd6D9E6EO7gQnwas60ItVKfA638sJGP2JIhl7r0nJ/pK/ewI0DvD6wJ7UCNpAHKIXkNLyaivrAPWtJauuX6MjtD9dkm8uPyFEbkU+zHTEhrxRNykMIvjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775147508; c=relaxed/simple;
	bh=UV4HmWX0GpSn13pIpO2Sp5xa9lvHRqa0N3dIMWcI00E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eMqGmgbuk0OMRSe8Jgi/bZx6iqstFpAcuiDpM3mS22N0G74DNabcS3HTTQFM9jJzfXQ4xZNv2nGkV1tXNRRShx6OcOp9JPdpFXs79pQUabMWSsMjuI6GGAj2RtQp8oKcMiqnhUIFzOGAfQkYoy9sDOjqd/hgv2dK06VGgnf7GOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lgy9YwHo; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lgy9YwHo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775147508; x=1806683508;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UV4HmWX0GpSn13pIpO2Sp5xa9lvHRqa0N3dIMWcI00E=;
  b=lgy9YwHotcT//fPkgB81Okea32D+wlDxly3Ivkycaf5sX2uZeggSoRhR
   A7yNErTlJ45/8jP26KmgDGHnUmyEgaz4JssW1oHWgkXl2Wsn7LASKjZ7D
   cMkFOb/5Uu9Mzc0mjShS49pSt/lcc5DX32OOYjJOQ99jtMfeoflZtF4GO
   kzdqlDt7bQalpaGxl7buy9O+t1V0o6jTVURGsYm+XAyFDR4TM3WgnPujJ
   +rloGslI1Hyjneqa9bUCtiSjho6AnQFuALAsPaV45fSeR4embwVfPoTJl
   HCKYUamtgD2PT1ETz4w+kBcVPCG/sJ9uhv52Gd0v1iMf8vgZHR3Y+uuEp
   A==;
X-CSE-ConnectionGUID: HygxUkBwT1eKhWC9zfKIAA==
X-CSE-MsgGUID: heej3FlQRGaLcn65CkinTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="80070403"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="80070403"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 09:31:47 -0700
X-CSE-ConnectionGUID: LxQzW0oCSHagcHfzVAZG0w==
X-CSE-MsgGUID: mP3bKiTZSwe9w0yDUJoElg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="228648163"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.118])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 09:31:45 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B159E11FBE3;
	Thu, 02 Apr 2026 19:31:53 +0300 (EEST)
Date: Thu, 2 Apr 2026 19:31:53 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Arun T <arun.t@intel.com>
Cc: johannes.goede@oss.qualcomm.com, arec.kao@intel.com,
	ilpo.jarvinen@linux.intel.com, dan.scally@ideasonboard.com,
	platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, mehdi.djait@intel.com
Subject: Re: [PATCH v8 2/2] media: ov13b10: Support multiple regulators
Message-ID: <ac6Z-VjyJAeAv3oR@kekkonen.localdomain>
References: <20260402104045.4040328-1-arun.t@intel.com>
 <20260402104045.4040328-3-arun.t@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402104045.4040328-3-arun.t@intel.com>

Hi Arun,

On Thu, Apr 02, 2026 at 04:10:38PM +0530, Arun T wrote:
> The OV13B10 sensor driver currently handles a single regulator called
> avdd, however the sensor can be supplied by up to three regulators.
> Update the driver to handle all of them together using the regulator
> bulk API.
> 
> Signed-off-by: Arun T <arun.t@intel.com>
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

Where did this come from?

> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

-- 
Regards,

Sakari Ailus
