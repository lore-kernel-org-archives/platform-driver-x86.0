From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 2/2] platform/x86: dell-*wmi*: Relay failed initial
 probe to dependent drivers
Date: Thu, 9 Nov 2017 15:44:25 -0800
Message-ID: <20171109234425.GF21449@fury>
References: <cover.1510246939.git.mario.limonciello@dell.com>
 <2080bee9a4c98164498aa32c4f10b12bc50b183d.1510246939.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:60804 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754942AbdKIXo1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Nov 2017 18:44:27 -0500
Content-Disposition: inline
In-Reply-To: <2080bee9a4c98164498aa32c4f10b12bc50b183d.1510246939.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, pali.rohar@gmail.com

On Thu, Nov 09, 2017 at 11:49:10AM -0600, Mario Limonciello wrote:
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
> -ENODEV: Descriptor GUID missing from WMI bus
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


This is a good improvement. Will give Pali a chance to offer his signature, and
will merge then.
-- 
Darren Hart
VMware Open Source Technology Center
