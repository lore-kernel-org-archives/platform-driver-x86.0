Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9995932E696;
	Mon, 19 Jan 2026 17:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768844744; cv=none; b=OEwGrnBgRbY5BCcS8a3z7D/O962MMdbBQ6H54W/mWk2m5Ib55gIgKv+gSkZkB7p8M6zutDFXqil5AOEYUvHXIJYz+oXI82QfCUB89xe8tHc6HC16gqojPWYqoWXIygHmSPfFC9Ep16pYEs7kP6i/UmafgHL9rJO7Ga4Z3WIRArk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768844744; c=relaxed/simple;
	bh=7kBtTZUveJUoz2sXEx04XehLYnMRSs0aoi0VcwAJs3E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TF0Ngmr5Ww4KHNtRcq3McVU+Paer7t+7KGZ6CIbo5E3M3D9a7KH//Wno7Jzw/XUPohmbb4Ebp4Wo1X1OEj6Dxv1lhYquKVaMjOgpNRsmjhTU9bvcIxIvTJcMT93gXqqeyvxD51zhGwjrG0KiUwUyrXc5QQnEbO7YERGM/gK51jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AZmjAOcu; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AZmjAOcu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768844743; x=1800380743;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=7kBtTZUveJUoz2sXEx04XehLYnMRSs0aoi0VcwAJs3E=;
  b=AZmjAOcufcrC3/PDovT1/j2tqUNr7++oKTBQIk92thVukI8Ps0vcfViu
   gjXvBeyYx87JhAmb119LKSSbLtcB8EeUFp5AscDfyFNTFeImC2GEbToD1
   64Dul5QAd/OMIp8mHrtIxO9x0yLdqAS9FxaFmC8RuBumLE8Chx1fQRi+l
   xourn19pdyVIu0BhrU/v5eUangdROl70n/YkAosW0FUFCkfoUYKTz26qG
   zpTH47OKxdkkQuR/ogwoG9+EeCKYW3qQxWQ4mut2rn1flc9QeBc2bj0Kz
   o6vRzKeqSnfhE5NvcRFVUCmiuV/AtjoKvMNs9QrL7kYHhO0Y+TuXNOw6/
   w==;
X-CSE-ConnectionGUID: dMh9fcq/QB2FKoO9zRSX8Q==
X-CSE-MsgGUID: yWPBz2MWRwKYmJCwssWy3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70220967"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="70220967"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 09:45:42 -0800
X-CSE-ConnectionGUID: b5OK/LUwR9e6nUyBXv5mFA==
X-CSE-MsgGUID: qVFqscwlQuy7bLPxS440sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="210421335"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.93])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 09:45:38 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-kernel@vger.kernel.org, Denis Benato <denis.benato@linux.dev>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
 "Luke D . Jones" <luke@ljones.dev>, Mateusz Schyboll <dragonn@op.pl>, 
 Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20260116180637.859803-1-denis.benato@linux.dev>
References: <20260116180637.859803-1-denis.benato@linux.dev>
Subject: Re: [PATCH 0/4] platform/x86: asus-armoury: ppt fixes and new
 models
Message-Id: <176884473407.11570.10302080754836334650.b4-ty@linux.intel.com>
Date: Mon, 19 Jan 2026 19:45:34 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 16 Jan 2026 19:06:33 +0100, Denis Benato wrote:

> this patch series includes some fixes to the PPT data table and adds
> support for two new models: G835L and GA403WW.
> 
> Cheers,
> Denis
> 
> Denis Benato (4):
>   platform/x86: asus-armoury: fix ppt data for FA608UM
>   platform/x86: asus-armoury: add support for G835L
>   platform/x86: asus-armoury: keep the list ordered alphabetically
>   platform/x86: asus-armoury: add support for GA403WW
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/4] platform/x86: asus-armoury: fix ppt data for FA608UM
      commit: 66f26bcc8aba2f3e6ae4af2f3c7eb72b5e3918b8
[2/4] platform/x86: asus-armoury: add support for G835L
      commit: 1dfc441140ede4f19b7c135664452465fb6a95d4
[3/4] platform/x86: asus-armoury: keep the list ordered alphabetically
      commit: 3072c1c919aeca8a09cada4465c32f1e933c6c5e
[4/4] platform/x86: asus-armoury: add support for GA403WW
      commit: 9b8e78f78056080ef91802ab44b0145262f34599

--
 i.

