Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197A62D94B3;
	Wed,  3 Dec 2025 09:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764755260; cv=none; b=MJrNlsLArJJWRsW+f0dABWapYYvDHRb7xlx2XuNjwWU4oaIX+Rlp4fg55wqse87avhP0FRqwuDl0c0K93boZtBKzKRCd/DrmlP4mni943hawu/sQu0mdiGVGqGIysOk5CDIE8VFj3e2M6uJzXF2dUrODr2m0mUMi+63uDRrjQVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764755260; c=relaxed/simple;
	bh=eE6aTptxPuetdjJ3lXwZjZiBA0Lewt7l0e2IOMbHrRo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=g/db5vfIID96anJxqETzkIQdxvmh/XSOiQLBmCltHCAC1DLXL+ZKshCv1WyrfYYSqtmBRdLN3AGyUr7vqUvoPsF9u0A2NYs7YM/L6f8MuBa6dB94wok2hN2QMZ5Y7mf7MzJja0AehgYrE7NKhpmiD8w903cleZpHz7QujfunAVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LxmE56T0; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LxmE56T0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764755259; x=1796291259;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=eE6aTptxPuetdjJ3lXwZjZiBA0Lewt7l0e2IOMbHrRo=;
  b=LxmE56T0dLj9YWc9f9lehQcPFZWWltoaakzFkd6BsuYi9ptmBvohaWjU
   YwJqGXeUPg2efLf94y1nxIu3XD0qFjzZJTbZppwxN3tv24neVabSwRNx8
   PtXlQ6ahVxO0TRbmu+gaaZ6+yQ6/2yjyzK0fLFcWlb5r1/+Iun77gk/Z7
   c9fHcVPzpezQm7j8pz/LcwjhyC573aEccU/paj1KAYWIaYP86nlzimQ28
   mHbmm4hdAQrIBDwCwMFyhIGoAjF9Ete/HzCtIhGZdUI4OxCb7bazbJspw
   cAF2L9pOI59LSDufnNyGRDm+prVZ9W8OxZFtnNcfVnjp9CX25IgeobU6k
   g==;
X-CSE-ConnectionGUID: PcwmYPu5T+y7pZ21QDtk1Q==
X-CSE-MsgGUID: dO3xdGDtTTadrAs8SpOaQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77424235"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="77424235"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 01:47:33 -0800
X-CSE-ConnectionGUID: PcHHbmwtQESE6tdaRhAs7g==
X-CSE-MsgGUID: sS2BQZlBTO6lduWU7EVWDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="194449761"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.57])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 01:47:29 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <benato.denis96@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jian-Hong Pan <jian-hong@endlessm.com>, Anton Khirnov <anton@khirnov.net>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251129101307.18085-3-anton@khirnov.net>
References: <20251129101307.18085-3-anton@khirnov.net>
Subject: Re: [PATCH v2] platform/x86: asus-wmi: use
 brightness_set_blocking() for kbd led
Message-Id: <176475524451.7250.10247983674416836381.b4-ty@linux.intel.com>
Date: Wed, 03 Dec 2025 11:47:24 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Sat, 29 Nov 2025 11:13:08 +0100, Anton Khirnov wrote:

> kbd_led_set() can sleep, and so may not be used as the brightness_set()
> callback.
> 
> Otherwise using this led with a trigger leads to system hangs
> accompanied by:
> BUG: scheduling while atomic: acpi_fakekeyd/2588/0x00000003
> CPU: 4 UID: 0 PID: 2588 Comm: acpi_fakekeyd Not tainted 6.17.9+deb14-amd64 #1 PREEMPT(lazy)  Debian 6.17.9-1
> Hardware name: ASUSTeK COMPUTER INC. ASUS EXPERTBOOK B9403CVAR/B9403CVAR, BIOS B9403CVAR.311 12/24/2024
> Call Trace:
>  <TASK>
>  [...]
>  schedule_timeout+0xbd/0x100
>  __down_common+0x175/0x290
>  down_timeout+0x67/0x70
>  acpi_os_wait_semaphore+0x57/0x90
>  [...]
>  asus_wmi_evaluate_method3+0x87/0x190 [asus_wmi]
>  led_trigger_event+0x3f/0x60
>  [...]
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: asus-wmi: use brightness_set_blocking() for kbd led
      commit: ccb61a328321ba3f8567e350664c9ca7a42b6c70

--
 i.

