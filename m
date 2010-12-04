From: Mattia Dongili <malattia@linux.it>
Subject: Re: Sony Vaio wwan not powered by default
Date: Sat, 4 Dec 2010 20:21:12 +0900
Message-ID: <20101204112112.GA3156@kamineko.org>
References: <4CF41062.4090009@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from static-220-247-10-204.b-man.svips.gol.ne.jp ([220.247.10.204]:55625
	"EHLO smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753084Ab0LDLVP (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 4 Dec 2010 06:21:15 -0500
Content-Disposition: inline
In-Reply-To: <4CF41062.4090009@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Tim Gardner <tim.gardner@canonical.com>
Cc: platform-driver-x86@vger.kernel.org

On Mon, Nov 29, 2010 at 01:43:14PM -0700, Tim Gardner wrote:
> Ubuntu has been carrying the attached patch since 2.6.28. Shouldn't
> it be upstream?

Maybe, I replied to you asking more information 6 months ago when you
first(?) submitted the patch.
Also, this being a TZ specific issue the DMI entry seems a bit wide.
Last, the correct way to fix this would probably be making the SPIC part
of the driver also use the rfkill API.

-- 
mattia
:wq!
