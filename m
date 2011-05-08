From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH] thinkpad_acpi: Add ACPI HID for ThinkPad X220
Date: Sun, 8 May 2011 12:04:38 -0300
Message-ID: <20110508150438.GA30536@khazad-dum.debian.net>
References: <5b395b26bb6325a484fc1f6ea935a66822fa232a.1304811242.git.luto@mit.edu>
 <BANLkTikVQvuHMbKKdE+cqwog7MHB2p2xPA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out2.smtp.messagingengine.com ([66.111.4.26]:53979 "EHLO
	out2.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753194Ab1EHPEn (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 8 May 2011 11:04:43 -0400
Content-Disposition: inline
In-Reply-To: <BANLkTikVQvuHMbKKdE+cqwog7MHB2p2xPA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andrew Lutomirski <luto@mit.edu>
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Sun, 08 May 2011, Andrew Lutomirski wrote:
> With this patch, everything except thermal seems to work.  Thermal
> isn't detected.

It would be detected, if it worked.  The driver got only zeros back when it
tried to read the temperature, so it correctly assumed that measurement
system simply isn't supported on your model (it isn't, AFAIK).

I am OK with this patch (or the older patch which I had already acked) being
added to linux-next.

Andrew, fell free to add my acked-by, and cc the patch to both stable and
the subsystem maintainer for merging.  My setup is kind of a mess right now,
so I've not been forwarding the patches myself.  Should be fixed soon.

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
