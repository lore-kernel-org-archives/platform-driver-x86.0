From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: Dell Vostro V131: special hotkey not working
Date: Wed, 25 Apr 2012 15:22:05 +0100
Message-ID: <20120425142205.GA14322@srcf.ucam.org>
References: <4F97FA4C.9040201@gmx-topmail.de>
 <20120425135328.GA13385@srcf.ucam.org>
 <4F980807.6000705@gmx-topmail.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:53194 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753059Ab2DYOWH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 25 Apr 2012 10:22:07 -0400
Content-Disposition: inline
In-Reply-To: <4F980807.6000705@gmx-topmail.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Peter Meiser <meiser@gmx-topmail.de>
Cc: platform-driver-x86@vger.kernel.org, Rezwanul_Kabir@dell.com

On Wed, Apr 25, 2012 at 04:19:51PM +0200, Peter Meiser wrote:
> Hello Matthew,
> 
> Am 25.04.2012 15:53, schrieb Matthew Garrett:
> > watch -n 0.1 cat /proc/interrupts
> 
> When running "watch -n 0,1 cat /proc/interrupts" (watch -n 0.1 errors out, maybe because of German environment???), the following row increases after each press:
> 
>   9:          5          0          0          0   IO-APIC-fasteoi   acpi

Ok, so it's definitely being handled by ACPI somehow - probably via WMI, 
but unsure. Rez, any chance you can look at the original message and let 
us know if this is expected to work with the current driver?

-- 
Matthew Garrett | mjg59@srcf.ucam.org
