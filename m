From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH] TPACPI: Make W510 microphone LED working
Date: Mon, 9 Apr 2012 11:15:06 -0300
Message-ID: <20120409141506.GA4835@khazad-dum.debian.net>
References: <1333854430-12997-1-git-send-email-marek.vasut@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:49075 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755570Ab2DIOPO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 9 Apr 2012 10:15:14 -0400
Received: from compute2.internal (compute2.nyi.mail.srv.osa [10.202.2.42])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 535F621715
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Apr 2012 10:15:14 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <1333854430-12997-1-git-send-email-marek.vasut@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: ibm-acpi-devel@lists.sourceforge.net, ibm-acpi@hmh.eng.br, platform-driver-x86@vger.kernel.org

On Sun, 08 Apr 2012, Marek Vasut wrote:
> Signed-off-by: Marek Vasut <marek.vasut@gmail.com>

NAK (but noted that the W510 supports the MIC led).

Please look at the recent thread about the same issue on the T410/T420 on
the list archives.  I am still waiting for some direction from that thread.

> -#define TPACPI_SAFE_LEDS	0x1081U
> +#define TPACPI_SAFE_LEDS	0x5081U

This, I really don't want.

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
