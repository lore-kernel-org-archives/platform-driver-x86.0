From: Alan Cox <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH v7 10/15] platform/x86: dell-smbios: add filtering
 capability for requests
Date: Fri, 13 Oct 2017 16:19:36 +0100
Message-ID: <20171013161936.430f7a02@alans-desktop>
References: <cover.1507733291.git.mario.limonciello@dell.com>
        <83dc225624f1cde5ee1797aebc945732444ded91.1507733291.git.mario.limonciello@dell.com>
        <20171012110903.3ab4ed5e@alans-desktop>
        <20171013004645.GB1470@fury>
        <20171013094314.GB29864@kroah.com>
        <62ce0707d58b42618128e68f3bb9a45f@ausx13mpc124.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <62ce0707d58b42618128e68f3bb9a45f@ausx13mpc124.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario.Limonciello@dell.com
Cc: greg@kroah.com, dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de
List-Id: platform-driver-x86.vger.kernel.org

On Fri, 13 Oct 2017 15:03:10 +0000
> Take off your "kernel" hat and put on a "customer" hat for a few moments
> while I try to put this in practical terms why the whitelist approach doesn't
> scale for what I'm trying to do.

As a customer I'm more worried about someone trashing my system or
breaking my security.

> So considering the above isn't offering stuff like this a decision better made by the OEM?
> If the OEM  doen't want customers to be able to modify something we don't offer it in the
> manageability interface.  If the kernel community doesn't want people to be 
> modifying something the OEM does offer, it can just as well be blacklisted in the 
> kernel driver like the current filtering approach offers.

So you implement the rule

	if (whitelisted & (capabilities && whitelist->capability_need) ==
	whitelist->capability_need))
		return ALLOWED;

	if (capable(CAP_SYS_RAWIO))
		return ALLOWED;

	return NO

This puts you in the position where - known tools work and can sometimes
be unprivileged. Privileged tools with enough priv to screw the machien
can work anyway. Which is better than the starting point


You could further enhance this by having a CAP_SYS_RAWIO interface to add
whitelist entries, or to add an eBPF filter that can also make decisions
for you.

Now you've got the ability to push a policy update.

Alan
