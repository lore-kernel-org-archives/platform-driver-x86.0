From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: Fwd: [PATCH] Add driver to force WMI Thunderbolt controller
 power status
Date: Thu, 7 Sep 2017 09:36:07 +0300
Message-ID: <20170907063607.GB2477@lahna.fi.intel.com>
References: <1504720440-24423-1-git-send-email-mario.limonciello@dell.com>
 <CA+CmpXt9EtzObijHT3gmm=xUwFDF3Ec=SFbNnPAk+oRdzAUADQ@mail.gmail.com>
 <1504726863.2677.154.camel@intel.com>
 <b74a2237da254faea0377fdcb93aa3e0@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:36856 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752783AbdIGGgL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 7 Sep 2017 02:36:11 -0400
Content-Disposition: inline
In-Reply-To: <b74a2237da254faea0377fdcb93aa3e0@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: yehezkel.bernat@intel.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, dvhart@infradead.org, hughsient@gmail.com

On Wed, Sep 06, 2017 at 07:49:32PM +0000, Mario.Limonciello@dell.com wrote:
> > As this is a Thunderbolt specific function, maybe it's better to be
> > exposed from the Thunderbolt driver?
> 
> I thought about this too, but the thunderbolt driver won't load if the
> controller doesn't exist in the first place, whereas this is a platform
> BIOS feature.  I'll be interested to hear if Mika has a different perspective
> on if this should live in the TBT driver and the proper way to do it.

I think it makes sense to keep it separate from the Thunderbolt driver.
