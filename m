From: Ville-Pekka Vainio <vpivaini@cs.helsinki.fi>
Subject: acer-wmi is unnecessarily loaded on a Lenovo Ideapad S12
Date: Tue, 28 Dec 2010 14:31:45 +0200
Message-ID: <1293539505.1886.14.camel@lenovo-s12>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from courier.cs.helsinki.fi ([128.214.9.1]:50647 "EHLO
	mail.cs.helsinki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753405Ab0L1Mbr (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 28 Dec 2010 07:31:47 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org

Hi,

I hope I'm on the right mailing list for this issue. The kernel (I'm
using Fedora's 2.6.37rc7) loads the acer-wmi module on a Lenovo Ideapad
S12 netbook and I think that's not necessary. Loading the module causes
problems with NetworkManager, the wireless network can't be enabled at
all. This seems to happen because acer-wmi adds a soft blocked wifi
killswitch, which can't be unblocked with rfkill.

Now that the kernel has the ideapad-laptop module, which seems to handle
the killswitches better, acer-wmi could probably be disabled with this
netbook. I know almost nothing about ACPI/WMI myself, which is why I'm
writing on the list instead of just fixing this.

-- 
Ville-Pekka Vainio
