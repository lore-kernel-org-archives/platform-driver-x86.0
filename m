From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [ibm-acpi-devel] [RFC PATCH] thinkpad-acpi: Improve hardware
 volume controls
Date: Tue, 10 May 2011 07:27:34 -0300
Message-ID: <20110510102734.GB12027@khazad-dum.debian.net>
References: <bf402af225e7005f052a8ccf92962efa48cbe703.1304979290.git.luto@mit.edu>
 <20110509235332.GA27107@khazad-dum.debian.net>
 <BANLkTim-gCEZQCCm7HGQp=MmKM4krpmLGg@mail.gmail.com>
 <20110510010423.GB27107@khazad-dum.debian.net>
 <BANLkTi=123OuDKOx=pt=zm3EnVNFV0+FuQ@mail.gmail.com>
 <BANLkTinPrPT6YFYtVSyQEj0Nk7E614BYTw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out2.smtp.messagingengine.com ([66.111.4.26]:40458 "EHLO
	out2.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932327Ab1EJK1g (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 10 May 2011 06:27:36 -0400
Content-Disposition: inline
In-Reply-To: <BANLkTinPrPT6YFYtVSyQEj0Nk7E614BYTw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andrew Lutomirski <luto@mit.edu>
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Mon, 09 May 2011, Andrew Lutomirski wrote:
> I read some more of the spec.  It looks like the EC sends query 43
> when the mute status changes.
> 
> The problem is that _Q43 just calls _UCMS, which issues an SMI but
> does nothing else.  So we don't get notified.  And unless we change
> acpi_ec_sync_query to allow more than one handler for the same query,
> we can't even get notified without breaking _Q43.  So we're screwed.

We can

1) attach to _Q43 directly (must be whitelist-based using a quirk list),

OR

2) ask Lenovo for _Q43 to call the HKEY notifier chain, which should
still be possible for the 2011 boxes, and with some luck, the 2010 boxes
as well.

I will only do (2) after we went through some testing with your patch.

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
