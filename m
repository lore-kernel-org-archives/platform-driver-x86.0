Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EE3AC433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Mar 2022 18:50:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240709AbiCPSvV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Mar 2022 14:51:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238021AbiCPSvV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Mar 2022 14:51:21 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F07EF6BDC1
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Mar 2022 11:50:04 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id b189so2615836qkf.11
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Mar 2022 11:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=kinBQ92i7AYgDCpxSEfZc5B1byENnLsFEOXSvuF1v0U=;
        b=CTnJ6+EEg9PUlF3ldalS0tgViF8FCeuybn93msbQXrXlxQVmB2+R6W7mYT/Zze/JmM
         FxSkJrWHd5YSfa6wKBKUBvQGZGDNViL6TJ9ugj9x1H2jAY0hjSgMI/HfIjAPRrK5fR8I
         DLruOaIa9EDTS1gxH/noidB/NscFNmlobI6k5KkX7+D4USy4QXsdxLzbbKibLxGjAf9c
         e4uMD7ZIdYHn2QlSLIiu0Y6Oa3g7tggrWC2r8LeJvWtVB/xJZ6HgLsmrfIfA/vBYpg10
         kkbGXKhj10nuMBTyZA/nstjmS/nYSFpQMqackZoyIn6pMfJRw9KiAV5nTd7oFhlfxpQg
         P+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=kinBQ92i7AYgDCpxSEfZc5B1byENnLsFEOXSvuF1v0U=;
        b=5c//6n3sKgVlF2FoT6J6lKq2AYrXeUZPANcx+F1viqrqxEBmI8GF+n96ZjgjaImOY9
         eU5Tlaz2WJSaaUGHnL/eZBvKxxyV/q7Lfz4hbkoCY9DAmcxi9pvrNqkDFSxSCuA70BMW
         OUmVwi54M5fFnHYMgRWEsHGKzlS3oxBtb0bS5IbtkxKELdOQGa3NaIWcKAmsUTrCQalZ
         hFdQzM1xjzVlMzpigX66k7zEv61wDWTEgkeAqvaivLoqFMXXKV//a6cvjHpUdihO5F49
         q3+Kmlgv9MPbODXIN5tfemLUXQpSi+C6N2vWCg81+9CYEpTMSGCtnChelKkRtzNY9svH
         WwcQ==
X-Gm-Message-State: AOAM530gcRYrs3gHkyLOmIDD4zKz/tuwp1jF4VXl3raNFTExBDqT0W80
        1+UwCLK2l1VAgeTj00bVl6RLykFnHCFYJ7qRYbRxPAKYd9ckmA==
X-Google-Smtp-Source: ABdhPJx4w1Hl59NtPhOhQGA73odgLIjjOnvVbxSUZSV+rucPsIguR+z3cIDyCopSxTFa8P0jYGbpRiFSfEHxMt1JMlU=
X-Received: by 2002:a05:620a:2a13:b0:67d:926a:ea8b with SMTP id
 o19-20020a05620a2a1300b0067d926aea8bmr840308qkp.130.1647456603892; Wed, 16
 Mar 2022 11:50:03 -0700 (PDT)
MIME-Version: 1.0
References: CAJOTRr7_hQ+DRav5VSYmBxwnEr5ZtZ5RbSvUBMidRAxehCDCsQ@mail.gmail.com <20220316184452.836313C4B1@lindbergh.monkeyblade.net>
In-Reply-To: <20220316184452.836313C4B1@lindbergh.monkeyblade.net>
From:   Alexandru Dinu <alex.dinu07@gmail.com>
Date:   Wed, 16 Mar 2022 20:49:27 +0200
Message-ID: <CAJOTRr4YzHO==FCsRF6kYkLs7MaUVc_RWEvcbnV9zn6-9946cw@mail.gmail.com>
Subject: Re: Undelivered Mail Returned to Sender
To:     platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

> I'll send out a v2 shortly: Alex, can you
> please retest when I do to make sure there aren't any regressions? None
> of these suggestions affect the core flow of how either of the
> workarounds work, so I'm not expecting any that wouldn't also reproduce
> on my EC backlight system that doesn't have either of these problems,
> but I can send you the updated version off-list first if you prefer.

It's ok either way. You can send me an updated version off-list.

> Alex, just FYI this was something that came to an AMD bug tracker and wan=
ted you to be aware there are W/A going into nvidia-wmi-ec-backlight for so=
me firmware problems with the mux.
> IIRC that was the original suspicion too on the bug reports.

Yes, thanks -- I followed this issue first:
https://gitlab.freedesktop.org/drm/amd/-/issues/1671.

> However I think it's still worth at least noting near the quirk in a comm=
ent
> what firmware version it was identified.  If later there is confirmation =
that
> a particular firmware version had fixed it the quirk can be adjusted to b=
e
> dropped.

That's a good tip. The laptop I tested this on (Lenovo Legion S7
15ACH6) originally shipped with:

UEFI: LENOVO v: HACN27WW date: 08/02/2021

There is an update to version HACN31WW (see lenovo support:
https://support.lenovo.com/ro/en/downloads/ds550201-bios-update-for-windows=
-10-64-bit-legion-s7-15ach6)
-- which I applied, however, the issue was not addressed, which seems
to be expected given the rather short /changelog:
HACN31WW
BIOS Notification    :
1. Fixed
 1) N/A.
2. Add
  1) Add BOE0A1C support with Cookie and DR Key
3. Modified
  1) Modify MinShortTerm & MinLongTerm PowerLimit value
EC Notification      :
1. Fixed
  1) None.
2. Add
   1) None.
3. Modified
  1)None.

> If you end up introducing a module parameter to try to activate these qui=
rks
> it might be viable to ask the folks in those issues to try the v2 of your=
 patch too
> when you're ready with the module parameter.

I posted a link to this mailing list to
https://gitlab.freedesktop.org/drm/amd/-/issues/1671, so people can be
aware and try to test.

Regards,
Alex

On Wed, 16 Mar 2022 at 20:45, Mail Delivery System
<MAILER-DAEMON@lindbergh.monkeyblade.net> wrote:
>
> This is the mail system at host lindbergh.monkeyblade.net.
>
> I'm sorry to have to inform you that your message could not
> be delivered to one or more recipients. It's attached below.
>
> For further assistance, please send mail to postmaster.
>
> If you do so, please include this problem report. You can
> delete your own text from the attached returned message.
>
>                    The mail system
>
> <platform-driver-x86@vger.kernel.org>: host 23.128.96.18[23.128.96.18] sa=
id:
>     550 5.7.1 Content-Policy reject msg: The message contains HTML subpar=
t,
>     therefore we consider it SPAM or Outlook Virus.  TEXT/PLAIN is accept=
ed.!
>     BF:<U 0.5>; S1353677AbiCPSqF (in reply to end of DATA command)
>
>
>
> ---------- Forwarded message ----------
> From: Alexandru Dinu <alex.dinu07@gmail.com>
> To: platform-driver-x86@vger.kernel.org
> Cc:
> Bcc:
> Date: Wed, 16 Mar 2022 20:44:13 +0200
> Subject: Re: Undelivered Mail Returned to Sender
> Hi,
>
> > I'll send out a v2 shortly: Alex, can you
> > please retest when I do to make sure there aren't any regressions? None
> > of these suggestions affect the core flow of how either of the
> > workarounds work, so I'm not expecting any that wouldn't also reproduce
> > on my EC backlight system that doesn't have either of these problems,
> > but I can send you the updated version off-list first if you prefer.
>
> It's ok either way. You can send me an updated version off-list.
>
> > Alex, just FYI this was something that came to an AMD bug tracker and w=
anted you to be aware there are W/A going into nvidia-wmi-ec-backlight for =
some firmware problems with the mux.
> > IIRC that was the original suspicion too on the bug reports.
>
> Yes, thanks -- I followed this issue first: https://gitlab.freedesktop.or=
g/drm/amd/-/issues/1671.
>
> > However I think it's still worth at least noting near the quirk in a co=
mment
> > what firmware version it was identified.  If later there is confirmatio=
n that
> > a particular firmware version had fixed it the quirk can be adjusted to=
 be
> > dropped.
>
> That's a good tip. The laptop I tested this on (Lenovo Legion S7 15ACH6) =
originally shipped with:
>
> UEFI: LENOVO v: HACN27WW date: 08/02/2021
>
> There is an update to version HACN31WW (see lenovo support: https://suppo=
rt.lenovo.com/ro/en/downloads/ds550201-bios-update-for-windows-10-64-bit-le=
gion-s7-15ach6) -- which I applied, however, the issue was not addressed, w=
hich seems to be expected given the rather short /changelog:
> HACN31WW
> BIOS Notification    :
> 1. Fixed
>  1) N/A.
> 2. Add
>   1) Add BOE0A1C support with Cookie and DR Key
> 3. Modified
>   1) Modify MinShortTerm & MinLongTerm PowerLimit value
> EC Notification      :
> 1. Fixed
>   1) None.
> 2. Add
>    1) None.
> 3. Modified
>   1)None.
>
> > If you end up introducing a module parameter to try to activate these q=
uirks
> > it might be viable to ask the folks in those issues to try the v2 of yo=
ur patch too
> > when you're ready with the module parameter.
>
> I posted a link to this mailing list to https://gitlab.freedesktop.org/dr=
m/amd/-/issues/1671, so people can be aware and try to test.
> Regards,
> Alex
>
> On Wed, 16 Mar 2022 at 20:40, Mail Delivery System <MAILER-DAEMON@lindber=
gh.monkeyblade.net> wrote:
>>
>> This is the mail system at host lindbergh.monkeyblade.net.
>>
>> I'm sorry to have to inform you that your message could not
>> be delivered to one or more recipients. It's attached below.
>>
>> For further assistance, please send mail to postmaster.
>>
>> If you do so, please include this problem report. You can
>> delete your own text from the attached returned message.
>>
>>                    The mail system
>>
>> <platform-driver-x86@vger.kernel.org>: host 23.128.96.18[23.128.96.18] s=
aid:
>>     550 5.7.1 Content-Policy reject msg: The message contains HTML subpa=
rt,
>>     therefore we consider it SPAM or Outlook Virus.  TEXT/PLAIN is accep=
ted.!
>>     BF:<U 0.499997>; S240813AbiCPSkN (in reply to end of DATA command)
>>
>>
>>
>> ---------- Forwarded message ----------
>> From: Alexandru Dinu <alex.dinu07@gmail.com>
>> To: "Limonciello, Mario" <Mario.Limonciello@amd.com>
>> Cc: Daniel Dadap <ddadap@nvidia.com>, "Barnab=C3=A1s P=C5=91cze" <pobrn@=
protonmail.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86=
@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, "markgross@kernel.o=
rg" <markgross@kernel.org>, "Deucher, Alexander" <Alexander.Deucher@amd.com=
>
>> Bcc:
>> Date: Wed, 16 Mar 2022 20:38:21 +0200
>> Subject: Re: [PATCH] nvidia-wmi-ec-backlight: Add workarounds for confus=
ed firmware
>> Hi,
>>
>>> > I'll send out a v2 shortly: Alex, can you
>>> please retest when I do to make sure there aren't any regressions? None
>>> of these suggestions affect the core flow of how either of the
>>> workarounds work, so I'm not expecting any that wouldn't also reproduce
>>> on my EC backlight system that doesn't have either of these problems,
>>> but I can send you the updated version off-list first if you prefer.
>>
>>
>> It's ok either way. You can send me an updated version off-list.
>>
>>> > Alex, just FYI this was something that came to an AMD bug tracker and=
 wanted you to be aware there are W/A going into nvidia-wmi-ec-backlight fo=
r some firmware problems with the mux.
>>> IIRC that was the original suspicion too on the bug reports.
>>
>>
>> Yes, thanks -- I followed this issue first: https://gitlab.freedesktop.o=
rg/drm/amd/-/issues/1671.
>>
>>> > However I think it's still worth at least noting near the quirk in a =
comment
>>> what firmware version it was identified.  If later there is confirmatio=
n that
>>> a particular firmware version had fixed it the quirk can be adjusted to=
 be
>>> dropped.
>>
>>
>> That's a good tip. The laptop I tested this on (Lenovo Legion S7 15ACH6)=
 originally shipped with:
>>
>> UEFI: LENOVO v: HACN27WW date: 08/02/2021
>>
>> There is an update to version HACN31WW (see lenovo support) -- which I a=
pplied, however, the issue was not addressed, which seems to be expected gi=
ven the rather short /changelog:
>> HACN31WW
>> BIOS Notification    :
>> 1. Fixed
>>  1) N/A.
>> 2. Add
>>   1) Add BOE0A1C support with Cookie and DR Key
>> 3. Modified
>>   1) Modify MinShortTerm & MinLongTerm PowerLimit value
>> EC Notification      :
>> 1. Fixed
>>   1) None.
>> 2. Add
>>    1) None.
>> 3. Modified
>>   1)None.
>>>
>>> > If you end up introducing a module parameter to try to activate these=
 quirks
>>> it might be viable to ask the folks in those issues to try the v2 of yo=
ur patch too
>>> when you're ready with the module parameter.
>>
>>
>> I posted a link to this mailing list to https://gitlab.freedesktop.org/d=
rm/amd/-/issues/1671, so people can be aware and try to test.
>>
>> Regards,
>> Alex
>>
>> On Wed, 16 Mar 2022 at 20:25, Limonciello, Mario <Mario.Limonciello@amd.=
com> wrote:
>>>
>>> [Public]
>>>
>>> > >
>>> > > IIRC this is the bug you want linked in the commit message:
>>> > >
>>> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg=
itla
>>> > b.freedesktop.org%2Fdrm%2Famd%2F-
>>> > %2Fissues%2F1671&amp;data=3D04%7C01%7CMario.Limonciello%40amd.com
>>> > %7C5559a4f23f46426add1808da0773b4ac%7C3dd8961fe4884e608e11a82d994
>>> > e183d%7C0%7C0%7C637830490785879396%7CUnknown%7CTWFpbGZsb3d8
>>> > eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3
>>> > D%7C3000&amp;sdata=3DP%2FBcLeN9rnjGam4kh68ZQUBAPIDM4G%2Bk1ukb5
>>> > k%2BRFVg%3D&amp;reserved=3D0
>>> >
>>> >
>>> > Ah, thanks. Most of the people on this bug seem like their problem wa=
s
>>> > that they didn't have the nvidia-wmi-ec-backlight driver, which also
>>> > didn't exist at the time the bug was filed. There is one person with =
a
>>> > newer comment reporting behavior that sounds like what this patch wor=
ks
>>> > around, and it is the same person who initially reported the issue to=
 me. :)
>>> >
>>> >
>>>
>>> Thanks for looking at those.
>>>
>>> > > But these two look possible to be the same root cause:
>>> > >
>>> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg=
itla
>>> > b.freedesktop.org%2Fdrm%2Famd%2F-
>>> > %2Fissues%2F1791&amp;data=3D04%7C01%7CMario.Limonciello%40amd.com
>>> > %7C5559a4f23f46426add1808da0773b4ac%7C3dd8961fe4884e608e11a82d994
>>> > e183d%7C0%7C0%7C637830490785879396%7CUnknown%7CTWFpbGZsb3d8
>>> > eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3
>>> > D%7C3000&amp;sdata=3DBv3lJJOG7BZxlvizh0L4gmHgakzjlJkl7TqGh9HTho4%3D
>>> > &amp;reserved=3D0
>>> >
>>> >
>>> > This one sounds like it might be a different issue, since it was
>>> > apparently working at some point with a kernel that didn't have the E=
C
>>> > backlight driver, and then not working on a newer kernel that also
>>> > didn't have the EC backlight driver. That is, of course, assuming
>>> > vanilla kernels: it is certainly possible that the EC backlight drive=
r
>>> > was backported.
>>> >
>>> > >
>>> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg=
itla
>>> > b.freedesktop.org%2Fdrm%2Famd%2F-
>>> > %2Fissues%2F1794&amp;data=3D04%7C01%7CMario.Limonciello%40amd.com
>>> > %7C5559a4f23f46426add1808da0773b4ac%7C3dd8961fe4884e608e11a82d994
>>> > e183d%7C0%7C0%7C637830490785879396%7CUnknown%7CTWFpbGZsb3d8
>>> > eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3
>>> > D%7C3000&amp;sdata=3DJfUhLPRIMVLypLXoAxKhpSw7WIN4M%2BS4Y48MQ
>>> > %2BzXdbk%3D&amp;reserved=3D0
>>> >
>>> >
>>> > This sounds like it could possibly be a simple case of not having the=
 EC
>>> > backlight driver. Notably, the backlight device exposed by the amdgpu
>>> > driver never works, in contrast to the system these workarounds are
>>> > targeting, where the amdgpu driver's backlight device initially works=
,
>>> > but then stops working after the first suspend/resume cycle (and the =
EC
>>> > backlight driver doesn't work initially, but then starts working afte=
r
>>> > suspend/resume).
>>>
>>> I guess when we see backlight issues on these A+N designs the checks sh=
ould be:
>>> 1) Are they supposed to be using the nvidia-wmi-ec-backlight driver?
>>> 2) Is their kernel new enough to have it?
>>> 3) Do they have the config enabled?
>>>
>>> Do you have a script or could you perhaps include some documentation we=
 can
>>> point people to check "1" so we don't always have to go tear apart ACPI=
 tables
>>> and make guesses?
>>>
>>> I guess it's something like grab _WDG and then parse it to see if there=
 is an entry.
>>>
>>> >
>>> >
>>> > >
>>> > > If you end up introducing a module parameter to try to activate the=
se
>>> > quirks
>>> > > it might be viable to ask the folks in those issues to try the v2 o=
f your patch
>>> > too
>>> > > when you're ready with the module parameter.
>>> > >
>>> >
>>> > v1 already has the quirks plumbed up to module parameters (those modu=
le
>>> > parameters just don't have corresponding sysfs entries). In any case,=
 I
>>> > only see one report between those bugs that sounds like the issue the=
se
>>> > WARs are meant to address, and since it's from the same reporter, it
>>> > sounds like we won't need to be adding any additional quirks table
>>> > entries right away.
>>> >
>>> >
>>> > >>
>>> > >>> Comments inline as well.
>>> > >>>
>>> > >>>> -----Original Message-----
>>> > >>>> From: Daniel Dadap <ddadap@nvidia.com>
>>> > >>>> Sent: Wednesday, March 16, 2022 10:11
>>> > >>>> To: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
>>> > >>>> Cc: platform-driver-x86@vger.kernel.org; Alexandru Dinu
>>> > >>>> <alex.dinu07@gmail.com>; Hans de Goede <hdegoede@redhat.com>;
>>> > >>>> markgross@kernel.org
>>> > >>>> Subject: Re: [PATCH] nvidia-wmi-ec-backlight: Add workarounds fo=
r
>>> > >>>> confused firmware
>>> > >>>>
>>> > >> [ ... ]
>>> > >>
>>> > >>
>>> > >>>> On 3/15/22 9:50 PM, Barnab=C3=A1s P=C5=91cze wrote:
>>> > >>>>>    [ ... ]
>>> > >>>>> Lastly, is it expected that these bugs will be properly fixed?
>>> > >>>> Possibly, but I wouldn't hold out hope for it for an issue at th=
is scale
>>> > >>>> on an already shipping system.
>>> > >>> This question I'm assuming was aimed at narrowing the quirk to on=
ly
>>> > >>> match certain FW versions or so.  If there is no certainty of whe=
n/if it
>>> > >>> will be fixed I agree with current direction.
>>> > >>> However I think it's still worth at least noting near the quirk i=
n a
>>> > comment
>>> > >>> what firmware version it was identified.  If later there is confi=
rmation
>>> > that
>>> > >>> a particular firmware version had fixed it the quirk can be adjus=
ted to be
>>> > >>> dropped.
>>> > >>>
>>> > >> Thanks, Mario. Sure, I'll make sure the firmware version this was =
first
>>> > >> observed in is noted.
>>> > >>
>>> > >>
