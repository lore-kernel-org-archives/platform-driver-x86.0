Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF8C47ECD0;
	Wed,  1 Jul 2026 11:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782905469; cv=none; b=Tk8fMyh4IZI2rWrP/8SuaPNEfuSRj0mrhGZYBjHGKWyXDIjDwn+5XPMSjsGh4+/Mu076+6vt1iQ2uuYutGYCzOauHWNYfIeZNldqUCiYSFPS3ZJLC8mamP4v06DaJVbiwOF+OMDKJQguCuvhahAVJCsaOB/eSY9gtq0FABt2XPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782905469; c=relaxed/simple;
	bh=LhHoZM7oNemQFyUIxv60kPYAqfhjjL6IbsBcgJt/RnU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cWN5ZvZpUwemp19atK3K/zsaRcWGGCXd7FG6viBH/qlGawD95YErTE3sqmlhl5md1gr6+0/KcdHOLWbGxH7/L729DxED6x6PTbeS1aGMHfdOQsC/BmCpkMGt8w6esalaRAI7L7MAye1h0QOAwg6mVkyu+NY4D1S9sz/dTSA4SQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KiVsdNhR; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KiVsdNhR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782905468; x=1814441468;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=LhHoZM7oNemQFyUIxv60kPYAqfhjjL6IbsBcgJt/RnU=;
  b=KiVsdNhRqB+CpwHkIZou1o3W/xOwRa1YkwShvOJF/4NpDevzTdXznVAs
   THM8WODPmAAR31JpS4lSdUisuj0m1TLfJ5cz3jtrQ5QdPpGalHQSnuM/E
   d6ItaEn3gqbvDT8Ef/LQCg3Y+dbNQrhMlOvDd87v1TXU+IlrPUVvbE8wL
   p55IeTs74vWlL8jIjaAKAFTiD5kbGkxZoQNxlWwk3PTTKkHyAYw7wSwMW
   MnzYsCvD/Rhb9uLgNS9U9BAwy7WPIYbXeMkHQYMz8xuVrvsw2HG75matn
   ywDnQ7KOOszTRG/oX5XPorFOVUe/wWHTWd5y8cVTz9oXC2i1GD6kfGXEE
   g==;
X-CSE-ConnectionGUID: WOi1/PEGTOKUTJswkiuxAQ==
X-CSE-MsgGUID: QxhoVH9kTgqwIpmOf2VMMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="94790913"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="94790913"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 04:31:08 -0700
X-CSE-ConnectionGUID: 1v+82RVaRQC7SpK3HSi+xA==
X-CSE-MsgGUID: sqMMUCZ3SHyfC8vsRSMIWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="256463449"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.83])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 04:31:07 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Maximilian Luz <luzmaximilian@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <4421c8c959452d8a717ebc7cc905ad9c2912680c.1781522576.git.u.kleine-koenig@baylibre.com>
References: <4421c8c959452d8a717ebc7cc905ad9c2912680c.1781522576.git.u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v1] platform/surface: aggregator: Consistently define
 ssam_device_ids using named initializers
Message-Id: <178290546124.22449.9703279659987795887.b4-ty@b4>
Date: Wed, 01 Jul 2026 14:31:01 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2

On Mon, 15 Jun 2026 13:28:59 +0200, Uwe Kleine-König (The Capable Hub) wrote:

> The .driver_data member of the the two struct ssam_device_id arrays were
> initialized by list expressions. This isn't easily readable if you don't
> work with the Surface System Aggregator core regularily. Using named
> initializers is more explicit and thus easier to parse and also more
> robust to changes of the struct definition. This robustness is relevant
> for a planned change to struct ssam_device_id replacing .driver_data
> by an anonymous union.
> 
> [...]

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent or clearly a regression fix.

The list of commits applied:
[1/1] platform/surface: aggregator: Consistently define ssam_device_ids using named initializers
      commit: d3f2ecd21924bc67c44ebd608e157a94b4ba4b62

--
 i.

