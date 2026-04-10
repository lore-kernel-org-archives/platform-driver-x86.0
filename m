Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90853DB65D;
	Fri, 10 Apr 2026 16:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775838536; cv=none; b=DqWXI3J7O77dwgzZncRMWCCgmYH+4t3Vj/pRdonds7FsqspdhMQ/aQbWSllCWZgMiHXr8REGM2ay5ZsaeWXruEKHSjD/XHnXcr7rHLh1cM0O0jKaUN253OXR0e6/5urfhXYyLgHiAdp/2/deoJ/ADi6QP7oWfQaO3UU4kd8DO1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775838536; c=relaxed/simple;
	bh=mnYs2blxwPt3sWL5U867E87eMqf3O7gW9mUTYa9+FIM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=M7rZK6ck8CgHDB/XjG055LPJ3iO3ewhz2TR7gRCIsKz9TdZ3rAlnL660pier855c5qURixC9pQf5o0JYjduKaouFwuPAHP2zuyonLrERrHvXuu4cK/MX0dbPiwKGnF00V8207YZMUcAMmJOsHkQQjeW3n3f8X8dbuOw+0muiMpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A/VBrph2; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A/VBrph2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775838535; x=1807374535;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=mnYs2blxwPt3sWL5U867E87eMqf3O7gW9mUTYa9+FIM=;
  b=A/VBrph2zL0qkkZvCJLVMB186Ajx7mSutiOGLnjc3CLt6d985pGZSQpT
   wyi3Z0P7pbtkK2MLygg++AUEKOcY2b6eeGL+sYLpz/Qv/frKj1z6S8lrQ
   pfdfms0eojrgvMUdzJbyzMKjRDzhze+sCfTsZ1ft5rvKecnlZzMuE6fcu
   fQfb5JKC9iv1mIhevdShLzdD1s6bovdpNZKymJNh+FrzM2goy7YhvlgpE
   +Ljwzh8wGVpl+x8mSq9IPWbAt4fZ9o08ZBoKg3ABcW9Fylf1RZg/FlcAK
   w2GFbKUDHOvPbEui/mJiB80PUqfPKtCsCbXiDq1HIiQ2ci6f8W89kgQus
   A==;
X-CSE-ConnectionGUID: HlVjTPopTNaMOTwrr5G/hg==
X-CSE-MsgGUID: vwvg635GQfmyl6oIrIzcIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="79447091"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="79447091"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 09:28:54 -0700
X-CSE-ConnectionGUID: Lo0qQ+aNRwmWPVICbICyuA==
X-CSE-MsgGUID: ZkzlDP77R7e3fzJr3Kjlmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="228112673"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.118])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 09:28:51 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Daniel Scally <djrscally@gmail.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Marco Nenciarini <mnencia@kcore.it>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260401203638.1601661-1-mnencia@kcore.it>
References: <20260401203638.1601661-1-mnencia@kcore.it>
Subject: Re: [PATCH v8 0/4] platform/x86: int3472: Add support for GPIO
 type 0x02 (IR flood LED)
Message-Id: <177583852538.14800.10803596666009986811.b4-ty@linux.intel.com>
Date: Fri, 10 Apr 2026 19:28:45 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 01 Apr 2026 22:36:34 +0200, Marco Nenciarini wrote:

> Add support for INT3472 GPIO type 0x02 which controls an IR flood LED
> used for face authentication on some laptops (e.g. Dell Pro Max 16
> Premium). Without this, the kernel logs "GPIO type 0x02 unknown; the
> sensor may not work" and IR sensors paired with a flood LED cannot
> function.
> 
> The series first refactors the existing LED code (patches 1-3), then
> adds the new IR flood LED type with multi-LED support (patch 4).
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/4] platform/x86: int3472: Use local variable for LED struct access
      commit: d6116d86e58a04a9522e349c4a27145521c01ad7
[2/4] platform/x86: int3472: Rename pled to led in LED registration code
      commit: 39237e3208209d1bb35d939d6fee1f36b642f562
[3/4] platform/x86: int3472: Parameterize LED con_id in registration
      commit: 218d3c44f5f0a3cc1647bc61a4e4eac663b37aa5
[4/4] platform/x86: int3472: Add support for GPIO type 0x02 (IR flood LED)
      commit: bbd917d96aa152a5c4701964db5b28db666f7491

--
 i.

