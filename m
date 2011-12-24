From: David Herrmann <dh.herrmann@googlemail.com>
Subject: Re: [PATCH] Platform: samsung-laptop: add DMI information for Samsung
 N150 Plus
Date: Sat, 24 Dec 2011 15:28:56 +0100
Message-ID: <CANq1E4S+Sa1BERtR6aNH-ypRo+oJ1fRXkuVa+tREy5qVodv2pw@mail.gmail.com>
References: <87ty4ss0z4.fsf@prochyra.name>
	<CAHR064h7a=RQq=p1J+gKpC5_6ow8ChUFFkC39HwtmerHaMksjw@mail.gmail.com>
	<87ty4qdpna.fsf@prochyra.name>
	<20111224142028.GA32171@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:63290 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753083Ab1LXO25 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 24 Dec 2011 09:28:57 -0500
In-Reply-To: <20111224142028.GA32171@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Andrzej Prochyra <andrzej@prochyra.name>, Corentin Chary <corentin.chary@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Dec 24, 2011 at 3:20 PM, Matthew Garrett <mjg59@srcf.ucam.org> =
wrote:
> On Sat, Dec 24, 2011 at 02:12:57PM +0000, Andrzej Prochyra wrote:
>> 'acpi_video0' not functional. =A0Brightness can be controlled throug=
h
>> intel_backlight interface. =A0There are 21 brightness levels and the
>> backlight can be turned off.
>
> If acpi_video0 doesn't work then we either need to work out why it's =
not
> working or make it vanish completely, so this patch isn't the correct
> approach.

Just to make clear, intel_backlight isn't working properly either. If
my laptop boots with backlight at 50% then intel_backlight will only
work in the range 0%-50% on my machine. If I use the samsung module to
set it to 100% then  intel_backlight works correctly in the range
0-100% until next reboot/suspend.

So I'd recommend staying with the samsung module and disabling the
acpi_backlight entirely. The samsung module is the only backlight
control which works properly.

Regards
David
