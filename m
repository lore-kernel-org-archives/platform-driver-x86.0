Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61C912C498
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 May 2024 14:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716562481; cv=none; b=LVe0ISz+rdnosnN3ARyyX81Mcsu0yfp0ee0AgTU9w3x/2TPstZs8Bs6CTOtYny+alQDVWN+tjM7w8xGuOpeg7c4o3aPf7H6+mnhSvxA408Iciz3YknwN1CF9+xO7x0SCfx1aIbrjHwOIzxbAf2lgs86xZrioJ+ejHhyqXG/Ua7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716562481; c=relaxed/simple;
	bh=PNdFcLTU0qQHyPogVRs7FQWkzRXlSIlN8NHiGrpMPYI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=IpJrD0MXbcY89Exvugw9Y04oxirjlhkUMf0yLBF4j4yQWUVFBadzeO1FC4MtixcRs61ewn87x9IaoVsZYJ68gS+HCWZ2bsAYEkbgGqzthcnds2tefjfkzgT76hxnSrUjOTnAdGQ/1b5HEsCxXmXc7N48XsIf//r2X6LvbrYTE0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lISWqdgT; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lISWqdgT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716562480; x=1748098480;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=PNdFcLTU0qQHyPogVRs7FQWkzRXlSIlN8NHiGrpMPYI=;
  b=lISWqdgT+jHQwr7Nd5Js0wvTYYh0MAOcFQINldhSPePRvNz8Mjr4rWsn
   TQN5/YHjvR95NcEUQDJYFE3PDB2ki9eepQrUOFZMYmNxEoSy1eTNC7A29
   1DE6KcgoupV0DYMZpYGYu7mhigLzlI6ny3HIjmWVFDyo7Vt2B1kaWHa9U
   tCWkUZu7qHmLLU2Oh1pRMtZt8d0aM3Bj8uDtXjgJSygkTMZqjskyCSFVq
   86As6wQqBzks2iLtPSXefBAcid02Chs59DPHCXZTeoRnalo9R53cygjHg
   48E5esc0ANEHoDnTV/5wvN/6iFS8GrPcZa54W2CoReDbT2eKKzdSVl+d6
   Q==;
X-CSE-ConnectionGUID: 5RhaQT8TTwS393u8pzDKbg==
X-CSE-MsgGUID: tTaTUqwvQH+pKKKDXbnSNg==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="24070238"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; 
   d="scan'208";a="24070238"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 07:54:40 -0700
X-CSE-ConnectionGUID: XdJpz91bQPmRs+/KxlVU0g==
X-CSE-MsgGUID: /JjxfPnmSWehmFlUOeAo/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; 
   d="scan'208";a="38456319"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.127])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 07:54:37 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 24 May 2024 17:54:34 +0300 (EEST)
To: Hans de Goede <hdegoede@redhat.com>
cc: Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org, 
    Gregor Riepl <onitake@gmail.com>
Subject: Re: [PATCH v2] platform/x86: touchscreen_dmi: Add support for setting
 touchscreen properties from cmdline
In-Reply-To: <792e7722-8e93-4414-9665-2bddd888173c@redhat.com>
Message-ID: <348c270a-cbd0-55ab-63ac-11afb2eebe91@linux.intel.com>
References: <20240523143601.47555-1-hdegoede@redhat.com> <792e7722-8e93-4414-9665-2bddd888173c@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 24 May 2024, Hans de Goede wrote:

> Hi All,
> 
> On 5/23/24 4:36 PM, Hans de Goede wrote:
> > On x86/ACPI platforms touchscreens mostly just work without needing any
> > device/model specific configuration. But in some cases (mostly with Silead
> > and Goodix touchscreens) it is still necessary to manually specify various
> > touchscreen-properties on a per model basis.
> > 
> > touchscreen_dmi is a special place for DMI quirks for this, but it can be
> > challenging for users to figure out the right property values, especially
> > for Silead touchscreens where non of these can be read back from
> > the touchscreen-controller.
> > 
> > ATM users can only test touchscreen properties by editing touchscreen_dmi.c
> > and then building a completely new kernel which makes it unnecessary
> > difficult for users to test and submit properties when necessary for their
> > laptop / tablet model.
> > 
> > Add support for specifying properties on the kernel commandline to allow
> > users to easily figure out the right settings. See the added documentation
> > in kernel-parameters.txt for the commandline syntax.
> > 
> > Cc: Gregor Riepl <onitake@gmail.com>
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > ---
> > Changes in v2:
> > - Refactor ts_data / ts_data_dmi handling a bit (addressing Andy's review)
> > - Accept hex/octal numbers (addressing Andy's review)
> > - Fix ts_parse_props return value (addressing Randy's review)
> > - Use ':' as separator instead of ',', ',' is used in "vendor,option" style
> >   property names, e.g. "silead,home-button"
> > - pr_warn() on invalid syntax since init/main.c does not do this
> > ---
> > Note assuming this gets favourable review(s) in a reasonable timeframe
> > I'm thinking about maybe even adding this to 6.10 as a fix since users
> > not being able to easily test Silead touchscreen settings has been an
> > issue for quite a while now. Without the cmdline option being used this
> > is a no-op so the chance of this causing regressions is close to 0.
> 
> Ok, so here is the other half of this in the form of documentation how
> to use this to figure out the right configuration parameters for Silead
> touchscreens on laptop/tablet models which are not supported yet:
> 
> https://github.com/jwrdegoede/gsl-firmware/blob/master/README.md#determining-the-touchscreens-parameters
> 
> As mentioned above I would like to merge this through the fixes branch
> since this resolves a long standing issue with users not being able to
> use Silead touchscreens on unknown models.
> 
> Ilpo, do you have any objections against me merging this through
> the fixes branch ?

It's fine to take it through fixes I think, especially this early into the 
cycle.

-- 
 i.

