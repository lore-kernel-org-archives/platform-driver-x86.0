From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [ibm-acpi-devel] [RFC PATCH] thinkpad-acpi: Improve hardware
 volume controls
Date: Tue, 10 May 2011 07:25:13 -0300
Message-ID: <20110510102513.GA12027@khazad-dum.debian.net>
References: <bf402af225e7005f052a8ccf92962efa48cbe703.1304979290.git.luto@mit.edu>
 <20110509235332.GA27107@khazad-dum.debian.net>
 <BANLkTim-gCEZQCCm7HGQp=MmKM4krpmLGg@mail.gmail.com>
 <20110510010423.GB27107@khazad-dum.debian.net>
 <BANLkTi=123OuDKOx=pt=zm3EnVNFV0+FuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out2.smtp.messagingengine.com ([66.111.4.26]:33160 "EHLO
	out2.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751445Ab1EJKZQ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 10 May 2011 06:25:16 -0400
Content-Disposition: inline
In-Reply-To: <BANLkTi=123OuDKOx=pt=zm3EnVNFV0+FuQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andrew Lutomirski <luto@mit.edu>
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Mon, 09 May 2011, Andrew Lutomirski wrote:
> > Don't we get an HKEY notification for mute presses in the X220?
> 
> I just meant to figure out what's going on.  We're not getting an HKEY
> event, I think, but something's happening and a bit of acpi debug
> fiddling says that _Q43 is getting called.  I have no idea what that
> means, though.

It means you get the proper GPE (_Q43), now you just need to check what that
method does in the DSDT or the SSDTs.

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
