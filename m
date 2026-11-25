Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649266;
	b=zUY55A9uCNOtnM2CqlTCQZhu5e9pDpv1LFZe9FQvDuK3HjR/00qBDI6Mr/gtEfeKfa7t
	 2RkpE3R0xmVko9kEYrmEcMkQEDZDKrmLetpHRUompGd1REV5x+JOr7LHZGAGS/qoPUSOC
	 JneGpLooQI9uJqVy1aSeVlYqL274hr4qG42j1oDTKaNU5Q9aED//v11JjftFxzZjgr/1a
	 ZTD0aqhNRkJ3YvdWL4kL6+8mxYOBtpz6w2EvFtNw4sqKBhgsDZVbvNdSVcK5F8PogIy7t
	 LH/FN7AdOmDhPO4D+Ux11OaVGGTC+2AYRMiQi9SYBjm1R41QUbWI+3ts0LhyQEOQTrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649266;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=/HJbIW3FFEpjlmr0Csa/1n7NSYs1JLeGp72ySMLJNak=;
	b=puyYQz5s7R54cXzhwknBtJiLlCxPOOWnY3Qv/wg9IxkVSdmYayeHZbnEL4gNiS9If0vx
	 /ZHThyK1HMARJ+1h4GOv028ozDXd9gsk4+LDnkS0pQRi4XlbXI2IcUHuDXMzhbQN+l7Wb
	 wa9ubZwo1MkeUywN4TfJzv9/mXVr9HBgX4BzClzs7HVXuhaiDDnJGTJxwg1Ki2Fw6rpS1
	 oR9GygUKBzkKHVOXORP3VJxAsNA4oPSEDeKQngcAeKToGSWTnknu0Pl7Ht8eubTFHJEtb
	 FxC9NdZghH7Q64t9kzSl20zEptFDBh/rdEJuUun+vB+a5JXStmY6e8mlzG1yFtWQDFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aQFQcI4i;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFF8606A336;
	Wed, 25 Nov 2026 23:27:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BFF8606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aQFQcI4i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795649267; x=1827185267;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=yZAAVIM7FG3p9BJfJBak4PZ9n5tN1aTiiHTd1IpUTBA=;
  b=aQFQcI4impGk7GQCtC+opVgaVQZRyIUKcUZTj736oYzbAlyoNgnda4kF
   3e3pXcsaAYRYt9eg1QcrjRgm81aNNQ9HUzu4ghlFJE8waRL8I7HDkT7wa
   ZeSegYdFasVmI/GZPifrzO0oZtvc1CYpYGYoXc0rH7huPaWxX3Q3gUKpv
   3zEJxvT39xwWLHxxWcchi0Rt1gAPqDHhVEoZIR/whBXdDDzmh3sQAsvzd
   PHENBahBgZibl8Lt8vX+uNw58pnxZOn2X1qviuO/kDJjqC6P8HqwUhh5X
   xvSP1Ibg0KwIrTlW/dQA8Qk0j2HnYhq3u4kl5ZOhCoB9PpZWevnkTbP9r
   w==;
X-CSE-ConnectionGUID: eF/JnZykTzWKTG2hsLij5w==
X-CSE-MsgGUID: bfouAa3kSrm7sJrRs96hpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4516783"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4516783"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 15:27:46 -0800
X-CSE-ConnectionGUID: NEpsVNPoTnmqKCHEkxxY/g==
X-CSE-MsgGUID: hvzSTjGeSbO0JxJmR86OBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="12324206"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.96])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 15:27:43 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Werner Sembach <wse@tuxedocomputers.com>, 
 Hans de Goede <hansg@kernel.org>, Aaron Erhardt <aer@tuxedocomputers.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261123-nb04-fixes-v2-1-973e569381ba@tuxedocomputers.com>
References: <20261123-nb04-fixes-v2-1-973e569381ba@tuxedocomputers.com>
Subject: Re: [PATCH v2] platform/x86/tuxedo: Handle LampUpdateFlags in
 LampRangeUpdateReport
Message-Id: <179564925880.9828.3153081146517231447.b4-ty@b4>
Date: Thu, 26 Nov 2026 01:27:38 +0200
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

On Mon, 23 Nov 2026 15:05:10 +0100, Aaron Erhardt wrote:

> According to HID Usage Tables v1.7 "Lighting And Illumination Page", the
> LampUpdateComplete flag marks an update report as the last of a batch. A
> device must apply all prior changes at once when it receives a report
> with this flag set.
> 
> The handler for LampMultiUpdateReport already honors LampUpdateFlags,
> but the handler for LampRangeUpdateReport did not. It always set
> LampUpdateComplete on the final chunk, so every range update flushed the
> internal color state regardless of what the host requested. This reduced
> efficiency and caused unwanted intermediate states for software that
> batches updates using the flag.
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
[1/1] platform/x86/tuxedo: Handle LampUpdateFlags in LampRangeUpdateReport
      commit: 918846d92173e49fb4f1f75324b51927e7456c01

--
 i.

