From: Corentin Chary <corentincj@iksaif.net>
Subject: Re: [PATCH 1/2] asus-wmi: record wlan status while controlling by
 user app
Date: Tue, 24 Jul 2012 08:46:28 +0200
Message-ID: <CAHR064hpG77Hg1y2B4yBuhp=FwxuwOsHaWN5dhrtrk=1UWfG9w@mail.gmail.com>
References: <1342754788-22880-1-git-send-email-acelan.kao@canonical.com>
	<CAHR064j1C=L9=tz2Hjf1N30YauEkPP+LmQXnpstbMPnCO_BS6A@mail.gmail.com>
	<CAMz9Wg95uOLPWHtBL5zAVWwNqE6Orj6cG8d0y0An8BtCAm1MFQ@mail.gmail.com>
	<CAHR064hq1NSDY+B1Lgbx03uTZhD3TqEkcj7AfSRg4saoo5oJoQ@mail.gmail.com>
	<CAMz9Wg_Bg6aWEd1tUZjKRMhd5cAT3ndSp6BDMNj4So=2+U_yVg@mail.gmail.com>
	<CAMz9Wg_r3CDuKU_VK_=OT39vQj0JWPZQnw3h2T+sw80sTiqAdA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:42987 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754286Ab2GXGq3 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 24 Jul 2012 02:46:29 -0400
Received: by lahd3 with SMTP id d3so599196lah.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Jul 2012 23:46:28 -0700 (PDT)
In-Reply-To: <CAMz9Wg_r3CDuKU_VK_=OT39vQj0JWPZQnw3h2T+sw80sTiqAdA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: platform-driver-x86@vger.kernel.org

On Tue, Jul 24, 2012 at 8:37 AM, AceLan Kao <acelan.kao@canonical.com> wrote:
> Dear Corentin,
>
> From ASUS, for old machines, they use 0x00010012 to turn on/off the wlan led
> but now use 0x00010002
> So, 0x00010012 is reused to store the wlan status nowadays if wlan is
> controlled by user.

Do you have a way to know if this is the case or not in the current
machine ? Using ASUS_WMI_METHODID_SPEC for example (returns the BIOS
WMI version) ?


-- 
Corentin Chary
http://xf.iksaif.net
