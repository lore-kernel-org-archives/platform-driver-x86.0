Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAFE3ACF14;
	Wed, 14 Oct 2026 11:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791978615; cv=none; b=PZ9jNjDqAcjTesuYPIa9Vhlv+ppImOfrbFn2iH26Q+V1MpVn95zTL/s93XiP9AGn8Mz5PwWMpVzKJjhhJAYRWU3/T0gpb/Hg2sR/JbHn04AWm8izFSQyOzB2qCVFJOy1G74Rw+hOM6OkLGks+4Ly6PnqzwFleRUk5Jgahyf8UWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791978615; c=relaxed/simple;
	bh=3eQW3Np2Ig1i0IBa/vXKUPcA+RlCfpht/Zou2EnyoPU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=eqYOWUROUr7ZsoeccssRXuuAK64GLfdqUTk+tLg4jNhRtBvOP96jRKQDWq1aMgOTAiw5b5zWzF874CM9XfvBfWe47aNO3RM0oXimX+sFBV6Uw3B28gGtts3myZsKm0RTKl3FCnVxTivePAOD4U0u+tMW4ENes7K5Sje0lhk21hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C/5sWqqA; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C/5sWqqA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791978609; x=1823514609;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=3eQW3Np2Ig1i0IBa/vXKUPcA+RlCfpht/Zou2EnyoPU=;
  b=C/5sWqqAgOhpAmQkC5WyeCxdIzMTY4DmjsDnhTphoJ0A5dqBr0KlMOIQ
   6zXb8sMJPeIYBIM7kzUVkjfj2BR9ZVKG4zzQlubF/0hsJhF07+7CLFvRM
   GB/aC5bfIQQ33hAHci5GCyV/dHMNX5e6xkK5kobqdT67GzalChMpvkK88
   El7eVGCBAk2tJMlveOTSgCCotbxxXFGSNfsQc0VEPv4kF+jzi2YXz9mS3
   qRcxeMIwG3Ubd3vMAzG++I+TixWBhh9jkB76Gf6gyDCu+E54I5JTyoSmi
   8Ys/8LBj5RMp0EzigQwNRvtmjmGDXjeK/CSCBeh8Q4VI/FNvyQ++uHO22
   Q==;
X-CSE-ConnectionGUID: Jdk1IW2MRZSXRNAS9rtqIA==
X-CSE-MsgGUID: xlHNRdA9R6ipUiH957CFwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="627322"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="627322"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 04:50:07 -0700
X-CSE-ConnectionGUID: l6beHjTySKW472lri4p5Jg==
X-CSE-MsgGUID: QFUUdaPtSWqXgWiWoAezBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1873919"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.234])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 04:50:05 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 14 Oct 2026 14:50:01 +0300 (EEST)
To: chitranshmandhaniya@gmail.com
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, 
    Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
Subject: Re: [PATCH] platform/x86: dell-uart-backlight: recover from stray
 EC response byte
In-Reply-To: <20261004110333.5790-1-chitranshmandhaniya@gmail.com>
Message-ID: <84756da9-dab7-84df-0469-dadfedb1eb78@linux.intel.com>
References: <20261004110333.5790-1-chitranshmandhaniya@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 4 Oct 2026, chitranshmandhaniya@gmail.com wrote:

> From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
> 
> On some Dell AIO machines the EC occasionally inserts a spurious byte
> after the cmd-echo in UART backlight response frames. A get-brightness
> reply "04 0c 0a e5" arrives as "04 0c 0d 0a e5". The length field still
> reflects the original frame size, so the parser consumes the stray byte
> as payload and mistakes the real payload for the checksum, returning
> -EIO.
> 
> Handle this in dell_uart_bl_receive(): on the first checksum failure for
> a frame longer than the minimum size, drop the byte at the first payload
> offset, shift the rest down by one, read one more byte as the new
> checksum, and re-validate.  Limit this single-byte resync to once per
> command via a resync_used flag cleared at the start of each transaction.
> A second mismatch is still a hard error.
> 
> Well-formed replies pass on the first check and never enter the recovery
> path.
> 
> Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
> ---
>  .../platform/x86/dell/dell-uart-backlight.c   | 92 +++++++++++++------
>  1 file changed, 62 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
> index f323a667dc2d..068b91c21bf4 100644
> --- a/drivers/platform/x86/dell/dell-uart-backlight.c
> +++ b/drivers/platform/x86/dell/dell-uart-backlight.c
> @@ -51,7 +51,7 @@
>  #define MAX_RESP_LEN			80
>  
>  struct dell_uart_backlight {
> -	struct mutex mutex;
> +	struct mutex mutex; /* Protects command + response state below */
>  	wait_queue_head_t wait_queue;
>  	struct device *dev;
>  	struct backlight_device *bl;
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
> @@ -208,8 +210,10 @@ static const struct backlight_ops dell_uart_backlight_ops = {
>  static size_t dell_uart_bl_receive(struct serdev_device *serdev, const u8 *data, size_t len)
>  {
>  	struct dell_uart_backlight *dell_bl = serdev_device_get_drvdata(serdev);
> +	const int max_passes = 2;
>  	size_t i;
>  	u8 csum;
> +	int pass;
>  
>  	dev_dbg(dell_bl->dev, "Recv: %*ph\n", (int)len, data);
>  
> @@ -220,42 +224,70 @@ static size_t dell_uart_bl_receive(struct serdev_device *serdev, const u8 *data,
>  	}
>  
>  	i = 0;
> -	while (i < len && dell_bl->resp_idx != dell_bl->resp_len) {
> -		dell_bl->resp[dell_bl->resp_idx] = data[i++];
> -
> -		switch (dell_bl->resp_idx) {
> -		case RESP_LEN: /* Length byte */
> -			dell_bl->resp_len = dell_bl->resp[RESP_LEN];
> -			if (dell_bl->resp_len < MIN_RESP_LEN ||
> -			    dell_bl->resp_len > dell_bl->resp_max_len) {
> -				dev_err(dell_bl->dev, "Response length %d out if range %d - %d\n",
> -					dell_bl->resp_len, MIN_RESP_LEN, dell_bl->resp_max_len);
> -				dell_bl->status = -EIO;
> -				goto wakeup;
> +	for (pass = 0; pass < max_passes; pass++) {
> +		while (i < len && dell_bl->resp_idx != dell_bl->resp_len) {

Hi,

Could the inner part be moved into a function so you wouldn't need to add 
the pass based approach but could just call the function again? I think 
that would be much easier to follow than adding a loop for retry.

If you end up doing that, please make the function refactoring in a 
separate change before adding the extra byte handling.

--
 i.

> +			dell_bl->resp[dell_bl->resp_idx] = data[i++];
> +
> +			switch (dell_bl->resp_idx) {
> +			case RESP_LEN: /* Length byte */
> +				dell_bl->resp_len = dell_bl->resp[RESP_LEN];
> +				if (dell_bl->resp_len < MIN_RESP_LEN ||
> +				    dell_bl->resp_len > dell_bl->resp_max_len) {
> +					dev_err(dell_bl->dev,
> +						"Response length %d out if range %d - %d\n",
> +						dell_bl->resp_len, MIN_RESP_LEN,
> +						dell_bl->resp_max_len);
> +					dell_bl->status = -EIO;
> +					goto wakeup;
> +				}
> +				break;
> +			case RESP_CMD: /* CMD byte */
> +				if (dell_bl->resp[RESP_CMD] != dell_bl->pending_cmd) {
> +					dev_err(dell_bl->dev, "Response cmd 0x%02x != pending 0x%02x\n",
> +						dell_bl->resp[RESP_CMD], dell_bl->pending_cmd);
> +					dell_bl->status = -EIO;
> +					goto wakeup;
> +				}
> +				break;
>  			}
> -			break;
> -		case RESP_CMD: /* CMD byte */
> -			if (dell_bl->resp[RESP_CMD] != dell_bl->pending_cmd) {
> -				dev_err(dell_bl->dev, "Response cmd 0x%02x != pending 0x%02x\n",
> -					dell_bl->resp[RESP_CMD], dell_bl->pending_cmd);
> -				dell_bl->status = -EIO;
> -				goto wakeup;
> -			}
> -			break;
> +			dell_bl->resp_idx++;
>  		}
> -		dell_bl->resp_idx++;
> -	}
>  
> -	if (dell_bl->resp_idx != dell_bl->resp_len)
> -		return len; /* Response not complete yet */
> +		if (dell_bl->resp_idx != dell_bl->resp_len)
> +			return i; /* Response not complete yet, wait for more data */
> +
> +		csum = dell_uart_checksum(dell_bl->resp, dell_bl->resp_len - 1);
> +		if (dell_bl->resp[dell_bl->resp_len - 1] == csum) {
> +			dell_bl->status = 0; /* Success */
> +			dev_dbg(dell_bl->dev,
> +				"Response OK for cmd 0x%02x, len %d: %*ph\n",
> +				dell_bl->pending_cmd, dell_bl->resp_len,
> +				dell_bl->resp_len, dell_bl->resp);
> +			goto wakeup;
> +		}
> +
> +		/*
> +		 * Some EC firmware inserts a stray byte right after the cmd-echo
> +		 * byte. Try once to drop it and re-fetch the checksum byte from the wire.
> +		 */
> +		if (!dell_bl->resync_used && dell_bl->resp_len > MIN_RESP_LEN) {
> +			dell_bl->resync_used = true;
> +
> +			dev_warn(dell_bl->dev,
> +				 "Checksum mismatch got 0x%02x expected 0x%02x, dropping stray byte 0x%02x at offset %d\n",
> +				 dell_bl->resp[dell_bl->resp_len - 1], csum,
> +				 dell_bl->resp[RESP_DATA], RESP_DATA);
> +
> +			memmove(&dell_bl->resp[RESP_DATA], &dell_bl->resp[RESP_DATA + 1],
> +				dell_bl->resp_len - RESP_DATA - 1);
> +			dell_bl->resp_idx = dell_bl->resp_len - 1;
> +			continue; /* re-fetch the last (checksum) byte and re-validate */
> +		}
>  
> -	csum = dell_uart_checksum(dell_bl->resp, dell_bl->resp_len - 1);
> -	if (dell_bl->resp[dell_bl->resp_len - 1] == csum) {
> -		dell_bl->status = 0; /* Success */
> -	} else {
>  		dev_err(dell_bl->dev, "Checksum mismatch got 0x%02x expected 0x%02x\n",
>  			dell_bl->resp[dell_bl->resp_len - 1], csum);
>  		dell_bl->status = -EIO;
> +		goto wakeup;
>  	}
>  wakeup:
>  	wake_up(&dell_bl->wait_queue);
> 

-- 
 i.

