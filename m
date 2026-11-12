Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489656;
	b=3txFEA6X7Fs1k+vgbEnUdVC/pj7UGiNXg6lcBrYtAsusA4JQ1lwchr9qV752WijFbWSg
	 FWq88+yCx1q5U1ZAHCbpCmwvDPuR2X054eERKfNsGGCKIPvSSqsp0c02x5aZLpaZiNoqv
	 l85uneiFQFQuSlA3XXr03epixomMShtikbt/Y71a1KY41/mtJGXW/+yWeDcQSASn1bz6n
	 h8llrs+jKQyFfgFwEcgJ1PwQKmYfxATgZRmSL1L72mp/i08uoZ/6apZI8djCUlPBek1yS
	 KLBVe4Y7YA1z2fvt9BnZrxByTKdK5KER35jwvmzj0h2HWSo5J1W/7XkEB+F+bi2rRJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489656;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=KO1XRyNBky3xCg9OOfA4h2CSkv8dE4VWQTBTjB5EVNc=;
	b=Q7w8Ll9uj0v7i7B4SL90PYo89QF+cMeIpsdnpVDBeSgYJOdXyY459hGMd4aU67m2Mw3m
	 zqj2E+K+V/OSu8F6ZlaGW7jWZJxK8z66XYY58FaPUboTupQUXzitywcGkIT1TdNgDSB/S
	 GIGmJdwt6My94XxPTrbxLHeaywkSSBvKe1kEqPiFtaJx+DDepzqNrTgr7URZezsgpAOPU
	 ts544x0FHyNPO82bXx51NpF7llOdpPNCv9Ep9sUANL5g+HCefb/r78Fu5jpRwq61sNrXf
	 tTQrec9cOYvOsUjNHMBYQfTF6oK4afNgWwrrHwy+94Ds7Wj7V/4wq3U1QTVI2Wtfysw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KON+vgDL;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3996606A886;
	Thu, 12 Nov 2026 13:20:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3996606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KON+vgDL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794489656; x=1826025656;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=sYqacmJeOjFLJZW5fc4d6uhgp32ageWxEmZm/7lk4H0=;
  b=KON+vgDLX8bSRL3677wcpSnXpkRwsUYuslpLpjE7G/1CMkKPstiWNdkv
   S7phVtTlcxH59tgUUWW2cp+1hooJV5xAoBFV9gBgxjGzyPq6NkEK2e77I
   JwdaKVM55FLgIxAB7hbyqiXbGmegmDqZepaFEEj0mgWCGA2kPbBr90Z3W
   fdEFuopkOL3HpgmY0zUFZTx1SxE5tTacLVaMlSTLreNtAlIJ49+Ml1kM7
   CqbxjV/jgxqPxY6o9k7skMbDs8JTCM/96QjI1fF75o13IcuGauKVIA3u0
   EexqZm2ah6QmXjvQ1VBr303g9IhWpiR6RsT9EX4O8QVWHOX0ff1BrmpFe
   Q==;
X-CSE-ConnectionGUID: JyqP7tZNQgSHyudVA5Jk+A==
X-CSE-MsgGUID: MF9VYnOcR7e0b9iNnZW1OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3291030"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3291030"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 05:20:53 -0800
X-CSE-ConnectionGUID: 23HsJCo2TJKkw2c8sy/i+g==
X-CSE-MsgGUID: xBdjDZaNTwSnIEVu1/Nknw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8549435"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.68])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 05:20:51 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>, 
 Werner Sembach <wse@tuxedocomputers.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261111131316.504815-1-wse@tuxedocomputers.com>
References: <20261111131316.504815-1-wse@tuxedocomputers.com>
Subject: Re: [PATCH v2] platform/x86: uniwill-laptop: Add TUXEDO Stellaris
 16 - Gen8 - Intel
Message-Id: <179448964571.10339.3585405299029993009.b4-ty@b4>
Date: Thu, 12 Nov 2026 15:20:45 +0200
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

On Wed, 11 Nov 2026 14:06:23 +0100, Werner Sembach wrote:

> This commit adds 2 new entries for new boardnames. It can reuses an
> existing device descriptor because the TUXEDO Stellaris 16 - Gen8 - Intel
> has the same featureset as its predecessor.

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] platform/x86: uniwill-laptop: Add TUXEDO Stellaris 16 - Gen8 - Intel
      commit: 11b27ad8c8078e18b74d0d507180422bfafc962e

--
 i.

