Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C71402B8D;
	Tue, 26 May 2026 17:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779816772; cv=none; b=G2eTUq5pBAJEcNcaXtenF0d1znpKFEm3IwYdf/gwsBqa2QCD36l3NGYmLHG3IMseLOgZZZ1q4CvgBypuF0g9qyJIvfkoDwT+Ef+brUOoumT47NldYBepnVVWc9JJS0rOLbw4FnkKb68xnUNyuNFDLUm67cQlQh7VDkfM/9ZdUQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779816772; c=relaxed/simple;
	bh=cUS1bkhhjhQ6usruvOXFndqTNhfJpJe0w/d3CnPmsp4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DkR2WozN6vF+RNDwRaQudhDomQNazD6vRG5+aDnyKKdaJ1BPFbAzS1Pa7SCbe6194+x2vWXEGmXxjp78O1Y4020Zl4xPGExHrwcry8aX1pe6/MWmsnpcSi6EA2d4MAi4taM4SKYFRuZbk4onDyilhiE7b/2cs2C3Y8bWXjgkTSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P0ZDQqev; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P0ZDQqev"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779816771; x=1811352771;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=cUS1bkhhjhQ6usruvOXFndqTNhfJpJe0w/d3CnPmsp4=;
  b=P0ZDQqevYZhPc+N6Q24Naj1Ej7IjYgY8x/QcozA/hr5NTD7oeM56+z/F
   PL6AVG/kcltakO9c2RAVqFpFS+e6DPCrX8r40o0fwWzfHTfILGYCtQsXV
   P8QH5p9ogvECWUUInsk1OkhRLCi0nHgCJwNf1pyKnbfp2RP3MoNZuZ6Lq
   dnDMBkiJBXKu8V/2CsPxLyRDs1/6ft7KEqU/mykjH7lsC5fXgrHFXALQD
   xPSoHj8NwNplsH+6C/ylLLtYDS4/9fSZgOQTUz3pMyhI+j8mLOFnSD48p
   1yIlEDo5VMEP4Aaps9HXjjjqcoHIJ2xLFwDehHIA7Ay3JgoQGdGzkBCwr
   A==;
X-CSE-ConnectionGUID: UXJKsQzhQ4WV8+jwoSqQOg==
X-CSE-MsgGUID: LaOqKNB6QM6odB/gjPcqew==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="91330787"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="91330787"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 10:32:50 -0700
X-CSE-ConnectionGUID: 6rAGCzvuSmKrt2BYEds+sg==
X-CSE-MsgGUID: deFLcFkNQlKXXsCeDU+m8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="265597130"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.137])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 10:32:48 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, yoy95104 <yahia.a.abdrabou@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260522203418.28784-1-yahia.a.abdrabou@gmail.com>
References: <20260522203418.28784-1-yahia.a.abdrabou@gmail.com>
Subject: Re: [PATCH v2] platform/x86: hp-wmi: Add thermal support for board
 8B2F
Message-Id: <177981676316.9008.15511242995861058505.b4-ty@linux.intel.com>
Date: Tue, 26 May 2026 20:32:43 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 22 May 2026 23:34:18 +0300, yoy95104 wrote:

> Thank you for you review,I Added thermal support
> for board 8B2f by adding the board ID to
> victus_s_thermal_profile_boards table and
> I removed the definitions and checked the code
> as per ./scripts/checkpatch.pl and to clarify
> i didn't use any AI or tool to make this patch
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: hp-wmi: Add thermal support for board 8B2F
      commit: 4cc1969633992128fef05ba7d4911f753f6d0b58

--
 i.

