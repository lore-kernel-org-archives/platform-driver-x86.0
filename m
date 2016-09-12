From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [patch v1] x86/platform/mellanox: introduce support for Mellanox
 systems platform
Date: Mon, 12 Sep 2016 08:11:38 +0200
Message-ID: <20160912061138.GA11230@kroah.com>
References: <1473661798-112691-1-git-send-email-vadimp@mellanox.com>
 <4e3f6ebf-2c14-6872-6a74-35da891b66be@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:56032 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753374AbcILGLd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Sep 2016 02:11:33 -0400
Content-Disposition: inline
In-Reply-To: <4e3f6ebf-2c14-6872-6a74-35da891b66be@roeck-us.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: vadimp@mellanox.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, davem@davemloft.net, geert@linux-m68k.org, akpm@linux-foundation.org, kvalo@codeaurora.org, mchehab@kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us

On Sun, Sep 11, 2016 at 10:34:27PM -0700, Guenter Roeck wrote:
> > +static int mlxplat_lpc_config(struct mlxplat_priv *priv)
> > +{
> > +	struct pci_dev *pdev = NULL;
> > +	u16 dev_id;
> > +	int err;
> > +
> > +	pdev = pci_get_bus_and_slot(MLXPLAT_CPLD_LPC_CTRL_IFC_BUS_ID,
> > +				PCI_DEVFN(MLXPLAT_CPLD_LPC_CTRL_IFC_SLOT_ID,
> > +				MLXPLAT_CPLD_LPC_CTRL_IFC_FUNC_ID));
> > +
> 
> Kind of unusual way to initialize a PCI device. If this can't be implemented
> as PCI driver, maybe it should be initialized using PCI quirks ?

That's a _very old_ way of writing a pci driver, I thought we had gotten
rid of all of that crud.

This needs to be a "normal" PCI driver, no need for it to be a platform
driver at all from what I can tell.

thanks,

greg k-h
