From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] Sony laptop: Some Sony Vaia laptops do not enable wwan
 power by default.
Date: Tue, 12 Jul 2011 17:01:56 +0100
Message-ID: <20110712160156.GA8388@srcf.ucam.org>
References: <4E1C6E7A.3030705@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:44012 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753654Ab1GLQCD (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 12 Jul 2011 12:02:03 -0400
Content-Disposition: inline
In-Reply-To: <4E1C6E7A.3030705@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Tim Gardner <tim.gardner@canonical.com>
Cc: Mattia Dongili <malattia@linux.it>, platform-driver-x86@vger.kernel.org

On Tue, Jul 12, 2011 at 09:55:38AM -0600, Tim Gardner wrote:
> Ubuntu has been carrying this patch for a couple of years because I
> keep forgetting to upstream it. Does anyone think it still makes
> sense, or should setting WWAN power be done in user space ?

Userspace, but also somebody needs to figure out how to identify whether 
old-style Vaios support each of these features and expose them as proper 
rfkill devices.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
