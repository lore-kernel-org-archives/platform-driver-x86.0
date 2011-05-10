From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [ibm-acpi-devel] [RFC PATCH] thinkpad-acpi: Improve hardware
 volume controls
Date: Mon, 9 May 2011 22:04:23 -0300
Message-ID: <20110510010423.GB27107@khazad-dum.debian.net>
References: <bf402af225e7005f052a8ccf92962efa48cbe703.1304979290.git.luto@mit.edu>
 <20110509235332.GA27107@khazad-dum.debian.net>
 <BANLkTim-gCEZQCCm7HGQp=MmKM4krpmLGg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out2.smtp.messagingengine.com ([66.111.4.26]:54436 "EHLO
	out2.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752410Ab1EJBEk (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 9 May 2011 21:04:40 -0400
Content-Disposition: inline
In-Reply-To: <BANLkTim-gCEZQCCm7HGQp=MmKM4krpmLGg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andrew Lutomirski <luto@mit.edu>
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Mon, 09 May 2011, Andrew Lutomirski wrote:
> FWIW, this patch (other than having the wrong default on X220) makes
> Linux better than Windows :)

Please expand on that, especially the "wrong default on X220"...

> Do you know how to read a field from the EC by name?  I think I can

If it is in the DSDT as a field of a "EmbeddedController" area, you just
evaluate it.  There are several examples in the driver (e.g. the TMP* evals
in the thermal monitor subdriver).

> Also, do you know how to ask the kernel what the most recent acpi
> interrupt was?  I'd like to find a better way to detect the mute
> button than watching for the keyboard event.

No, and I'd never ACK it if there was one.  ACPI serves GPEs (interrupts)
like crazy for random reasons,  Never ever play racy games like that.

Don't we get an HKEY notification for mute presses in the X220?

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
