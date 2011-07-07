From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH 1/2] ideapad-laptop: Ignore an unused VPC notification
Date: Thu, 7 Jul 2011 16:10:24 +0100
Message-ID: <20110707151023.GA15366@srcf.ucam.org>
References: <1309268154-6872-1-git-send-email-kengyu@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:48131 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751565Ab1GGPKa (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 7 Jul 2011 11:10:30 -0400
Content-Disposition: inline
In-Reply-To: <1309268154-6872-1-git-send-email-kengyu@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Keng-Yu Lin <kengyu@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, ike.pan@canonical.com, vanhoof@canonical.com, kent.lin@canonical.com, sylee@canonical.com

On Tue, Jun 28, 2011 at 02:35:53PM +0100, Keng-Yu Lin wrote:
> BIOS fires notifications in a constant period with VPC bit 1 set when the
> power cord is unplugged.

How frequently? That's going to do bad things to power management. It'd 
be nice to find a way to just make it stop doing that.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
