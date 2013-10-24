From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH] thinkpad_acpi: Fix build error when CONFIG_SND_MAX_CARDS
 > 32
Date: Thu, 24 Oct 2013 14:33:02 -0200
Message-ID: <20131024163302.GA3851@khazad-dum.debian.net>
References: <1382623592-31690-1-git-send-email-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:35433 "EHLO
	out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755507Ab3JXQdH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 24 Oct 2013 12:33:07 -0400
Content-Disposition: inline
In-Reply-To: <1382623592-31690-1-git-send-email-tiwai@suse.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Matthew Garrett <matthew.garrett@nebula.com>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 24 Oct 2013, Takashi Iwai wrote:
> SNDRV_CARDS can be specified via Kconfig since 3.11 kernel, so this
> can be over 32bit integer range, which leads to a build error.
> 
> Cc: <stable@vger.kernel.org> [v3.11+]
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
