From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH 1/3] thinkpad_acpi: return -NODEV while operating
 uninitialized LEDs
Date: Mon, 17 Jun 2013 21:18:43 -0300
Message-ID: <20130618001843.GC27654@khazad-dum.debian.net>
References: <1370593209-21358-1-git-send-email-adam.lee@canonical.com>
 <1370593209-21358-2-git-send-email-adam.lee@canonical.com>
 <20130618001234.GA27654@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:48542 "EHLO
	out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751337Ab3FRASq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 17 Jun 2013 20:18:46 -0400
Content-Disposition: inline
In-Reply-To: <20130618001234.GA27654@khazad-dum.debian.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Adam Lee <adam.lee@canonical.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Matthew Garrett <matthew.garrett@nebula.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Alex Hung <alex.hung@canonical.com>, Bjorn Mork <bjorn@mork.no>

On Mon, 17 Jun 2013, Henrique de Moraes Holschuh wrote:
> On Fri, 07 Jun 2013, Adam Lee wrote:
> > Not all 0-15 LEDs are available for all models, sometimes it's even not
> > safe. This patch return -NODEV while operating uninitialized LEDs.
> > 
> > Signed-off-by: Adam Lee <adam.lee@canonical.com>
> Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

Matthew, please pick v3 of this patch, and not this one.

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
