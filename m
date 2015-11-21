From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH 2/3] dell_wmi: Use a C99-style array for bios_to_linux_keycode
Date: Fri, 20 Nov 2015 16:28:16 -0800
Message-ID: <CALCETrV5uSshacdyKcQAF4fq91J8FNha8N=PJiTGBSUNphXjfQ@mail.gmail.com>
References: <cover.1447479930.git.luto@kernel.org> <c97f6a3b8c48eef0312db51e06a266e3ffeca620.1447479930.git.luto@kernel.org>
 <20151121000939.GH7413@malice.jf.intel.com> <201511210120.19840@pali> <20151121002638.GJ7413@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:32996 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752011AbbKUA2g convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 20 Nov 2015 19:28:36 -0500
Received: by oixx65 with SMTP id x65so74267549oix.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2015 16:28:36 -0800 (PST)
In-Reply-To: <20151121002638.GJ7413@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>

On Fri, Nov 20, 2015 at 4:26 PM, Darren Hart <dvhart@infradead.org> wro=
te:
> On Sat, Nov 21, 2015 at 01:20:19AM +0100, Pali Roh=C3=A1r wrote:
>> On Saturday 21 November 2015 01:09:39 Darren Hart wrote:
>> > Pali or Matthew, do either of you care to comment?
>>
>> Already commented, email is in archive, see:
>>
>> http://thread.gmane.org/gmane.linux.drivers.platform.x86.devel/7936/=
focus=3D7941
>
> Right, sorry, I picked this up from my procmail auto-populated patche=
s mbox
> since I wasn't Cc'd - missed your response.

Sorry, I parsed MAINTAINERS by hand incorrectly.

--Andy
