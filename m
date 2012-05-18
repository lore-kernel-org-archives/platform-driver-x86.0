From: AceLan Kao <acelan.kao@canonical.com>
Subject: Re: [PATCH] asus-wmi: enable resume on lid open
Date: Fri, 18 May 2012 15:28:45 +0800
Message-ID: <CAMz9Wg8q5c=eroVD7obBaWLES4Cq8mNixLH5wmi16cSpYMxipw@mail.gmail.com>
References: <1337233684-9370-1-git-send-email-acelan.kao@canonical.com>
	<CAHR064hLYACoOcguo8pJcOmfXJ37fPcKpZVVk+Xo0p4C7hKC1A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:49218 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759258Ab2ERH2q convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 18 May 2012 03:28:46 -0400
Received: by wgbdr13 with SMTP id dr13so2502322wgb.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 May 2012 00:28:45 -0700 (PDT)
In-Reply-To: <CAHR064hLYACoOcguo8pJcOmfXJ37fPcKpZVVk+Xo0p4C7hKC1A@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentincj@iksaif.net>
Cc: platform-driver-x86@vger.kernel.org

Dear Corentin,

2012/5/18 Corentin Chary <corentincj@iksaif.net>:
> On Thu, May 17, 2012 at 7:48 AM, AceLan Kao <acelan.kao@canonical.com=
> wrote:
>> According to the ASUS WMI spec., to enable resume on lid open should
>> use the device ID(0x00120032), but it doesn't work indeed.
>
> I suppose this ASUS WMI spec isn't public at all ?
Ah, no, it's confidential. but it's in grey area I think :p

>
>> After discussing with ASUS' BIOS engineer, they say wake on lid open
>> doesn't have a uniq device ID(0x00120032) in the BIOS. It shares the=
 same
>> device ID with deep S3(0x00120031), and the deep S3(resume on lid op=
en)
>> is disable by default.
>>
>> It's reasonable to resume the system while opening the lid, so add i=
t
>> in the asus-wmi driver and tested the code on ASUS X100CH and ASUS 1=
015CX.
>
> If there there a way to know what the current settings is and if it's
> available ?
Yes, there is a way to get the device status, but it do no harm if the
device ID we queried is not exist.

> If yes, could a sysfs file could be added to configure the behavior ?
Where is the proper directory to contain it?
This feature is nice to have, for people will turn it on always.

Best regards,
AceLan Kao.

>
>> Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
>> ---
>> =A0drivers/platform/x86/asus-wmi.c | =A0 =A06 ++++++
>> =A01 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/=
asus-wmi.c
>> index beda7fc..30e978d 100644
>> --- a/drivers/platform/x86/asus-wmi.c
>> +++ b/drivers/platform/x86/asus-wmi.c
>> @@ -137,6 +137,9 @@ MODULE_LICENSE("GPL");
>> =A0/* Power */
>> =A0#define ASUS_WMI_DEVID_PROCESSOR_STATE 0x00120012
>>
>> +/* Deep S3 / Resume on LID open */
>> +#define ASUS_WMI_DEVID_LID =A0 =A0 =A0 =A0 =A0 =A0 0x00120031
>> +
>> =A0/* DSTS masks */
>> =A0#define ASUS_WMI_DSTS_STATUS_BIT =A0 =A0 =A0 0x00000001
>> =A0#define ASUS_WMI_DSTS_UNKNOWN_BIT =A0 =A0 =A00x00000002
>> @@ -1487,6 +1490,9 @@ static int asus_wmi_platform_init(struct asus_=
wmi *asus)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0asus_wmi_set_devstate(ASUS_WMI_DEVID_=
CWAP,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0asus->driver->quirks->wapf, NULL);
>>
>> + =A0 =A0 =A0 /* Enable resume on lid open */
>> + =A0 =A0 =A0 asus_wmi_set_devstate(ASUS_WMI_DEVID_LID, 1, &rv);
>> +
>> =A0 =A0 =A0 =A0return asus_wmi_sysfs_init(asus->platform_device);
>> =A0}
>>
>> --
>> 1.7.9.5
>>
>
>
>
> --
> Corentin Chary
> http://xf.iksaif.net
> --
> To unsubscribe from this list: send the line "unsubscribe platform-dr=
iver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html



--=20
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)
