From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: Patch for drivers/platform/x86/compal-laptop.c
Date: Mon, 20 Dec 2010 22:51:45 +0000
Message-ID: <20101220225145.GA2488@srcf.ucam.org>
References: <201012182009.57670.aacid@kde.org> <20101220161132.GC25502@srcf.ucam.org> <201012202249.36307.aacid@kde.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:42418 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758079Ab0LTWvx (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 20 Dec 2010 17:51:53 -0500
Content-Disposition: inline
In-Reply-To: <201012202249.36307.aacid@kde.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Albert Astals Cid <aacid@kde.org>
Cc: Cezary Jackiewicz <cezary.jackiewicz@gmail.com>, platform-driver-x86@vger.kernel.org

On Mon, Dec 20, 2010 at 10:49:35PM +0000, Albert Astals Cid wrote:
> A Dilluns, 20 de desembre de 2010, Matthew Garrett va escriure:
> > Patch looks fine, but could you submit it following the instructions in
> > Documentation/SubmittingPatches? I'll need a signed-off-by: line at
> > least.
> 
> To be fair i don't know which subsystem this belongs to.

It's the x86 platform drivers. There's not really a terribly good way to 
express that in a subject line :) 

> I guess my summary phrase would be:
> Support KHLB2 in the compal laptop driver
> 
> The explanation would be:
> Add the KHLB2 model identifier to the list of supported models
> 
> Signed-off-by: Albert Astals Cid <aacid@kde.org>

That ought to be ok. In future it's easier if you include the patch as 
part of the mail - git send-email is really the most straightforward way 
to generate correct patches.

Thanks,
-- 
Matthew Garrett | mjg59@srcf.ucam.org
