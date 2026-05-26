Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E7B3B776C
	for <platform-driver-x86@vger.kernel.org>; Tue, 26 May 2026 17:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779816793; cv=none; b=uBhzGsfFnkkIgGsSkdgoGHxu/6EoQjXJi5z1KRS/KmmUI4sWgrTn1v0kGf7at/boMG1g1UKvTjY+jXxblRg6j8clkT77sdmBcHbRSGBtTaaNDLKa2lHZmKpu+qNM8Hmd08EiKiWACCLSm6GjW/KZM97oJwTbZ8DMhttPDNEKA98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779816793; c=relaxed/simple;
	bh=a7+MbULDqQ5Etjlj7p7gQQZnk50md3SThTqqyGTCEYI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZAgu7poC39KFMXd8f+b6oQi+kXD9pEuLQvU1EkpHSsWS1CkLBHBQXhIqVIUPNeKJfznj8Be/35Go85iNdZVCYlC2wDPZ4lrkjxLoPyvBWolFXdt0Sya7Zq4ockQNUo7X1F4P+l14cZh6to6JL47oPbyMCLM8Ij+FHFh3KYM8sHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GAxCYlcN; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GAxCYlcN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779816792; x=1811352792;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=a7+MbULDqQ5Etjlj7p7gQQZnk50md3SThTqqyGTCEYI=;
  b=GAxCYlcNJcXPJ/QnGplBcX8U3bJ5AUyrOZk/ImCLtQIjhVNNOkwHAoup
   cX+mVM8aSWxiU/f0ZJWX+qlLiAeRGpLSqq3T7g5CeRQaS9Eln2AbMAYpE
   Sao455a8bqoGhyZD66xxBVs95JYUlW8uPBk2WmiHc9opLNwUeiJu1aBM8
   /Llau8IdlXt8p5kNm0MiRHCTZ9Kzdnp7BH+JWBn6/Etyjqu4Ep7ds4tAo
   gunavMTg1U2lfxFfpxL9UOa1QbL/nc2wFOsup6k5MywRZ+pL+Qq913mbG
   gnrRIlN3vnYmQsQsXQSXk7eTLWDNXE8xeWpQcu/pCH4dAjfBj4Gqj8caL
   g==;
X-CSE-ConnectionGUID: zhXvTHI4Tz2bpHrb/RShJw==
X-CSE-MsgGUID: aEHda5HGQqyIXQ4IMVH1sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80751349"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="80751349"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 10:33:12 -0700
X-CSE-ConnectionGUID: w0+xhYeoTeWyhvW7uj5iww==
X-CSE-MsgGUID: AxaJhY/tQq+DIHW8dIuqMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="246954537"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.137])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 10:33:10 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, 
 Gleb Sonichev <sonichev555@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>
In-Reply-To: <20260525100047.20046-1-sonichev555@gmail.com>
References: <20260525100047.20046-1-sonichev555@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-laptop: add Inspiron N5110 to
 touchpad LED quirk table
Message-Id: <177981678620.9008.8874811016424467859.b4-ty@linux.intel.com>
Date: Tue, 26 May 2026 20:33:06 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 25 May 2026 13:00:47 +0300, Gleb Sonichev wrote:

> The Inspiron N5110 needs the touchpad LED quirk (Vostro V130 quirk)
> to properly control the touchpad LED. Add its DMI identifier
> to the existing quirk table, next to the similar Inspiron M5110 entry.
> 
> Tested on Dell Inspiron N5110.
> The touchpad LED works correctly with this quirk enabled.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: dell-laptop: add Inspiron N5110 to touchpad LED quirk table
      commit: e150894beba614ed56d372b99aef224d06941aa6

--
 i.

