Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649326;
	b=Uy5L0cvEBRn4bh3sm2FM41zKzQPea1awVBhuDuiaSScpj1U0RtS71GPhTI3PhU2MAvTv
	 NFcTC4HhiR5mbgD9OI5ajkPCrAwZo3IfHjJ3FpbEglzr6D4IG/7VQwD51HrskiHLCEpe7
	 74TH9+LSVdPg7EFi/vJ/egYAPn9AGGefQkyjI7ij3dI8nZN0Z5RSHXpma9nj/NQAAIUv9
	 B4HfLwEUVQr89AWO8aRQrwGlIt4KFbNUruABRjIfHk33K1GpPJLNtRpnPAK6l7OH4IDFv
	 udt1ypUYYWrN+ePVqA1pqSDLp4UA/s6gNxTjOlWZlwtAGr+Rua4SzqYTNWDX3fGJxSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649326;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=bryRHHQLXX2fVp6zVSzVpH/QyraZ+pN0m6O7Hh+AOdQ=;
	b=3mn+hoSEzzLg/fETPZ9bsvuxsr4zsDFEs/hyxP0s9u311EYT/hRIQKx4XAm3MdyYRspx
	 layRnT44SFL+1qG+6LVW8MH/tY4AuZOkGnQQI8RmwrEvguMyfFCJYnr3HhZJz7IEH3v7J
	 3S36yCjboTY4LsujfG1PZHATkDB2E3DnNhKnrHtWmNnwGUZgm0YG6mvNdJuFkwLbE8VOA
	 eZdVwwIHACMFD9f093wd54wVmAZman9EgKIj7ezbd3weUmEn7kqS7ZrIRjwde9joLjf08
	 ioxail6yavfTOcQ+ZVIhggiJ7wZHKHjQ7fbVluvPfh4CkQ2FKSRhhRfhXMb9XUF3jiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LOKS20Ia;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54761606A31E;
	Wed, 25 Nov 2026 23:28:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54761606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LOKS20Ia
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795649326; x=1827185326;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=CRamnork88i39toxK4NN1bd1mv5hBtMGd0kgZTQeIP8=;
  b=LOKS20IaM0+MHPmSaIigu44XD/3Vo0hru+4n3lolpa55SqSWtlDQmZRf
   US/fvlk+KrVoh9xK/8Kk8JzNudJYGcitS7qn0xFfqcERLOyESzFYWOy97
   hdmrj7ngXFCL0fHWUocOLblP3rXfLnqJyMpJ8eohaz9LfkX5sEZbp0wTQ
   cIbci3nlk0IOQDhTaXGDm3k1vplGAsu6fh75Cd7B+pxQQlytIZujCLguz
   Y9p6WxIJ6S7QVgrOBuprMcxBf2AMr/5e1nTKwg/CCdB6TjHm0HRw+Z7JR
   ntAibhSky1nKGhevSJthg4LsAMcA/f/XCCqi0tg/dTx3WZTKfYy5PO8Yt
   A==;
X-CSE-ConnectionGUID: UT/JqA/7TWKf9TsIDwSDvg==
X-CSE-MsgGUID: xebup7H1RyO2EHsrrBhR8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4436594"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4436594"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 15:28:46 -0800
X-CSE-ConnectionGUID: o4wMywgqS6uq+BRW8YcXYw==
X-CSE-MsgGUID: Eg8hDUZjSw6XPkXhxWAtUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="12311821"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.96])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 15:28:44 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, Moad Tarrih <tarrihmoad@proton.me>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261121-asus-armoury-g814fp-v1-1-6b5ae34fd9c3@proton.me>
References: <20261121-asus-armoury-g814fp-v1-1-6b5ae34fd9c3@proton.me>
Subject: Re: [PATCH] platform/asus: asus-armoury: add power limits quirk
 for G814FP
Message-Id: <179564931849.9828.4826306408141382462.b4-ty@b4>
Date: Thu, 26 Nov 2026 01:28:38 +0200
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

On Sat, 21 Nov 2026 21:12:59 +0000, Moad Tarrih wrote:

> Add a power limits quirk entry for the ASUS ROG Strix G18 G814FP laptop.
> The limits and defaults were read from the Manual mode sliders in
> Armoury Crate on Windows.
> 
> Without this entry the driver logs "No matching power limits found for
> this system" and the PPT and NVIDIA power attributes return -ENODEV.
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
[1/1] platform/asus: asus-armoury: add power limits quirk for G814FP
      commit: 6fc627bda235ac5b6f43b5f784b81d6c2450ae5a

--
 i.

