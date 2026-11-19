Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099373;
	b=2c7+rofUx3g/j1Bir15FSl61myWrhClqYrKjqKqxvzps5kgq4fr5eT8H7dgsFwMik7Xy
	 Y7l+M6xqSjV/9lRzbq5Ngg3x8OCobKWZi2XvMWDQySxAQV1XXB9sTaVoXxeELJPnoGKEG
	 H77nvcr/iEEkcv04xcTDXj/2nKL9zyypq8yDk3X5L0z0fpl4u61USpGou4BrWgh+Ff0bL
	 fyPmEz4v16afrg9ViSTmOQES0KDmBjCb3C5D4sQomPLVuQXRFHoqoyME6i/rGmObwTJka
	 NRBZ/VkP1sGSYwBwJRHkNeckXdoyDlP6Go36MDdtGw8SqcwlWv3a+v492slTVWXmNQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099373;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=xWvrR7cjnIxk25zWK33i6l6vgbYTtkm5whTEcRzBHIE=;
	b=wUHblgk2hKfDMHlr8ISkvEZHHxxo5dH+xKs3fcYUV+JISz61zzAjsDMJfZFiJZFKwDjM
	 93wB3wfTnTJgFHTy+CwfE+8YVf9sZcE2N4VvDahaYHNcgkykQaXMdlUvLpAtN/p6iqjig
	 YU79l0xv10nVJY7qm0OQbEYZ0tVxKPKPyjGE1zeqEUjf/1kTifuOEIgFprIll2bU2i0p7
	 eOAV5fNc8usILBW4wYhHvrr3ft3ndNBiaFhHoGSPWEwZlckI1gqD6Jp7pl+VPtdV0TWs9
	 qHhzHkarL8JXvrKTtqQvpVElWDAV+LxNH6kKFnvOQCotION4EXHrfsxuvaPX77NTu7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="KrAKheu/";
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9343C606A33C;
	Thu, 19 Nov 2026 14:42:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9343C606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KrAKheu/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795099373; x=1826635373;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=WBjeZ2fEGuLKW9qna1nb4ZYhwQf33Dj9s/3CRCC5ak4=;
  b=KrAKheu/gujBanikH6+fXcSMddyLKLPP7q8r9XLvls43AfIKoAGgFvwT
   GyboDyr86joxEVfc5wLlrmolcRDptA5zxiN/beA7ZP4qPnnjtTqyZbn4R
   HITfBHZstIvuv1Fpi0gJaDRLohq4uOUfTcYeRCRpJxF2cpKrKxCgeD3dX
   wPJ4qASP6d0sjUgzWFDp8gOSYsvUOkqSNBwC6GUmV/yvTUfjvS42U1TkW
   lJUUfgQpPoBvqUPEzcQRpzGIvxpyXmYCsC2dE3vSALQPWdFEj5AzcVl3m
   WIq2HTvwulppJWlz4vI0M+3x9Op+JMiLxROSb5sjDdQEim9ODzGMKBZBc
   w==;
X-CSE-ConnectionGUID: WS4Z6VauSFqXTmnimkDmBg==
X-CSE-MsgGUID: 6FN21qqyTtulXfGbuD5IPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3849577"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3849577"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 06:42:52 -0800
X-CSE-ConnectionGUID: qgMcKJhvRzGbR2lBbdAffQ==
X-CSE-MsgGUID: wg/PUR7IQsGWVWardIRv9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10786367"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.132])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 06:42:47 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Josh Triplett <josh@joshtriplett.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Rong Zhang <i@rong.moe>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net
In-Reply-To: <20261111-tpacpi-debugfs-unlock-unsafe-led-v2-1-f23a94912a09@rong.moe>
References: <20261111-tpacpi-debugfs-unlock-unsafe-led-v2-1-f23a94912a09@rong.moe>
Subject: Re: [PATCH v2] platform/x86: thinkpad_acpi: Add
 "unrestricted_leds" module parameter
Message-Id: <179509936107.9442.17438129466101803217.b4-ty@b4>
Date: Thu, 19 Nov 2026 16:42:41 +0200
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

On Wed, 11 Nov 2026 02:41:42 +0800, Rong Zhang wrote:

> Since commit a4d5effcc737 ("thinkpad-acpi: restrict access to some
> firmware LEDs"), most LEDs are classified as unsafe and write access to
> them is restricted by default.
> 
> To enable unrestricted access, users have to build the kernel (module)
> on their own with CONFIG_THINKPAD_ACPI_UNSAFE_LEDS enabled, as it's
> unsupported and no distribution enables it.
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
[1/1] platform/x86: thinkpad_acpi: Add "unrestricted_leds" module parameter
      commit: 702ed1b658d466150498045ec98065924dc0f532

--
 i.

