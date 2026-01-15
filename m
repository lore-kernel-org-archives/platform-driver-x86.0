Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3F63A1E9F;
	Thu, 15 Jan 2026 14:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768487270; cv=none; b=lnVyXnkR1gCiOG14jScFORDRD7zbMXbS9KVfeWTsonNTVNuMbwl01NK55bvAUghJrmX6ZUGqMeE64vQzCV5hbdPngkx/Eavx4i1KIvqPfqxSEoNiCq2AlU6aGN+K4UIMosRW3B8tXq3tSWlFvxW2sCqwNU20YiXv1pSTh8xCDyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768487270; c=relaxed/simple;
	bh=iu+er/iTOuEBq3owWwI93gLigGpJvbGYsEOpkVwVvnk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EzxRqfTAzCuiCme74dAGcZfMNadnjK1bSHWsZgMlwtWHKuqFSw1mU6HtK7PlhXNcrPHDFG14El3VmXtgymgvmuflGxOwRW0kDrltmb9ciPeXizMx+Y/EB5DgVo39PRLHoVQuuwBlSbpv1glHEVF16j77dvXtO1IP1edzN9QpKKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CCesWdcB; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CCesWdcB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768487258; x=1800023258;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=iu+er/iTOuEBq3owWwI93gLigGpJvbGYsEOpkVwVvnk=;
  b=CCesWdcBd7GmhMkKHGMzzEWsM32jOjZytVeveQWJ5OsGwTSl1acN3Ofa
   oiZCQG4qzXJnXIeSzRn+eCQAZbnLfp820kBpkPRg1O3P6bmEBIIjdYC2K
   /2RlQgQqzNTPtQecLz4WjoIRe54yQdZr/DwZs30Ute9b5ym6pOs8SxH4w
   pEtKgNgzY9rshBaN9IU1TEavsqH5rwvBoAlN1lASSY1rJy5PnvIWPgTnV
   xMe9D/AgYrPJxSkzGKqNC8IFcJuJ1oa/s3xiidLgKEhavycVGvLuZORqq
   P6CIkJBl3JfZqjCzCn/3JR0ylvBVjXgdK/7Ze8uxe3qK3pGhKtFFYreZU
   g==;
X-CSE-ConnectionGUID: ZkfDn785SCml1/v2nknXAg==
X-CSE-MsgGUID: eQAQfHRIS4Kl+SPtiXm3cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69000391"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="69000391"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 06:27:35 -0800
X-CSE-ConnectionGUID: b/GZMwFtRKO7i+Oa/jwbVg==
X-CSE-MsgGUID: 1X4xFOisRJiHD6TY5lGzyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="205025140"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.248])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 06:27:33 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-kernel@vger.kernel.org, Denis Benato <denis.benato@linux.dev>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
 "Luke D . Jones" <luke@ljones.dev>, Mateusz Schyboll <dragonn@op.pl>, 
 Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20260112215038.575883-1-denis.benato@linux.dev>
References: <20260112215038.575883-1-denis.benato@linux.dev>
Subject: Re: [PATCH 0/3] asus-armoury: add support for GV302XV, FA401UV,
 FA617XT
Message-Id: <176848724574.21830.18373044892077779639.b4-ty@linux.intel.com>
Date: Thu, 15 Jan 2026 16:27:25 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 12 Jan 2026 22:50:35 +0100, Denis Benato wrote:

> This patch series adds support for three new Asus laptop models
> to the asus-armoury driver:
> 
>   - GV302XV
>   - FA401UV
>   - FA617XT
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/3] platform/x86: asus-armoury: add support for GV302XV
      commit: e11e3e801193d149d0e322e0764778477337d731
[2/3] platform/x86: asus-armoury: add support for FA401UV
      commit: a06bb57b2e71d57c11054ba90b956c39210fcd67
[3/3] platform/x86: asus-armoury: add support for FA617XT
      commit: 8ba4e0598d127f46f9ac74b8c54456a470ce685e

--
 i.

