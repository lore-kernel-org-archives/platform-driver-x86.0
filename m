Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5028146551
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Dec 2023 17:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dtv4FV1V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703092837; x=1734628837;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=2c3jeIKTkTCfFYKVarnVNf00GJWHqQjS2nDQttRV0Kk=;
  b=Dtv4FV1VhZe+jvBuosNfUSghEYrxwLekjG/JHotzBRTcpdDr4jxV/taB
   1rj37nFxGlM8Sls8XgnfDFTzG6CgRd2Re3cuhqDzsVTfhKtsdABIcmK2x
   QvfUFHd963YuZUVllZlCq0fs6oCYJmwoSeN/nUSYYCA9L1z2vO0PUWUIB
   OJQwZ26KFDCy8CzGhQiOejkGZt4BwOHxF5uhPfD8trOzoFrI5Z23zpmn+
   gKkg3WBKchRBcI9w1AjEf7X8GzahdpZICbuhMMnTL5JD1RFrbRXpArjl/
   xUUU2YLNfmwavaimz9FdtaJD9hqZEj+qe7M3YCRFtD3YX312LeADHzBHf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="460187873"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="460187873"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 09:20:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="805324887"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="805324887"
Received: from alobakin-mobl.ger.corp.intel.com ([10.252.50.56])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 09:20:34 -0800
Date: Wed, 20 Dec 2023 19:20:32 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: Re: [PATCH v2 5/7] platform/x86: Move dev from platdev to
 hsmp_socket
In-Reply-To: <20231220165528.1351200-6-suma.hegde@amd.com>
Message-ID: <5889fdc-5e97-5b7e-9d5-6cec2c594a4d@linux.intel.com>
References: <20231220165528.1351200-1-suma.hegde@amd.com> <20231220165528.1351200-6-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 20 Dec 2023, Suma Hegde wrote:

> On an ACPI enabled platforms the probe is called for each socket
> and the struct dev is different for each socket. This change
> will help in handling both ACPI and non-ACPI platforms.
> 
> Also change pr_err to dev_err API.

Also, add () to function (or like them, some printk wrappers might 
actually be macros but it doesn't matter for the changelog) names such as 
pr_err() and dev_err().

-- 
 i.

