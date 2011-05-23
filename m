From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 2/4] acer-wmi: check the existence of internal 3G device
 when set capability
Date: Mon, 23 May 2011 08:25:30 +0200
Message-ID: <BANLkTimLV6kujMT8j5vkhmR0OFKH+q6SMw@mail.gmail.com>
References: <1306020834-5186-1-git-send-email-jlee@novell.com>
	<1306020834-5186-2-git-send-email-jlee@novell.com>
	<1306020834-5186-3-git-send-email-jlee@novell.com>
	<201105220043.58857.carlos@strangeworlds.co.uk>
	<4DD8DF47020000230002CEBE@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:37336 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751934Ab1EWGZc convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 23 May 2011 02:25:32 -0400
Received: by ewy4 with SMTP id 4so1716626ewy.19
        for <platform-driver-x86@vger.kernel.org>; Sun, 22 May 2011 23:25:31 -0700 (PDT)
In-Reply-To: <4DD8DF47020000230002CEBE@novprvlin0050.provo.novell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joey Lee <jlee@novell.com>
Cc: carlos@strangeworlds.co.uk, dtor@mail.ru, mjg@redhat.com, trenn@suse.de, platform-driver-x86@vger.kernel.org

On Sun, May 22, 2011 at 2:02 AM, Joey Lee <jlee@novell.com> wrote:
> =E6=96=BC =E6=97=A5=EF=BC=8C2011-05-22 =E6=96=BC 00:43 +0100=EF=BC=8C=
Carlos Corbacho =E6=8F=90=E5=88=B0=EF=BC=9A
>> On Sunday 22 May 2011 00:33:52 Lee, Chun-Yi wrote:
>> > That will be better to check the existence of internal 3G device w=
hen
>> > we set threeg capability and generate killswitch for threeg. It ca=
n
>> > avoid userland access 3G rfkill but the machine doesn't have inter=
nal
>> > 3G device.
>> >
>> > Reference: bko#32862
>> > =C2=A0 =C2=A0 https://bugzilla.kernel.org/show_bug.cgi?id=3D32862
>> >
>> > Tested on Acer Aspire 8930G, Acer Travelmate 8572
>> >
>> > Tested-by: Hector Martin <hector@marcansoft.com>
>>
>> Acked-by: Carlos Corbacho <carlos@strangeworlds.co.uk>
>>
>> If you can now autodetect 3G and already have the relevant rfkill de=
vice, then
>> you should also rip out the remaining sysfs support for it as it's n=
o longer
>> necessary.
>>
>> -Carlos
>
> Got it!
> I will send another patch to remove threeg sysfs file.

I'm not sure you can drop sysfs files like that, as it will break the A=
BI.

Could you document acer-wmi in
Documentation/ABI/testing/sysfs-platform-acer-wmi.txt ?
This allows to check when a sysfs file was added, who use it, etc...

Thanks,

--=20
Corentin Chary
http://xf.iksaif.net
