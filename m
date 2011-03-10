From: =?UTF-8?B?T3phbiDDh2HEn2xheWFu?= <ozan@pardus.org.tr>
Subject: Re: acer-wmi is unnecessarily loaded on a Lenovo Ideapad S12
Date: Thu, 10 Mar 2011 08:58:13 +0200
Message-ID: <4D787685.80009@pardus.org.tr>
References: <4D1B53FB020000230002621B@novprvlin0050.provo.novell.com> <20110103204910.GA4223@srcf.ucam.org> <4D6EA053020000230002943D@novprvlin0050.provo.novell.com> <201103022109.51600.carlos@strangeworlds.co.uk> <4D6FDCA0020000230002951C@novprvlin0050.provo.novell.com> <4D786E67.5050100@pardus.org.tr> <4D790C240200002300029A17@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from lider.pardus.org.tr ([193.140.100.216]:51341 "EHLO
	lider.pardus.org.tr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752242Ab1CJHBP (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 10 Mar 2011 02:01:15 -0500
In-Reply-To: <4D790C240200002300029A17@novprvlin0050.provo.novell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joey Lee <jlee@novell.com>
Cc: ike.pan@canonical.com, vpivaini@cs.helsinki.fi, dwmw2@infradead.org, mjg59@srcf.ucam.org, carlos@strangeworlds.co.uk, platform-driver-x86@vger.kernel.org

10-03-2011 08:36 tarihinde, Joey Lee yazd=C4=B1:
> My idea is direct ignore all machines that have VPC2004 acpi device i=
n
> DSDT, because ideapad-laptop driver talks with BIOS though VPC2004.
>
> Did you see VPC2004 device declare in Lenovo 3000 V200 and b560's DSD=
T?

Unfortunately I can't see any VPC2004 references in 3000 v200's dsdt=20
which is at:

http://cekirdek.pardus.org.tr/~ozan/ivir/lenovo3000v200_dsdt.dsl

I don't have the other one's acpidump but I'll try to get it from the u=
ser.

Thanks.
