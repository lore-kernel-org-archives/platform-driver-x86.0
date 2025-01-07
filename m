Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129F21F37B9;
	Tue,  7 Jan 2025 15:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736265596; cv=none; b=PMDvJh1O2R6pBCNBEAjKXKwE3gWdFabCBFNWTKCMNCsGmruSINzYAmmJ6CIDIJgOjElYf/Zm3kogw6ifqk0MexSlLu2fSq24HaZVgJ31r+mjOTt4/nR5lETMjk7rBPSmIn3JZpN1FehQPZy9Pt63Sb2oxcoCP+T6AwF2Jna0qng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736265596; c=relaxed/simple;
	bh=voV8tgjl3z1IHhgaXegcLcvjMCRU0JVAYWcckp7oxQI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pPwyLqa9bdFXCh+gGX8cHfTcHKQRfYQLsLElyvMkW6gtFPtRZ0GvekS4NLn/+6uiAlubpmVAmQQilY3bsVOm9WcojF5tawh58oONYFS9hPmqOniNkrz9xi4w+DCKMvBnM6t+Bm19brzfqjLc3V2RpwmryD+G55rVpzGUqRROOfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dFc0oTL8; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dFc0oTL8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736265596; x=1767801596;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=voV8tgjl3z1IHhgaXegcLcvjMCRU0JVAYWcckp7oxQI=;
  b=dFc0oTL8rtp8UvuaJNFHJ0UfMW3hE7zOqhdIQ0oqhwxf7ms7xxS25Lou
   JkUdZxdg6TBwizAcB+BKRb4JdDciOc7V/j7hiKw8NZ8Vx+9BOKtB3wIjQ
   3F2LI50Pp7VlElXd+pvFHCoJ1jdYCz1m4I9FL0P3uEFZFdeuUANpkmoya
   B1ACvuVoiDUxzoUVgX3ROPmDaxU+MYc1dpXjo6pky6K/RLawyp40+mjKB
   r1NVF7gAI90pdT9i6D6hQhfRog1C5/hr0L75kNHdP6UUGHki9BCzCBmga
   Sh/fD7cDoibDxoRvRtaKzwfnvjdHshOlPr2YkOC6icJ4CKU6qF1GdW/P/
   w==;
X-CSE-ConnectionGUID: EFJ2RnWISIOll007wmQKZg==
X-CSE-MsgGUID: XmC2Baz/SJig71tsowOMOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="40224322"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="40224322"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 07:59:56 -0800
X-CSE-ConnectionGUID: szo4kjssQISE0vA6udYghQ==
X-CSE-MsgGUID: qgoG9kZZRNuPbYpcRkwilg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106825289"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.206])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 07:59:53 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hdegoede@redhat.com, 
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250103155255.1488139-1-srinivas.pandruvada@linux.intel.com>
References: <20250103155255.1488139-1-srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH 1/2] platform/x86/intel: power-domains: Add Clearwater
 Forest support
Message-Id: <173626558868.4330.13440205156277882733.b4-ty@linux.intel.com>
Date: Tue, 07 Jan 2025 17:59:48 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 03 Jan 2025 07:52:53 -0800, Srinivas Pandruvada wrote:

> Add Clearwater Forest support (INTEL_ATOM_DARKMONT_X) to tpmi_cpu_ids
> to support domaid id mappings.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] platform/x86/intel: power-domains: Add Clearwater Forest support
      commit: bee9a0838fd223823e5a6d85c055ab1691dc738e
[2/2] platform/x86: ISST: Add Clearwater Forest to support list
      commit: cc1ff7bc1bb378e7c46992c977b605e97d908801

--
 i.

