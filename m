Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A00319865
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Oct 2025 10:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760523596; cv=none; b=awkorzy9l/9C9PwToXO/7kuJ1w2nKp63sXFnScPufOLUvTSrYfLmAdWOR0To2viZj3z+LPjg74474lFMkII7wJYHYiVoIfgw3dbHogmi5pAmoN4yUh1v93P0Xp04ktYJEgbcijeXRG92/kMcBfko8MAWuKcwFm+lsarJwKp7TFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760523596; c=relaxed/simple;
	bh=Vur8k3vGg7R6qGqhBWXq2Qf9XYU7g73V2i503409ZgI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZvKVqYErkGQDleN0TnqE4Vc1LTXO43Rdp505I9vExOCcsdGb6M+eLjqKX0ct9jLNgBYYbozoIKp94OgDdp/5rlJw/tlMmbJCPjTQPZhXWyQ/v419Xd785oi6J/270cbusEc9n/Ggy7QytoQNZSU3qFgFQPucdJRw9zNiKX2a+yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eudBjseW; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eudBjseW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760523595; x=1792059595;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=Vur8k3vGg7R6qGqhBWXq2Qf9XYU7g73V2i503409ZgI=;
  b=eudBjseWbzPertxhTaKptaRs09LVMSBCZsrhFeQ3ZjfIKt+rJlHtYh/J
   Q3Nz9C446ggApr7NHxLKn5JRpzKn3zCmclPpFLSqZVQp668h52DAr6fpc
   9vUOEgIPJ95jLtZw76P0XoO073qvCwo4RglChQOxrYP6ioEZLtgiYNxbS
   9W9B2s3vwCuTUdDWx4iwW0PrYs7qI0XQtTppGd1RvElF0sXVClROGPyHB
   Pp0/CFqhWQps2X/NYrU3vuwhvQzNOYBnvltUBn3D3V7aTusZYmnRTShKB
   rcuus7/9MNRDPxOyyT3+iqs+kSQhwc/hmmcjHGNPDnCoOGrkGZUu08Jc3
   Q==;
X-CSE-ConnectionGUID: 31D0Qz02RcOjVnCQ/NaNNg==
X-CSE-MsgGUID: +eV5lCzsSnyfjziNABfrXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="73373153"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="73373153"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 03:19:54 -0700
X-CSE-ConnectionGUID: oqbOegyySmW+c0kYFM89pA==
X-CSE-MsgGUID: pVk8lE9QRAWgVLecdgUoXQ==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.75])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 03:19:52 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, Suma Hegde <suma.hegde@amd.com>
Cc: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250916043736.3279947-1-suma.hegde@amd.com>
References: <20250916043736.3279947-1-suma.hegde@amd.com>
Subject: Re: [PATCH] platform/x86/amd/hsmp: Replace amd_num_nodes() with
 topology_max_packages()
Message-Id: <176052358265.21241.10639032070508062212.b4-ty@linux.intel.com>
Date: Wed, 15 Oct 2025 13:19:42 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 16 Sep 2025 04:37:36 +0000, Suma Hegde wrote:

> The amd_num_nodes() function returns the number of data fabrics present.
> On older EPYC processors, there was one data fabric per socket.
> However, newer EPYC processors have more than one data fabric per
> socket, leading to a situation where the number of sockets is not equal
> to the number of data fabrics. Therefore, it is appropriate to use
> topology_max_packages() to know the number of sockets in the system.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/amd/hsmp: Replace amd_num_nodes() with topology_max_packages()
      commit: 0bd0f9833196d76666fd2f58524ebfff7ee2628b

--
 i.

