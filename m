Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1910374A0D;
	Thu, 27 Aug 2026 08:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787819588; cv=none; b=H1IjpOAZIVbeO8lV5iD0ddUUbxUCYvI7Bd77gfb7u+NIPhtPY8sOk0hM3NhSjy9UR6tjQf5NvjI8IV8xraZT00IvuKUk0VKw8FpdLoP8AloI7T/r5clgpldEObA2ZfELYtwLu6nCoBNGkgYMLgyZu8NQqBiwAYSRnWFChlr6+tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787819588; c=relaxed/simple;
	bh=QyRMewST/3Bmbdb92oHtW42ZsbNMwMqsp0tL/EC46y4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NuAtsIMcGAsJQqO+KCah9ESdfFrBQaHZWHtLcQ2C7F0BCNfqqfasehXba+v5lpmyNUQEagorEEJWocd5qpkJoH1PywhA+08jxy5grt22HMcPHi8O5sUapFb+tb/sY/Go5cESi1ceUB+OYiG5zdnk6ix9SznXK49qKRRenDK7STE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=an7In7C/; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="an7In7C/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787819585; x=1819355585;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QyRMewST/3Bmbdb92oHtW42ZsbNMwMqsp0tL/EC46y4=;
  b=an7In7C/M9w3u001SFZNC0P2Zch1YGq0GGcFWR/oWkwbifdgzt7l/gIP
   pO2tpCwIBGjXAUnxczuhWLAHHFqYoxvI5SnTvngilxewXEZ+Ea0rp2+DZ
   aQJC7U6EBMk81UNmLs4w1hs0IhXmPdK/a0QeXzO6F60tnzv36G9TG+aE9
   M46AnqP994qubRsGdxrEMtrpEjobZ+nlyHukNSKqiU0KjkCADEy4p2wBS
   LXzKsDOtVdT5lY9I9uDGPduLqNQo0GZreudFo1GX88tXM4sXmAYEswmJ3
   WBajKs38IpWPMz7D0w+ECKpRKLCobVv3pq1XDuYqjpXiWw2p/RFKAq3Sa
   Q==;
X-CSE-ConnectionGUID: dQP2cRETTpWyEFwVIz2axA==
X-CSE-MsgGUID: 6dTHDUugRT+Hwid2I36yDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="98647400"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="98647400"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 01:33:03 -0700
X-CSE-ConnectionGUID: UPDTF/WZTKi/VJp0ImibXQ==
X-CSE-MsgGUID: I5uxyM2uTUeVWCrHDKm8GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="297696948"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.125])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 01:33:00 -0700
Date: Thu, 27 Aug 2026 11:32:57 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Thierry Chatard <tchatard@gmail.com>
Cc: linux-kernel@vger.kernel.org, hansg@kernel.org, lee@kernel.org,
	platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com, linux-media@vger.kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net,
	v.vitovt@gmail.com
Subject: Re: [PATCH v8 6/6] media: ov8858: add ACPI device ID INT3477
Message-ID: <ao_2OdOHwcuL8uNi@ashevche-desk.local>
References: <20260826112452.13539-1-tchatard@gmail.com>
 <20260826112452.13539-7-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826112452.13539-7-tchatard@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Aug 26, 2026 at 01:24:51PM +0200, Thierry Chatard wrote:
> The Omnivision OV8858 appears in ACPI firmware under the HID INT3477 on
> Intel IPU3-based platforms such as the Dell Latitude 5285 2-in-1. Add
> INT3477 to the ACPI match table so the driver binds when instantiated by
> ipu_bridge.

This version looks pretty much okay to me, with the exceptions of some
nit-picks here and there and the main issue is the process related, id est how
the email thread is formed and absence of the cover letter.

Thanks for this work!

So, since there is no cover letter, there is no clearness how this all is
supposed to be merged. I assume either media tree or PDx86 with the immutable
branch for others (MFD, and PDx86 or media). I'm not sure that MFD is a good
choice to take it, so, Lee, please, ack the respective patch if you agree
on the contents and the merge approach.

-- 
With Best Regards,
Andy Shevchenko


