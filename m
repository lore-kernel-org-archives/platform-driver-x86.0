From: Darren Hart <dvhart@infradead.org>
Subject: Re: hp-wmi: wifi rfkill can't be reversed
Date: Tue, 26 Aug 2014 17:40:43 -0500
Message-ID: <D022766E.A5859%dvhart@linux.intel.com>
References: <53ED47BA.60904@tnnn.pl>
 <1408389040.2618.31.camel@deadeye.wl.decadent.org.uk>
 <53F27EFC.3030409@tnnn.pl>
 <1408916663.12973.88.camel@deadeye.wl.decadent.org.uk>
 <1409018140.5921.3.camel@debian1>
 <1409039442.3033.65.camel@deadeye.wl.decadent.org.uk>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:33928 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755437AbaH0Akt (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 26 Aug 2014 20:40:49 -0400
In-Reply-To: <1409039442.3033.65.camel@deadeye.wl.decadent.org.uk>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>, platform-driver-x86@vger.kernel.org
Cc: Tomasz Nitecki <tnnn@tnnn.pl>, 756947@bugs.debian.org, Alan Wilson <al_wilson@ns.sympatico.ca>

On 8/26/14, 2:50, "Ben Hutchings" <ben@decadent.org.uk> wrote:

>Alan Wilson (in cc) reported that rfkill doesn't work correctly on the
>HP Compaq nc6230.
>
>- Without the hp-wmi driver loaded, the hard rfkill switch controls both
>wifi and BT while soft rfkill only works for wifi.
>
>- With the hp-wmi driver loaded, soft and hard rfkill switches can be
>used to turn wifi and BT off and to turn BT back on, but wifi cannot be
>turned back on without using the BIOS setup program.
>
>(The full bug report is logged at <https://bugs.debian.org/756947>.)
>
>This was reported against Linux 3.2, but I don't think there have been
>relevant fixes since then.
>
>Perhaps the hp-wmi driver should blacklist this model for wifi rfkill
>(while leaving all the others features enabled).  Does that seem like a
>reasonable approach to fix this?
>
>Ben.

Hi didn't quite have to get pencil and paper out to create a truth table
for this one, but nearly! Assuming assertions about no more firmware
becoming available and the latest firmware being run are accurate,
blacklisting this model seems like a reasonable approach to restoring
basic functionality.

Thanks,

-- 
Darren Hart					Open Source Technology Center
darren.hart@intel.com				            Intel Corporation
