Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A8D47B436;
	Fri, 16 Oct 2026 10:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145241; cv=none; b=XgvhkLyZk10mtFi0L0dwK8p9BS1SELf3IZldCIyDzKR9fqLs/p+FIXgeU7GPBAMo9mbVuynnM3moHpOp/RVMbKTfbM+FPEJ/QnzSoOqvUa7Jd2l4wfK6WHiwJfojmkXYtGwMTxyg7jt7oO2Mvkf3vHD4B6c1SmyzfCJVMA6798A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145241; c=relaxed/simple;
	bh=ycLYlWgildj1eydfVk7aTjidCEghj5MHoaZtD9xE77s=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=itoH3S1D3qz+Pk3rSSV0Ti6rybzPR5dEjHvxHc0D0lvT3rECrHyjw5x8Wjkyij0fcORITmHbf08Ub3mhL/c+7IwIYJ0HKG6ibSy0apyi+m4DrS82offFEUeQziTHI1y4tLNbnzVjFnH4X01u9XAgvnfyE04BngMkuB75vXEzVI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GK5nOa8Y; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GK5nOa8Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792145236; x=1823681236;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ycLYlWgildj1eydfVk7aTjidCEghj5MHoaZtD9xE77s=;
  b=GK5nOa8YQOu6qlBj4dVmna5/s/UKBcdH1ssxgCs4Kj2CkL2Qpis85THc
   u9HJJLyxvGE1Xy6Ie4WsG/zDSivP0TX4suKTQChuBJu7AsQ8zowkFCiz8
   TZgYQ7eDOrXSxBQdenjZvnUBtOqXCbwiOUUCekddgiv5VvCuJ++hLs5M6
   Gz+V5+nJYu3fnEfLSxXLWjSEhNJOB3nDboTficKyBMsH72gqlfqAvnw8F
   FHZrY0AwU+eG+NzfOgB34Y3e6AwPr9ix3OizZmjNvyUR9Bn2CC8aqdhpZ
   z4bwr3dFWuAyAdIXX+iReeMIH5fliRBbp/zpjPCsbQUHxZJ4mrmAya/pL
   w==;
X-CSE-ConnectionGUID: nklBJe3IQQytZdZoIKyKVg==
X-CSE-MsgGUID: wwalyMZcQKGz0NOzXpCeQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="929206"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="929206"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 03:07:15 -0700
X-CSE-ConnectionGUID: /wE4urAxTWmIVhBbCbBb6Q==
X-CSE-MsgGUID: +gzDmLQvRimZSjbTKiOl6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1987796"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.34])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 03:07:12 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 16 Oct 2026 13:07:08 +0300 (EEST)
To: chitranshmandhaniya@gmail.com
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Chitransh_Mandhaniya@dell.com
Subject: Re: [PATCH v3 2/2] platform/x86: dell-uart-backlight: recover from
 stray
In-Reply-To: <20261016093302.55528-3-chitranshmandhaniya@gmail.com>
Message-ID: <8d97e2d8-fc0e-4f59-38f4-401446add879@linux.intel.com>
References: <20261004110333.5790-1-chitranshmandhaniya@gmail.com> <20261016093302.55528-1-chitranshmandhaniya@gmail.com> <20261016093302.55528-3-chitranshmandhaniya@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 16 Oct 2026, chitranshmandhaniya@gmail.com wrote:

> From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
> 
> On some Dell AIO machines the EC occasionally inserts a spurious byte
> after the cmd-echo in UART backlight response frames. A get-brightness
> reply "04 0c 0a e5" arrives as "04 0c 0d 0a e5". The length field still
> reflects the original frame size, so the parser consumes the stray byte
> as payload and mistakes the real payload for the checksum, returning
> -EIO.
> 
> On the first checksum failure for a fully received frame, drop the byte
> at the first payload offset, shift the remaining data down by one, and
> call dell_uart_bl_receive_data() again to re-fetch the checksum byte
> from the wire. Track total consumed bytes so the exact count is
> returned to serdev.
> 
> The resync is guarded by resp_idx == resp_len to ensure a complete frame
> was received, preventing memmove on a truncated or out-of-range length
> field.
> 
> Limit this single-byte resync to once per command via a resync_used flag
> cleared at the start of each transaction.  A second mismatch is still a
> hard error. Well-formed replies never enter the recovery path.
> 
> While at it, switch mutex_init() to devm_mutex_init() so the mutex is
> automatically destroyed via devres, fixing a missing mutex_destroy()
> on the teardown path.
> 
> Tested on Dell OptiPlex AIO 7410 65W (0TKWC4) where the EC inserts a
> stray byte on every get-brightness response -- resync fixes it
> transparently.
> 
> Suggested-by: ilpo.jarvinen@linux.intel.com

This is not the correct formatting for a tag (please see 
Documentation/process/submitting-patches.rst). And my Suggested-by should 
only be in the devm_mutex_init() change (more on this below).

> Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
> ---
>  .../platform/x86/dell/dell-uart-backlight.c   | 35 ++++++++++++++++---
>  1 file changed, 31 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
> index af9c5f9a566f..b0df479a4658 100644
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
> @@ -256,7 +258,7 @@ static size_t dell_uart_bl_receive_data(struct dell_uart_backlight *dell_bl,
>  static size_t dell_uart_bl_receive(struct serdev_device *serdev, const u8 *data, size_t len)
>  {
>  	struct dell_uart_backlight *dell_bl = serdev_device_get_drvdata(serdev);
> -	size_t ret;
> +	size_t consumed;
>  
>  	dev_dbg(dell_bl->dev, "Recv: %*ph\n", (int)len, data);
>  
> @@ -266,12 +268,35 @@ static size_t dell_uart_bl_receive(struct serdev_device *serdev, const u8 *data,
>  		return len;
>  	}
>  
> -	ret = dell_uart_bl_receive_data(dell_bl, data, len);
> +	consumed = dell_uart_bl_receive_data(dell_bl, data, len);
>  	if (dell_bl->status == -EBUSY)
>  		return len; /* Response not complete yet */

So again I'm not following logic here. dell_uart_bl_receive_data() 
consumed all of len but response is still not complete, right? Why we 
return len and not consumed? I'd expect them to be same in that case but 
is there a case where they differ?

Subtle things like this may make the code harder to follow, because reader 
will have to ask this kind of questions and then attempt to figure out 
what case he/she doesn't understand.

> +	/*
> +	 * Stray byte after cmd-echo? Drop it, shift data down, re-fetch
> +	 * checksum. Only attempt when a full frame was received (resp_idx ==
> +	 * resp_len) to avoid acting on a truncated length field.
> +	 */
> +	if (dell_bl->status == -EIO && !dell_bl->resync_used &&
> +	    dell_bl->resp_idx == dell_bl->resp_len &&
> +	    dell_bl->resp_len > MIN_RESP_LEN) {
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
> +		consumed += dell_uart_bl_receive_data(dell_bl, data + consumed, len - consumed);
> +		if (dell_bl->status == -EBUSY)
> +			return len; /* Need more data for checksum byte */

I don't follow why consumed is what should be returned because we've eaten 
everything of len but still are short of bytes? So consumed should be same 
as len by my own logic but would be more logical to return (if they're 
equal).

Please don't just mindlessly change these to consumed, I could be wrong 
as I don't fully understand the related logic as it's somewhat messy so 
following all control flow paths is bit of a challenge (to put it mildly).

> +	}
> +
>  	wake_up(&dell_bl->wait_queue);
> -	return ret;
> +	return consumed;
>  }
>  
>  static const struct serdev_device_ops dell_uart_bl_serdev_ops = {
> @@ -291,7 +316,9 @@ static int dell_uart_bl_serdev_probe(struct serdev_device *serdev)
>  	if (!dell_bl)
>  		return -ENOMEM;
>  
> -	mutex_init(&dell_bl->mutex);
> +	ret = devm_mutex_init(dev, &dell_bl->mutex);
> +	if (ret)
> +		return ret;

Thanks but when I says something is "unrelated" to the patch/series. It 
means I've just noticed another issue while reviewing the patch/series,
such extra changes should be made in own patch(es).

We try to make all changes such that they contain only one logical change 
in its minimal form, and no more. In rare cases we need to compromise from 
that rule to not break anything but this is not such a case and could 
definitely be in own patch.

When you have to write in changelog an itemized list or say "while at 
it", "in addition", etc. it's often indicator that you're combining more 
than one logical change. Always when writing such phrase it's good to 
stop for a moment, and ask oneself if that thing could be safely moved to 
own patch instead. Very often the answer is yes.

-- 
 i.

