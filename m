Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07EA394785;
	Thu, 17 Sep 2026 14:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789656841; cv=none; b=iycarnPBCL6+PFPxjnWhyVU8mE2zM7KRZH2UobTIAcNAfiAozzUXdfcldCNEAnjf5ouJT9nznDpzhOYgV4c3KH8BAOF/T0cCcJBvF3OgnbElPZ+PfsVWkVD1llzhTX0OaDeYQXIRq9MhcEVesl1Cskd+QHCzyF7IYBeag6o+98U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789656841; c=relaxed/simple;
	bh=TiwKGVgw2Ld6pK/y11lf6uV//A28EdUyrp33XbA6RqA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Ea7KIARPX6Evm4wFEb0tWDcsiDYzXeMaemWJC4Wso302cgPIrPQYShHh57jEMDnC0VZONBHiuHSxZf6glbdaCN7LXuQ68+FNalmP06A7du+Z9d3/8cLmJOIPu0Bmn+nxUCIWlPNSadkZEM7rkSUxMrdZmAYbnVCAQioOz48pQYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=inbCfc7l; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="inbCfc7l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789656836; x=1821192836;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=TiwKGVgw2Ld6pK/y11lf6uV//A28EdUyrp33XbA6RqA=;
  b=inbCfc7ltM2pkHea17PBIsgGJUjOKZOVUGnUbWyTPnuLDObZcvALKbgp
   OIIR3LFjhGkxOdFE53Mqp+SoKt8HSdKosthkF6FKb0ME4JRi9cvuYFxBA
   tl3tTaaA83LtPIsl7SjC9c+1G5Wc6dAvr68zvvbjome1YxJACuXNzPXUo
   GmqW51rsSLODtybAXyEubgQ8aLRCWhik5lV0bcSSSCff2DQAw+UWFOg3d
   87/s7xsi8wqND6L1MeXvMOHo6IxithqNkNli//HSS05+P5eZRWaa7Uf1A
   ku7scxb53hMyQAbDNVaz6Frdmt8oqYgFtaEVys8+llJRbXMP/nWU3yCYv
   A==;
X-CSE-ConnectionGUID: th5nLgjBT5uQd2zlzpJsVQ==
X-CSE-MsgGUID: o90bXjk/RMuDOf6S8o61ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89221060"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89221060"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 07:53:51 -0700
X-CSE-ConnectionGUID: w2Vu11xGTn+lubomUHq2jw==
X-CSE-MsgGUID: TmsyzN5+T9aFmmbyiP4zdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270161089"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.62])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 07:53:48 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 17 Sep 2026 17:53:44 +0300 (EEST)
To: Yongho Park <yhpark7i@gmail.com>
cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Derek J . Clark" <derekjohn.clark@gmail.com>, Armin Wolf <W_Armin@gmx.de>, 
    platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org, 
    Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
    Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] docs: wmi: fix spelling of "frequency"
In-Reply-To: <20260823033006.45651-1-yhpark7i@gmail.com>
Message-ID: <a51a9ebc-5c53-12c4-02d6-6d9ca1498d0c@linux.intel.com>
References: <20260823033006.45651-1-yhpark7i@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 23 Aug 2026, Yongho Park wrote:

> Fix a typo in the Lenovo GameZone WMI documentation.
> 
> Signed-off-by: Yongho Park <yhpark7i@gmail.com>
> ---
>  Documentation/wmi/devices/lenovo-wmi-gamezone.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
> index 1769ad3d57b9..3579aa32c5d6 100644
> --- a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
> +++ b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
> @@ -152,7 +152,7 @@ data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
>      [WmiDataId(1), read, Description("P-State ID.")] uint32 PStateID;
>      [WmiDataId(2), read, Description("CLOCK ID.")] uint32 ClockID;
>      [WmiDataId(3), read, Description("Default value.")] uint32 defaultvalue;
> -    [WmiDataId(4), read, Description("OC Offset freqency.")] uint32 OCOffsetFreq;
> +    [WmiDataId(4), read, Description("OC Offset frequency.")] uint32 OCOffsetFreq;
>      [WmiDataId(5), read, Description("OC Min offset value.")] uint32 OCMinOffset;
>      [WmiDataId(6), read, Description("OC Max offset value.")] uint32 OCMaxOffset;
>      [WmiDataId(7), read, Description("OC Offset Scale.")] uint32 OCOffsetScale;

This typo is present in vendor's description that the tool outputs as is. 

We've decided we're not making these kind of corrections.

-- 
 i.

