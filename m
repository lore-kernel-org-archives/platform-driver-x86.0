From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] Platform: Brightness quirk for samsung laptop driver
Date: Wed, 24 Aug 2011 16:10:53 -0700
Message-ID: <20110824231053.GA7697@kroah.com>
References: <1314115527-6063-1-git-send-email-dh.herrmann@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out3.smtp.messagingengine.com ([66.111.4.27]:50329 "EHLO
	out3.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751948Ab1HXXNe (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 24 Aug 2011 19:13:34 -0400
Content-Disposition: inline
In-Reply-To: <1314115527-6063-1-git-send-email-dh.herrmann@googlemail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: David Herrmann <dh.herrmann@googlemail.com>
Cc: platform-driver-x86@vger.kernel.org, mjg@redhat.com, jasonbstubbs@gmail.com

On Tue, Aug 23, 2011 at 06:05:27PM +0200, David Herrmann wrote:
> From: Jason Stubbs <jasonbstubbs@gmail.com>
> 
> On some samsung laptops the brightness regulation works slightly different.
> All SABI commands except for set_brightness work as expected. The behaviour
> of set_brightness is as follows:
> 
> - Setting a new brightness will only step one level toward the new brightness
>   level. For example, setting a level of 5 when the current level is 2 will
>   result in a brightness level of 3.
> - A spurious KEY_BRIGHTNESS_UP or KEY_BRIGHTNESS_DOWN event is also generated
>   along with the change in brightness.
> - Neither of the above two issues occur when changing from/to brightness level 0.
> 
> This patch adds detection and a non-intrusive workaround for the above issues.
> 
> Signed-off-by: David Herrmann <dh.herrmann@googlemail.com>
> ---
> Hi
> 
> This patch is originally from Jason Stubbs. See here:
> http://git.kernel.org/?p=linux/kernel/git/gregkh/patches.git;a=blob;f=platform-samsung_laptop-add-support-for-samsung-nc210-nc110.patch;hb=HEAD
> 
> I just wanted to ask whether there is some work going on here? My laptop model
> needs this fix and I reviewed and tested it and it works fine. It would be nice
> to see this upstream.

I have a different patch from Jason that should fix this properly, I'll
send it to Matthew later today.

thanks,

greg k-h
