Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA6C3E7BDE;
	Thu, 28 May 2026 12:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779970297; cv=none; b=Fqnw6CSAc2f4jigaE3b/yS7/i6bnw8l+mwA30hWFCwp30oLlI0Y/cqnHI4N5pgBzfXOE4OhgplzGgvpk630JOcLj6KqynONK9p+Wcl1l3nVQ4r+TrjqoPhhxZ09fYiC4e+d0s56cEGoofncyxQBjyQ6TU2TJ3XaaUbOrqbS9fSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779970297; c=relaxed/simple;
	bh=VYZfOSY2QG5iDPp2rkY6o6O1yUJ6PMejKqMvTdvNbpk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rKZ9W0TJSMk2wxic2HCTetJov4fQI3g60XZGoXL33l+yI587Rpb90Zvwi7IgxfvjuN78Gm4avzPPDihi/UtiBlHSQoMk51SG7H0KBxc5ljey0aa3JSMHNRnF0E2V7Bum+vpRLiY+qVuN5Me1lkUMJaJBCkEf9+mAYF5y90CIriY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fzdBfAJ0; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fzdBfAJ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779970295; x=1811506295;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=VYZfOSY2QG5iDPp2rkY6o6O1yUJ6PMejKqMvTdvNbpk=;
  b=fzdBfAJ0C0CCEW1iZN6lvmbZH8R3Te0ikBcFdATfKvwPWeE0+o5SAHWY
   H3y3np1SKZ6MXjtOHWXaR39+zLxnTTwflQyUWxdXG8CE2w4XpbHLI5a04
   HBTudCRaxuyKQARrwylJZlRt3VefZ762RYG/gFYQmlyz5VXleeMmxAERL
   y3nYGP78HmHTcpEkFpCMGINSZfFZQyXF/GHDpR+eqeumHJG6xRw+ucQ+5
   ouA7JmCu3cHM/lizulbfvCXCtOad91lEaXE1yhvjw5LXEmBkPq6BsOR/T
   EkizX6SYTgyYCh9VxaAjytjKvvo8F7T5zK44jal5FyV41pEGbIYtg502z
   Q==;
X-CSE-ConnectionGUID: JDMab/smQ8OHZrvfc1a/lg==
X-CSE-MsgGUID: wg6NFzgXRFaRsYpfa2D59w==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80925245"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="80925245"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 05:11:33 -0700
X-CSE-ConnectionGUID: c++t3U9uTmGtaJkg7v1UZQ==
X-CSE-MsgGUID: IOM+IqJgQea5txVpkPpRJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="239522282"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.187])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 05:11:27 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 Marco Crivellari <marco.crivellari@suse.com>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Michal Hocko <mhocko@suse.com>, Hans de Goede <hansg@kernel.org>
In-Reply-To: <20260515145851.318787-1-marco.crivellari@suse.com>
References: <20260515145851.318787-1-marco.crivellari@suse.com>
Subject: Re: [RFC PATCH] platform/x86: Move delayed work on system_dfl_wq
Message-Id: <177997028256.9687.17890840058204553699.b4-ty@linux.intel.com>
Date: Thu, 28 May 2026 15:11:22 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 15 May 2026 16:58:51 +0200, Marco Crivellari wrote:

> Currently the code enqueue work items using {queue|mod}_delayed_work(),
> using system_wq, which will be deprecated soon and replaced by
> system_percpu_wq.
> 
>    commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
> 
> The function(s) mentioned earlier, end up calling __queue_delayed_work(),
> which set a global timer that could fire anywhere, enqueuing the work
> where the timer fired.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: Move delayed work on system_dfl_wq
      commit: 5a3feefbcfa652e65b9259708222dd31d180eb33

--
 i.

