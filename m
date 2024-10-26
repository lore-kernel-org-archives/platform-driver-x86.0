Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609037083C;
	Sat, 26 Oct 2024 04:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729915758; cv=none; b=r4d+CDaBhfLaYJOSdNNkaHj9B5+IQsUD4jK0g9ed6EQPuEVR8jaLRjphHf6SetVupdHbWhb0ixhPcmpGg9h2ybiqW4iblGybpzssq6vA/LPAFfgnbLMPOx5tpvQaHxh2526Apf/U+KpjZIzdPPlERKAyn4kUPhv++GOL0SrZwRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729915758; c=relaxed/simple;
	bh=OcJZ4t8bkvTfIRQWAzAWyVuCVa1SI0mRw18Uk36+UTg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KFqcQFTOQkf5MqNwdLlYGR0ID/lSbg3HMM9HkBEDOSCclVhnKRc64DTvfAJxvKJbd05clxbwvpaa1zgNd2bpbs55vemcwaMoVJ0F28QWNWkzrvg093qOTLNPJwrsQe/mLq6ZKz8VbvsGGmY8TDK8bJWLSYn2wRWwoKELZ26GH1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z9q8dWw+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z9q8dWw+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729915756; x=1761451756;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=OcJZ4t8bkvTfIRQWAzAWyVuCVa1SI0mRw18Uk36+UTg=;
  b=Z9q8dWw+5fqi3ptkLPaLHrYC69ryZufz21BfVyA/jjUB/2R32oQ6PcLy
   3EoPorPRAqDbZfUWJiiCLPNEHehZPx/jJbK3twR7p5TrAuHka6/8hThrg
   CMvc5okJ3WB/g2DT+Vm1YZdJoc4Ma0ilcO9+uLf+fw5nOzeqhnUwcIm0Z
   z8PmHDvT30D5r6PLh6xQm/x2jWwiSvZeme5JvaxqUiCrimUsMF8hl613B
   PTV9UZwaro3pjplYFn+NBeimZ2CEx+gRHz1C0Lb+oFsNoV6jHey8dhCUx
   V1aJb0b/6gdoa2q5pxRS0Vdunh1/7ffTtXq81nzJGDtLCF2HCC7UFUj3J
   Q==;
X-CSE-ConnectionGUID: Qn9K54aTSEG1SBcmEmNN1g==
X-CSE-MsgGUID: pO2BcAugT6WknPhJhEjdyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33288453"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="33288453"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 21:09:16 -0700
X-CSE-ConnectionGUID: w1gW9/ghSIG8/Hdg0+ZMMA==
X-CSE-MsgGUID: ZiE3Z8VKTrC7QIBLdJulBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="81207404"
Received: from spandruv-desk.jf.intel.com ([10.54.75.21])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 21:09:15 -0700
Message-ID: <583d58620eb3a26251c109470030d46d96677cad.camel@linux.intel.com>
Subject: Re: [PATCH 0/2] platform/x86: asus-wmi: Fix thermal profile handling
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Armin Wolf <W_Armin@gmx.de>, corentin.chary@gmail.com, luke@ljones.dev, 
	mohamed.ghanmi@supcom.tn, Casey G Bowman <casey.g.bowman@intel.com>
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 Michael@phoronix.com,  casey.g.bowman@intel.com,
 platform-driver-x86@vger.kernel.org,  linux-kernel@vger.kernel.org
Date: Fri, 25 Oct 2024 21:09:15 -0700
In-Reply-To: <20241025191514.15032-1-W_Armin@gmx.de>
References: <20241025191514.15032-1-W_Armin@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

+Casey

On Fri, 2024-10-25 at 21:15 +0200, Armin Wolf wrote:
> When support for Vivobook fan profiles was added, two mistakes where
> made:
>=20
> 1. throttle_thermal_policy_set_default() was not called anymore
> during
> probe.
>=20
> 2. The new thermal profiles where used inconsistently.
>=20
> This patch series aims to fix both issues. Compile-tested only.
>=20
Thanks for these patches. The first one I already tested with the same
change, for the second one added Casey to check if he can give a quick
test for both on the new Asus Lunar Lake laptop.

Thanks,
Srinivas




> Armin Wolf (2):
> =C2=A0 platform/x86: asus-wmi: Fix thermal profile initialization
> =C2=A0 platform/x86: asus-wmi: Fix inconsistent use of thermal policies
>=20
> =C2=A0drivers/platform/x86/asus-wmi.c | 74 ++++++++++++++----------------=
-
> --
> =C2=A01 file changed, 31 insertions(+), 43 deletions(-)
>=20
> --
> 2.39.5
>=20

