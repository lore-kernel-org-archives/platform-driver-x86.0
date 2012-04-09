From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH] TPACPI: Make W510 microphone LED working
Date: Mon, 9 Apr 2012 20:54:51 +0200
Message-ID: <201204092054.51555.marek.vasut@gmail.com>
References: <1333854430-12997-1-git-send-email-marek.vasut@gmail.com> <20120409141506.GA4835@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f42.google.com ([74.125.82.42]:56325 "EHLO
	mail-wg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754151Ab2DISyz (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 9 Apr 2012 14:54:55 -0400
Received: by wgbds11 with SMTP id ds11so2430063wgb.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Apr 2012 11:54:54 -0700 (PDT)
In-Reply-To: <20120409141506.GA4835@khazad-dum.debian.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: ibm-acpi-devel@lists.sourceforge.net, ibm-acpi@hmh.eng.br, platform-driver-x86@vger.kernel.org

Dear Henrique de Moraes Holschuh,

> On Sun, 08 Apr 2012, Marek Vasut wrote:
> > Signed-off-by: Marek Vasut <marek.vasut@gmail.com>
> 
> NAK (but noted that the W510 supports the MIC led).

Well, at least some value was in this patch.

> Please look at the recent thread about the same issue on the T410/T420 on
> the list archives.  I am still waiting for some direction from that thread.
> 
> > -#define TPACPI_SAFE_LEDS	0x1081U
> > +#define TPACPI_SAFE_LEDS	0x5081U
> 
> This, I really don't want.

Ok, honestly, I'm pretty new to acpi hacking, this is my first try. I'll check 
the thread and hopefully get back to this.

Best regards,
Marek Vasut
