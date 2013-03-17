From: Stephen Gildea <stepheng+linux@gildea.com>
Subject: Dell Latitude E6530 keyboard mapping
Date: Sun, 17 Mar 2013 07:51:40 -0700
Message-ID: <8157.1363531900@owl>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from tigger.sg.gildea.net ([99.65.78.170]:44200 "EHLO
	tigger2.sg.gildea.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756313Ab3CQO7f (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 17 Mar 2013 10:59:35 -0400
Received: from owl.sg.gildea.net (owl-vpn.sg.gildea.net [192.168.115.10])
	(using TLSv1.1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "owl.ma.gildea.net", Issuer "tigger.ma.gildea.net" (verified OK))
	by tigger2.sg.gildea.net (Postfix) with ESMTPS id C85FFA90D7
	for <platform-driver-x86@vger.kernel.org>; Sun, 17 Mar 2013 07:52:24 -0700 (PDT)
Received: from owl (localhost.localdomain [127.0.0.1])
	by owl.sg.gildea.net (Postfix) with ESMTP id D7E6D805E
	for <platform-driver-x86@vger.kernel.org>; Sun, 17 Mar 2013 07:51:40 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org

On my Dell Latitude E6530 laptop, some of the function keys and keypad
keys are mapped incorrectly by the kernel.  I first tested this with
Linux 3.6; testing now with the current head (3.8+), I find that some of
the keys have been fixed (End, NumLock, KbdLightOnOff, AudioPlayPause).
Some of the other wrong keys have changed mappings but are still wrong
(External Screen).

What change fixed these keys, and where should I be looking to fix the
rest of them?  I looked through drivers/platform/x86/, but I don't see
any other drivers dealing with keyboard mappings.

 < Stephen
