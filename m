Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458150;
	b=YKJtGHJAt9c2eqg4ASo/AZ2KOzQ00/HtQB5egLh1/NnGw+YcwaLscFTRZ2GBEf5W2qrm
	 r9QZcgF3srCzG1CifIXs2pSwQALSmJCcdx4eUaSNa710e7K2Tz3VTirEeK8YOIT/anhNk
	 avV8nOIz/DAh04NiNHPBPnqu7HtwV4SWcZHl+MzrVNQgDfxOk//8CJYank8XNhYpz13HS
	 Ee2j1c/XCIJ27KS+4OFHrQAnLgNrIa/+BOgNOi5mJsAi+Fa1nAO6GoWKlE/uNOimTtO4S
	 dC4M1Dq+SAFJ9UGrgnVz8Y/QDgRlOCcwwTY5MOK1fRi5vFOpSFYHK6FAKsRS3Gd//WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458150;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=cmah0und4yHRnrmHzWo8TInQYmsqAPsbLOx9ZFfRDa8=;
	b=CtKZdWVWdbyezHqd0HdZI8DB2Xvy9TSKcHeDJAs0s38T+ZTGC+KQ7HJUfnEkn0Xn5DaY
	 mD5g0tQt94v6CozQPbezeLBGH/Q0DH3g+VZuQJNyHxM5/eHTSGNMl8s8zL5XF7y61xpM4
	 cBdF7uE4Da/G+WB1BRGxZhUdUdTgxfiMuX2dGnvTaJNfaBUSGoFWSUL7oQugBv1tWjbqw
	 HSWRmb8PRwfjpGkz0vWQj7/ohbCzpk3QAbsSKN1kZzBXjSiMSMbop4PukBWX9xJlDNBvU
	 cyDiEQNf0Jf4B8a3LTzVU1a6D0cM4A9Y+ih6zcDKL8ldfkcXY8+sstNrmJ4OKmpeVQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lNlothq8;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771E4606A336
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 18:22:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 771E4606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lNlothq8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795458151; x=1826994151;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=3G+UtlGEtSWb7TWO5A0oxUAmgTrZkXpIDKDWVZ6jPH4=;
  b=lNlothq8MsulTYzhUdWlI9rDd7Dhk0gc/4rug8vHpBAPLioCpCYhljce
   00MYMXRF7uBjAd22NlgwMKhbclJ54DOQbEkOmWF9IlrVV1DvZ4Tr9cjJm
   6mmXpKoxzESAjMhSYOnd/RyWlrNkUixE0CAKi/+KPRcnOisb6xHOE5MK8
   nuuWsHt3wOAGIuvxlQKvlxn4+FnIT3yMnuz0N3J7i46fHJiLlVbzcDzo8
   LCYDc4Z+44UH1F6JNTw6kdcrUnPk6VJW2c+uoFLA+fDp7QNqI1+kTWxQe
   8hOpF7HFTEINbhe344U2BXQYiWrzBEJ1pFmZ35+p2Hlbjop20BMWf38PG
   g==;
X-CSE-ConnectionGUID: wHCLHm8ISjKOS7Iteuh8Fg==
X-CSE-MsgGUID: SB6kCSZrTyi00O4iIfdKCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4383429"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4383429"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 10:22:26 -0800
X-CSE-ConnectionGUID: L4dYVHM9RjyxfeqVvnObVw==
X-CSE-MsgGUID: NdNwpyjjQreENBr8oi2PxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11700667"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.225])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 10:22:23 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 23 Nov 2026 20:22:20 +0200 (EET)
To: Mark Pearson <mpearson-lenovo@squebb.ca>
cc: Luo Qiu <luoqiu@kylinsec.com.cn>, Ike Panhc <ikepanhc@gmail.com>, 
    "Derek J . Clark" <derekjohn.clark@gmail.com>, Rong Zhang <i@rong.moe>, 
    Hans de Goede <hansg@kernel.org>, 
    "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Fix DYTC profile
 use-after-free
In-Reply-To: <a634e184-67f7-4aa0-b50e-c09a1f03a144@app.fastmail.com>
Message-ID: <4130b5c2-34e8-8a3f-562a-a39f64a314b7@linux.intel.com>
References: <E3DE35B39E153ADC+20261122133456.48054-1-luoqiu@kylinsec.com.cn> <a634e184-67f7-4aa0-b50e-c09a1f03a144@app.fastmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 23 Nov 2026, Mark Pearson wrote:

> On Sun, Nov 22, 2026, at 8:34 AM, Luo Qiu wrote:
> > ideapad_dytc_profile_exit() is called from both ideapad_acpi_remove()
> > and the probe failure path. It destroys priv->dytc->mutex and frees
> > priv->dytc, but the platform profile device is registered with
> > devm_platform_profile_register().
> >
> > Devres cleanup runs after the driver remove callback, so the profile
> > device remains registered after its drvdata has been freed. A concurrent
> > read of its profile sysfs attribute then calls into the driver with the
> > stale pointer:
> >
> >   BUG: KASAN: slab-use-after-free in dytc_profile_get+0xb1/0xe0 [ideapad_laptop]
> >
> >   Call Trace:
> >     dytc_profile_get+0xb1/0xe0 [ideapad_laptop]
> >     profile_show+0xe4/0x1d0
> >     dev_attr_show+0x4a/0x90
> >     sysfs_kf_seq_show+0x29e/0x4a0
> >
> >   Allocated by task 411:
> >     ideapad_acpi_add+0xd1f/0x2420 [ideapad_laptop]
> >
> >   Freed by task 7150:
> >     kfree+0x1c7/0x500
> >     ideapad_acpi_remove+0x148/0x3d0 [ideapad_laptop]
> >     device_release_driver_internal+0x35c/0x560
> >     unbind_store+0xde/0x100
> >
> > Subsequent reads through the stale drvdata also observe corrupted
> > values. They trigger WARN_ON(val >= PLATFORM_PROFILE_LAST) in
> > get_class_profile() and fail with -EINVAL.
> >
> > Register the platform profile explicitly and remove it in
> > ideapad_dytc_profile_exit() before destroying the mutex and freeing
> > dytc. This keeps the profile device and its drvdata alive for the same
> > interval on both removal and probe failure.
> >
> > Fixes: 0d882fae334b ("platform/x86: ideapad-laptop: Use 
> > devm_platform_profile_register()")
> > Signed-off-by: Luo Qiu <luoqiu@kylinsec.com.cn>
> > ---
> >  drivers/platform/x86/lenovo/ideapad-laptop.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c 
> > b/drivers/platform/x86/lenovo/ideapad-laptop.c
> > index 91a8d11c79c5..2cbd0b87defc 100644
> > --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> > +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
> > @@ -1185,9 +1185,9 @@ static int ideapad_dytc_profile_init(struct 
> > ideapad_private *priv)
> >  	priv->dytc->priv = priv;
> > 
> >  	/* Create platform_profile structure and register */
> > -	priv->dytc->ppdev = 
> > devm_platform_profile_register(&priv->platform_device->dev,
> > -							   "ideapad-laptop", priv->dytc,
> > -							   &dytc_profile_ops);
> > +	priv->dytc->ppdev = 
> > platform_profile_register(&priv->platform_device->dev,
> > +						      "ideapad-laptop", priv->dytc,
> > +						      &dytc_profile_ops);
> >  	if (IS_ERR(priv->dytc->ppdev)) {
> >  		err = PTR_ERR(priv->dytc->ppdev);
> >  		goto pp_reg_failed;
> > @@ -1211,6 +1211,7 @@ static void ideapad_dytc_profile_exit(struct 
> > ideapad_private *priv)
> >  	if (!priv->dytc)
> >  		return;
> > 
> > +	platform_profile_remove(priv->dytc->ppdev);
> >  	mutex_destroy(&priv->dytc->mutex);
> >  	kfree(priv->dytc);
> > 
> Seems a shame, but agreed on the issue and that the commit needing reversing. Any other fix seems messier.

One could consider using devm_*() for everything with 
devm_add_action_or_reset() for those that do not have devm_*() from core.
 
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Mark
> 

-- 
 i.

