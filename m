Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091563009D4
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Mar 2026 16:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772469760; cv=none; b=IouKEK5hfUCh6XT5JT69y1rre8SCRwaKAYtdp6KR97td7HadpsVr05q1pJlBEI0U+CEzB48mZ0kmHDXGI7ETd7zgbl7AyFVNOHhFLNmAwLfGdBzcj72uhMk+dyUxaU/9l/0Y+erUpiWAEioUHbZQ30gtziv/hM7lH0/EVCpOHR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772469760; c=relaxed/simple;
	bh=bOzud75N1UrD4dbYF/Wo2hMdfxXC/CRiq+7ByBwy0ZU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UZsBqdfT/yCplc6toNHRVE+a6rZd2LSdkLGAo9RTdJB9mGFKgPHQy3ASjeVSxsgRArKB0FEcmKPOYpUHxnAjSDqeKRL12JTVAqT58as1B5JY66My4Fg63K40+LbSTnfYwQl7DKxsBVMyLZoBgMMuR/Ege3b5r+mwHfJ4f3zkarQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dle6tVnt; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dle6tVnt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772469759; x=1804005759;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=bOzud75N1UrD4dbYF/Wo2hMdfxXC/CRiq+7ByBwy0ZU=;
  b=dle6tVntwRqA6iQQBYw1dkD/2s1aiwpil7UA1HsIdBjzuSkIgajYvDR8
   uK+jgnmIjQYU5S+ekEwgwei7FBZBRbYawhUYvueBBUiwC9u3/t8nakgGs
   AQ7iROrpIw3QncDZYYSfgH1WR5EDlE1BEH7eaKuODxklCXQDOqntvoIpD
   j+SAI6GKrwI3qh0kWHCDvCE7qcTOVERIJfimEYpstl1xu/GHMXZ0erSk3
   /6BgLexvoKnUJdzwPPq6SsmZAoaXpFnt8APUTnWg16MyB+KJzE/JZA9iD
   t66EJtcWsts8D6JrorjBqyR6Y4bBpxftgfA6IxRfxvefuY5gTVcbkEF7P
   w==;
X-CSE-ConnectionGUID: d3SsdREgQKyGnkPWGoPfRg==
X-CSE-MsgGUID: s4eY5e8MSoyy6M6Mj1vAzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="84123330"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="84123330"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 08:42:38 -0800
X-CSE-ConnectionGUID: qiYCIVHvSkedmYn2JnDvag==
X-CSE-MsgGUID: gt1uIfSTSGmIY53iApgI4g==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.116])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 08:42:35 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, 
 Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <benato.denis96@gmail.com>, 
 Hans de Goede <hansg@kernel.org>
In-Reply-To: <20260131020118.46171-1-enelsonmoore@gmail.com>
References: <20260131020118.46171-1-enelsonmoore@gmail.com>
Subject: Re: [PATCH] platform: x86: remove unnecessary module_init/exit
 functions
Message-Id: <177246975029.2818.9995263400723569658.b4-ty@linux.intel.com>
Date: Mon, 02 Mar 2026 18:42:30 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 30 Jan 2026 18:01:17 -0800, Ethan Nelson-Moore wrote:

> Two x86 platform drivers have unnecessary module_init and module_exit
> functions that are empty or just print a message. Remove them. Note
> that if a module_init function exists, a module_exit function must also
> exist; otherwise, the module cannot be unloaded.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform: x86: remove unnecessary module_init/exit functions
      commit: 85cd4fbf5669cf394c8627d91c7b50b9aca8f4af

--
 i.

