From: Darren Hart <dvhart@infradead.org>
Subject: thinkpad_acpi: Lenovo ThinkPad Yoga 12 side lock button (0x6020)
Date: Sat, 10 Oct 2015 14:52:37 -0700
Message-ID: <20151010215237.GB2958@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:33110 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750894AbbJJVwi (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 10 Oct 2015 17:52:38 -0400
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

The Lenovo ThinkPad Yogo 12 has a button on the side by the power and volume
keys with a padlock icon on it, I presume intended to be used as Screenlock.

It emits 0x6020 which means it falls into the hotkey_notify_6xxx() block. It
seems this should be handled similarly to the 0x1xxx events instead (as a
hotkey).

Is this a keymap change candidate? If so, How do I map 0x6020 to a scancode?

-- 
Darren Hart
Intel Open Source Technology Center
