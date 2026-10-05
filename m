Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BE24D09F3
	for <platform-driver-x86@vger.kernel.org>; Mon,  5 Oct 2026 17:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791222305; cv=none; b=jhHO4FVD2DhqJf0Kkiro7rXVZpNdnOKw41eqKec4KkCCXNlbuDdAd3kxsf11DVE/NBvDgIB0F6NdJW4QvQVTUcI5BGSlkqplaUJH0vjvSNPYrD/Q5LOESC4fvUQLrMq67f69wrmI10JJc4PqFMp/abNdX/2z4RTafPQINYoZOMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791222305; c=relaxed/simple;
	bh=D/5nk+u5ukWJ3Zfs5XwYtmho0FK7sp56v60nW+N4JcA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lL3pscOmgnEEQxolMgTUeobO8JBYZ3fysk1uh/bVEoswRhhNqQPShZV7yBZ1EwNhac2VORegR5cIXdUuCTzQB501gQpG6O6wyjoLjgu/wraXTFX2TG0Smn/kjqffQ6K1paIOevp3jGs1ubyJZ4qUisDg7symPQYsEOcgQ9uKUYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nWiMMWEo; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nWiMMWEo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791222304; x=1822758304;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=D/5nk+u5ukWJ3Zfs5XwYtmho0FK7sp56v60nW+N4JcA=;
  b=nWiMMWEoYn/Sg0pS1Uq19eJt6W+B0qeGuSy4C3LsJ2STEZUvYG7vXxpH
   DMyGXo0SV8gjt5E0Bz8GT4vA8Q/dKMpErk9WRLvxNrsKoYP+iJgTMlUDY
   AKovkp2rxB2DDnQuM7JouTus/fegUh+qXB4kAy2c68Oc1TtSoYYxdyvHY
   MuQYhqyK9CoGBEOVpcoI7y7OsE/GiR0RpDZ/AbDVFmQRt3rbUTQpVUMIb
   NK73Ld09ELGLzkEQ4Bf2WHB7G0vQr3Ln9aZDJV/5uLvOMlINzBzv3NMZk
   HGGEDC5rQ0EbGRidqi3AlXHvuJf5vFqtEiwKUC6HQE53OlVtTnIKK/Wp0
   w==;
X-CSE-ConnectionGUID: sERY1WhdRzSJD9X5zYAd4g==
X-CSE-MsgGUID: gOefwjuhTpejlOjSgXB5QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="102064018"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="102064018"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 10:45:04 -0700
X-CSE-ConnectionGUID: 5WD9AFKARVSkLRT4LSEhng==
X-CSE-MsgGUID: YUWiIZxbR5KVZbxXY0AvOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="937237"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.199])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 10:45:02 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam-sundar.S-k@amd.com, hansg@kernel.org, superm1@kernel.org, 
 Mario Limonciello <mario.limonciello@amd.com>
Cc: platform-driver-x86@vger.kernel.org
In-Reply-To: <20260918170302.352054-1-mario.limonciello@amd.com>
References: <20260918170302.352054-1-mario.limonciello@amd.com>
Subject: Re: [PATCH 0/2] Drop scratch register for 0x1a/0x80
Message-Id: <179122229728.27048.5571666800882674897.b4-ty@b4>
Date: Mon, 05 Oct 2026 20:44:57 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Fri, 18 Sep 2026 12:02:14 -0500, Mario Limonciello wrote:

> This platform doesn't support idle mask in scratch register.  Drop it and
> make sure matching debugfs doesn't show up to return an error.
> 
> Mario Limonciello (2):
>   platform/x86/amd: pmc: Only create amd_pmc_idlemask if scratch defined
>   platform/x86/amd: pmc: Drop scratch_reg from amd_1ah_m80_cpu_info
> 
> [...]

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/2] platform/x86/amd: pmc: Only create amd_pmc_idlemask if scratch defined
      commit: 4f368b44557c0adba84ee4e790f5a85f6e3043c1
[2/2] platform/x86/amd: pmc: Drop scratch_reg from amd_1ah_m80_cpu_info
      commit: 4234b341f1c2e24a38e490d8ac6067cd6ef7f1ca

--
 i.

