From: =?UTF-8?B?w4lyaWMgUGllbA==?= <Eric.Piel@tremplin-utc.net>
Subject: [PATCH 0/2] Change some config options to be automatically selected
Date: Sat, 17 Apr 2010 02:23:51 +0200
Message-ID: <4BC8FF97.6040502@tremplin-utc.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailservice.tudelft.nl ([130.161.131.5]:47006 "EHLO
	mailservice.tudelft.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932510Ab0DQAXz (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 16 Apr 2010 20:23:55 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Andrew Morton <akpm@osdl.org>
Cc: "Brown, Len" <len.brown@intel.com>, Matthew Garrett <mjg@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hello,
Here are two patches, which have for goal to simplify in Kconfig the
selection of the options WMI and BACKLIGHT_CLASS_DEVICE. Both are not
something that anyone will want per se, but only some kind of libraries
used by other modules. Some modules "selected" them while other just
"depended on" them, so to make things more consistent and easier to use,
always select those options.

I'm not sure if there is anyone who feels really the maintainer of the
platform-x86 directory, so probably it's for Andrew to get them in his
tree :-)

Cheers,
Eric
