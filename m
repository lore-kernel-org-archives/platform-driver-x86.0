From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] dell-laptop: Add back rfkill code
Date: Mon, 2 Dec 2013 14:57:07 +0000
Message-ID: <20131202145707.GA9914@srcf.ucam.org>
References: <20131202121104.GA5687@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:39368 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752098Ab3LBO5M (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 2 Dec 2013 09:57:12 -0500
Content-Disposition: inline
In-Reply-To: <20131202121104.GA5687@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Stanislaw Gruszka <sgruszka@redhat.com>
Cc: platform-driver-x86@vger.kernel.org

On Mon, Dec 02, 2013 at 01:11:05PM +0100, Stanislaw Gruszka wrote:
> This is basically a revert of:
> 
> commit a6c2390cd6d2083d27a2359658e08f2d3df375ac
> Author: Matthew Garrett <mjg@redhat.com>
> Date:   Fri Jun 1 12:46:56 2012 -0400
> 
>     dell-laptop: Remove rfkill code
> 
> Except that patch add whilelist of Dell systems where dell-laptop
> specific RFKILL code is needed. For now, patch only add "Dell Latitude
> 6430U" laptop to whitelist, in the future other systems probably
> will be added.

It's already added back to 3.13, along with a whitelist entry for all 
latitudes. I'm not going to add whitelisting for specific modules, and 
I'm not enthusiastic about pushing to stable.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
