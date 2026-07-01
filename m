Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712CE25B0B3;
	Wed,  1 Jul 2026 14:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915103; cv=none; b=jiqzNv2NtE4JuduOCHxBS/DtIb9oiPT6XVvBf0sieUhgUSERTsZWsZQKJZRhTPzxk71GZnZvcKS7P1dS8iL9hoIH0aBVOG0o00iKnB2XJ5fRNhjQO4Kz2o1QMHr2kZ0dqynSKs/UX9nUiST6QZMWSSn1fZTzUeSy3+SRj6xf8lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915103; c=relaxed/simple;
	bh=Zcar/Aeoq3Wt8Cgu+AvgPp+NIwVrxWnx6Jta4nZlcBk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=I41HffrCwGBRlfU3EQSPktL2p06+8GZQXOkRREJugGI04KuviRHjJTYFm9WTWNcGammsRBTzvQnyLFje/1jP6aZseW2eVPTNrft0g2MItNuY6aSIvv4dbSZPSSExRZXxxIzjXxTcMD/ywiDxZMwhrLf52DadREWjZpcDcylOWys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lF06DqA+; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lF06DqA+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782915101; x=1814451101;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=Zcar/Aeoq3Wt8Cgu+AvgPp+NIwVrxWnx6Jta4nZlcBk=;
  b=lF06DqA+xz5i0nYS+G+SRTfybV9dstS6DsIwnijLyUCib0/kEO0s3AYc
   xMTfsDl4y9+RJUr3X3xMBCINuOJyd471MJbsnRy1LkG1s3774H3HWLRkr
   TmiyyXirIGOgQEPVxzE+/8K6FOxP7iz/CPRMhRxrAPOBKEoeCIG9z6XYe
   r7zBSVGcxlUuRJ4J06EeDl7CXjN/c1NEUNv7Cj3vvHtjmwrbhiVj0Hzel
   Tb2P/jsveptW01LtaCgkQ/xpcBOSPvPbZrlulINb8QL3QZBdxQjb0xvlr
   pSjiPm/t1XR/Vgwys0ytPHREeiKm9rNpf/6+02j+66wfFCZCZ/XKht0FI
   g==;
X-CSE-ConnectionGUID: RYkj5CRvThuHDj8ouA6JpQ==
X-CSE-MsgGUID: fvJSeZLkS02AENrtt/XJ6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="95032193"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="95032193"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 07:11:41 -0700
X-CSE-ConnectionGUID: CxwlTVg0QWqQChcPrKrIrQ==
X-CSE-MsgGUID: zbwtLnWaQJOmTkOtu6YCcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="250853550"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.83])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 07:11:37 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, 
 Azael Avalos <coproscefalo@gmail.com>, Darren Hart <dvhart@linux.intel.com>, 
 Hans de Goede <hansg@kernel.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
In-Reply-To: <fa7a5865-6dda-4305-ab48-e0c9310520c8@web.de>
References: <fa7a5865-6dda-4305-ab48-e0c9310520c8@web.de>
Subject: Re: [PATCH] platform/x86: toshiba_bluetooth: Use more common error
 handling code in toshiba_bt_rfkill_probe()
Message-Id: <178291509273.27495.12485253259223180167.b4-ty@b4>
Date: Wed, 01 Jul 2026 17:11:32 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Wed, 17 Jun 2026 11:06:52 +0200, Markus Elfring wrote:

> Use an existing label once more so that a bit of exception handling can be
> better reused at the end of this function implementation.
> 
> This issue was detected by using the Coccinelle software.

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent or clearly a regression fix.

The list of commits applied:
[1/1] platform/x86: toshiba_bluetooth: Use more common error handling code in toshiba_bt_rfkill_probe()
      commit: f3aaddb8a085eda92d4c9792e031ead8237f79aa

--
 i.

