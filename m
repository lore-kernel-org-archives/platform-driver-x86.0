From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH 3.0.y] acer-wmi: No wifi rfkill on Sony machines
Date: Tue, 10 Apr 2012 16:09:24 -0700
Message-ID: <20120410230924.GC6140@kroah.com>
References: <1332477404-13632-1-git-send-email-jlee@suse.com>
 <20120401184007.GA20556@burratino>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:56292 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755241Ab2DJXJ0 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 10 Apr 2012 19:09:26 -0400
Received: from compute5.internal (compute5.nyi.mail.srv.osa [10.202.2.45])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 1AB4D215EA
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Apr 2012 19:09:26 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <20120401184007.GA20556@burratino>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Nieder <jrnieder@gmail.com>
Cc: stable@vger.kernel.org, "Lee, Chun-Yi" <joeyli.kernel@gmail.com>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, stable@kernel.org, "Lee, Chun-Yi" <jlee@suse.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, Mattia Dongili <malattia@linux.it>, Dimitris N <ddarlac@gmail.com>, Kalle Olavi Niemitalo <kon@iki.fi>

On Sun, Apr 01, 2012 at 01:40:07PM -0500, Jonathan Nieder wrote:
> From: Lee, Chun-Yi <joeyli.kernel@gmail.com>
> Date: Fri, 23 Mar 2012 12:36:44 +0800
> 
> commit 5719b81988f3c24ff694dc3a37e35b35630a3966 upstream.
> 
> The wireless rfkill should charged by sony-laptop but not acer-wmi.
> So, add Sony's SNY5001 acpi device to blacklist in acer-wmi.
> 
> Tested on Sony Vaio
> 
> Addresses http://bugs.debian.org/666568
> 
> Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
> Cc: Mattia Dongili <malattia@linux.it>
> Tested-by: Dimitris N <ddarlac@gmail.com>
> Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
> Signed-off-by: Matthew Garrett <mjg@redhat.com>
> Tested-by: Kalle Olavi Niemitalo <kon@iki.fi> (on v3.2.13)
> Signed-off-by: Jonathan Nieder <jrnieder@gmail.com>
> ---
> Hi Greg,
> 
> Please consider this patch for the 3.0, 3.2, and 3.3-stable series.

Now applied, thanks for letting me know.

greg k-h
