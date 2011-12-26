From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH] Platform: samsung-laptop: add DMI information for Samsung
 N150 Plus
Date: Mon, 26 Dec 2011 10:49:50 +0100
Message-ID: <CAHR064jyubYf5d_KekB8+wqmGXcm8v4Gg9jVt3W9Kx_Ljh++GA@mail.gmail.com>
References: <87ty4ss0z4.fsf@prochyra.name>
	<CAHR064h7a=RQq=p1J+gKpC5_6ow8ChUFFkC39HwtmerHaMksjw@mail.gmail.com>
	<87ty4qdpna.fsf@prochyra.name>
	<20111224142028.GA32171@srcf.ucam.org>
	<CANq1E4S+Sa1BERtR6aNH-ypRo+oJ1fRXkuVa+tREy5qVodv2pw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:49781 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752647Ab1LZJtw convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 26 Dec 2011 04:49:52 -0500
In-Reply-To: <CANq1E4S+Sa1BERtR6aNH-ypRo+oJ1fRXkuVa+tREy5qVodv2pw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: David Herrmann <dh.herrmann@googlemail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Andrzej Prochyra <andrzej@prochyra.name>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Dec 24, 2011 at 3:28 PM, David Herrmann
<dh.herrmann@googlemail.com> wrote:
> On Sat, Dec 24, 2011 at 3:20 PM, Matthew Garrett <mjg59@srcf.ucam.org=
> wrote:
>> On Sat, Dec 24, 2011 at 02:12:57PM +0000, Andrzej Prochyra wrote:
>>> 'acpi_video0' not functional. =C2=A0Brightness can be controlled th=
rough
>>> intel_backlight interface. =C2=A0There are 21 brightness levels and=
 the
>>> backlight can be turned off.
>>
>> If acpi_video0 doesn't work then we either need to work out why it's=
 not
>> working or make it vanish completely, so this patch isn't the correc=
t
>> approach.
>
> Just to make clear, intel_backlight isn't working properly either. If
> my laptop boots with backlight at 50% then intel_backlight will only
> work in the range 0%-50% on my machine. If I use the samsung module t=
o
> set it to 100% then =C2=A0intel_backlight works correctly in the rang=
e
> 0-100% until next reboot/suspend.
>
> So I'd recommend staying with the samsung module and disabling the
> acpi_backlight entirely. The samsung module is the only backlight
> control which works properly.

Can I take a look at the DSDT to see how it's broken ?
If it's really not functional, then it should be added to the
blacklist in video_detect.c

--=20
Corentin Chary
http://xf.iksaif.net
