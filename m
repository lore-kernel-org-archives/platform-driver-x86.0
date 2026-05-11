Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112163FD135
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 14:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778509334; cv=none; b=MS9Gp9xj60gW5iEMxZHgUg/GXc3zIPioq4PWweqly759IiklIMeBDAXc96Minx7GIUrmC2V2bvSizuurV7yQa2idmf4tM152RHWlODkXP+Sy6uU7FUPkfq5RBm+AP5Vxty1ObJdNPgOwXA7VJd6R6DryEIUx4gmEqSz5Ao8HVb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778509334; c=relaxed/simple;
	bh=mHCDXxKILUpI3DFnK0MsqGcdlwpHUcKSeN4NEH9jF0Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lwwe8KjEX75vydaP/m64NHp9SkaL5sy0BPkDQW1+wjnoYi1txZPyHWWBsNPpq3MFAVZXWZDMC0zWMvYKtuzcr36gyarM904EK6tz9NsiDaJOls+V3ilaqelrOr1w+0mZ5VfxCSdW5sPqDjycTYaWiR78XQnU5vudRJ9N1mP3kvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aBrsymrx; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aBrsymrx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778509333; x=1810045333;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=mHCDXxKILUpI3DFnK0MsqGcdlwpHUcKSeN4NEH9jF0Y=;
  b=aBrsymrxxl35RV/s/hVmT+9KLaOkirocN2SeJN6zb22xmwsTIXpiOKC7
   kB5Kh6oHUIK0HfkusBgz4vS2YSXwYmD9lJXnyRnHb/VZkwH9DI39NvgdZ
   m9/sT6PVlHIy/DObjJbMQT3hAztKGDU+AoyGwkWSCmgQ3p38E5PneDmLx
   70CyKWFnnAooerWoEt8Tz/jY8RwCMrjEKOvzAfdGWVZMslZHwNrxquz09
   rOUdOZbrZOiW0rZvUCj+P9T9vQ7yQ6WHeaSYJD9P9Uo+eangF1Uc9Xc45
   hLaOTA2oNn/HIfKH02goJSp5BC3EasXnew1YmaPR5OmYt2pRI76rnkDAA
   g==;
X-CSE-ConnectionGUID: mSUxsi70TEa6cc+R14pcfQ==
X-CSE-MsgGUID: cxUXsmZ7QHyt/Q0alrT+BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90772989"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="90772989"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 07:22:12 -0700
X-CSE-ConnectionGUID: 8ExhYrbTS7mUuE6Al8gtQw==
X-CSE-MsgGUID: 2tSkmhthRLOWrP2EyH5Hmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="231077070"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.28])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 07:22:10 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D . Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, Paolo Pisati <p.pisati@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
In-Reply-To: <20260508070956.62201-1-p.pisati@gmail.com>
References: <20260508070956.62201-1-p.pisati@gmail.com>
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: add DMI quirk for ASUS
 Zenbook Duo UX8407AA
Message-Id: <177850932515.20471.7131449207150640037.b4-ty@linux.intel.com>
Date: Mon, 11 May 2026 17:22:05 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 08 May 2026 09:09:56 +0200, Paolo Pisati wrote:

> Use the existing zenbook duo keyboard quirk for the UX8407AA model too.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: asus-nb-wmi: add DMI quirk for ASUS Zenbook Duo UX8407AA
      commit: 2997606dd17729404cef9821ce66dd037b6019eb

--
 i.

