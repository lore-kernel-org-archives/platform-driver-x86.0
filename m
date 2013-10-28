From: Julian Andres Klode <jak@jak-linux.org>
Subject: Anyone working on charge control via ACPI in newer ThinkPads?
Date: Mon, 28 Oct 2013 10:42:41 +0100
Message-ID: <20131028094241.GA9152@jak-x230>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f45.google.com ([209.85.214.45]:48266 "EHLO
	mail-bk0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754767Ab3J1Jmq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 28 Oct 2013 05:42:46 -0400
Received: by mail-bk0-f45.google.com with SMTP id r7so779514bkg.4
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Oct 2013 02:42:44 -0700 (PDT)
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

Hi,

I am wondering whether anyone is working on kernel support for 
(dis-)charge controlling features of the current (or last) 
generation ThinkPads, in order to prevent any duplicate
work. If not, I'd like to do this.

This could be done in at least two ways: A stand-alone module
or by extending the thinkpad-acpi module. The latter is probably
easier.

-- 
Julian Andres Klode  - Debian Developer, Ubuntu Member

See http://wiki.debian.org/JulianAndresKlode and http://jak-linux.org/.

Please do not top-post if possible.
