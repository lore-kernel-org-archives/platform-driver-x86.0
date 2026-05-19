Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701593769E4;
	Tue, 19 May 2026 14:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779201957; cv=none; b=Uu6coQ4+o3LxkmrIXPTnrAAjX0lQlNaer+F2LBDx1mGseuFoKb3D51gCpmPCPAJJYPD/FqC4hvu2rfnIQjmditwy64ts8FS197u9nscr1jtpQ5ixGnkKdSZl58m0L78zXYL6CjwrFx+VoqBHSJfjbcfTlZf0K/62mWtgISCkv60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779201957; c=relaxed/simple;
	bh=H4nKXXanJ5QDISUhT1dhPDZC8s5e/w1mHL9S/Yl8SSY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=raydWbpMlq36NjdpvBbCIm2W8k5uAL3/aZjRS6mypqUMlvuOahTv6vQKFlAFfvFCVngk9sbtwEefZKf0HFQsiB1UvWaVP/FGUazyhcGSDG0RN/V1b0FsZ11+K+4Cl2j/kfpkC8aSBNbOVPoly+JEijerD1Zy48G7e/n6VgS//W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AWN58OA4; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AWN58OA4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779201957; x=1810737957;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=H4nKXXanJ5QDISUhT1dhPDZC8s5e/w1mHL9S/Yl8SSY=;
  b=AWN58OA4TCiiBfAjEisEOaDJ7SF8bBsrv/gL4TYkv5RVuZZRtuD0ANrT
   JNJl2o1tvbCSHYYl0OQ12uN1y/SyfNc/FDkzczlByA9qyN58tYjMf3FKF
   tmST7JpjRkSwZ4mer9oZGnE+ga1CL7NbB6mluRtppWhQuHTC+OO+WVrr4
   D5mkyArFhNJBaSjurVWbkDeMEhC5FwyK/rgBlM8apEp0M7xKQPpi/lnMV
   Jk2Ps3znOf3ruX7Xo5dwHCKRpQT+o84pRg/XK4PKLSEIZ/TKhRN0YJPlC
   EesYylTXN+Q+eBZwlI5ruFf9PZfl/WMpEWibHzvJpqXWrg7Hx5b22GKvN
   A==;
X-CSE-ConnectionGUID: OiANWIhHTreNdngtw0qenw==
X-CSE-MsgGUID: Iak6o3l5SKuoJitcrwKZqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="90383171"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="90383171"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 07:45:56 -0700
X-CSE-ConnectionGUID: homFnKz+RhCO33j3pWV7nw==
X-CSE-MsgGUID: SOJCNLynR/aGSKwzhyD28A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="238793328"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.236])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 07:45:54 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D . Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, Ahmed Yaseen <yaseen@ghoul.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260517182957.11069-1-yaseen@ghoul.dev>
References: <20260517182957.11069-1-yaseen@ghoul.dev>
Subject: Re: [PATCH] platform/x86: asus-armoury: fix mini-LED mode get/set
 on MODE2 devices
Message-Id: <177920194856.22546.8977556965820011272.b4-ty@linux.intel.com>
Date: Tue, 19 May 2026 17:45:48 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Sun, 17 May 2026 18:30:11 +0000, Ahmed Yaseen wrote:

> The mini-LED current_value attribute does not work on devices that use
> ASUS_WMI_DEVID_MINI_LED_MODE2 (2024 and newer models).
> 
> Reading is broken: mini_led_mode_current_value_show() fetches the mode
> from the device but then decodes a literal 0 instead of the value it
> just read:
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: asus-armoury: fix mini-LED mode get/set on MODE2 devices
      commit: d2d2e7c8fb37b27301ee5c8343b2f7037efc6ea6

--
 i.

