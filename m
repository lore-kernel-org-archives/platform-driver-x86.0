From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] video: backlight: Remove backlight sysfs uevent
Date: Wed, 20 Nov 2013 18:40:59 -0500
Message-ID: <1384990859.20536.4.camel@x230>
References: <20131111235700.GA29987@july>
	 <002901cedf3c$a7e77a00$f7b66e00$%han@samsung.com>
	 <20131112005628.GA2914@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:50909 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755336Ab3KTXld (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 20 Nov 2013 18:41:33 -0500
In-Reply-To: <20131112005628.GA2914@khazad-dum.debian.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Jingoo Han <jg1.han@samsung.com>, 'Kyungmin Park' <kmpark@infradead.org>, 'Henrique de Moraes Holschuh' <ibm-acpi@hmh.eng.br>, linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, kay@vrfy.org, 'Richard Purdie' <rpurdie@rpsys.net>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Mon, 2013-11-11 at 22:56 -0200, Henrique de Moraes Holschuh wrote:
> On Tue, 12 Nov 2013, Jingoo Han wrote:
> > 'thinkpad_acpi.c' uses the 'BACKLIGHT_UPDATE_SYSFS'.
> > Henrique, can we remove it?
> 
> Can't you fix this by rate-limiting, or otherwise adding an attribute that
> backlight devices should set when they need to supress change events?

It looks like this is just to force synchronisation to sysfs when using
the /proc interface? In which case we should probably just kill
the /proc interface.

-- 
Matthew Garrett <matthew.garrett@nebula.com>
