From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: silead_dmi: Add touchscreen info for
 GP-electronic T701
Date: Mon, 8 May 2017 08:40:26 -0700
Message-ID: <20170508154026.GB17700@fury>
References: <20170507123515.12671-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:48816 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750815AbdEHPk3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 8 May 2017 11:40:29 -0400
Content-Disposition: inline
In-Reply-To: <20170507123515.12671-1-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: platform-driver-x86@vger.kernel.org

On Sun, May 07, 2017 at 02:35:15PM +0200, Hans de Goede wrote:
> Add touchscreen info for the GP-electronic T701 tablet.
> 

Ugh, this is exactly the kind of thing ACPI _DSD was intended to solve. Not a
lot we can do about the vendors not including the info in the DSDT of course,
but...  ugh.

I'm curious, are the vendors involved in driving these patches? If so, have you
asked them if they are aware of _DSD and if they would consider using it so they
can avoid having to patch the driver for every instance of a product using this
touchscreen?

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Queued to testing, thanks Hans.

-- 
Darren Hart
VMware Open Source Technology Center
