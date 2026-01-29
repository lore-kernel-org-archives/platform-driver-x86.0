Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F867388861
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Jan 2026 12:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769690391; cv=none; b=bUxfDvQDo59k+iGjI9t44xxd/70W6x55EfR7XMUOs+9CkIL0eOzlOJg7iSEToDqcuANfpg2mFmmBvCTwR6H4x8O+OHrgOVDPJbuPbzd//mKix02D2fBz+65ypwmqVBU7velw9Mgzfml8/WtML8GHMtkj8trZWTz88f5rJ5X6b18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769690391; c=relaxed/simple;
	bh=E7OewLSN1HK7Rx3NIZ4ZCWyDXu38lqM5BLhoT7xyypc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qXbw9Hj/KwKqZYJZj4xY+xgcXakLTi6c+aGso+BoULvG3G4BUq0i/4UodBjifjDsmeH+kffXKdqoLfFZhgnuIOz15i5rxR/TV0iLWX368kBNtDX1iIvWde/qQ6MrkoOnk5kQe62CeZuq68LD4VVljMEfmvqocK6B+TGDT+yfZ48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i7zNw4Bh; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i7zNw4Bh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769690390; x=1801226390;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=E7OewLSN1HK7Rx3NIZ4ZCWyDXu38lqM5BLhoT7xyypc=;
  b=i7zNw4BhS0TVKpd6Flhyu6Iwr82t5KxHHtlA/wKuF4nQd89OG2KSTKs9
   32iFFeYsLfyXak3NCw2nPpQbvP9/2M88l6nCfuQPbdTUreYqsBSdjURNs
   LcygCR1vCsp9Ma0rANIIJ8wop8MbnLQBPtuR3r+99kVOUkjYemeadoXhx
   cfF/W3idAx1f1gpOWc5s8VOzgMGvfrL7265jONveE+c+5C5NTt0vytw3d
   GoyMGZNzITapEe5MScSRkLvrFXkzkPl2Ta2odxfz8C0Pyx0EnQjMIQVUM
   6R6a0f/8EuxqbHnrPa+/OLYlxltzySJ1U3OOm1rpHzKVwDd4mrp2kv/c3
   Q==;
X-CSE-ConnectionGUID: z8EDG+EQQVu1ixRpW05dmg==
X-CSE-MsgGUID: 8UNjXBArS/mYSEKszJVcrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="73522333"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="73522333"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 04:39:49 -0800
X-CSE-ConnectionGUID: Z91QmPofTl2pGJrDEIw0iQ==
X-CSE-MsgGUID: ma1bTju8TwGXQ+i7k3z31w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="213121314"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.172])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 04:39:20 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: jorge.lopez2@hp.com, hansg@kernel.org, linux@weissschuh.net, 
 Mario Limonciello <mario.limonciello@amd.com>
Cc: Alain Cousinie <alain.cousinie@laposte.net>, 
 platform-driver-x86@vger.kernel.org
In-Reply-To: <20260128190501.2170068-1-mario.limonciello@amd.com>
References: <20260128190501.2170068-1-mario.limonciello@amd.com>
Subject: Re: [PATCH] platform/x86: hp-bioscfg: Skip empty attribute names
Message-Id: <176969035242.2211.18163846618382695354.b4-ty@linux.intel.com>
Date: Thu, 29 Jan 2026 14:39:12 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 28 Jan 2026 13:04:45 -0600, Mario Limonciello wrote:

> Avoid registering kobjects with empty names when a BIOS attribute
> name decodes to an empty string.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: hp-bioscfg: Skip empty attribute names
      commit: 6222883af286e2feb3c9ff2bf9fd8fdf4220c55a

--
 i.

