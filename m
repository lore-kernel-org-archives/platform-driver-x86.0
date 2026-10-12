Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC97E3D9541;
	Mon, 12 Oct 2026 11:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806318; cv=none; b=I/m0nMY3zEEIqDVH408u5shMLkiDpvAWUHyxORgUwO/28/UU5P4lisjwZz44KQVPxDcWV6orQ9yUYBjelLl9Ybduqvpyyr1QHkeja3ln8V54uxTNeZ7x/bQ9zsQ0acWbrcedjFvgYCd0+RO44vEahkW7ji+xLMVfOum/YvwmZOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806318; c=relaxed/simple;
	bh=dojZteJP9FwJRrGvm0N/9qsvAIDATHWlqAv67ZfOhRE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=rX4e1gAxLVSX540z6tJ3CkhE5ZiQlXic/qIQPlE8pQU1pYUt2HQJ1l2bACd8fkJspp5fz67pN3QOK5TWewa8xrnnPa7F4wULtjXcYWUomSEMhzzhA0sEQR/RRhrIj5tdI5VWz0sRIcirBWsDnUtHdTFXaDBushEZgHrYtaiaBgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HbxcTuBz; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HbxcTuBz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791806316; x=1823342316;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=dojZteJP9FwJRrGvm0N/9qsvAIDATHWlqAv67ZfOhRE=;
  b=HbxcTuBz6wfhZUySyPpmkXlchJs8X7gLZBxktg0zKrICgtIE8paTCM5r
   w9O9Ck/ZW9gjkh+sIRcPsR8SexkGnNsfO+jmNm8xU2z25wrTpm7nxJy8W
   Gf7j3YDlzJ2x14d2/wIkmDZ3jbqiiJdcoTBpUfYXTljN3/anmazrSvH9V
   JP+wT1jKlpi8DX82aFeeDhC11oGvEi5xl2SQ7dUVZoan4vrduN6DBJZGV
   8L9eM2jgPcOi6pC1CmUSiVAho3fEM6QCT1qUdzZjwHZ6S2USUqCwklemo
   +wA0wZS7I3WO6sqm34ze7FCLpm6V8QvEaoc57aW+NWO1XE+rNXcGY20Oa
   A==;
X-CSE-ConnectionGUID: Naurr+cdRZapziVFuiLN7g==
X-CSE-MsgGUID: tDVSIdo0SbObjpkl52moUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="419413"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="419413"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 04:58:35 -0700
X-CSE-ConnectionGUID: 4zZUeJOUTCGvZCe3RMs3kg==
X-CSE-MsgGUID: Ix018LGbRG2yZo/vdsmN/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="1192146"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.202])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 04:58:33 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 12 Oct 2026 14:58:30 +0300 (EEST)
To: Huang Wei <huangwei@kylinos.cn>
cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] platform/x86: thinkpad_acpi: Add X9-14 Gen 1 to
 non-standard thermal/fan quirk tables
In-Reply-To: <20261012034129.2902006-1-huangwei@kylinos.cn>
Message-ID: <b5f1c096-f10b-ee56-c3ec-e2eba4a151b1@linux.intel.com>
References: <20260826073014.2611191-1-huangwei@kylinos.cn> <000acb24-7aef-4718-89ea-0dffd1ab34d9@app.fastmail.com> <20261012034129.2902006-1-huangwei@kylinos.cn>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 Oct 2026, Huang Wei wrote:

> Hi Mark,
> 
> Thanks for running this down with the FW team - and for the honest
> follow-up. Dropping the patch is clearly the right call: if the X9-14
> has its own register layout, reusing the existing quirk-table offsets
> would just trade "thermal sensors disabled" for wrong readings, which
> is worse.
> 
> The symptom the reporter hit (legacy probes reading 0x00, thermal
> getting disabled) is still real, so I'm glad Lenovo is working on the
> correct mapping - happy to review that series when it lands.
> 
> Ilpo - sorry for the churn, the patch will need to come back out of
> your review branch.

Hi,

If you want it removed, please send a revert patch as there have been 
enough merges in between so I don't want to attempt history rewriting to 
get it pulled.

-- 
 i.

