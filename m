Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B944CDA36;
	Thu, 15 Oct 2026 10:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059141; cv=none; b=NyFWP74vTowrdH29zH9lV6rzDfK204ZCIDrhKS7NdkLDdyQMLTgOSdoKXZ5H+WY42MJQloeRjQU1QLSMQyVE/MrL7lWFOUpB9l5jQs5wqii2NNoURvhvCJ3ardAlcO4UyRgtSH6mW5FYDkubjSYSsQ3qgfiPIqTJ8xv8DW5U7T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059141; c=relaxed/simple;
	bh=bQvfl9e9flDdW8Zy5J2Am3lyOYaDCVx7bTib2aYfJhw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DqtjVepil/X+Nsp0/Sh9nelLSJC8E8srktjjXzeGfSl4Bh2oF3KGuUaTqmSFaj9df8Zk+eqA1ImmqjE4Yv/6RknXkQJKPMUIFQfjsT9wXzIruhppcnB/bwNFfQKYWBBibczoNiGrjgsvDIhb3LfWK0i4RF+Ygutx/+LtNpxups0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WyIpUFkE; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WyIpUFkE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792059140; x=1823595140;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=bQvfl9e9flDdW8Zy5J2Am3lyOYaDCVx7bTib2aYfJhw=;
  b=WyIpUFkEszMRK5s2AS9BWgHuD+V4ZGZZyzuUTq4lm27emfrzA8bmX/4U
   rLyc+6jMrCfDIiB4Y7SMlw6BAXGFV/V36k21ozi0mQ0MpmBlJbe47mTGS
   DbSMT3Ya38mysKG3czr06Yk3U9nPTHfqB1VlZ/HlCkTGvlNcgTZvimNnX
   k+xI6d3qW4NeiYlyltqXYgtyza9HfUB5xOk0vhKqhl9wH/x1tgtxBN8Pg
   p5XahA08Cn46zTx1/P60NNgYrbr13KmXtilU+z0QGg+UFcYh6dGdCQ8Qw
   0b9ljRCabUo/AfKKi7IIoYPqAsPigZpWDH2+QHCIoBPvKUkJ+Mp8q6X8g
   A==;
X-CSE-ConnectionGUID: 7p1mihegR56KU3epH08pYQ==
X-CSE-MsgGUID: R9p0ra7BSFSJ3DPNg5xSzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="834529"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="834529"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 03:12:19 -0700
X-CSE-ConnectionGUID: /BZGfBNAS1GLL/+b+soehg==
X-CSE-MsgGUID: Vu7gupRqR1WO7FPE4BUfkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1586339"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.130])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 03:12:17 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 15 Oct 2026 13:12:13 +0300 (EEST)
To: chitranshmandhaniya@gmail.com
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Chitransh_Mandhaniya@dell.com
Subject: Re: [PATCH v2 2/2] platform/x86: dell-uart-backlight: recover from
 stray EC response byte
In-Reply-To: <20261015074339.27388-3-chitranshmandhaniya@gmail.com>
Message-ID: <d31cdfa8-3f52-e1c1-3d03-8fccfcd57e0d@linux.intel.com>
References: <20261004110333.5790-1-chitranshmandhaniya@gmail.com> <20261015074339.27388-1-chitranshmandhaniya@gmail.com> <20261015074339.27388-3-chitranshmandhaniya@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 15 Oct 2026, chitranshmandhaniya@gmail.com wrote:

> From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
> 
> On some Dell AIO machines the EC occasionally inserts a spurious byte
> after the cmd-echo in UART backlight response frames.  A get-brightness
> reply "04 0c 0a e5" arrives as "04 0c 0d 0a e5". The length field still
> reflects the original frame size, so the parser consumes the stray byte
> as payload and mistakes the real payload for the checksum, returning
> -EIO.
> 
> On the first checksum failure for a frame longer than the minimum size,
> drop the byte at the first payload offset, shift the remaining data down
> by one, and call dell_uart_bl_receive_data() again to re-fetch the
> checksum byte from the wire and re-validate.
> 
> Limit this single-byte resync to once per command via a resync_used flag
> cleared at the start of each transaction. A second mismatch is still a
> hard error.  Well-formed replies pass on the first check and never enter
> the recovery path.
> 
> Tested on Dell OptiPlex AIO 7410 65W (0TKWC4) where the EC inserts a
> stray byte on every get-brightness response -- resync fixes it
> transparently.
> 
> Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
> ---
>  .../platform/x86/dell/dell-uart-backlight.c   | 23 ++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
> index b61499d7b3f8..085dcc055554 100644
> --- a/drivers/platform/x86/dell/dell-uart-backlight.c
> +++ b/drivers/platform/x86/dell/dell-uart-backlight.c
> @@ -60,6 +60,7 @@ struct dell_uart_backlight {
>  	u8 resp_len;
>  	u8 resp_max_len;
>  	u8 pending_cmd;
> +	bool resync_used;
>  	int status;
>  	int power;
>  };
> @@ -91,6 +92,7 @@ static int dell_uart_bl_command(struct dell_uart_backlight *dell_bl,
>  	dell_bl->resp_len = -1; /* Invalid / unset */
>  	dell_bl->resp_max_len = resp_max_len;
>  	dell_bl->pending_cmd = cmd[1];
> +	dell_bl->resync_used = false;
>  
>  	/* The TTY buffer should be big enough to take the entire cmd in one go */
>  	ret = serdev_device_write_buf(to_serdev_device(dell_bl->dev), cmd, cmd_len);
> @@ -270,8 +272,27 @@ static size_t dell_uart_bl_receive(struct serdev_device *serdev, const u8 *data,
>  	if (ret < 0)
>  		return len; /* Response not complete yet */
>  
> +	/* Stray byte after cmd-echo? Drop it, shift data down, re-fetch checksum. */
> +	if (dell_bl->status == -EIO &&
> +	    !dell_bl->resync_used && dell_bl->resp_len > MIN_RESP_LEN) {
> +		dell_bl->resync_used = true;
> +		dell_bl->status = -EBUSY;
> +
> +		dev_dbg(dell_bl->dev, "Resync: dropping stray byte 0x%02x at offset %d\n",
> +			dell_bl->resp[RESP_DATA], RESP_DATA);
> +
> +		memmove(&dell_bl->resp[RESP_DATA], &dell_bl->resp[RESP_DATA + 1],
> +			dell_bl->resp_len - RESP_DATA - 1);
> +		dell_bl->resp_idx = dell_bl->resp_len - 1;
> +
> +		/* Re-fetch checksum byte from remaining data */
> +		ret = dell_uart_bl_receive_data(dell_bl, data + ret, len - ret);
> +		if (ret < 0)
> +			return len; /* Need more data for checksum byte */
> +	}
> +
>  	wake_up(&dell_bl->wait_queue);
> -	return ret;
> +	return len;

Thanks. Structuring it this way makes it much easier to follow than the 
loop.

What I'm left a bit unsure is how this last return behaves, and why there 
is the change from ret -> len in this second patch which should be only 
about adding the extra byte trickery.

If ret is always expected to be equal to len before this patch, it would 
make more sense to make that change in patch 1?

(I admit this entire code looks a bit more convoluted than what I'd 
expect to be needed, so I'm not sure if I can follow all this fully.)



Unrelated to this change/series, there seems to be mutex_init() call in 
dell_uart_bl_serdev_probe() that should be changed to devm_mutex_init() + 
error handling so one doesn't need to have to make mutex_destroy() call
manually (it is currently missing).

-- 
 i.

