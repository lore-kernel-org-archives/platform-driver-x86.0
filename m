Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC52712BF0E
	for <platform-driver-x86@vger.kernel.org>; Wed, 31 Jan 2024 17:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706720874; cv=none; b=jHhC43BXz/gJNfAQsMDuatBWKmBPsFA4XWA48htVimJQUpIMnDQntBarhua9Hfa9rPh0qVDKdmBJr4pQf8e+JusUhjYptlrRTckC9QjIDCHPV57HNcHzXYa7/bb03rCYN+4aMh0zx4CfFWDq415SyuY3vNZm8vmuQFCJ2UxfXmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706720874; c=relaxed/simple;
	bh=bdCMe2TMTGliqeJjrYf2pxz8F3iSHeTfGWIP4e7voAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YcOUI7p0yYnPw0FtSrj6ApFtiPbsg+3GMXObA7m8m/SeUOUbB/HDaxaT31uNTUuofHCSGFKRGMBulwwn832vwsvL8JvCqhsleO/0Q6tv88ubk37W1nyRNO6p1je7qkn2beK8VUEGZN9he0LqUNUdG2FPwceB5Sq78dWtu6oSv8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=cWGAHbBv; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="cWGAHbBv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1706720867; x=1707325667; i=w_armin@gmx.de;
	bh=bdCMe2TMTGliqeJjrYf2pxz8F3iSHeTfGWIP4e7voAg=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=cWGAHbBvU9MWvlw7u2Fm8mCdDrOzSsmgBZ2c+hwVOuBhUXnFIJ3eBlglaqkkgyWI
	 enyoQW64213iWH0OPW6NY9QqsxRhCLYcwgf77Li/c7AXmFB0ESAY0syZqypBBOi8C
	 O075nCsONL6HkF0LmqzzPKJCs+Wxow3dkcdSPAAO6mRfWuCDax4r0y5/i2MfezZNm
	 d2i3FCQltmleAanWW4S3HiLXYXObnq5GYxhJGCzE96930bX9pwykGWu48Xh+HGO36
	 D5byfaxGzAGCal6DlD7xmjJ7sPPlVD72kg5qjD2g6M6T6b4w+3Sf0kM2TmvTClVod
	 4WZguY3xrlzj3E/JCg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.2.35] ([91.137.126.34]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M3lc9-1rUwwj3yLL-000wdK; Wed, 31
 Jan 2024 18:07:47 +0100
Message-ID: <4bd98f0f-831d-43e4-acfb-f8e65ca027fd@gmx.de>
Date: Wed, 31 Jan 2024 18:07:46 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] platform/x86: Add ACPI quickstart button driver
To: Dennis Nezic <dennisn@dennisn.mooo.com>
Cc: platform-driver-x86@vger.kernel.org
References: <20240131111641.4418-1-W_Armin@gmx.de> <ZbpqZqyIHuX0s5vz@panther>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <ZbpqZqyIHuX0s5vz@panther>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:xhrhsXYHFK5UYKyEuiqVi8uT6dflETDP/YKK2PWKXzCL9VuCGt9
 QP118o45fHdGFNGrFFWE2qQLhfURZT86In2I6Kj+eZj1R3NWkIsL5O9zobIusz1wh9qpSfW
 Zdbpsg7yqAjX28tBw2WoLDvIUc9zt+XhQj/pUu2OCg7n+i7Tr2Xlzq2GEZgE+iJsHWyIm3Y
 udFW0canbFkLANLfw1Gqg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:yM2RyPfiCd4=;9To/+e+u57zsP72/Vw02E8vvBZL
 +uQgNhINnD5YdAojv1UeI+M9n+3utJQVxSu1jRC6ZJPwQ2QCrQpTCdeZTUPNguGUWygRzrdzl
 db8a40lRijbo9tdENIJUWHlJHZAUgKd9jZNjMBrcTz5J3GgKH9kxlbhFwq5e6CAQxkI7ohbLJ
 PVlHu4q7FG3l5l0ObYKYoaD9x2omM/rx+O7sTQIzxde7uyOHHHmtg0pc2lRM99JPA+pcEYH4d
 dEAsEj8shuhGEdFgRnuKiSdvBxzNDSOc3kVrf1dEJnqk2YLoAoFBJN+lCVkyPpmyG2bi/eQQD
 M4FpSPdr98+0nS2prZky5UJkYEwsnXbGdl5rsum8HGP/rdMqyC7ntH7KMArCqDM8WU3nI+1MT
 BrnMn1ztWHOducqjy9JNRuTdb1DmpOTZi+ru3/lMbgPErtxXfevEtLeMggSS2LDq07u8/RdV3
 HtrubmWKSDmcwQ5bGJlye8Y/nT+1VYPQSvQ8d4cJpENt+KKi+rCG1yjQqE7W0wLsoT3EJSot6
 8mDNcE6TXFZCGO2Wfc6BKpyfJQuOW9s69AF+Axi9wmFiP4bJYhbzO+UqNMFR/yOdojmcBkpsS
 0a+iFEjSKMhlWs/fKXTfGU6CIH3W26CJtMIRrATNynJQzW866a4HcDeZhEkLsqdRNYp6P7/NB
 W1HVDZXV2pb3/9lizwfQ/skapd1K/hNNyD6yeagaXH8FYf2kmO1zj1kLuK+P4OptMgf5x4FCt
 nSeuK9mQPfwykXPJxKwdqkZ/+p+9X++kTBYpPI7xYbgVEwHdGHnS90xxoGbVDz9g2de4Ey9SX
 +KfnZwAkF3RaPWyph8qWOYd2jG51fBX0OIbdu3QDSEMaUwXCIFkshTrg9d89/KYLuXsyrcKZv
 Lu/aj2aYqF18jKg==

Am 31.01.24 um 16:42 schrieb Dennis Nezic:

> On 31 Jan 12:16, Armin Wolf wrote:
>> This patch series adds support for the ACPI PNP0C32 device as
>> proposed in 2022 by Arvid Norlander. The first patch adds support
>> for the device itself, while the second patch was taken from the
>> original series.
>>
>> Both patches are compile-tested only.
>>
>> Armin Wolf (1):
>>    platform/x86: Add ACPI quickstart button (PNP0C32) driver
>>
>> Arvid Norlander (1):
>>    platform/x86: toshiba_acpi: Add quirk for buttons on Z830
>>
>>   MAINTAINERS                         |   6 +
>>   drivers/platform/x86/Kconfig        |  13 ++
>>   drivers/platform/x86/Makefile       |   3 +
>>   drivers/platform/x86/quickstart.c   | 225 ++++++++++++++++++++++++++++
>>   drivers/platform/x86/toshiba_acpi.c |  36 ++++-
>>   5 files changed, 280 insertions(+), 3 deletions(-)
> No change here in HP Compaq land, except for the existence of this new
> Quickstart Button1, no activity is reported via my HP WMI hotkeys or the
> Quickstart Button, but rather through AT Translated Set 2 keyboard, as
> usual - the same behaviour as not having hp-wmi or quickstart (eg. if I
> unload the modules).
>
> [    2.517431] input: HP WMI hotkeys as /devices/virtual/input/input14
>
> [    4.397304] ACPI BIOS Error (bug): AE_AML_BUFFER_LIMIT, Index (0x000000032) is beyond end of object (length 0x32) (20230628/exoparg2-393)
> [    4.399581] ACPI Error: Aborting method \_SB.C27D.WQBE due to previous error (AE_AML_BUFFER_LIMIT) (20230628/psparse-529)
> [    4.425162] ACPI BIOS Error (bug): AE_AML_BUFFER_LIMIT, Index (0x000000032) is beyond end of object (length 0x32) (20230628/exoparg2-393)
> [    4.426760] ACPI Error: Aborting method \_SB.C27D.WQBE due to previous error (AE_AML_BUFFER_LIMIT) (20230628/psparse-529)
> [    4.593291] hp_bioscfg: Returned error 0x3, "Invalid command value/Feature not supported"
>
> [    4.606696] input: Quickstart Button 1 as /devices/platform/PNP0C32:00/input/input16
>
> /dev/input/event4 (AT Translated Set 2 keyboard) opened successfully
> /dev/input/event6 (HP WMI hotkeys) opened successfully
> /dev/input/event8 (Quickstart Button 1) opened successfully
>
>
> Maybe this HP documentation might help, there are ACPI tables and stuff
> mentioned around page 8 ... http://dennisn.mooo.com/stuff/direct-launch.pdf

The issue is that you machine does not support runtime button events on the quickstart button,
only wake events.

Can you check if you can now use the unresponsive button to wake the system?

Armin Wolf

