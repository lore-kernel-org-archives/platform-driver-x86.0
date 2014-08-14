From: Paul Bolle <pebolle@tiscali.nl>
Subject: platform/x86: Makefile entry for toshiba_haps?
Date: Thu, 14 Aug 2014 11:26:26 +0200
Message-ID: <1408008386.27564.28.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cpsmtpb-ews06.kpnxchange.com ([213.75.39.9]:54386 "EHLO
	cpsmtpb-ews06.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751827AbaHNJ03 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 14 Aug 2014 05:26:29 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: Matthew Garrett <matthew.garrett@nebula.com>, platform-driver-x86@vger.kernel.org

Azael,

Your commit 59893e2c9ce5 ("platform/x86: Enable build support for
toshiba_haps") is included in today's linux-next (ie, next-21040814). It
claims to add Makefile and Kconfig build support for the toshiba_haps
driver but, for some reason, doesn't actually add Makefile support.

I assume that a (trivial) patch to really add a Makefile entry is queued
somewhere. Is that correct?


Paul Bolle
