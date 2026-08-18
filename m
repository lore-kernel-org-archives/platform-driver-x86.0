Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46406471CE4;
	Tue, 18 Aug 2026 14:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787062090; cv=none; b=OUXIcxx9yYQ15CVgHfFzEBkETKntdkPWQVOq4zCOP5tl1GVS4qYBwExgVtlzfxK0rSp5nJcKWNgyX24KxyXhb2ub/DkppAD0Vws6n+NhGAqisOgZrhzIH3Hvivj5WQCTJpnEareMVgagMF/XysvZq657XPjJR7YRVVQvG6+k0ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787062090; c=relaxed/simple;
	bh=xHO2pL5UB+6kQG2265VtosWqUERbdcgqxXQ4nk0hnI4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=i3PCKwygfYEkgQ3DeJk2fIbFk7aXXlPb6nuVegSQqNDK+CrLji+KwokdDa8zcwqkl5BMg/qXR54m35ikhprEaAp67lhyyHK0jQDR8DXy8chG75hzG5B0irrth96pF/MgmDbQUfy3QDG0+XZOoD7yeISMAgitejbcMpB1a9U5FgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FkqmCVX2; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FkqmCVX2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787062089; x=1818598089;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=xHO2pL5UB+6kQG2265VtosWqUERbdcgqxXQ4nk0hnI4=;
  b=FkqmCVX2PIuoYAmtl9dUqvr9HYilB2m7xPzfAw36YgSXnziBBKWU99Gk
   pPHi590vIhP0/BX90rD9qmwWGmyoJqD8se9Yzj1WgQkC5Cx/MWJlblEWB
   ImuailplSjcIz5NIPWn9VdMT+v4Z6nz7sX4AWVLWuftH2Voi6xmimTYKp
   QniehAJIuuvlJ3NWtC5P09/o3YBBBJmfJgoTZYUMEX6yzju8yQqFAqxW1
   x4jRZ4tPedYIBo2/8hRheKb0DG4vw00sAztXhmCdbVgfjG1ZPuJju5F0W
   Sg+Bj7ty3b5zncQ5u3iOQ7qbN7AIIfyObMzUAHXTAYn2r/31y2C/vfyMM
   w==;
X-CSE-ConnectionGUID: FLg3h1+uQX+Nh9oYNPebSg==
X-CSE-MsgGUID: BINScspaTtKCIIt8nogulw==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="105089147"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="105089147"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 07:08:09 -0700
X-CSE-ConnectionGUID: O4sh8WWHQn+5ORS2QNCtEw==
X-CSE-MsgGUID: 6dPX1mQJQhm/dO6LADZ1/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="267214036"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 07:08:06 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, Vadim Pasternak <vadimp@nvidia.com>, 
 Liming Sun <limings@nvidia.com>, Nikolay Kulikov <nikolayof23@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260810-mellanox_fix_implicit_declaration-v1-1-352e647b8f28@gmail.com>
References: <20260810-mellanox_fix_implicit_declaration-v1-1-352e647b8f28@gmail.com>
Subject: Re: [PATCH] mlxbf-bootctl: fix the build error with FIELD_PREP()
Message-Id: <178706208136.20251.15829038111717804932.b4-ty@b4>
Date: Tue, 18 Aug 2026 17:08:01 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2

On Mon, 10 Aug 2026 22:10:02 +0300, Nikolay Kulikov wrote:

> rsh_log_store() calls the FIELD_PREP() macro without including the
> required header file, resulting a build error:
> 
>   CC      drivers/platform/mellanox/mlxbf-bootctl.o
> drivers/platform/mellanox/mlxbf-bootctl.c: In function ‘rsh_log_store’:
> drivers/platform/mellanox/mlxbf-bootctl.c:429:16: error: implicit declaration of function ‘FIELD_PREP’ [-Wimplicit-function-declaration]
>   429 |         data = FIELD_PREP(MLXBF_RSH_LOG_TYPE_MASK, MLXBF_RSH_LOG_TYPE_MSG);
>       |                ^~~~~~~~~~
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
[1/1] mlxbf-bootctl: fix the build error with FIELD_PREP()
      commit: cb361aba6ac9a7d336e4b6e503fec6d84851e709

--
 i.

