From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 0/4] thinkpad_acpi: Add support for controlling charge
 thresholds
Date: Mon, 20 Jan 2014 22:22:03 +0100
Message-ID: <20140120212203.GA28847@amd.pavel.ucw.cz>
References: <1384178195-12218-1-git-send-email-jak@jak-linux.org>
 <20131228211026.GA14725@jak-x230>
 <20131228221003.GA24911@khazad-dum.debian.net>
 <20131230132619.GA24241@jak-x230>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:48802 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751127AbaATVWH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 20 Jan 2014 16:22:07 -0500
Content-Disposition: inline
In-Reply-To: <20131230132619.GA24241@jak-x230>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Julian Andres Klode <jak@jak-linux.org>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Matthew Garrett <matthew.garrett@nebula.com>, "open list:THINKPAD ACPI EXT..." <ibm-acpi-devel@lists.sourceforge.net>, "open list:THINKPAD ACPI EXT..." <platform-driver-x86@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

Hi!

> Another problem is that I don't know any other systems supporting charge
> thresholds, and I don't want to dictate interfaces built for ThinkPads
> as a generic way. 

On systems like Sharp Zaurus, Nokia N900, charging is controlled by
Linux. As charge thresholds should extend Li-ION battery life under
anticipated light usage, they are probably good idea on all systems
that can support them.
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
