From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 3/3 v3] asus-nb-wmi: move WAPF variable into quirks_entry
Date: Mon, 19 Mar 2012 11:19:03 +0100
Message-ID: <CAHR064i9zeiDL=4ZbSf0aFpMzn+T4_h41m-ZBntBcoYTZScoVA@mail.gmail.com>
References: <1332138824-9673-1-git-send-email-acelan.kao@canonical.com>
	<1332138824-9673-3-git-send-email-acelan.kao@canonical.com>
	<CAHR064jE6auZFvkQYJ0hELcBaWNWDCv=CkOt2W4QZODDmpLowQ@mail.gmail.com>
	<CAMz9Wg9e6GVYi9THaKywzYK4_2gzWaCscH7f=yzwawBVOkE8zw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:44908 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750881Ab2CSKTF convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 19 Mar 2012 06:19:05 -0400
Received: by bkcik5 with SMTP id ik5so4122473bkc.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Mar 2012 03:19:03 -0700 (PDT)
In-Reply-To: <CAMz9Wg9e6GVYi9THaKywzYK4_2gzWaCscH7f=yzwawBVOkE8zw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: platform-driver-x86@vger.kernel.org

On Mon, Mar 19, 2012 at 10:46 AM, AceLan Kao <acelan.kao@canonical.com>=
 wrote:
> Dear Corentin,
>
> 2012/3/19 Corentin Chary <corentin.chary@gmail.com>:
>> On Mon, Mar 19, 2012 at 7:33 AM, AceLan Kao <acelan.kao@canonical.co=
m> wrote:
>>> Some models work better with different values of wapf, so move the
>>> variable into quriks_entry to make it more easy to give a specific
>>> value to different models.
>>>
>>> Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
>>> ---
>>> =C2=A0drivers/platform/x86/asus-nb-wmi.c | =C2=A0 =C2=A02 +-
>>> =C2=A0drivers/platform/x86/asus-wmi.c =C2=A0 =C2=A0| =C2=A0 =C2=A04=
 ++--
>>> =C2=A0drivers/platform/x86/asus-wmi.h =C2=A0 =C2=A0| =C2=A0 =C2=A02=
 +-
>>> =C2=A0drivers/platform/x86/eeepc-wmi.c =C2=A0 | =C2=A0 =C2=A02 +-
>>> =C2=A04 files changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/=
x86/asus-nb-wmi.c
>>> index 396dafc..9dd7b93 100644
>>> --- a/drivers/platform/x86/asus-nb-wmi.c
>>> +++ b/drivers/platform/x86/asus-nb-wmi.c
>>> @@ -53,7 +53,7 @@ MODULE_PARM_DESC(wapf, "WAPF value");
>>>
>>> =C2=A0static void asus_nb_wmi_quirks(struct asus_wmi_driver *driver=
)
>>> =C2=A0{
>>
>> Missing "driver->quirks =3D asus_unknown_quriks" (or similar). quirk=
s is
>> NULL here, and the module will segfault (unfortunatly I tried withou=
t
>> reading the code and it did :p).
>
> So sorry about that, I'm not aware of the loading sequence of the
> asus-nb-wmi module,

Of course, always harder without the hardware :).

> I thought it can see drivers->quirks which assigned from eeepc-wmi mo=
dule.
> If I allocate a new asus_unknown_quirks here, then it might be
> overwriten by eeepc-wmi later,
> if both of the modules will be loaded.
> Moreover, asus-nb-wmi should have the ability to access the
> asus_quirks defined in eeepc-wmi,
> so, the better way to do this is the detect_quirks function pointer
> should point to the same function
> in the eeepc-wmi.
> Do you have any good idea of this?

I think since I can test on both platforms and this should be done
ASAP, I should try to write the patch instead, I'll CC you when done.



--=20
Corentin Chary
http://xf.iksaif.net
