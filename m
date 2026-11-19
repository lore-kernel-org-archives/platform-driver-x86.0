Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104198;
	b=liOBZ9CM25F6jLiEn1ZL9mmFphpmzXJtJyksj1TYPGOFjZaPfmcj2ZiFm1jw4xUJmgQt
	 phKx7lVXt6ncqBO1072dida2C262CEwoBpKueLElobuJOQ/VZXKWZnmfH6J6I3XwlVGGR
	 bXPr3EMSG+9tRP/qXqP8eE2cZk9xRXzFdUC7Pu/eD4FOTKMzBqfSiAY3/+/CTRwulmE9q
	 xlH/2DfNQRa9ylnkIKcIDLMsgPnIA4QlSTFMcsSAQI8q8MLUO08S6ZlsGeUHZ8sh0etdc
	 Dt+dHE1c0z2xirmWxCyvQliW/PJDsjiLTgg2eAQ3PKgE43pY117zBn93XNaIOQa4dNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104198;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=laitjI9MWmGrB5sqWh2UVHDh2r0BGep5oylTD1ZNQHA=;
	b=hbT78n351b2SC2YBxq5cHJu2JH38abq7Ag6QVL0muSQDyVFkH2UJ0iKFVagX+IGCUWLK
	 pelySXAICmxrJW/oW8ahfQatqWrmOKEL7oqxV/zV8D9oUIaY/bUq3JPWe781GwRpf9+ag
	 Q3svzPGUZ2ztXhPLyWFk0xhua/geIUYZWTUjWTgaTUyEAxEZRhE7ejSCrFeNLCdtOnMUP
	 9DSdQSRWTS+ApmVsrP2nCzNctnNELhE8XSD3gyoPaDu3lbdJ/jTHxsC9NSJLLzonvpw1U
	 uLFwPndQxd70FW0jbnAzOsEufCUXVEUKybczTidbpioZKJKoGF6dp92rPQ9F5XQ95DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LLthqUeE;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B908D606A325;
	Thu, 19 Nov 2026 16:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B908D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LLthqUeE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795104198; x=1826640198;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=bZemFlHvRhws+Fnyge/8nInPKTKD3Jvj6918Io0liSI=;
  b=LLthqUeEqao1qdD3flfhnIjtCfLhTi2v5+khNHUbxZTzSSiiJQ6wpM/s
   hxUSchDls0QMgEvc/qEb4y5UXIj6tspRBiHz4AzgyA0Z+3+sUsndsL7nM
   23ZUvRulJbWvXiL8rlwSqrQlXwjTMQUFUvsVu21D7/9xZwqqrBjIooRLk
   1L8ghzRNS4nnvuw4FfKNIETGqdHg9/HyyP/s2CkPKzBHCnZ3nJFS/ZGUi
   DKhAZIctX2LA/a7LhPVBHi5CzCdYZgXR85V9U2MxsG3+QBG5K7Cm4Ge1v
   XS/abZ2Qi1cGaPnjfKEgpDUUFvfgVwH5NQEfSRA9Eftoa8grGJzgI4LRM
   g==;
X-CSE-ConnectionGUID: g0hi/m7KQgCrs8BW6IDGhA==
X-CSE-MsgGUID: wNN0hk3MSpSd2pM1Z4iDNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3874234"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3874234"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 08:03:18 -0800
X-CSE-ConnectionGUID: 6tcfMu3HToGmDzd0UTkVkQ==
X-CSE-MsgGUID: cuzP3XVZSnSgD2JxkBRJMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10371054"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.132])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 08:03:15 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, Armin Wolf <W_Armin@gmx.de>, 
 Lucy Wong <lucywong2778@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261102204611.63792-1-lucywong2778@gmail.com>
References: <20261102204611.63792-1-lucywong2778@gmail.com>
Subject: Re: [PATCH v3] platform/x86: add Xiaomi WMI key driver
Message-Id: <179510418947.21358.15541567230710778334.b4-ty@b4>
Date: Thu, 19 Nov 2026 18:03:09 +0200
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

On Tue, 03 Nov 2026 04:46:11 +0800, Lucy Wong wrote:

> Certain Xiaomi laptops expose extra function keys through a single WMI
> event GUID (B74AF83F-8B2F-4069-ACAC-36D176F62FC0). Unlike the existing
> xiaomi-wmi driver where each key has its own GUID, here all keys share
> one GUID and the event buffer encodes both an event type and a keycode:
> 
>   buffer[1] = event type
>     0x01: keyboard backlight level (EC handled)
>     0x02: press/release keys (5 keys with abstract icons)
>     0x03: firmware-handled toggles (touchpad, Fn lock)
>   buffer[2] = keycode within that type
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
[1/1] platform/x86: add Xiaomi WMI key driver
      commit: 9a48682bdf4eac3286bad27d6e0cd6a5ab80255d

--
 i.

