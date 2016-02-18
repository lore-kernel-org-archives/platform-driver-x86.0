From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH][RESEND] asus-nb-wmi: add wapf=4 quirk for ASUS X75VD
Date: Wed, 17 Feb 2016 21:25:27 -0800
Message-ID: <20160218052527.GD18421@dvhart-mobl5.amr.corp.intel.com>
References: <4f2df9dab959ad572e08eb7f7fa03220@natalenko.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:48360 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932127AbcBRFZa (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 18 Feb 2016 00:25:30 -0500
Content-Disposition: inline
In-Reply-To: <4f2df9dab959ad572e08eb7f7fa03220@natalenko.name>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Oleksandr Natalenko <oleksandr@natalenko.name>
Cc: corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Feb 17, 2016 at 09:45:05AM +0200, Oleksandr Natalenko wrote:
> Wi-Fi on ASUS X75VD laptop does not work unless asus_nb_wmi module
> is loaded with wapf=4 option. Add quirk for this.

Point of terminology. It is not a RESEND if you made changes, even whitespace,
it's v2, v3, etc. RESEND means it's identical to the previous one, but it's been
a long time (2 weeks) and nobody responded with a review.

-- 
Darren Hart
Intel Open Source Technology Center
