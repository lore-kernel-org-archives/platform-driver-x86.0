Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E934843785F;
	Tue,  7 Jul 2026 17:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783444164; cv=none; b=VivDC924YjE8Kx445KCwO4mC+icQ0ciAXUxrGM9JNe1+WQKlW+AfnK2pDQXBD1w+mnwgP1cJYP8qEO54l/HaUMCv7eAwI69GbpIYMjdqY0PYXPPGzaWrEOI8e12V+jMzjdHhGEKmTEcva4qMfUr4tX3ythgIrZ4lhZksnLwLID8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783444164; c=relaxed/simple;
	bh=GF2zPUQn85142lOQs7ts7qyTo+u5sdj0p3p+Wl0Vix4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tFVq9Z3f2U34bRYRe2C1f5XwlRNKGqkaBpf2XTkbNh3DF5+aXmGUnwZ9og4K+caTF66dVdPPPRMJjMDNwVhjy6W0PI12isjHQvvz+qH1HqU+v00ZXxtow/jsBmw5hORZrEsdou3Ct19PRFath+pDlqC/oBydj+gWdqDI/lLF5lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ABn8yCcs; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ABn8yCcs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783444163; x=1814980163;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=GF2zPUQn85142lOQs7ts7qyTo+u5sdj0p3p+Wl0Vix4=;
  b=ABn8yCcsaH0pemkA9USycMYXpcZErgprOTCJAUh/zw3El58WqFieUQUO
   Q+jUFU9gUSvzB1JvGQKGD979m8rZjGQ4U/ei+9KV929POQNDO3tQhKQz9
   x22FJweq2UGkNUaoINw5bQagsYcXbPBf4CGn7NKcTPnbueOTrYbCpLz7y
   L7Y60RCdziYOZfuMNw562QRV621h5p7GTjelVDBr8QfZpsSosdQBbUgee
   D7eOY2ejsyOaEdI2A/4RJd8YYzTZYVPYEbtfZ9HgSiFyG+ZbQ43BupRXO
   brPaYY2xCbAnpaaXVWc+lPDjJ6rc/KPwzRl4Ol/WwmNXykEiGlhAcVnA6
   Q==;
X-CSE-ConnectionGUID: cIMzuhFQRAKAF/NGoloTuA==
X-CSE-MsgGUID: VvUfioouSi2Ga69dXSzccA==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="86646785"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="86646785"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 10:09:21 -0700
X-CSE-ConnectionGUID: 5jxZQ8lTRY+4L1eEJvhPHA==
X-CSE-MsgGUID: r3i47wxKQQes5egwv2aWog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="252302480"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.226])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 10:09:18 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: denis.benato@linux.dev, hansg@kernel.org, 
 Marco Scardovi <scardracs@disroot.org>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
In-Reply-To: <20260701164003.4271-1-scardracs@disroot.org>
References: <20260701164003.4271-1-scardracs@disroot.org>
Subject: Re: [PATCH] platform/x86: asus-armoury: Add power limits quirk for
 FA608WV
Message-Id: <178344415300.17784.8617552757818338438.b4-ty@b4>
Date: Tue, 07 Jul 2026 20:09:13 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Wed, 01 Jul 2026 18:39:35 +0200, Marco Scardovi wrote:

> Add power limits quirk entry for ASUS ROG FA608WV laptop.
> The limits are extracted from the device's ThrottleGear XML configuration
> file for the 'Ryzen' profile.

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] platform/x86: asus-armoury: Add power limits quirk for FA608WV
      commit: ca93308077a420146ad7b235c6ea7720f593875b

--
 i.

