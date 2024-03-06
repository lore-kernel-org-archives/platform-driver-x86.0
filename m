Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2D060DD0;
	Wed,  6 Mar 2024 11:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709723846; cv=none; b=lUCp0FC6OM6MKUj6yhBGZIp/YJcWIzSfT8wPgg+4VTfBrpMOg81VClI/ZKZJNmtCW3kRfkIfzj7seoi3ffKZV0YugaYtN67ATU1f11CCPYCcACGEvgFR0CMZjdhLxhXc7gh46vxdkPDtHVOJfJ8EbfRAP51KvXGE9CU1skj0u8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709723846; c=relaxed/simple;
	bh=y7S7CF/lnNczOiCRtdsEbEr3jYqVuFGSNQWFxySvkUQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=p7RHL5TquOfKSkCWxyt7i18cYlIrMsZ4lT28s3raCtrbK3n9KemAh9KlUO/raWogHLS25w08XQBY2AVuPhRJUrBNaqAhe4EjcUZsGGh45/vVI10ROY/Y9GrusgboK1CpAg8M3+V5U5ft/0P7CZCqG9cOHPwK/xJmP5jgeoW5/a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dmq8iIeg; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dmq8iIeg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709723845; x=1741259845;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=y7S7CF/lnNczOiCRtdsEbEr3jYqVuFGSNQWFxySvkUQ=;
  b=dmq8iIegL2D9QUim2oRMN+J3IquyFC/dhVR3BvUMQxxSRF6pkdJla5rW
   odO+fu8wCAe6U3yLQm/XI4/03JxIvgdbm55hC15VynEcSd0wzB68XRMs+
   FKZRAHeKRqO/uApR8RpWfXEX6Y1iG3nyZ2zWrMz6/2kjQoEvYf0zpITZj
   RlU5/kq4wq5IcpIRUVrnjIi+6hBceDGvGtDvFNANMMw6Myn0L64+xVgLM
   G7XC5NoAxWVLVE55XvLJrJ04hrN6A2xkCP721vlw/FNFEA8ujOOgHlv67
   Ka4Vq3blFesov/ypXYNu5kVZ2mgTc9w2gCXl7uUimTpxarZ0p+snRFFYO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="8135988"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="8135988"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 03:17:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="9809655"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.146])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 03:17:19 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Johannes Stezenbach <js@sig21.net>, Takashi Iwai <tiwai@suse.de>, 
 Andy Shevchenko <andy@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 "H . Peter Anvin" <hpa@zytor.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, x86@kernel.org, 
 linux-clk@vger.kernel.org
In-Reply-To: <20240305105915.76242-1-hdegoede@redhat.com>
References: <20240305105915.76242-1-hdegoede@redhat.com>
Subject: Re: [PATCH v4 0/5] x86: atom-punit/-pmc s2idle device state checks
Message-Id: <170972383334.4424.8602092578822097419.b4-ty@linux.intel.com>
Date: Wed, 06 Mar 2024 13:17:13 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3

On Tue, 05 Mar 2024 11:59:10 +0100, Hans de Goede wrote:

> Here is v4 of this patch series to add S0ix related s2idle
> checks to the pmc_atom and punit_atom code.
> 
> Changes in v4:
> - Add pmc_s2idle_check_register() helper which is a stub when
>   CONFIG_SUSPEND is not set to avoid needing more then 1 ifdef
> - Add a couple of Acked-by and Reviewed-by tags
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo branch. Note it will show up in the public
platform-drivers-x86/review-ilpo branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/5] clk: x86: Move clk-pmc-atom register defines to include/linux/platform_data/x86/pmc_atom.h
      commit: 2ad8bda51c6069fa2d616ed57dc3ba8a3ec26ca4
[2/5] platform/x86: pmc_atom: Annotate d3_sts register bit defines
      commit: 5c3fc0ff939b0390128dfa852fc56b89016c0884
[3/5] platform/x86: pmc_atom: Check state of PMC managed devices on s2idle
      commit: cc7922fff7ee652577165c4fe6035429ccc175cc
[4/5] platform/x86: pmc_atom: Check state of PMC clocks on s2idle
      commit: cbb1c5f2b02da78169b6bacf506777f99ed07596
[5/5] x86/platform/atom: Check state of Punit managed devices on s2idle
      commit: ea2b3b2292fed64ed9b8451c03d638d61902badc

--
 i.

