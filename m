From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH RESEND] x86,mrst: Intel Medfield over-current detection
	patch
Date: Mon, 7 Feb 2011 19:58:43 +0000
Message-ID: <20110207195843.GA20970@srcf.ucam.org>
References: <20110125143454.10480.5156.stgit@bob.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:41371 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753680Ab1BGT6q (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 7 Feb 2011 14:58:46 -0500
Content-Disposition: inline
In-Reply-To: <20110125143454.10480.5156.stgit@bob.linux.org.uk>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: platform-driver-x86@vger.kernel.org

hwmon includes support for exposing the instantaneous current draw. 
hwmon includes support for triggering events if a parameter crosses a 
threshold. I still don't see why this isn't an hwmon driver, perhaps 
with a small platform driver for the more estoric bits of the setup.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
