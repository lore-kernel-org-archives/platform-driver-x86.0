Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FBD43784F;
	Tue,  7 Jul 2026 17:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783444114; cv=none; b=jRp9yKSfBVH7fg75kbitVn5tZ4dVxFnpFxuWvpTVZUzmRRS82pwshpknsZidEBIjuk6HfIn7cIYqacNF+dtCVaMGzrDd7qgk+dNjNXd88CyGuJ3tCmYSqzMs45M27G9VHcz283AJU2+RYDixk9Nwpf+ZmxZLbyUPE7DFPBCdTFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783444114; c=relaxed/simple;
	bh=ySTqM32BBJ28sX7IPzwh5FW0188JPIDNCAYPrFlYc7w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=p4PrYvQD8OBaCJolYsjokaAnNPGB/ZSnA34f0kq3rUy0uCAba7EfZQnKh5YWcftwY0eI+nS0AqtGB+J0Gw6HnnEWXBbaYzfknMsCfj6Yw38L9A/q6QWV5cZPT0wQ/sKtfmaUtf+Y1j9XkATEA18aI6hQwU/bTkHnpg4BxWhW66Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fvKWLsBV; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fvKWLsBV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783444113; x=1814980113;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=ySTqM32BBJ28sX7IPzwh5FW0188JPIDNCAYPrFlYc7w=;
  b=fvKWLsBVNATXVVgAvGmYqCG9iFcJOTUgg6hpeXRXSS1Wx/S/7sYbgBtj
   G21MgeYmj5YS/itpxZDc1ATTCh2DLOYQ+WNViluhmHWaHmgDi3n3QHzTn
   YlT9DkVqYvKNwyF5efMxogqPDHCyHz8vTRjOv+IBmHD6fGSMVZxEIOhtk
   aq8KAViEx/hu9RwfHjzHqCzfkh8eZk2uLnHaWMHfdtBNaLBP6dQcYyODe
   glrn+TAZGiT/hrmwdE6Z/LFN+bbGNI51XwyM6zKYCCiX80FmkFI189//A
   oEoSjrDy/VFeUZeu5Mfo7iq+Z5uTYFHVhY+KZP42zi1TUC0Os1ahs02d/
   g==;
X-CSE-ConnectionGUID: Nljx4oMnRU6STOOAvmXCCQ==
X-CSE-MsgGUID: HvpAbNLBQX6uLP7IMzsl2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="83208762"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="83208762"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 10:08:32 -0700
X-CSE-ConnectionGUID: Vnl8tQEqScKWpv8kaL4tCg==
X-CSE-MsgGUID: o844FFabSb+WcbxzkCFAEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="255978522"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.226])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 10:08:29 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Marco Scardovi <scardracs@disroot.org>
Cc: denis.benato@linux.dev, hansg@kernel.org, linux-kernel@vger.kernel.org, 
 luke@ljones.dev, platform-driver-x86@vger.kernel.org
In-Reply-To: <20260621123055.5465-1-scardracs@disroot.org>
References: <20260621123055.5465-1-scardracs@disroot.org>
Subject: Re: [PATCH v2 0/1] platform/x86: asus-armoury: Add power limits
 for FA401KM
Message-Id: <178344410549.17784.4592872846520341335.b4-ty@b4>
Date: Tue, 07 Jul 2026 20:08:25 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Sun, 21 Jun 2026 14:28:58 +0200, Marco Scardovi wrote:

> As Denis pointed to me, Assisted-by is used for AI contribution, while mine
> is a simple program to extract values. I'm gonna push it again as v2 without
> the tag.
> 
> This patch adds the power limits quirk entry for the ASUS ROG FA401KM laptop.
> The limits are extracted from the device's ThrottleGear XML configuration
> file using my ThrottleGear program https://github.com/mscardovi/throttlegear.
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
[1/1] platform/x86: asus-armoury: Add power limits quirk for FA401KM
      commit: 2729f12006f94b52238fdeda4a9aa4f3c749f218

--
 i.

