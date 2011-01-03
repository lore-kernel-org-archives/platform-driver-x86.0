From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: acer-wmi is unnecessarily loaded on a Lenovo Ideapad S12
Date: Mon, 3 Jan 2011 20:49:10 +0000
Message-ID: <20110103204910.GA4223@srcf.ucam.org>
References: <4D1B53FB020000230002621B@novprvlin0050.provo.novell.com> <201012301004.29531.carlos@strangeworlds.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:46433 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752928Ab1ACUtV (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 3 Jan 2011 15:49:21 -0500
Content-Disposition: inline
In-Reply-To: <201012301004.29531.carlos@strangeworlds.co.uk>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: Joey Lee <jlee@novell.com>, vpivaini@cs.helsinki.fi, platform-driver-x86@vger.kernel.org

It looks like this GUID is present in a surprisingly wide range of 
devices (eg, http://pastebin.com/8BY0Dg64 from a Vaio...), which means 
that it's probably not a safe assumption that reading from the EC will 
give us reasonable results. Do the Acer drivers definitely do that, 
rather than there being some SMI that returns the data?

-- 
Matthew Garrett | mjg59@srcf.ucam.org
