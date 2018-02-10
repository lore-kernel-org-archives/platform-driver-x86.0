From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: Some buttons on the Fujitsu u7[25]7 laptops are not working
Date: Sun, 11 Feb 2018 08:59:23 +1030
Message-ID: <20180210222923.GB11517@marvin.atrad.com.au>
References: <69f33335-962b-f3be-da8e-2eeff1ae2a49@fbihome.de>
 <20180119234547.GB24590@marvin.atrad.com.au>
 <20180210212224.GB2070@larwa.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:33132 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752870AbeBJW3l (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 10 Feb 2018 17:29:41 -0500
Content-Disposition: inline
In-Reply-To: <20180210212224.GB2070@larwa.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Jan-Marek Glogowski <glogow@fbihome.de>, platform-driver-x86@vger.kernel.org

On Sat, Feb 10, 2018 at 10:22:24PM +0100, Micha?? K??pie?? wrote:
> > > From: Jan-Marek Glogowski <glogow@fbihome.de>
> > > Date: Fri, 19 Jan 2018 21:48:22 +0100
> > > Subject: [PATCH] Emit some more button events
> > > 
> > > Seems Fujitsu continues to move HW functionality into software.
> > > These are my observations from the U727.
> > > 
> > > Fn+F1 is now a button to mute the microphone.
> > > Fn+F5 is now the rfkill button.
> > > Fn+F9 is now labeled ECO and emits a FUNC 0x1002 (args 0x1, 0x0,
> > > 0x0) returned 0x40000413
> > 
> > For reference, on the S7020 F1 and F5 have no "Fn" function while F9 is
> > "volume up.  There is no ambiguity regarding F1 and F5 at least with this
> > hardware so this patch shouldn't create conflict there.  If the newly moved
> > ECO function were to be hooked it would probably need to be done dependent
> > on model.
> 
> Why?  The ECO key/hotkey is handled by fujitsu-laptop (ACPI).  Fn+F9 on
> older models is handled by i8042 (like it should be).  I do not see any
> conflict here.

Ah yes.  Ok.

jonathan
