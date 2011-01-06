From: Yin Kangkai <kangkai.yin@linux.intel.com>
Subject: Re: [PATCH] platform-driver-x86: ACPI EC Extra driver for Oaktrail
Date: Thu, 6 Jan 2011 18:50:03 +0800
Message-ID: <20110106105003.GO9496@kai-debian>
References: <20110106025949.GJ9496@kai-debian>
 <AANLkTi=B1XeBTogjVPWqOSFgJMD72gTpNZgg4znAR0t3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:6801 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752928Ab1AFKuG (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 6 Jan 2011 05:50:06 -0500
Content-Disposition: inline
In-Reply-To: <AANLkTi=B1XeBTogjVPWqOSFgJMD72gTpNZgg4znAR0t3@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, "Wang, Yong Y" <yong.y.wang@intel.com>, "Liu, Bing Wei" <bing.wei.liu@intel.com>

On 2011-01-06, 08:29 +0100, Corentin Chary wrote:
> > + * gps - GPS subsystem enabled: contains either 0 or 1. (rw)
> > + * wifi - WiFi subsystem enabled: contains either 0 or 1. (rw)
> > + * wwan - WWAN (3G) subsystem enabled: contains either 0 or 1. (rw)
> 
> Is there a reason do add these files in /sys/devices/platform while the
> functionality is already provided by rfkill ?

This is not the same functionality.

enable/disable using files in /sys/devices/platform will completely
cut power of those components. For example, if disabled, you can not
list out those components using lsusb. Can we achieve this using
rfkill?

> > + * camera - Camera subsystem enabled: contains either 0 or 1. (rw)
> > + * bluetooth - Bluetooth subsystem enabled: contains either 0 or 1. (rw)
> > + * touchscreen - Touchscreen subsystem enabled: contains either 0 or 1. (ro)
