Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458050;
	b=wtSNCR6HYmcP+YRVVbTNnklpqnbamiYM4Ertrjth09hU/ZCsSVmyrPY/khenlhDR/vAf
	 Eo2FM8m9ZdCO9Mljv+8TceY1yyaTlG6F5QOuE1Wz0wEaFmAkNeGpqUVgSZFfmJUqfSkeD
	 d8lvueI+KYGA4AR+M+s1Pk/wsveiB/VryyKzEfqCefQsZAwt7U5lWEnRyIB/oRvSEB2OB
	 x+2aybb+h+iMYp5xi9I+zbdghhfwaUVyaWCwVirF61cWU3xDsYQ9cdAtFwvEXGtQQ0SBt
	 v0yVgfHRQwLSNGL14DTOfFlaYLdFQ1ynoUjFjKljGj9eFIgZyq/NAMdA80zQ23lu4Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458050;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=RSnwQNIin5woasohBT/rrqCx37iQok9tjzxsxyjd4Hs=;
	b=fnuGo85/5ositYyjXEQ/H0PSZTrBaqS1XoJi8VR4vEEwgZ4MT5TqWh2bcAnZiIlHPhvX
	 tKWtdBQpia7zMwWuceEt2onVY23WQZZTpvCbwKxaSahepkd0TE1BZhJtct7hnzRXAipWV
	 W9V61wtYfr3pBjb3uqkxpuGtpmd1HyYhXJw4/LR/z4x1bpUVdelkARAhsEubUezg6F3T2
	 SCJeja3byvjAP/cW5JQ+6kX+emCWVVRAVfhCkZK3zNDrRbi6V0V2GfaTLEwd5mKloHLq+
	 yuTzsi7mwFCRrIu5kLu64Rt+/oAWm956PYQeMl9Zwe7JG+iDMmoTY9k6Oy6Teg8vEzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d2uibZJp;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A16606A31F;
	Mon, 23 Nov 2026 18:20:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93A16606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d2uibZJp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795458050; x=1826994050;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=nGdb4QswisQGI7d7KUWXHjD/dN2G5kszNn+cPtKDiyg=;
  b=d2uibZJp9En1ki4oH1gLCrUM6gkExa2ydnqixdx6Ps/hXirTVv5Xgdx7
   6cgVLmBeBmPMi3OCZ1s+X9oxrFqxpcuGoEI74rsnqV4lmUisiV3olbK0w
   dTWRj1V6FB36jasVDQq7OO/wm/4Y9Uolxf1ToHSNCfHSwmw15NDn/WzKf
   P4e00k7tJtnqBaqfHe4wxoF+WB1ElVfocas9E9kU2iBzoBbBHxL97ezng
   g9H/S0HnICqZMZkfjG25nZb29BYGUmazZk27YNAJ103mhSQnpNs2EfwZS
   qJJycr7NLn4UjVQoUS5pC+Eg1ALHNc/SgBYcNl79D0G2YXPD0LWUV7z5r
   g==;
X-CSE-ConnectionGUID: YFRKXE6CTLqVdpenv5ggdw==
X-CSE-MsgGUID: 3lSHhNMiT96CMAI3E7wGWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4175568"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4175568"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 10:20:49 -0800
X-CSE-ConnectionGUID: gxpbao1NQIapnv45rjZ4Ew==
X-CSE-MsgGUID: KJR801QbSuSSNPCulv180A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11679447"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.225])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 10:20:46 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, Hijae Song <hijae99@gmail.com>
Cc: Antheas Kapenekakis <lkml@antheas.dev>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261108020351.62494-1-hijae99@gmail.com>
References: <20261108020351.62494-1-hijae99@gmail.com>
Subject: Re: [PATCH] platform/x86: ayaneo-ec: Enable charge control on Flip
 KB
Message-Id: <179545804082.12968.5735510498620654520.b4-ty@b4>
Date: Mon, 23 Nov 2026 20:20:40 +0200
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

On Sun, 08 Nov 2026 11:03:51 +0900, Hijae Song wrote:

> Flip KB was matched to quirk_fan (fan control only), the same
> quirk used for boards without a working charge-limit EC
> interface. Testing on real hardware shows the charge-limit
> register works identically to AIR/AIR 1S/KUN, so switch it to
> quirk_charge_limit.
> 
> Verified on real hardware: switching charge_behaviour to
> inhibit-charge stops the charge current (status: Not charging,
> power_now: 0), and switching back to auto resumes charging.
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
[1/1] platform/x86: ayaneo-ec: Enable charge control on Flip KB
      commit: 89d070e138afffe8184daf0f5d0f3be013898f37

--
 i.

