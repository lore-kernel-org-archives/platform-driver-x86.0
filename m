Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828618;
	b=dODo9evauVWaidzDQjJ7ow79+eFoP+btQ2sGxCaKCm/qQUFZq7vxyMjPFsS/Babcm+CR
	 02HsgXCIqY6bgmCay9H+VI14lqXALXPpe8ILIrlSxG2RwuzTDiZ3+M5xPFZVqGdb4Z+UU
	 WQl91uV5M5XAazezUHRqxXcds6wvshg4KoU/mVOE+sn+A313FE4GMBXVmiyyNxmZE4WSv
	 E8p8mD3wPFm5e+9MDZ3EM4nH5o6TRk7HsOEUgaysEiO2ES2YVmtFCfWakNj+OnWcC00pY
	 hcYggPZDj3rKvUzCYkzVI5+IzBbXLZRyiBub5yFvs+HdOkW8xK5lYjOnA4gJvsWhNfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828618;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=rBI0xKCFSwQwaGtUO8dGutiqQgQZ6MHPL54xhDwdbMQ=;
	b=BuymJGoeQAhfFP7oT6yeCajenSp8Xc2KKoJQ3fKeuzZXdQqZIFjXM7qBsRQB9hP+xb1o
	 WQN7ZrdqSJjcA20kixrNCH/D9SHr7zRgEmMB9gVCJ3tbur/0drtbq1EGBsbDnvCPc0h2C
	 JFPu3ENKh5kQRN+wqN7zsfzYIAq8Nysr31nZgbQqEJXGnyyIeSHm0pSHiMePKFaxyU3el
	 x5bscEu9k3a3y4+li10tbuKCGpvmLyiD+I32uzPm6VqCvi4A3Yb6U+6FT2r+9MBGIQ9OI
	 a7c6mqsZQLuSTEDdTCXlJ5Q4UaIvSzpWexqbVDM8MRbX5fxpVaE8cojthrzpzr+5oSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a9lboo9f;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFF8606A333;
	Mon, 16 Nov 2026 11:30:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AFF8606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a9lboo9f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794828618; x=1826364618;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=9XOSwT5JW2ijSJUIYeVtIP4yMnEK9GMSIOyn+dx9S4I=;
  b=a9lboo9fAYYPrOdO+8savLEIgFCrjPtSEpD7HePToSSO5ctxgaWr/kfg
   kD6451pkwjtP/LedmWLfvqkwF27Z+rXX4DoRGi95PJ/Mwo/06IP7l1/+T
   Z6CTrZh3ke25qivCtutpQEliN2+huoZrAU49/BkVmjFEHKrajZGB2QeOp
   LH4e/jhUb0aLNZzR87BZ6M0a7IcOhcQaXG/piLBa1j6acFU4qTaQqtNhL
   kwiYI53LxRTgBwKuJgKt23bMr15mtsuOqiLNH3CZB5YlT57mYHwm03W5j
   RWpr+XLsXRGdRQf0JrbAx2mezQYO+spfYdCJH1TVXZe5l0MZOCQ1RUu+o
   Q==;
X-CSE-ConnectionGUID: M5goKHFkQvG4Rs9uiU16Ng==
X-CSE-MsgGUID: 2gyOZVpYS2ORTc9d9xESKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3549603"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3549603"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 03:30:17 -0800
X-CSE-ConnectionGUID: lLLbJStWQBSlUSn99xC9zA==
X-CSE-MsgGUID: sVTXLZzlR4++YckX4vGqpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9711855"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.151])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 03:30:14 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 16 Nov 2026 13:30:10 +0200 (EET)
To: hyunjungg <hj351016@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Derek J. Clark" <derekjohn.clark@gmail.com>, Rong Zhang <i@rong.moe>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] platform/x86: lenovo-yoga-tab2-pro-1380-fastcharger:
 cancel work on teardown
In-Reply-To: <20261106074316.2204392-1-hj351016@gmail.com>
Message-ID: <6857ee54-81b3-4c8e-106f-d5c871f44375@linux.intel.com>
References: <20261106043621.1903211-1-hj351016@gmail.com> <20261106074316.2204392-1-hj351016@gmail.com>
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

On Fri, 6 Nov 2026, hyunjungg wrote:

> From: Hyunjung Ko <hj351016@gmail.com>
> 
> fc->work is scheduled from the extcon notifier callback
> yt2_1380_fc_extcon_evt() (and once from probe), but it is never cancelled.
> The containing struct yt2_1380_fc and the extcon notifier are both
> device-managed on the serdev device, and the serdev driver has no
> ->remove callback, so teardown happens entirely via devres unwinding
> when yt2_1380_fc_pdev_remove() calls serdev_device_remove().
> 
> devm_extcon_register_notifier_all() unregistering on teardown only stops
> future notifications; it does not drain a work item that the notifier has
> already queued. A fast-charger extcon event that races device unbind can
> therefore queue fc->work just before teardown; the work then runs after
> devres has torn the device down. yt2_1380_fc_worker() dereferences not
> only fc itself but also fc->pinctrl (pinctrl_select_state()) and the
> serdev (serdev_device_write_buf()), so it must be drained before those
> device-managed resources are released, not merely before fc is freed.
> 
> Cancel the work via devm_add_action_or_reset(), registered after the
> serdev is opened and pinctrl is acquired but before
> devm_extcon_register_notifier_all(). Because devres runs cleanup in
> reverse order, teardown then unregisters the notifier first (so it can no
> longer queue the work), next cancels the work while fc->pinctrl and the
> serdev are still valid, and only then closes the serdev, releases pinctrl
> and frees fc. This closes both the re-arm window and the use-after-free
> of fc and of its sub-resources in the worker.
> 
> Found by static analysis / code review; compile-tested only, not
> reproduced on hardware (requires the Lenovo Yoga Tablet 2 1380 charger).
> 
> Fixes: b2ed33e8d486 ("platform/x86: Add lenovo-yoga-tab2-pro-1380-fastcharger driver")
> Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
> ---
> v2:
>  - Move the devm_add_action_or_reset(cancel_work) registration from right
>    after INIT_WORK to after devm_serdev_device_open()/devm_pinctrl_get()
>    and before devm_extcon_register_notifier_all(). The v1 placement
>    registered the cancel action first, so devres (LIFO) drained the work
>    last - after the serdev was closed and pinctrl released - leaving the
>    worker's fc->pinctrl / serdev dereferences racing freed resources.
>    The new placement drains the work while those resources are still live.
> 
>  drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c b/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
> --- a/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
> +++ b/drivers/platform/x86/lenovo/yoga-tab2-pro-1380-fastcharger.c
> @@ -148,6 +148,11 @@
>  	.write_wakeup = serdev_device_write_wakeup,
>  };
> 
> +static void yt2_1380_fc_cancel_work(void *data)
> +{
> +	cancel_work_sync(data);
> +}
> +
>  static int yt2_1380_fc_serdev_probe(struct serdev_device *serdev)
>  {
>  	struct device *dev = &serdev->dev;
> @@ -209,6 +214,18 @@
>  	serdev_device_set_baudrate(serdev, 600);
>  	serdev_device_set_flow_control(serdev, false);
> 
> +	/*
> +	 * Register work cancellation after the serdev is opened and pinctrl
> +	 * is acquired, but before the extcon notifier.  devres unwinds in
> +	 * reverse, so teardown unregisters the notifier first (no new work
> +	 * can be queued), then cancels the work while fc->pinctrl and the
> +	 * serdev are still valid, and only then closes the serdev and
> +	 * releases pinctrl.
> +	 */
> +	ret = devm_add_action_or_reset(dev, yt2_1380_fc_cancel_work, &fc->work);
> +	if (ret)
> +		return ret;

Why not devm_work_autocancel() ?

> +
>  	ret = devm_extcon_register_notifier_all(dev, fc->extcon, &fc->nb);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "registering extcon notifier\n");
> 

-- 
 i.

