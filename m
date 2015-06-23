From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Tue, 23 Jun 2015 21:40:15 +0200
Message-ID: <20150623194015.GA2579@eudyptula.hq.kempniu.pl>
References: <20150623112621.GA3071@eudyptula.hq.kempniu.pl>
 <20150623114659.GM31818@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f46.google.com ([74.125.82.46]:34078 "EHLO
	mail-wg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755052AbbFWTkU (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 23 Jun 2015 15:40:20 -0400
Received: by wgqq4 with SMTP id q4so18450155wgq.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jun 2015 12:40:19 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20150623114659.GM31818@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, Rezwanul Kabir <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

Hi Pali,

Thank you for your suggestions.

> First make sure you have updated dell-wmi.c driver to last version (a=
t
> least v3.19 kernel)

I experimented with multiple kernel versions, including v4.1.

> and check that your ACPI code contains event WMI
> GUID 9DBB5994-A997-11DA-B012-B622A1EF5492

It does - that's what I meant when I wrote "the Dell event GUID is pres=
ent in
the ACPI WMI object".

> Then compile dell-wmi.ko driver with debug messages, so pr_debug() ca=
ll
> will print messages to dmesg. Press key and check if you see some inf=
o
> from dell-wmi.ko in dmesg.

I did that as well. Nothing appears in dmesg after pressing the
hotkeys, even when dell-wmi is compiled with -DDEBUG.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
