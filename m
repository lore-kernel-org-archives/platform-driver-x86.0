From: Alexander Gavrilenko <alexander.gavrilenko@googlemail.com>
Subject: laptop/presentation/tablet mode switch
Date: Mon, 17 Nov 2014 21:10:31 +0300
Message-ID: <CAOX017rGkOvZFZSAGf0Du71vmcs+vd=zdWv4TcJw8mmXaeksHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:46963 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751809AbaKQSKc (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 17 Nov 2014 13:10:32 -0500
Received: by mail-oi0-f48.google.com with SMTP id u20so1298148oif.7
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Nov 2014 10:10:32 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, malattia@linux.it

Hi,

Sony Vaio Fit 11a/13a/14a/15a laptops have three different screen
orientations: laptop (normal), presentation (screen is 180 degrees
rotated) and tablet (screen rotation should be defined by
accelerometer data).
There is a SW_TABLET_MODE binary switch for laptop/tablet
transformation, but nothing like it for presentation mode.

I would to ask for you recommendations on how to implement
presentation mode event reporting
 - as a new SW_PRESENTATION_MODE switch and make drivers set values
for both switches
 - as a single (new or existing) hotkey code and an entry in sysfs
with screen mode value. plus support for original SW_TABLET_MODE
switch
 - as a new hotkey codes for all three modes plus support for original
SW_TABLET_MODE switch
 - as a new ABS type event plus support for original SW_TABLET_MODE switch
 - some better way to do it

Thank you,
Alexander.
