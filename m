Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6733BA3F
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 12:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715604393; cv=none; b=ic5MxU5c2beiXzYR1Yz/s4qqYDBXWpm94EV4pDLQNde61tB/fhsIhuB8JB+mUSmtNNulWstjxyoTlYhH5mIsvWfruC7+nZXmjM7K2SZ2+y3N22nvV9ICXylbWi49w1WTG41kIypqzC1gEtdBD32cC/fMY0CNrdcojEeI5CFa3AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715604393; c=relaxed/simple;
	bh=3CNKpWGAqcuSMQS/IOPavLWHv3+pdVWrtLANfzHXTew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HpBrwSIGCJx6Qi3MKP2uQBTC6UdssZtvh+TsXnEn4wKk6R4ex1hqzYi1AX7XEe/L1eDouIDIRgPLJhEgfrKJBx12QGi7Gg76vD9Tak/LuvjlM16XeXXS0osr4NEPT5n0i+7jpirLgos/HNSMHh5KYZRxpUyk8N73MXvnieya/Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: TtboDpHvRYusVcEw1rc8UA==
X-CSE-MsgGUID: o+ghJR46S1ur2Kcutr+S0Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="15349742"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="15349742"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 05:46:32 -0700
X-CSE-ConnectionGUID: oyD6HjLmQbWOjWitqa+W9w==
X-CSE-MsgGUID: XaXzp8sLTv6+NLQWLNgbOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; 
   d="scan'208";a="30280533"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 05:46:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andy@kernel.org>)
	id 1s6V4V-000000078WK-1MF1;
	Mon, 13 May 2024 15:46:27 +0300
Date: Mon, 13 May 2024 15:46:26 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	AceLan Kao <acelan.kao@canonical.com>,
	Roman Bogoyev <roman@computercheck.com.au>,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 2/2] tools arch x86: Add dell-uart-backlight-emulator
Message-ID: <ZkILom0Ee5ei9xF-@smile.fi.intel.com>
References: <20240513111552.44880-1-hdegoede@redhat.com>
 <20240513111552.44880-3-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240513111552.44880-3-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, May 13, 2024 at 01:15:51PM +0200, Hans de Goede wrote:
> Dell All In One (AIO) models released after 2017 use a backlight controller
> board connected to an UART.
> 
> Add a small emulator to allow development and testing of
> the drivers/platform/x86/dell/dell-uart-backlight.c driver for
> this board, without requiring access to an actual Dell All In One.

...

> +	if (argc != 2) {
> +		fprintf(stderr, "Invalid or missing arguments\n");
> +		fprintf(stderr, "Usage: %s <serial-port>\n", argv[0]);
> +		return 1;
> +	}
> +
> +	serial_fd = open(argv[1], O_RDWR | O_NOCTTY);
> +	if (serial_fd == -1) {
> +		fprintf(stderr, "Error opening %s: %s\n", argv[1], strerror(errno));
> +		return 1;

So, looking at the `man error` it works like your custom approach with an
additional things.

Also, don't you want to use either different error codes (above is +1 and all
below seems using -1), or be consistent and return -1 always?

> +	}

...

> +		/* Respond with <total-len> <cmd> <data...> <csum> */
> +		response[0] = len + 3; /* response length in bytes */
> +		response[1] = buf[1];  /* ack cmd */
> +		csum = dell_uart_checksum(response, len + 2);
> +		response[len + 2] = csum;

> +		ret = write(serial_fd, response, len + 3);

response[0] can be reused here.

> +		if (ret != (len + 3))

And here.

> +			fprintf(stderr, "Error writing %d bytes: %d\n",
> +				len + 3, ret);
> +	}

-- 
With Best Regards,
Andy Shevchenko


