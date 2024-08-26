Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173291514F6
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Aug 2024 11:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724672654; cv=none; b=UuxlnxsAdgnxMUUgtRoHw5kJ3iNIkgUrpYcZSG1JSK5QQ9Q5zbHPW+XpE81z+2PC+JTUWzacg8+76nA8WJuJehJwkx4CT50kFcZGI3FClbVyeO9GzPgoSPY26JFSKk/OBHpbujTtgEnpTZL97xdaYjaVhrA7ufmRC0i4RhldRtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724672654; c=relaxed/simple;
	bh=Qx9ObpWoVfNDe8BU1lZmBb2k1zFp78OvJ2CRLM8QlI0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ne57P4PCYmws4cB6pL2R/rdRfM/SCg7VhruMfhn/aa0652sZw2Ly9/JZZb8ishTgtIW8W2P+v803xL1y7zhyE7z2KxxfTPiifNxO9dnMJ50VgcVRQmuNReRr+2lme1sGTdx4EFQRXiau+zWU2XgyOHgYF0vrPlM7pG5QHZELOuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LAtU+Tlj; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LAtU+Tlj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724672653; x=1756208653;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=Qx9ObpWoVfNDe8BU1lZmBb2k1zFp78OvJ2CRLM8QlI0=;
  b=LAtU+Tljv8i3VhvjhmEugNsi2K1EI0KZES5rTQ170S+wRSuPfvCma6Zo
   pBlN3uKA3s/V5UFil958Onf79N6qRY+e38gIsqrkjZvzxWg/9eNYWhmk6
   q9bG3IULcTcykZhGAEDgLwYExlaN1Il/G13JRUQSJsHty2Yg+Y4p/yLHZ
   EDCWs7lTT5KAngAYzi14ljx64fPNV1ieNCSJbId9iRz2pBQufFzlvfRQ7
   D1bQH9tzS68mHPxng8sgus/oRpVyZu1jRPmJKiaZqrS4QFR9l/rcThbDf
   PYP3M1kIRfi0t9m1EYxcdc7t4mTPfReV/hvNg7zE7R34DgQrPIm7Tx7jk
   w==;
X-CSE-ConnectionGUID: pZNCU2SBQOapYmoC3NkbKg==
X-CSE-MsgGUID: oN5WW6HJTxe6J/d34ze58Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="22611129"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="22611129"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 04:44:13 -0700
X-CSE-ConnectionGUID: YY1PGPlzSOW0tcZG2gGnww==
X-CSE-MsgGUID: KliU7N+vRJ2uEGGOXDfhtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="85667421"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.174])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 04:44:11 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Cc: platform-driver-x86@vger.kernel.org
In-Reply-To: <20240825132415.8307-1-hdegoede@redhat.com>
References: <20240825132415.8307-1-hdegoede@redhat.com>
Subject: Re: [PATCH] platform/x86: x86-android-tablets: Make Lenovo Yoga
 Tab 3 X90F DMI match less strict
Message-Id: <172467264600.1877.2642073511674256627.b4-ty@linux.intel.com>
Date: Mon, 26 Aug 2024 14:44:06 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Sun, 25 Aug 2024 15:24:15 +0200, Hans de Goede wrote:

> There are 2G and 4G RAM versions of the Lenovo Yoga Tab 3 X90F and it
> turns out that the 2G version has a DMI product name of
> "CHERRYVIEW D1 PLATFORM" where as the 4G version has
> "CHERRYVIEW C0 PLATFORM". The sys-vendor + product-version check are
> unique enough that the product-name check is not necessary.
> 
> Drop the product-name check so that the existing DMI match for the 4G
> RAM version also matches the 2G RAM version.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo branch. Note it will show up in the public
platform-drivers-x86/review-ilpo branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: x86-android-tablets: Make Lenovo Yoga Tab 3 X90F DMI match less strict
      commit: a3379eca24a7da5118a7d090da6f8eb8611acac8

--
 i.

