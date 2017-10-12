From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v6 09/14] platform/x86: dell-smbios: Introduce dispatcher
 for SMM calls
Date: Thu, 12 Oct 2017 16:30:12 -0700
Message-ID: <20171012233012.GA1470@fury>
References: <cover.1507589249.git.mario.limonciello@dell.com>
 <25bf1422d8efbd631f57dcb7dd40865bae729398.1507589249.git.mario.limonciello@dell.com>
 <20171010160104.g4hqc7fjrp5zeg3p@pali>
 <81c43f16545744b3bc0f157841fcbb1a@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:36895 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751168AbdJLXaR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Oct 2017 19:30:17 -0400
Content-Disposition: inline
In-Reply-To: <81c43f16545744b3bc0f157841fcbb1a@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: pali.rohar@gmail.com, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, greg@kroah.com

On Tue, Oct 10, 2017 at 07:14:53PM +0000, Mario.Limonciello@dell.com wrote:
> > -----Original Message-----
> > From: Pali Rohár [mailto:pali.rohar@gmail.com]
> > Sent: Tuesday, October 10, 2017 11:01 AM
> > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > Cc: dvhart@infradead.org; Andy Shevchenko <andy.shevchenko@gmail.com>;
> > LKML <linux-kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org;
> > Andy Lutomirski <luto@kernel.org>; quasisec@google.com; rjw@rjwysocki.net;
> > mjg59@google.com; hch@lst.de; Greg KH <greg@kroah.com>
> > Subject: Re: [PATCH v6 09/14] platform/x86: dell-smbios: Introduce dispatcher for
> > SMM calls
> > 
> > On Monday 09 October 2017 17:51:47 Mario Limonciello wrote:
> > >  static void dell_rfkill_query(struct rfkill *rfkill, void *data)
> > >  {
> > > -	struct calling_interface_buffer *buffer;
> > >  	int radio = ((unsigned long)data & 0xF);
> > >  	int hwswitch;
> > >  	int status;
> > >  	int ret;
> > >
> > > -	buffer = dell_smbios_get_buffer();
> > > -
> > > -	dell_smbios_send_request(17, 11);
> > > -	ret = buffer->output[0];
> > > +	ret = dell_send_request(17, 11, 0, 0, 0, 0);
> > 
> > Basically I do not like function which takes ten numeric parameters.
> > Before in this code there was just function with 2 parameters, now there
> > are lot of zero parameters, without information what which parameter
> > means...
> > 
> 
> In an earlier patch Darren wanted to keep dell_send_request around and
> remove code that was duplicated multiple times to clear buffer, set arguments etc,
> can you please comment on what exactly you would prefer?

There was a lot of boilerplate, and I think I suggested keeping the same
interface of dell_send_request(class, select) (with 2 arguments) rather than
replacing it with 3 or 4 lines of allocating and populating the buffer with the
same values.

I see you've updated this in v7 with two calls. I'd call that a reasonable
compromise.

> 
> It's very obvious if you look at the dell_send_request function what is happening.

There have been numerous analysis indicating that the more arguments a function
has, the more likely bugs are to be found in those functions. 6 is a lot.

-- 
Darren Hart
VMware Open Source Technology Center
