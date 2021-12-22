Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C26C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 22 Dec 2021 12:47:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240938AbhLVMrx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 22 Dec 2021 07:47:53 -0500
Received: from mga11.intel.com ([192.55.52.93]:40766 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234840AbhLVMrx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Dec 2021 07:47:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640177273; x=1671713273;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q/E2ZsH8GPDqc9+aL0qU6E1ph8FO4GCAfJroLWXNJ+8=;
  b=AypSPzU4sKU5Aew0YejckSCkCtinr2QWejqLdnk8I+2U5/AbKmLfGF+v
   ZDWMjDfNcmNPkmFIz91s3epwjA7IYOEDdE50mjW5e4UnBAHuqeLvcR1Ot
   VzsBxVnY3ibCIvIbcqQxKLhxi5gP0Hv0Wo0FkS3MV/Kxek5wA8sX4gws+
   +UeXXcN96831oFql+cBxSWV+oclTzrYsumvr29XvIvFgEBv56uzqc08UX
   pmnhJi7P3ZrhwhB9NnEsG+nYT2Ph6LAJqb56c1zeM2nwulSof1rcXuOJc
   vAg9O4bGujITejMnhKbh8UC4qQ6a8Q3fufPGqZGo+uPU2cqZhcL/q2ahT
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="238146049"
X-IronPort-AV: E=Sophos;i="5.88,226,1635231600"; 
   d="scan'208";a="238146049"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2021 04:47:53 -0800
X-IronPort-AV: E=Sophos;i="5.88,226,1635231600"; 
   d="scan'208";a="685010596"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2021 04:47:50 -0800
Received: by lahna (sSMTP sendmail emulation); Wed, 22 Dec 2021 14:45:33 +0200
Date:   Wed, 22 Dec 2021 14:45:33 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] platform/x86: Add x86-acpi-irq-helpers.h
Message-ID: <YcMd7dn+RCVrKOlj@lahna>
References: <20211221151243.66216-1-hdegoede@redhat.com>
 <CAHp75VcCMeuSHkQT=azcEZeFxqU9_Na2yiXESEBvNqniyhtDvg@mail.gmail.com>
 <32e68787-66ec-1522-0fea-e11130a428b8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32e68787-66ec-1522-0fea-e11130a428b8@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On Tue, Dec 21, 2021 at 07:58:26PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 12/21/21 16:27, Andy Shevchenko wrote:
> > On Tue, Dec 21, 2021 at 5:13 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> Add helper code to get Linux IRQ numbers given a description of the IRQ
> >> source (either IOAPIC index, or GPIO chip name + pin-number).
> >>
> >> This is intended to be used to lookup Linux IRQ numbers in cases where the
> >> ACPI description for a device somehow lacks this info. This is only meant
> >> for use on x86 ACPI platforms.
> >>
> >> This code is big/complex enough to warrant sharing, but too small to live
> >> in its own module, therefor x86_acpi_irq_helper_get() is defined as
> >> a static inline helper function.
> > 
> > ...
> > 
> >> +/* For gpio_get_desc which is EXPORT_SYMBOL_GPL() */
> > 
> > gpio_get_desc()
> 
> Fixed in my local version.
> 
> > and honestly I don't like this kind of includes (yes,
> > I know sometimes it's the best compromise).
> > 
> >> +#include "../../gpio/gpiolib.h"
> > 
> > ...
> > 
> >> +               /* Like acpi_dev_gpio_irq_get(), but without parsing ACPI resources */
> >> +               chip = gpiochip_find(data->gpio_chip, x86_acpi_irq_helper_gpiochip_find);
> >> +               if (!chip)
> >> +                       return -EPROBE_DEFER;
> >> +
> >> +               gpiod = gpiochip_get_desc(chip, data->index);
> >> +               if (IS_ERR(gpiod)) {
> >> +                       ret = PTR_ERR(gpiod);
> >> +                       pr_err("error %d getting GPIO %s %d\n", ret,
> >> +                              data->gpio_chip, data->index);
> >> +                       return ret;
> >> +               }
> >> +
> >> +               irq = gpiod_to_irq(gpiod);
> >> +               if (irq < 0) {
> >> +                       pr_err("error %d getting IRQ %s %d\n", irq,
> >> +                              data->gpio_chip, data->index);
> >> +                       return irq;
> >> +               }
> >> +
> >> +               irq_type = acpi_dev_get_irq_type(data->trigger, data->polarity);
> >> +               if (irq_type != IRQ_TYPE_NONE && irq_type != irq_get_trigger_type(irq))
> >> +                       irq_set_irq_type(irq, irq_type);
> >> +
> >> +               return irq;
> > 
> > I'm wondering why it can't be a part of the GPIO ACPI library?
> 
> Interesting suggestion, but this really is only intended for the
> special case when the DSDT is missing this info. I'm a bit worried
> that having this available as a generic helper may lead to it
> getting used too much. But I guess we can just put a comment on it
> explaining that normally its use should be avoided.
> 
> I've added Mika to the Cc, Mika, what do you think about adding this
> as a new helper to the GPIO ACPI library ?

Preferably no :-) Reason is that even if we add comment to the function
you don't remember it after two weeks so the next patch adding another
user will not be noticed by reviewers (unless tha name of the function
clearly says it is a quirk/workaround).
