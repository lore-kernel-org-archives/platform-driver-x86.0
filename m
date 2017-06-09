From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 09/11] platform: thinkpad_acpi: convert to use
 DRIVER_ATTR_RO/RW
Date: Fri, 9 Jun 2017 12:02:25 +0200
Message-ID: <20170609100225.GA1297@kroah.com>
References: <20170609090314.13991-1-gregkh@linuxfoundation.org>
 <20170609090314.13991-9-gregkh@linuxfoundation.org>
 <CAHp75VfG1OuX=FtUc79YburcCxwM3Su3j3M=0ijnU+AM8KV==A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:49778 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751515AbdFIKCe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 9 Jun 2017 06:02:34 -0400
Content-Disposition: inline
In-Reply-To: <CAHp75VfG1OuX=FtUc79YburcCxwM3Su3j3M=0ijnU+AM8KV==A@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, Platform Driver <platform-driver-x86@vger.kernel.org>

On Fri, Jun 09, 2017 at 12:35:35PM +0300, Andy Shevchenko wrote:
> On Fri, Jun 9, 2017 at 12:03 PM, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> > We are trying to get rid of DRIVER_ATTR(), and the thinkpad_acpi
> > driver's attributes can be trivially changed to use DRIVER_ATTR_RO() and
> > DRIVER_ATTR_RW().
> 
> Which tree is it supposed to go through?
> We might need an immutable tag / branch.

I can take it in my tree, sorry for not saying that in a 00/11 email, I
forgot that for this series.

thanks,

greg k-h
