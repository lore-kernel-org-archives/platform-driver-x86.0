From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [ibm-acpi-devel] thinkpad-acpi: fn-f4 issues
Date: Tue, 25 Jan 2011 21:16:51 -0200
Message-ID: <20110125231651.GB25953@khazad-dum.debian.net>
References: <Pine.LNX.4.64.1101251740380.3737@boston.corp.fedex.com>
 <20110125151346.GB14803@khazad-dum.debian.net>
 <4D3F3AFF.7020407@kabelfunk.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out1.smtp.messagingengine.com ([66.111.4.25]:48358 "EHLO
	out1.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753676Ab1AYXQy (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 25 Jan 2011 18:16:54 -0500
Content-Disposition: inline
In-Reply-To: <4D3F3AFF.7020407@kabelfunk.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dominik Kopp <my@kabelfunk.de>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jeff Chua <jeff.chua.linux@gmail.com>, ibm-acpi-devel@lists.sourceforge.net

On Tue, 25 Jan 2011, Dominik Kopp wrote:
> I have also a X100e and the Fn-F4 (suspend-to-memory) and Fn-F12
> (suspend-to-disk) are not working. (no effect at all)

> [   15.362664] thinkpad_acpi: asked for hotkey mask 0x040988fc, but
> firmware forced it to 0x000988fc

The driver IS asking for Fn+F4 events.  Please send me the output of
acpidump, gzipped.

In the meanwhile, check if the input device is producing events when
you're pressing Fn+f4.  It could well be sending KEY_SUSPEND, but if
there's nobody listening...

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
