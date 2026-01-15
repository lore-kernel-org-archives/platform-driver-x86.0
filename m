Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9DE329E46;
	Thu, 15 Jan 2026 08:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768465763; cv=none; b=Nn7G1hUuzcdH0qEemCW760mAlc4BX1xuNXOa0i10FgNp22UxY3XVbcJIVyZuMO3cS13uOA8pJfI5Xtn7NCmYylBfUU8qrX9EpsgYpiaNceXsPr8RjQn9PMobC+qbxwAQN39sQAsRS67T03WrKDYFxAuj/wQZYGgQBqStWgmd8EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768465763; c=relaxed/simple;
	bh=Ol/cE9aNvuG9XmkQehtZm2Fvdyz9jcWSI88dcqprOt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tj7SPD6IAtt2Yym2/QslozmdnavexhTFwL9l1P2TAk7C8ZIcJi6miY+dmuE7K3It9hrkAG1kgwuQzR8J3nRfQ2ntpYn9m2LiawrbfQ0lhJu2btknD8DNZqgL1rPFpqy41eMq6kkeVEd5GrgrYq75Oq1gtXvMFfJw/597zB6Ez5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EpgZPBOw; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EpgZPBOw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768465761; x=1800001761;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ol/cE9aNvuG9XmkQehtZm2Fvdyz9jcWSI88dcqprOt0=;
  b=EpgZPBOw4UApAixEzwrS8deTBD+c/tL4Um6Wuj/9SDhT1N4DaTU9NPiN
   7XCPMCLuH/6snvGtzktppd09UXIFNJtnlbu/D3rg2FpJUqlsV/K+rsKLl
   jgLBZdudPXYcjSEBueBXNUU7+AlxC10GhUqdyeWWTIyyjfrPbmchZ8Upv
   AxLZa8CFrGBrS+y42Mfwvc5i/B/ctOs77kRan9zWAWoDwDCDL18/xmngr
   tSrBJ1gdAZ3vASJ1QHe2/TnzMpdSaQHe30n5tDHjHnFiwUZ8+5y1eUGbj
   PEnFSH2HDBzu05+/3nQyDgXSn7OCniIvgNt55nvED7eOGGx1/VnLPiUCe
   Q==;
X-CSE-ConnectionGUID: ryLmuJmUQl200xMdaaOWzw==
X-CSE-MsgGUID: U0034n3TQzq/0Gqvl3AzRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="73402243"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="73402243"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 00:29:20 -0800
X-CSE-ConnectionGUID: y0J6NPZBQ+yv3ABpdzIgIA==
X-CSE-MsgGUID: r7LXLZ93QEy6BTOagW6k+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="205183049"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.216])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 00:29:17 -0800
Date: Thu, 15 Jan 2026 10:29:14 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ciju Rajan K <crajank@nvidia.com>
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, tglx@linutronix.de,
	christophe.jaillet@wanadoo.fr, vadimp@nvidia.com,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH platform-next v4 1/2] kernel/irq: Add generic interrupt
 storm detection mechanism
Message-ID: <aWilWsTaAZeH8x1x@smile.fi.intel.com>
References: <20260115074909.245852-1-crajank@nvidia.com>
 <20260115074909.245852-2-crajank@nvidia.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115074909.245852-2-crajank@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jan 15, 2026 at 09:49:08AM +0200, Ciju Rajan K wrote:
> If the hardware is broken, it is possible that faulty device will
> flood interrupt handler with false events. For example, if fan or
> power supply has damaged presence pin, it will cause permanent

I would say "has a floating presence pin" as the term floating is
well established and describes the case exactly how you put it further
in the text.

> generation of plugged in / plugged out events. As a result, interrupt
> handler will consume a lot of CPU resources and will keep raising
> "UDEV" events to the user space.
> 
> This patch provides a mechanism for detecting interrupt storm.
> Use the following criteria: if the specific interrupt was generated
> 'N' times during 'T' seconds, such device is to be considered as
> broken and user will be notified through a call back function.
> This feature can be used by any kernel subsystems or drivers.
> 
> The implementation includes:
> 
> - irq_storm_cb_t: Callback function type for storm notifications
> - struct irq_storm: Per-IRQ storm detection data structure
> - irq_register_storm_detection(): Register storm detection with
> 				  configurable parameters
> - irq_unregister_storm_detection(): Unregister storm detection
> - Integration with note_interrupt() for automatic storm checking
> 
> Callback API parameters:
> - irq: interrupt number to monitor
> - max_freq: maximum allowed frequency (interrupts per second)
> - dev_id: device identifier passed to callback

...

> --- a/include/linux/interrupt.h
> +++ b/include/linux/interrupt.h
> @@ -20,6 +20,7 @@
>  #include <asm/ptrace.h>
>  #include <asm/irq.h>
>  #include <asm/sections.h>
> +#include <linux/jiffies.h>

I would not mix linux/* group with asm/* group and to me the best location for
this inclusion is just before kref.h. Note, this header needs a bit more of
a cleanup, as it includes basically everything (due to kernel.h and maybe other
messed up headers). But this is out of scope of your series.

...

>  extern int irq_can_set_affinity(unsigned int irq);
>  extern int irq_select_affinity(unsigned int irq);

> +extern bool irq_register_storm_detection(unsigned int irq, unsigned int max_freq,
> +					 irq_storm_cb_t cb, void *dev_id);
> +extern void irq_unregister_storm_detection(unsigned int irq);

Do we still need "extern" keyword?

>  extern int __irq_apply_affinity_hint(unsigned int irq, const struct cpumask *m,
>  				     bool setaffinity);

...

> +struct irq_storm {
> +	unsigned long		max_cnt;
> +	unsigned long		last_cnt;
> +	unsigned long		next_period;
> +	irq_storm_cb_t		cb;
> +	void			*dev_id;
> +};

I'm wondering if you have tried to shuffle this layout based on the frequency
of a use of each member. In some cases it might generate less code (can be
measured with bloat-o-meter).

...

> static struct irqaction *__free_irq(struct irq_desc *desc, void *dev_id)

>  		irq_release_resources(desc);
>  		chip_bus_sync_unlock(desc);
>  		irq_remove_timings(desc);

> +		if (desc->irq_storm) {

Unneeded (duplicate) check.

> +			kfree(desc->irq_storm);

> +			desc->irq_storm = NULL;

Do we need this? If so, still can be done unconditionally.

> +		}
>  	}

> +/* Minimum frequency threshold */
> +#define IRQ_STORM_MIN_FREQ_HZ		50
> +#define IRQ_STORM_MAX_FREQ_SCALE	(IRQ_STORM_MIN_FREQ_HZ * 2)

Plain numbers are easier to read, hence 100

> +/* Time window over which storm check is performed */
> +#define IRQ_STORM_PERIOD_WINDOW_MS	(IRQ_STORM_MIN_FREQ_HZ * 20)

MS = HZ?! It's from some other universe with different physics laws.

...

> + * Returns: true on success, false on failure

Are the rest use "Returns" (with "s")? Because the main keyword is "Return".
(Yes, "Returns" works, but it's a secondary one, not even documented IIRC.)

...

> +bool irq_register_storm_detection(unsigned int irq, unsigned int max_freq,
> +				  irq_storm_cb_t cb, void *dev_id)
> +{
> +	struct irq_storm *storm;
> +	bool ret = false;
> +
> +	if (max_freq < IRQ_STORM_MIN_FREQ_HZ || !cb)
> +		return false;
> +
> +	storm = kzalloc(sizeof(*storm), GFP_KERNEL);
> +	if (!storm)
> +		return false;
> +
> +	/* Adjust to count per 10ms */
> +	storm->max_cnt = max_freq / (IRQ_STORM_MAX_FREQ_SCALE);
> +	storm->cb = cb;
> +	storm->dev_id = dev_id;
> +
> +	scoped_irqdesc_get_and_buslock(irq, IRQ_GET_DESC_CHECK_GLOBAL) {
> +		if (scoped_irqdesc->action && !scoped_irqdesc->irq_storm) {
> +			storm->last_cnt = scoped_irqdesc->tot_count;
> +			storm->next_period = jiffies + msecs_to_jiffies(IRQ_STORM_PERIOD_WINDOW_MS);
> +			scoped_irqdesc->irq_storm = storm;
> +			ret = true;
> +		}
> +	}

> +	if (!ret)
> +		kfree(storm);
> +
> +	return ret;

Better to avoid negative conditionals in such contexts.

	if (ret)
		return ret;

	kfree(...);

But it's boolean and assigned inside scoped section. Why we can't return true
directly from scoped section?

> +}

...

> +void irq_unregister_storm_detection(unsigned int irq)
> +{
> +	scoped_irqdesc_get_and_buslock(irq, IRQ_GET_DESC_CHECK_GLOBAL) {

> +		if (scoped_irqdesc->irq_storm) {

Dup check, drop it.

> +			kfree(scoped_irqdesc->irq_storm);
> +			scoped_irqdesc->irq_storm = NULL;
> +		}
> +	}
> +}

...

> +static void irq_storm_check(struct irq_desc *desc)
> +{
> +	struct irq_storm *storm = desc->irq_storm;
> +	unsigned long delta, now = jiffies;
> +
> +	if (!time_after_eq(now, storm->next_period))
> +		return;

> +	storm->next_period = now + msecs_to_jiffies(IRQ_STORM_PERIOD_WINDOW_MS);

Just do

#define IRQ_STORM_PERIOD_WINDOW		msecs_to_jiffies(1000)

It will address my above comment and make this be read better.

> +	delta = desc->tot_count - storm->last_cnt;
> +	storm->last_cnt = desc->tot_count;
> +	if (delta > storm->max_cnt) {
> +		/* Calculate actual frequency: interrupts per second */
> +		storm->cb(irq_desc_get_irq(desc),
> +			(delta * (IRQ_STORM_MAX_FREQ_SCALE)),
> +			storm->dev_id);
> +	}
> +}


-- 
With Best Regards,
Andy Shevchenko


