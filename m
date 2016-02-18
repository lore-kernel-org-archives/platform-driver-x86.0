From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH RESEND v3] asus-nb-wmi: add wapf=4 quirk for ASUS X75VD
Date: Wed, 17 Feb 2016 21:23:45 -0800
Message-ID: <20160218052345.GC18421@dvhart-mobl5.amr.corp.intel.com>
References: <ece82c01c879e7e1fed300a001b491ed@natalenko.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:47412 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932127AbcBRFXw (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 18 Feb 2016 00:23:52 -0500
Content-Disposition: inline
In-Reply-To: <ece82c01c879e7e1fed300a001b491ed@natalenko.name>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Oleksandr Natalenko <oleksandr@natalenko.name>
Cc: corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Feb 17, 2016 at 01:35:46PM +0200, Oleksandr Natalenko wrote:
> Wi-Fi on ASUS X75VD laptop does not work unless asus_nb_wmi module
> is loaded with wapf=4 option. Add quirk for this.
> 
> Signed-off-by: Oleksandr Natalenko <oleksandr@natalenko.name>

Queued to testing, thanks.

-- 
Darren Hart
Intel Open Source Technology Center
