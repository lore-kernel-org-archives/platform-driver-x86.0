From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH 0/2] Use acpi_dev_present()
Date: Tue, 19 Jan 2016 22:59:04 +0100
Message-ID: <5367662.pAQ7mO39ru@vostro.rjw.lan>
References: <cover.1453060661.git.lukas@wunner.de> <20160119211229.GB3253@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from v094114.home.net.pl ([79.96.170.134]:44559 "HELO
	v094114.home.net.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753736AbcASV6V (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 19 Jan 2016 16:58:21 -0500
In-Reply-To: <20160119211229.GB3253@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Lukas Wunner <lukas@wunner.de>, Lv Zheng <lv.zheng@intel.com>, Robert Moore <robert.moore@intel.com>, platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@suse.com>, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user@lists.sourceforge.net

On Tuesday, January 19, 2016 01:12:29 PM Darren Hart wrote:
> On Sun, Jan 17, 2016 at 09:49:41PM +0100, Lukas Wunner wrote:
> > Hi Darren,
> > 
> > the acpi_dev_present() API has now landed in Linus' tree.
> > Thus, after Linus' tree gets merged back into yours,
> > it would be possible to use the API in the pdx86 drivers
> > as per the following patches.
> > 
> > I've also pushed these to GitHub in case anyone prefers
> > perusing them in a browser:
> > https://github.com/l1k/linux/commits/acpi_dev_present_pdx86
> > 
> > This is a repost of patches submitted in November, the only
> > change is one line added to the commit messages to reference
> > the commit which introduces the API:
> > http://thread.gmane.org/gmane.linux.alsa.devel/147414/focus=8004
> > http://thread.gmane.org/gmane.linux.alsa.devel/147414/focus=8005
> 
> Who's tree did the API make it in through? That would likely be the best tree to
> pull these 2 patches in from.
> 
> Robert, Lv, Rafael? Would one of you prefer to take these 2 patches using the
> new API?

It was my tree and I can take these patches, but in that case I'd like the
function's name to be changed as discussed elsewhere.

Executive summary is that we have acpi_dev_present() and acpi_device_is_present()
now and they serve different purposes which is kind of confusing.  Moreover,
acpi_dev_present() doesn't check if the device is actually present, so
I would like it to be renamed to acpi_device_found() or similar.

Thanks,
Rafael
