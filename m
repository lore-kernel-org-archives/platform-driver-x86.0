Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F5223EAB4
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 11:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783942234; cv=none; b=Cltp57ArTs/GeQYjGKc9IcYjQdmE38i+Vy9kFM9ZTIxHgTc8YCThvkhIo5DOQHhnIyTmiDeQVKL9EtHz5JIZ0Fj7B2Bhfw7Z5hdICx0So9sWbwNSK6AkY7QOgeVYxrApNMGX9JuQwIm7XietC7QMw8w/iwaXwSlV9WYB5OacVFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783942234; c=relaxed/simple;
	bh=0bD4tHtO6c7SH1yYzaCs6O9YHaq5lxLzEkBf+ODRAhk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=jSXw6zPMXVXVOh96HFhg+LY8uB1ruQPQi3B4Vk7BJJdhV2LBdDg04u1Lq/pEmMhJuzOQzX7zlxDqD1jOwKuE6rLONZ8aQ0ERY0P9SbAPGDQB+CDHFBEKu1v3zFWteryhGa0vIBz0FVJa+tWEjsI4rQdIXhl2kcMYGheC8XBLHqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iZLzrs9+; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iZLzrs9+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783942233; x=1815478233;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=0bD4tHtO6c7SH1yYzaCs6O9YHaq5lxLzEkBf+ODRAhk=;
  b=iZLzrs9+WAv4fSuV781S5LJOpUBw88bsnNqzfWDv0H49n19Q+2uERAhe
   M1ne63uMHUIrymtvFoJlOMAh2Kxhzi5asEviZ0AFsvIypdYoJdwxPuP1r
   21c7kLHScP9J79oYdOk32kfJXeDOCq2tL8RczYXUzfSNZUXK6kEF4O3Y1
   i+p1gnLHXq+zthCThozv90goDEv8LZ/Rlmsb46jHUkGS8Ci5B3T7onFdF
   yQnCN1VO6iW6ljAkwauXPqVzPYaoTUa0gywQkfdvpRsF2pDncMhn1sEi+
   Bt/6r/oE1FFWsuaOZVZmgKCR+Ye0Z5SzbjlgU4w57SZu5E9Dpwyyamv7/
   A==;
X-CSE-ConnectionGUID: tSS3511EQwqIe9nGXtuosw==
X-CSE-MsgGUID: sOyuonkyRO6o131ZTWUyhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84427020"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84427020"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 04:30:32 -0700
X-CSE-ConnectionGUID: hLqIqyJ/R6KBqT6JiRgPQQ==
X-CSE-MsgGUID: EUeBaKuPQ7Gl98UlL5z0ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259387265"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.129])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 04:30:31 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 13 Jul 2026 14:30:26 +0300 (EEST)
To: yahia <yahia.a.abdrabou@gmail.com>
cc: platform-driver-x86@vger.kernel.org, sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] hp-wmi: move from kmalloc to kzalloc
In-Reply-To: <20260712191130.41183-4-yahia.a.abdrabou@gmail.com>
Message-ID: <a1313a0e-d9f4-9173-ae01-3488134156b0@linux.intel.com>
References: <20260712191130.41183-1-yahia.a.abdrabou@gmail.com> <20260712191130.41183-4-yahia.a.abdrabou@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 12 Jul 2026, yahia wrote:

kzalloc()

> From: yahia ahmed <yahia.a.abdrabou@gmail.com>
> 
> hp_wmi_query_perform() currently uses kmalloc to allocate memory for the

kmalloc()

> bios's response, though this creates a security hole pointed out by

BIOS

When you (or you as an extension of sashiko) claim "security hole", you 
must explain that one out how it materializes. Otherwise, I'll reject the 
patch on the ground of unsubstanciated claim in the changelog.

That being said, it is generally useful to avoid kmalloc() but that's 
different reasoning.

> sashiko that when using kmalloc, it won't zero out the memory space, thus

kmalloc()

> leaving information like passwords and other important data.

I thought we had special functions for handling sensitive data such 
as passwords. Yeah, right, there's kfree_sensitive().

I think it would be better to drop the entire thus ... part.

-- 
 i.

> 
> Reported-by: sashiko-bot@kernel.org
> Link: https://sashiko.dev/#/message/20260706143855.35002-1-yahia.a.abdrabou%40gmail.com
> Fixes: 4b4967cbd268 ("platform/x86: hp-wmi: Changing bios_args.data to be dynamically allocated")
> Signed-off-by: yahia ahmed <yahia.a.abdrabou@gmail.com>
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 3235ade2fa98..f120900f536d 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -593,7 +593,7 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
>  
>  	actual_insize = max(insize, 128);
>  	bios_args_size = struct_size(args, data, actual_insize);
> -	args = kmalloc(bios_args_size, GFP_KERNEL);
> +	args = kzalloc(bios_args_size, GFP_KERNEL);
>  	if (!args)
>  		return -ENOMEM;
>  
> 
