From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [dell-wmi] Dell Vostro 3360 extra multimedia keys don't work
Date: Mon, 14 Apr 2014 22:33:09 +0100
Message-ID: <20140414213309.GA23397@srcf.ucam.org>
References: <1498861.9DHIbmNtA9@spock>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:40210 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754896AbaDNVdM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 14 Apr 2014 17:33:12 -0400
Content-Disposition: inline
In-Reply-To: <1498861.9DHIbmNtA9@spock>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Oleksandr Natalenko <oleksandr@natalenko.name>
Cc: platform-driver-x86@vger.kernel.org

On Tue, Apr 15, 2014 at 12:29:52AM +0300, Oleksandr Natalenko wrote:

> Could this be fixed?

Yes, but if they're showing up via atkbd then it doesn't need to be done 
in the kernel. You should just be able to add them to the udev hwdb - 
it's in /lib/udev/hwdb.d/60-keyboard.hwdb on recent versions, somewhere 
else under /lib/udev on older ones.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
