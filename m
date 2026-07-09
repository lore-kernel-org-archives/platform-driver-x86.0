Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82083DCD8D;
	Thu,  9 Jul 2026 08:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587460; cv=none; b=u77FrsxarCD+Ru38KtEE92IBPXm6TPsz3WnPvSRsdo8m6BRB2948Nh8bTd0oee46vg4rzGZqn8NE1AzVxgc0cu5xqIitmvJtjWR9/ec61Nluel77k+fv0hnoWwkbxRCdGVs+2t7GzN+ED1lJljl71Vp5PrQNKRN/6+3hsuFUJHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587460; c=relaxed/simple;
	bh=MgYV9JoV5keW8F9POKfuuloTiFTjlBFK0QyMdPb89QA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=t4pKK9WCIOI+ODrbW4kE9YnbKRQehzLnEzcQ3cop39Ug63l5lMSDKiaO9jAdyNqe25d6PxDdcesSbaBfxxCFhtYZpnlK2bq7qsNdf7VfwiT4nr0YsSrDELHFizKu59CXIH9qkgfFkB150m7m1ZFezDH/tprbwyPRXoUENwn+55M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l2YLaXHk; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l2YLaXHk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783587459; x=1815123459;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=MgYV9JoV5keW8F9POKfuuloTiFTjlBFK0QyMdPb89QA=;
  b=l2YLaXHkGwsp19nUOokN6nC4k45u75OivYy8Q7VYeJPz9BzZQBTiW3zc
   hDp/INolLggpWdesoUZR7+kYGEk6ax2IGgNXf5Q1HfDMuK14AGLXd2D9M
   UM2W2BjOfKOTgZs2pdjGQ4UGpoOtM8KjR5JUC5MzpGuIeppDXIv4cRHNa
   1d4fGJ1PcU6QFiAUA7k2jO/QYX+n+uvJQIU781SPbnSBggjQlZckND16/
   aeg1ZJ9D+vo2IRka6wYHe+THKYw6IkGKpXvriCqftRBWn0+q4YCcy4QLH
   YmWresHWN5PLXZUapajak+4VkWnUiewZThXM2zlcu1hzYWkCNCglvWi7G
   w==;
X-CSE-ConnectionGUID: FGdnsM0NRB+F0mTUUIX3Bw==
X-CSE-MsgGUID: RmwCngYtRFC7H1LG4oSkgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88089389"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="88089389"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 01:57:24 -0700
X-CSE-ConnectionGUID: vhayUm0eSba1LVsTYJZlIg==
X-CSE-MsgGUID: MecFMk2zQae8jX1xL3qtcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="254639475"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.36])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 01:57:21 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 9 Jul 2026 11:57:16 +0300 (EEST)
To: Werner Sembach <wse@tuxedocomputers.com>
cc: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 7/7] platform/x86: uniwill-laptop: Add lightbar support
 for LAPQC71A/B
In-Reply-To: <df32200d-d966-40fd-b8d4-60c5b7e18822@tuxedocomputers.com>
Message-ID: <d06fffe8-0cf6-3ee4-8ab6-c6a87ea4e7b9@linux.intel.com>
References: <20260530170813.10166-1-W_Armin@gmx.de> <20260530170813.10166-8-W_Armin@gmx.de> <df32200d-d966-40fd-b8d4-60c5b7e18822@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 8 Jul 2026, Werner Sembach wrote:

> Hi Ilpo,
> 
> Am 30.05.26 um 19:08 schrieb Armin Wolf:
> > The LAPQC71A and LAPQC71B both feature a RGB lightbar with 36
> > brightness levels per color component. Extend the device descriptor
> > to supply the maximum brightness of the lightbar and whitelist
> > both models for UNIWILL_FEATURE_LIGHTBAR.
> > 
> > Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> 
> This patch lost its original attribution by accident (it originally came from
> this RFC from me
> https://lore.kernel.org/all/20260421201103.142403-3-wse@tuxedocomputers.com/)
> 
> Since the patch currently is only in for-next can this still be fixed?
> 
> Obligatory:
> 
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>

Hi Werner,

Your Signed-off-by has now been added into the commit.

-- 
 i.
