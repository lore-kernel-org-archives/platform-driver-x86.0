Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2246A3C6A2B;
	Tue, 17 Mar 2026 13:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773752420; cv=none; b=oWHRhVDkTFmYyXsnME9rn384Y4dRoGldOQizcHywPEDyLamtKCekzvdVgutxCFGdG6eX7aFjiyk9IXxFJMuboBDdHfx0QYRCCREpgWU50zEyzU6QmzmnEYePxdyZub3GN3TPKTmyF4S3bHSGDZ1ExHmTL+IpSyO2GJitzfXJA4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773752420; c=relaxed/simple;
	bh=+MlSoT5Q6yRIGQp9Qv9f6b63kBFjYt8pS4LghN5tfAI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IrjOOev1x0LIA/GpV4LKNENdzwl1NKsumwMenRp4DF8KPFem68i/AaBbUG5ZSKxk1VirT7BVdoDfdYkv4zcn4we0dSDj/0whg4UxVnLBiAeWMerjcdNYbLvqUa091vArJaeTHFNJVIup8DfuTCjDRn+aB4XXp5IU1B2zjHvimvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G6Ody92q; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G6Ody92q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773752419; x=1805288419;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=+MlSoT5Q6yRIGQp9Qv9f6b63kBFjYt8pS4LghN5tfAI=;
  b=G6Ody92q+HWLEa9+8eqTgxfZMo/rB4RwaK0YhaJwM9QmLjBy3H+fSp0h
   XBdSHC3mSCv6WARj4HoIFt7ziXBXdR6iTVt/tdUBY4n+ozgPM8UN+kA0X
   Gzu+M+4vhN+P8h4k00o+5zAkHnj0f5zZNp450pzjDSc/P6o2PGJFSYLNp
   cuQlsPmxCqHuTIbhhFfNpWZEc5DK4mwDOACVv++FrRhdUw2LFBQa6pEhV
   BxdeUKySrd0+co+vt6tF4CZGuLq1FPL0/Sa5EJw9pSm0vb07qfF3V8jXK
   hmtL7O5A0e+hwXaEuWkdjlH7HE3olXtWKEgkiM2AokeMNd5Qj7UswycSU
   Q==;
X-CSE-ConnectionGUID: /JiZj8MxQKKK7DSHV8Gv+g==
X-CSE-MsgGUID: ZTx5kg9TSdmxGbEqbfe1Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85409159"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="85409159"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:00:18 -0700
X-CSE-ConnectionGUID: KEWu9ycyQ7OXhQOzLNd0yg==
X-CSE-MsgGUID: e/4qjOuvR2CjpcLz69U9RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="221490683"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.161])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 06:00:16 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, 
 Raed <youaretalkingtoraed@gmail.com>
Cc: linux-kernel@vger.kernel.org, hansg@kernel.org, 
 Raed <thisisraed@outlook.com>
In-Reply-To: <20260311131338.965249-1-youaretalkingtoraed@gmail.com>
References: <20260311131338.965249-1-youaretalkingtoraed@gmail.com>
Subject: Re: [PATCH] platform/x86: hp-wmi: Add Omen 16-xf0xxx (8BCA)
 support
Message-Id: <177375241155.9137.8530054216519924489.b4-ty@linux.intel.com>
Date: Tue, 17 Mar 2026 15:00:11 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 11 Mar 2026 18:43:38 +0530, Raed wrote:

> The HP Omen 16-xf0xxx board 8BCA uses the same Victus-S fan and
> thermal WMI path as other recently supported Omen/Victus boards,
> but it requires Omen v1 thermal profile parameters for correct
> platform profile behavior.
> 
> Add board 8BCA to victus_s_thermal_profile_boards[] and map it
> to omen_v1_thermal_params.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: hp-wmi: Add Omen 16-xf0xxx (8BCA) support
      commit: 78d77e548921af84e9df31a45606e1d43d09fc74

--
 i.

