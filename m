Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3751011706
	for <platform-driver-x86@vger.kernel.org>; Fri, 29 Dec 2023 13:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eKAHsRS9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703857633; x=1735393633;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=XN+XT0l1HgxU3dL7jT7djWUSIQBtBjCZ3eYIyCyWU7s=;
  b=eKAHsRS9tHUvzsRsg3emrP9JyBIzaHNWeDSSVRyny0ObpD2e74w75d/A
   miITS39sd1vC+DKgFdH1YyRTA9vR1Rdma1uUXVFjeY+QqAinjzK685Q8y
   25Hwr6aONmNYdqOq+KGz/hArp7P3v28UjLARYDx1NQf6W4L+90JiZT5gu
   SP7jxl5BDHS/iMUwC+Kwoz+9hVcwmJs0cINAySYPnDEOBQjJ9LLue1xOG
   EOQdp7dmEoeQmWD7UIUFTQ3BpPQ0F7tfAhsom+ZoBjopAZ9SYSimY+Jca
   OqCuKb3+O3sHYX6fdumOWZxqYExrarLK8E0/VTzJwo7AKY0Uxq7FHkMZC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="3723848"
X-IronPort-AV: E=Sophos;i="6.04,315,1695711600"; 
   d="scan'208";a="3723848"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2023 05:47:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="849215750"
X-IronPort-AV: E=Sophos;i="6.04,315,1695711600"; 
   d="scan'208";a="849215750"
Received: from mlittrel-mobl1.ger.corp.intel.com ([10.252.35.138])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2023 05:47:09 -0800
Date: Fri, 29 Dec 2023 15:47:07 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org, 
    Sanket.Goswami@amd.com, mario.limonciello@amd.com, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 0/6] platform/x86/amd/pmc: Updates to amd-pmc driver
In-Reply-To: <20231228102104.1785383-1-Shyam-sundar.S-k@amd.com>
Message-ID: <d4cf5063-faa8-a416-1fd-34cd52c1e90@linux.intel.com>
References: <20231228102104.1785383-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1529985776-1703857352=:1751"
Content-ID: <66862331-ffd0-6cf-2069-c9c8ddfc9b@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1529985776-1703857352=:1751
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <14965d20-b4ed-52a0-8443-4f51b8d22b1e@linux.intel.com>

On Thu, 28 Dec 2023, Shyam Sundar S K wrote:

> This series is focused on adding support for AMD family 1Ah series (or 
> with platforms that support AMDI000A) that adds support for s2idle, VPE
> IP block information, STB and idlemask.
> 
> (Series based on 'review-hans' branch with "4fd8b09f5bc1" as the tip.)
> 
> v1->v2:
> -------
> - Add missing smu_msg variable to amd_pmc_dev struct
> 
> Shyam Sundar S K (6):
>   platform/x86/amd/pmc: Send OS_HINT command for AMDI000A platform
>   platform/x86/amd/pmc: Add VPE information for AMDI000A platform
>   platform/x86/amd/pmc: call amd_pmc_get_ip_info() during driver probe
>   platform/x86/amd/pmc: Add idlemask support for 1Ah family
>   platform/x86/amd/pmc: Add 1Ah family series to STB support list
>   platform/x86/amd/pmc: Modify SMU message port for latest AMD platform
> 
>  drivers/platform/x86/amd/pmc/pmc.c | 25 +++++++++++++++++++------
>  drivers/platform/x86/amd/pmc/pmc.h |  1 +
>  2 files changed, 20 insertions(+), 6 deletions(-)

For all patches in this series:

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>


-- 
 i.
--8323329-1529985776-1703857352=:1751--
