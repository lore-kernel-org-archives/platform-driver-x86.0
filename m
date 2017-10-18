From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v9 11/17] platform/x86: dell-smbios-smm: test for WSMT
Date: Wed, 18 Oct 2017 12:09:27 -0700
Message-ID: <20171018190927.GA1097@fury>
References: <cover.1508259916.git.mario.limonciello@dell.com>
 <e552ba67da7281d184936a551501c4040510b372.1508259916.git.mario.limonciello@dell.com>
 <20171017192258.fx2ejggjkyzkrzle@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:46733 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750939AbdJRTJb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Oct 2017 15:09:31 -0400
Content-Disposition: inline
In-Reply-To: <20171017192258.fx2ejggjkyzkrzle@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Mario Limonciello <mario.limonciello@dell.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>

On Tue, Oct 17, 2017 at 09:22:58PM +0200, Pali Rohár wrote:
> On Tuesday 17 October 2017 13:21:55 Mario Limonciello wrote:
> > +/* When enabled this indicates that SMM won't work */
> > +static int test_wsmt_enabled(void)
> > +{
> > +	struct calling_interface_token *token;
> > +
> > +	/* if token doesn't exist, SMM will work */
> > +	token = dell_smbios_find_token(WSMT_EN_TOKEN);
> > +	if (!token)
> > +		return 0;
> > +
> > +	/* if token exists, try to access over SMM */
> > +	buffer->class = CLASS_TOKEN_READ;
> > +	buffer->select = SELECT_TOKEN_STD;
> > +	memset(buffer, 0, sizeof(struct calling_interface_buffer));
> > +	buffer->input[0] = token->location;
> > +	dell_smbios_smm_call(buffer);
> > +
> > +	/* if lookup failed, we know WSMT was enabled */
> > +	if (buffer->output[0] != 0)
> > +		return 1;
> > +
> > +	/* query token status if it didn't fail */
> > +	return (buffer->output[1] == token->value);
> > +}
> 
> Maybe small suggestion... function returns only zero or one -- what is a
> good candidate to have return value boolean and not basic int.

Yes please.

-- 
Darren Hart
VMware Open Source Technology Center
