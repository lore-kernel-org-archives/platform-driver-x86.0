Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2721AA7B7
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Dec 2024 14:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733839405; cv=none; b=c51Hn6UGEqTYl5ardUx7ikty3Zn+xSdmM75UhMYo5/SoyznG34EUKS5gUFgb+FGhoGDRII9yKlDYKsNrE1mzRvs5QodvXMpftOTgPe6QU0deMi2EeRbtQ+hgZ9qWv0tyNztpnj+cGhsx+IfXlY1u0t9eXgjhUnnEd3d0PnPWvd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733839405; c=relaxed/simple;
	bh=bwxU6mxzreZHhSDwvzb5H1rSe/6lFZxmNaAdoACAIss=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nO91qVpD5w6Le0GCsRyLZ5fMVXdYTWuBFvEuPHW37aJ5NUuN/bI6ywQ+3l2MgICll0kU0J/XhR7QTxSrjNlWiTPgXvBIGJ9JckJLA0oEzLekW7GDdlep9gCMGrLzxCI40UfFZPOq58QOC8A8cQ2CVkukNSc/7i0uHMhacN0FbVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ng88KRvH; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ng88KRvH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733839404; x=1765375404;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=bwxU6mxzreZHhSDwvzb5H1rSe/6lFZxmNaAdoACAIss=;
  b=Ng88KRvH0mnsb+IQC7fL7Q50K5tp7EptmWhLW+guDwdq3uePFH4Y4wSd
   /OufnlooJMuVXa/CWrPDfadI1eY0vqRux0dqazcMzwjK1aJo4lFBKVh2s
   w2IZP7wG12WohWg70GP44n8DCzTjPxfVhqKh6Do8lZGs321u+OKinfOJ0
   1KLoGgmrAs79qqYRfJcgMLteUz7XxDvjbYcPPsdjdxfkdTEOya1PecqeW
   FazAZ2XWalbiLor7Z+5jfSOXbH8y0opCA1HgZOXDe/8zJ0c4MEI70DjN1
   CedTmzkJ0RcOvQXXjOjeiBV1AbvBBg0ZQIq6qyny1PXgzo7G4nF1B56uL
   Q==;
X-CSE-ConnectionGUID: cSijwUXNSHePeoCqVSDkGg==
X-CSE-MsgGUID: JsGyvwBXT1i570FwQxe5xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="33912635"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="33912635"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 06:03:24 -0800
X-CSE-ConnectionGUID: Y3zWBas1QnmRYelnsiyagg==
X-CSE-MsgGUID: 3pC+WbnjRCSk6erIMKW7lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="100226160"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.56])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 06:03:22 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Cc: platform-driver-x86@vger.kernel.org
In-Reply-To: <20241204193442.65374-1-hdegoede@redhat.com>
References: <20241204193442.65374-1-hdegoede@redhat.com>
Subject: Re: [PATCH v3 0/2] platform/x86: Vexia EDU ATLA 10 pwrsrc and
 battery support
Message-Id: <173383939842.11345.11201595718542170160.b4-ty@linux.intel.com>
Date: Tue, 10 Dec 2024 16:03:18 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 04 Dec 2024 20:34:40 +0100, Hans de Goede wrote:

> Here is v3 of my series to add support for having the bytcrc_pwrsrc driver
> register a power_supply class device and adding a new driver for battery
> monitoring using the Vexia EDU ATLA 10 EC.
> 
> Changes in v3:
> - Use I2C_SMBUS_BLOCK_MAX instead of hardcoding 32 bytes as bufsize
> - Add UPDATE_INTERVAL_JIFFIES define
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] platform/x86/intel: bytcrc_pwrsrc: Optionally register a power_supply dev
      commit: 0130ec83c5535b034a96284eb9f31b3b5373d207
[2/2] platform/x86: x86-android-tablets: Add Vexia EDU ATLA 10 EC battery driver
      commit: c78dd25138d104f94ddeab5248a5efe4504f205e

--
 i.

