Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827888;
	b=mWXFl9SvW+UURoSzdUHFJ89mw0NzD4CsN68yy/pDtMH9dOxF2MqaVMGoLqBiPcADD18o
	 rcrXiZsEJ5ZTRX+gs/QJK5T0zYQ2J+qg2kQmgwmaolpvlVOZrRG4Vu3/6kis2GnDJNJG6
	 eWF98oc7RxZyPVhxjbl4WIdfsDyJzFohJL7uGjNCAuFJfq4106VyMoluXBtBGCKcz3EeB
	 CRcwYkmTdFbYFIepfNHC4r2w080V79szYKFSJrAehJsq2mjtWJqjUYteJDfSE/y5FXnbt
	 SFHjxkf/oGE91GavHLyTtNPL4nS1Ex0RotCA3XX10rUojvOgCnhw5Y5h8u9dqwvEEXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827888;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=k9lxrzIdInvq9btMgvizugK1mUur9NCe6HX8gKzykt0=;
	b=FuaZUbYmwL16qaZ3Ti7dLX+PrNxiTEGn8M4HnQzy9SW3Da1BixDYe//EUpLFafjr9CUs
	 OlsiTmsdnTDm5HWg83dCPBukrht6yP05VnJL5gQQ/oECoRN6mbGiIXjpiizP6OlJ1iu9f
	 UxDzO4DEyTron3xFdJcx1OSRRWkihhwLHaKeErSj5O8UO257J2ihV1Sxt4vNcnX5Nkkm2
	 j0trg/vs6m8T72PbeGbZDWrjl6c3UDaeh7S92LE0rnmznxDI8nvN9WHIly3xBUTmy/xdq
	 A7ZjuvCFkiDP5HwRZ7SuHl9N1S+IkNmvmaUBEBNSXp89v5sCoIt6Hrjown3vPt9Hrag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jc3Zd23v;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9BD606FA41;
	Mon, 16 Nov 2026 11:18:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC9BD606FA41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jc3Zd23v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794827888; x=1826363888;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Dm3skxKZR9iN1DMUHuk4IuvmNHIA1er61egsHXdVz6A=;
  b=Jc3Zd23vldCMRU4HB6SrlHKFbzZzv2dBki0ujyCXihFyq7JWbvOfo/Qk
   NdiexkDm//NxPwdQnaa6LSAz/C64pkc220wOuJebVKTpO2ppNjb8leZAK
   PwkZxke10NXRzMyVZSI96vjWerx6O5z1NRn7wiOFEx/vGnVB4po3jBT/4
   0aI6XbvfwUndEFoBpf/GrigG9qN3CD+JMC9zmhu8ulGRf5dP5Nxfbh8UW
   NBSnp2Q9qNJnalj2q9UCNafk9oxM2CQHHAKk07aY8AxJ7GCynfKIvw2hh
   2CtMKdBGy3AfYblYx6QBwNNSi7gZZAKvYUarU8FszSmrYuDG7hr36OsAa
   g==;
X-CSE-ConnectionGUID: HBcQg69fQlSnkvDxbPB4JQ==
X-CSE-MsgGUID: 8OP8wiSGTVSDlyYeI1urMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3549931"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3549931"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 03:17:57 -0800
X-CSE-ConnectionGUID: cPdjX64jRQu8vioZsPqzng==
X-CSE-MsgGUID: n0L1h0dIT9qmjPAY9X9m7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9838144"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.90])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 03:17:55 -0800
Date: Mon, 16 Nov 2026 13:17:52 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Doug Warzecha <Douglas_Warzecha@dell.com>,
	Andrew Morton <akpm@osdl.org>, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] platform/x86: dell: dcdbas: Actually wait for the
 host control SMI
Message-ID: <avrmYDgb06et2lj4@ashevche-desk.local>
References: <cover.1794633178.git.rosenp@gmail.com>
 <c35b26234163789f1fc37ba09a48de58d475629a.1794633178.git.rosenp@gmail.com>
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
In-Reply-To: <c35b26234163789f1fc37ba09a48de58d475629a.1794633178.git.rosenp@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Nov 13, 2026 at 10:17:54PM -0800, Rosen Penev wrote:
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
> Poll the status with read_poll_timeout_atomic() and READ_ONCE(), 1us
> apart, for up to TIMEOUT_USEC_SHORT_SEMA_BLOCKING microseconds as the
> name suggests. The type 1 loop polls an I/O port, which already takes
> about a microsecond per read, and is left alone.

...

>  #include <linux/io.h>
> +#include <linux/iopoll.h>

You may replace io.h with iopoll.h.

...

> -		num_ticks = TIMEOUT_USEC_SHORT_SEMA_BLOCKING;
> -		while (apm_cmd->status == ESM_STATUS_CMD_UNSUCCESSFUL) {
> -			num_ticks--;
> -			if (num_ticks == EXPIRED_TIMER)
> -				return -ETIME;
> -		}
> +		if (read_poll_timeout_atomic(READ_ONCE, cmd_status,
> +					     cmd_status != ESM_STATUS_CMD_UNSUCCESSFUL,
> +					     1, TIMEOUT_USEC_SHORT_SEMA_BLOCKING,
> +					     false, apm_cmd->status))
> +			return -ETIME;

Find the difference between -ETIME and -ETIMEDOUT. Besides that, you
effectively ignored the return value of the call. Why?

And on top, this is an inconsistent change, the function AFACS has two of a
such that may be replaced at once.

-- 
With Best Regards,
Andy Shevchenko


