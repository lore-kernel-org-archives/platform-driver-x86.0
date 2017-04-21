From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: INT33FE: add i2c dependency
Date: Fri, 21 Apr 2017 14:41:28 -0700
Message-ID: <20170421214128.GA31650@fury>
References: <20170420125159.23846-1-tobias.regnery@gmail.com>
 <62aa9baa-6630-2f09-96a7-3328af823db6@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:48733 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1424738AbdDUVla (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 21 Apr 2017 17:41:30 -0400
Content-Disposition: inline
In-Reply-To: <62aa9baa-6630-2f09-96a7-3328af823db6@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Tobias Regnery <tobias.regnery@gmail.com>, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Apr 21, 2017 at 09:19:10AM +0200, Hans de Goede wrote:
> Hi,
> 
> On 20-04-17 14:51, Tobias Regnery wrote:
> > With CONFIG_I2C=m and CONFIG_INTEL_CHT_INT33FE=y we see the following link
> > errors:
> > 
> > drivers/built-in.o: In function 'cht_int33fe_remove':
> > intel_cht_int33fe.c:(.text+0x391f6e): undefined reference to 'i2c_unregister_device'
> > intel_cht_int33fe.c:(.text+0x391f76): undefined reference to 'i2c_unregister_device'
> > intel_cht_int33fe.c:(.text+0x391f7d): undefined reference to 'i2c_unregister_device'
> > drivers/built-in.o: In function 'cht_int33fe_probe':
> > intel_cht_int33fe.c:(.text+0x392147): undefined reference to 'i2c_acpi_new_device'
> > intel_cht_int33fe.c:(.text+0x392185): undefined reference to 'i2c_acpi_new_device'
> > intel_cht_int33fe.c:(.text+0x3921bd): undefined reference to 'i2c_acpi_new_device'
> > intel_cht_int33fe.c:(.text+0x3921d9): undefined reference to 'i2c_unregister_device'
> > intel_cht_int33fe.c:(.text+0x3921e8): undefined reference to 'i2c_unregister_device'
> > drivers/built-in.o: In function 'cht_int33fe_driver_init':
> > intel_cht_int33fe.c:(.init.text+0x2386d): undefined reference to 'i2c_register_driver'
> > drivers/built-in.o: In function 'cht_int33fe_driver_exit':
> > intel_cht_int33fe.c:(.exit.text+0x206e): undefined reference to 'i2c_del_driver'
> > 
> > Fix this by adding a kconfig dependency on the I2C subsystem.
> > 
> > Fixes: 1cd706df8a9c ("platform/x86: Add Intel Cherry Trail ACPI INT33FE device driver")
> > Signed-off-by: Tobias Regnery <tobias.regnery@gmail.com>
> 
> Thank you for catching this:
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Thanks, queued to testing.

-- 
Darren Hart
VMware Open Source Technology Center
