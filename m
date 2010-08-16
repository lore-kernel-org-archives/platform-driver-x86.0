From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] Support MSI Poulsbo netbook U110/U115
Date: Mon, 16 Aug 2010 16:56:27 +0100
Message-ID: <20100816155627.GA2989@srcf.ucam.org>
References: <4C659796020000230001EA4E@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:47269 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754634Ab0HPP4g (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 16 Aug 2010 11:56:36 -0400
Content-Disposition: inline
In-Reply-To: <4C659796020000230001EA4E@novprvlin0050.provo.novell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joey Lee <jlee@novell.com>
Cc: gregkh@suse.de, trenn@suse.de, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Dennis.Jansen@web.de

On Fri, Aug 13, 2010 at 03:05:58AM -0600, Joey Lee wrote:
> Hi Matthew, 
> 
> Dennis help me to ported this patch to 2.6.35, and it works as expected.
> Could you please give me any suggestions for this patch?

I've thought about this a bit more and now lean towards thinking that 
putting the PCI IDs in the ACPI video driver is the best way to go. The 
alternative is to only fix it for MSI, which isn't the best option. On 
the other hand, I looked at adding support to the Poulsbo driver and it 
actually seems pretty easy, so to be honest I'd prefer it if that got 
done instead.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
