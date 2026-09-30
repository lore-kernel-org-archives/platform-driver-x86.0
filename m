Received: from mta0.migadu.com (out-68.mta0.migadu.com [91.218.175.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676D6443E28
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 19:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790797754; cv=none; b=V9O3iXMHDNOMY3SUqBa/MkhVQh6UKtt4vJVLUooUozBtm3RY53T1Qorug9EKzBBfQI6EmDkXaoxZEs20BzdMMQnKMY082MhbzvVfjaeI6jASn0+B/+eemvzaPfWErsyjWU/+uSp9qdWSK0oEbyA8QjArm8LoaNh4L2g8AsSFWI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790797754; c=relaxed/simple;
	bh=mHVdQrwbV+oto2b+d7Na3A9jsqY3AE8t2a435+M2sxE=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=YpY46KorylhsXpoEiV/ZdmhDULMnnYmDr8lhMkWfX/+EMAgS36C6K7VEbCwfJ3/HPcroVERA/wED3ebvwpMbB3PGFbXVo3cMJtDpAS8V+pcX9lqOojVJMNaaib4hYCTsIU3FWIY0ZmSG8KbmURuspHqJHdTTY4cVe5qSkn3nLRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=muI2ywLR; arc=none smtp.client-ip=91.218.175.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="muI2ywLR"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=mHVdQrwbV+oto2b+d7Na3A9jsqY3AE8t2a435+M2sxE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790797746; v=1; x=1791402546;
 b=muI2ywLRgvpJfKwXSE5SxBrl2JOe1h4KaIwlVhfy39TRmUy+7YCBWzFChSHUPoIjCD4Qu07S
 973nlbVIwTLNUCVYhRyZFkcKM+WmE9xirv75JLfPlwqo5FuNFYfd4PIlCIEtnZaRNTAY/faTY9Q
 ZQyv+5LI6+MNSK4kIhZ4D9r4=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ca2a008bd75205b8;
	Wed, 30 Sep 2026 19:49:05 +0000
X-Mizu-Trace-ID: ca2a008bd75205b8
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 30 Sep 2026 19:49:05 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Ilya Gladyshev" <ilya.gladyshev@linux.dev>
Message-ID: <759c1ed3a7733afdc3056de952edc4e776dc8b15@linux.dev>
TLS-Required: No
Subject: Re: [PATCH v1] platform/x86: redmi-wmi: add display-switch key 
 binding
To: "=?utf-8?B?0JDQvdGC0L7QvSDQmtCw0YDQsNGB0LXQsg==?="
 <uselessfire@gmail.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 ilpo.jarvinen@linux.intel.com, hansg@kernel.org, qby140326@gmail.com,
 W_Armin@gmx.de, vlku.milos.fun@gmail.com
In-Reply-To: <CAFsq4KDAC05VGx9nK-qTkViR4D2802KnkMC=a8BnwsqHEhSA4Q@mail.gmail.com>
References: <20260928221417.37875-1-ilya.gladyshev@linux.dev>
 <CAFsq4KDAC05VGx9nK-qTkViR4D2802KnkMC=a8BnwsqHEhSA4Q@mail.gmail.com>

On 9/30/26 02:42, =D0=90=D0=BD=D1=82=D0=BE=D0=BD =D0=9A=D0=B0=D1=80=D0=B0=
=D1=81=D0=B5=D0=B2 wrote:
> Tested-by: Anton Karasev <uselessfire@gmail.com>

Thanks!

> Tested on the reporting machine (Xiaomi Redmi Book Pro 16 2024, DMI
> XIAOMI/TM2309, BIOS RMAMT6B0P0B0B), kernel 7.2.7, by building redmi-wmi
> from mainline with this patch applied and loading it in place of the
> in-tree module.
> > Before: pressing the display-switch key gave "Unknown WMI event with
> payload 257" and no input event at all.
> > After: the key reports KEY_SWITCHVIDEOMODE. The keymap read back from=
 the
> device contains both forms now:
> >    scancode 0x101 -> 227
>    scancode 0x10101 -> 227
> > and the desktop reacts to the key (KDE opens its display-switch menu)=
.
> The other hotkeys are unaffected: 0x201 -> KEY_SELECTIVE_SCREENSHOT,
> 0x1b01 -> KEY_CONFIG, 0x11801/0x11901 -> KEY_ASSISTANT all still work,
> and nothing new showed up in dmesg.
> > Two notes that did not fit the fix, in case they are useful:
> > 1. The merge series "Merge redmi-wmi into bitland-mifs-wmi" (v6,
>     20260929134503.17249-1-qby140326@gmail.com) drops redmi-wmi, and it=
s
>     combined keymap only carries the long form:

Yes, if Mingyou's patch lands first, I will rebase my patch to target the
bitland-mifs-wmi driver.

>       { KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_RESERVED_1, 1, 0), {
> KEY_SWITCHVIDEOMODE } },
> >     With WMI_EVENT_RESERVED_1 =3D 1 and WMI_EVENT_TYPE_HOTKEY =3D 1 t=
hat expands
>     to 0x00010101; the short 0x00000101 has no entry there. If that ser=
ies
>     lands, this fix is lost again on this model. I am replying to that
>     thread separately.
>
> 2. Two payloads are still unhandled here: 0x00000901 and 0x00010901. Th=
ey
>     are not key presses -- the EC echoes back the Caps Lock LED state t=
hat
>     the host itself has just set (third byte 1 =3D on, 0 =3D off, the s=
ame
>     scheme as the Fn Lock events). Verified by switching between window=
s
>     with per-window keyboard layouts, which changes the LED without any=
one
>     touching the key: the events still arrive, 200-500 ms after the LED
>     change. On a system where Caps Lock switches the layout this is a
>     steady stream of dev_dbg lines; KE_IGNORE would silence it.

IMO, it is better to leave such keycodes unhandled. In practice, dev_dbg(=
)
is a no-op (it is a static key call), so there will be no noise in dmesg.

However, if some future board uses those payloads for something useful,
dev_dbg() will help extract them (just as in your case).

> Details and traces: https://bugzilla.kernel.org/show_bug.cgi?id=3D22206=
2
> > Thanks for the quick fix!
> > Anton
> > =D0=B2=D1=82, 29 =D1=81=D0=B5=D0=BD=D1=82. 2026=E2=80=AF=D0=B3. =D0=
=B2 01:14, Ilya Gladyshev <ilya.gladyshev@linux.dev>:
>>
>> As reported on the mailing list [1], on the Xiaomi Redmi Book Pro 16
>> 2024, the display-switch key emits 0x101 as a WMI payload. Add a
>> mapping for it to the keymap.
>>
>> [1]: https://lore.kernel.org/all/CAFsq4KBXCB=3DaK8ENHx__6+RcC-ybT7eKjc=
gsa3TgcJ54x-PLEg@mail.gmail.com/
>>
>> Reported-by: =D0=90=D0=BD=D1=82=D0=BE=D0=BD =D0=9A=D0=B0=D1=80=D0=B0=
=D1=81=D0=B5=D0=B2 <uselessfire@gmail.com>
>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D222062
>> Signed-off-by: Ilya Gladyshev <ilya.gladyshev@linux.dev>
>> ---
>>
>> This patch conflicts with the unification of redmi-wmi and
>> bitland-mifs-wmi [2]. However, that patch appears to be stuck for now,
>> so updating a single mapping in the old driver seems acceptable.
>>
>> Cc its author, Mingyou Chen.
>>
>> Also, I can only test that it doesn't break on my hardware, so any
>> additional testing is highly welcome.
>>
>> [2]: https://lore.kernel.org/all/20260816100813.300450-1-qby140326@gma=
il.com/
>> ---
>>   drivers/platform/x86/redmi-wmi.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/platform/x86/redmi-wmi.c b/drivers/platform/x86/r=
edmi-wmi.c
>> index cc82ef502002..155777bf90f3 100644
>> --- a/drivers/platform/x86/redmi-wmi.c
>> +++ b/drivers/platform/x86/redmi-wmi.c
>> @@ -22,6 +22,7 @@ static const struct key_entry redmi_wmi_keymap[] =3D=
 {
>>          {KE_KEY, 0x00000301,    {KEY_ALL_APPLICATIONS}},
>>          {KE_KEY, 0x00001b01,    {KEY_CONFIG}},
>>          {KE_KEY, 0x00011b01,    {KEY_CONFIG}},
>> +       {KE_KEY, 0x00000101,    {KEY_SWITCHVIDEOMODE}},
>>          {KE_KEY, 0x00010101,    {KEY_SWITCHVIDEOMODE}},
>>          {KE_KEY, 0x00001a01,    {KEY_REFRESH_RATE_TOGGLE}},
>>
>> --
>> 2.55.0
>>
