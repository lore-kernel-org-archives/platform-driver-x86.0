From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v1] platform/x86: hp-wireless: reuse module_acpi_driver
Date: Wed, 19 Apr 2017 13:15:26 -0700
Message-ID: <20170419201526.GC17351@fury>
References: <20170419192731.17850-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:52337 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1765238AbdDSUP2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 Apr 2017 16:15:28 -0400
Content-Disposition: inline
In-Reply-To: <20170419192731.17850-1-andriy.shevchenko@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Alex Hung <alex.hung@canonical.com>

On Wed, Apr 19, 2017 at 10:27:31PM +0300, Andy Shevchenko wrote:
> There is a macro to register and unregister modules in simple cases,
> Let's use it and clean up the driver.
> 
> Cc: Alex Hung <alex.hung@canonical.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks Andy,

Reviewed-by: Darren Hart (VMware) <dvhart@infradead.org>

-- 
Darren Hart
VMware Open Source Technology Center
