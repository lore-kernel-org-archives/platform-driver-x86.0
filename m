From: Mario Limonciello <mario_limonciello@dell.com>
Subject: Re: [PATCH v5 4/5] dell-wmi: Support new hotkeys on the XPS 13 9350
 (Skylake)
Date: Mon, 15 Feb 2016 11:26:24 -0600
Message-ID: <56C20A40.6010807@dell.com>
References: <cover.1455553470.git.luto@kernel.org>
 <6492bf46d1042b6d6c80ade8792327797e668d09.1455553470.git.luto@kernel.org>
 <201602151820.56085@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ausc60pc101.us.dell.com ([143.166.85.206]:42060 "EHLO
	ausc60pc101.us.dell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751914AbcBORat (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 15 Feb 2016 12:30:49 -0500
In-Reply-To: <201602151820.56085@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, Andy Lutomirski <luto@kernel.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Jon Eyolfson <jon@eyl.io>, Matthew Garrett <mjg59@srcf.ucam.org>



On 02/15/2016 11:20 AM, Pali Roh=C3=A1r wrote:
> On Monday 15 February 2016 17:32:36 Andy Lutomirski wrote:
>> +       /* Stealth mode toggle */
>> +       { KE_IGNORE, 0x155, { KEY_RESERVED } },
> Hi! Just one question, what does this "Stealth mode" means and what t=
his=20
> toggle key/button doing?
>
> I would propose for Laptops manufactures to revert back normal=20
> nonchiclet keyboard with full 105 normal keys (with F1-F12) instead=20
> inventing such useless and crappy/funny names for keys/buttons on=20
> laptops which replace PgUP/PgDown/SysRq and etc...
>
Pali,

Stealth mode will "disable all lights and sounds".  The event is for
notification only.  The actual change is performed by a combination of
the BIOS and EC.=20

There is also a BIOS setting that disables the hotkey from doing anythi=
ng.

Thanks,
