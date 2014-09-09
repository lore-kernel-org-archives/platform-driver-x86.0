From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] eeepc-laptop: remove possible use of uninitialized value
Date: Mon, 8 Sep 2014 17:06:28 -0700
Message-ID: <20140909000628.GC5835@vmdeb7>
References: <1409784805-14190-1-git-send-email-fransklaver@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:49129 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754383AbaIIAGe (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 8 Sep 2014 20:06:34 -0400
Content-Disposition: inline
In-Reply-To: <1409784805-14190-1-git-send-email-fransklaver@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Frans Klaver <fransklaver@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Matthew Garrett <matthew.garrett@nebula.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Sep 04, 2014 at 12:53:25AM +0200, Frans Klaver wrote:
> In store_sys_acpi, if count equals zero, or parse_arg()s sscanf call
> fails, 'value' remains possibly uninitialized. In that case 'value'
> shouldn't be used to produce the store_sys_acpi()s return value.
> 
> Only test the return value of set_acpi() if we can actually call it.
> Return rv otherwise.
> 
> Signed-off-by: Frans Klaver <fransklaver@gmail.com>


FYI, based on recent discussion with Paul, Greg, and Frans, I am not picking
this up, but waiting for a next rev from Frans, possibly including Paul's
original patch.

-- 
Darren Hart
Intel Open Source Technology Center
