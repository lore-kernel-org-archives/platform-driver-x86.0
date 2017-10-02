From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v3 3/8] platform/x86: dell-wmi-smbios: Use Dell WMI
 descriptor check
Date: Mon, 2 Oct 2017 16:37:54 +0200
Message-ID: <20171002143754.GH10938@pali>
References: <cover.1506571187.git.mario.limonciello@dell.com>
 <20170930012912.GB13307@fury>
 <fa02a34098914fb7a31b563d8b56dcc7@ausx13mpc120.AMER.DELL.COM>
 <201709302201.27017@pali>
 <42642a2d212b493db280c7bac6d50564@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:47886 "EHLO
        mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751067AbdJBOh6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 2 Oct 2017 10:37:58 -0400
Content-Disposition: inline
In-Reply-To: <42642a2d212b493db280c7bac6d50564@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com

On Monday 02 October 2017 14:15:11 Mario.Limonciello@dell.com wrote:
> > -----Original Message-----
> > From: Pali Rohár [mailto:pali.rohar@gmail.com]
> > Sent: Saturday, September 30, 2017 3:01 PM
> > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > Cc: dvhart@infradead.org; andy.shevchenko@gmail.com; linux-
> > kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; luto@kernel.org;
> > quasisec@google.com
> > Subject: Re: [PATCH v3 3/8] platform/x86: dell-wmi-smbios: Use Dell WMI
> > descriptor check
> > 
> > On Saturday 30 September 2017 21:48:39 Mario.Limonciello@dell.com wrote:
> > > > > +/*
> > > >
> > > > > + * Descriptor buffer is 128 byte long and contains:
> > > > ...
> > > >
> > > > > +	if (obj->buffer.length != 128) {
> > > > > +		dev_err(&wdev->dev,
> > > > > +			"Dell descriptor buffer has invalid length (%d)\n",
> > > > > +			obj->buffer.length);
> > > >
> > > > This seems odd. We call it an error (not a warning) if != 128, but
> > > > we only abort and return an error if it's < 16.
> > > >
> > > > If it's an error, we should return an error code, if anything above
> > > > 16 is acceptable but 128 is preferred, the above should be a
> > > > warning at best. (this scenario seems unlikely).
> > >
> > > Hopefully the original author can speak up to the intentions here.  I
> > > would feel that it should have errored out if it wasn't expected
> > > length too.
> > 
> > Code below access first 16 bytes of buffer. Therefore to prevent buffer
> > overflow check for 16 bytes is needed.
> > 
> > But IIRC we decided to do not throw error and continue driver loading
> > even when buffer length is not 128 (as expected by some Dell
> > documentation) as it could be possible regression because driver itself
> > does not depend on buffer length.
> > 
> 
> So I'm intending to change this in my next patch series.  I feel it should throw an
> error when the buffer length isn't 128.
> 
> My logic is that if you don't see the proper buffer size (or the proper header)
> then how can you trust that the rest of the data is reliable?  This means the format
> has changed or this isn't a real descriptor as expected by Dell (say some other vendor
> that has cloned the GUID).  It's better to abort in this situation.

Error handling now is up to you -- Dell. You know the best how your
API/ABI behave.

I did that change to be fully backward compatible with possibility to
read interface version number (needed for event handling logic).

> > > > > +		if (obj->buffer.length < 16) {
> > > > > +			ret = -EINVAL;
> > > > > +			goto out;
> > > > > +		}
> > > > > +	}
> > > > > +	desc_buffer = (u32 *)obj->buffer.pointer;
> > > > > +
> > > > > +	if (desc_buffer[0] != 0x4C4C4544 && desc_buffer[1] !=
> > > > > 0x494D5720)
> > 
> > --
> > Pali Rohár
> > pali.rohar@gmail.com

-- 
Pali Rohár
pali.rohar@gmail.com
