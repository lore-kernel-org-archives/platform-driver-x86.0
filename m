Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104136;
	b=J0/sQBgpt2gUcf9PaO7q/lMEnsTKLojHGjkonUcC+JYEU81en+CaskQvMz1TalQXHRe6
	 8nNLZ4xv0DS9FR+XTqJqLXIWA9W9XXUtGLPm7WxOJ2qR8gFw5sSRsTw5b0AMmveCc6EsC
	 8P0NB9cZ+Ap/Z/xkr/8Sy6ruBFF8Ujg2IQu0KXAcffL0aAXAL2v8rcI5FHHe3NMg+mXXY
	 elXXuiL2bdtBJ8Enf4ben27TMQPZTmHNWUP7P3GRqKoFuaGrWBqKwXR7SuYfmvYjGWJ3b
	 /IJzMQx1DRyAEVPF8kVhSDoNkmSSRl/HpCrFUFYuhTe2F8W7Tr8POl47fYaDhrRjWWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104136;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=mDvse5R8AxeYe6zn9yAAjd2BMUY88kuaQ6OkBnlSymk=;
	b=FXveaUGVdENbr1O3owX/RIl8jTlLnZ69JWY6p8v4gYao/K/VtcHyBMR5+s2T/HTohpoc
	 u61XzYCEElhDFfvg+57E5AfNA+4YdbUoTZD39OHuBRPoCT28Y/NCaFd31a0RW+NaLtBkB
	 VeURbZjXwbGH54srd29F2ExrAH3M70jFx3te8imgcy5Qz0GUiyXeVWmU6898yLOKftuB0
	 JtSPvGfl/FIabwG5TNliMfMpw9B0AQqa3bwMss2injVnr8ad+tMqNgRVYTSj18E2i/2LJ
	 PdiumTaejeHXIPSN0em0vDkyauxdUyMQeAzEUVvIx5IyF2bwtclBRPB9TcRWrdHImGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H5vYThdb;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B2C606A335;
	Thu, 19 Nov 2026 16:02:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2B2C606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H5vYThdb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795104136; x=1826640136;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=C5Tjv/kIrjR/cCe6hwqJUwTZwQKZwZh+mQREB8PDzoI=;
  b=H5vYThdbvjomZzMz1yGtH0GHjQCtrSn3IdGuQ5ioa3qNSUnhxl8LIAsf
   OiLx13vXsD3VfI4/nJZEZuir47PndGWI9wOehND/5NINMqxukuHJo4Kvq
   e9FiXdHE+SEbNggORurxI5zMDAyIsOzxSBuYj8XA4lsrUbNBdxhGRxymI
   dxeHEEar0Ka/NTY+djwOEzrZpu3H8jsRLvra2W5l0uOqo5rMcG/8ELXjr
   8q3nQZTHdC6cme4GMkVTtGcoS8wZv4SztjF3Aih7PlbNGUxj6JFm5To/T
   9oRCE1aTUiEG52njTC4LOf0gbl/Mdt5GEeXkiMje4zUOJQQ01gt/aGN4B
   g==;
X-CSE-ConnectionGUID: +0hmoP1MSz2x/kA/KWHRqQ==
X-CSE-MsgGUID: Pui98Bj1QUuCrcDp5F0X5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3803264"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3803264"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 08:02:15 -0800
X-CSE-ConnectionGUID: Hf+6IlvCQbSx10Bi2ORj6w==
X-CSE-MsgGUID: kRYo0/SsR9+TveZY7eoozg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10591048"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.132])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 08:02:13 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: "Lee, Chun-Yi" <jlee@suse.com>, Hans de Goede <hansg@kernel.org>, 
 Pedro Caldeira <pdrocaldeira@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261101192446.5615-1-pdrocaldeira@gmail.com>
References: <20261101192446.5615-1-pdrocaldeira@gmail.com>
Subject: Re: [PATCH] platform/x86: acer-wmi: Keep Bluetooth powered on
 Aspire E5-573
Message-Id: <179510412763.21358.3739867579073133249.b4-ty@b4>
Date: Thu, 19 Nov 2026 18:02:07 +0200
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Sun, 01 Nov 2026 16:24:44 -0300, Pedro Caldeira wrote:

> The SMBIOS type AAh table of the Aspire E5-573 reports a communication
> button bitmap of 0x1 (WiFi only), although the laptop has internal
> Bluetooth.
> 
> wmid3_set_device_status() reads the device states using this bitmap and
> writes the result back, which loses the Bluetooth bit. Any write to the
> acer-wireless rfkill device therefore powers Bluetooth off, even if the
> WiFi state does not change. Userspace does such writes during boot, and
> Bluetooth cannot be turned back on as it has no rfkill device.
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
[1/1] platform/x86: acer-wmi: Keep Bluetooth powered on Aspire E5-573
      commit: 9b5a2d0e91c806dae2001c029c77c4228223c2dd

--
 i.

