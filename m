Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4A8326D4F
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 Aug 2025 11:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755602102; cv=none; b=oCi2PYQUE3lWeQ5zSuFxAGq6ghbc3rkpzsC4aY4KXEe2JKsMAzZTvyrWxQu+NG52XGfXq5Ogr5MmhziGeFOg3WncuF3cyTTvUUlLIcNX4KGRoDF+0qruiZTFC/B/xaYRIjOtRddOfUpCwwvGLe3FdsAuPlvvKeGrOcUp6vC49sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755602102; c=relaxed/simple;
	bh=Jbx5ztl7KcJpRb/dwBWqqQJE/mRDSZHMVkH3jdWL/aM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=rvHjA63WOOmf230JrbpK4IBZdAsxliRNKCnYUEjW/05CPHa9LZmC3ArPjzCIivhzYCUvvw561w1ghUu9/6exSoZ7ahvAlGNB3yJspd1cE83n47y5GpLe0Ri04zaFoXJCn/ChmpkkqY6u+JqW+qQbXeqrM8qJAos9XAWzsdxV4jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C5uC/5uU; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C5uC/5uU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755602101; x=1787138101;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Jbx5ztl7KcJpRb/dwBWqqQJE/mRDSZHMVkH3jdWL/aM=;
  b=C5uC/5uUyc4WB886TP5iSmasrhpuMHdQ0GglcaDND4WTExSPa3WbDqic
   1kjQdNza1RiQT4HGH22f3xM6xT6w7BsS2gZhmblKMZpKCKnNLuvolEXRz
   tD36xBKf55FYLmnrxX5cAD0wsJVMJ7dDZNlaqPgmSh1qAtx3mQn2FCfTU
   61mJEmiQx+gK3FlZQ2yI1cL0bMnikdh3L2ieQDYoJfERvNSrSqNqUu/cr
   dvZo8zX1t5/ZYejRHOgIQaH2N80pvfoAOSR99tkXzdyv3T3YbaMgAdGEB
   +nbpSnaWUfXD11KY4NUKMXiRbwHk5ezQ/0sJnEfehB+eqHeN4rHhBCytg
   w==;
X-CSE-ConnectionGUID: wH/xY02lQK+KGQLhRhP6vw==
X-CSE-MsgGUID: ptMto5jERJivVJ9VSQqHWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="80436913"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="80436913"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 04:15:00 -0700
X-CSE-ConnectionGUID: syCgfTpNS9WoBidnqmckww==
X-CSE-MsgGUID: O/hiDTv0T56XrtzaVJdFyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="167061565"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.120])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 04:14:58 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 19 Aug 2025 14:14:55 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com, Yijun.Shen@dell.com
Subject: Re: [PATCH v3 4/9] platform/x86/amd/pmf: Update ta_pmf_action
 structure member
In-Reply-To: <20250723064121.2051232-5-Shyam-sundar.S-k@amd.com>
Message-ID: <0c6a6c0d-9abe-eb64-7902-b9f1045835f5@linux.intel.com>
References: <20250723064121.2051232-1-Shyam-sundar.S-k@amd.com> <20250723064121.2051232-5-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 23 Jul 2025, Shyam Sundar S K wrote:

> The latest PMF TA has been updated with the additional structure members
> for internal evaluation. Since this same structure is utilized in the
> driver, it also needs to be updated on the driver side. Otherwise, there
> will be a mismatch in the byte sizes when copying data from shared memory.

How is it known if "latest" is in use or not?

> Suggested-by: Yijun Shen <Yijun.Shen@dell.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/pmf.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index f6cd7584aaf8..957f18cddc71 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -752,6 +752,7 @@ struct ta_pmf_enact_table {
>  struct ta_pmf_action {
>  	u32 action_index;
>  	u32 value;
> +	u32 spl_arg;

-- 
 i.

