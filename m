Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1CD2EFD9F
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Jul 2025 17:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753465634; cv=none; b=PNS2v6qnBInk4ecsTy8suVhGwTRgYjFADlQYf3r9CqB2TqPAwH+G7B+m6T7Clq5Yvt4r4O8Syup9wbejxx3/KIp011a0jk2WJf/dUoNkTQVJDsrkcW0QlspPrNjaCmU+sxEnwIwmIe1KDkGlmNAmSaQtrlsjVai84JeSihWy2yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753465634; c=relaxed/simple;
	bh=iK0ip53I1h6kSpjFUInOYZ7AYLkhYCFq2sqA9A24dho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F42JvMLd9K4DuKRw10LxmHwb6N11FrHPA8TBbjuU0BEk7YamFeSsEnO45IVDQ3zVscPli90yM5m+YIM7c/6h51Jd27iPbEhUyGRuLfg+ZLpaKlgN3OCIwsocqb/ffP9sZwGCNElB+WeAkqVyo7L/qR9HQen0J6QkdGy6poupNSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wiq2EZpG; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wiq2EZpG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753465632; x=1785001632;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=iK0ip53I1h6kSpjFUInOYZ7AYLkhYCFq2sqA9A24dho=;
  b=Wiq2EZpGCYNOzEXI7DDFh6Chfa9Z2LuaGkokLwty55o7Az+Y2khVraIr
   gwBhHCEKf36JnVsObM8Z/aDExg88xMJVaWy3YIXpI2rb/8Tw3cNHGe7aU
   GJ8yNbfAjMemSvHA/Z88sDSO7mBLvbabLtOZaaDBra+OSsVYSAqyWkZgr
   61+neVyMIrRp2qKO/luyGfQpvo+apC1MAb9rbozR4wS3XAAXv9HU6jwxX
   4rpNt2cq03qxOu+riav+pq4E4s3wpNQ8uC9HEizfJC3enMy9BTKMI2hEw
   9uR1G2OcWV9VVzWA/KrJ3Vmca0WY52pcNHdfWt2373l84m/G1cyK1tbNi
   w==;
X-CSE-ConnectionGUID: ZyirKIp2QF24iaz4hRWw/w==
X-CSE-MsgGUID: 175oN+GiQaqqW2YKrgQCtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="55956866"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55956866"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2025 10:47:10 -0700
X-CSE-ConnectionGUID: VLAf8qQmRSaA/oydtoLV6Q==
X-CSE-MsgGUID: +X+KzrzDT0u215vUlNqRzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="160223369"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.198])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2025 10:47:10 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8419B11F8AF;
	Fri, 25 Jul 2025 20:47:06 +0300 (EEST)
Date: Fri, 25 Jul 2025 17:47:06 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 2/2] platform/x86: int3472: Increase ov08x40 handshake
 GPIO delay to 45 ms
Message-ID: <aIPDGsNVrd7tBvY8@kekkonen.localdomain>
References: <20250725144444.210043-1-hansg@kernel.org>
 <20250725144444.210043-3-hansg@kernel.org>
 <CAHp75Vf7yoLYNTQxgJFbA2FT2dqVJ5BBF0w-uTJsYooON7LqXQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vf7yoLYNTQxgJFbA2FT2dqVJ5BBF0w-uTJsYooON7LqXQ@mail.gmail.com>

Hi Hans, Andy,

On Fri, Jul 25, 2025 at 04:52:26PM +0200, Andy Shevchenko wrote:
> On Fri, Jul 25, 2025 at 4:44 PM Hans de Goede <hansg@kernel.org> wrote:
> >
> > On HP laptops with an ov08x40 sensor the 25 ms delay coming from Intel's
> > out of tree drivers is not enough. Testing has confirmed that 45 ms does
> > work.
> >
> > Add a quirk to the int3472_gpio_map[] to increase the delay to 45 ms to fix
> > probing of the ov08x40 sensor failing on these laptops.
> >
> > Note this only impacts laptops which actually use an ov08x40 sensor with
> > a handshake GPIO.
> 
> ...
> 
> > +       /*
> > +        * ov08x40 sensor with a handshake pin needs a 45 ms delay on some HP laptops
> > +        * https://bugzilla.redhat.com/show_bug.cgi?id=2333331
> > +        */
> > +       { "OVTI08F4", INT3472_GPIO_TYPE_HANDSHAKE, INT3472_GPIO_TYPE_HANDSHAKE,
> > +         false, "dvdd", 45 * USEC_PER_MSEC },
> >  };
> 
> My gut feeling is that this might be needed for most of the cameras
> with the handshake signal. Do you have ones that work without this
> delay?

I'd expect this to depend on the CV chip, if not solely then primarily at
least (firmware could play a part maybe??). Isn't there a way to figure
that out?

-- 
Regards,

Sakari Ailus
