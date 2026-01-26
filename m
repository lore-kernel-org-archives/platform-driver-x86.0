Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B07823182D;
	Mon, 26 Jan 2026 14:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769437817; cv=none; b=eHhN1a4CEUJg2j0muTllS6GTo5I/m0c2UxOiH4mFC7g1b6mJCKfIhcdghz1TyjiMAkhFYqDzR/THVEbxPspJWeH4Oe8s2+G4AkspU0s2yCh9Vx37cRfjQggvnSxOhjqveREJmO1IgAsQXUikFurnKkrhnOWXS476mt4dDCEmlYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769437817; c=relaxed/simple;
	bh=qrHZ633MF1fpopalN2OdHmGfB8eE4vP9iErUyTrYeZU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=n3xMljJIFvWfRLnNcMuN2EZruWcjVzEuUwjWlkOiglnERCwso8RnN5eIB5AAfmqOtzr0NBs2O2Hvkrzo+svoKhCiTozrTSsm+NcAd/HOGbaJf7tIwB75tvl7qQjWb2ZLfHO0N8I32MmH5ByCsz0h5aNmjVtc2MHCCyG7K+CQLVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kB0PLqCw; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kB0PLqCw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769437816; x=1800973816;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=qrHZ633MF1fpopalN2OdHmGfB8eE4vP9iErUyTrYeZU=;
  b=kB0PLqCwLPlUmz6MrejcsR9GKJcUqJSaurXpdi/PjQHFeI2EVQkygV12
   cGyKVEnDih/ZRXgXGc6UGb85d/PJyfFj5/HyyVge1FV8vmVaWrERopyOX
   0AhIJqh6Vvu5RXS+E3QRfOL9Ykze/4VLOjUqW8SSpf00wVu7BZiy8uo7P
   PsrRcrEbkwBLFmgpqyg64VzSAxsqWsDgMXhBNXp4k+v4df2Sduny+XKWQ
   /RSy8EXmOOAgM03/3H7nUNVlLu5fjZExips4ImvxraoYHopXHnBgMPbrd
   x0Ok66wDqZLTqYvn0BFM+c7AftbuReQoZmbUValpq+FLyF8QkxT5RyM2V
   g==;
X-CSE-ConnectionGUID: 7HsQ7Wm/S7alhWI9V76l/Q==
X-CSE-MsgGUID: V6ruCGJlSVewnShhrW+USA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="74457855"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="74457855"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 06:30:16 -0800
X-CSE-ConnectionGUID: 2mn58ertRSOu16FfWRXQaA==
X-CSE-MsgGUID: HTPczhZBQFWcSvG+V3XdIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="207748422"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.150])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 06:30:13 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>, 
 Werner Sembach <wse@tuxedocomputers.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260115154332.402873-1-wse@tuxedocomputers.com>
References: <20260115154332.402873-1-wse@tuxedocomputers.com>
Subject: Re: [PATCH 1/2] platform/x86: uniwill-laptop: Introduce device
 descriptor system
Message-Id: <176943780841.10029.15861197940759922252.b4-ty@linux.intel.com>
Date: Mon, 26 Jan 2026 16:30:08 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 15 Jan 2026 16:42:01 +0100, Werner Sembach wrote:

> Future additions to the driver will depend on device-specific
> initialization steps. Extend the DMI-based feature detection system
> to include device descriptors. Each descriptor contains a bitmap of
> supported features and a set of callback for performing
> device-specific initialization.
> 
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] platform/x86: uniwill-laptop: Introduce device descriptor system
      commit: d8c560f76dcac7ff4c630d5d84958183adbf19d2
[2/2] platform/x86/uniwill: Implement cTGP setting
      commit: 7c9aa38a59f611c619d026c2d082d0e8c9b9069f

--
 i.

