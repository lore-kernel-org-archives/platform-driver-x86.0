Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793806770;
	b=kbCbMWsdy8eEVMKD7W2G/wBwckboQjZvh2iLowXUdkkcWEvUqN9cU2J4/BFRlMSUw6x/
	 sk3DxEvoeOwdh04i8Cz/lhA2+NhvEzkARINd5+A9sCKEr1i8Oy/emQk63pVrHFKzo1uqR
	 udnzzE9Rdav3cEYbgLozIi8CccKWropDfTbJGfLVR4cIJnd+3eNe+gJhlhbt9YGzXQ17x
	 xtb0uUwXBOeTRAO5Ljj4sNh3KeSxXmPZzAQhxyXKAFQKpj89otfCZY+WjHhGMnv15OnK4
	 7ynKr3SdJfs1X2Bte6quG+ZOAyY4uQlHSZJ+tGwUPUCi7STVMXOlnM1hVUkpVe4OrJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806770;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=GdpPznbXRCenm+XBF5Xo7vyTNRUDGIQVbclmssxWcwg=;
	b=WWHHVri24ztVEc1sMC6qjgwxS/uOEVLCKMGpe8WyeEYZVr94AgrTtQnY+3KPDy67Un2R
	 TF59AXDw/loXRuqyxYAjlJoCTQN+K+2GNW+kHVmD0yfKgdBsXYUuGsFS19X5rM+r5niUk
	 iV72xgojl+8+6H198qm+WE6bDVsWINiGBolAw8mPrQB2i+mMlba6ECJpM2Y5W5MSKEikK
	 GxZhtcHcYe6h+4avWTRxobSzK4QZyUXVWcA5jvdclyxnMYKp/VqQ4csMrQ8PG8yhN678e
	 pxQBM8WDGGrltjQjlj9ODKTeCSGn72BU3WuifVMT96G4T6aEQMwHES5TtD5K0f5uVVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Jt/xfvYm";
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515D3606D80B
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Nov 2026 15:39:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 515D3606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jt/xfvYm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793806770; x=1825342770;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gkzt5baL0cIOAl0rna3wYJs41JOUiy6LFKN0TNChKCI=;
  b=Jt/xfvYmD8GEJYBNyO2fDRPuDhodo29dcUF9scaIWRi3yaBB1+PPIhA+
   6di4GZ/Nyhbfmk49184D3rF6Mk1ofQv81Sl6cVsW6V4aOxwpdOFDN3XHA
   aAnfQ9enfkKjVsoUCsEU0q+HUZIISI/3ormB/5W0dK3umbZKuXq785vX3
   ngVIc3RyYwouwq3iuYHwSqSrAJrhlU8TOL+v3MiwAYlCNazHumCEj0wOA
   PyqxywVrDnssvmYFnhmAmDeG7b/i/fWelKu2Nh075POeV+AaA8R4S76Bl
   /kVA7CrAs62CsYwZDPCllKQcTn180iFGqpFIje1GrX8qjdUszeVrcifHC
   g==;
X-CSE-ConnectionGUID: /EBo4W7XSk6zvQ8JX8JjqQ==
X-CSE-MsgGUID: Ecr/UsQqS1CLBsuEIseFGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2450806"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2450806"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 07:39:29 -0800
X-CSE-ConnectionGUID: tEfkc6lKSfi33Nv5hIyU6g==
X-CSE-MsgGUID: Wdz/vkxFQGmJ5zVpL8umpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7068293"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 07:39:27 -0800
Date: Wed, 4 Nov 2026 17:39:24 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: lirongqing <lirongqing@baidu.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Kristen Carlson Accardi <kristen.c.accardi@intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Tero Kristo <tero.kristo@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: TPMI: clean up CPU mappings on offline
Message-ID: <autRrIIDU3hlwtU9@ashevche-desk.local>
References: <20261104032724.1824-1-lirongqing@baidu.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104032724.1824-1-lirongqing@baidu.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 04, 2026 at 11:27:24AM +0800, lirongqing wrote:
> 
> The TPMI power domain driver adds each online CPU to a hash table and
> its power domain mask, but does not remove either entry when the CPU
> goes offline. Bringing a CPU back online can therefore insert the same
> hlist node again and leave stale CPU mask state.
> 
> Register an offline callback that removes the hash entry and clears the
> CPU from its power domain mask.

...

> +static int tpmi_cpu_offline(unsigned int cpu)
> +{
> +	struct tpmi_cpu_info *info = &per_cpu(tpmi_cpu_info, cpu);
> +	int index;
> +
> +	if (hlist_unhashed(&info->hnode) || !tpmi_domain_is_valid(info))
> +		return 0;
> +
> +	index = info->pkg_id * MAX_POWER_DOMAINS + info->punit_domain_id;
> +
> +	guard(mutex)(&tpmi_lock);

+ Blank line, so we can see at glance the lock usage.

No need to resend just for this, unless Ilpo asks for it.

> +	cpumask_clear_cpu(cpu, &tpmi_power_domain_mask[index]);
> +	hash_del(&info->hnode);
> +
> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko


