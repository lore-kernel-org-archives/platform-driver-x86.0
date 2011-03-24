From: Chris Bagwell <chris@cnpbagwell.com>
Subject: Re: [PATCH] eeepc-wmi: Add support for T101MT "Express Gate" key
Date: Thu, 24 Mar 2011 08:27:41 -0500
Message-ID: <AANLkTikrX_wypmrd-PbST603jsHqkuwtA6t5X65Lg1+O@mail.gmail.com>
References: <1300909189-4135-1-git-send-email-seth.forshee@canonical.com>
	<AANLkTinZpt8qmHzhe4WyteMt-C-nkVNwEGQVvq3Nk9Lx@mail.gmail.com>
	<20110324131414.GA20612@thinkpad-t410>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:35634 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932354Ab1CXN1n convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 24 Mar 2011 09:27:43 -0400
In-Reply-To: <20110324131414.GA20612@thinkpad-t410>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>, Matthew Garrett <mjg@redhat.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Seth Forshee <seth.forshee@canonical.com>

On Thu, Mar 24, 2011 at 8:14 AM, Seth Forshee
<seth.forshee@canonical.com> wrote:
> On Thu, Mar 24, 2011 at 08:33:33AM +0100, Corentin Chary wrote:
>> On Wed, Mar 23, 2011 at 8:39 PM, Seth Forshee
>> <seth.forshee@canonical.com> wrote:
>> > Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
>> > ---
>> >
>> > This button is unusual. On press it emits scanocde 0xe4, on releas=
e
>> > 0xe5, and when held for a few seconds it begins emitting 0xea abou=
t
>> > twice per second. I chose to handle only the press event in order =
to
>> > make it behave like the other hotkeys.
>> >
>> > Probably the closest thing to the intended function of this button
>> > would be to alternate the display orientation between portrait and
>> > landscape, but since there doesn't appear to be a keycode defined =
for
>> > that function I went with KEY_PROG2. I'm open to other suggestions
>> > however.
>>
>> Hi,
>> The manual says that under Windows, this is the "Home Key", so
>> KEY_HOME would be more appropriate.
>
> The manual does call it the Home Key (I missed previously that the
> Express Gate description referred only to the quick boot mode), but t=
he
> description of the key operation reads:
>
> =A0Shortly press this key to launch the Touch Gate touch screen
> =A0interface. Press and hold this key to preview desktop rotation, an=
d
> =A0then release the key to finish desktop rotation.
>
> Which doesn't really sound like a home key to me, and the icon above =
the
> button also suggests display rotation. But then we don't seem to have=
 a
> code for that function, so KEY_PROG2 may be no better than KEY_HOME..=
=2E
>
>> Also, it would be great to preserve key up and key down informations
>> (sparse keymap have an "autorelease" parameter to control that).
>
> Okay, I'll add some special casing for this key to support that. Do y=
ou
> suggest ignoring the 0xea scan codes?
>

I have one of these in the mail so I'm interested in outcome.

I suggest implementing as manual describes and can be handled similar
to brightness control logic.

I would suggest sending BTN_HOME upon button release 0xe5 (not press
0xe4 and do the autorelease because of it) and BTN_PROG2 on
press-and-hold 0xea.

If you press-and-hold, does it still send the 0xe5 upon release?  That
could complicate things so that both button events do not get sent.

I'm not sure what BTN_HOME is commonly used for.  This button does
sound like a HOME button in iPad sense but not in web browser sense.

Chris
