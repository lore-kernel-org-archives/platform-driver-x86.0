From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: Tree for Dec 16 (intel_scu & abp_timer)
Date: Fri, 16 Dec 2011 18:50:04 +0000
Message-ID: <20111216185004.6a59dab3@pyx>
References: <20111216170042.650147ec79e792dce950f6e3@canb.auug.org.au>
	<4EEB9F3E.7080609@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from lxorguk.ukuu.org.uk ([81.2.110.251]:37362 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932072Ab1LPSud (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 16 Dec 2011 13:50:33 -0500
In-Reply-To: <4EEB9F3E.7080609@xenotime.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Sreedhara <sreedhara.ds@intel.com>, Jacob Pan <jacob.jun.pan@intel.com>

On Fri, 16 Dec 2011 11:42:54 -0800
Randy Dunlap <rdunlap@xenotime.net> wrote:

> On 12/15/2011 10:00 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20111215:
> 
> 
> warning: (X86_MRST && X86_MDFLD) selects INTEL_SCU_IPC which has unmet direct dependencies (X86 && X86_PLATFORM_DEVICES && X86_MRST)

I sent Ingo a fix for part of this, and Matthew another one last week. I
have another fix I just need to check a few more build combinations to
follow and hopefully finish the shuffle of config names.

Alan
