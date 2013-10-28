From: Julian Andres Klode <jak@jak-linux.org>
Subject: Re: Anyone working on charge control via ACPI in newer ThinkPads?
Date: Mon, 28 Oct 2013 13:20:36 +0100
Message-ID: <20131028122036.GA15963@jak-x230>
References: <20131028094241.GA9152@jak-x230>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f42.google.com ([209.85.214.42]:46665 "EHLO
	mail-bk0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756168Ab3J1MUl (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 28 Oct 2013 08:20:41 -0400
Received: by mail-bk0-f42.google.com with SMTP id my10so1791313bkb.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Oct 2013 05:20:40 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20131028094241.GA9152@jak-x230>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Mon, Oct 28, 2013 at 10:42:41AM +0100, Julian Andres Klode wrote:
> Hi,
> 
> I am wondering whether anyone is working on kernel support for 
> (dis-)charge controlling features of the current (or last) 
> generation ThinkPads, in order to prevent any duplicate
> work. If not, I'd like to do this.
> 
> This could be done in at least two ways: A stand-alone module
> or by extending the thinkpad-acpi module. The latter is probably
> easier.
> 

Please note that I'm not subscribed to the lists. I am
only subscribed to the driverdev list, but I did not CC
that one.

I only worked on the nvec driver in staging thus far, but
the thinkpad-acpi code seems relatively straight forward
for me to dive into.

-- 
Julian Andres Klode  - Debian Developer, Ubuntu Member

See http://wiki.debian.org/JulianAndresKlode and http://jak-linux.org/.

Please do not top-post if possible.
