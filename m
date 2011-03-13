From: Nikolai Kondrashov <spbnick@gmail.com>
Subject: Re: [PATCH] Platform: add Samsung Laptop platform driver
Date: Sun, 13 Mar 2011 19:51:52 +0200
Message-ID: <4D7D0438.9060607@gmail.com>
References: <4D793D05.3070908@gmail.com> <20110310211519.GA11862@kroah.com> <4D79CB47.2030405@gmail.com> <20110311170313.GA10202@kroah.com> <4D7A72E3.1050407@gmail.com> <20110311193433.GB14204@kroah.com> <4D7A8419.6080107@gmail.com> <20110311203032.GA14384@kroah.com> <4D7C9668.3000902@gmail.com> <20110313161752.GC10718@kroah.com> <20110313162812.GA25369@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:61428 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753784Ab1CMRvz (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 13 Mar 2011 13:51:55 -0400
In-Reply-To: <20110313162812.GA25369@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Greg KH <greg@kroah.com>, Randy Dunlap <rdunlap@xenotime.net>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

On 03/13/2011 06:28 PM, Matthew Garrett wrote:
> It's also modifying configuration that belongs to a device being managed
> by another driver, so it's the kind of thing we frown upon.
Sure, then I guessed right.

> Having said that, the Intel driver should gain native backlight support in
> .39.
Great news!

Thank you :)

Sincerely,
Nick
