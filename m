From: Jouke Witteveen <j.witteveen@gmail.com>
Subject: Re: [PATCH] Platform: add Samsung Laptop platform driver
Date: Fri, 11 Feb 2011 10:17:33 +0100
Message-ID: <AANLkTim0XaEZ5gHg9QajfnRF1uraRf-kNwi579-zoZSC@mail.gmail.com>
References: <20110209224006.GA11202@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:56889 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751934Ab1BKJRz convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 11 Feb 2011 04:17:55 -0500
Received: by bwz15 with SMTP id 15so3006832bwz.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 11 Feb 2011 01:17:53 -0800 (PST)
In-Reply-To: <20110209224006.GA11202@kroah.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org

On Wed, Feb 9, 2011 at 23:40, Greg KH <greg@kroah.com> wrote:
> From: Greg Kroah-Hartman <gregkh@suse.de>
>
> This adds the samsung-laptop driver to the kernel. =A0It now supports
> all known Samsung laptops.
>

I don't see the N510, is this intentional? The netbook does not differ
that much from some that are included.

------
[root]# dmidecode -t 1,2
# dmidecode 2.11
SMBIOS 2.5 present.

Handle 0x0001, DMI type 1, 27 bytes
System Information
	Manufacturer: SAMSUNG ELECTRONICS CO., LTD.
	Product Name: N510
	Version: Not Applicable
	Serial Number: ZIZJ93HS800443
	UUID: A0DCC262-D21D-B211-8000-CDE3776AA678
	Wake-up Type: Power Switch
	SKU Number: Not Specified
	Family: Not Specified

Handle 0x0002, DMI type 2, 15 bytes
Base Board Information
	Manufacturer: SAMSUNG ELECTRONICS CO., LTD.
	Product Name: N510
	Version: Not Applicable
	Serial Number: 123490EN400015
	Asset Tag: Not Specified
	Features: None
	Location In Chassis: Not Specified
	Chassis Handle: 0xFFFF
	Type: Unknown
	Contained Object Handles: 0

------

Regards,
- Jouke
