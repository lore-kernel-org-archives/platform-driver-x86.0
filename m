Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DDD3054DE;
	Fri, 28 Nov 2025 10:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764325548; cv=none; b=ptBJcQVd1uf+GkFQ3MFqN4BE9Wvr/zeW8/nuHSoX2bpXJbTFzAosfYg2HIdg8nwD+R6y0Qc93rGENsZ/4vAPBJB1LivEZUJQKUNcdeg6ttIC/jefh5XwqwmeiSTelvxEm+7CNjkvaRf4CXKb6mZ+lIoYvRo+mBOagDBUzVTpUnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764325548; c=relaxed/simple;
	bh=LJh4UeY/c0J50iP/w13Q/lM3sXEI7UEkN16wXFCNc7Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SwkuDMwYNHEo31eG9hK/MzMJkPltfVR0SxgUJ5j7CN+MfKd06hEVJRNNbrH4Wji13xrEoa0FpqctDOdW5guiZpZuMYogYsg47kEMJLVRdi23l83AKAutGCw54GUoafEihtpjBzarlojFHumPlN2+qSZqqrUt4CkuRuis+Wgfm7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FZixFaIJ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FZixFaIJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764325547; x=1795861547;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=LJh4UeY/c0J50iP/w13Q/lM3sXEI7UEkN16wXFCNc7Q=;
  b=FZixFaIJut+v/Ybm8alR2WkZ0QIYHYGQNhWPPQQUpQ8k5O5AI5wkIgSS
   cPlWfyDenrk+iH5p9tEoKlcWecaP1Z/cDwxj55MPf5+HwcdhfZR0cfvi0
   AiWBQmTWTMpfxdFGNlVoTNzl+2c9/rDqkJp941tjdWjxcySjXXk8Cibxb
   yFi6EeaTt+fv1bmz57U7d5zr5blkoiSbosYCQPflFNJafdcmEroIL5tUF
   fzWf+A20czqSl3nwupkt4E7m6pXL5LUg3L2cFgplHePzBC1nKZbnMcQ+s
   MbMyzv+3i4jrApXX4qt1s9AfpuXr7l0OMU8a2YumSu45k3WOtYQ2dcrMb
   g==;
X-CSE-ConnectionGUID: rEJnUgHQQuusAtE1V3CPOA==
X-CSE-MsgGUID: rDhWuf66T7er69MgLKcniQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="76991362"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="76991362"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 02:25:46 -0800
X-CSE-ConnectionGUID: XLMK5tJyROeynGPD49rzYQ==
X-CSE-MsgGUID: Bdofaxc8SlyOp0pUzFdTFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="197762329"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.229])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 02:25:43 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 Marco Crivellari <marco.crivellari@suse.com>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Michal Hocko <mhocko@suse.com>, Maximilian Luz <luzmaximilian@gmail.com>, 
 Hans de Goede <hansg@kernel.org>
In-Reply-To: <20251127144125.233728-1-marco.crivellari@suse.com>
References: <20251127144125.233728-1-marco.crivellari@suse.com>
Subject: Re: [PATCH v2 0/3] replace uses of system_wq with
 system_percpu_wq, request alloc_workqueue to be per-cpu
Message-Id: <176432553810.7427.15425497321285301181.b4-ty@linux.intel.com>
Date: Fri, 28 Nov 2025 12:25:38 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 27 Nov 2025 15:41:22 +0100, Marco Crivellari wrote:

> This continues the effort to refactor workqueue APIs, which began with
> the introduction of new workqueues and a new alloc_workqueue flag in:
> 
>    commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
>    commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
> 
> More information can be found at the link below:
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/3] platform/surface: acpi-notify: add WQ_PERCPU to alloc_workqueue users
      commit: f03dd5dd736d6aea94406a273be2a10f84bc60e1
[2/3] platform: x86: replace use of system_wq with system_percpu_wq
      commit: db4399501c58ad1225105224e7c9f03bc3d4fe39
[3/3] platform: surface: replace use of system_wq with system_percpu_wq
      commit: f720239ca39d72657e1bbf9c4c6270c78f548e43

--
 i.

