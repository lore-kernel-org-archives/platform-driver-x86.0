From: Darren Hart <dvhart@infradead.org>
Subject: Re: [patch v11 - re-ordered 03/12] FIXME platform/mellanox: Remove
 redundant dev_err messages on device_create
Date: Fri, 26 Jan 2018 15:41:17 -0800
Message-ID: <20180126234117.GB3736@fury>
References: <1516826019-124903-1-git-send-email-vadimp@mellanox.com>
 <20180125214643.GB24122@fury>
 <AM4PR05MB33307B7EE13E93C681171C94A2E00@AM4PR05MB3330.eurprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:35509 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751408AbeAZXlW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 26 Jan 2018 18:41:22 -0500
Content-Disposition: inline
In-Reply-To: <AM4PR05MB33307B7EE13E93C681171C94A2E00@AM4PR05MB3330.eurprd05.prod.outlook.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>

On Fri, Jan 26, 2018 at 04:59:32PM +0000, Vadim Pasternak wrote:
> 
> 
> > -----Original Message-----
> > From: Darren Hart [mailto:dvhart@infradead.org]
> > Sent: Thursday, January 25, 2018 11:47 PM
> > To: Vadim Pasternak <vadimp@mellanox.com>
> > Cc: andy.shevchenko@gmail.com; gregkh@linuxfoundation.org; linux-
> > kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; jiri@resnulli.us
> > Subject: Re: [patch v11 - re-ordered 03/12] FIXME platform/mellanox: Remove
> > redundant dev_err messages on device_create
> > 
> > On Wed, Jan 24, 2018 at 08:33:37PM +0000, Vadim Pasternak wrote:
> > > The upper layer will manage and report errors returned by the create
> > > and destroy functions.
> > >
> > > FIXME: but it doesn't - we don't even check
> > 
> > I think we agreed to just drop this patch entirely, since this error is not checked
> > elsewhere? Keeping the dev_err messages?
> > 
> 
> Yes, we'll keep it.
> We just had conflict in patch order and I wanted to fix it, staying as much as
> possible aligned with the top of mellanox v10 branch.
> 
> However currently we still  have a problem in mellanox v11 after patch
> platform/mellanox: mlxreg-hotplug: Modify to use a regmap interface
> It dropped parameter device  in mlxreg_hotplug_device_create, which is
> Used inside the routine.
> 
> I'll send a separate patch to fix it from top of v11. In other case it'll be
> necessary to fix Modify to use a regmap interface  and re-send all from 
> 5-th patch in series.
> 
> Also we  should drop the patch:
> platform/x86: mlx-platform: Simplify IO access to regmap context
> It introduced the issue reported by sparse.
> 
> I am resending two last patches from review-dvhart-mellanox-v11 branch
> and also patch with fix for mlxreg_hotplug_device_create, as:
> 0010-platform-x86-mlx-platform-Extend-register-map-config.patch
> 0011-platform-mellanox-mlxreg-hotplug-Add-check-for-negat.patch
> 0012-platform-mellanox-mlxreg-hotplug-Fix-issue-of-commit.patch
> 
> Thank you very much for your help,

OK, please see review-dvhart-mellanox-v12 on infradead or github. I've verified
this passes a clean C=1 (sparse) build at each patch. I believe this is in a
state that can be moved to testing. Please confirm.

If you still want to move the dev_err messages out of the create function, we
can do that separately. Let's get this merged so we can move forward.

-- 
Darren Hart
VMware Open Source Technology Center
