From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH 5/5] thinkpad_acpi: Convert dbg_printk to tp_dbg and
 tp_vdbg
Date: Sat, 23 Jun 2012 21:40:51 -0300
Message-ID: <20120624004051.GC20885@khazad-dum.debian.net>
References: <cover.1339985626.git.joe@perches.com>
 <d8ab2f07efe50ddd9d3db8612c1cc333cb7e5813.1339985627.git.joe@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:59903 "EHLO
	out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756537Ab2FXAk6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 23 Jun 2012 20:40:58 -0400
Content-Disposition: inline
In-Reply-To: <d8ab2f07efe50ddd9d3db8612c1cc333cb7e5813.1339985627.git.joe@perches.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Matthew Garrett <mjg@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 17 Jun 2012, Joe Perches wrote:
> Use a more current logging style.
> 
> Add #define DEBUG and use pr_debug to enable dynamic debugging.
> Coalesce formats and align arguments.
> 
> Signed-off-by: Joe Perches <joe@perches.com>

Joe, are there any extra procedures required from the user to get the debug
messages with this patch applied?

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
