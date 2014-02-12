From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [PATCH] x86, acpi: LLVMLinux: Remove nested functions from
 Thinkpad ACPI
Date: Wed, 12 Feb 2014 22:01:16 +0000
Message-ID: <20140212220116.GR18016@ZenIV.linux.org.uk>
References: <1392238726-18787-1-git-send-email-dl9pf@gmx.de>
 <alpine.DEB.2.02.1402121351510.27082@chino.kir.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:45598 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751933AbaBLWBa (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 12 Feb 2014 17:01:30 -0500
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1402121351510.27082@chino.kir.corp.google.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: David Rientjes <rientjes@google.com>
Cc: dl9pf@gmx.de, Behan Webster <behanw@converseincode.com>, David Woodhouse <David.Woodhouse@intel.com>, Matthew Garrett <matthew.garrett@nebula.com>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Feb 12, 2014 at 01:54:43PM -0800, David Rientjes wrote:

> So this patch is only as a courtesy to clang and you're not complaining 
> about things like __builtin() functions, typeof, or a ? : b conditional 
> operators because clang happens to support them?

That patch removes a disgusting construct; who cares how they'd discovered
it?  Consider it courtesy to reviewers, clang or no clang...

Folks, it's C; no need to bring Pascal misfeatures in, even if gcc happens
to accept them.
