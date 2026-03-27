Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421DD3DEAD1;
	Fri, 27 Mar 2026 10:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774607873; cv=none; b=ovMToBYl24mPAIKT54UbZdDbQdVoqyeiwFSWsrpJjvSFzHccopqxdEEqnio/HMqEekW3AO8lg3L+cVm53I9Gd1P0xDRjJJ8rJw7bL1uZMr4u6KZH2ymG5pEbGRGEe2zZ/W0CucEb0c+QmPmY0gOhGzkziKQKSQifmGFq+6g286M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774607873; c=relaxed/simple;
	bh=Vj8aQBZGMqFlfKXti/vCXK1kFugvi1UYfhXip0V89GE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jArymQryQfBFDS9SPLvBfhTj6jhFcuqnPJKPWUkWQvQ6aknTdSa1G5P7sv/l6+YTowmmiEV7ElLyzPgP0NByDpGAv4cOcohSSZ9KqkJCh0fKRCPTaYoSzpv4dmIgv7iD55FKgnia4AuqC3nEAPmwvIPh4xp9xmOPekiL59RKrg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lg3QubS7; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lg3QubS7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774607871; x=1806143871;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Vj8aQBZGMqFlfKXti/vCXK1kFugvi1UYfhXip0V89GE=;
  b=lg3QubS7qUqy4iy9Ghnj58uDIMOeGbk4ct/8bjKGNDPVThr4nMq3hrcP
   kgNJeXD+lzht0eEMcjB7/hhBJKWvfao+TMcoSrKcw1nCm7528nGyZqnGh
   zeg3MF/VkxKJjXOx/3uQTP6F3II3BkMamsBT3lvDV/x1EIfgUfGWHvUcS
   Cq6q0Lm+/v4zilCXjisg9yQaYuh5rAQ3pEVWVYTAR9bERveOl7uCZXVsm
   yrqifWPR9jPvDRU8lLgoEa4eStXuBlmZ4HVTgwJsxABWXodCch6rd8wSE
   eN3zFBJauTGXO41eRHMcyuZCjAlN2M00LGjV7esNP2QUhNf5lZYFfxWYo
   A==;
X-CSE-ConnectionGUID: ZzHYePKbSWKEgw4Wvu3tDA==
X-CSE-MsgGUID: u2cHScVbTMW/IAvbIVny7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="85986690"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="85986690"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 03:37:50 -0700
X-CSE-ConnectionGUID: 7gMFGykMQRWJ1sycB4yyow==
X-CSE-MsgGUID: 3UfArsKUShKbcoJmg2SCLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="225201424"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.127])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 03:37:47 -0700
Date: Fri, 27 Mar 2026 12:37:45 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marco Nenciarini <mnencia@kcore.it>
Cc: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/4] platform/x86: int3472: Add support for strobe LED
 (GPIO type 0x02)
Message-ID: <acZd-Xe52h3H0sx7@ashevche-desk.local>
References: <ab0URIrzZPsYjWrM@spark.kcore.it>
 <20260327090753.1481453-1-mnencia@kcore.it>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327090753.1481453-1-mnencia@kcore.it>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Mar 27, 2026 at 10:07:49AM +0100, Marco Nenciarini wrote:
> Some ACPI INT3472 devices include a GPIO with DSM type 0x02, used for
> IR flood (strobe) illumination, which is currently unhandled.
> 
> This series incrementally refactors the LED code and then adds strobe
> support:
> 
>   1/4: Rename pled to led (pure rename, no functional change)
>   2/4: Introduce local variable for LED struct access
>   3/4: Add LED type enum, lookup tables, and multi-LED support
>   4/4: Add strobe LED type (GPIO 0x02)

Thanks for the update, more or less okay, a bit of technical routine with
reshuffling and rebasing and it should start looking really nice.

> Changes in v4:
> - Split into 4 patches as requested by Ilpo Jarvinen and Andy
>   Shevchenko (v3 was 2 patches)
> - Patch 2/4: new patch extracting local variable refactor
> - Patch 3/4: new patch for enum/multi-LED infrastructure
> - Replaced switch-case with lookup tables for LED names and con_ids
>   as suggested by Andy Shevchenko

The led was renamed from ir_flood to strobe. No description why.

-- 
With Best Regards,
Andy Shevchenko


