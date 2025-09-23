Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C743191B4
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Sep 2025 09:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758619644; cv=none; b=T4GqKU/ja2BsK071ojg13cFkhPpdJw3ZYBEmeHztRD8C8yiOw4SOuYSiHZyuwDZYdSjImtoa9OUbATFyVfpkDub+I34ZH7ivb71SOK9U0V4BxhhVtWwGubpyO6VXtbEQ6HKrUq0F3NpUaspl134FR6WUEvJOvTe8wasQBnh/I7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758619644; c=relaxed/simple;
	bh=nmbCGoz182kwhKb2SYQ5Qqf4ell1Ha+NQeNKrsal6QY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JCN0XSRcpdo7ClEsmKD2vcIVmAXWy6AYTpt4/L6ApbdNK0JHM70yf8YXj/DidRF/4Zjq8q4Hq0VF/sGSHv4YhUVb2nE44T2PDh7yg3a/YnFzvIrF6HQ0umqn04KPg5wae9+VQ6/MJPDzLkp/v7ldXIlgllDs4SOsW6IgjxDxK5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FLwRSzKF; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FLwRSzKF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758619642; x=1790155642;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=nmbCGoz182kwhKb2SYQ5Qqf4ell1Ha+NQeNKrsal6QY=;
  b=FLwRSzKFKCn4ySxptZRSwtxRi3mqvgxB/7gaohfs3izlqFqPtByk5IFu
   K48RRkkuhEvk1d7nYYFTuOFMf9Cn218gmTK9xVUUP8afbD68lvak8+aNd
   WlnJHhIR/AA5Trj7mLYrYZBjpv/NEEg/wsawqHDlqzkhxuptnmV5r1yCB
   tmCFB3ybSSaXxNC3HBPkmWFFdEM9eCRTw4p9YitRzTzvyPAXIGN+jPQ8Q
   FWsq5JougkuJ54fO18Dpunq0fFqa5diMS12sAv+Jvrbx3o1NWjtNf7wqm
   WynXqqOgrmTLDJQb4PO5b+Nl3jdLLAsYPVsNGEP9RiNZHEW22zhmQ7wFZ
   Q==;
X-CSE-ConnectionGUID: q1080wLbQNWaXFGVLTAtiw==
X-CSE-MsgGUID: OIWminCvRvWGlS3UluKWNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60946375"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60946375"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 02:27:21 -0700
X-CSE-ConnectionGUID: bCrbjotpRQqEiJrkRHxuDg==
X-CSE-MsgGUID: FvS9mRopR8yWW0jm8DOS9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="176300628"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.234])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 02:27:18 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: lsanche@lyndeno.ca, Hans de Goede <hansg@kernel.org>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com, 
 mario.limonciello@amd.com, Yijun Shen <Yijun.Shen@Dell.com>
In-Reply-To: <20250916115142.188535-1-Shyam-sundar.S-k@amd.com>
References: <20250916115142.188535-1-Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH v2] platform/x86/dell: Set USTT mode according to BIOS
 after reboot
Message-Id: <175861963337.17451.684255698191618037.b4-ty@linux.intel.com>
Date: Tue, 23 Sep 2025 12:27:13 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 16 Sep 2025 17:21:42 +0530, Shyam Sundar S K wrote:

> After a reboot, if the user changes the thermal setting in the BIOS, the
> BIOS applies this change. However, the current `dell-pc` driver does not
> recognize the updated USTT value, resulting in inconsistent thermal
> profiles between Windows and Linux.
> 
> To ensure alignment with Windows behavior, read the current USTT settings
> during driver initialization and update the dell-pc USTT profile
> accordingly whenever a change is detected.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/dell: Set USTT mode according to BIOS after reboot
      commit: 2c61c45af153243baf591a77ec187be2b9cfe302

--
 i.

