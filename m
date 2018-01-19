From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] Support tablet mode switch for Dell laptops
Date: Fri, 19 Jan 2018 17:01:23 +0100
Message-ID: <20180119160123.onn7w36hmhrxoaq6@pali>
References: <1516283990-3665-1-git-send-email-notmart@gmail.com>
 <20180118154408.eyke3dtn6zlcqphi@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180118154408.eyke3dtn6zlcqphi@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org, mjg59@srcf.ucam.org, dvhart@infradead.org, andy@infradead.org, bhush94@gmail.com, platform-driver-x86@vger.kernel.org, Marco Martin <notmart@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On Thursday 18 January 2018 16:44:08 Pali Rohár wrote:
> On Thursday 18 January 2018 14:59:50 Marco Martin wrote:
> > -	if (!sparse_keymap_report_event(priv->input_dev, event, 1, true))
> > +	if (event == 0xCC) {
> > +		input_report_switch(priv->input_dev, SW_TABLET_MODE, 1);
> > +		input_sync(priv->input_dev);
> > +	} else if (event == 0xCD) {
> > +		input_report_switch(priv->input_dev, SW_TABLET_MODE, 0);
> > +		input_sync(priv->input_dev);
> > +	} else if (!sparse_keymap_report_event(priv->input_dev, event, 1, true))
> 
> Is not it possible to put 0xCC and 0xCD into sparse keymap table?
> Because IIRC sparse keymap was created just to avoid that big
> if-elseif-elseif-else blocks.

Dmitry, can you comment above part? I think that there should be better
way how to handle above switches and sparse keymap via one input device.

> >  		dev_info(&device->dev, "unknown event index 0x%x\n",
> >  			 event);
> >  }
> 

-- 
Pali Rohár
pali.rohar@gmail.com
