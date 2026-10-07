Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24AE470122;
	Wed,  7 Oct 2026 10:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791367884; cv=none; b=R70egJDpJDjyujHTvx4SaQ01JMg+stvsvqBTU6EcZWE7ggBVpdY7hY8s7pH0Vst0FnA7SingcgrGuZL2bo65HuMQ3MNuZ/BZWG6slCM2S8GKjAIiMN4R6A2UcQBWfRduyoeMkMA+MuWpjHtXGziyDyqMfdSR73/0uXeC7WgYOzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791367884; c=relaxed/simple;
	bh=AqLm+L3n4IQW15T8UugQRnIhFWHy32aVb9lIFK8Wzmg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HWmOJwgJxhrAIfCLv+q8rhc0GBXx5d8YwLBgq7woJ5vKkVDEh1qwnj52qlbt/91oO8EEh3U42rYs1ZERIzjlc7FlHrwxwxMekGiGZBCqxRRL3hSqLvhaafQoocH8v3mIsAn7bz1k/Kf/mcp7UN4NrpWE1kJ/IBcfRVAuj3n69H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hnnzdEMv; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hnnzdEMv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791367875; x=1822903875;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=AqLm+L3n4IQW15T8UugQRnIhFWHy32aVb9lIFK8Wzmg=;
  b=hnnzdEMvJRQ6gK6pXcTedXQQ317uY+0lJaPo2TCLkjXp/pw4BmljxM4d
   5RyTxtJh5Mtn0SlDT9b351dP1Pmjn93AwHQCeOiQyOx5hokP6Eg4tFzpa
   ikkLR5DDzqoDv1SmqmJQh8qEPKoNLx6ymA7WMJdMGEjMiBnzJcFqmtmP7
   3SF+9a2blgK1KUQJjwrzD6bHSPklKcuWLzo80xUtahru4nOSDzBfpdi7K
   OWgli6oVZYOmTB7/cKvKnP9I00tyDFbWaxVWol1Bd8SoAp5lORiJ9bqt2
   oLiKGUxZTDBTAzvbYKBCOU/JrKbccSacvgrN1fpr1mN0Cy4yDJqXVu7co
   w==;
X-CSE-ConnectionGUID: OZ79qn/XQyGIo4kVdmF/1g==
X-CSE-MsgGUID: 212L8BKSRsi2YXYjYIuing==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="8886"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="8886"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 03:11:14 -0700
X-CSE-ConnectionGUID: 9I7T9LLLSKSnYchsmh3ESA==
X-CSE-MsgGUID: qUBe7+5NTrKXlAoKQ6yhPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="21904"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.13])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 03:11:11 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 7 Oct 2026 13:11:07 +0300 (EEST)
To: Shuwen Bao <baoshuwen2013@outlook.com>
cc: Hans de Goede <hansg@kernel.org>, 
    Krishna Chomal <krishna.chomal108@gmail.com>, 
    Emre Cecanpunar <emreleno@gmail.com>, 
    Suryansh Singh <technosfan14@gmail.com>, 
    Radhey Kalra <radheykalra901@gmail.com>, 
    =?UTF-8?Q?K=C3=BCr=C5=9Fat_Abayl=C4=B1?= <hello@kursatabayli.dev>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] platform/x86: hp-wmi: add support for OMEN 16-am2xxx
 boards
In-Reply-To: <SI2PR04MB58958F552F0DDCC81D90CD41A2942@SI2PR04MB5895.apcprd04.prod.outlook.com>
Message-ID: <c2ae2ed7-c5fd-9318-386a-276802e9e7ae@linux.intel.com>
References: <SI2PR04MB58957D08A31E56D73C751885A2862@SI2PR04MB5895.apcprd04.prod.outlook.com> <179122230394.27048.9839062081057759183.b4-ty@b4> <SI2PR04MB58958F552F0DDCC81D90CD41A2942@SI2PR04MB5895.apcprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 7 Oct 2026, Shuwen Bao wrote:

> Hi Ilpo,
> 
> Following Krishna's review, I have sent a v3 of this patch which moves
> board 8F1C from the thermal profile board list to
> hp_wmi_feature_boards[], mapped to omen_v1_legacy_board_params:
> 
> https://lore.kernel.org/platform-driver-x86/
> SI2PR04MB589508E55CCCD8E26E53E4DBA2942@SI2PR04MB5895.apcprd04.prod.outlook.com/
> 
> Since the v2 commit is currently applied in review-ilpo-next, could you
> please drop it from that branch and take v3 instead? Otherwise the board
> would end up listed in both places.

Hi,

I've dropped the commit now but I'll process new patches later, not now.

> Sorry for the extra churn, and thanks for your time.

No problem at all, it happens all the time we need to reconsider 
something to get things done the best way possible.

Thanks.

-- 
 i.

