Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794902271;
	b=FCGeXEaTA8NK6mEzRbqBsv0rX/PFcwTIRZ91vCNPO4sXFZlDT9IY5BWpbEdRpQYtx1f0
	 SRSHwPGXNr7eB3MUWj3+fO9Bxg9Aajj5fLb/V+2ON3MA2dAnWns+KAdpG0IWHcGwShIjt
	 vaoQfJdXPt2Opin6v0ojQr02ZdrHMsd7MEjd0+67u+OV4Zg1Ftqogj7j1KzcsCNA9vowa
	 1AUGe2PLCeObAt2peqzftVGwjVtE0bzFnkORSV75WxSI++cZ5hi4o2cjQj0bH5BUH7/jS
	 8QATeLI+B+JkMg+hk9BVPD8xBZSGK02TyZ6HKpJ0B5jCptv7/2Fv5K2FwqlMPAkDQpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794902271;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=XJMEYctiUaiTMr5fLPJe5/+g27wuakUGZNQB4s+Lb40=;
	b=KaCJEk44EAz+rKr0xVMhpLM0DF4MCHGYGzYux+/uc55kXnIswrO4rM4FPQ2G6JsNYk5g
	 vkkWKJx0bdmbJCTK95hXCZTtBuHfrwETx06TJI4AdOGHFXGsh6T9c8bQl95NONwI8AcI3
	 xMRITE2bzPLL+JbBS5bXHQQ5QHYyOdx4FOKenwD8OyG+oCDnNRA7sNmGWbf1/0g8QxqJt
	 ju9MZOq5cquPdEVx4Vz0gtlfGyXOI7xPnUMNHbpdN+EMMmOkA/bPCvOOWmfxzQ6rrd/GA
	 pFh0sHjYsp308IfR0SAWGwBD6W3EN9z7Ei1H7uf6c0GgtoEw0D0CPZpbLyjMRTvYZYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I1dWARxt;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D80606A31C;
	Tue, 17 Nov 2026 07:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69D80606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I1dWARxt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794902271; x=1826438271;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8cuPqIDZtVU//RnFTcStQa1YGcUqMY/4vGguaZkoUfk=;
  b=I1dWARxtbsZaZ6uaLMbaMeCIMNDr5GexEgpO2YVYgQq6Ba7sAsAIQWEr
   pPixjM2G7V2mVYJ1zfN41Do1ogYOLjDxkri2JeI1dta7e3OoatTR4BpJg
   7167jI2NcjNc7MfHTO8bSrPv/cCwsvdIwsIW25/FR/RMURorTQd/9/oug
   //QNSTO5rnd4a88nGzBNET7Tly66MwYWEGeiOJ8l1yeTOXsrDJfLLO3IA
   FgZVC8e1/k/dbN2WY3/TLnGS3ovvmC/OuoVfXKzP1xXucbtPVJXwIaaFV
   +60UeIMsCuN+RzrJt6uffERQYrYqmmVEA7RID+vKlStK7YkDTjcXzm/I8
   w==;
X-CSE-ConnectionGUID: iaXouAsRTkeYtTjGsvcDRw==
X-CSE-MsgGUID: eG/BqcqtQJalTo3dijGu0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3563479"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3563479"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 23:54:34 -0800
X-CSE-ConnectionGUID: xKqtuF3rR1W2bVCHeyU8Rw==
X-CSE-MsgGUID: MOhld0zoToiIsaIy1SgZuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9820601"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.254])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 23:54:30 -0800
Date: Tue, 17 Nov 2026 09:54:28 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Morton <akpm@osdl.org>,
	Doug Warzecha <Douglas_Warzecha@dell.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] platform/x86: dell: dcdbas: Actually wait for the
 host control SMI
Message-ID: <avwINFo8rNjSDN3A@ashevche-desk.local>
References: <cover.1794861287.git.rosenp@gmail.com>
 <62690b76d5cb95113b01092c8e3944fbb21a0922.1794861287.git.rosenp@gmail.com>
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
In-Reply-To: <62690b76d5cb95113b01092c8e3944fbb21a0922.1794861287.git.rosenp@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 16, 2026 at 12:40:49PM -0800, Rosen Penev wrote:
> For SMI types 2 and 3, host_control_smi() writes the command status as
> -1, raises the SMI and then waits for the BIOS to change the status:
> 
> 	while (apm_cmd->status == ESM_STATUS_CMD_UNSUCCESSFUL) {
> 
> apm_cmd->status is a plain memory read, and neither outb() nor inb()
> tells the compiler that memory may have changed, so the compiler
> assumes status is still -1. The loop then has no side effects and its
> return value is not used, so it is removed entirely: in the generated
> code, the read of the control port is followed directly by the return.
> The kernel goes on to power off right after raising the host control
> SMI, without waiting for the BIOS to accept it.
> 
> The type 1 wait polls the APM status port instead, in a loop that
> counts down TIMEOUT_USEC_SHORT_SEMA_BLOCKING iterations and relies on
> each inb() taking about a microsecond.
> 
> Convert both waits to read_poll_timeout_atomic(), using READ_ONCE() for
> the status in memory and inb() for the status port, 1us apart for up to
> TIMEOUT_USEC_SHORT_SEMA_BLOCKING microseconds as the name suggests, and
> return its error. That is -ETIMEDOUT rather than -ETIME, but both
> callers ignore the return value. With the delay plus the port read, the
> type 1 worst-case wait grows from about 10ms to about 20ms, which only
> matters when the BIOS never answers.
> 
> This removes the last users of num_ticks and EXPIRED_TIMER.

...

> +		ret = read_poll_timeout_atomic(inb, cmd_status,
> +					       cmd_status != ESM_STATUS_CMD_UNSUCCESSFUL,
> +					       1, TIMEOUT_USEC_SHORT_SEMA_BLOCKING,
> +					       false, PCAT_APM_STATUS_PORT);

readx_poll_timeout_atomic() is your friend.

...

> +		ret = read_poll_timeout_atomic(READ_ONCE, cmd_status,
> +					       cmd_status != ESM_STATUS_CMD_UNSUCCESSFUL,
> +					       1, TIMEOUT_USEC_SHORT_SEMA_BLOCKING,
> +					       false, apm_cmd->status);

In the similar way.

-- 
With Best Regards,
Andy Shevchenko


