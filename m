From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2] Add driver to force WMI Thunderbolt controller power
 status
Date: Mon, 11 Sep 2017 12:46:14 +0300
Message-ID: <20170911094614.GO2477@lahna.fi.intel.com>
References: <1504810042-4696-1-git-send-email-mario.limonciello@dell.com>
 <20170908080729.GT2477@lahna.fi.intel.com>
 <339f06ce8efd42409bf5f91dfd064e7a@ausx13mpc120.AMER.DELL.COM>
 <20170909041452.GA1084@fury>
 <20170909070558.GG2477@lahna.fi.intel.com>
 <20170911093955.GA123566@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:21849 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751005AbdIKJqS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Sep 2017 05:46:18 -0400
Content-Disposition: inline
In-Reply-To: <20170911093955.GA123566@localhost.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Mario.Limonciello@dell.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, hughsient@gmail.com, yehezkelshb@gmail.com

On Mon, Sep 11, 2017 at 02:39:55AM -0700, Darren Hart wrote:
> Which device are you referring to? This attribute is bound to the device
> identified by the WMI GUID, and should be independent from the controller or any
> thunderbolt connected physical device.

I refer to "wdev->dev" whatever that is. That device has been created
long time before this driver is probed and thus userspace already got
the KOBJ_ADD uevent.
