From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] Add driver to force WMI Thunderbolt controller power
 status
Date: Mon, 11 Sep 2017 23:40:15 +0200
Message-ID: <20170911214015.GA128849@localhost.localdomain>
References: <1504810042-4696-1-git-send-email-mario.limonciello@dell.com>
 <20170908080729.GT2477@lahna.fi.intel.com>
 <339f06ce8efd42409bf5f91dfd064e7a@ausx13mpc120.AMER.DELL.COM>
 <20170909041452.GA1084@fury>
 <20170909070558.GG2477@lahna.fi.intel.com>
 <20170911093955.GA123566@localhost.localdomain>
 <20170911094614.GO2477@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:54922 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751004AbdIKVkU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Sep 2017 17:40:20 -0400
Content-Disposition: inline
In-Reply-To: <20170911094614.GO2477@lahna.fi.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Mario.Limonciello@dell.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, hughsient@gmail.com, yehezkelshb@gmail.com

On Mon, Sep 11, 2017 at 12:46:14PM +0300, Mika Westerberg wrote:
> On Mon, Sep 11, 2017 at 02:39:55AM -0700, Darren Hart wrote:
> > Which device are you referring to? This attribute is bound to the device
> > identified by the WMI GUID, and should be independent from the controller or any
> > thunderbolt connected physical device.
> 
> I refer to "wdev->dev" whatever that is. That device has been created
> long time before this driver is probed and thus userspace already got
> the KOBJ_ADD uevent.
> 

Ah yes, I see - at the time of device_register. Thanks Mika.

-- 
Darren Hart
VMware Open Source Technology Center
