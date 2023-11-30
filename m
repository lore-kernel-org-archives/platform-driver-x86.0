Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T2O25keQ"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B311884;
	Thu, 30 Nov 2023 03:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701345367; x=1732881367;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=X8cOIal6ZAAKvog0KBY4YFXu6vaFlgNpBf7VJckMNyw=;
  b=T2O25keQ5O77t0cQRhKXh8PtVY9CrLy2mfGzyzX/R73KW7ShRv25lcH7
   g9FeyTifwIxpbrCFJq3PWmfZGMG/rHNOfw20jV8TX7LNwNnb8DESc2Hc8
   yXCvvnMJ/0ga0f6xIAKcUMAfASRL5UwGkQyCxs2uZCXF18jb5yaUBaLDS
   7WEwIPXDkbba4a5qmnJHIyJxeIxt3kQ8OgntGeJT9Q6T5XuGcqfzGHgn3
   uoHukTdXA4eGeZ4GTsCp2uERjNLji7IW45+OJi/KiDW4cf1CtCA4iMrFJ
   PJiNpAFS1MGUz8H45oaqJglrOGWy6DQ/WZIRfiZGKYxUpvCdp+86/rxnN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="392177846"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="392177846"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 03:56:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="1016610155"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="1016610155"
Received: from sprenzel-mobl1.ger.corp.intel.com (HELO localhost) ([10.251.222.26])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 03:56:05 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hdegoede@redhat.com, Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231129181654.5800-1-W_Armin@gmx.de>
References: <20231129181654.5800-1-W_Armin@gmx.de>
Subject: Re: [PATCH v2] platform/x86: wmi: Skip blocks with zero instances
Message-Id: <170134535986.1693.13811439093104640324.b4-ty@linux.intel.com>
Date: Thu, 30 Nov 2023 13:55:59 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3

On Wed, 29 Nov 2023 19:16:54 +0100, Armin Wolf wrote:

> Some machines like the HP Omen 17 ck2000nf contain WMI blocks
> with zero instances, so any WMI driver which tries to handle the
> associated WMI device will fail.
> Skip such WMI blocks to avoid confusing any WMI drivers.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo branch. Note it will show up in the public
platform-drivers-x86/review-ilpo branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: wmi: Skip blocks with zero instances
      commit: cbf54f37600e874d82886aa3b2f471778cae01ce

--
 i.

