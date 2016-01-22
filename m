From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH 1/3] dell_wmi: Support new hotkeys on the XPS 13 Skylake
Date: Thu, 21 Jan 2016 16:13:32 -0800
Message-ID: <CALCETrX+8JRb0hTw4OSh9mQuov4LbyUXC3+y4FtXpwJTTwCwEA@mail.gmail.com>
References: <cover.1447479930.git.luto@kernel.org> <db83b63cc163ecc640d5d1c5554f8aa87beaadfc.1447479930.git.luto@kernel.org>
 <20151121000636.GG7413@malice.jf.intel.com> <CALCETrVz+4CX=rjY5OZfCSGQDcgW1oQe6t8d9940ubQKDv-Eqg@mail.gmail.com>
 <20151122020414.GR16374@dell.com> <20151123145351.GG24147@pali>
 <20160121101711.GY7192@pali> <56A17306.3010503@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:32814 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750900AbcAVANw convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 21 Jan 2016 19:13:52 -0500
Received: by mail-ob0-f180.google.com with SMTP id is5so49656343obc.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 Jan 2016 16:13:52 -0800 (PST)
In-Reply-To: <56A17306.3010503@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario_limonciello@dell.com>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, "Dominguez, Jared" <Jared_Dominguez@dell.com>, Darren Hart <dvhart@infradead.org>, Andy Lutomirski <luto@kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>

On Thu, Jan 21, 2016 at 4:08 PM, Mario Limonciello
<mario_limonciello@dell.com> wrote:
>
>
> On 01/21/2016 04:17 AM, Pali Roh=C3=A1r wrote:
>> On Monday 23 November 2015 15:53:51 Pali Roh=C3=A1r wrote:
>>> On Saturday 21 November 2015 20:04:15 D. Jared Dominguez wrote:
>>>> On Fri, Nov 20, 2015 at 06:12:58PM -0600, Andy Lutomirski wrote:
>>>>> Jared, want to give us some guidance as to whether this code is
>>>>> correct at all and, if so, whether we should actually send a
>>>>> KEY_RFKILL event from dell-wmi when the key is pressed?
>>>>>
>>>>> IOW, should we allow dell-wmi to handle rfkill or should we wait =
for
>>>>> the other mechanism?
>>>>>
>>>>> --Andy
>>>> I'm adding Mario since he's worked on our client systems much long=
er and
>>>> knows more about the correct behavior for our hotkeys. I've not ye=
t read
>>>> through any of our documentation about our hotkey behavior so woul=
dn't be as
>>>> qualified to answer that. Note that both Mario and I are on vacati=
on until
>>>> the 30th, so he may not reply until then.
>>>>
>>>> --Jared
>>>>
>>> Jared, thanks for your input! When you or Mario are back from vacat=
ion,
>>> can you look at it? Or if you do not have much time, can you provid=
e
>>> documentation (or some snippets), so somebody else can update drive=
r to
>>> work correctly?
>> Hi Jared & Mario, I believe you are back from vacation, can you look=
 at it?
>>
> Pali,
>
> I understand that intel-hid will be making it in at this point.  If I=
'm
> not mistaken, it should be handling this portion.
>
> Andy,
>
> Is that right now?  Or is this on a different topic?
>

I think that's right.  And intel-hid is in Linus' tree now.

--Andy
