From: Corentin Chary <corentin.chary@gmail.com>
Subject: Should asus-wmi provide a way to switch displays, and why
 video_output class is unused
Date: Tue, 15 Feb 2011 07:53:09 +0100
Message-ID: <AANLkTimf3SL+BpzjVK=F9y4_dGnDp6ghmMKq5k=4hs0x@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:46606 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750967Ab1BOGxL (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 15 Feb 2011 01:53:11 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: linux acpi <linux-acpi@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Matthew Garrett <mjg@redhat.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Luming Yu <luming.yu@intel.com>

Hi,
In the ongoing effort to split eeepc-wmi, and add support for Asus WMI
capable notebooks, I found that some of them are able to control
dispay output.
Currently, asus-laptop, asus_acpi and eeepc-laptop are also all able
to do that, and they use a simple sysfs file with a bitmask to do
that.

Now, I was searching the right, generic way to do that, and I found
video_output class. The issue is that nobody, even acpi/video.ko, use
it.

So, what's the right way to do that ?

Note, that in my case, I can't know what output are available, so
anyway, using video_output would be a little tricky. But still, I'm
not really comfortable adding another cryptic sysfs file, even with
proper documentation in Docuementation/ABI/.

Thanks,
-- 
Corentin Chary
http://xf.iksaif.net
