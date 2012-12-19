From: Zhang Rui <rui.zhang@intel.com>
Subject: Re: sony-laptop: fix SNC buffer calls when SN06 returns Integers
Date: Wed, 19 Dec 2012 09:00:34 +0800
Message-ID: <1355878834.2280.2.camel@rzhang1-mobl4>
References: <1355814524.19698.19.camel@rzhang1-mobl4>
	 <20121218213958.GA28648@kamineko.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:59546 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755342Ab2LSBAk (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 18 Dec 2012 20:00:40 -0500
In-Reply-To: <20121218213958.GA28648@kamineko.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

On Wed, 2012-12-19 at 06:39 +0900, Mattia Dongili wrote:
> On Tue, Dec 18, 2012 at 03:08:44PM +0800, Zhang Rui wrote:
> > Hi, Mattia,
> 
> Hi Rui!
> 
> > I generated a similar patch as yours but I still have one concern about the fix.
> 
> thanks for taking care of that.
> 
> > memcpy(buffer, (void *)&object->integer.value, len) may break the byte order but
> > sony_nc_rfkill_setup() terminates if byte 0xff is checked.
> > is this true? or am I thinking wrong?
> 
> You're correct, sony_nc_rfkill_setup() stops looking at the buffer as
> soon as it hits 0xff but why do you think memcpy would break the byte
> order?
> 
I'm not sure how SN06 works.
say, you have supported codes 0x00, 0x10, and 0x20, what would SN06
return?
0x001020FF00000000 or 0x00000000FF201000?

thanks,
rui
