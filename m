Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458042;
	b=4lwdyD+1+tn/nwupW5kuuyIiQQ2XJN/7BHj45u2nAq3mM5cKbiHs6+x9399YlaE2uMda
	 Hm7KPB88XuPCibDa8na3gieMImAOoZ1+3vvXGwbuAhDM9IgbV8ja7PvSOtTseVPSuUhUM
	 53HtpKx/siA9PQCeQbOIEmIZH6xA0X+Rl0J4q/zw+3I4uEK0LiFzfYz5RvfEPoLdeyGNQ
	 +3/TdW7Bj3Zj3Zg2agRqgl2ojF1h7VPPdvcNclWOtx757H/KxLB0/esAh+QXrx4yjqvbG
	 2kQ/OmQvZX6fCURFLFx+yVsFBn7J8rF6EC4aFWyfvttaEY4IIEyI9Yj5OLr7XnPy9hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458042;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=zmlCqUbDNFNA4OODZ2MgAX3LgBaFyVbAcAyLNu0hp14=;
	b=bNdVutkDzRWDu/oGXvTK1OUzRXW+WWjjrys3XAbnTBipDJ+dWFVtWNI0Qtp+537EZqZK
	 Hxf1BQrwNpEgWZRSSDDNDNkYtkyTA8BSvI1qJ7rCz5Rjix/VI8ARoMuNUzw7CcXIfj3i2
	 zz07vWzSuvUNAhJIowCGeSswH4HrRKZuRpK0pAKHGjHZ1Ok/UBmKU7fIvF8nsgcOXEdts
	 oJzYSYBAhh5EpkE61oO23O4+IxVj9IEWYCg1k8mBIXTB30aTxh2lWwnwjpsDsHWx8w1Wt
	 Ut0Pr1jJTy3RBIggKiUd/ecr7+OoINAYASGqlb23hN2YS/8G9yK42X6+aj/Yo4iISJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SsrWGmJ9;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF0F606A327;
	Mon, 23 Nov 2026 18:20:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AF0F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SsrWGmJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795458042; x=1826994042;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=5OczcCF5EfYyIfpB07md1eQdOqgb4w/CK7Wj3lSmQ38=;
  b=SsrWGmJ9zhrwjNHFuNIUA13uPgOjluoWaSOP3hGICutABKFNOAMheJVx
   maKkbBdlW70kz+44OknJNjfe4sXFbqmjVW1t+WjvEluT9HK1HE9TJex4k
   XJ4AcA28294NMlrV2cQZ7nDBrhR72m1gQglxu2uLNYdL/ZgXHimTGPRIM
   bzCJv3KGgJErUgXRB0sjDsQUzHbZMxCPbw0umB+sVSlwww2a0uU7bX0j9
   U3SDOFeAFDZpLbQW+cJUGS6ppnEJcRHp2tBP2y0oEJiTTTNMzqW8kGVyZ
   XxXlcNwkqDa8w4vojPKgpVwQ/Y//0SaIuMdHJG5439S45TDkGbXgORxiY
   A==;
X-CSE-ConnectionGUID: zf7C7xFTRDu+DyiJfhtgmA==
X-CSE-MsgGUID: aY4uEmYtRve/IY5kzfdzPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4165863"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4165863"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 10:20:42 -0800
X-CSE-ConnectionGUID: idc+AQ5RRvqusNPLUj9gUw==
X-CSE-MsgGUID: mKwowQc7R3qj7rmPooMOtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11442774"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.225])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 10:20:28 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Antheas Kapenekakis <lkml@antheas.dev>, Alex Bogusta <alex@bogusta.com>
Cc: Denis Benato <benato.denis96@gmail.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261016015117.32174-1-alex@bogusta.com>
References: <20261016015117.32174-1-alex@bogusta.com>
Subject: Re: [PATCH] platform/x86: asus-wmi: Clamp keyboard backlight level
 from hotkeys
Message-Id: <179545802362.12968.4790919218516193227.b4-ty@b4>
Date: Mon, 23 Nov 2026 20:20:23 +0200
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

On Thu, 15 Oct 2026 21:51:16 -0400, Alex Bogusta wrote:

> Pressing the keyboard backlight down key at level 0 drives the cached
> level negative, so the backlight then needs one extra up press per
> extra down press before it turns back on. brightness_hw_changed also
> reports out-of-range values: 4 after pressing up at the maximum level,
> and ENODATA or values like 4294967294 below 0.
> 
> kbd_led_set_by_kbd() stores the new level without clamping it, and
> kbd_led_update_all() skips do_kbd_led_set() for negative levels and
> notifies userspace with the unclamped value. The level is computed in
> enum led_brightness, which is unsigned, so the subtraction at level 0
> wraps around.
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
[1/1] platform/x86: asus-wmi: Clamp keyboard backlight level from hotkeys
      commit: 1d963a4a54fa1caa58895a15e6c205e4fd014579

--
 i.

