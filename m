Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458002;
	b=ZXK7qIu+gWPnomI++jLzuAc1z7qDlFJ1gGxMiWfJeSsvxCWkBMypAGWbq/pbpIrGdlXb
	 kRlUDYAKDQWcSrhEvrof1W15ZieTyBf7t0LDS7gZnwL/ycTGkl+ewrQgmr/GPWrWB8KtW
	 0R4M5FH7Afx308gYDHxsTbdGfUl0bY/JUsSALwB82y/KNf+KKiLEB3qmTaIkErE0/Y9B9
	 F6WPNkQF91d2V0Xtk/AXLQXhmrAgKagQ/AshwJ0/uMRHsS7T+jQP1MiCUuLJ4sgktUn7G
	 dr4JkPMX7mxiRFGtEAVFG2QUeTnhlR46LueBh12JB1y02naZanhzcqji/pppucgEtPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458002;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=eJiKC/feSGmWj3Mef86dC6coSoojA+I969NN8FIpo/c=;
	b=Da6TrAYTdTBbRElOXXDHcN9QhiTqVmRox9WtLbwz8BOlnsS4YNVMawiN1c3wQwBjpt4s
	 suroAkT38y9setHTDSmhJ2I16VAHtpDyj60aztaoV3O6H5AfjoivoK19eN4Xhi9T0g0yU
	 vsUzGzcbpDb9DZjos5AJQ9PzWKYeFLKBocOG5aItv2AkCMKDT3/E/F7sahCfNHnRZKsYe
	 9csBGW6rnBLoBl1aZPWNABw8xUhHCXusIMju4J4FpHR9anNtqbkmhErlI60nPCctVrtJD
	 xgRQy4Hf5HTDsZgr2e+jXKIJ5EpgUJoG7k3lOCvSVltPYlOmQuQHcivI9EtQyMhZsCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gIomDRxE;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56586606A31A;
	Mon, 23 Nov 2026 18:20:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56586606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gIomDRxE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795458002; x=1826994002;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=9nJ9hQtFBUR02GILRNPrwju+ezdcRyNCi6F69PWN55Q=;
  b=gIomDRxESFDjK6/XytnKFjimlD4rDb8/8B/AWeVMEftOfUBr5Zi07IEk
   b3hmNPVHD9rEU9ZBEO3NuylMZaMkfCAM9zcXm7Ice+AbQefqi2VgN+hyV
   MKokY/q9L2VW8eDIbFH7B4kIlgy1SJ0WEQvq563XelBhrqHQT8cY0+4RL
   U9jq+JLqB+JOzPELPVXnbEIdWEjBoAVTj18AoFz/vEd4J2KUZnQFfNXyB
   5xfWRs5QtZwHwl7FO+T5ygfABFalluPTkkAgJCrqSRQ4QIAT/Y/S2kKyd
   md3cO1fNs9TflJy4An3kbTah+6eoxaC1n8E+IVzetvtB/GIZ3yh1vzKPj
   w==;
X-CSE-ConnectionGUID: RLwFSmbVRPu01ONt1Qc0Yg==
X-CSE-MsgGUID: xLShfBXXS/eDERQ26lYsxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4165843"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4165843"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 10:20:01 -0800
X-CSE-ConnectionGUID: ShY1HBJiRLKiFCE4dnLzaw==
X-CSE-MsgGUID: 1TfdRKX8SIGU+zWZMUOAiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11442589"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.225])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 10:19:57 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Ike Panhc <ikepanhc@gmail.com>, Hans de Goede <hansg@kernel.org>, 
 Alice Mikityanska <alice.kernel@fastmail.im>, Rong Zhang <i@rong.moe>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alice Mikityanska <alice.kernel@fastmail.im>
In-Reply-To: <712eb8172d4f38654a08eb88147e6109@gmail.com>
References: <712eb8172d4f38654a08eb88147e6109@gmail.com>
Subject: Re: [PATCH v4] platform/x86: ideapad-laptop: do not poke keyboard
 controller
Message-Id: <179545799151.12968.5343578239681594526.b4-ty@b4>
Date: Mon, 23 Nov 2026 20:19:51 +0200
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

On Mon, 26 Oct 2026 20:05:28 -0700, Dmitry Torokhov wrote:

> On Ideapad Z570 the driver tries to disable and re-enable data coming
> from the touchpad by poking directly into 8042 keyboard controller.
> This may coincide with the controller resuming and leads to spews in
> dmesg and potentially other instabilities.
> 
> Instead of using i8042_command() to control the touchpad state create
> an input handler that serves as a filter and drop events coming from
> the touchpad when it is supposed to be off.
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
[1/1] platform/x86: ideapad-laptop: do not poke keyboard controller
      commit: 9b53eafc32de16b927f551cfe6c58f9befe4a779

--
 i.

