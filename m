Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794570376;
	b=xgfbXeS+tRLJUp96HxHPsyaDT9gpGG676USj9EZ4h7AiyjRyzQh526iCfGAB//DxlPdl
	 /PjpbvtBF0qa1rlBHCJMJQbuagzGJxuz8bIc1kxFG49lMjMZ+CXv+57ZAfu2OELhtJev5
	 d4fZqZTIejT2oto8GlEAnkycqlx2ujbV/C+rAEeyYQ5a/5e+EKd6VpLGi3dbUVu7cNlIp
	 +aCbfENpQZTJstR4CDktN0urhbdgbfapCNzHPumI5TUHfp4UTXgevcrIWSGGnpnZRKBKP
	 ROHNQUrlK9EE4JhVD24YE9d2nBPcBbzaC4uYD6NdUZ37pDZMIXOIG06QiSsOHHnvqeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794570376;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=TyVGa26JC/uGgJ7whYShkyz6YZUGS9gFVl0P9cF9qL0=;
	b=DGDjtGB+srY38CoyOVCn2wiXuDPBs5do5dGFUWiDPA9LDxP6tSIflBMt/U7s09OQEoZs
	 mGxNWeOcnUVtbtk/fI7pwhodfEWfMrghgNtkfpNDJ1zs6qRAcMaZsU+Q44h9R9DYh30xe
	 bsa18K/MR5QOW9SOUAqupnkd1+eMfE/FSS3CmjrTefFInFaXIYSktJTtRpjMm9Su7UlU6
	 ahqx8udeMNo+aTH5918GUJb7+dMkM7YYTxilKsitXLs7odXoNBSrDTYuk4o9qQPEr2jXl
	 9DCbQp7YRioT7X3/pZ/a+2lPlHqm9l4gXm2Khn3HcQFra3Ar/bK+SHaBJVIe5YLlWkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nkbBNS3d;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF68C606A323;
	Fri, 13 Nov 2026 11:46:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF68C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nkbBNS3d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794570376; x=1826106376;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=Z8desejJBfQSLXa87yxXVf7t4IHFDbmztAMtftjTCOk=;
  b=nkbBNS3dUfTA+g9XCW430n5deG5qUYyeW3rs//ZTvxaRE+rrw4as9pTJ
   P5CJaAkCqnj6hlik+nbFdijVQUyrIEAMtiErfA/KhjEN7v4AavDenv92h
   uRaCQDpWcOK2Mc6f54ysZF//xYvx9dA7pfS2+eEMuSL2Zyn8uD/E7w7Lg
   lH4ViczLqUIWbdUe4XIjLXHDvRLEk0nrm0/otfifKEFcQI+Khk4j1OOy0
   bqMDOqV3gZI4v3h/i5PVpyEk8AtYlO/aUJV0+6XLmjcleY5+R7F1kKSdM
   rnbLaJLelYDjU9xa+r4KZojlDtTUjRhBUsukJN1bXqqLntz3we/EjV8E3
   Q==;
X-CSE-ConnectionGUID: eQBE1nwXS0qDCcnuDHOGbQ==
X-CSE-MsgGUID: nHpCI/4wRNGFq4K4mweNXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3402772"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3402772"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 03:46:15 -0800
X-CSE-ConnectionGUID: OxDEuhDzQ4+1Ik74aexGeg==
X-CSE-MsgGUID: cFJ+KkAHQJuz5oWXRjL4yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9452710"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.214])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 03:46:11 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, Armin Wolf <W_Armin@gmx.de>, 
 Sebastian Reichel <sre@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Eliav Farber <farbere@amazon.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
In-Reply-To: <20261113104459.35839-1-farbere@amazon.com>
References: <20261113104459.35839-1-farbere@amazon.com>
Subject: Re: [PATCH v6 5/7] platform/x86: uniwill-wmi: use
 devm_blocking_notifier_chain_register()
Message-Id: <179457036671.7575.8196717476385072185.b4-ty@b4>
Date: Fri, 13 Nov 2026 13:46:06 +0200
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

On Fri, 13 Nov 2026 10:44:53 +0000, Eliav Farber wrote:

> Replace the blocking_notifier_chain_register() +
> devm_add_action_or_reset() pattern with a single call to
> devm_blocking_notifier_chain_register(), removing the
> devm_uniwill_wmi_unregister_notifier() callback.

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[5/7] platform/x86: uniwill-wmi: use devm_blocking_notifier_chain_register()
      commit: 4a53f320115d5f7c21c8fd899b362b5719a51946
[6/7] reboot: use devm_blocking_notifier_chain_register()
      (no commit info)
[7/7] power: supply: cros_pchg: use devm_blocking_notifier_chain_register()
      (no commit info)

--
 i.

