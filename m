From: Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: regression after "asus-wmi: update wlan LED through rfkill led
 trigger"
Date: Thu, 20 Jun 2013 10:19:39 +0200
Message-ID: <51C2BB1B.4080704@rempel-privat.de>
References: <51C2A4B3.8090708@rempel-privat.de> <CAMz9Wg9V+RXk78Yb8TCuzLV=CienKK6Mz0SRd7b7LeO2sci07A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.18]:53972 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755930Ab3FTITm (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 20 Jun 2013 04:19:42 -0400
Received: from mailout-de.gmx.net ([10.1.76.10]) by mrigmx.server.lan
 (mrigmx002) with ESMTP (Nemesis) id 0LpReN-1UM0Uq0X8X-00f75n for
 <platform-driver-x86@vger.kernel.org>; Thu, 20 Jun 2013 10:19:41 +0200
In-Reply-To: <CAMz9Wg9V+RXk78Yb8TCuzLV=CienKK6Mz0SRd7b7LeO2sci07A@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Corentin Chary <corentin.chary@gmail.com>, Matthew Garrett <mjg@redhat.com>

Am 20.06.2013 08:58, schrieb AceLan Kao:
> Hi,
>
> Yes, controlling the wifi led function affects many asus users.
> And I already had a fix for this.
> https://bugzilla.kernel.org/show_bug.cgi?id=46791
>
> Please blacklist asus-wmi driver before the patch appears in the distro.
> kernel.
> Sorry about the inconvenience.

no problem. i reverted this patch for now.
Thank you for your work.

-- 
Regards,
Oleksij
