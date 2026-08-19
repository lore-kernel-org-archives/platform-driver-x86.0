Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16503CFF49;
	Wed, 19 Aug 2026 18:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787165051; cv=none; b=V1FCDTIr4uMi/YGYAZiab09Xsr1us1g+SyU4uBsL+e+UOFHek2cDcO+so6mD5/XLHHQN9fMAqkZ4sk+ty6YE3NVt+4Gan1ijW1q8oIbcFet0BqoNdLC7fdj+a4yEJVtK/RBzMxL5rlkNFhGd1TCwOcIxmg5WecbmEDM2uV76Lck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787165051; c=relaxed/simple;
	bh=SPqqymPJpQ8qpN1NTi30aQGwdWihw4xicyFwV5Rmqys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZbNcX60BzflQjhRh/NFS3EKl+7RyilvclCYhHZLLNw5qDGDxsYKa6ewZ7hWOMWxKzUBD1GvR/9UGJlWkqW8Xo16dcfgd5Pwj/g5FejHfGYcks1/KXO0e7a3srq2QuWvZ8Uo80GtNIzDJrEVm8bcu1GJnYhq+/o0yxxyjNarX4rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M8wpUYm9; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M8wpUYm9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787165048; x=1818701048;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SPqqymPJpQ8qpN1NTi30aQGwdWihw4xicyFwV5Rmqys=;
  b=M8wpUYm9HCoBOeqcN7Ukk2nDKWDXEQ7I6QWDTZJY3Kb9XomxDXis5AAn
   eO7jOwUV1fXpaFjq/IhcGzOp9rDu3xnmWuTAehWlXP8fw5i0+b1L+4+t1
   YC41t/6ciU7ERdyz7l586oBcIddGKNxJg+sWNykRVP4PzINE5P0TvYSD0
   rsi7odai+yA6X+KSYzphTFawqZfk23+1zRTyuE2O7n/z7aC6DxyD9OHYP
   VnsqFrhGzSttgTLOtJTtonSt8q4gWgofg4IiyReUTBqE6x0QZFnXecKZF
   9TWL4B+VJcKY+Z212NQOIkRBArMuwpPVsCyUoy9KqoY5WY6Bm+/Nr4nlT
   g==;
X-CSE-ConnectionGUID: k+99TTTCRAGUg296Yp8nbg==
X-CSE-MsgGUID: 5sr7q2QdS0aayl2k4JQHhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="105227712"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="105227712"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 11:44:06 -0700
X-CSE-ConnectionGUID: MZHHGdFxSqSRYfOGnsx8QQ==
X-CSE-MsgGUID: WXEHwwssTXudH82EEn0yJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="303844187"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.106])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 11:44:02 -0700
Date: Wed, 19 Aug 2026 21:43:59 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Thierry Chatard <tchatard@gmail.com>
Cc: linux-kernel@vger.kernel.org, hansg@kernel.org, lee@kernel.org,
	platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com, linux-media@vger.kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net,
	v.vitovt@gmail.com
Subject: Re: [PATCH v7 1/5] platform/x86: intel_lpss: add resource conflict
 quirk for Dell Latitude 5285
Message-ID: <aoX5bwRdqLTo_UKL@ashevche-desk.local>
References: <ae8U0JBdSaPgU-Zl@kekkonen.localdomain>
 <20260819140107.1329091-1-tchatard@gmail.com>
 <20260819140107.1329091-2-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819140107.1329091-2-tchatard@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Aug 19, 2026 at 04:01:03PM +0200, Thierry Chatard wrote:
> The Dell Latitude 5285 2-in-1 has a BIOS bug where the ACPI GEXP device
> and the I2C4 controller (INT3446) both claim the same MMIO region via the
> shared SB04 variable. This causes intel_lpss_acpi to fail binding to I2C4
> with -EBUSY, preventing the front camera (OV5670) sensor from being
> registered.
> 
> Add a DMI quirk that selects IGNORE_RESOURCE_CONFLICTS for INT3446 on this
> machine, matching the existing pattern used by other LPSS quirks.

You replied to the same thread as all previous versions: don't do like this.
The below seems doesn't follow comments from me given against v1, why?
With all this, please, go to the whole thread, read all comments, address them,
or reply why you disagree.

Also v8 requires a cover letter.

...

> +	if (acpi_dev_hid_uid_match(ACPI_COMPANION(&pdev->dev),
> +				   "INT3446", NULL) &&

This should be rather in the ACPI ID table, so the respective match function,
see how intel-lpss-pci.c organises quirks.

> +	    dmi_check_system(dell5285_lpss_dmi)) {
> +		dev_info(&pdev->dev, "Dell 5285: applying IGNORE_RESOURCE_CONFLICTS for I2C4\n");

No. Message has to be generic (and not here, but where quirk is really being
applied, in intel-lpss.c).

> +		data = &spt_i2c_info_ignore_conflicts;
> +	}

-- 
With Best Regards,
Andy Shevchenko


