From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH] intel_scu_ipc: Utility driver for intel scu ipc
Date: Mon, 3 Jan 2011 10:42:41 +0000
Message-ID: <20110103104241.01db5e1d@lxorguk.ukuu.org.uk>
References: <20101022144318.30569.62307.stgit@localhost.localdomain>
	<201101031017.10481.trenn@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:34174 "EHLO
	www.etchedpixels.co.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1750738Ab1ACKnU (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 3 Jan 2011 05:43:20 -0500
In-Reply-To: <201101031017.10481.trenn@suse.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Thomas Renninger <trenn@suse.de>
Cc: mjg@redhat.com, platform-driver-x86@vger.kernel.org, sreedhara.ds@intel.com

> > This driver implements ioctl and interfaces with intel scu ipc driver. It
> > is used to access pmic/msic registers from user space and firmware update
> > utility.
> Why is an ioctl used for updating the firmware?
> Why isn't request_firmware(..) via:
> /lib/firmware/...
> used?

Because you would then still need an ioctl to say "go do the upload"

This firmware is flashed into the device, it isn't loaded into memory and
then used by the device. It's not the kind of thing you want to get wrong
or automate behind someone's back.

Alan
