Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792533135;
	b=4I+4g6LcLepuvnlZLhT6mpF5EuA4uI0pSuhngINw9tTet5WDQGTm5rULtBsOimy5s2Le
	 aLfPvcCdaezUjyx4Lx/sj3hI6phPpkcGJ412Dhszrm82KM9jQqhn1F1Kyk3ARSFsj2toO
	 F6maW23RgCzU/WQxu1E5582hO7mcq34lAqirkWzgSMRyjKFcZ6+xQ+uC33bktDXZWm5Kd
	 5NXvsKD4LjeYhirO5FETKKtzPDel8tEfXsZe7EPKQp9xxNCLVx6QgaDbLm/RwaaOQBxeT
	 zva2Fc4EgoxUBasDkxjp2JseVNVZ7dOVUJhKTtKWeCr5dpzpR9hHUu2u8LE3iujEraQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792533135;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=iB8t4s37ZZMyRqEa48I2EZ4DMgv4M6Tgs8EcF+zYr+U=;
	b=p7Mgj2B7KLp8RU9OmuQXdgfqpBvWaEjHszaooUHU9BA9K+qIe74mIW73ZhAw9Ou6ZBim
	 uexCFmOXtD3UCIsKVi6MwCgUfcsT9SG0mMZ1waPRiU+97RId+OQutOv7gWkvqaPPuVEz9
	 EshH/YIS3exxwHp7IcqU158up1WslyrxOOWwJbdvTnGGgXBEI3+8OlLIRE+7owQB9nGY0
	 tHfs2U5RkgWqNbBId1YQUDMHQD7txQR7/3+xVDNzEsvunyahD9BVxUh8/ev7RIDpLFs3O
	 ReQSCQvQKnHXnnYfstO917a3W3MbcZgVs3ST5A6zPR14DN6E4CIt/cqIHU79nkmH9yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="i6uK+/Wk";
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D46606A320;
	Tue, 20 Oct 2026 21:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28D46606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i6uK+/Wk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792533135; x=1824069135;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=+5sAAn1escoi8gTNiHSd6rxVXzyDRdtfzGYrvZUTlDk=;
  b=i6uK+/WkHca9sXX4aG93hwtcWpPuXlaa9xx77ADA2zNYQRALVZWdzOFi
   /Kt7tHN5bq7JlLsQnvNvUAUAv/31Z5T/tsPqxN/HU6ht8rxl8Wx5MMlO4
   SnIHBKbQZJ7NgpzwK9LlQstrvJTs+GubV656a75kNU86arxi6wSk5tQvf
   seKDBWwOEO3v0EYlamci7TZeoTsI014P51FzrMNHD+NUdUNFrgTRXQK6l
   sSydz08POTIDVlbJ9990JxyczXYXT9mccmxQNp9COCZfEEVbgORVB0o1B
   dx6/CQQMCN1yC7JG/KHiDOuLN+t49JOJQmzA+19mcmTpbWwFSLuVbwZje
   A==;
X-CSE-ConnectionGUID: D3ktZ3e1RdK+rmLxdH4Cig==
X-CSE-MsgGUID: WKWHOpz0TQ+K6Oz9UKfxIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1126521"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1126521"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 14:52:15 -0700
X-CSE-ConnectionGUID: XJXci2agTb2S87dzfuFM5g==
X-CSE-MsgGUID: Oz2IBD/VQPif7S7OFFbZog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3262363"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.181])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 14:52:01 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Krishna Chomal <krishna.chomal108@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Lorenzo Collevecchio <lorenzocollevecchio17@gmail.com>
In-Reply-To: <20261017132421.279522-1-krishna.chomal108@gmail.com>
References: <20261017132421.279522-1-krishna.chomal108@gmail.com>
Subject: Re: [PATCH] platform/x86: hp-wmi: Disable hwmon attributes when no
 fans are usable
Message-Id: <179253311604.28707.17975347461398337923.b4-ty@b4>
Date: Wed, 21 Oct 2026 00:51:56 +0300
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

On Sat, 17 Oct 2026 18:54:21 +0530, Krishna Chomal wrote:

> Currently, hp_wmi_hwmon_is_visible() checks whether fan RPM queries
> succeed before exposing fan1_input and fan2_input, but pwm1_enable
> remains visible always, even when fan support is unavailable. On some
> devices, such as certain Omnibook models, the firmware does not provide
> functional WMI fan methods. Exposing pwm1_enable on these devices can
> mislead userspace and cause fan mode changes to fail.
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
[1/1] platform/x86: hp-wmi: Disable hwmon attributes when no fans are usable
      commit: e931e54edb0fae350007c4054cfbf095cc316bd8

--
 i.

