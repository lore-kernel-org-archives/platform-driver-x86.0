Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C111B86ED
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jul 2024 11:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720609612; cv=none; b=tJqFQsd6Rpt8tPxPzpgCUB9gUxwS/AFNjLrhAqkeMdpRiktsFn2IDKAIU93jL5cjbURmS8mEz4Mj1lkSt9g1pl3+H7+sd0XNFXEg4zmFZuMgDSOTi9zha4OXbsNHXaBFrmiTeUxFqopeXr6beHCf3yVFiL1y0XMilW9K/vnr5jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720609612; c=relaxed/simple;
	bh=DoYUQJqtuvjo27x5YV5oIxKFexHAg9ka3RbE1Ba6lJs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ff04iPScwlkx0Lsy0+qthSwAksBxDTuqXwMVFD4ZCtOergl2b1a6N6ATdb7fuGvaH4QOHCmuw1LsO+ilFgK8JG8aEl1HVSKXQCwzh9JNSOJISVWQs+l2lDijElTAhsQ+cedI5Cd5QwehgqDGwsYShHSpCP3HR2nQZAsVcwuLRCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XAz6i9iI; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XAz6i9iI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720609611; x=1752145611;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=DoYUQJqtuvjo27x5YV5oIxKFexHAg9ka3RbE1Ba6lJs=;
  b=XAz6i9iIBD0PROer6/R6ROvfof/P0xGQkFLo02rLJmS3UvKhIDpSWfOm
   +tzdUim7GnaWVfIqpmDR//LxJ6Bbrgr73QVar+3ebEGU0W2ptWTk+iTM/
   jDS0Gc9RLGfmM94FhziJODzB89gnIRJEW8o76A/Ge7K5fr6/Iw+Pf+YXL
   qiwb6vSWhfzczGxA/RPR3WZ+0kJJNZMoINFyhegcbDw2wor9i7BoOqzIC
   PV6d7l4Cl/ROFGolNXB8tiBKLMt5maqex3xB0VNXQqVEPFsMk+2iAdFp4
   Qdj9s4azUqY3V1jSfQY/vBpUtf4LZHNxEje9Zg5vDDJiUjhWFMu+HvvwQ
   Q==;
X-CSE-ConnectionGUID: Lz52YMNOSCCQO1AsbWtFMA==
X-CSE-MsgGUID: XgDn0uSOR5mGWctxcmft5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="17758074"
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; 
   d="scan'208";a="17758074"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 04:06:50 -0700
X-CSE-ConnectionGUID: aIU+0MGLT4OoCzGdnQ29vA==
X-CSE-MsgGUID: G9SpV1z3RzynargdnDD8Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; 
   d="scan'208";a="52775236"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.125])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 04:06:47 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 10 Jul 2024 14:06:44 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com
Subject: Re: [PATCH v1 1/2] platform/x86/amd/pmf: Use existing input event
 codes to update system states
In-Reply-To: <20240702080626.2902171-1-Shyam-sundar.S-k@amd.com>
Message-ID: <1af52145-bc2c-4406-9564-dccd3da3664d@linux.intel.com>
References: <20240702080626.2902171-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 2 Jul 2024, Shyam Sundar S K wrote:

> At present, the PMF driver employs custom system state codes to update
> system states. It is recommended to replace these with existing input
> event codes (KEY_SLEEP, KEY_SUSPEND, and KEY_SCREENLOCK) to align system
> updates with the PMF-TA output actions.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---

> @@ -475,6 +506,10 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>  	if (pb_side_load)
>  		amd_pmf_open_pb(dev, dev->dbgfs_dir);
>  
> +	ret = amd_pmf_register_input_device(dev);
> +	if (ret)
> +		goto error;
> +
>  	return 0;
>  
>  error:
> @@ -488,6 +523,9 @@ void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
>  	if (pb_side_load && dev->esbin)
>  		amd_pmf_remove_pb(dev);
>  
> +	if (dev->pmf_idev)
> +		input_unregister_device(dev->pmf_idev);
> +

Why is the ordering in the init and deinit asymmetric? Is that 
intentional?

-- 
 i.


>  	cancel_delayed_work_sync(&dev->pb_work);
>  	kfree(dev->prev_data);
>  	dev->prev_data = NULL;
