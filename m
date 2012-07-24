From: AceLan Kao <acelan.kao@canonical.com>
Subject: Re: [PATCH 1/2] asus-wmi: record wlan status while controlling by
 user app
Date: Tue, 24 Jul 2012 15:11:02 +0800
Message-ID: <CAMz9Wg9O8y8oy3+P_3bwLXpKUTAesb1ZPFS9Mg=VhhD=9rR_gA@mail.gmail.com>
References: <1342754788-22880-1-git-send-email-acelan.kao@canonical.com>
	<CAHR064j1C=L9=tz2Hjf1N30YauEkPP+LmQXnpstbMPnCO_BS6A@mail.gmail.com>
	<CAMz9Wg95uOLPWHtBL5zAVWwNqE6Orj6cG8d0y0An8BtCAm1MFQ@mail.gmail.com>
	<CAHR064hq1NSDY+B1Lgbx03uTZhD3TqEkcj7AfSRg4saoo5oJoQ@mail.gmail.com>
	<CAMz9Wg_Bg6aWEd1tUZjKRMhd5cAT3ndSp6BDMNj4So=2+U_yVg@mail.gmail.com>
	<CAMz9Wg_r3CDuKU_VK_=OT39vQj0JWPZQnw3h2T+sw80sTiqAdA@mail.gmail.com>
	<CAHR064hpG77Hg1y2B4yBuhp=FwxuwOsHaWN5dhrtrk=1UWfG9w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:62583 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755086Ab2GXHLD (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 24 Jul 2012 03:11:03 -0400
Received: by pbbrp8 with SMTP id rp8so12221276pbb.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Jul 2012 00:11:02 -0700 (PDT)
In-Reply-To: <CAHR064hpG77Hg1y2B4yBuhp=FwxuwOsHaWN5dhrtrk=1UWfG9w@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentincj@iksaif.net>
Cc: platform-driver-x86@vger.kernel.org

2012/7/24 Corentin Chary <corentincj@iksaif.net>:
> On Tue, Jul 24, 2012 at 8:37 AM, AceLan Kao <acelan.kao@canonical.com> wrote:
>> Dear Corentin,
>>
>> From ASUS, for old machines, they use 0x00010012 to turn on/off the wlan led
>> but now use 0x00010002
>> So, 0x00010012 is reused to store the wlan status nowadays if wlan is
>> controlled by user.
>
> Do you have a way to know if this is the case or not in the current
> machine ? Using ASUS_WMI_METHODID_SPEC for example (returns the BIOS
> WMI version) ?
From the document I have, I don't see any command related to BIOS of
WMI version.
I'll let our PM to ask ASUS if we can determinate the machine is safe
to use 0x00010012.

>
> --
> Corentin Chary
> http://xf.iksaif.net
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)
