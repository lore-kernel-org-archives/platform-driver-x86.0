Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DA75CDE2
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Mar 2024 18:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709751110; cv=none; b=Lktmu7WgejtPXiSMb4EjEo3DoGB+RbDFjJHdyHOKEZgeREZwnd98uJ4BRh/W0gJ/tPkv1TlzwIA/gu+6bIW2YMV8l+mjOAo0OQpQ+gG4g06L9dxjoz9oFk3IIzuZsWnoVmuQK+lsH4J7oheN73Z4sUmoNNHewERIHTY6TvxPp0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709751110; c=relaxed/simple;
	bh=lEyUDlL9i7ygMBbNlqmhhJD8gWHKQQohW3n5SREFjSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=urcHJIRzTCgiz7j0eLPzX0oZNfSpJ6KCi+fv2epsyLN6k5ILIQcMTw/bGGFbqkolwgk5hBb0LAEcr7SAPzkXIE55tJv7kAcfp777LrJ5AV/6fk9Qi4GMfAFKn9cS2LRC/hRtf/Jwe77ewatGl1gT6oaaKXwwXGBCALDx483RJtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b17s5c+f; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b17s5c+f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709751108; x=1741287108;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lEyUDlL9i7ygMBbNlqmhhJD8gWHKQQohW3n5SREFjSk=;
  b=b17s5c+fZ6wkbPoGejBXwq05kONkBJbRpym8nBHBc1dOa5mzcZ5ne9cI
   x+AMcpi9prcbqmZ7oHUM09rINbJEOhBBqhfMOgONrMGhZ3/lvGPqWbEVw
   hrTyy2ORFaD2r4YzqWN/p5z6+nAfhg4bNtHtPGN7uvtT5G1cavxr0Z+68
   1zJMj5sLyioWG89Wr8baWlunnJ/iPCSKNLNgk5Yx0NttgEBaXX7p3i0Ry
   5VB8+yX+PWD5lEVtkilKAGO12AP8GMS7i/Fn7b/50eEBfxbYTkHYr/pq1
   pF9FCqo7tOTOlSFD25+O7aBym9xL939agvyBFeBDkXjIfyI441RNXi+ap
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4316999"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="4316999"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 10:51:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="14414182"
Received: from dpwomacx-mobl1.amr.corp.intel.com (HELO [10.209.25.153]) ([10.209.25.153])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 10:51:47 -0800
Message-ID: <161577aa-7cce-4d11-b63b-dbec8a48453c@linux.intel.com>
Date: Wed, 6 Mar 2024 10:51:46 -0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] platform/x86/amd/pmf: Add support to get sbios
 requests in PMF driver
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20240306114415.3267603-1-Shyam-sundar.S-k@amd.com>
 <20240306114415.3267603-4-Shyam-sundar.S-k@amd.com>
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <20240306114415.3267603-4-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 3/6/24 3:44 AM, Shyam Sundar S K wrote:
> Update the APMF function index 2 for family 1Ah, that gets the
> information of SBIOS requests (like the pending requests from BIOS,
> custom notifications, updation of power limits etc).
>
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---

Looks good to me.

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>  drivers/platform/x86/amd/pmf/acpi.c |  5 +++++
>  drivers/platform/x86/amd/pmf/pmf.h  | 13 +++++++++++++
>  2 files changed, 18 insertions(+)
>
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index 1f287a147c57..13af83b187ac 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -166,6 +166,11 @@ int apmf_get_auto_mode_def(struct amd_pmf_dev *pdev, struct apmf_auto_mode *data
>  	return apmf_if_call_store_buffer(pdev, APMF_FUNC_AUTO_MODE, data, sizeof(*data));
>  }
>  
> +int apmf_get_sbios_requests_v2(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v2 *req)
> +{
> +	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS, req, sizeof(*req));
> +}
> +
>  int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req)
>  {
>  	return apmf_if_call_store_buffer(pdev, APMF_FUNC_SBIOS_REQUESTS,
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 51e31d008ef9..aeaaff290bff 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -120,6 +120,18 @@ struct apmf_sbios_req {
>  	u8 skin_temp_hs2;
>  } __packed;
>  
> +struct apmf_sbios_req_v2 {
> +	u16 size;
> +	u32 pending_req;
> +	u8 rsd;
> +	u32 ppt_pmf;
> +	u32 ppt_pmf_apu_only;
> +	u32 stt_min_limit;
> +	u8 skin_temp_apu;
> +	u8 skin_temp_hs2;
> +	u32 custom_policy[10];
> +} __packed;
> +
>  struct apmf_fan_idx {
>  	u16 size;
>  	u8 fan_ctl_mode;
> @@ -621,6 +633,7 @@ void amd_pmf_init_auto_mode(struct amd_pmf_dev *dev);
>  void amd_pmf_deinit_auto_mode(struct amd_pmf_dev *dev);
>  void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t time_elapsed_ms);
>  int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req);
> +int apmf_get_sbios_requests_v2(struct amd_pmf_dev *pdev, struct apmf_sbios_req_v2 *req);
>  
>  void amd_pmf_update_2_cql(struct amd_pmf_dev *dev, bool is_cql_event);
>  int amd_pmf_reset_amt(struct amd_pmf_dev *dev);

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer

