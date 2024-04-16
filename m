Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3856B12BE9E
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Apr 2024 12:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713271453; cv=none; b=XqfLXeqYj6wblfmEEiQD0PziEb16wrfrQbHKcpy4NlU4clOqFVrzs61SVcJbDAr4dJvQ+Bb8RgtJN2efp0Oyho5F2Yihc9vYLfbbGCoRgjDmYwODWUK7XjdChjm7jnYW1Fv9VTPzijovTAO8l4KTqmtE7P+FY5vQPe/orpTkgiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713271453; c=relaxed/simple;
	bh=alUXWcO0Em/Zsly+9I1gddJQ312qHP+dx/yW23dkGZc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FPPaBynF/nmd9q7B6hXp6JxPdWQf+yIpwNCvdfp6iZKHhIkYYtrmF918xWqxMy5XBdvCHm8RdopCujDrGcnzOUm7nRGZLL4KWZZbN/UaY11WAE0bp+r2Cpqy7E1XJjtHwIdwGpHfbcU6jYiFyc9kXVlVEDOCpEWWVc4nYNr18P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L2GTF70w; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L2GTF70w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713271452; x=1744807452;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=alUXWcO0Em/Zsly+9I1gddJQ312qHP+dx/yW23dkGZc=;
  b=L2GTF70wz1v6qAenGhJzARos9nOFUrEH7Zl+YdgaPRqphtjZTrixkFhJ
   bkeq8txxqAVyMCN4SGWZ1FmIHnN4O53e8U2wMl0TEn81Uj3TxMbWGOrLo
   xOFd4bM/xEBPfwuUfknDIuwyRjRKtq3Xn5X/q4zA4153Dn3Bm/1VIHDK4
   JXyeWLQPP3LySlzmMiphsN6i6RFhPHwRWYq8qA0+YBxFwt7fHLAbpxipq
   OnPIm07MjCnh+NmRN9N+Fu/V/8gCCG9oylDdek3TyLlnw6BTBjPPuhEDv
   3GuCXhXklu5i9DO3ZQ3aSz+MHh2gwC50We++dputw0MsZ0dOwjCL/u5tF
   A==;
X-CSE-ConnectionGUID: Kwg2mhefRdaWpEuyX4HPRg==
X-CSE-MsgGUID: kOVdp1bsTIeKJHYfmKwHgA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="19308781"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="19308781"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 05:44:11 -0700
X-CSE-ConnectionGUID: /EaYHw3BTnOWAHwszJLFFA==
X-CSE-MsgGUID: rEtZEXTzSQSAhkhYXJVpSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="59699182"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.34])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 05:44:09 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 Mario Limonciello <mario.limonciello@amd.com>
Cc: "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <20240410141046.433-1-mario.limonciello@amd.com>
References: <20240410141046.433-1-mario.limonciello@amd.com>
Subject: Re: [PATCH] platform/x86/amd: Extend Framework 13 quirk to more
 BIOSes
Message-Id: <171327144171.3806.12861126838321364062.b4-ty@linux.intel.com>
Date: Tue, 16 Apr 2024 15:44:01 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 10 Apr 2024 09:10:46 -0500, Mario Limonciello wrote:

> BIOS 03.05 still hasn't fixed the spurious IRQ1 issue.  As it's still
> being worked on there is still a possiblitiy that it won't need to
> apply to future BIOS releases.
> 
> Add a quirk for BIOS 03.05 as well.
> 
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo branch. Note it will show up in the public
platform-drivers-x86/review-ilpo branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/amd: Extend Framework 13 quirk to more BIOSes
      commit: 978af6121b4b000befd9a45f5b65c00e39920273

--
 i.

