From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: dell-*wmi*: Relay failed initial probe to
 dependent drivers
Date: Thu, 2 Nov 2017 17:56:32 -0700
Message-ID: <20171103005632.GB7971@fury>
References: <bdaec2635c4c38e869a5690db2426d7440222949.1509564191.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:43702 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932398AbdKCA4e (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Nov 2017 20:56:34 -0400
Content-Disposition: inline
In-Reply-To: <bdaec2635c4c38e869a5690db2426d7440222949.1509564191.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, pali.rohar@gmail.com

On Wed, Nov 01, 2017 at 02:28:21PM -0500, Mario Limonciello wrote:
> dell-wmi and dell-smbios-wmi are dependent upon dell-wmi-descriptor
> finishing probe successfully to probe themselves.
> 
> Currently if dell-wmi-descriptor fails probing in a non-recoverable way
> (such as invalid header) dell-wmi and dell-smbios-wmi will continue to
> try to redo probing due to deferred probing.
> 
> To solve this have the dependent drivers query the dell-wmi-descriptor
> driver whether the descriptor has been determined valid. The possible
> results are:
> -EPROBE_DEFER: Descriptor not yet probed, dependent driver should wait
>  and use deferred probing
> < 0: Descriptor probed, invalid.  Dependent driver should return an
>  error.
> 0: Successful descriptor probe, dependent driver can continue
> 
> Successful descriptor probe still doesn't mean that the descriptor driver
> is necessarily bound at the time of initialization of dependent driver.
> Userspace can unbind the driver, so all methods used from driver
> should still be verified to return success values otherwise deferred
> probing be used.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>

> diff --git a/drivers/platform/x86/dell-wmi-descriptor.c b/drivers/platform/x86/dell-wmi-descriptor.c
> index 3204c408e261..33c6c7d66f8c 100644
> --- a/drivers/platform/x86/dell-wmi-descriptor.c
> +++ b/drivers/platform/x86/dell-wmi-descriptor.c
> @@ -26,9 +26,16 @@ struct descriptor_priv {
>  	u32 interface_version;
>  	u32 size;
>  };
> +static int descriptor_valid;

This initializes to 0, which I believe creates an odd race window between when
this init is called and when the first driver calls
dell_wmi_get_descriptor_valid(). Seems like initializing to -EPROBE_DEFER here
in the declaration would be a better right approach.

-- 
Darren Hart
VMware Open Source Technology Center
