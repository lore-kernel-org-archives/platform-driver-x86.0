Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828259;
	b=1k7cBOUe27QVpaO0b3JAd1juiwTAJrnV6qARSDTDTfduiK1McQUxrJ3+Whb1GqeQzDNc
	 rgyxRTSL5JnMu1tatT8iji9ACD7U6FMaqNsobl0xVRujAoSGrDUTb6vwxD3qHim5J0E/C
	 UzO463dtIIZFT9KylRrPm0hv+LRboo3NbXIMWkv3rPHNWHI4CBPMwfkgHHjqn502ej73V
	 x+OARNvrGoabcD+jMpsc58KgIqiGLQKMG9r/t9YPPYOHWjR+7+oCmLwsqsuww1Psjud6j
	 LdhGxZVJNwTVxbmMDM52duVkNSBc/E+sQcjPhcZ2PqDLlvB8I33rN7hECT1760LHitQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828259;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=qS8X9zY4g75Ph9TyTHh9JXIcSypVMVgi0PbT8Mv/YYY=;
	b=HyxXWQQqV7vMIBfe4Tk0q4wWOBfc+H/6j026Obdfh3GcphhGqjVR2qlLveUYmR6y5yvF
	 Re1I+Jgajdp2CB8ph+wLa2GI6I1wPQaIejuFpenFVDgoZK/REE6rl3vko0f4aWLmtzPNI
	 11MXBQPseg1/YQxk+EMVZfFQS4jjoPOO0E0YRUXn5mW7ha1rd+Z3wSkeGeG87NeBaSuoq
	 fSZ7yluTTh3mGYDh1TVWBYyPxtt3oL/7wBcJuDJmh1pglos+eke4wUiKEJFAP13HaCyf4
	 V9ny/QTHyn3ef1bgc7xztPeFE8Q85JOZMTQpPlDryT4WvH2pctBG9cfZ215xjsTikHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F9L89PkZ;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F18606A8AD;
	Mon, 16 Nov 2026 11:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77F18606A8AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F9L89PkZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794828259; x=1826364259;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jmpwFgSQDJgOv8SI7+IJoXnvaUEcUwmlHF1P1RLN5wc=;
  b=F9L89PkZ/uLv/j1mpRhtqrnPwVimDX7vmhX7na0b+6nI9+2Q6wYsCsIL
   6LfsKfvKpJwV74Kyfk+TiNIrdH64Q9I2fE3EdhjXNfln1TTjTWJfnWw1p
   ZRRoUl3r2rRPRnQCr0vGUQZL7nbJThVywXHeYyN/vNrfnl2s+c+VFdB4i
   yD+/diPZM0UfYpL/hWBEz+bXTG1k2zMCEU7a2jCga2x2ZyjcpdIYpb0sq
   HuzFLy+RBVftAwR2Yz/NFysaB5MOZoBSHZTB2eLNj8J6x7QaUc47TEv4u
   5hNX7LCeEGzweg2p1SJpuuwK8qFW5hiJnLLa9PO8ajO00nxIvmQ3v6Of5
   w==;
X-CSE-ConnectionGUID: 5WcpvMXEQUqGqGK9Q/H2Og==
X-CSE-MsgGUID: eeYWDiIVR6K1e7tVye3obA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3574107"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3574107"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 03:24:18 -0800
X-CSE-ConnectionGUID: SWR86sO2SDqickORTQVMFw==
X-CSE-MsgGUID: R6rtWsKsSMe6UmlwmjUkvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9769293"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.90])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 03:24:15 -0800
Date: Mon, 16 Nov 2026 13:24:13 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Doug Warzecha <Douglas_Warzecha@dell.com>,
	Andrew Morton <akpm@osdl.org>, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] platform/x86: dell: dcdbas: Release the SMI buffer
 in remove
Message-ID: <avrn3cn5yX2LTZ2u@ashevche-desk.local>
References: <cover.1794633178.git.rosenp@gmail.com>
 <a486b9714c8e58761e6368e7d75169441ce87e96.1794633178.git.rosenp@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a486b9714c8e58761e6368e7d75169441ce87e96.1794633178.git.rosenp@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Nov 13, 2026 at 10:17:56PM -0800, Rosen Penev wrote:
> dcdbas_exit() frees the SMI data buffer before
> platform_device_unregister() removes the sysfs attributes, and without
> holding smi_data_lock. The comment claims that only at module exit can
> all sysfs attributes be released, but device attributes do not pin the
> module: while rmmod runs, smi_data_write() or smi_data_buf_size_store()
> can still be executing. They can then memcpy() into the buffer as it is
> freed, or allocate a new buffer that is never freed.
> 
> sysfs_remove_group() in dcdbas_remove() waits for running attribute
> handlers, and dcdbas_pdev is still valid at that point. Free the buffer
> there, or unmap the firmware-provided buffer when WSMT is in use, and
> also do it when probe fails after dcdbas_check_wsmt() mapped the
> firmware buffer. Reset the WSMT state with it so a later probe starts
> clean.

...

> +/**

Really? If so, can you validate this with kernel-doc?

> + * dcdbas_release_buffer: free the SMI data buffer or unmap the WSMT one
> + */

-- 
With Best Regards,
Andy Shevchenko


