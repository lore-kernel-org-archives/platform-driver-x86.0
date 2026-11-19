Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099407;
	b=WRl8pT6vuU78DE8i+pEOPY22TOCsTwcU3eGMymdnQxN/zSFNUYYY+LZHU2y2hFeSWvSf
	 /mAn1q0TBwbiww4K0mCwmqTXyjAh2gQ8xq6wmK4X6PCZSRqxpenLa2bCG1RrLo1yZCwpq
	 PCiozlQjyTcOdgAgZHURrN8NyLqJYGxsA3QbmrQYfs256kHIaxbEDsGii160k1GUpUIey
	 7RQtAw7QDmCWoXX3itkbHEkp1l58yzsGpq8lWkPiGCXOL0zRULhEVLZoXnpTufrjr3YH0
	 kzp2/VQkQHq46/vqSiPBQptCLm8LxDDgc4svYkhmjYczgWrqTH2uW+c+N318631Bg+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099407;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=demdYoUh3CBz41wPUsAO0CkBXDeU2llEJhcTMS6yOPs=;
	b=OGVBGVZp/ZftiU8Lr2GTTRRg9ypHsSLEDK34gUhAAkpt7f2cKEyn92e5Ej9NCFr3535+
	 GUcG12gqZMbMAMUqgtmHp+OeVbzTH2W2Pv6l5fVnVHlUbvwTnoZ9m5jB1guVsfe4E4Qnl
	 Js82DXd329WYZUJpr6HDfsGXFaH1cRUERt5RM82aOdFnGB2cHwSIPEVptoDqX+R6/GAnE
	 IyHtLCSlHFFELGMqKiV5r8BHec98XlaEMjv56GOCyL3LbJdoUGnL5ilSfV/uz6p7ZJUGJ
	 SQBa6M9EzvnwHLX/Jjf6RzyZttlsQwGU5Eh6AfKrQyuRDg/RhrNQll27BOAojVzl5DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SGZhAIwt;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C24F606A331;
	Thu, 19 Nov 2026 14:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C24F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SGZhAIwt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795099407; x=1826635407;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=5JOVO+67Zi0U6eOLZ2mkJf95k1BGWTous6a4k2WQzxo=;
  b=SGZhAIwtHgvoElIxSDLvEfYaeLUkLxwpf0dND9QWLmGvFnm1hZovlW6c
   xSAaGy8J5KK5K8GHAWfin1uEtqZAotuixDQWWqrOs6n+vzaZertc9eZLB
   8bQzHIcNlGEaTeMmJYeQYdYQ9uaGRdTorERRI6kQByqu4oPWXJc7uiaR1
   NHGyTAMtmrcai8I+0O8aEfbt7iDIyRIkvHHGHrLoTg/uyg94A37V89O8Y
   Lr8nJIdkXFtbZroFUtvS3EQISGl5cieNSiH87cC1SKJUeqUfxb88R21ij
   amjgGo8UrEllhM+dzlSq4PrWgAsfcGjhDL4BCMElvj173SSWUMXNwlPB0
   g==;
X-CSE-ConnectionGUID: 4wjSOZgxQZumAhko9ud9RQ==
X-CSE-MsgGUID: WAko3N7qT9ao5jVj/88y3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3942655"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3942655"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 06:43:16 -0800
X-CSE-ConnectionGUID: uHnt91lDT4GRWHIpTlmGlg==
X-CSE-MsgGUID: mfHZeB3OQfu7BS1sT8fr/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10792639"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.132])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 06:43:12 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, 
 Arnav Kapoor <kapoorarnav43@gmail.com>
Cc: Ike Panhc <ikepanhc@gmail.com>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J . Clark" <derekjohn.clark@gmail.com>, Rong Zhang <i@rong.moe>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261116171817.21802-1-kapoorarnav43@gmail.com>
References: <20261116171817.21802-1-kapoorarnav43@gmail.com>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Add V14 G2 ITL to
 ideapad_dytc_v4_allow_table[]
Message-Id: <179509938656.9442.2316950035532050416.b4-ty@b4>
Date: Thu, 19 Nov 2026 16:43:06 +0200
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

On Mon, 16 Nov 2026 22:48:10 +0530, Arnav Kapoor wrote:

> The Lenovo V14 G2 ITL (82KA) uses DYTC version 4 for platform profile
> control, so ideapad-laptop currently skips it and logs:
> 
>   DYTC_VERSION 4 support may not work. Pass ideapad_laptop.allow_v4_dytc=Y on the kernel commandline to enable
> 
> With allow_v4_dytc=Y, platform_profile registers with low-power,
> balanced and performance. Each profile reads back after it is set, no
> ACPI errors are logged when switching, and the firmware applies it:
> with all CPUs busy on AC power, the sustained package power was about
> 14 W in low-power, 17 W in balanced and 24 W in performance.
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
[1/1] platform/x86: ideapad-laptop: Add V14 G2 ITL to ideapad_dytc_v4_allow_table[]
      commit: f60911c0c21228b5c2b28630b24441c8ae68ee62

--
 i.

