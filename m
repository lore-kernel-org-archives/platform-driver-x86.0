From: Mattia Dongili <malattia@linux.it>
Subject: Re: sony-laptop: fix SNC buffer calls when SN06 returns Integers
Date: Wed, 19 Dec 2012 06:39:58 +0900
Message-ID: <20121218213958.GA28648@kamineko.org>
References: <1355814524.19698.19.camel@rzhang1-mobl4>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:56035 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753989Ab2LRVrn (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 18 Dec 2012 16:47:43 -0500
Content-Disposition: inline
In-Reply-To: <1355814524.19698.19.camel@rzhang1-mobl4>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Zhang Rui <rui.zhang@intel.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

On Tue, Dec 18, 2012 at 03:08:44PM +0800, Zhang Rui wrote:
> Hi, Mattia,

Hi Rui!

> I generated a similar patch as yours but I still have one concern about the fix.

thanks for taking care of that.

> memcpy(buffer, (void *)&object->integer.value, len) may break the byte order but
> sony_nc_rfkill_setup() terminates if byte 0xff is checked.
> is this true? or am I thinking wrong?

You're correct, sony_nc_rfkill_setup() stops looking at the buffer as
soon as it hits 0xff but why do you think memcpy would break the byte
order?

-- 
mattia
:wq!
