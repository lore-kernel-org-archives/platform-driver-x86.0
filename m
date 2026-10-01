Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B013BCD1E;
	Thu,  1 Oct 2026 05:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790832774; cv=none; b=DM2PzaJqwgr9zQYMJGn9BhBinyoAuUOsLHTEumN73T7C4XliLS55lBLf+FwygIw8wdI+YFq0sgHacoX0rGL+rthpm9xK539NdSQupqJN+PIMKC0yM2MjP5whKlmjvUC1/QRZKnqp2TNVOK2s4sQdq1xcAtt1bzoGMRg0kIzEvr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790832774; c=relaxed/simple;
	bh=pXOwUKgfA+g6pYVZGoo90h2R4VolWAoRB5awDH/zDdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XtzBjwjVUmBTQRPvUNU1mb/B7PK6uVQSuhygMtR4xLulWHmoil+mAVSwwixqVtsGhjUBPKkuKbAPIXecEe27AbYqJxyVCUcxWaDZf4xGGUA65DINN9ViZ0rePbC2HOkp0Qmmy7wJTWEWkmNIo3LkRfU/LrAE93kgsbnTrTrRt0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V+KbCVN2; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V+KbCVN2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790832772; x=1822368772;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pXOwUKgfA+g6pYVZGoo90h2R4VolWAoRB5awDH/zDdo=;
  b=V+KbCVN2s+JbtrVxOy+5lkvT6R+yIW5TejFV9cWzUMrmVFJb/cNInfcl
   YWzX+7YVMBLqIg8fM2SqmdqAWUPWaUVGXQ//vJMtCCjP5KT6i5T/EL1XS
   j7iopK/k/+w6dS6KDB2RGGUFmVf9+GXMRvImTsKvyTmO6l+K10jiqMiWy
   nePWxuEQGGUNB6SX+N0jnZ4sSvhGLa50jkm0xzVGjI/FEA2wLoeXxcjPR
   3bAS0MRLD2HlEUvEamS6NVQW4l7AA9vaOs+0ZOm84TIyrm+jcLpJ3T4mD
   8UdIGYCPjjRH+NMtnBN0PHdkdynFjGB16M9cpytvDB6eeZlktNZz1vDYd
   g==;
X-CSE-ConnectionGUID: JpD1ZtoKSK6X3lbzwMQ6sA==
X-CSE-MsgGUID: 7MQQCM7ZR/WyMFCi74m98g==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91597051"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="91597051"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 22:32:51 -0700
X-CSE-ConnectionGUID: lz3jggK1QLunXUN+mif59Q==
X-CSE-MsgGUID: ipFmr+7JS6i5IysKjc8AFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="275444781"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.251])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 22:32:47 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id CCB79121B93;
	Thu, 01 Oct 2026 08:32:51 +0300 (EEST)
Date: Thu, 1 Oct 2026 08:32:51 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Thierry Chatard <tchatard@gmail.com>, lee@kernel.org,
	andriy.shevchenko@intel.com
Cc: linux-kernel@vger.kernel.org, hansg@kernel.org,
	platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com, dan.scally@ideasonboard.com,
	linux-media@vger.kernel.org, mchehab@kernel.org,
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net,
	v.vitovt@gmail.com, dmanresa@gmail.com
Subject: Re: [PATCH v11 1/9] mfd: intel-lpss: add resource conflict quirk for
 Dell Latitude 5285
Message-ID: <ar3wg-Q3rRjlFPlG@kekkonen.localdomain>
References: <20260930214321.600863-1-tchatard@gmail.com>
 <20260930214321.600863-2-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930214321.600863-2-tchatard@gmail.com>

Hi Andy, Lee,

Are you ok with merging this and the following patch via the media tree?

I guess there's no direct dependency, so I could take only patches from 3
onwards via the media tree as well. In that case:

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

On Wed, Sep 30, 2026 at 02:43:13PM -0700, Thierry Chatard wrote:
> The Dell Latitude 5285 2-in-1 has a BIOS bug where the ACPI GEXP device
> and the I2C4 controller (INT3446) both claim the same MMIO region via the
> shared SB04 variable. This causes intel_lpss_acpi to fail binding to I2C4
> with -EBUSY, preventing the front camera (OV5670) sensor from being
> registered.
> 
> Match the affected machine by DMI and the affected device by ACPI ID,
> carrying QUIRK_IGNORE_RESOURCE_CONFLICTS in the ACPI match data and
> applying it to the per-device info in probe. This follows the quirk
> organisation used by the PCI counterpart.
> 
> Assisted-by: Claude Code:claude-opus-4-8
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Thierry Chatard <tchatard@gmail.com>

-- 
Kind regards,

Sakari Ailus
