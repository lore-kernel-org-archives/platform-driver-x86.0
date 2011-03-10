From: =?UTF-8?B?T3phbiDDh2HEn2xheWFu?= <ozan@pardus.org.tr>
Subject: Re: acer-wmi is unnecessarily loaded on a Lenovo Ideapad S12
Date: Thu, 10 Mar 2011 08:23:35 +0200
Message-ID: <4D786E67.5050100@pardus.org.tr>
References: <4D1B53FB020000230002621B@novprvlin0050.provo.novell.com> <20110103204910.GA4223@srcf.ucam.org> <4D6EA053020000230002943D@novprvlin0050.provo.novell.com> <201103022109.51600.carlos@strangeworlds.co.uk> <4D6FDCA0020000230002951C@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from lider.pardus.org.tr ([193.140.100.216]:41627 "EHLO
	lider.pardus.org.tr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751228Ab1CJG0l (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 10 Mar 2011 01:26:41 -0500
In-Reply-To: <4D6FDCA0020000230002951C@novprvlin0050.provo.novell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joey Lee <jlee@novell.com>
Cc: carlos@strangeworlds.co.uk, ike.pan@canonical.com, vpivaini@cs.helsinki.fi, dwmw2@infradead.org, mjg59@srcf.ucam.org, platform-driver-x86@vger.kernel.org

03-03-2011 09:23 tarihinde, Joey Lee yazd=C4=B1:
> The original issue was reported by Ville-Pekka Vaino, acer-wmi driver
> auto-probe on Ideapad S12 machine by detection AWM0. But, acer-wmi ad=
ds
> a soft blocked wifi killswitch, which can't be unblocked with rfkill,=
 it
> causes problems with NetworkManager wireless network can't be enabled=
 at
> all.

This also happens with Lenovo 3000 V200 and Lenovo b560. I'm adding the=
m=20
to blacklist with the Ideapad S12
to fix users' no-wlan-at-all complains. Maybe you can just blacklist=20
them for stable kernel releases and try to find a proper solution after=
=2E

Thanks,
Ozan Caglayan
