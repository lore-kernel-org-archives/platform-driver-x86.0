From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v4 05/14] platform/x86: dell-wmi-descriptor: split WMI
 descriptor into it's own driver
Date: Thu, 5 Oct 2017 00:11:53 -0700
Message-ID: <20171005071153.GA31452@fury>
References: <cover.1507156392.git.mario.limonciello@dell.com>
 <ff211830e3953c70aa8e0d43614619f1fb423668.1507156392.git.mario.limonciello@dell.com>
 <20171005010909.GC25018@fury>
 <CAHp75Vc0umEt0cGn5-NWva6j1T0yry1Ag7Egnn4iSvz=cs_kTg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:48326 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751208AbdJEHL5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Oct 2017 03:11:57 -0400
Content-Disposition: inline
In-Reply-To: <CAHp75Vc0umEt0cGn5-NWva6j1T0yry1Ag7Egnn4iSvz=cs_kTg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mario Limonciello <mario.limonciello@dell.com>, LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, mjg59@google.com, Christoph Hellwig <hch@lst.de>, Greg KH <greg@kroah.com>

On Thu, Oct 05, 2017 at 08:29:10AM +0300, Andy Shevchenko wrote:
> On Thu, Oct 5, 2017 at 4:09 AM, Darren Hart <dvhart@infradead.org> wrote:
> > On Wed, Oct 04, 2017 at 05:48:31PM -0500, Mario Limonciello wrote:
> >> All communication on individual GUIDs should occur in separate drivers.
> >> Allowing a driver to communicate with the bus to another GUID is just
> >> a hack that discourages drivers to adopt the bus model.
> >>
> >> The information found from the WMI descriptor driver is now exported
> >> for use by other drivers.
> 
> > You'll want to add something like:
> >
> > #ifdef CONFIG_DELL_WMI_DESCRIPTOR_MODULE
> >         if (request_module("dell_wmi_descriptor"))
> >                 /* FAIL */
> > #endif
> >
> > During init.
> 
> I don't think #ifdef is needed.

Without the ifdef, we can't distinguish between request_module failing
to load the module because it isn't available and because it is
built-in.

> 
> We may just request module.
> 
> But looking in the code it seems that we simple need to select that
> module. No request_module will be needed.

The select will ensure the module is built, but there is not guarantee
to module load order. The intent of the above is to ensure the symbols
from the required module are loaded.

> Did I miss something?

Or I did :-) Is there something about this module which ensures
dell_wmi_descriptor is loaded first?

-- 
Darren Hart
VMware Open Source Technology Center
