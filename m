Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC254CEE60;
	Mon,  5 Oct 2026 17:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791222290; cv=none; b=GDp2XJkT1Gwm6EKapgrS0DlEfz13QJIFq/Opew+K+0jnxdMZEv9B1Tf7tw7jQIoPBDzRzLvZdHt4S/gym/ykmb9IdhHpD/Pauw6z36o/kMkqPSdrDrXyk5HuzT8Scwg21Imq34NCo+kdAGrjfGI2t8WPnFSG4xS5zTFAbdlESEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791222290; c=relaxed/simple;
	bh=TiEbM5CziIC5WGzoucHY8uJDLBvQJOKP9pmyDpWc5Ac=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=D2dRxmYF9U2XTRy0Z6yc52yBBC2WQ2qo+xqd1LFYTgWfGIZ/EytCQ8JLwSNu6/dFnMYpQdcwGoqDGrG0gS8eQW8fAfdtfyo6y/Cw9VFayq+XYKDvOT49ftObURWVo+dH24aaGSmgS3tC6s+eGSe5h9PT6YqCk1Njt00uMoaPVLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YFikqcZ6; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YFikqcZ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791222289; x=1822758289;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=TiEbM5CziIC5WGzoucHY8uJDLBvQJOKP9pmyDpWc5Ac=;
  b=YFikqcZ6+g14NOC3y8Q82GdaxlyW/n5aTo3mzriRVld0ckAwjLHVbu0h
   S5i9saqV+YdteWyMZVl/sp8sRs2RsnDzoC3uv2j6iJmew+H5UNR9H0gSy
   J9t5B9TwkEHAEyXYK/4DxrXT/wqCvakJSiycxrVCIkAT7HSSY5ld3Nui2
   Ho+f4qAbVK9p37R2JWgluU2bO6inKc52SNf9MZSuONz+PYnvg8DyhGlUW
   yPQncqgpI0MADsOkomlCxWG0id8ibmzgRImyNwHr6cyBVSmAbSwa8w1/M
   PWs0cqo/7bpxkYlgZ8GVjZ8G1Afx4HEiAkKl8mV1GIouNeeOo5jmfp+vm
   g==;
X-CSE-ConnectionGUID: u5+m0k+TSMW5OqiDLaaqfQ==
X-CSE-MsgGUID: oHCoK8LgTMK+61beRrdUNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="90960223"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="90960223"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 10:44:49 -0700
X-CSE-ConnectionGUID: 5pIvyFxhSjelxHHHyMuAbg==
X-CSE-MsgGUID: SNfRMIU5Tse+6JdsFAl0Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="306387416"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.199])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 10:44:47 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Nikita Kravets <teackot@gmail.com>, Hans de Goede <hansg@kernel.org>, 
 Daasaradhi Mannava <daasaradhimannava@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916174830.11620-1-daasaradhimannava@gmail.com>
References: <20260916174830.11620-1-daasaradhimannava@gmail.com>
Subject: Re: [PATCH] platform/x86: msi-ec: Add MSI GL65 Leopard 9SCXK EC
 firmware
Message-Id: <179122228243.27048.6323467897824754704.b4-ty@b4>
Date: Mon, 05 Oct 2026 20:44:42 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Wed, 16 Sep 2026 17:48:30 +0000, Daasaradhi Mannava wrote:

> Add the firmware string '16U8EMS2.100' to the ALLOWED_FW_1 array.
> This enables Embedded Controller support, including battery charge
> thresholds, for the MSI GL65 Leopard 9SCXK (MS-16U8) laptop.
> 
> The EC memory layout of this firmware matches the existing config:
> the CPU and GPU temperatures at 0x68 and 0x80 agree with coretemp and
> the NVIDIA driver, the fan mode at 0xf4 reads 0x0d (auto), and the
> charge control register is at 0xef.
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
[1/1] platform/x86: msi-ec: Add MSI GL65 Leopard 9SCXK EC firmware
      commit: 54bd3f238b2fcddedcc42d56e6518241021110ee

--
 i.

