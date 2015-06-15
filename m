From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 1/2] ideapad: fix software rfkill setting
Date: Mon, 15 Jun 2015 13:29:03 -0700
Message-ID: <20150615202903.GC83198@vmdeb7>
References: <5498848.9yV42J8a1L@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:58777 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755876AbbFOU3E (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 15 Jun 2015 16:29:04 -0400
Content-Disposition: inline
In-Reply-To: <5498848.9yV42J8a1L@wuerfel>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Ike Panhc <ike.pan@canonical.com>, Darren Hart <dvhart@linux.intel.com>, Matthew Garrett <mjg59@srcf.ucam.org>

On Sat, Jun 13, 2015 at 03:23:33PM +0200, Arnd Bergmann wrote:
> This fixes a several year old regression that I found while trying
> to get the Yoga 3 11 to work. The ideapad_rfk_set function is meant
> to send a command to the embedded controller through ACPI, but
> as of c1f73658ed, it sends the index of the rfkill device instead
> of the command, and ignores the opcode field.
> 
> This changes it back to the original behavior, which indeed
> flips the rfkill state as seen in the debugfs interface.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: c1f73658ed ("ideapad: pass ideapad_priv as argument (part 2)")
> Cc: stable@vger.kernel.org # v2.6.38+

Queued for 4.2. Thanks!

-- 
Darren Hart
Intel Open Source Technology Center
