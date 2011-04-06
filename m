From: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] acer-wmi: Fix WMI ID
Date: Wed, 6 Apr 2011 13:07:17 +0200
Message-ID: <BANLkTikotynqMi30CRvX-t2cLCp2qOaxVg@mail.gmail.com>
References: <4D802D570200002300029DA0@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yi0-f46.google.com ([209.85.218.46]:39933 "EHLO
	mail-yi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750807Ab1DFLH6 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 6 Apr 2011 07:07:58 -0400
Received: by yia27 with SMTP id 27so533206yia.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 06 Apr 2011 04:07:57 -0700 (PDT)
In-Reply-To: <4D802D570200002300029DA0@novprvlin0050.provo.novell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joey Lee <jlee@novell.com>
Cc: carlos@strangeworlds.co.uk, platform-driver-x86@vger.kernel.org

2011/3/15 Joey Lee <jlee@novell.com>:
> Hi Pali,
>
> =E6=96=BC =E6=97=A5=EF=BC=8C2011-02-27 =E6=96=BC 12:06 +0100=EF=BC=8C=
Pali Roh=C3=A1r =E6=8F=90=E5=88=B0=EF=BC=9A
>> This patch change WMI ID to upper characters. With this patch module
>> acer-wmi is automatically loaded when WMI ID is detected.
>>
>> Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
>> Tested-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
>>
>> --- a/drivers/platform/x86/acer-wmi.c 2011-02-27 11:53:50.000000000 =
+0100
>> +++ b/drivers/platform/x86/acer-wmi.c 2011-02-27 11:58:30.000000000 =
+0100
>> @@ -84,8 +84,8 @@ MODULE_LICENSE("GPL");
>> =C2=A0 */
>> =C2=A0#define AMW0_GUID1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "67C3371=
D-95A3-4C37-BB61-DD47B491DAAB"
>> =C2=A0#define AMW0_GUID2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "431F16E=
D-0C2B-444C-B267-27DEB140CF9C"
>> -#define WMID_GUID1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "6AF4F258-B40=
1-42fd-BE91-3D4AC2D7C0D3"
>> -#define WMID_GUID2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "95764E09-FB5=
6-4e83-B31A-37761F60994A"
>> +#define WMID_GUID1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "6AF4F258-B40=
1-42FD-BE91-3D4AC2D7C0D3"
>
> WMID_GUID1 already fixed by Matthew's patch, don't need fix again.
>
>
>> +#define WMID_GUID2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "95764E09-FB5=
6-4E83-B31A-37761F60994A"
>> =C2=A0#define WMID_GUID3 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "61EF69E=
A-865C-4BC3-A502-A0DEBA0CB531"
>>
>> =C2=A0/*
>> @@ -94,7 +94,7 @@ MODULE_LICENSE("GPL");
>> =C2=A0#define ACERWMID_EVENT_GUID "676AA15E-6A47-4D9F-A2CC-1E6D18D14=
026"
>>
>> =C2=A0MODULE_ALIAS("wmi:67C3371D-95A3-4C37-BB61-DD47B491DAAB");
>> -MODULE_ALIAS("wmi:6AF4F258-B401-42fd-BE91-3D4AC2D7C0D3");
>> +MODULE_ALIAS("wmi:6AF4F258-B401-42FD-BE91-3D4AC2D7C0D3");
>
> The same, here.
>
>> =C2=A0MODULE_ALIAS("wmi:676AA15E-6A47-4D9F-A2CC-1E6D18D14026");
>>
>> =C2=A0enum acer_wmi_event_ids {
>>
>>
>
> I am not sure miss your any patch, but looks like you still send out =
the
> same change.
> Please git pull your platform-drivers-x86/master repo, you will look =
the
> newest acer-wmi source code.
>
>
> Thank's a lot!
> Joey Lee
>
>

Yes. I had bad git repo, so I generated bad diffs. I see that all
patches are commited now. Thanks.

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
