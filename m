From: Alex Hung <alex.hung@canonical.com>
Subject: Re: [PATCH v2 0/3] Dell Airplane Mode Switch driver
Date: Thu, 7 May 2015 10:24:37 +0800
Message-ID: <CAJ=jquaA5iZmGTjTCNdaUjYkPpE_XgOHELghcjyHMLPcO+Wc0w@mail.gmail.com>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com>
	<1430301066-22870-1-git-send-email-pali.rohar@gmail.com>
	<201505031238.14772@pali>
	<CAJ=jquY=QG9j1ppYBbbp5WQTVHVfsUHr8NjX5fuH+4mMWeEkdQ@mail.gmail.com>
	<20150506113119.GH30910@pali>
	<20150506215744.GA22096@fury.dvhart.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f175.google.com ([209.85.220.175]:33242 "EHLO
	mail-qk0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750947AbbEGCYi convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 6 May 2015 22:24:38 -0400
Received: by qkx62 with SMTP id 62so19339911qkx.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 06 May 2015 19:24:37 -0700 (PDT)
In-Reply-To: <20150506215744.GA22096@fury.dvhart.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>

Darren,

I guess you were looking at "Sheet1" that was comparison between
dell-rbtn and dell-wireless quite a while ago. The updated results for
dell-rbtn v2 are in the tab of "Dell-rbtnv2"

On Thu, May 7, 2015 at 5:57 AM, Darren Hart <dvhart@infradead.org> wrot=
e:
> On Wed, May 06, 2015 at 01:31:19PM +0200, Pali Roh=C3=A1r wrote:
>> Looks like everything is OK. Test3 is expected to not work correctly=
 as
>> driver is not loaded...
>>
>> On Wednesday 06 May 2015 17:11:08 Alex Hung wrote:
>> > The test was updated @
>> > https://docs.google.com/spreadsheets/d/1voffS6dNglwAExSGh3UmG__UAO=
2qfZ829CkJLPo06aI/edit?usp=3Dsharing.
>> > Please check the tab "Dell-rbtnv2"
>> >
>> > Notes:
>> > 1. The systems come and go and I can find some of original ones bu=
t I
>> > tests some others
>> > 2. Test 3 was done by Test 2 + "rmmod dell-laptop". All were run w=
ith
>> > all wireless devices are ON
>> >
>> > Summary:
>> > From external behaves such as Desktop's viewpoint (Unity was used =
and
>> > hope that's not surprising), the wireless devices are ON/OFF
>> > correctly. Other details are listed in the report.
>
> What am I to make of Sheet1:Row25 vs. Row27?
> This appears to me that for the Inspiron 3542, Dell Wireless for 3.16=
 has a
> functional soft block, while there is no change for Dell RBNT.
>
> Rows36 and 37... these are tellin gme that the ARBT method is broken =
on this
> machine?
>
>> --
>> Pali Roh=C3=A1r
>> pali.rohar@gmail.com
>>



--=20
Cheers,
Alex Hung
