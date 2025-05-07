Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DF91DBB0C
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 May 2025 10:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746614219; cv=none; b=bAloWrIVkrjHakVZ6IJoOaREt53CJ/gjuLjv73ehuEO4p+vQ99X8tksllcSQaiU9W7CXL/dumUjPX9m65I4+n+yohBxpZQLFuawHbuLenIiL3kU9Aelsv4yA440EWE9SbalktzCCrOnCXOFj8AJ+PTwp6zkXEWbtknhCy9vwl7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746614219; c=relaxed/simple;
	bh=nzAn+Tna83EcONyCE4ZRWLzd11cV85Gpw3Zy1vdqR44=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cI/XA5bIUi1QWTY+tIukgWv4KE3wchhCfX5vVudU/hPNUL9NYjRchftKZfxhd5ztk+73pf6CpFUI/3XuscIpfWiqKA0lkn4x4yEslir67cBnbmDkXM/4HkDzH1FQmQBh2YVy+sho9nR7HMZR2V9czsGqqPyXhZ0SO+XFGDpZUv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XG47rwO8; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XG47rwO8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746614217; x=1778150217;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=nzAn+Tna83EcONyCE4ZRWLzd11cV85Gpw3Zy1vdqR44=;
  b=XG47rwO8PdNJVg2uwFkm23Q4ARDZJ0glEcpfY62C+eeSAKPAY2fjF13b
   4SJmRWfz1gRM2qAbkzv55IdqU+lJefRBado1CLTawrIb1qIpFzv15OD+i
   RSuux8RYLRnUUB5qax34fzBuknHqMisLhzmsUNyFuyzvaMbKGIjNs+yj6
   Sbkg30b31GrV7QiBekz8AlCyuZOP9yMBaXaw5IZM1l5EkhqbmPkMSC3c4
   KrWJJLN/gga8Q7ujxtCXLSfcKYgkVwJcjfTn1zdUue7wQh48dgC895ffk
   oKJCxtyDgi3itpufjRVU458sjssa5K2mr21RJqdM/id3O2GLKgkqOrU1l
   g==;
X-CSE-ConnectionGUID: EJTFiGMdRTWTeELUPC7V5g==
X-CSE-MsgGUID: yjLPitrqRYGRooEe02f/7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48239617"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48239617"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 03:36:56 -0700
X-CSE-ConnectionGUID: Dzw+Bs8RTumwHdNJ9Hbe/w==
X-CSE-MsgGUID: 561nvWnwTrK49FvWJdR1ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="136438689"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.30])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 03:36:54 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hdegoede@redhat.com, Nitin Joshi <nitjoshi@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, 
 ibm-acpi-devel@lists.sourceforge.net, njoshi1@lenovo.com, 
 Mark Pearson <mpearson-lenovo@squebb.ca>
In-Reply-To: <20250501123607.14171-1-nitjoshi@gmail.com>
References: <20250501123607.14171-1-nitjoshi@gmail.com>
Subject: Re: [PATCH v5] platform/x86: thinkpad-acpi: Add support for new
 hotkey for camera shutter switch
Message-Id: <174661420874.2744.7807324657929158064.b4-ty@linux.intel.com>
Date: Wed, 07 May 2025 13:36:48 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 01 May 2025 21:36:07 +0900, Nitin Joshi wrote:

> New Lenovo Thinkpad models, e.g. the 'X9-14 Gen 1' and 'X9-15 Gen 1'
> has new shortcut on F9 key i.e to switch camera shutter and it
> send a new 0x131b hkey event when F9 key is pressed.
> 
> This commit adds support for new hkey 0x131b.
> 
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: thinkpad-acpi: Add support for new hotkey for camera shutter switch
      commit: f8423d0ae55b51e2729afa2c40e5c3bf8a0f6455

--
 i.

