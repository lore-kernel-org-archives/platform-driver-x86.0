Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CE5371D15;
	Mon, 31 Aug 2026 16:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194728; cv=none; b=grHy1tWGnCbVYVgPY5+rTK5XohXra6ddssdnbW1Vubar4+bb/kPZPlW/7kyI5KdbWd2mABmCqtZDEJJDzbQkdzotDMJpnYoxEp5ZU+bczppX1m3+iYif2zN6R1GeT792NWw1u8m+R9gRzndLKGvG/kmlVw8JFaCY/qJnZhwoVb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194728; c=relaxed/simple;
	bh=MyVMOIf13U6la7SmbRzbpstFNtFEHOrQWTaQvC6Go4k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ug0wdqC/ZI4QmPJcM0Yg4+YyYuSSvWDKh8OnWFd1mwXVQikL9Gm/uDRvm5WKmHiVWPpJ+odlkUQ2ge5meLlff+6DUVmJ7kS5WCa0LQIADwaT/s2oPtt0s9hVSKk2qB7gvFbY9+p5KEJ96ISEYh5D5bR/paWChHCgM+eaRx+OMYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dTxO2LuR; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dTxO2LuR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788194727; x=1819730727;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=MyVMOIf13U6la7SmbRzbpstFNtFEHOrQWTaQvC6Go4k=;
  b=dTxO2LuRS5RUTaxPZ2MSa5tmtG8BlgBO0SQAn1PrzaRplPvaEd0v1Tto
   HdTKfv+1fdFC1kQxnxwPy/D8Tij2VeH1Fd+EQbww8yHp76MBcLoNFUCSo
   j2ZztPgujXZhNR0kplv8zDykq8G9hlPgI++sLmxUVt8kn37sXeb2ChHs2
   FA+z+8sxGK7b19GCpQSZr6zpktrBBMb+kILEejpPXqwltsXav1D1UO6K0
   p7kJOPGs6Q9lXD8vml3mn12mzaj4llvPfWe/fH3ahYLeOmABKYlw/cOmN
   Z6hO1kebFSmls7wZSUajbSB1d3dPU3stlP35QUBmh+BsVEbZjyOEY9OUZ
   Q==;
X-CSE-ConnectionGUID: D9BGSgXgSqOvK2U1JukU4A==
X-CSE-MsgGUID: z0aitgw+Rk6ZzW7DOy7N5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88732578"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="88732578"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 09:45:26 -0700
X-CSE-ConnectionGUID: oj3aojEOT6Wruq8EJkKXTQ==
X-CSE-MsgGUID: GTbLwhWcQBymtGYONqVB4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="268887288"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.121])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 09:45:22 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev, 
 Armin Wolf <W_Armin@gmx.de>
Cc: hansg@kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org, royclark086@gmail.com, 
 rafael.j.wysocki@intel.com
In-Reply-To: <20260830235058.324140-1-W_Armin@gmx.de>
References: <20260830235058.324140-1-W_Armin@gmx.de>
Subject: Re: [PATCH] platform/x86: asus-laptop: Fix ACPI event handling
Message-Id: <178819471792.5620.5311886885453382430.b4-ty@b4>
Date: Mon, 31 Aug 2026 19:45:17 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Mon, 31 Aug 2026 01:50:58 +0200, Armin Wolf wrote:

> The event codes inside asus_keymap[] span a wide range from 0x02
> till 0xC5, but using ACPI_DEVICE_NOTIFY prevents us from receiving
> event codes below 0x80.
> 
> Fix this by using ACPI_ALL_NOTIFY instead.
> 
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: asus-laptop: Fix ACPI event handling
      commit: 156c129509869a090f88e96fba4bdf2dad12969a

--
 i.

