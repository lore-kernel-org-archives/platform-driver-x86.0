Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793095730;
	b=naVTzR56NiWrgcgsWfy7GzLQdONppIqrEQ4LHpI8WtjhHPnPrna6hICI2cztoEQh1aQa
	 B6WZyIBcd5FZAuiy9fxPu+CjzzAn1zSjsD8ltzSwpr35xjjL1OWNJntLU1vndNikMWGP5
	 QLjvaqYEFyxsg7JhobqMoL6Mqd05/zfjmESBP7g8XE2nMVrsqF1nz+oZJoiGbl1X7Gsns
	 u9De32zlhmcjUWEvYoOjn8xj2ys/he5SlpvdpsJHKaJBc/0altl6hJwM82dXNPl1S613m
	 D5e/hVlZwb7/4l2FrQbeKojEoRejyNqWeiZl0vQJTss73QZ19cO88PdGZF4GDVognVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793095730;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=bUnhuLDccQ2EJOKypGWrM8Na+oST5CF+rR3blOJC0dM=;
	b=md5HvwkTvJuUBGJnd5IWKBMUiafyS2aA0NnlFLm3de0CZrA+jJdh97u8xRCPoWSV1Id6
	 N+18rAh4X+gcrvRB1AG88acz+CcKqgCn32cctY5hGZ41IH1A5tynWYzGlYp0D907VIltf
	 wOL90QEfl3jWY1WJvLzp9Hsolz+ftP43TwpduyiAciBrDaU6tjMXKI3jXzS83+3PXgTcL
	 0cq5YGrcpRIRHfCgGBVCgde9ViO8IKOmU4vuid2BshtIE9VqdjPEhxMYgZcy35xX5W/2J
	 +EIHSwUF0V843zrK3R5TF49omumEZJ7gLjZb45p2+4ud3tQX95D9vdDTe4vBIKLv+Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QxI3udWS;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A356606A31A;
	Tue, 27 Oct 2026 10:08:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A356606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QxI3udWS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793095730; x=1824631730;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=PXVjKOq9yXVKq7T2TesWWrVTVsVG13MhgXN7J4bwxTo=;
  b=QxI3udWS47FTWcDlNw3kq8XywKSHHIQJASgzCm3yKn/4EH7q9kqEadQ6
   8R0/t8V4IPtJwGHgZPsw0OTnlk1HfBtw/bMChSY0STMhXnoWvtG+yG8M+
   jFEIw+gUwnkkChNz767mZsbAvvjL8rxK/pNQcsgoCGRfwK2jjNmosErLX
   lZ3q/5GNM46QD8iQ/4OKQaDjTljOFcMnbUfblD05ljuhkMD4KiJbCkQ57
   s5VrbqYVlFzUFL3SysGWiIiwYB7U2QPRyRN9W8OjT0I490tqL1g6VtmFH
   okz3qf9ZSVdyoKebBqg26T934KcvCfuJJIbPo30oYHkwn8zCDViyMWDSa
   A==;
X-CSE-ConnectionGUID: PwRxvxjYSjKEJP+Gi4xQBg==
X-CSE-MsgGUID: +/mSYiSuRs6v2Pt+U7WhgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1681566"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1681566"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 03:08:50 -0700
X-CSE-ConnectionGUID: XK82nDKkSaWg+fq96OACqg==
X-CSE-MsgGUID: OT4HTNkUSOCG+Tb0+tEfXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4587848"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.30])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 03:08:46 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 27 Oct 2026 12:08:43 +0200 (EET)
To: chipang_kao <prozac2734@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, W_Armin@gmx.de, corentin.chary@gmail.com, 
    luke@ljones.dev, denis.benato@linux.dev, scardracs@disroot.org, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] platform/wmi: Move ASUS platform drivers from x86 to
 wmi/asus
In-Reply-To: <20261016063427.664738-1-chipang_kao@asus.com>
Message-ID: <4c78b25c-0873-d6a9-2672-67eacff3c29a@linux.intel.com>
References: <41d6bd7a-e4ea-4077-87e3-e60102ebfef3@kernel.org> <20261016063427.664738-1-chipang_kao@asus.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 16 Oct 2026, chipang_kao wrote:

> Hi Armin, Hans, and all,
> 
> I tried moving the ASUS-related platform drivers from
> drivers/platform/x86 to a dedicated drivers/platform/asus/
> directory. Most drivers compile successfully after this
> restructuring, except for asus-armoury.c, which depends on
> firmware_attributes_class currently defined in
> drivers/platform/x86/firmware_attributes_class.c.
> 
> I found that Sean Rhodes has submitted a similar change to
> move the firmware attributes class:
> https://lore.kernel.org/lkml/ar0DNFlI7MEA8zp2@tzungbi-laptop/
> 
> The patch has been applied to the Chrome Platform tree's
> for-firmware-next branch, but I haven't found a corresponding
> pull request to Linus' tree.

As per the the usual process, PRs for branches containing new 
features/refactors are only made during merge window (i.e., around now).

> Is this change expected to be sent to mainline for an
> upcoming merge window?

It is now in Linus' tree.

I'll try to get platform drivers PR done today as well.

-- 
 i.

