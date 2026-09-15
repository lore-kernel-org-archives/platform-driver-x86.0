Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC0949E5ED;
	Tue, 15 Sep 2026 11:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789471957; cv=none; b=ZXr3p+o78iV1O6PiKEfP/aOlpSsgy4/BMSMPEI6nEq6fO4NP8J1k0DhTCoE5Ln7IEdOiHbAjFfFpo0tiCaMSPXqtBJ4q2eFKs+LlAkBOvRjjknG8ZjhVciqmxIMrUdhaq4IpLiNBrJP7s5riMBhzkirOZrX0kH3/0xag5xRekGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789471957; c=relaxed/simple;
	bh=67KRdlHJTtCCvUQ3abaX4uEN0RtScY8ogWpXP0rzNDQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=b0bTVNOr+7AfpLXrE4e/aNjcylRoGcVxZIkSgrfsFgwQvxqdqrvfv1IVORgQqESyuf58jf0Ca2P9b0qt6EFf+yVS09X3/5CD4F6XM9vW8v2wfA89SQwi9KyW6hCMEGHaKL/pW3Uni0CQC1EjWiSLsqgnnaBH/fh4doq7/M/sGts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kbvaAp8m; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kbvaAp8m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789471955; x=1821007955;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=67KRdlHJTtCCvUQ3abaX4uEN0RtScY8ogWpXP0rzNDQ=;
  b=kbvaAp8mh7Y+kqVczbZF6satGmnmUlt26Ubw1LpIZEN9rnVCS0WPaFf5
   tHtpQwkc9oZqll2NMqKt3VfwDjwuhqf+2yn4YJ5X3sbTU1WkkapVNl/Dx
   VWmbtNHrEDX3fuHmBN8X3ci/VBVRBibt9VhTXtrLCFC5t3kpcORry727i
   JZz0UXLzfKZdNV8wzgs1YDNunNufQ2dGPpvtX2mdGXTrF08MJ6G1vqhvs
   HkDFxoCFDb+OPLueAFUAa7RvY6WxrORDUyGy9pkhoJ0uIq87+J4UfYqVM
   lMLIrFe8Ol9LIvbaKbdkIfFajH9JouxPqPFnXSw/+iiwnbtlus/sYNir+
   A==;
X-CSE-ConnectionGUID: prY/0r0GTEuEnRrCuSpQlg==
X-CSE-MsgGUID: oD8mJ7ktQCKTpRMbpadR2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100428316"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100428316"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 04:32:34 -0700
X-CSE-ConnectionGUID: /CzOd16QRhm4IxPrFWNuOA==
X-CSE-MsgGUID: oHba7CFNTh20gGqwuYSNnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1380268"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 04:32:30 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Pit Henrich <pithenrichmail@googlemail.com>
Cc: hmh@hmh.eng.br, mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com, 
 corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
 platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pit Henrich <pithenrich2d@gmail.com>
In-Reply-To: <20260825191210.55090-1-pithenrich2d@gmail.com>
References: <20260825191210.55090-1-pithenrich2d@gmail.com>
Subject: Re: [PATCH v4] platform/x86: thinkpad-acpi: Add X1 Fold keyboard
 attachment detection
Message-Id: <178947194489.31094.3187386530887461716.b4-ty@b4>
Date: Tue, 15 Sep 2026 14:32:24 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Tue, 25 Aug 2026 21:12:10 +0200, Pit Henrich wrote:

> ThinkPad X1 Fold 16 Gen 1 firmware reports whether the keyboard is
> magnetically attached (on the screen), but thinkpad-acpi does not expose
> this to userspace. The state can be obtained via ACPI methods: GDST (get
> device state).
> 
> Add a read-only keyboard_attached_on_screen sysfs attribute, gated by
> a DMI match.
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
[1/1] platform/x86: thinkpad-acpi: Add X1 Fold keyboard attachment detection
      commit: ab0b68221ea686085a146736569ac32d773affcb

--
 i.

