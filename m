From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: silead_dmi: Add touchscreen info for
 I.T.Works TW891 2-in-1
Date: Thu, 6 Jul 2017 15:39:15 -0700
Message-ID: <20170706223915.GA19728@fury>
References: <20170701101522.13646-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:41286 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751619AbdGFWjS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 6 Jul 2017 18:39:18 -0400
Content-Disposition: inline
In-Reply-To: <20170701101522.13646-1-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Jul 01, 2017 at 12:15:22PM +0200, Hans de Goede wrote:
> Add touchscreen info for I.T.Works TW891 2-in-1.
> 

...

> +		/* I.T.Works TW891 */
> +		.driver_data = (void *)&itworks_tw891_data,
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "To be filled by O.E.M."),

*groan* you're trolling me now right? ;-)

> +			DMI_MATCH(DMI_PRODUCT_NAME, "TW891"),

I presume there are no other identifying strings?

Pushed to testing.

-- 
Darren Hart
VMware Open Source Technology Center
