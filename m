From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH v5 14/14] platform/x86: dell-smbios-wmi: introduce
 userspace interface
Date: Sat, 7 Oct 2017 14:36:56 +0200
Message-ID: <20171007123656.GA5667@kroah.com>
References: <cover.1507350554.git.mario.limonciello@dell.com>
 <cb39307b0d44321cb168331c308e0fbee11b385c.1507350554.git.mario.limonciello@dell.com>
 <20171007074132.GB25755@kroah.com>
 <6e3e2c8163ad4576b029eb4c17b4add1@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:47793 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750878AbdJGMgu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 7 Oct 2017 08:36:50 -0400
Content-Disposition: inline
In-Reply-To: <6e3e2c8163ad4576b029eb4c17b4add1@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de

On Sat, Oct 07, 2017 at 12:15:18PM +0000, Mario.Limonciello@dell.com wrote:
> > > +	struct wmi_smbios_priv *priv;
> > > +	int ret = 0;
> > > +	size_t size;
> > > +
> > > +	switch (cmd) {
> > > +	case DELL_WMI_SMBIOS_CMD:
> > > +		priv = dev_get_drvdata(&wdev->dev);
> > > +		if (!priv)
> > > +			return -ENODEV;
> > > +		size = sizeof(struct wmi_smbios_buffer);
> > > +		mutex_lock(&call_mutex);
> > > +		if (copy_from_user(priv->buf, input, size)) {

Wait, how do you know that input is size big?

> > > +			dev_dbg(&wdev->dev, "Copy %lu from user failed\n",
> > > +				size);
> > > +			ret = -EFAULT;
> > > +			goto fail_smbios_cmd;
> > > +		}
> > > +		if (priv->buf->length < priv->buffer_size) {
> > > +			dev_err(&wdev->dev,
> > > +				"Buffer %lld too small, need at least %d\n",
> > > +				priv->buf->length, priv->buffer_size);
> > > +			ret = -EINVAL;
> > > +			goto fail_smbios_cmd;
> > > +		}
> > 
> > No checking for too big of a length?  Any other fields you should check
> > for validity?  Like too small?
> 
> Too big is actually intentionally ignored.

That seems "odd"...

> I split the copy into two segments to check for this.  
> 1. First copy the size of the structure 
> (if userspace didn't allocate at least sizeof(struct wmi_smbios_buffer) that's a problem)
> 2. Verify the size claimed is "at least" what we internally are looking for.
> 3. Copy the rest of the size internally needed.  If userspace sent more it's just not copied.
> 4. When sending it back I only send back up to the "at least" internal size.

That feels strange, are you sure this is correct?  Why the odd two step
process here?

What if 'length' is set to an invalid value (too big or small), will you
catch that correctly here?

> > > +		if (dell_smbios_call_filter(&wdev->dev, &priv->buf->std)) {
> > > +			dev_err(&wdev->dev, "Invalid call %d/%d:%8x\n",
> > > +				priv->buf->std.class, priv->buf->std.select,
> > > +				priv->buf->std.input[0]);
> > > +			ret = -EFAULT;
> > > +			goto fail_smbios_cmd;
> > > +		}
> > > +		size = priv->buffer_size - sizeof(struct wmi_smbios_buffer);
> > 
> > What if size just went too small and wrapped around?  :(
> > 
> > Remember, "All input is evil".  Go print that out and put it on the wall
> > when you are designing this user/kernel api.  You can trust no one, you
> > have to validate _everything_.
> 
> priv->buffer_size can't be set by userspace.

Who sets it?  Your structure naming here doesn't make it obvious which
data is from the kernel and which from userspace, making this very hard
to audit :(

thanks,

greg k-h
