From: Zhang Rui <rui.zhang@intel.com>
Subject: sony-laptop: fix SNC buffer calls when SN06 returns Integers
Date: Tue, 18 Dec 2012 15:08:44 +0800
Message-ID: <1355814524.19698.19.camel@rzhang1-mobl4>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:58917 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751540Ab2LRHIs (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 18 Dec 2012 02:08:48 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, malattia@linux.it
Cc: "Zhang, Rui" <rui.zhang@intel.com>

Hi, Mattia,

I saw your fix for the SN06 Integer return value issue at
http://www.spinics.net/lists/platform-driver-x86/msg03934.html

here is a duplicate bug report at
https://bugzilla.kernel.org/show_bug.cgi?id=50111

I generated a similar patch as yours but I still have one concern about the fix.

memcpy(buffer, (void *)&object->integer.value, len) may break the byte order but
sony_nc_rfkill_setup() terminates if byte 0xff is checked.
is this true? or am I thinking wrong?

thanks,
rui
