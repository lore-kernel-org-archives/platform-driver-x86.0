From: "Chen, Yu C" <yu.c.chen@intel.com>
Subject: RE: [PATCH v3] surface pro 4: Add support for Surface Pro 4 Buttons
Date: Tue, 5 Jan 2016 00:00:13 +0000
Message-ID: <36DF59CE26D8EE47B0655C516E9CE640286AEF41@shsmsx102.ccr.corp.intel.com>
References: <1451237389-7993-1-git-send-email-wengxt@gmail.com>
 <1451244080-940-1-git-send-email-wengxt@gmail.com>
 <CAHp75VepPax_eqc4PLgDMvzM4jpQNRXdUe5q3rXPOj81MFcwHQ@mail.gmail.com>
 <20160104203559.GB4219@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:22161 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753752AbcAEAAR convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 Jan 2016 19:00:17 -0500
In-Reply-To: <20160104203559.GB4219@malice.jf.intel.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Weng Xuetian <wengxt@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>



Hi Darren,

> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Tuesday, January 05, 2016 4:36 AM
> To: Andy Shevchenko
> Cc: Weng Xuetian; Chen, Yu C; linux-kernel@vger.kernel.org; platform-
> driver-x86@vger.kernel.org
> Subject: Re: [PATCH v3] surface pro 4: Add support for Surface Pro 4 Buttons
> 
> On Sun, Dec 27, 2015 at 10:58:06PM +0200, Andy Shevchenko wrote:
> > On Sun, Dec 27, 2015 at 9:21 PM, Weng Xuetian <wengxt@gmail.com>
> wrote:
> > > Surface Pro 4 buttons are managed by a device with _HID "MSHW0040"
> > > different from Surface Pro 3.
> > >
> > > This commit adds MSHW0040 to id list to support the Surface Pro 4,
> > > and renames the driver to surfacepro_button accordingly.
> > >
> > > Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=109871
> > > Signed-off-by: Weng Xuetian <wengxt@gmail.com>
> >
> > Darren, this one looks fine for me, still couple of question up to you.
> >
> > First is do we really want to rename driver? (Renaming variables and
> > stuff like I said if fine to me)
> 
> Sorry, replied before seeing this.
> 
> I agree that renaming the file is probably not necessary (this works on v3+ as
> I understand it, so the name isn't really a problem, and dropping the 3
> suggests it works on v1 and v2).
> 
> I'd prefer to keep the name changing to a minimum, and add some
> information to the Kconfig help and driver comments making it clear that this
> supports 3+.
> 
[Yu] I agree, since I don't have a surface pro < 3 tested, there is no need to rename it.

thanks,
yu
