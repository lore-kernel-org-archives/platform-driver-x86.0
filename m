Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3407314D3D;
	Mon, 23 Feb 2026 16:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771864538; cv=none; b=cU0lbAGL569paGB+4us4yWj62flOQhmxe+NFM3n7zF2rMNaLvD5yAcuHK1tPuLlrqczip6TA/4AQ+F8F6VtdZNrqRUXpb46WxDTQptoPZXy/M4v6c0seObX9aWb6spLrhi5ed4u+1idMq7LWsYTGwK+K7jwu6LPgUDGWOIYm8Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771864538; c=relaxed/simple;
	bh=Bv5HNj7C0GgQ6W+Aim5O/1xryPnAcIbbOMtRv6Npazk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WOiYhmWQDnSMoV5uUHhi9D9NGMI4FBcM3j34D3gxZUhBFMq/Vx807yu3UDwma9j4ZKuIIpo62VP5KZrEnJSpPAGyUBIjzbkIFPObRKtPu5vw8a+DzsNYt+ZwxlOyw1YL6s6a+d1ZEhLMckEEwQJr51e1LbOzV2FwEdlQU3qs0BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S7dL0rbx; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S7dL0rbx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771864536; x=1803400536;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=Bv5HNj7C0GgQ6W+Aim5O/1xryPnAcIbbOMtRv6Npazk=;
  b=S7dL0rbxYYLtJxpqWloGRsJhNG3Y/rwOE27mcOYdjAAj+zJW6apSSps+
   meQJ+0L800b31MKLnd5zNCl3eB23yS2rt3z6ja9v95GhQJstKhhEMvHvu
   ySVw0BzlNmfgI57PCiAAN/KjuuBY0CCH206LinOaPprkYTrYlGI8MJzSR
   hTaw5Y6XPGfbXuo9u6wfcqb3TGENQN/j0w21YKsxkTNYBmVaVZ/eK9IOm
   S7CrU3TeA8/se9vfKHnV0kLEp74bKHH85KSM+PBj8ihtbc27aRROh/Vku
   yxW3E/HSVOsiEZ76oHLjMRY7CgzptEg7nd0+lRZ3WvphA+OpVRdz+Tj+J
   g==;
X-CSE-ConnectionGUID: Kr7yT+ONT6GpQzIIt/j7DA==
X-CSE-MsgGUID: WG3FruLDQb6W8HojeByOjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="83575331"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="83575331"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 08:35:26 -0800
X-CSE-ConnectionGUID: N5O+a0JiSHWhk2LOTSA2yw==
X-CSE-MsgGUID: 27Xc/mlmSc+2O7VeGkVPPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="219733436"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.30])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 08:35:24 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, Armin Wolf <W_Armin@gmx.de>
Cc: wse@tuxedocomputers.com, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260218005101.73680-1-W_Armin@gmx.de>
References: <20260218005101.73680-1-W_Armin@gmx.de>
Subject: Re: [PATCH v4 0/4] uniwill-laptop: Input-related improvements
Message-Id: <177186451796.17917.11303084523071214041.b4-ty@linux.intel.com>
Date: Mon, 23 Feb 2026 18:35:17 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 18 Feb 2026 01:50:57 +0100, Armin Wolf wrote:

> This patch series contains a set of input-related improvements
> for the uniwill-laptop driver. The first patch renames the
> "fn_lock_toggle_enable" and "super_key_toggle_enable" sysfs attributes
> after it was discovered that the underlying hardware works differently
> than previously thought. This technically breaks user space
> applications using those sysfs attributes, but AFAIK no such users
> currently exist.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/4] platform/x86: uniwill-laptop: Rename FN lock and super key lock attrs
      commit: 2d53dfacf067968a9ff90c03700fb9b28049f4c6
[2/4] platform/x86: uniwill-laptop: Fix crash on unexpected battery event
      commit: 67e7eb4c130a74c5da9ab43316e00ed3186d1811
[3/4] platform/x86: uniwill-laptop: Mark FN lock status as being volatile
      commit: 2be519d94544e226636c185e28ec1a72d01aab87
[4/4] platform/x86: uniwill-laptop: Handle FN lock event
      commit: 9836feedcf559449e82eb0f741084086780104e5

--
 i.

