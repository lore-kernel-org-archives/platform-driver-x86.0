From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH 3/3] dell_wmi: Improve unknown hotkey handling
Date: Fri, 20 Nov 2015 16:44:10 -0800
Message-ID: <CALCETrXyN8YbjDoMk8WCP41HL3XzO2s8_6Eg38K9qvN5rkEN=Q@mail.gmail.com>
References: <cover.1447479930.git.luto@kernel.org> <CALCETrUXJfKEEAwk1-cBhDrEtgp6nP0pBGOhuoQc-XRohKtLwA@mail.gmail.com>
 <20151121002904.GK7413@malice.jf.intel.com> <201511210141.14081@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:34599 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760089AbbKUAob convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 20 Nov 2015 19:44:31 -0500
Received: by obbbj7 with SMTP id bj7so99361781obb.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2015 16:44:30 -0800 (PST)
In-Reply-To: <201511210141.14081@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>

On Fri, Nov 20, 2015 at 4:41 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com>=
 wrote:
> On Saturday 21 November 2015 01:29:04 Darren Hart wrote:
>> Pali, was this something you wanted to discuss more before I merge
>> it?
>
> Just one note:
>
>> +             if (keycode =3D=3D 0) {
>
> What about using define KEY_RESERVED instead hardcoded constant 0?
>
>> +                     pr_info("firmware scancode %d maps to unrecogn=
ized keycode %d\n", bios_entry->keycode, bios_entry->scancode);
>> +                     continue;
>> +             }
>

That would work, but only because KEY_RESERVED =3D=3D 0.  Let me send a
better patch.

--Andy
