From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH 2/2] ideapad-laptop: Handle the App-controlled RF event
Date: Thu, 7 Jul 2011 16:11:18 +0100
Message-ID: <20110707151118.GB15366@srcf.ucam.org>
References: <1309268154-6872-1-git-send-email-kengyu@canonical.com>
 <1309268154-6872-2-git-send-email-kengyu@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:48147 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751565Ab1GGPLf (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 7 Jul 2011 11:11:35 -0400
Content-Disposition: inline
In-Reply-To: <1309268154-6872-2-git-send-email-kengyu@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Keng-Yu Lin <kengyu@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, ike.pan@canonical.com, vanhoof@canonical.com, kent.lin@canonical.com, sylee@canonical.com

On Tue, Jun 28, 2011 at 02:35:54PM +0100, Keng-Yu Lin wrote:

> On Linux, there is no such application. This patch implements
> a toggle for all RF devices through accessing the EC I/O ports.

Sure there is. Either the kernel can handle it via rfkill-input, or 
rfkilld can look after it. Please don't add your own implementation.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
