From: =?UTF-8?B?S2VuZy1Zw7wgTGlu?= <kengyu@canonical.com>
Subject: Re: [PATCH 1/2] ideapad-laptop: Ignore an unused VPC notification
Date: Thu, 30 Jun 2011 11:17:52 +0100
Message-ID: <BANLkTinwSHoV+BBG_jvLdg3c4o_uODNJvQ@mail.gmail.com>
References: <1309268154-6872-1-git-send-email-kengyu@canonical.com> <4E0B360B.5050600@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:48280 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752118Ab1F3KSe convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 30 Jun 2011 06:18:34 -0400
In-Reply-To: <4E0B360B.5050600@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ike Panhc <ike.pan@canonical.com>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, vanhoof@canonical.com, kent.lin@canonical.com, sylee@canonical.com

On Wed, Jun 29, 2011 at 3:26 PM, Ike Panhc <ike.pan@canonical.com> wrot=
e:
> On 06/28/2011 09:35 PM, Keng-Yu Lin wrote:
>> BIOS fires notifications in a constant period with VPC bit 1 set whe=
n the
>> power cord is unplugged.
>>
>> This event is not known yet to have any effect, but it makes the
>> call to sparse_keymap_report_event() and generates many KEY_UNKNOWNs=
=2E
>>
>> This causes the userspace (Gnome Power Manager in my case) unable
>> to enter the idle mode. As the result there is no screensaver showin=
g up,
>> no dim backlight, etc.
>>
>> Signed-off-by: Keng-Yu Lin <kengyu@canonical.com>
>> ---
>> =C2=A0drivers/platform/x86/ideapad-laptop.c | =C2=A0 =C2=A03 ++-
>> =C2=A01 files changed, 2 insertions(+), 1 deletions(-)
>>
>> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platfor=
m/x86/ideapad-laptop.c
>> index bfdda33..820f013 100644
>> --- a/drivers/platform/x86/ideapad-laptop.c
>> +++ b/drivers/platform/x86/ideapad-laptop.c
>> @@ -463,7 +463,8 @@ static void ideapad_acpi_notify(struct acpi_devi=
ce *adevice, u32 event)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ideapad_sync_rfk_state(adevice);
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 else if (vpc_bit =3D=3D 4)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 read_ec_data(handle, 0x12, &vpc2);
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 else
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 else if (vpc_bit =3D=3D 1) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 } else
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ideapad_input_report(priv, vpc_bit)=
;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> =C2=A0 =C2=A0 =C2=A0 }
>
> So far I know this event (coming with vpc_bit=3D1) is for Lenovo PM u=
tility
> on Windows. For most of the machine this event is not implemented in =
BIOS.
>
> Its ok that we just ignore the event.
>
> I think it will be better if we can let sparse-keymap or any upper le=
vel
> application to ignore all unknown scancode or KEY_UNKNOWN but so far =
I do
> not know a better way then this patch.

I think sparse_keymap_report_event() sends the KEY_UNKNOWN on purpose
as a debugging aid.

We should prevent the call to it in ideapad-laptop. I think the patch
is probably the simplest way.

  Thanks,
-kengyu
