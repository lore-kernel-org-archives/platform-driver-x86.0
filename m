From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] Support tablet mode switch for Dell laptops
Date: Fri, 19 Jan 2018 09:29:02 -0800
Message-ID: <20180119172902.wgmvlehbsrjesabd@dtor-ws>
References: <1516283990-3665-1-git-send-email-notmart@gmail.com>
 <20180118154408.eyke3dtn6zlcqphi@pali>
 <20180119160123.onn7w36hmhrxoaq6@pali>
 <abfbf75104c84a88bfc4b41789f41c66@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:37072 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755932AbeASR3G (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 19 Jan 2018 12:29:06 -0500
Content-Disposition: inline
In-Reply-To: <abfbf75104c84a88bfc4b41789f41c66@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: pali.rohar@gmail.com, linux-kernel@vger.kernel.org, mjg59@srcf.ucam.org, dvhart@infradead.org, andy@infradead.org, bhush94@gmail.com, platform-driver-x86@vger.kernel.org, notmart@gmail.com

On Fri, Jan 19, 2018 at 04:09:09PM +0000, Mario.Limonciello@dell.com wrote:
> > -----Original Message-----
> > From: platform-driver-x86-owner@vger.kernel.org [mailto:platform-driver-x86-
> > owner@vger.kernel.org] On Behalf Of Pali Rohár
> > Sent: Friday, January 19, 2018 10:01 AM
> > To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Cc: linux-kernel@vger.kernel.org; mjg59@srcf.ucam.org; dvhart@infradead.org;
> > andy@infradead.org; bhush94@gmail.com; platform-driver-x86@vger.kernel.org;
> > Marco Martin <notmart@gmail.com>
> > Subject: Re: [PATCH] Support tablet mode switch for Dell laptops
> > 
> > On Thursday 18 January 2018 16:44:08 Pali Rohár wrote:
> > > On Thursday 18 January 2018 14:59:50 Marco Martin wrote:
> > > > -	if (!sparse_keymap_report_event(priv->input_dev, event, 1, true))
> > > > +	if (event == 0xCC) {
> > > > +		input_report_switch(priv->input_dev, SW_TABLET_MODE, 1);
> > > > +		input_sync(priv->input_dev);
> > > > +	} else if (event == 0xCD) {
> > > > +		input_report_switch(priv->input_dev, SW_TABLET_MODE, 0);
> > > > +		input_sync(priv->input_dev);
> > > > +	} else if (!sparse_keymap_report_event(priv->input_dev, event, 1, true))
> > >
> > > Is not it possible to put 0xCC and 0xCD into sparse keymap table?
> > > Because IIRC sparse keymap was created just to avoid that big
> > > if-elseif-elseif-else blocks.
> > 
> > Dmitry, can you comment above part? I think that there should be better
> > way how to handle above switches and sparse keymap via one input device.
> > 
> > > >  		dev_info(&device->dev, "unknown event index 0x%x\n",
> > > >  			 event);
> > > >  }
> > >
> > 
> > --
> > Pali Rohár
> > pali.rohar@gmail.com
> 
> We discussed a little more on the bug he filed with attached DSDT.  I think that in 
> sparse keymap he can use KE_VSW for the entries and sparse keymap can handle.

No it should be KE_SW I believe, as the "keycode" encodes the state.
See example in intel-hid.c.

So you probably want:

	...
	{ KE_SW, 0xCC, { .sw = { SW_TABLET_MODE, 1 } } }, /* Press */
	{ KE_SW, 0xCD, { .sw = { SW_TABLET_MODE, 0 } } }, /* Release */

Thanks.

-- 
Dmitry
