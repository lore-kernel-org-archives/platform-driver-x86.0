From: Chris Wilson <chris@aptivate.org>
Subject: Re: [PATCH 2/4] soekris-net6501: Add a board driver to create
 leds-net6501 device.
Date: Fri, 12 Oct 2012 17:45:11 +0100 (BST)
Message-ID: <alpine.DEB.2.02.1210121719140.30572@lap-x201>
References: <1344860636-23328-1-git-send-email-chris+github@qwirx.com> <alpine.DEB.2.02.1208291432040.12396@lap-x201>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from one-mail.aptivate.org ([87.106.150.205]:45965 "EHLO
	one-mail.aptivate.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753896Ab2JLRmI (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 12 Oct 2012 13:42:08 -0400
In-Reply-To: <alpine.DEB.2.02.1208291432040.12396@lap-x201>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Chris Wilson <chris@qwirx.com>
Cc: Chris Wilson <chris+github@qwirx.com>, platform-driver-x86@vger.kernel.org, bryan.wu@canonical.com, chris+github@aptivate.org

Dear sirs,

I still haven't heard anything about this patch. I don't even know if it 
reached the mailing lists?

I would like to see it merged, so if there is a reason why you don't want 
to include it as is, please could you let me know, so I can produce a 
better version?

I have discovered that the MPTABLE exists on the net6501 and uniquely 
identifies the device, so we could use it to refuse to load the platform 
driver on anything other than a net6501:

[    0.000000] MPTABLE: OEM ID: Soekris
[    0.000000] MPTABLE: Product ID: net6501

I don't know how to go further and integrate this with a plug and play 
framework, since the device does not have ACPI in the BIOS (yet), nor any 
identifiable PCI IDs as far as I know. Do you have any advice on this?

Cheers, Chris.
-- 
Aptivate | http://www.aptivate.org | Phone: +44 1223 967 838
Future Business, Cam City FC, Milton Rd, Cambridge, CB4 1UY, UK

Aptivate is a not-for-profit company registered in England and Wales
with company number 04980791.
