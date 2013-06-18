From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH 3/3] thinkpad_acpi: add LED quirks of models which don't
 have EC controllable LEDs
Date: Mon, 17 Jun 2013 21:20:22 -0300
Message-ID: <20130618002022.GE27654@khazad-dum.debian.net>
References: <1370593209-21358-1-git-send-email-adam.lee@canonical.com>
 <1370593209-21358-4-git-send-email-adam.lee@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:48095 "EHLO
	out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751337Ab3FRAU0 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 17 Jun 2013 20:20:26 -0400
Content-Disposition: inline
In-Reply-To: <1370593209-21358-4-git-send-email-adam.lee@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Adam Lee <adam.lee@canonical.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Matthew Garrett <matthew.garrett@nebula.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Alex Hung <alex.hung@canonical.com>, Bjorn Mork <bjorn@mork.no>

On Fri, 07 Jun 2013, Adam Lee wrote:
> Some new Lenovo or ThinkPad laptops don't have EC controllable LEDs.
> This patch adds their quirks.
> 
> Signed-off-by: Adam Lee <adam.lee@canonical.com>

NAK.

Let's see if we can do this in a better way that is a bit more future-proof.

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
