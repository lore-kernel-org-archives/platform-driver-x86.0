Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0924451EDE2;
	Fri, 18 Sep 2026 18:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789756001; cv=none; b=i3xZwdSe/GCz09qYvqFW6hLkVorh0E+TWxmM9YWVomAGw6qSIPZb3H5ptr1SfnTWYDiZYbMdlcOEpVkbpboeaZvTVo80jV2+U48xJH9OZ2TUh45Lm2Vky18ZM1a3USHMwYJnNLMgTyVXi/xwycEXiwytCUJLU2j5e5AqsMQmzmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789756001; c=relaxed/simple;
	bh=Jr7vACxQO++TZICfq2eKEIlkGPq3HVQovx7i5Q8czhc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=chDu9sx81dspAfxgB7hX+QfXM7wMECGLAzVr1wwnB8jyip4pVsh2OA7kIB+LNzSCYXE3zPLpTjdUXPAmi0S58E8Dz2JXvKBxDRkIgrn01FNd+LA6XNbJlJyC7NavsTwBJoDzPIH2zm4F5TlQH+LvXwbgpoTtDOLNeAwXVGBde9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kEhjh4b6; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kEhjh4b6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789755999; x=1821291999;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=Jr7vACxQO++TZICfq2eKEIlkGPq3HVQovx7i5Q8czhc=;
  b=kEhjh4b6sGcO1FG9B5w5MoGcCclpJwoziP/vKHvtZ3Am1am4DZdjcPuU
   hXmHikDKPghozTVKzbNVcT9bGyLrTZK66CvyA7YBFpLdjzEh0UyWVR88Z
   GfLj4pQTxl5hYroMNX0p2Outfm5cqyfTxL5Hoz0ErcheC6KEX0hZAICs7
   m0zDLQqbB2VZtPfDNDzL6lndhmFQhbEPzqO07irl8VSHzfV0ykt8sldWK
   aunsJw3lC+yVybMOr4SBdYanqENeBXK5GRltP4HtC0MqUHkqhxFyqD5ng
   IK1gLGB040oHhaOT0h1Z7dTwWnCcwuiHwMZd7QhUk+Mgy2XR55RqI75cc
   g==;
X-CSE-ConnectionGUID: 0zXAqLtsQG628ltc2VmBZg==
X-CSE-MsgGUID: YOMxiYr4TaSxkdgsX4d9+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="107785192"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="107785192"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:26:38 -0700
X-CSE-ConnectionGUID: VEJkLCbVTMmR+IuAQ7ZQqQ==
X-CSE-MsgGUID: j4/MtvSJTcOMbomzZqoCKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="2727621"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.223])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 11:26:35 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-kernel@vger.kernel.org, Denis Benato <denis.benato@linux.dev>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
 "Luke D . Jones" <luke@ljones.dev>, Mateusz Schyboll <dragonn@op.pl>, 
 Denis Benato <benato.denis96@gmail.com>, Cymirk <Cymirk@icloud.com>
In-Reply-To: <20260910205032.153165-1-denis.benato@linux.dev>
References: <20260910205032.153165-1-denis.benato@linux.dev>
Subject: Re: [PATCH] platform/x86: asus-armoury: add support for GX651AR
Message-Id: <178975599064.29716.6399534335760250863.b4-ty@b4>
Date: Fri, 18 Sep 2026 21:26:30 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Thu, 10 Sep 2026 20:50:32 +0000, Denis Benato wrote:

> Add power limit data for the ASUS ROG Zephyrus Duo GX651AR.
> 
> The GX651AR uses the following limits:
> - CPU PL1: 30-75 W
> - CPU PL2: 38-80 W
> - NVIDIA Dynamic Boost: 5-25 W
> - NVIDIA TGP: 80-115 W
> - NVIDIA temperature target: 75-87 C
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
[1/1] platform/x86: asus-armoury: add support for GX651AR
      commit: db6a60250696b888ac7c291af2369827d2269f34

--
 i.

