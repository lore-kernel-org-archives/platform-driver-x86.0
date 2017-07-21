From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: wmi: Fix error handling in acpi_wmi_init()
Date: Fri, 21 Jul 2017 16:43:01 -0700
Message-ID: <20170721234301.GD7888@fury>
References: <1500673686-32577-1-git-send-email-khoroshilov@ispras.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:52173 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753502AbdGUXnE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 21 Jul 2017 19:43:04 -0400
Content-Disposition: inline
In-Reply-To: <1500673686-32577-1-git-send-email-khoroshilov@ispras.ru>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alexey Khoroshilov <khoroshilov@ispras.ru>
Cc: Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org

On Sat, Jul 22, 2017 at 12:48:06AM +0300, Alexey Khoroshilov wrote:
> The order of resource deallocations is messed up in acpi_wmi_init().
> It should be vice versa.
> 
> Found by Linux Driver Verification project (linuxtesting.org).
> 
> Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>

Eeek. Thank you. Applied to fixes for 4.13.X.

-- 
Darren Hart
VMware Open Source Technology Center
