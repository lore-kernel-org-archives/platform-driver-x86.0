Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793040042;
	b=zuR3dfoIqUYkHe26GfaUgeWX+k219w8jyUeke2xKHdlqco9f8ss1ZTZy4iWbo5VhHCRb
	 Bf0q6hD5I4Lc9tF1r7NNfeAv1TH9pv/Az0k+vSXycbvRiyz+5/2MqzxPWlhpM+iWJbazg
	 Qem8ea5xhP8LxzIKV+ZE4Bxz1AsH8ksUfLRPb8wYr/QA1e5aefP9TpYyDbVtYM19z6M2X
	 SLsQSSVEzK4JsC9lifOQ7yQp+l66qjrVhm2uOfK04a8704bUXlkpdEGTEMJ6EXT4VIcJQ
	 mWTjdwacRer0au13B+1HZ/V8qVGHTNiXd1tc4TKdOFzy6hI2jLwawD1Tzv9JUqzKuBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793040042;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=VDgWlMJQtA0qkSiXReN0fJF7Xcv1xmNznGwS0L6pzwQ=;
	b=KSh3yVf34X+6TPXTSkb4DRCuGT1Uh2F0dn0GloXX3sVvqoagXkRQUVnDsq1tBNorOj2M
	 L2BOVDfmXaCmFmATQt/YznxqArC5MF32qlhZqj9gkEBxqB9lfotOdy3KOm6WDrdyr7mOc
	 IkxkU9ynPMzT/TsWSCkKFhdXiZop1Tw2JJOyEBrbLdPHf69zbjAj3rxwLzjN46HfEtMGt
	 O7I0E4WLImejlo+jpdZ7PtK4N+8t/YVV8PzNycO1NotLB6I2qdT6Kaxud2SoGjGAoWPX5
	 5OawLz1XBRY21fb1uNwDppr1AWTpNDoMFB5mapqarYXwi3j4SKWGHjByZnieoFOfGbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EPnPLQsu;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021E9606A31A
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 18:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 021E9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EPnPLQsu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793040042; x=1824576042;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=om9J3y2TB2i+5V13CGaSt2Owb4FzKUd7N5XjeGX0zbU=;
  b=EPnPLQsuYMoRVurUgzZdpx2pIJlHiozYWHi3qhRCAr3Gil2gQEBXCT5w
   pO6g+CEGAyQi670T6/5CssLOS6ddymQE5OQH6q6x42WwXZHQvLo4ub9G8
   HCBlYcNUZdAejDphjkQozPWg78xTQlMlEriCI5TJsGyv4x15aR9NqnPrl
   8D/BRpdZb0MIJ3I4tHyX+WGXloqNEcpRVW6smHq1rQXAPFf9/Vvi/jJ5q
   jzUEIFZ54t+7d5H0iVibW+hYsfooHJzbK/ttsSwCheBqV+vR/Gt/KnhtB
   rWYW5qmpgmfJf/Lqb5CjrbqQH2BbBCU/0BFg8XJFn7aLaGJLP7yZ6BsNf
   w==;
X-CSE-ConnectionGUID: ih4f2eE0QMaWuDa4M11jnA==
X-CSE-MsgGUID: vJ1w4WBBSxifefAGmyzR2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1611816"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1611816"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 11:40:41 -0700
X-CSE-ConnectionGUID: MoZD0toJSMeIz9Xed617Wg==
X-CSE-MsgGUID: 85gt4+2KTDC2D2JeLzIWKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4247700"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.109])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 11:40:39 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 26 Oct 2026 20:40:35 +0200 (EET)
To: Chris Simpson <chris@nilk.net>
cc: Konrad Dybcio <quic_kdybcio@quicinc.com>, Hans de Goede <hansg@kernel.org>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, janussss@163.com, 
    luzmaximilian@gmail.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] surface: aggregator: propagate -EPROBE_DEFER from
 ssam_irq_setup()
In-Reply-To: <17d6081f-50e2-42b1-831e-34ad02b7240f@nilk.net>
Message-ID: <a8f480c1-a50b-dcd6-dfb4-70aff42a7840@linux.intel.com>
References: <7d51f80e-9552-957f-f32c-1d608042b647@linux.intel.com> <d0bb21cc-6d3c-4526-8204-2511da51a6ac@nilk.net> <2faa9857-9d55-a607-bd46-588598b64ca4@linux.intel.com> <17d6081f-50e2-42b1-831e-34ad02b7240f@nilk.net>
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

On Mon, 26 Oct 2026, Chris Simpson wrote:

> Hi Ilpo,
> 
> > Are there some legimate cases where error other than -EDEFER_PROBE should
> > end up into this else like it previously did?
> 
> Two corrections to my earlier mail first. The Surface Pro 9 here is
> Alder Lake (i7-1255U), not Tiger Lake; its GPIO controller, INTC1055,
> is handled by pinctrl-tigerlake, which is where my mix-up came from.
> And "follows Ilpo's comment" was my misreading of your review: the
> gpiod_get_optional() idea was mine, sorry for attributing it to you
> (v2's "Suggested by Ilpo" comes from that too).

Np. The end result seems better even if there was misread which triggered 
that. At least sometimes misreading ends up being useful. :-)

--
 i.

> On the question, I couldn't find such a case:
> 
> - DT: microsoft,surface-sam.yaml requires "interrupts" and has
>   additionalProperties: false, and the in-tree DTS files
>   (sc8280xp-microsoft-arcata, x1e80100-microsoft-romulus,
>   x1-microsoft-denali, x1p42100-microsoft-sp12in) all use
>   interrupts-extended. So on DT gpiod_get() returns -ENOENT, which
>   gpiod_get_optional() turns into NULL, and v2 still takes the
>   fwnode_irq_get() path.
> 
> - ACPI: fwnode_irq_get() ends up in acpi_irq_get(), which only looks at
>   Interrupt()/IRQ() resources, not GpioInt(). On the Pro 9 (UEFI
>   22.107.143) the MSHW0084 _CRS has UartSerialBusV2 plus GpioInt and
>   GpioIo on pin 174 of INTC1055, and no Interrupt() or IRQ(), and the
>   Surface Laptop 4 tables in linux-surface#2219 have the same layout.
>   So on these two machines the fallback can only turn -EPROBE_DEFER, or
>   a real GPIO error, into -EINVAL; for -EPROBE_DEFER that is the probe
>   failure v2 fixes.
> 
> What I can't tell is whether Konrad had another case in mind, or whether
> some other Surface model has a plain Interrupt() there; I've only looked
> at these two. I'm happy to test any variant on the Pro 9. As before, I
> did the analysis with Claude Code.
> 
> Chris Simpson
> 
