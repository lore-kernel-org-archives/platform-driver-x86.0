Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71603F9F48;
	Mon, 11 May 2026 14:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778509367; cv=none; b=o6Z2nwRZ+q80USGFGJt2yD4LYLDWvGr23Yyq3hRODeKsST00KtHR/fL3qZySsQfzknxYyo98qc+1/XeoyhIM5upeftlONAFZcBb0mHfyvcIhxGjIYIOV4HeiGmF8kxU6ndRvxdyDWEXzHN4/gluvCnKxfdrY9vYnbCsvmMutv80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778509367; c=relaxed/simple;
	bh=5v9GfqkbotNz1ccUL9cYV30Ru9w2m6sQjlIfQiH4SEw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pazqcbIS7bbJ2bYIKKw/dEO6Hq6U+unz2BIqwCxWUHKGYpb7Y2LB7lmavbQqCjBeUG72mDwc23t84+HKgIXvBVh+fYUv6fI3eUZPR22+WC898nqZ0vZ/uOwIUWYVccuYcCzE3vFb564kQvQkHqIaCqd+riDPYYQoXQbrU5yLHyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=avEaXUWw; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="avEaXUWw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778509366; x=1810045366;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=5v9GfqkbotNz1ccUL9cYV30Ru9w2m6sQjlIfQiH4SEw=;
  b=avEaXUWw3bVPvzbyoJK41c8TjQpN8UR9YLKp7lopWqRdD4TY9GCjl4ey
   HFMYiSvs5LhG+GdhCpHWF9ppql+Qmxmbs/RD8qmDjP7WByB464WcCQvv1
   B7eg9rNeCEJ1jGo+kXX5tgqfSyQ+1Op/ISQOdMd3P61WtPxm96vDUGhK/
   z/9NGquEoNCecSZu0kW/8bqgz263HdqekuXiSvwAvjio72baumgl7fdzv
   LIDGfs2ciG50r1UCbU/g1/DxG9nyjCKYr7zLtuKwhqJSeUFhO6hivnqq1
   TMVZ2O3rxKhzZyvqRdbPy1lewMBi6mYu3WUuX/VP73KKNEp53OGA+Wr1q
   A==;
X-CSE-ConnectionGUID: tRK0JbtXQFKUBN4geSFw1A==
X-CSE-MsgGUID: wysAVjHVRBSVErwzLO41RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="102059202"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="102059202"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 07:22:46 -0700
X-CSE-ConnectionGUID: dNHUAg1RSgGjl4WvwwwTNA==
X-CSE-MsgGUID: CTilTqicQu6ECQ7cZSWOIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="237689777"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.28])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 07:22:43 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Markus Schneider-Pargmann <msp@baylibre.com>
In-Reply-To: <20260507155025.3186956-2-u.kleine-koenig@baylibre.com>
References: <20260507155025.3186956-2-u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH] platform/x86: pmc_atom: Use named initializer for
 pci_device_id array
Message-Id: <177850935972.20649.14704316844002988328.b4-ty@linux.intel.com>
Date: Mon, 11 May 2026 17:22:39 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Thu, 07 May 2026 17:50:25 +0200, Uwe Kleine-König (The Capable Hub) wrote:

> While being more verbose using a named initializer yields easier to
> understand code and doesn't rely on the two hidden zeros in the
> PCI_VDEVICE macro.
> 
> This doesn't introduce any changes to the compiled result of the array,
> which was confirmed with an ARCH=x86 build.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: pmc_atom: Use named initializer for pci_device_id array
      commit: 3b95f36464ec161bcf14c5d1e5f9d5d5e9464582

--
 i.

