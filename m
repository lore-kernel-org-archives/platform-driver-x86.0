Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KPCa8c/7"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 159741AE
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Nov 2023 04:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700743265; x=1732279265;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=lTID3XRfNb1ugzyJ7po1mt6wqJaTqh35sWCWWiIryCo=;
  b=KPCa8c/7+Z+mr358Nu8QQYVw+UgghsqX0xKTep1aDyg2aSaJK2MHqOR+
   nCTD7j6DS+DxdgvCmHvDra1JmlBu8AEjNp0W9qZJudBgK53NF5EO9TBkf
   hl7keMv+kV6zqM3dsxY/9IDbSBtuBeEgeoyRDPEgKWmG5oz511NjYODfs
   lBkVce8uH2ZiZsSkKZH1HtegOM7zrvXsOQH4iDuLnR2Tz3Qs+Q4xiokOq
   aMa7RT78cXwYvF2WUFX/N4BtQuaDACGcFUNWAmLpmW70zg5NPYn7PD0v6
   JwrAn8gvvZrT44P3u6uFn1p5H9hf2+HUSm4Jr3EtNxXj+X5hiyZROeqSH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="391138266"
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="scan'208";a="391138266"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 04:41:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="884978549"
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="scan'208";a="884978549"
Received: from mstrobel-mobl.ger.corp.intel.com ([10.252.40.70])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 04:41:02 -0800
Date: Thu, 23 Nov 2023 14:41:00 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
cc: Andy Shevchenko <andy@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, 
    Kai Heng Feng <kai.heng.feng@canonical.com>, 
    acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 0/3] platform/x86: asus-wmi: Filter Volume key presses
 if also reported via atkbd
In-Reply-To: <20231120154235.610808-1-hdegoede@redhat.com>
Message-ID: <f7b5df27-497b-de99-35e2-913a1640b48d@linux.intel.com>
References: <20231120154235.610808-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 20 Nov 2023, Hans de Goede wrote:

> An issue where volume keypresses get reported through both the atkbd
> and the asus-wmi interface has been reported here:
> 
> https://bbs.archlinux.org/viewtopic.php?pid=2128536#p2128536
> 
> This series addresses this. Unfortunately the reporter has fallen
> quiet and has not confirmed that this fixes things, but the fix
> is straight forward enough that there should be little doubt
> that it works.
> 
> Ilpo, the first patch in this series is a straight forward bugfix,
> can you merge this into the fixes branch ?
> 
> I guess the rest of the series is a bugfix too, but since this
> is untested I'm not sure what to do wrt fixes vs for-next,
> what do you think ?

I just took them all into review-ilpo and will propagate them to fixes.
I don't think putting them into for-next wins that much here.

-- 
 i.

