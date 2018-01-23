From: Darren Hart <dvhart@infradead.org>
Subject: Re: [patch v9 3/4] platform/mellanox: mlxreg-hotplug: Code cleanup
Date: Mon, 22 Jan 2018 19:53:57 -0800
Message-ID: <20180123035357.GD24956@fury>
References: <1516213316-32278-1-git-send-email-vadimp@mellanox.com>
 <1516213316-32278-4-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:50255 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751195AbeAWDyA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 22 Jan 2018 22:54:00 -0500
Content-Disposition: inline
In-Reply-To: <1516213316-32278-4-git-send-email-vadimp@mellanox.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: andy.shevchenko@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us

On Wed, Jan 17, 2018 at 06:21:55PM +0000, Vadim Pasternak wrote:

As I continue to pick these patches apart into their individual functional
changes, I'm finding more issues...

> Renaming field bus in structure mlxreg_hotplug_device to nr to have a name
> consistent with Linux i2c naming.
> 
> Removing unnecessary includes.
> 
> Removing from mlxreg_hotplug_device_create dev_err to upper layer should
> produce error on EFAULT return.
> 

But the only caller doesn't check the return code. Where did you expect for this
error to be detected?

> Relocation mlxreg_hotplug_device_create/destroy to the beginning of the
> mlxreg-hotplug.c in order to have attribute related code at the same
> location.
> 
> Add to structure mlxreg_hotplug_device device node handle for devices
> defined in device table tree;
> 

The above should *really* be several changes. Start with the non-functional
preparatory changes, followed by single functional change. Also, it seems to me
adding the device node prior to enabling building on ARM would make sense??

I've broken this up, verified incremental build, and rewritten the commit
messages. I have this sitting in a local branch currently.

I need you to respond to the question above re the create call, but I'll make
the change myself.

-- 
Darren Hart
VMware Open Source Technology Center
