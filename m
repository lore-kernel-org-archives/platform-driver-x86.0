Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794323348;
	b=1ZX6osGLAN7L3NUPOdKw2kg+24pDbW27e52hlvI7Ols8jpanGlfejVd2NcbtN7KoVefz
	 5csa8/BPRy3GRQ0BTD4eGchoLoqoJXLlPg9bm18+a90zq6fHMBn6Kxd1XtAe5Nnie5owV
	 +U3D/IupIaMZsyi2JAWxUmhghpXa3BqCMetuBP5G3fJ4FqWl+mCHcn582TCFs8JnQwsso
	 kvycampi9Cemf5Fh6tdzNU/7fWyIzth8D3aIkBGiDigGZTuMpUTUcEq2URuVjj+JHvYT2
	 ormeaEKdEMRHBF9cOqMP5IkpaNj8GiItkjeTviCXCX0Zru1xh3eyr43I4zt3KYTjHLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323348;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=0Lsa7OJ8nDC65+INVQUtG8rCp8GzttFRLPci9NxyhwU=;
	b=ij/FR239lu1CG7B3jfgay0YdKnlKkHloHlMvbb2giv9lDMvS2Sy+27JdzGDUFU2oCIxH
	 3d3WqovXCSwBiRCepomwJwzPb3YbTuHj4bBi+sojzs1QsNb4i/qoHSdX9uEt5LxuKOSpg
	 FWZU9er8DEUym8JyZP2LZhoD3biVntviWoffR2jzTzlPdTKEBh+6TjujuLOqF0kRX5QAe
	 4Zt0v0V/lGYzy07SaHxCGRcqm85Mm0vVoLPdnHrri4XOEnSEwGB6sA96pAToxw5dD2/So
	 5GBpg1k8JZgSklXBEweoCM29m0oX8mUBP+om4UuDFvoOOavTWrDGN2ociTw5GJc7Yxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GjMrfW6W;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F562606A323;
	Tue, 10 Nov 2026 15:09:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F562606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GjMrfW6W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794323348; x=1825859348;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=8Y3EW4w2CEP5lI7QJfk9hyaDe+2FBBZRqVIrS3giyW8=;
  b=GjMrfW6W3VBUR7n8E7MiGMAtlOOF7L+y4qQjUpf+eoeiOuyFzMCThekb
   5BPcS3rZptiVtFUiyCgOijh9jzxzhBn9dJ+f4UT8o0MBZzjK4eWHBhZQp
   i8CLSFhHEJhWpbq/1loVu3G2+g66cq6MiLgNHQINdB80b9wPVaRA0hXTE
   8q/EFHRiqIOHXaNI82ZVeyks++fF9QjGrFRT0r1/eJ073LCa/Y/H2PlhF
   rgswzFQl9Wnf4+VLJbFtwWJeAg3CiTYIMYkY6Q96wX+IZCZGRZChjtJ7A
   GoHD8ttLXtVsASeRUoFU0I8MVCYvk5buCvPI7xfDzBGwPw/4iGmIsoPT2
   w==;
X-CSE-ConnectionGUID: i37X1/EYSHySO8fYyJ8Cnw==
X-CSE-MsgGUID: X+H9YYGYRzi1ypOexIKSJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="2977781"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="2977781"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 07:09:07 -0800
X-CSE-ConnectionGUID: ekOethH5TPmDRcHUGLGplg==
X-CSE-MsgGUID: 7lzmsrZoRvqG0ipHKxUzpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8279040"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 07:09:04 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, 
 Antheas Kapenekakis <lkml@antheas.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261102173241.1212460-1-lkml@antheas.dev>
References: <20261102173241.1212460-1-lkml@antheas.dev>
Subject: Re: [PATCH v1 1/3] platform/x86: ayaneo-ec: Add SuiPlay0X1 support
Message-Id: <179432333818.2596.3821962790990613138.b4-ty@b4>
Date: Tue, 10 Nov 2026 17:08:58 +0200
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Mon, 02 Nov 2026 18:32:39 +0100, Antheas Kapenekakis wrote:

> The SuiPlay0X1 is an Ayaneo 2S rebrand but with a different BIOS. Match its
> system vendor and product name and select quirk_fan to expose fan speed
> monitoring and PWM control. It is not clear if it supports charge control,
> so we defer that for now as the vendor has not implemented charge control
> in their OS yet.
> 
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
[1/3] platform/x86: ayaneo-ec: Add SuiPlay0X1 support
      commit: fe3b3988305914f2e59369c3d96176bd7d719cdf
[2/3] platform/x86: ayaneo-ec: Add AYANEO NEXT 2 support
      commit: accba7b86159a7124fc323c866ee0a4beac2142f
[3/3] platform/x86: ayaneo-ec: Add KONKR FIT support
      commit: 6230823ee40704ae3fcb9c5bff065f10dd48ded9

--
 i.

