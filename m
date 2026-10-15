Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2F153978D;
	Thu, 15 Oct 2026 14:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074537; cv=none; b=BGO5K4FK1vbzF3NXakkD284ipejeK3m/FlxkYO2OaQCUVPacNsLcH+26DODjjp2ChkZ7UoWdsbdKbj61D5AwtbzGgu6rJhYQnwVjjM2HcisRii/DjuM159ivKIS3b4FqiBTOfRAT3r7hhSRDGFqKAJMHW1pUNVjsKM9rflrXwy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074537; c=relaxed/simple;
	bh=MeLZgULw/pdoSE+CmVaWU9nwIgltJ9op9m7Jo+BRTPc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZD3i3qU6vLa5u21hxapT2CeTP5tiMY8jICGiogVtKa19JZp9KOZ3+ruUCFmDFB/3IYcQSuw3p3N77CWQZJ26xr4FmYg7nvsFiGJKrw3OwMF3qqBvxkwptsP61M2ekrFb9JkhEDjJe8pq7YYous5Eb4kkO76+QZvyY7HYYPGRU6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d1ppOM9Z; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d1ppOM9Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792074536; x=1823610536;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=MeLZgULw/pdoSE+CmVaWU9nwIgltJ9op9m7Jo+BRTPc=;
  b=d1ppOM9ZfS9quKRwtE91O99cqhVna6F8S65wB1mlAzYwUmDCxhtEsUNC
   DaAMIsk1GO5GDRm/cJL7rQOuAGjA9r+kDTZZ4VWKcRBD4xzFZIEMl01cg
   48DyBuNRF/9dTGN3/KCRPAwClzf+AUtv4XeIShMEhfVYYM2XF4cLvfl4Q
   1YUvpXQWdQ26hF3lP8u3czuXMEitqDIgDgn6XhCjASSfsSBe7IzHj4qfs
   YvosmBg5UqPFpuBWX47Ap94BDKuzEFEXKZPg33d/raoONDS+9ClHzqGJw
   Q/sGhFuH8uEtGBTYmNH8pwXsUJkWfZbIS6VhoMGvCHrNeKWx8OI0XS/9E
   w==;
X-CSE-ConnectionGUID: h1UK9QfCQ9GMA6IBZmTAeQ==
X-CSE-MsgGUID: BZh0T0OsQOu9Bkohp+1+pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="730397"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="730397"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 07:28:55 -0700
X-CSE-ConnectionGUID: 1+VaHSAzQISEspll94bteA==
X-CSE-MsgGUID: 6Nc2RQNMSdanWfj+3Fxuhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="2063785"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.130])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 07:28:53 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Mert_Erdo=C4=9Fan?= <mrterdo75@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Ege_Kundak=C3=A7=C4=B1o=C4=9Flu?= <egekun67@gmail.com>
In-Reply-To: <20261015-hp-wmi-victus-8a26-v2-0-3a9e40e00e64@gmail.com>
References: <20261015-hp-wmi-victus-8a26-v2-0-3a9e40e00e64@gmail.com>
Subject: Re: [PATCH v2 0/2] platform/x86: hp-wmi: Add Victus 16-d1xxx 8A26
 and 16-e0xxx 88EE boards
Message-Id: <179207452834.13793.410578304180391201.b4-ty@b4>
Date: Thu, 15 Oct 2026 17:28:48 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2

On Thu, 15 Oct 2026 01:15:40 +0300, Mert Erdoğan wrote:

> Add two Victus board names to victus_thermal_profile_boards so that
> selecting the performance platform profile enables the GPU cTGP offset
> on these machines. Both were tested with the patched hp-wmi module
> built out of tree on 7.2.9, with AC connected:
> 
> GPU power limit reported by nvidia-smi:
> 
> [...]

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/2] platform/x86: hp-wmi: Add Victus 16-d1xxx board 8A26 support
      commit: 42ae226dee4e506bec95f497421b3235a66a4341
[2/2] platform/x86: hp-wmi: Add Victus 16-e0xxx board 88EE support
      commit: ae4710d689c86029f6bea51fc444616c266190ce

--
 i.

