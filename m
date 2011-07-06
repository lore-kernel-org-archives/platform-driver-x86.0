From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] Revert: "dell-laptop: Toggle the unsupported hardware
 killswitch"
Date: Thu, 7 Jul 2011 00:01:35 +0100
Message-ID: <20110706230135.GA31589@srcf.ucam.org>
References: <1309169943-3786-1-git-send-email-kengyu@canonical.com>
 <20110706155003.17090951.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:59436 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753344Ab1GFXBo (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 6 Jul 2011 19:01:44 -0400
Content-Disposition: inline
In-Reply-To: <20110706155003.17090951.akpm@linux-foundation.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Keng-Yu Lin <kengyu@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, gmane@colin.guthr.ie, Alessio Igor Bogani <abogani@texware.it>, stable@kernel.org

On Wed, Jul 06, 2011 at 03:50:03PM -0700, Andrew Morton wrote:
> On Mon, 27 Jun 2011 11:19:03 +0100
> Keng-Yu Lin <kengyu@canonical.com> wrote:
> 
> > This reverts commit a3d77411e8b2ad661958c1fbee65beb476ec6d70,
> > 
> > as it causes a mess in the wireless rfkill status on some models.
> > It is probably a bad idea to toggle the rfkill for all dell models
> > without the respect to the claim that it is hardware-controlled.
> > 
> 
> If we're reverting this from mainline then we should also revert it
> from 2.6.38.x and 2.6.39.x, no?

Yeah, this is stable material. I'll be dealing with the backlog 
tomorrow.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
