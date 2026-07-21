Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770053CC7DB;
	Tue, 21 Jul 2026 17:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784654175; cv=none; b=snR3jjGExMAUxNLR+j4wljnzf8U2VPW5qKzjtRYU447hDBg/VDETYct5jbk+9ohSYPDP21v8NZJqTlXmwnWF9607xvMuGbRgRvdRWQ2K7Z1kWoa1iw2FkkK96Wgex1kTu0TNB9KKyYnCd07r2VEScKaSoWwQqrBOe13GMpNBWxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784654175; c=relaxed/simple;
	bh=zT86r7/GHio4sie52vq3L7iq22wOm08gDKikF1mW5fI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Dg59M25gP/87DlFbjrJNkoXTQnCat5o/WqTMMRs65Fc07x8RMq2wucWhB9eJWmfvwPjw32aGmB66hFSlNPfk3MvWjkm0Be5KaC30b/TKhqw3AXjJHr4HmAq8T/B2jaJ8cNQ5BNNWa/Ug4FALfQgfvenTFFjs84u66d0uQDUZ4b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UlzsVXY8; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UlzsVXY8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784654175; x=1816190175;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=zT86r7/GHio4sie52vq3L7iq22wOm08gDKikF1mW5fI=;
  b=UlzsVXY8PAeozI8n5MQ6ogbxoaeWdh/K+538dHyrftwN+fVknjrjmBQN
   YqSYvRUXSe2nfG9MXdlTWTVMAaazURIe5FrJZ17t2vs2ds51mxbu9PTym
   WjRQaE/Agx06zvx3kz8UctnnDhtvz2wiQNfjo5aY7A6bDqPbzJCNSPxZ6
   0zja3iTaZ/buTb1G3Af0ypWI/rSdFypoJ64AB+TbTT5IkAfOAS8mprnrO
   bciHRaDvaP/TIiDVLvcZld2uItQsV+HX4+mqEfH5NpvRilHK9tr3m/4aR
   pUqucW0t6lE5NhgD5jRwe1B5fxgVThpkXHK/rdFpNRtQBJJ8ac+VWxyZc
   Q==;
X-CSE-ConnectionGUID: minadUHSQ4KIDZK824bQAA==
X-CSE-MsgGUID: nbptPaf6QFqAlZ95qIFQLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85464667"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="85464667"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 10:16:12 -0700
X-CSE-ConnectionGUID: hNcYXFDnTyiuTW5/+shwSw==
X-CSE-MsgGUID: Sqg6pnzCT16v9cXCUgAzsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="257894126"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.47])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 10:16:10 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>, 
 Werner Sembach <wse@tuxedocomputers.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260708211950.568799-1-wse@tuxedocomputers.com>
References: <20260708211950.568799-1-wse@tuxedocomputers.com>
Subject: Re: [PATCH 1/2] platform/x86: uniwill-laptop: Add 2 new feature
 defines for TUXEDO devices
Message-Id: <178465416530.18499.3063937849947940461.b4-ty@b4>
Date: Tue, 21 Jul 2026 20:16:05 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Wed, 08 Jul 2026 23:18:21 +0200, Werner Sembach wrote:

> Add 2 of the new feature defines, UNIWILL_FEATURE_AC_AUTO_BOOT and
> UNIWILL_FEATURE_USB_POWERSHARE, to TUXEDO devices where applicable.

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/2] platform/x86: uniwill-laptop: Add 2 new feature defines for TUXEDO devices
      commit: 527b1169526de6dbaeb646d48b20720a12b5a233
[2/2] platform/x86: uniwill-laptop: Add Avell A60 MUV support
      commit: e6137bbef0fe23feaf19e4714892457853064eb6

--
 i.

