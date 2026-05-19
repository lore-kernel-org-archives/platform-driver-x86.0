Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C194185B48;
	Tue, 19 May 2026 14:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779201917; cv=none; b=MypNnqes+UHDKToyZv9PTmr1lfJlD56sAkl5xdaAqJo/NFQDryv4xJ3mZSHGUea067BqjdqZWttMjrGP5HHO6qAFu9S0U9x4jLFehKufbgJWyZ2FNtLYnRPhEIpSBNksI/75obHLFmgiLqE7lgfP8ZDtgfaFjbOgYOyEurbZpY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779201917; c=relaxed/simple;
	bh=8gHQsxOULfQOVhyBBoKnhlxftJr9XTM+CehMqoEpzzA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=okj2J9bsudiLKoVCGYJKAHaUGIhIXW4mumuhkqnC0t01B3bbpXoE+K04QCADAcLkB+5lZEK2KZ3RMidYOH6HJm7WrHbXJa89+fal0M0mf8FRFLkt3XCgj1iIzJ3hsUuJ4wCiabrNVEUNWv1JhvWmtO/5w0pYzMUo4/V39ysu37s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n7CAYnQV; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n7CAYnQV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779201914; x=1810737914;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=8gHQsxOULfQOVhyBBoKnhlxftJr9XTM+CehMqoEpzzA=;
  b=n7CAYnQV3Kw4hndOqSlKRxsA4KzhQINyCWjsdcenloTG7uSclx8Rhua7
   eyPCu6NgE+Ci4QUaEVZ1ruFj0IFZQJIrKexu76P7IHswk/oJrvx86XevN
   8HL0faiL5XaCgkC9yZKjmWB1TMUeCeIgifEZ5vk9+wB0hUs33Wz74NT5j
   OTHzyRRDxD3Mp0KjA+E0Y3MqNSfiMDPuoYRVTx3rlvz8ZSAuxPgLN5lMP
   AQVypenf6T7zSbw4nXQE+9Aky/Z6GPVsoNd+pCYROTThpYthUhThPDEZe
   YYrfwGpJkAtjvWFN8xrzqXvfGfMwQxx8KiWNHK00Iz1c9JkJDhx76kwtP
   A==;
X-CSE-ConnectionGUID: R4CMGLoDRFK/8T/whLZfIQ==
X-CSE-MsgGUID: Ud0CO9EsS3WwYHDa30lxjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="91187465"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="91187465"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 07:45:09 -0700
X-CSE-ConnectionGUID: tHjyXqZsQ2ycR1i3CPSZrQ==
X-CSE-MsgGUID: ncbJUj/fQIGgD94yt2QSUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="233421116"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.236])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 07:45:06 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: luzmaximilian@gmail.com, hansg@kernel.org, 
 Oliver White <oliverjwhite07@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260409034347.17381-1-oliverjwhite07@gmail.com>
References: <20260409034347.17381-1-oliverjwhite07@gmail.com>
Subject: Re: [PATCH] platform/surface: aggregator_registry: omit battery &
 AC nodes on Surface Laptop 7
Message-Id: <177920190233.22546.15116525599223611839.b4-ty@linux.intel.com>
Date: Tue, 19 May 2026 17:45:02 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 09 Apr 2026 15:43:47 +1200, Oliver White wrote:

> Surface Laptop 7 exposes battery and AC status via Qualcomm PMIC GLINK
> qcom_battmgr. Registering the standard SSAM battery and AC client
> devices on this platform causes duplicate power-supply devices to
> appear.
> 
> Drop the SSAM battery and AC nodes from the Surface Laptop 7 registry
> group so that only the qcom_battmgr power supplies are instantiated.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/surface: aggregator_registry: omit battery & AC nodes on Surface Laptop 7
      commit: 0488073a6c84571dd3cffe581a4a73a5fceb099d

--
 i.

