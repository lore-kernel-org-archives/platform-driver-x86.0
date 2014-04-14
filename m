From: Oleksandr Natalenko <oleksandr@natalenko.name>
Subject: Re: [dell-wmi] Dell Vostro 3360 extra multimedia keys don't work
Date: Tue, 15 Apr 2014 00:37:05 +0300
Message-ID: <2226205.WOk1kakOmP@spock>
References: <1498861.9DHIbmNtA9@spock> <20140414213309.GA23397@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from natalenko.name ([78.47.77.148]:56192 "EHLO natalenko.name"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754354AbaDNVhH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 14 Apr 2014 17:37:07 -0400
In-Reply-To: <20140414213309.GA23397@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org

The only key that is shown via atkbd is key "3", but "1" and "2" do not 
produce atkbd output.

Does this mean that I can make only key "3" work but not all of them?

On Monday 14 April 2014 22:33:09 Matthew Garrett wrote:
> On Tue, Apr 15, 2014 at 12:29:52AM +0300, Oleksandr Natalenko wrote:
> > Could this be fixed?
> 
> Yes, but if they're showing up via atkbd then it doesn't need to be done
> in the kernel. You should just be able to add them to the udev hwdb -
> it's in /lib/udev/hwdb.d/60-keyboard.hwdb on recent versions, somewhere
> else under /lib/udev on older ones.
-- 
Oleksandr post-factum Natalenko, MSc
pf-kernel community
https://natalenko.name/
