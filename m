Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458065;
	b=4sjA+hjA4+WZ8iJNEFnV3t0/HDgOknGzVtxb4jP9j5cfeSeb4ISMbahuDq6VTaaYU3/s
	 1jPsoKGwzQA/lg1f0jtqOg5gBM5KeIjD5OomJgDpp4nesNf7KIjHa2/KsaIy1v/CSJM/L
	 rWFGHLK4ZZ/B+RaRy0BWSk59LlQ3l7svC8gH5c9+I0mvGmyh4kS4KW1tnvAE/V/FjrNO+
	 sSDj+McigCQE2hxjUvSmXJj51ODswcDVvOR+SpjVuMNp9ullupKhAqg9uMRSxDnBx1W2p
	 O4NI2tI1w3G7mrY5e4HpgZO5PnBn6XYnL/83Sl0CnQMCbXbO4Gb9Pdy9zlGxIzG0Cqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458065;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=Q6ETFvN+r3nlt4We8mvbTyTjBML1v8X9t+CA5ezgWig=;
	b=UlFKYydKRvmEOR8f1Q8/xq0BNknbu0gPhGHMruZRpFaHnCEdrtZVdmtdobNgsdRxPQqe
	 3DZII5K4RdqX6Iaa5936XIQ1PwptRKEY79lrybuZNZDK/VkW/5oKCX6ISEbFS3UM+NOlz
	 mSO9yooMfnlLue1kGdS9/yWye4Xj1wPEgnA2ugYvWWH1ZWgFNuDvgMiWbdnlOH+oUEUxJ
	 ErndG4D/ByiUVGFAW7MgaMPfqVBxf3PviyhzoAohdHRbzSufOW+fezuS+MPggaq0v4xD4
	 I3zYMN9x/iMU6y0Eg3o55/KZ2eKU+1NBAsMVPFLCFoivfrtlc/ndDSkbTO7bo7dCqeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m4yva4cO;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1469C606A31E
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 18:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1469C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m4yva4cO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795458065; x=1826994065;
  h=from:to:in-reply-to:references:subject:message-id:date:
   mime-version:content-transfer-encoding;
  bh=8M++HHbMePzWVl1TMj+CVvfkVyFWnMjmz/C2aa05bNU=;
  b=m4yva4cO+FHD0NstLTjgoS+XMvMxqqFVL5+2mxMz9L39iQ3PDc3/9Ndp
   ccChTaGqBo+6ZoYHAdFx8sBtDMVjEm4OAwJcJfUVWksGsOmRSqcbLX2Fm
   gpQDmekKN+LWxyNLyK+sn9EU0aekk+f9Btbc42LJc4s0rCKjcUnOoc52e
   T5nYKwxz0RfW0WB1+lrJeOEAS+f/q2hmoErWGLhGnuWA1j6pn4Lwu0cAT
   IoGruTUnJiYTBkT3/NwWS6NTTG0Lg2lNewf0rqZaNo7rWTp7J3uBn05VE
   aVDqKftBQEPI5VEDIBm431G0veWid+uo4LSnreHlmqql6l+QXgZa7WToh
   Q==;
X-CSE-ConnectionGUID: ULVyMIh5SUy9bPanQOlWwA==
X-CSE-MsgGUID: 8KStyL8CSFGnyHHjTtTPGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4313768"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4313768"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 10:21:05 -0800
X-CSE-ConnectionGUID: x8KXxIU1RD2Ss0rHfZVIRA==
X-CSE-MsgGUID: ltK3dh2fTpyt3zDBG65CFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11738530"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.225])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 10:21:01 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, Rong Zhang <i@rong.moe>, 
 Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
 Aaron Ma <aaron.ma@canonical.com>
In-Reply-To: <20261119072516.309524-1-aaron.ma@canonical.com>
References: <20261119072516.309524-1-aaron.ma@canonical.com>
Subject: Re: [PATCH v5] platform/x86: lenovo-wmi-other: Deconflict battery
 with thinkpad_acpi
Message-Id: <179545805699.12968.12197417134906141515.b4-ty@b4>
Date: Mon, 23 Nov 2026 20:20:56 +0200
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

On Thu, 19 Nov 2026 15:24:59 +0800, Aaron Ma wrote:

> ThinkPads expose battery charge thresholds and charge_behaviour through
> thinkpad_acpi's ACPI battery hook using raw sysfs attribute groups. The
> Lenovo WMI "Other Mode" driver also registers a power_supply_ext for
> charge_behaviour and charge_types on systems advertising those WMI
> capabilities.
> 
> When lenovo-wmi-other registers first, thinkpad_acpi fails to create a
> duplicate charge_behaviour sysfs attribute and unregisters its battery
> extension. Conversely, registering or updating any power_supply_ext on
> the same battery runs sysfs_update_groups(), which removes standard
> power-supply attributes not owned by power_supply_core and wipes out
> thinkpad_acpi's charge_control_start_threshold,
> charge_control_end_threshold, and charge_behaviour files.
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
[1/1] platform/x86: lenovo-wmi-other: Deconflict battery with thinkpad_acpi
      commit: 61c0dac952b9308884936d05cce97565a5c89af4

--
 i.

