From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v3] platform/x86: peaq-wmi: Add new peaq-wmi driver
Date: Fri, 12 May 2017 10:47:51 -0700
Message-ID: <20170512174751.GB17235@fury>
References: <20170512151154.8903-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:53544 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758088AbdELRrx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 12 May 2017 13:47:53 -0400
Content-Disposition: inline
In-Reply-To: <20170512151154.8903-1-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, May 12, 2017 at 05:11:54PM +0200, Hans de Goede wrote:
> PEAQ is a new European OEM, I've bought one of their 2-in-1 x86
> devices, which is actually quite a nice device. Under Windows it has
> Dolby software for "better" sound and you can select different equalizer
> presets using a special button.
> 
> This WMI interface for this button is not really nice, as it does not do
> notifies (it really does not I tripple checked), but since I had already
> figured out the entire WMI interface for this I decided to go the full
> mile anyways and also implent a WMI based input driver for this using
> input_polldev since, well, we need to poll.
> 
> This commit adds support for this button making it report KEY_SOUND input
> events. KEY_SOUND is already used in various places to switch sound into
> theatre mode and things like that so it seems appropriate here.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Queued to testing, thanks.
-- 
Darren Hart
VMware Open Source Technology Center
