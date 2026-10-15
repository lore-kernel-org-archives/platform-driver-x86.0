Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E8F4AA004;
	Thu, 15 Oct 2026 10:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059880; cv=none; b=mOjp6Zs7TMGmj8/wy70LVfmjsrB+f6z1mu60cZk0roHayTs3hre7evxuWPdO0aua/x58Ck37gkEQ5+6y04m09HIgrDS0dV9DQY11OQIRPv5vfHhCO72BH6eKQOQTe4k+sM4gcAvS4smQugDoawvgf2cAmE2g5XjG1f/Ik44W8Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059880; c=relaxed/simple;
	bh=lfdpyoKU84XiyN2LyAURT9vH9J+pdY+5AW7uC2lLPbM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=d6RaYtuwtxu2AQaYeEPbFE8uZWk7TScqkFsxtid1PJKXu0z3oIq151dDbtaizVFRwwq1cDkDm7Go8PQRIiwCV7n7drH4rpx/j3yfpYxCQE4AjIpir1GFttiE7U4RikLq7GqFTYj1BqrUmHKaNYyJK5jUF4X73igFJe5PzrxpWaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FCpDbqW4; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FCpDbqW4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792059879; x=1823595879;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=lfdpyoKU84XiyN2LyAURT9vH9J+pdY+5AW7uC2lLPbM=;
  b=FCpDbqW4phRbLuvG17wbgaJ8inmWPURoWnHohsImaAj0CeZFnpSBpGS+
   lEz3SaxXoR5Cs5hVM79j3ARVyNwNqHKGjTGlP2PXkuAAJM8VCQxGZb74Z
   mnsDYAIm8I6Ncd2GzZVyiwh16RfOXP0RNsWghdUktnyhRoKYY6mQuCKly
   v74NtECMvKzNtSvcDKtP57koJ4GUiHl1lLa+RjSMpWDDUS0SExfz0+7IU
   KzFXxZcB2XYWufPLbZfEQWqqwpt9CkP5hwV7mmIBccO4sKkA0Jx+TPymb
   4Cuc6IUbqlseF5pBn/vn2pU08pOgNwuicH6r8u3JWT8zpdgIp234yRmDy
   g==;
X-CSE-ConnectionGUID: C3/D7L6kSz2us3qNrxO3bQ==
X-CSE-MsgGUID: ix7V8lvATDiXhd4f9Vk1DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="712920"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="712920"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 03:24:39 -0700
X-CSE-ConnectionGUID: +eHC1fw/RiaY5iG6jibd6g==
X-CSE-MsgGUID: m6qYxr8EQm+3QUl0Wckg3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1545666"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.130])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 03:24:37 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 15 Oct 2026 13:24:33 +0300 (EEST)
To: chitranshmandhaniya@gmail.com
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Chitransh_Mandhaniya@dell.com
Subject: Re: [PATCH v2 2/2] platform/x86: dell-uart-backlight: recover from
 stray EC response byte
In-Reply-To: <20261015074339.27388-3-chitranshmandhaniya@gmail.com>
Message-ID: <84634c19-87a7-f7a9-a559-11208b2dd033@linux.intel.com>
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

sashiko.dev (an AI review tool so be reasonably critical to its findings) 
mentions that if ->resp_len check fails due to len being too large, 
->status is -EIO and this may end up moving more than there's room in the 
buffer.

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
>  }
>  
>  static const struct serdev_device_ops dell_uart_bl_serdev_ops = {
> 

-- 
 i.

