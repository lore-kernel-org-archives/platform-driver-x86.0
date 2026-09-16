Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8DB50EC1B;
	Wed, 16 Sep 2026 14:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568407; cv=none; b=S9wFbNGtnEUItEgJQrYPH5614/QDFCQiFLfQk44FZXaZjgbQueembZL5CfXaXbf+1VmuY/4O6dobkfRGt+LB2I4ML18j56CaTRloEyDAX2iP02T6lFD7nc4sPw6L8v1DT1/i/eAECB1BcUvu9kLEzzsJ7/qMJ/ZA4W7i8OaWeK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568407; c=relaxed/simple;
	bh=qZgy4G32toNy0nScR3CW8ffORYO/QJcTDUX+YDpEdAw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pkl5mbE9IKz3QhTwgpGm9CvMWuI3Iy8vQcQ8h/lDmU0SgeSmJnbWkThQ5ftcf4mEX9h2NCg1eUL8ty83YwYVNzMzN3HfCdLPB8hkNsQtPyfQhME5LmIVvqTvZT+5aFPWZtyLf/Ol2thag+2Lgw+g1RwTCd4ol2m6R7H5VnthXEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j1XItTvr; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j1XItTvr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789568406; x=1821104406;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=qZgy4G32toNy0nScR3CW8ffORYO/QJcTDUX+YDpEdAw=;
  b=j1XItTvr3uxhVd4MM16eWp0vq1rMrcczpM7KvyYMXHIPU77bIAehyWl0
   L6jM0Qbae6RYOhajZtTV0MLTxoSUsZjmfemLpjleE0rjBgIz1KZSPrOtT
   bNNC5d+oNOsk2NlaFhRVfU2YhR2kKxgwdB2VyftV4GDhZdi3hTWZiqSdu
   kxgwD1xLMKv91vUbs7EJgyendAbUxnwJ+Ceh7dRVge0i/y51jncVr8gVE
   PgNoRKsnEW+/l7TklnadW/Woyj3INCBDuulkK4CUfbOjnI8IXaQhgT8e/
   7IoWfU0TX8MPGOs6fvvFdHX6vIWQwl2sXc3QZEal0z1ZPE7KDKXX+ApjU
   w==;
X-CSE-ConnectionGUID: sKnGUroNQCOk+3D9UI/DUw==
X-CSE-MsgGUID: j8t2offVTQCiIA+/rh3Vag==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="453145"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="453145"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 07:20:06 -0700
X-CSE-ConnectionGUID: 2xtgOEqOSjG+aLvfsQamUw==
X-CSE-MsgGUID: kxeO9Y2dQeGcBCuklpnXiA==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.187])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 07:20:03 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, Alex Yeo <alexyeo362@gmail.com>
Cc: Kenneth Chan <kenneth.t.chan@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20260828003432.88748-1-alexyeo362@gmail.com>
References: <20260828003432.88748-1-alexyeo362@gmail.com>
Subject: Re: [PATCH v1] platform/x86: panasonic-laptop: register FN key
 up/down events
Message-Id: <178956839901.5060.10452763819904937714.b4-ty@b4>
Date: Wed, 16 Sep 2026 17:19:59 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Fri, 28 Aug 2026 08:34:31 +0800, Alex Yeo wrote:

> For Let's Note laptops, pressing the FN key sends a signal for both
> keyup and keydown.
> 
> FN key down: 0x0030
> FN key up: 0x0031
> 
> Currently, pressing the FN key causes the following output in dmesg:
> 
> [...]

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] platform/x86: panasonic-laptop: register FN key up/down events
      commit: a3aafecfa1220c5884dcaf01f125212ebd8841c0

--
 i.

