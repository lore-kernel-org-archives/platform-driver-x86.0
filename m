From: Axel Lin <axel.lin@gmail.com>
Subject: Re: [PATCH] compal-laptop/fujitsu-laptop/msi-laptop: make
	dmi_check_cb
Date: Tue, 6 Jul 2010 10:09:45 +0800
Message-ID: <AANLkTikVhgjsUrC472itOVlyZuBNXlpkJR5ATu4Eh6AV@mail.gmail.com>
References: <1278061453.15256.1.camel@mola> <201007050712.o657CpjO028121@turbo.physics.adelaide.edu.au>
Reply-To: axel.lin@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201007050712.o657CpjO028121@turbo.physics.adelaide.edu.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@physics.adelaide.edu.au>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Cezary Jackiewicz <cezary.jackiewicz@gmail.com>, Matthew Garrett <mjg@redhat.com>, Tim Gardner <tim.gardner@canonical.com>, Mario Limonciello <Mario_Limonciello@dell.com>, Richard Purdie <rpurdie@linux.intel.com>, Michal Marek <mmarek@suse.cz>, Len Brown <len.brown@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Stefani Seibold <stefani@seibold.net>, Andi Kleen <ak@linux.intel.com>, Lennart Poettering <mzxreary@0pointer.de>, Lee Chun-Yi <jlee@novell.com>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

2010/7/5 Jonathan Woithe <jwoithe@physics.adelaide.edu.au>:
> Is there no possibility of some other matching function existing afte=
r ours
> in the tree which might need to also be called? =A0If so, this change=
 would
> prevent that.

hi Jonathan,

I checked the implementation of dmi_check_system() and the useage cases=
 in
compal-laptop/fujitsu-laptop/msi-laptop, it should be no problem with
this change.

In compal-laptop and msi-laptop, we call dmi_check_system() to
identify the laptop model.
(The callback simply print the identified laptop model)
It should have zero or exactly one successful match.

In fujitsu-laptop, we call dmi_check_system() to identify the laptop
model and set parameters accordingly.
The callback print the identified laptop model and set parameters
(use_alt_lcd_levels / fujitsu->keycode[1|2|3|4|5] ).
It should have zero or exactly one successful match.
If it has some other matching function with successful match, then
current implementation
is buggy anyway because new successful matches will override the
fujitsu->keycode[1|2|3|4|5]
parameters.

Regards,
Axel

>
> Regards
> =A0jonathan
>
>> dmi_check_system() walks the table running matching functions until =
someone
>> returns non zero or we hit the end.
>>
>> This patch makes dmi_check_cb to return 1 so dmi_check_system() retu=
rn
>> immediately when a match is found.
>>
>> Signed-off-by: Axel Lin <axel.lin@gmail.com>
>> ---
>> =A0drivers/platform/x86/compal-laptop.c =A0| =A0 =A02 +-
>> =A0drivers/platform/x86/fujitsu-laptop.c | =A0 =A06 +++---
>> =A0drivers/platform/x86/msi-laptop.c =A0 =A0 | =A0 =A02 +-
>> =A03 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/platform/x86/compal-laptop.c b/drivers/platform=
/x86/compal-laptop.c
>> index 71ff154..dc31a08 100644
>> --- a/drivers/platform/x86/compal-laptop.c
>> +++ b/drivers/platform/x86/compal-laptop.c
>> @@ -190,7 +190,7 @@ static int dmi_check_cb(const struct dmi_system_=
id *id)
>> =A0 =A0 =A0 printk(KERN_INFO "compal-laptop: Identified laptop model=
 '%s'.\n",
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 id->ident);
>>
>> - =A0 =A0 return 0;
>> + =A0 =A0 return 1;
>> =A0}
>>
>> =A0static struct dmi_system_id __initdata compal_dmi_table[] =3D {
>> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platfor=
m/x86/fujitsu-laptop.c
>> index dab1a0e..1859d7f 100644
>> --- a/drivers/platform/x86/fujitsu-laptop.c
>> +++ b/drivers/platform/x86/fujitsu-laptop.c
>> @@ -603,7 +603,7 @@ static int dmi_check_cb_s6410(const struct dmi_s=
ystem_id *id)
>> =A0 =A0 =A0 dmi_check_cb_common(id);
>> =A0 =A0 =A0 fujitsu->keycode1 =3D KEY_SCREENLOCK; =A0 =A0 /* "Lock" =
*/
>> =A0 =A0 =A0 fujitsu->keycode2 =3D KEY_HELP; =A0 /* "Mobility Center"=
 */
>> - =A0 =A0 return 0;
>> + =A0 =A0 return 1;
>> =A0}
>>
>> =A0static int dmi_check_cb_s6420(const struct dmi_system_id *id)
>> @@ -611,7 +611,7 @@ static int dmi_check_cb_s6420(const struct dmi_s=
ystem_id *id)
>> =A0 =A0 =A0 dmi_check_cb_common(id);
>> =A0 =A0 =A0 fujitsu->keycode1 =3D KEY_SCREENLOCK; =A0 =A0 /* "Lock" =
*/
>> =A0 =A0 =A0 fujitsu->keycode2 =3D KEY_HELP; =A0 /* "Mobility Center"=
 */
>> - =A0 =A0 return 0;
>> + =A0 =A0 return 1;
>> =A0}
>>
>> =A0static int dmi_check_cb_p8010(const struct dmi_system_id *id)
>> @@ -620,7 +620,7 @@ static int dmi_check_cb_p8010(const struct dmi_s=
ystem_id *id)
>> =A0 =A0 =A0 fujitsu->keycode1 =3D KEY_HELP; =A0 /* "Support" */
>> =A0 =A0 =A0 fujitsu->keycode3 =3D KEY_SWITCHVIDEOMODE; =A0 =A0 =A0 =A0=
/* "Presentation" */
>> =A0 =A0 =A0 fujitsu->keycode4 =3D KEY_WWW; =A0 =A0/* "Internet" */
>> - =A0 =A0 return 0;
>> + =A0 =A0 return 1;
>> =A0}
>>
>> =A0static struct dmi_system_id fujitsu_dmi_table[] =3D {
>> diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x8=
6/msi-laptop.c
>> index afd762b..c67a74c 100644
>> --- a/drivers/platform/x86/msi-laptop.c
>> +++ b/drivers/platform/x86/msi-laptop.c
>> @@ -434,7 +434,7 @@ static int dmi_check_cb(const struct dmi_system_=
id *id)
>> =A0{
>> =A0 =A0 =A0 printk(KERN_INFO "msi-laptop: Identified laptop model '%=
s'.\n",
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0id->ident);
>> - =A0 =A0 return 0;
>> + =A0 =A0 return 1;
>> =A0}
>>
>> =A0static struct dmi_system_id __initdata msi_dmi_table[] =3D {
>> --
>> 1.5.4.3
>>
>>
>>
>
>
> --
> * Jonathan Woithe =A0 =A0jwoithe@physics.adelaide.edu.au =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*
> * =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0http://www.physics.adelaide.=
edu.au/~jwoithe =A0 =A0 =A0 =A0 =A0 =A0*
> ***------------------------------------------------------------------=
-----***
> ** "Time is an illusion; lunchtime doubly so" =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0**
> * =A0"...you wouldn't recognize a subtle plan if it painted itself pu=
rple and *
> * =A0 danced naked on a harpsichord singing 'subtle plans are here ag=
ain'" =A0 =A0*
>
