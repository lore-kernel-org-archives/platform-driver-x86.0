Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57D94F203
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jan 2024 12:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706187586; cv=none; b=EjUbrHoBNr4qna3gRZv0Qedyj7HjW8XWAxFXqDpsqd3DqulVz0Hro8YCEesxBU1ARHAwCH/nvQ6U2xAUG8X8L37elNZdT7MpMGMlDnvwQbSGBPA68Hx/knIAqcsGqZWrWK+v1DPC7hIuAa+BX6Ysnzfo15ESxmK714R1m+1z1Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706187586; c=relaxed/simple;
	bh=0se8b5/hBj+Q6A5Eo4clnFYOoUNTdl1nQeT1NXts/Nw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GB6WK819yDG578iAknI/K8R7U5yOOAV7H2NfGsCSJAa3RRQDlTdyC//uSur5A1sdf3/0JjR8ujAMmZOYdyVFPKBZEeXtNss42O9QXtgRlGsZTej2vmI8PI5pqAZ1dQk4tA8PmAP/sjb1n+UreRKvmpHmhbqVYwe79EN11uEHLy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bpkenn2L; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bpkenn2L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706187585; x=1737723585;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=0se8b5/hBj+Q6A5Eo4clnFYOoUNTdl1nQeT1NXts/Nw=;
  b=bpkenn2L55FGlyZgUKSWCzgYbG9fBDvzxA8AQsZnz3XuYcKRtFuC41gT
   8oHPKD1+QGAt6FmkARmfpVM5CVf4Wh1fW1UB3fqG2Y9Oil62qr85ehRzT
   e4HmzBJo4tRtffkPAomd3MVj6deeE3qBBCZKoXsIDpOmaVDNoxj9OzfG2
   v2lbkVYz6NmleKNZGWM8mJ4YcI6SWpcEPQMRX3c3D6L2DqL6kc6v46DQC
   3GzoEK3rUYasSFaUBt4EcNr3SwxhJcYCmY01lwJfQgVcckYIimQY4AqWp
   zKYRWRZhLIEDd40C5UYXqzPvYQjkYL53lRZZreKB6mxcUFI6g6DQHPaha
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="2024916"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2024916"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 04:59:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="857058258"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="857058258"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.94.252.55])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 04:59:41 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, Suma Hegde <suma.hegde@amd.com>
Cc: hdegoede@redhat.com, Naveen Krishna Chatradhi <nchatrad@amd.com>
In-Reply-To: <20240125125401.597617-1-suma.hegde@amd.com>
References: <20240125125401.597617-1-suma.hegde@amd.com>
Subject: Re: [PATCH] platform/x86/amd/hsmp: Change devm_kzalloc() to
 devm_kcalloc()
Message-Id: <170618757631.2794.7408103818117764692.b4-ty@linux.intel.com>
Date: Thu, 25 Jan 2024 14:59:36 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3

On Thu, 25 Jan 2024 12:54:01 +0000, Suma Hegde wrote:

> Use the standard array allocation variant of devm memory allocation
> APIs.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo branch. Note it will show up in the public
platform-drivers-x86/review-ilpo branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/amd/hsmp: Change devm_kzalloc() to devm_kcalloc()
      commit: d04e52b47ab62cf36fddaa0feb1c5508e420e48d

--
 i.

