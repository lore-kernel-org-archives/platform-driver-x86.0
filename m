Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3CC262FC0;
	Tue, 18 Nov 2025 09:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763457609; cv=none; b=sVeoc3FRjRs/NKjRAdP4B5oQDPXc59p93KTJam8ny4g+aEoB4lRx2Pt3oMa3mT5zj2+M6gT+uD3jMNS/rh+S+zHYlaGAisCUEdBMRQa7Nfph7LLC4x3iKFvX57RkzqyDyBe8WQSlBjO3vpuEprqVuntYSzvU5hqtpeEhBJNGBWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763457609; c=relaxed/simple;
	bh=mrbxLg4ZinY6PKiXsKhxpQ9h1bHQAAlgahwOA0qsJzk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GuYaLx9G3CG38VkwxcVmznbKAAPW4QOIj+ZiGy+XS4qno8g3p7VCdK4QfqsWTsSwLXjbPejW7w50SM2uBtvVGsVdxisi7Fcv2RyPuiM8nMDalydjgiOv3Dda40PtQIOPsRdrIqG25FOR4jVr/g19R2ny9DP0WCZXgh0VlVMDQNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dsc6JZG7; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dsc6JZG7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763457607; x=1794993607;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=mrbxLg4ZinY6PKiXsKhxpQ9h1bHQAAlgahwOA0qsJzk=;
  b=dsc6JZG719g5CdGbHI44Ooq+OZGLIvnjz6msGnwFxNl8dIQpXdFF8gg/
   j9/XhY+GdaD3Daz3x7iwiIgfr5mtCTQjqEixovGwFziS3oJe3+RZgdNBb
   wvVOenYwiX248Q/KJPPznBfEZVWZofxEaXHQAuQgcFxwSJUJj0CLviAV7
   7CtHlzLmOahfKQWYhLS68BF9EJBSuPE9LIPyYndUfmfMvVLikRkNrB6fv
   rKju7qeGQP+8WNgFunk6zaB+WxYYh56qyTJj5rwDqb7f+ccpvhAjBqelL
   QXdGftqGrgu4fmhvUWjpkZ+l3kRpjka083gMxJAd1g8KHQJL11ZWgAHHm
   A==;
X-CSE-ConnectionGUID: U7V9LTbaREit2HhJr0+rkg==
X-CSE-MsgGUID: BvQCOadzRlSYdEKgXB9zyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="76824986"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="76824986"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 01:20:06 -0800
X-CSE-ConnectionGUID: 3p733mRRSF6voTPdS4OcfQ==
X-CSE-MsgGUID: rJGSryd7T5iAQqYtRdoG1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="191475970"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.74])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 01:20:02 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 18 Nov 2025 11:19:59 +0200 (EET)
To: Denis Benato <denis.benato@linux.dev>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    Hans de Goede <hansg@kernel.org>, 
    "Limonciello, Mario" <mario.limonciello@amd.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Alok Tiwari <alok.a.tiwari@oracle.com>, 
    Derek John Clark <derekjohn.clark@gmail.com>, 
    Mateusz Schyboll <dragonn@op.pl>, porfet828@gmail.com, 
    Denis Benato <benato.denis96@gmail.com>
Subject: Re: [PATCH] platform/x86: asus-armoury: fix wording of a comment
In-Reply-To: <20251115145649.1174238-1-denis.benato@linux.dev>
Message-ID: <7ceec028-34ce-df22-173b-017c0a1f8424@linux.intel.com>
References: <20251115145649.1174238-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 15 Nov 2025, Denis Benato wrote:

> Drop the repeated word "known" from the comment
> "No known problems are known for this dev_id".
> 
> Signed-off-by: Denis Benato <denis.benato@linux.dev>
> ---
>  drivers/platform/x86/asus-armoury.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
> index 31a3046b7d63..c3026e1d3ce2 100644
> --- a/drivers/platform/x86/asus-armoury.c
> +++ b/drivers/platform/x86/asus-armoury.c
> @@ -242,7 +242,7 @@ static int armoury_set_devstate(struct kobj_attribute *attr,
>  		pr_err("Refusing to write to readonly devstate part of unsafe interface\n");
>  		return -EINVAL;
>  	default:
> -		/* No known problems are known for this dev_id */
> +		/* No problems are known for this dev_id */
>  		break;
>  	}

Thanks. While taking the cores change out, I also folded this in to the 
original change.

-- 
 i.

