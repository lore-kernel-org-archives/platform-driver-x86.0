From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: acer-wmi is unnecessarily loaded on a Lenovo Ideapad S12
Date: Fri, 4 Mar 2011 23:59:27 +0000
Message-ID: <20110304235927.GA31464@srcf.ucam.org>
References: <4D1B53FB020000230002621B@novprvlin0050.provo.novell.com> <20110103204910.GA4223@srcf.ucam.org> <4D6EA053020000230002943D@novprvlin0050.provo.novell.com> <201103022109.51600.carlos@strangeworlds.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:56462 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751922Ab1CDX7q (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 4 Mar 2011 18:59:46 -0500
Content-Disposition: inline
In-Reply-To: <201103022109.51600.carlos@strangeworlds.co.uk>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: Joey Lee <jlee@novell.com>, vpivaini@cs.helsinki.fi, dwmw2@infradead.org, platform-driver-x86@vger.kernel.org

Looking at this, it seems that the affected machines have AMW0_GUID1 but 
none of the WMID GUIDs. By the looks of things this is just a 
semi-standardised way to trigger an SMM trap and communicate with the 
firmware. This makes things tricker to track down (because once we're in 
SMM we have no way of knowing what the firwmare's doing), but 
potentially there's some method to identify the machine here. Carlos, do 
we have any idea what the inputs and outputs for this method mean other 
than what's in AMW0_set_capabilities()?

-- 
Matthew Garrett | mjg59@srcf.ucam.org
