From: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 2/2] ACER: Add support for ambient light sensor
Date: Mon, 4 Jun 2012 19:14:00 +0200
Message-ID: <201206041914.00536.marex@denx.de>
References: <1338570683-16491-1-git-send-email-marex@denx.de> <1338570683-16491-2-git-send-email-marex@denx.de> <CAHR064hJquR4AF6iZNyJTpK5f9GOBHfMq33Y=XpD7ZtFVW1E4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:44339 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753640Ab2FDRdH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 Jun 2012 13:33:07 -0400
In-Reply-To: <CAHR064hJquR4AF6iZNyJTpK5f9GOBHfMq33Y=XpD7ZtFVW1E4A@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, joeyli <jlee@suse.com>, "Zhang, Rui" <rui.zhang@intel.com>, Len Brown <len.brown@intel.com>

Dear Corentin Chary,

> On Fri, Jun 1, 2012 at 7:11 PM, Marek Vasut <marex@denx.de> wrote:
> > This is the ambient light sensor found on Iconia W500.
> > 
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Cc: joeyli <jlee@suse.com>
> > ---

[...]

> > +static int __init acer_wmi_alsd_setup(void)
> > +{
> > +       int err;
> > +
> > +       err = acer_wmi_get_handle("ALSD", "ACPI0008", &alsd_handle);
> > +       if (err)
> > +               return err;
> 
> NACK !

What are you trying to achieve with such attitude? Are you trying to show off 
how much you can scream at someone new? I'd tell you some really harsh words and 
would turn my back on all this linux stuff if I wasn't used to people in kernel 
mailing lists having quite weird manners sometimes.

> This is a generic device, and should be handled by ACPI core
> (Samsung laptop have this too). See "ACPI ALS" on linux-acpi.

Saying this would be enough. Lee explained to me what this ACPI0008 means, I'm 
quite new to the ACPI land so pardon my ignorance here. But it then boils down 
to Lee's question, why wasn't the patch for ACPI ALS that was already proposed 
accepted? And what can be done to get it in?

Best regards,
Marek Vasut
