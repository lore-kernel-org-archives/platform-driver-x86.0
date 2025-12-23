Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907ED2DEA78;
	Tue, 23 Dec 2025 09:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766483054; cv=none; b=rralBsOJyPyVQWHpp6ov6pDkDTZAtxJHYXr5BDEx9FiUGLO2ijJPvVGDhRjO/36rUzFSrB7xZmVH7DBNKxfxRqTkUA2iFk9RkJlT8RkwCcdIW0JaRNKFIv5INXk5Wnezr7cBGDwUNJ4Zf+/rKb4BnGI1nV/uR+TJoT5jjSOmzyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766483054; c=relaxed/simple;
	bh=GCpL6gu3usXDCBCG2ewi7qEASBrDT6n1FAcVmIFlK2M=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=LpV/nuAChltgxdgHmcS+zn/9hkjBPvWoBS1OjL62aBmAdOSPpEaJJwBBxnxiPge9lQsXTTuNrF04CpTv/n0NOLTtXOmsJr0I4s+j7c9qr9i9D5dp+W0qdLPwecP/gOiaN2sXmNGn47SUNP8TD0lRtvmveRuyLka1N8EmgboTJ7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ALdAK8PS; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ALdAK8PS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766483052; x=1798019052;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=GCpL6gu3usXDCBCG2ewi7qEASBrDT6n1FAcVmIFlK2M=;
  b=ALdAK8PSC1gkl02o7Ar+FVBcPatoCjjHEjVUE6VAIMnWvWUdH9UvqFKW
   B/uOVpoUL1Wn67Az+xdcPMS3zckyf+QeKm80A5ASHoIZXfHeatX0L7WYh
   fI7DcYJ2CDkP1fvVWmk+tOx7ksmlenoxOjaP050945/ZHm0CcoWXS3hX7
   0yUN3Yyeli+5bSgPnHNUNNhVyKdZOiei15nzvHsaLAXwcfU0sEDaLzqyM
   K5Zs5dQsB0fX46d+1SnNPBKymYTgjBigXXDLyTE3c5J9UZi44zrTq0y8Q
   pYXBIwyJQT4VS6f+8ZlJww7rgW8LzfgYL6wtnk/ZTT6q5DgSlR7yrdQc1
   Q==;
X-CSE-ConnectionGUID: lI4E3X7vRoiCNsJxwLEmjA==
X-CSE-MsgGUID: oEQQjn/CQkWvptMIL3hzcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="79449888"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="79449888"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 01:44:11 -0800
X-CSE-ConnectionGUID: uFtsWUrdRMuIiQnNBQgnMA==
X-CSE-MsgGUID: vLTf3jUmSFC6MdZ7w8IEWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="198880587"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.48])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 01:44:09 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 23 Dec 2025 11:44:05 +0200 (EET)
To: chen zhang <chenzhang@kylinos.cn>
cc: hdegoede@redhat.com, Hans de Goede <hansg@kernel.org>, frank@f-seidel.de, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    chenzhang_0901@163.com
Subject: Re: [PATCH] platform/x86: Switch to guard(mutex)
In-Reply-To: <20251215032924.50854-1-chenzhang@kylinos.cn>
Message-ID: <5e94a03f-193b-895f-0ba3-712240908db0@linux.intel.com>
References: <20251215032924.50854-1-chenzhang@kylinos.cn>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 15 Dec 2025, chen zhang wrote:

You're using too generic prefix from the shortlog (in the Subject).

> Instead of using the 'goto label; mutex_unlock()' pattern use
> 'guard(mutex)' which will release the mutex when it goes out of scope.
> 
> Signed-off-by: chen zhang <chenzhang@kylinos.cn>
> ---
>  drivers/platform/x86/hdaps.c | 37 +++++++++++++++---------------------
>  1 file changed, 15 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/platform/x86/hdaps.c b/drivers/platform/x86/hdaps.c
> index f11f726d2062..2a11bcaa52f2 100644
> --- a/drivers/platform/x86/hdaps.c
> +++ b/drivers/platform/x86/hdaps.c
> @@ -147,18 +147,16 @@ static int hdaps_readb_one(unsigned int port, u8 *val)
>  {
>  	int ret;
>  
> -	mutex_lock(&hdaps_mtx);
> +	guard(mutex)(&hdaps_mtx);
>  
>  	/* do a sync refresh -- we need to be sure that we read fresh data */
>  	ret = __device_refresh_sync();
>  	if (ret)
> -		goto out;
> +		return ret;
>  
>  	*val = inb(port);
>  	__device_complete();
>  
> -out:
> -	mutex_unlock(&hdaps_mtx);
>  	return ret;

return 0;

>  }
>  
> @@ -208,12 +206,12 @@ static int hdaps_device_init(void)
>  {
>  	int total, ret = -ENXIO;
>  
> -	mutex_lock(&hdaps_mtx);
> +	guard(mutex)(&hdaps_mtx);
>  
>  	outb(0x13, 0x1610);
>  	outb(0x01, 0x161f);
>  	if (__wait_latch(0x161f, 0x00))
> -		goto out;
> +		return ret;

This is not an acceptable conversion. You clearly no longer need ret 
variable to carry the information here but can just write:

		return -ENXIO;

Please do realize if you make this kind of conversion changes to old code 
which are on borderline whether they're more noise and burden (to 
maintainers and reviewers) than useful, you should know all these 
conventions so that no review cycles is wasted on trivial style issues 
like this.

I know some subsystems do push back on patches like this. I find them 
still somewhat useful but you should think the patch through before 
sending, which you clearly didn't here. Cleaning up/refactoring is not 
"easy" unless you do it the wrong way which is to offload thinking to the 
reviewers/maintainers.

>  	/*
>  	 * Most ThinkPads return 0x01.
> @@ -226,7 +224,7 @@ static int hdaps_device_init(void)
>  	if (__check_latch(0x1611, 0x03) &&
>  		     __check_latch(0x1611, 0x02) &&
>  		     __check_latch(0x1611, 0x01))
> -		goto out;
> +		return ret;
>  
>  	printk(KERN_DEBUG "hdaps: initial latch check good (0x%02x)\n",
>  	       __get_latch(0x1611));
> @@ -235,29 +233,29 @@ static int hdaps_device_init(void)
>  	outb(0x81, 0x1611);
>  	outb(0x01, 0x161f);
>  	if (__wait_latch(0x161f, 0x00))
> -		goto out;
> +		return ret;
>  	if (__wait_latch(0x1611, 0x00))
> -		goto out;
> +		return ret;
>  	if (__wait_latch(0x1612, 0x60))
> -		goto out;
> +		return ret;
>  	if (__wait_latch(0x1613, 0x00))
> -		goto out;
> +		return ret;
>  	outb(0x14, 0x1610);
>  	outb(0x01, 0x1611);
>  	outb(0x01, 0x161f);
>  	if (__wait_latch(0x161f, 0x00))
> -		goto out;
> +		return ret;
>  	outb(0x10, 0x1610);
>  	outb(0xc8, 0x1611);
>  	outb(0x00, 0x1612);
>  	outb(0x02, 0x1613);
>  	outb(0x01, 0x161f);
>  	if (__wait_latch(0x161f, 0x00))
> -		goto out;
> +		return ret;
>  	if (__device_refresh_sync())
> -		goto out;
> +		return ret;
>  	if (__wait_latch(0x1611, 0x00))
> -		goto out;
> +		return ret;
>  
>  	/* we have done our dance, now let's wait for the applause */
>  	for (total = INIT_TIMEOUT_MSECS; total > 0; total -= INIT_WAIT_MSECS) {
> @@ -273,8 +271,6 @@ static int hdaps_device_init(void)
>  		msleep(INIT_WAIT_MSECS);
>  	}
>  
> -out:
> -	mutex_unlock(&hdaps_mtx);
>  	return ret;
>  }
>  
> @@ -322,17 +318,14 @@ static void hdaps_mousedev_poll(struct input_dev *input_dev)
>  {
>  	int x, y;
>  
> -	mutex_lock(&hdaps_mtx);
> +	guard(mutex)(&hdaps_mtx);
>  
>  	if (__hdaps_read_pair(HDAPS_PORT_XPOS, HDAPS_PORT_YPOS, &x, &y))
> -		goto out;
> +		return;
>  
>  	input_report_abs(input_dev, ABS_X, x - rest_x);
>  	input_report_abs(input_dev, ABS_Y, y - rest_y);
>  	input_sync(input_dev);
> -
> -out:
> -	mutex_unlock(&hdaps_mtx);
>  }
>  
>  
> 

-- 
 i.

