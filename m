From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 1/2] platform/x86: peaq-wmi: select INPUT_POLLDEV
Date: Thu, 20 Jul 2017 17:02:42 -0700
Message-ID: <20170721000242.GD16076@fury>
References: <20170720160114.3261176-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:53494 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964851AbdGUACq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 20 Jul 2017 20:02:46 -0400
Content-Disposition: inline
In-Reply-To: <20170720160114.3261176-1-arnd@arndb.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andy Shevchenko <andy@infradead.org>, Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jul 20, 2017 at 06:00:50PM +0200, Arnd Bergmann wrote:
> The new driver fails to build without INPUT_POLLDEV
> 
> drivers/platform/x86/peaq-wmi.o: In function `peaq_wmi_exit':
> peaq-wmi.c:(.exit.text+0x1c): undefined reference to `input_unregister_polled_device'
> drivers/platform/x86/peaq-wmi.o: In function `peaq_wmi_init':
> peaq-wmi.c:(.init.text+0x23): undefined reference to `input_allocate_polled_device'
> peaq-wmi.c:(.init.text+0x18e): undefined reference to `input_register_polled_device'
> 
> For some reason, all other drivers that need this use 'select'
> here rather than 'depends on', so I'm doing the same.
> 
> Fixes: 13bb0fd5519d ("platform/x86: peaq-wmi: Add new peaq-wmi driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Queued to fixes branch for 4.13-rcX. I'll leave patch 2/2 to andy since you
worked that one together already.

-- 
Darren Hart
VMware Open Source Technology Center
