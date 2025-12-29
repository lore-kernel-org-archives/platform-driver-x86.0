Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDD13AC39;
	Mon, 29 Dec 2025 16:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767024035; cv=none; b=vAu472IrO4KHCd8NAqy10jDAOefnzaimSHWsHv8Eo2c1Kjn7xYeyaGAGHRtNutgPxKOI+v93fDaKIfVYj2PPdEKeQAWAyfNOaHjFxX6/cmjleGhVDB1OTn2d6d4LiTMgE9FkF7zcgpIfF5lwEhsIOkXwRuVKegOAaF+lVkpDQDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767024035; c=relaxed/simple;
	bh=41R633P2ByRjhO2GQ7Uwpl9+1NL0J70e0YyRx9oLxCU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=febkb4nVh87wkDK5LUvOts1y0kFapyYOI1RYcHWilB0w0KLjCZ+ebfgcVIUpq9MFIREuj9nwZPF2jrmmJ31ntRYfU0sDkTlY1uOrVuNpE8JweZ0lFrfnpsfVqbD3RvFmu1w9wlmDBWa7of+ejkM3tvzj1qiOEdFOnkRJR0QvYQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aJNAa0/f; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aJNAa0/f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767024034; x=1798560034;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=41R633P2ByRjhO2GQ7Uwpl9+1NL0J70e0YyRx9oLxCU=;
  b=aJNAa0/f+G4/rBDz9ywqACKGKg/1Ya3zZnwFbiv3AnHqUOkP65eTZVi5
   B4FdbWXdfLnXwjjanfkwSZ4pxHsOkjxsW7cG5zxlIDWrxue0ABlplhq3N
   nEKqP/Og9g9xeF717hMUhu0PCJnRlTXoNdh+JwTAh6v/faUfyjXzz0Y3g
   O76eQyN/Fb1F1L11sCkeZyANQ57aLQSLClm05MZKqL2XXGXDL7MRIRud2
   D72WYKyEL1ZgmUOaPdrElz9HEsjzqwuJWIjI99GxX3fvUCYbF/5pCctCP
   wrcJ2KBc/QjGkZGq5ZdsJdXlmPC9JHZdKWXkts09D2YJQRTtwWOGv+hqZ
   g==;
X-CSE-ConnectionGUID: xLr3+qsuTkmSo4ZESZk6+w==
X-CSE-MsgGUID: nM2zeEX3TQCvJtZGDXS2Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68567627"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68567627"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 08:00:34 -0800
X-CSE-ConnectionGUID: preh2SluS4mh87A7ezC9YQ==
X-CSE-MsgGUID: PJdSLZ13Qh2rksIZKiQMCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,186,1763452800"; 
   d="scan'208";a="238359232"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.30])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 08:00:30 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-kernel@vger.kernel.org, Denis Benato <denis.benato@linux.dev>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
 "Luke D . Jones" <luke@ljones.dev>, Mateusz Schyboll <dragonn@op.pl>, 
 =?utf-8?q?Merthan_Karaka=C5=9F?= <m3rthn.k@gmail.com>, 
 Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20251229150755.1351495-1-denis.benato@linux.dev>
References: <20251229150755.1351495-1-denis.benato@linux.dev>
Subject: Re: [PATCH v2] platform/x86: asus-armoury: fix ppt data for FA507R
Message-Id: <176702402537.34195.3210240061686906848.b4-ty@linux.intel.com>
Date: Mon, 29 Dec 2025 18:00:25 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 29 Dec 2025 16:07:55 +0100, Denis Benato wrote:

> PPT data for FA507R was reported to be wrong by a user:
> change limits to make them equal to Armoury Crate limits.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: asus-armoury: fix ppt data for FA507R
      commit: 6a02651c4c4b710ecbaf798eb4feb57c97f2bc14

--
 i.

