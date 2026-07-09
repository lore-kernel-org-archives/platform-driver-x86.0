Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66062C3244;
	Thu,  9 Jul 2026 13:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604082; cv=none; b=Zy+0Moqoj/H080LPouDH5cy4k+epyvxerdeEUUlVJIrmxkl8GvErEOyOIK/fyQCkZHzW8/ZkxXCuWV5jpltheymsXFg69TQ+MfLTM/GzRqdzT6CbvyrgX+lTMwyBfBwu+9QsRJ88SwMHcYwCLB+zwlSkzMmU2eHV1MfkVnTTysk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604082; c=relaxed/simple;
	bh=z26e9RNCOvxJ5tnaUhjYrDssQR10NxyLzm7b2CbdswQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=PmY+IguSpSDwxcNpHt2DOqg/Pug7SGlXNiMsjxR6wCXkCUHEpKzyYtEx5ceJVe4CFmPoEHv0Lo77xZqsft0iaK49UrKtrLgusXR8/PGvHf6YNtbQ1RMDMQtbK1ziHSAedhrzXFUfmMfBtQg2fvucgbRgfgoWddalf1AL4onsBos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DMq02Nlo; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DMq02Nlo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783604081; x=1815140081;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=z26e9RNCOvxJ5tnaUhjYrDssQR10NxyLzm7b2CbdswQ=;
  b=DMq02NloNA5HYc3gDyKeMAhraYl9w5ZFzK/bmG/GO4h4vxlvkLHWdmfY
   ZT9/DYSbFRiZ/FwJHY4EKjruPjUmf9/24E9BWC6tlE5AxjweJSwPQfiF3
   rFxxpUG71AZLYcDL4LP/12IJUeN0ZuUcYhLe4I7Ok61lSqjlvXJxRTXE5
   xkD/EVVTRtreDOBiX5J8fckMe4RxOOGnFYTLmeaylGZs9J+xCbjEFC1/O
   8HCGmuWyX9tmkMvU5fZbL5/wmvlazSjQdBQk2tvABnSHlyjg578PSZ+nQ
   6ZDvmdHTYVCjP+USoVze1iJh8gjTvhbhfMvoi62O4ebzvqdzMtLi+nQwP
   Q==;
X-CSE-ConnectionGUID: QUY2/Op3R6+BMLIAHyv3Ow==
X-CSE-MsgGUID: TOQVq1SOSSSvTLzDM9HN3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83258598"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="83258598"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 06:34:39 -0700
X-CSE-ConnectionGUID: BMH6IegSQsKSdLeEDQm5zA==
X-CSE-MsgGUID: 6Ho+n+j0SpmSjyW+6eKHcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="251935115"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.36])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 06:34:37 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 9 Jul 2026 16:34:34 +0300 (EEST)
To: Dave Carey <carvsdriver@gmail.com>
cc: platform-driver-x86@vger.kernel.org, Armin Wolf <W_Armin@gmx.de>, 
    johannes.goede@oss.qualcomm.com, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v12 0/2] Lenovo Yoga Book 9 keyboard dock detection
In-Reply-To: <CALPvRORKneYRyQXLQtqBTWWqRYkV5uP8e8cqpSQXYdLTb=BN9w@mail.gmail.com>
Message-ID: <13e7bbc0-520e-ba4e-70a2-4f222201511f@linux.intel.com>
References: <20260623125914.833063-1-carvsdriver@gmail.com> <20260708150909.23404-1-carvsdriver@gmail.com> <67a391a0-4bfa-f2f5-10eb-0a7f57e7ebea@linux.intel.com> <CALPvRORKneYRyQXLQtqBTWWqRYkV5uP8e8cqpSQXYdLTb=BN9w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-480114862-1783604074=:1261"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-480114862-1783604074=:1261
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 9 Jul 2026, Dave Carey wrote:

> Apologies, pretty new to upstream submissions.=C2=A0 Are you asking that =
I abandon this
> thread and submit a new v1 patch series?

That's not what I meant but submit v12 again into own thread that is=20
entirely unrelated to this email thread.

Currently, the recent versions are part of thread that contains the=20
earlier versions (see the thread overview towards the end):

https://lore.kernel.org/platform-driver-x86/8f84ca57-b856-4da0-8d90-e2be414=
f8997@gmx.de/T/#t

On low-level, it relates to what appears/doesn't appear in=20
References/In-Reply-To headers of the email.

--
 i.
--8323328-480114862-1783604074=:1261--
