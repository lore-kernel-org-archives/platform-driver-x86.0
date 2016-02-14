From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: Backlight control does not work on an Apple dual-GPU
 (intel/nvidia) system using nouveau
Date: Sun, 14 Feb 2016 05:38:27 +0000
Message-ID: <20160214053827.GA25439@srcf.ucam.org>
References: <56BF996F.3030503@guruburu.com>
 <20160213233912.GA16687@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:36164 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751082AbcBNF6H (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 14 Feb 2016 00:58:07 -0500
Content-Disposition: inline
In-Reply-To: <20160213233912.GA16687@wunner.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: Gaele Strootman <gaele@guruburu.com>, Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>, Bjorn Helgaas <bhelgaas@google.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Bruno Bierbaumer <bruno@bierbaumer.net>, Michael Marineau <mike@marineau.org>

On Sun, Feb 14, 2016 at 12:39:12AM +0100, Lukas Wunner wrote:
> @Bjorn Helgaas: Do you think this masquerade patch would be eligible
> for inclusion in the kernel or is this not in your department?
> https://www.marc.info/?l=grub-deavel&m=141586614924917&w=2

I think this is an entirely appropriate piece of code to add to the EFI 
boot code in the kernel.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
