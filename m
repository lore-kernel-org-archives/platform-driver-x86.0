Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2F25304C3;
	Thu, 15 Oct 2026 14:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074500; cv=none; b=YnwL3ifblSySn+q9qpCu+55UqcheumcQE9LzGOvEHUQFFP76t04cgYVyx4AnxLqv23W+pAvbSOF9PXk7EdFohazdrrcRffb6mv9xoOf77fJtdNqEOsrt9KGSToJc+98b5K+PT+S+i9inhunuUKZc+WMU3vDFpwu1XQ1ityacmIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074500; c=relaxed/simple;
	bh=EEh6joexBK6c1DYdXiJMNl4WYDWeqRN+ocPnBDU57J8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iQX4z0xRZ+Rq/5xcRsLscZibuGGEmCy8KCXLwaLsMlTFp4AGDSqgCK7csrOuMHyS//qBGS3GyXTvrX41ICYK34O7SJokqQiIVNhzYWMcEJACtjfV2JgZc8kGSOyqA5eNQO+quJaD1YDxYyrDaoRKkcEJMrxQHu8KAAl0Q1zEcOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KAJr0yiI; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KAJr0yiI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792074500; x=1823610500;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=EEh6joexBK6c1DYdXiJMNl4WYDWeqRN+ocPnBDU57J8=;
  b=KAJr0yiIdoexuDeU7ClAoZvR/UT+pezNaRv/0ZlfOPa4QUHI3tFV+Gqh
   ID4sSndsVA+GRs4kUJkaS5V+Pb328uooWhyDPobpXg2pbLqGTTzm82CLO
   +9rQbB2LLnyt9/etsqN6O5QVErXrEit3chU88bn/s0rRnzPPmiPjYlAV2
   mp9FC9anqmUVOwZ1pZ0EHY5Hkq6yY/iR4XRe4iCWfXV1noImm5wH4ZX+r
   +cNRGzRdLeY/Hwh8DkMLZDvUOGSshc0eKdAJqqR34z3YmRHUPOQCOQ0MH
   GzVcUa+DUAeafiqC3ezfb9GBTANHNVCLqYqu7Jii8DmXFwTfzkcH+/zFX
   g==;
X-CSE-ConnectionGUID: mbfyHT8yQCmeLQ4l9y4k+A==
X-CSE-MsgGUID: UA1+qqHLRsSpdVsznNOfGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="732022"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="732022"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 07:28:19 -0700
X-CSE-ConnectionGUID: nHrNVaguS16RDkZ8ILN6xw==
X-CSE-MsgGUID: auoFJyYDTTyHaGzpGe8I3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="3482717"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.130])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 07:28:14 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, Shang En Sim <sim@shangen.org>
Cc: Krishna Chomal <krishna.chomal108@gmail.com>, 
 Suryansh Singh <technosfan14@gmail.com>, 
 Emre Cecanpunar <emreleno@gmail.com>, 
 Radhey Kalra <radheykalra901@gmail.com>, 
 =?utf-8?q?K=C3=BCr=C5=9Fat_Abayl=C4=B1?= <hello@kursatabayli.dev>, 
 Alain Cousinie <alain.cousinie@laposte.net>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261001031012.48473-1-sim@shangen.org>
References: <20261001031012.48473-1-sim@shangen.org>
Subject: Re: [PATCH v2 0/2] platform/x86: hp-wmi: Spectre charge behaviour
Message-Id: <179207448888.13793.2674623095284151042.b4-ty@b4>
Date: Thu, 15 Oct 2026 17:28:08 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Wed, 30 Sep 2026 22:10:10 -0500, Shang En Sim wrote:

> Address review of the Spectre charge_behaviour patch.
> 
> The hwmon keep-alive work is switched to devm_delayed_work_autocancel()
> first, so the new error return from charge-control setup does not leave
> that work pending after a failed probe.
> 
> v1: https://lore.kernel.org/r/20260812062113.27741-1-sim@shangen.org/
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
[1/2] platform/x86: hp-wmi: Fix hwmon keep-alive teardown
      commit: 574245e62cb09e159b4c37e1a9091c100448b5c3
[2/2] platform/x86: hp-wmi: add charge_behaviour support for Spectre 8C15/8C17
      commit: 929433336e0a6e5014af7b8849f369712d2c8964

--
 i.

