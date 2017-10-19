From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v10 11/15] platform/x86: dell-smbios-smm: test for WSMT
Date: Thu, 19 Oct 2017 15:46:54 -0700
Message-ID: <20171019224654.GC1097@fury>
References: <cover.1508434513.git.mario.limonciello@dell.com>
 <657d281490de3d0a60f210f8bc57e075c9afc40e.1508434514.git.mario.limonciello@dell.com>
 <20171019180926.h6lnfwnapswybtcb@pali>
 <9065712bf6b14fc680ba03738b369947@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:57804 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752092AbdJSWrB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 Oct 2017 18:47:01 -0400
Content-Disposition: inline
In-Reply-To: <9065712bf6b14fc680ba03738b369947@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: pali.rohar@gmail.com, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, greg@kroah.com, gnomes@lxorguk.ukuu.org.uk

On Thu, Oct 19, 2017 at 06:12:09PM +0000, Mario.Limonciello@dell.com wrote:
> > -----Original Message-----
> > From: Pali Rohár [mailto:pali.rohar@gmail.com]
> > Sent: Thursday, October 19, 2017 1:09 PM
> > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > Cc: dvhart@infradead.org; Andy Shevchenko <andy.shevchenko@gmail.com>;
> > LKML <linux-kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org; Andy
> > Lutomirski <luto@kernel.org>; quasisec@google.com; rjw@rjwysocki.net;
> > mjg59@google.com; hch@lst.de; Greg KH <greg@kroah.com>; Alan Cox
> > <gnomes@lxorguk.ukuu.org.uk>
> > Subject: Re: [PATCH v10 11/15] platform/x86: dell-smbios-smm: test for WSMT
> > 
> > On Thursday 19 October 2017 12:50:14 Mario Limonciello wrote:
> > > +/* When enabled this indicates that SMM won't work */
> > > +static bool test_wsmt_enabled(void)
> > > +{
> > > +	struct calling_interface_token *token;
> > > +
> > > +	/* if token doesn't exist, SMM will work */
> > > +	token = dell_smbios_find_token(WSMT_EN_TOKEN);
> > > +	if (!token)
> > > +		return false;
> > > +
> > > +	/* if token exists, try to access over SMM */
> > > +	buffer->class = CLASS_TOKEN_READ;
> > > +	buffer->select = SELECT_TOKEN_STD;
> > > +	memset(buffer, 0, sizeof(struct calling_interface_buffer));
> > > +	buffer->input[0] = token->location;
> > > +	dell_smbios_smm_call(buffer);
> > > +
> > > +	/* if lookup failed, we know WSMT was enabled */
> > > +	if (buffer->output[0] != 0)
> > > +		return true;
> > > +
> > > +	/* query token status if it didn't fail */
> > > +	return (buffer->output[1] == token->value);
> > > +}
> > > +
> > >  static int __init dell_smbios_smm_init(void)
> > >  {
> > >  	int ret;
> > > @@ -115,6 +140,13 @@ static int __init dell_smbios_smm_init(void)
> > >
> > >  	dmi_walk(find_cmd_address, NULL);
> > >
> > > +	ret = test_wsmt_enabled();
> > 
> > ret is int, but test_wsmt_enabled() returns bool.
> 
> Yes, ret is re-used within this method.
> 0, 1 enum is a subset of int, so this seemed like a logical thing to me to do.

Agreed, the conversion is automatic and he tests for it and returns an
appropriate error code. I don't see a real problem with this.

-- 
Darren Hart
VMware Open Source Technology Center
