Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F18049EC6C;
	Mon, 12 Oct 2026 15:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820505; cv=none; b=nQtOp9Eq4MCxfUPidN1xWiR3QQYY2RRdw8gwVXLIZ4L3Qdsc4/DnnvEpujHQhYTHmviD5DHlNi0oVjx8M31gJz9qH/NGVoRHvAeJ0IiO/wXN2rbhqSQVWpuyl13DSb2qCTsQ4V3tzP+YZLxczIR9BHM/0ZZNhhdnifE6pKhWvbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820505; c=relaxed/simple;
	bh=KM+0ZaDIaLEjJq76dkq2uIyvuJjROgzp7rQRXvp5MEI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=N7tKPDDGN8Gg8dKHQfed4BrTFgF5LL2k1tbHaZTCQFxXSIti/ZZiuPL6iNQopx4hfNVxIvJKyUO84WfTWxHeZx6UQ2DUfI1LRkC6khju0XKUZ+OGwGqpcG8up29DiEACN+5nSrmKIvAdsfzKa2S+aVGqWj4AOrUT9LJIfaScjE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cp/BxYNf; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cp/BxYNf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791820504; x=1823356504;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=KM+0ZaDIaLEjJq76dkq2uIyvuJjROgzp7rQRXvp5MEI=;
  b=Cp/BxYNfIYFdx/8LrCt4nOFZAaLRHvVS0CwVEPzQq9E/j4QbI0beIvER
   A+56++n4PNUkPtt5Ou/0Ldkx5qifIoVuYgc4lNQG9BpI74pyfKNroD6Yt
   Il0YuxXaApR50qtFnLgeaWgIPjanTG934yCjDPA8IwegshccVfHw5TXPu
   rmY9vMWjLfztVIrYhE3tbLwMMYaK1kPlVXTe4lYWJ7lho1JGXhvXguwCK
   N3rGnzpZ26+I8ThqKAefEQG8/xMqm4lcVZikwbruwtXxnVQzBClchV/6h
   90gaLcqUVaekEZt3m6YeE08ThWjWSWdiElfijcRgTHH0INghkDh8+EY28
   g==;
X-CSE-ConnectionGUID: RlEzpPuySCOklVGzjvnLkQ==
X-CSE-MsgGUID: U9h/CatiSeqGDjotaqrJWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="554452"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="554452"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 08:54:58 -0700
X-CSE-ConnectionGUID: vd56DzhaS+KMydhPwXRIdw==
X-CSE-MsgGUID: u7o76yOITZKOHuHN2PBe7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="1117268"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.202])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 08:54:56 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, 
 Mario Limonciello <mario.limonciello@amd.com>
Cc: "open list:AMD HETERO CORE HARDWARE FEEDBACK DRIVER" <platform-driver-x86@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20260921170411.1149960-1-mario.limonciello@amd.com>
References: <20260921170411.1149960-1-mario.limonciello@amd.com>
Subject: Re: [PATCH 0/3] Fix a few Sashiko flagged issues on AMD_HFI
Message-Id: <179182049223.17897.3470778545154207023.b4-ty@b4>
Date: Mon, 12 Oct 2026 18:54:52 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Mon, 21 Sep 2026 12:04:08 -0500, Mario Limonciello wrote:

> Sashiko flagged a few instances that could trigger out of bounds or
> use-after-free.  This series fixes them.
> 
> Mario Limonciello (3):
>   platform/x86/amd: hfi: Fix a use-after-free when unloading the driver
>   platform/x86/amd: hfi: Fix out-of-bounds reads when parsing ranking
>     data
>   platform/x86/amd: hfi: Rely on ACPI enumeration instead of a dummy
>     device
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
[1/3] platform/x86/amd: hfi: Fix a use-after-free when unloading the driver
      commit: 0c35b436f714e1b50b6ba9500dcc651da3ddb2d8
[2/3] platform/x86/amd: hfi: Fix out-of-bounds reads when parsing ranking data
      commit: 1b3dbe2ff7df1ab392e3931109cadb27468a067d
[3/3] platform/x86/amd: hfi: Rely on ACPI enumeration instead of a dummy device
      commit: b00d2680a3fc2448f2ba77a287d444f678c29a84

--
 i.

