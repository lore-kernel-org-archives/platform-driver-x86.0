Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B4D44D039;
	Tue, 28 Apr 2026 16:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777392366; cv=none; b=JaY4wIEHvVikTIS3UO4JiJh4QyCCXJmVO8fPnRRRG3yDhC/Iv3TwJKNAtHl++OIxZ1xT70Yo9Y2GOafJLJUjPd1NeSB/uWjaO7jGEdMptPTSjR1hrwZExmb6oYqvZWwurr3PFImPm7vxvXR8elwd5wZywqA5V5r/fJqvYX0luuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777392366; c=relaxed/simple;
	bh=9JejUO29b8aEStFmgBb+JakcoZYil9AV8Z4cvYuGvUA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OVzEa1YFLXudbiEOVDTXSt5LAwBayVaMlYVDEk3dh/qfUm5M9XrBrbp7nEVJBWp/tKNKoIloPd0GQKBLZ/SJwggiW3TjXY57+/PDWlysgz3Isbg6SXlEzmjTShSlqVqMGhS458NGo9BEOFtQRQ539BMhNGYq4FDLkzGETBYANQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hs5unUGG; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hs5unUGG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777392363; x=1808928363;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=9JejUO29b8aEStFmgBb+JakcoZYil9AV8Z4cvYuGvUA=;
  b=hs5unUGG/E24wOn0Ewt6WRQOdjZL3fkjb8sU2MRH3DRmhXYuCno6ZQLv
   Gjw2osqdDKXoUx4FCMnmtQTKKtJBas1Pd1E527ezPWqQDnPJLR2zFa3KG
   hoUdbeFj3w2ya0p2nSkgv8X6qMRtJp87BaK768ccpJ8xekwR7tFjzHrUS
   0be/ATDb4DYyiAansWkIao0uYOyYpJ7VXBFnEaKXqh+OwLno5GqArHN4H
   fwY2/JCkaU7iPp/Q5Q13K4kVjUpbt4ET7PwH18cWcDDbpWnoJkIGyex4n
   6cQ+8uR3vlGKTBaWbBhntLDdL4K4i2Zi791UwefloWcFHHSMcxWTUYLm7
   w==;
X-CSE-ConnectionGUID: 2aP1mR+WTLq5DZRHZZaqkg==
X-CSE-MsgGUID: 55165N3fQ2OBSFSgUoo1NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="80881239"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="80881239"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 09:06:02 -0700
X-CSE-ConnectionGUID: gRdiFxXZTpC2pjoQzQD/bg==
X-CSE-MsgGUID: cYdqmVEZSSOlZ/zcuSW3JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="227468339"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.1])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 09:05:59 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Peter Tyser <ptyser@xes-inc.com>, Lee Jones <lee@kernel.org>, 
 Hans de Goede <hansg@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 brgl@kernel.org
In-Reply-To: <20260427-meraki-swnodes-v5-1-ad91cd306472@oss.qualcomm.com>
References: <20260427-meraki-swnodes-v5-1-ad91cd306472@oss.qualcomm.com>
Subject: Re: [PATCH v5] platform/x86: meraki-mx100: use real software node
 references
Message-Id: <177739235146.10973.17800188090938550913.b4-ty@linux.intel.com>
Date: Tue, 28 Apr 2026 19:05:51 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 27 Apr 2026 11:30:18 +0200, Bartosz Golaszewski wrote:

> The lpc_ich MFD driver now exposes the software node associated with the
> its GPIO controller cell. Remove the dummy software node from the
> meraki-mx100 driver and reference the real one instead.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: meraki-mx100: use real software node references
      commit: 0f4a265107902d133b70b1ced12aaea83e3cdeb1

--
 i.

