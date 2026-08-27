Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3893F106F;
	Thu, 27 Aug 2026 22:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787868310; cv=none; b=MRECpFUDCytW8ixDIdpefBhtd8q3iijdwEqrwB/IfrwmoBGXYbhb2qGQwTUXchzrzCXwbW6RctUUAD9Kd+qX6L33mFHHqocHp7/SsKyp0jZA8MH96zrfzYLERC+nIEpH7N7L0Nb2G77bR9jtgUvqNSpywSXe9s8d3fDFMJfrqfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787868310; c=relaxed/simple;
	bh=Igdk0KejztqX6FY7SxcpDqzWNSNcH3RR22hFp4qP1qY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U6HB0u1ED7UqDE9NCvF5Q5hyFWgJyZNiwvdVOXoySVlETi4awDHP0OBnphljeA9RsfK/XrHgJt7rg29Xh4jcKwbWCcu+zQA9vSO4uSc5qGVbDEBeCNNyYtPbNQVBBe5vs+sghRwIHgd6+pg02f6NiCFLz/rh5DwwXYMw2JiafpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=HibHhUVv; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="HibHhUVv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1787868287; x=1788473087; i=w_armin@gmx.de;
	bh=WsQghaJQPAliOzDI0k7Ty9NXb2t2/F2X+aXWRi9KAjo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=HibHhUVvhFdIn7qlblfYHr6MlKhPPtn+UsiiBbDt/hff8QWhQSgNo5lgvB9HLrzD
	 ifza2o73ye8yd5wQMxk9MrGyz9AfKyBZFYx9okVvWxYW3W3tvsimfeGENykTxyh9S
	 l6PVX+/FUM8CVZ/AlHxwKlMoqyeSZ167FiZjQCglaTK2qk4HJoZR7YV76XENR/HrF
	 EmS84ldM2sJRav//QuqGr7P73L0O7PHoFTjBCkpawpIy9GTonCstSqgRog4TbGXgl
	 n4Ndzf1r/BendYE8sUz/qLNhkQ0EvPtrjNdFFbbGlHy6b60VC258awfL/ilEsWmAE
	 MvixN0dpYX6b742+lg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N1fmq-1wt1BX29ea-00wy4m; Fri, 28
 Aug 2026 00:04:47 +0200
Message-ID: <34048264-7db9-46b2-b199-202ab6c09f4a@gmx.de>
Date: Fri, 28 Aug 2026 00:04:45 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH 0/5] platform/x86: bitland-mifs-wmi: MIFS v2
 firmware support (Xiaomi Book Pro 14 2026)
To: KentoNion <kento@kekto.ru>, platform-driver-x86@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mingyou Chen <qby140326@gmail.com>, Gladyshev Ilya <foxido@foxido.dev>,
 linux-kernel@vger.kernel.org, Nabil Danial <nabildanial.93@gmail.com>,
 Nika Krasnova <nika@nikableh.moe>
References: <20260728180944.51356-1-wolf109909@outlook.com>
 <e469fe6b-3293-473c-83db-529ac4502612@gmx.de>
 <20260826132922.179563-1-kento@kekto.ru>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260826132922.179563-1-kento@kekto.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:IUChQb03IzJ9wA8hFXYY2/dGBIRhn85uOxde7AWs/TFuJ4rwD0v
 cDzZ5Him7eSW2ZmLobOVbQggpK1O7gUfQH9oEQkL9hhEwxDwi89A+KBhY44CLLsgSWE4Aqq
 WX5H0nXOf6rZ3yvQl59qsJ/OuRCFKAn8nrQNbCJFuzMwiE4KKlimg8DVc1B/4yAjt2HvCgi
 96UtrMlUpYPZ3kYJ3Hz4A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ejhzFvH8fsQ=;HW45xVfzt0a0aKxSGHDxXdfHuSY
 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
 PFzLSzKkOvI=

Am 26.08.26 um 15:29 schrieb KentoNion:

> Hi Armin,
>
> On Thu, Jul 30, 2026 at 11:24:14 +0200, Armin Wolf wrote:
>> can you share the output of "acpidump" on your machine? Missing Lid
>> events usually indicate a deeper problem with the ACPI handling on a
>> given machine.
> Same product as 4/5 (Xiaomi Book Pro 14 2026, DMI board_name=TM2424,
> SKU TM2424-77080, BIOS XMAPT4B0P0707 03/12/2026). acpidump.dat.xz is
> 416K, too large for vger; I can send it off-list or put it on GitHub.
> Decoded DSDT excerpts below.
>
> ECON is declared External in the DSDT and is not defined in any of
> the 34 SSDTs. The only references are _STA on Q_EC, ADP1 and LID0:
>
>      External (ECON, IntObj)
>
>      Device (Q_EC)  /* _HID PNP0C09 */
>      {
>          Method (_STA, 0, NotSerialized)
>          {
>              If ((ECON == One))
>              {
>                  Return (0x0F)
>              }
>              Return (Zero)
>          }
>
>          OperationRegion (ERAM, SystemMemory, 0xFE0B0300, 0x0100)
>          /* LSTE is bit 0 at offset 0x14 of ERAM */
>
>          Method (_GPE, 0, NotSerialized)
>          {
>              If (ESPI)
>              {
>                  Local0 = 0x6E
>              }
>              Return (Local0)
>          }
>
>          Method (_Q0C, 0, NotSerialized)  /* lid close */
>          {
>              LIDS = Zero
>              ^^^GFX0.CLID = Zero
>              Notify (LID0, 0x80)
>          }
>
>          Method (_Q0D, 0, NotSerialized)  /* lid open */
>          {
>              LIDS = One
>              ^^^GFX0.CLID = 0x03
>              Notify (LID0, 0x80)
>          }
>
>          Device (LID0)  /* _HID PNP0C0D */
>          {
>              Method (_STA, 0, NotSerialized)
>              {
>                  If ((ECON == One))
>                  {
>                      Return (0x0F)
>                  }
>                  Return (Zero)
>              }
>          }
>      }
>
> So _STA would return 0 even if ECON existed and were zero, and today
> it AE_NOT_FOUNDs:
>
>    ACPI BIOS Error (bug): Could not resolve symbol
>    [\_SB.PC00.LPCB.Q_EC._STA.ECON], AE_NOT_FOUND
>    (same for Q_EC.ADP1._STA and Q_EC.LID0._STA)
>
> That does not stop the boot DSDT EC or the lid button on this BIOS:
>
>    ACPI: EC: EC started
>    ACPI: \_SB_.PC00.LPCB.Q_EC: Boot DSDT EC used to handle transactions
>    ACPI: EC: interrupt unblocked
>    ACPI: EC: event unblocked
>    ACPI: EC: GPE=0x6e
>    ACPI: \_SB_.PC00.LPCB.Q_EC: EC: Used to handle transactions and events
>    input: Lid Switch as .../PNP0C09:00/PNP0C0D:00/input/input0
>    ACPI: button: Lid Switch [LID0]
>
> LID0 is \_SB_.PC00.LPCB.Q_EC.LID0.
> /proc/acpi/button/lid/LID0/state reads "open" (SW_LID on event0).
> I have not yet captured a close/open pair under acpi_listen; I can
> if that is useful.
>
> 4/5's claim that "the ACPI EC driver therefore never binds" is not
> true here. Polling LSTE and evaluating _Q0C/_Q0D from bitland-mifs-wmi
> would be the wrong layer. I am not putting that in the TM2424
> follow-up on Mingyou's v5. The remaining bug is the missing ECON
> object used by _STA.
>
> Thanks,
> Kento

Interesting, i would suggest a BIOS update. Unfortunately this would likely require you
to also install Windows on this machine, because Xiaomi distributes BIOS updates thru
Windows Update :/.

Thanks,
Armin Wolf

