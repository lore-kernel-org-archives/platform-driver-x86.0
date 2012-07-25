From: Corentin Chary <corentincj@iksaif.net>
Subject: Re: [PATCH 1/2] asus-wmi: record wlan status while controlling by
 user app
Date: Wed, 25 Jul 2012 12:31:42 +0200
Message-ID: <CAHR064jps5tpXtz_1MyVsdFRN6REDumOP-3RpzoBGzk5MgZtkw@mail.gmail.com>
References: <1342754788-22880-1-git-send-email-acelan.kao@canonical.com>
	<CAHR064j1C=L9=tz2Hjf1N30YauEkPP+LmQXnpstbMPnCO_BS6A@mail.gmail.com>
	<CAMz9Wg95uOLPWHtBL5zAVWwNqE6Orj6cG8d0y0An8BtCAm1MFQ@mail.gmail.com>
	<CAHR064hq1NSDY+B1Lgbx03uTZhD3TqEkcj7AfSRg4saoo5oJoQ@mail.gmail.com>
	<CAMz9Wg_Bg6aWEd1tUZjKRMhd5cAT3ndSp6BDMNj4So=2+U_yVg@mail.gmail.com>
	<CAMz9Wg_r3CDuKU_VK_=OT39vQj0JWPZQnw3h2T+sw80sTiqAdA@mail.gmail.com>
	<CAHR064hpG77Hg1y2B4yBuhp=FwxuwOsHaWN5dhrtrk=1UWfG9w@mail.gmail.com>
	<CAMz9Wg9O8y8oy3+P_3bwLXpKUTAesb1ZPFS9Mg=VhhD=9rR_gA@mail.gmail.com>
	<CAHR064iwxYPKH0-uuhVMrMXDaTqb84VLHQ8Xref1FJa6J0fNbg@mail.gmail.com>
	<CAMz9Wg8dS0rDb8-ab4JfqBVag6MMWYcx+3FgSKWi3HKaQiByMw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:37151 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756117Ab2GYKbn (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 25 Jul 2012 06:31:43 -0400
Received: by lbbgm6 with SMTP id gm6so526301lbb.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Jul 2012 03:31:42 -0700 (PDT)
In-Reply-To: <CAMz9Wg8dS0rDb8-ab4JfqBVag6MMWYcx+3FgSKWi3HKaQiByMw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: platform-driver-x86@vger.kernel.org

On Wed, Jul 25, 2012 at 11:11 AM, AceLan Kao <acelan.kao@canonical.com> wrote:
> Dear Corentin,
>
> From ASUS, 0x43455053 is not used in asus-nb, so we can't read the
> BIOS info from that id.
> And ASUS say that we don't have to care about the BIOS version,
> 0x00010012 will be used to store the wlan status if
> ASUS_WMI_DSTS_USER_BIT is set.
> And old machines won't set ASUS_WMI_DSTS_USER_BIT bit.
>

Ok then. I'll be happy to review the fixed patch (static variable,
check in init, etc.).
Could you provide the output of updated dmesg | grep asus on this machine too ?
Thanks,

-- 
Corentin Chary
http://xf.iksaif.net
