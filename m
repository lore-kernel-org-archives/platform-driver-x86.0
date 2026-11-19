Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099363;
	b=rJJNIMLKP5hPuSPHHA/sVeO+7vMNGfFKiJaHbbev1FS4yomdpiodvLW6UcbI1nb0fs7g
	 cOV+Dc06sbJ9SimxEVHyAQIHbUjQ6WwrYvyI9bww8H6PluybvOzMhqTlPaYnfVSLF8zRM
	 oois7kEei2++AlfDJjoQbaxWkKrbO6yLUgPZTon5GoLGuS0uf9dJMrs7ktIdnXI+sAMUy
	 7Gxn+LyFTEzUyPEoEv1HW+PcM0qXagHcQjmWUHzdLNgLjkBkrspEtTN4HUol/+/ulRQ68
	 KwwnIkNjGO7sVycapfSSoHc6zwvQoothF0Ju+gJfgWCYjfglt9ZcU+/ZnHLBwdUkH9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099363;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=B/3acB7R2OBwnLU7FlZ0iEJoNT1YWh89GEBXawmZA+4=;
	b=NQQi+w2O5yxLMkwVwQ0n8JhG2l3h1CHiMFQ6bMuDXrnVUqDcME1YgkyLtWsJW4kUy8h8
	 4dut98SX9mQzP0q34C64X/G0SL0G/IoQvHdjd/sT3a1eQp+WM0OLvSo+YazAioFOgiBC3
	 EPH4e4GBmdJwbMYcrGni7B8qo0fhDY9nDH5a1aGlPvsl1hnl1ObFqDWywGvgu7YH2hgcO
	 UDavyEMnPBrNAOTdR8cujIXGoS3luYVsZocqhajR6R6JYfkUCp+TUH7g7wBgeyufyucDz
	 e8vk7mhi5Mb/G4PMvziINk0YnnA+VuBpb0/KwcLOccSzDjT4aHmZwMuD+YHOx7Xn4tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a3M2W+Bj;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6A3606A320;
	Thu, 19 Nov 2026 14:42:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF6A3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a3M2W+Bj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795099363; x=1826635363;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=hJMdHhsLClrpqhCamU1k8zmXkE45r6ARdLiMo8wmyV4=;
  b=a3M2W+BjanmFaKrXtHHt5kfiifuO5JkS3K/CNKYad96cOrYUJNEf/gLo
   0jzTMknHzhzCKyYjfoqsCwjAiqsC2iy8uRGbnNIRQh+FzYRAO1a6JFwU8
   ed4Q7QtsaT85Kr2ZUkPiz+pDjHm8xmRAPt4oOLpr7tMqEO0Cen9BsYrxF
   zv8LuohrpIa2SC4CyLd+di0eraOa6jw2MOyzi4dmeXIvBBgJ7KRUrrHry
   2LRxZJ3c3zhc/gh9Mfb3nUFfRadKUtGwls9A1B2z/A3lj/NcXwnzm8TX2
   XtkjBvAmV5V7QvNldf7Z5UtMZO4wX9SZMOEmojVdWl4gNgo52Z8c8z0y2
   g==;
X-CSE-ConnectionGUID: LwAIiRJNS8aHb6JVZYWdvg==
X-CSE-MsgGUID: zFO5rEfnRnGleO7O/7iORA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3849537"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3849537"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 06:42:29 -0800
X-CSE-ConnectionGUID: EyD5h7K9R66WTSVPwZJ+gQ==
X-CSE-MsgGUID: fWNSePyzS9SiyT3+HkSIUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10786327"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.132])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 06:42:23 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, Rong Zhang <i@rong.moe>
Cc: Vishnu Sankar <vishnuocv@gmail.com>, Vishnu Sankar <vsankar@lenovo.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ike Panhc <ikepanhc@gmail.com>
In-Reply-To: <20261110-leds-trigger-hw-changed-v8-0-2717115d612c@rong.moe>
References: <20261110-leds-trigger-hw-changed-v8-0-2717115d612c@rong.moe>
Subject: Re: [PATCH v8 0/3] platform/x86: ideapad-laptop: Fully support
 auto keyboard backlight
Message-Id: <179509933622.9442.14269678577307602965.b4-ty@b4>
Date: Thu, 19 Nov 2026 16:42:16 +0200
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

On Tue, 10 Nov 2026 23:47:01 +0800, Rong Zhang wrote:

> Currently, the auto brightness mode of keyboard backlight maps to
> brightness=0 in LED classdev. The only method to switch to such a mode
> is by pressing the manufacturer-defined shortcut (Fn+Space). However, 0
> is a multiplexed brightness value; writing 0 simply results in the
> backlight being turned off.
> 
> Decouple brightness processing code from LED classdev, and add full
> support for the auto brightness mode. In this mode, the keyboard
> backlight is controlled by the EC according to the ambient light sensor
> (ALS).
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
[1/3] platform/x86: ideapad-laptop: Serialize keyboard backlight tracking
      commit: 1f002f1c187a9fd774da3238a663fa521fcfc759
[2/3] platform/x86: ideapad-laptop: Decouple hardware & classdev brightness for keyboard backlight
      commit: 456108d0cd4d63801006ba7df7d458be27108da9
[3/3] platform/x86: ideapad-laptop: Fully support auto keyboard backlight
      commit: 074d1042a084d77bede64298143680da16833e6e

--
 i.

