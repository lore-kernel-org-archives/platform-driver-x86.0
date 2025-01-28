Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7900285270;
	Tue, 28 Jan 2025 12:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738066857; cv=none; b=a0E7XmSlaBelYnynuUM8o4S8ET4Di7Bq6DPcOYywjNGT8zn6bepbr4P9YVHoQY7YloCYX5xMNBsrwnd6G6P+tDqW9ObEtDj5+V8ADF/mHNRdR2Mcj1uGdsRrYHqD5DEA24ptBwnNhcnnSgZylviHxLZs7e+/sePSrjfR0br7vvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738066857; c=relaxed/simple;
	bh=IHQP/CGt8nkFJwaDasrNAEFo1IrKaXZf+aQalbhGuqM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QPIPAW8rrBspF45GIDdlq6xK+ueuxZtYyvyQJLuL6vcZzfdHME65SbRxXdtQ7CTuMqTh74RJGSfZQU7n1iUiAG5rwzRA/vt8wq65GxYgeSI+O3KK0MBkkvfsH0HsYM2/HOC2GlOGjiOpd4TLJ4BkjcowP5MorifWhcGfhO/TPps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ctzNFoy3; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ctzNFoy3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738066855; x=1769602855;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=IHQP/CGt8nkFJwaDasrNAEFo1IrKaXZf+aQalbhGuqM=;
  b=ctzNFoy3HThy88Dwg2afDNsjgn0WsMWuvg/DoTkNe1BXVMjZGcSG1DEy
   0baD6fDvgUO1AgOKMd4b46hnGDQEpJshmhd9fZGFbNLYI5ZiAMDOItJh7
   xiP3/kt8UrL+zquL+nkxmqgr58BKP7XHeSRN6w9f/nwgk7F6iwxmXn46b
   h1DGnKFlDW4KbG1MnIB0DfJYrQRhQyO4ApfRAAdXfny0L4/p2vqYN5zcz
   3/I3FdZG870yCP9Tv5Yx9bYHbxN83gMuViTUoSPV1YV3VRWlEEw8l0iZH
   UUnZ3hkO5EWO19yik+UDr9twoUkpqiuvDWuNGcge9+/R+jkzrMggbIsGu
   w==;
X-CSE-ConnectionGUID: wq52BszkSsqcWUZUI6DbZQ==
X-CSE-MsgGUID: uaWhrexpQLS79eh+C01wuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="42306050"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; 
   d="scan'208";a="42306050"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 04:20:53 -0800
X-CSE-ConnectionGUID: pyWvQuhPQN+ecfaMP3qusA==
X-CSE-MsgGUID: MXq/+GgDSuKiTzMFMxxy9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="113696807"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.53])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 04:20:50 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Ike Panhc <ike.pan@canonical.com>, Hans de Goede <hdegoede@redhat.com>, 
 Fedor Pchelkin <pchelkin@ispras.ru>
Cc: Kurt Borja <kuurtb@gmail.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 lvc-project@linuxtesting.org
In-Reply-To: <20250127210202.568691-1-pchelkin@ispras.ru>
References: <20250127210202.568691-1-pchelkin@ispras.ru>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: pass a correct pointer
 to the driver data
Message-Id: <173806684396.1748.12048181273043599788.b4-ty@linux.intel.com>
Date: Tue, 28 Jan 2025 14:20:43 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 28 Jan 2025 00:02:01 +0300, Fedor Pchelkin wrote:

> devm_platform_profile_register() expects a pointer to the private driver
> data but instead an address of the pointer variable is passed due to a
> typo. This leads to the crashes later:
> 
> BUG: unable to handle page fault for address: 00000000fe0d0044
> PGD 0 P4D 0
> Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
> CPU: 6 UID: 0 PID: 1284 Comm: tuned Tainted: G        W          6.13.0+ #7
> Tainted: [W]=WARN
> Hardware name: LENOVO 21D0/LNVNB161216, BIOS J6CN45WW 03/17/2023
> RIP: 0010:__mutex_lock.constprop.0+0x6bf/0x7f0
> Call Trace:
>  <TASK>
>  dytc_profile_set+0x4a/0x140 [ideapad_laptop]
>  _store_and_notify+0x13/0x40 [platform_profile]
>  class_for_each_device+0x145/0x180
>  platform_profile_store+0xc0/0x130 [platform_profile]
>  kernfs_fop_write_iter+0x13e/0x1f0
>  vfs_write+0x290/0x450
>  ksys_write+0x6c/0xe0
>  do_syscall_64+0x82/0x160
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: ideapad-laptop: pass a correct pointer to the driver data
      commit: 9a9b61337751ed9e6827b467771f6e880b5c733c

--
 i.

