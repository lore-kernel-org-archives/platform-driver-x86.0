Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0215A314A67;
	Mon, 23 Feb 2026 16:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771864437; cv=none; b=rP2q6iPhAsQjBwCLyg6FKeNMvfYxMfNEHGabA8ZzT+SL6eDeq88lr5wzfLuJtFmVyuOkZQzNs0biHIOEffoYjP1Ggw4RuGLTsyCcZj4tsdiPcXQZ6fOU8F/bGniUPLImySGYM/jmHmIEesXWsdUD/Q7eo7wU89XHNFZOORaUxA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771864437; c=relaxed/simple;
	bh=Go7uv//U/4KaAqPR4r2TlwXhLhMxJ6agmgujSpGdbDc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gyPqpIcNJoObsqjr/5u6lMYDKO9NfYi3t7B7Qm3ALMeZXlW/mEBlz2IT2NQQHAAG3nmJ7/e6KdoSrl21y0uSwvckYvB968gN+vd6ICpfFw0lMzid/8J3mvuMTBsl3FLjoYXWLQGLiTUNDRR1a6+AUwrOhO+HVh4oln9Zh/Dx3Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CGsOP6bN; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CGsOP6bN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771864436; x=1803400436;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=Go7uv//U/4KaAqPR4r2TlwXhLhMxJ6agmgujSpGdbDc=;
  b=CGsOP6bN1UvziBEDSghPGE0I1yv9nGqYgwfT2uedhhBo+vS3/K8Vng5I
   DAtW0yHyxoDTh+nr7ifOBoaCWLfIq2QIQxIOyNLgAMC+9DA06KTiD+8hz
   qbbV5N1Ht0CBJlvqnxZb+no6gpYfJbdKQv6pkvpZjF42aoAjh4PQYOm16
   c+xoHGapkTq92cjI/JdG/kxazvd9/XMrjrcfXH6B/Ob32EL0pfihhGGFm
   XQP0dG81I6FEmMXpVEG8nTQLavcCJd8NKa1x+A+DHswE7cGC+0Najf/sc
   5jW2NgI4o6nylhT+u2k9XGHFOmnRpNVJSOGFDzqnESiymv5+VVF9L/VUU
   A==;
X-CSE-ConnectionGUID: 2V4HAmYITpeaQ16kNT0xOg==
X-CSE-MsgGUID: U/fxK3faTEi5a3MNWog0Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="75473115"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="75473115"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 08:33:56 -0800
X-CSE-ConnectionGUID: bJmT8M8OSpClwiuhviGi0Q==
X-CSE-MsgGUID: EnUxmS+1Sn6WbRX3DvbQSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="246205287"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.30])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 08:33:53 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Krishna Chomal <krishna.chomal108@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 noahpro@gmail.com, juanm4morales@gmail.com
In-Reply-To: <20260216072003.90151-1-krishna.chomal108@gmail.com>
References: <20260216072003.90151-1-krishna.chomal108@gmail.com>
Subject: Re: [PATCH] platform/x86: hp-wmi: Add Omen 16-wf0xxx fan and
 thermal support
Message-Id: <177186442682.17917.2745381564448312622.b4-ty@linux.intel.com>
Date: Mon, 23 Feb 2026 18:33:46 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 16 Feb 2026 12:50:03 +0530, Krishna Chomal wrote:

> The HP Omen 16-wf0xxx (board ID: 8BAB) has the same WMI interface as
> other Victus S boards, but requires quirks for correctly switching
> thermal profile (similar to HP Omen 16-wf1xxx, board ID: 8C78).
> 
> Add the DMI board name to victus_s_thermal_profile_boards[] table and
> map it to omen_v1_thermal_params.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: hp-wmi: Add Omen 16-wf0xxx fan and thermal support
      commit: 13fa3aaf02edaad9b41fc61d7f6326d2b6a4bf80

--
 i.

