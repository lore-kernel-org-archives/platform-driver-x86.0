Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0460A2D46B4
	for <platform-driver-x86@vger.kernel.org>; Tue, 26 Aug 2025 19:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756236058; cv=none; b=KFDpTY7UsO3MyzvEuO0WAqZmO6SjAW74Qf7RzKP01nmG6tzUB5ilCohItBkb4pUq1yRa8NXGQdph0TKtHU83H9OHSiYQZbQsgMmtI4SMAK8wYfvT/9RdAGWSBaadlcaUXspYvYQO3CM0wzTnM3JAxGB3CpZI5hAL6cdrluuwyec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756236058; c=relaxed/simple;
	bh=6M8YSacVnldoBP7xbTOhFNfCn0JjOCt/FNTX9d4FiAI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RmOvaH77sxMsBp9/Fipo5nPe091NzX+FdpO0mNrGyuNF11F0GeSF+xUI45eokUGy3ukUJ+lb89QuM5hoSCydPrfiyVd0va2cBSuBRpCVBnzf88SC2iOmaCm4iX8pruN3/NVjQnd5uTpQ0HY3r53VFuWQExQZ2bqEDO3UtnUAUZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id c0ceb352-82b1-11f0-ab53-005056bdfda7;
	Tue, 26 Aug 2025 22:20:40 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 26 Aug 2025 22:20:40 +0300
To: David Arcari <darcari@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Tero Kristo <tero.kristo@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86/intel: power-domains validate domain in
 tpmi_cpu_online()
Message-ID: <aK4JCK8q-Kf3dS-w@pixelbook>
References: <20250826164331.1372856-1-darcari@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250826164331.1372856-1-darcari@redhat.com>

Tue, Aug 26, 2025 at 12:43:28PM -0400, David Arcari kirjoitti:
> Although tpmi_get_power_domain_mask() calls tpmi_domain_is_valid()
> prior to indexing tpmi_power_domain_mask[], tpmi_cpu_online() does
> not. In the case where a VM creates non-contiguous package ids the
> result can be memory corruption. This can be prevented by adding
> the same validation in tpmi_cpu_online().
> 
> Fixes: 17ca2780458c ("platform/x86/intel: TPMI domain id and CPU mapping")

> 

Shouldn't be blank lines in the tag block.

> Cc: Hans de Goede <hansg@kernel.org>
> Cc: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
> Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Dan Carpenter <dan.carpenter@linaro.org>
> Cc: David Arcari <darcari@redhat.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Tero Kristo <tero.kristo@linux.intel.com>
> Cc: linux-kernel@vger.kernel.org

Can you keep Cc list below '---' line? It will have the same effect on emails,
but reduce unneeded noise in the commit message. If one wants to retrieve this
it is available on lore archive.

> Signed-off-by: David Arcari <darcari@redhat.com>
> ---

-- 
With Best Regards,
Andy Shevchenko


