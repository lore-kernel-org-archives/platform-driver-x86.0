Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4742A32FA18
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 23:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790725411; cv=pass; b=Aj0hyy5j4rQm4Lp16DkffCw8LNy8ItUwL+Io0tKaDZtEQpNg8s/APTdeydC5924ZKEoD+TV/OPgBzXXNOe9xZkQD8o8SxWmf0N6DIp5aerQyvB+OVJjfwWPv13XlXtqRx3nL9/b1cW9grlEzgg+vB8sbyHCah+9dG8qqRHP0pAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790725411; c=relaxed/simple;
	bh=6aXiepdryswLWdjUJAf83FGpheewF6hkHjQ+QVvQxVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fGWrrqQ6fCBjzGRgaffpYG1JolHvK/VIzcYEO8qEYOlcVfnb00ZSVBpLVaLCltjhtuJgnquBmFd8MIwRKl+UYjPc0joacno8g7WuUueKgMtQS7qCn6bOpq4RQimtzj7Nba4RQv3xiE09z+2TGraw2fbJWuYhTTgT79y65c8GDIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=apt6wk0H; arc=pass smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="apt6wk0H"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2dbbf409b8so57360466b.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 16:43:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790725408; cv=none;
        d=google.com; s=arc-20260327;
        b=f2yzgTCB9UYZWrIpTgtdSJQrHS6kicN69+FWxALJR+y1UvmPHa2Jxyu3aWwAON7pPX
         oQGdGD9JCcfO0vQSF1exUdJEH9kFtuh2kGebxZ5rLE10e5acw0hKSX+eaGRF/DGgU3fa
         coaBghNcbkM4qr16GsSyESP1EkRG8jBQg5wjp724+5ccM9iwgRVuVj7EiV0TKm7/oRG9
         POZ4DdCAZbMoOFNMceKzE8djx3aXuWQCV2khvJYgSPXXITHhf8489yPu2JcBbB4hfp/Q
         0NaPt0VxKYOnTClmi080aKbhkPAywlBInz4T890pkwtL44fRlIN3ZkHgFFgFq6R0+gH7
         1pVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VXrI1Si0krSdvB0KIZ0EYedlpAqkobs74EgH44E/76M=;
        fh=6eUZpMRvY9SIimBCbK8UPa6KL61DZSUAA/Jne5u/SkQ=;
        b=DhfnVRAVBnf7rgtzRF1BgF98HkIHRqJcz5vKcmBgKqPPc8fWb9pQzJzt/zwd4aTVPa
         flgp03MQt8HmltQK0xeTyIjhFUXA5a2353ZCgSIi5fcOPQL91XWs5rYHyPjPri96gnOS
         2o7i+tVnXBNH5nj48nxJINPUN72mhfS6vU8fvUCRDT9QixXoStPAfVq56tfZ/PNsu224
         LqdTOSFek7r6nZyADj157DAPtmLYPuOrmvB43025WaAJA+yw00tGLlx7sKHMl/KNl+Is
         ZrVGN0m3NlZDVuWBudh128xRhvn1VhrjL+dbqEyV4p98Y+qYE/TtlI7UNRB6xguytXu1
         SWAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790725408; x=1791330208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VXrI1Si0krSdvB0KIZ0EYedlpAqkobs74EgH44E/76M=;
        b=apt6wk0H9CKUKqnUvTFHWB1EkTbZ+Nv7DZ5jVg3ugiRV4uQ/hmJjY6u4kELs5IHF+9
         GB/r7VmJ9vr2EGhbbkFtGVQLWS526IWBk+kiL9YSmoDBL/T60zGqic+i42P/oH6PBKcx
         tIZ2YtUZCoZPbBYgqtZQgCmWHS2kNWK+N1ol1LIigim6NtJvAx0Fcce3aXDq24OLEjBM
         7SNm9jCj9rY8UtyzoAuQE7gJ4ru49PMGUsqdZ14tP3fzVuTYMJBs21O3IwaGaE8csSBV
         hED2id4/bD/fWw2/q/aNWdJ2evjr8gjpg5X5nHneIRAioYFqJRKm7nKxOi9nklWHed4m
         DLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790725408; x=1791330208;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VXrI1Si0krSdvB0KIZ0EYedlpAqkobs74EgH44E/76M=;
        b=NX3B/+O/xPQWYMgCF8hVjtEnyVkbZS0kYavdLcR0iAlsAE+p/a4kb9pDcv5904qlml
         p0yg8gcbC0rZF0b77aHn93kdFBI56bfqMiofUtSIyXtkhTDfBELhv8C0DJkVD/HXVqFR
         m57nWsTH1miJFi4mAiG3k6KhU7jihPzVZNiL2gjqEjsa6EBDtFu56g7eGl00H8XHuhTN
         kMGcycM+HhRTjeLdTCJ/LhcQW3PRIHizoXEZnfOdPzH+r6ZzPD9AWZyvvY2wSm7ZUDhy
         RQIn8CfR8nd3XPylgKacyz5gCmwMMsq0Yc2jSf28yMFMuoMmfBiRH5VtFCaJhmfFfrEn
         9JcQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwNEOfbGl5ue6DagKUV1LUmjEBeqRIEv2+F4krpcEMDjHEz7Nd6sS+9P9QyEhClKv1hfzDNYba0kgIQaEMg2l6wHuq@vger.kernel.org
X-Gm-Message-State: AFuF++lQoI+FrEodzDwmZlSEXSVMbBCsBqE4dJV6NrohxV4Hq/p67F5g
	vZU9+P879uhU55RgvwKdeZpISa7WEeMPObu/dTh/dJ7jeAFG17DxQVJsMgK/zYs9ollF1JKgKIS
	HUdlN8EONhYeuXbHvM1XT6C/VE3+SMDU=
X-Gm-Gg: AYBFou2sBcVaD0TNzgzxTVFylK222fv6DNWuWRpmo5xj67aUUZDz6AIFAbk+qP3zRzc
	WO7vSKpgsCmqNiLUsxVriVnTZl0A1k5ieHGSuTQj7VLSHe/nM3gKuwQZEboLGj8RI9F43qrbYnK
	HP8PqAEfRVwrvbO1SpS4U9l9+b88+B1kRRCwvdKP+YTUx4+e0H9d8mnm8WqX5uMI17tEJwhItym
	bnmMjl/POshgCKgY/LHoLrIm+KIMQVnqmWS3JgsY3Zxcr2z0tTQMO08UsCtF/dn5RXhtBPBWi4H
	jYSNYOcfdF/n3oVo71XLci0J9P7aAlBM6tzHdrFHw9bjN36AKjRr8UwwZd+IG/RMYjn3nZbNfO5
	78s7RocFxkSfUqS3TXX6GPXW9ECUZmJel7L+1agA6VG0PwL/z
X-Received: by 2002:a17:907:7fa2:b0:c2d:c060:169 with SMTP id
 a640c23a62f3a-c2e1553aa65mr71244166b.8.1790725408402; Tue, 29 Sep 2026
 16:43:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928221417.37875-1-ilya.gladyshev@linux.dev>
In-Reply-To: <20260928221417.37875-1-ilya.gladyshev@linux.dev>
From: =?UTF-8?B?0JDQvdGC0L7QvSDQmtCw0YDQsNGB0LXQsg==?= <uselessfire@gmail.com>
Date: Wed, 30 Sep 2026 02:42:51 +0300
X-Gm-Features: AclHuK9MtCYgY_WC1SyKUrce1qIeR384cfWa87e1JPtMUrTRInyIFGMovTVNysQ
Message-ID: <CAFsq4KDAC05VGx9nK-qTkViR4D2802KnkMC=a8BnwsqHEhSA4Q@mail.gmail.com>
Subject: Re: [PATCH v1] platform/x86: redmi-wmi: add display-switch key binding
To: Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	ilpo.jarvinen@linux.intel.com, hansg@kernel.org, qby140326@gmail.com, 
	W_Armin@gmx.de, vlku.milos.fun@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested-by: Anton Karasev <uselessfire@gmail.com>

Tested on the reporting machine (Xiaomi Redmi Book Pro 16 2024, DMI
XIAOMI/TM2309, BIOS RMAMT6B0P0B0B), kernel 7.2.7, by building redmi-wmi
from mainline with this patch applied and loading it in place of the
in-tree module.

Before: pressing the display-switch key gave "Unknown WMI event with
payload 257" and no input event at all.

After: the key reports KEY_SWITCHVIDEOMODE. The keymap read back from the
device contains both forms now:

  scancode 0x101 -> 227
  scancode 0x10101 -> 227

and the desktop reacts to the key (KDE opens its display-switch menu).
The other hotkeys are unaffected: 0x201 -> KEY_SELECTIVE_SCREENSHOT,
0x1b01 -> KEY_CONFIG, 0x11801/0x11901 -> KEY_ASSISTANT all still work,
and nothing new showed up in dmesg.

Two notes that did not fit the fix, in case they are useful:

1. The merge series "Merge redmi-wmi into bitland-mifs-wmi" (v6,
   20260929134503.17249-1-qby140326@gmail.com) drops redmi-wmi, and its
   combined keymap only carries the long form:

     { KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_RESERVED_1, 1, 0), {
KEY_SWITCHVIDEOMODE } },

   With WMI_EVENT_RESERVED_1 =3D 1 and WMI_EVENT_TYPE_HOTKEY =3D 1 that exp=
ands
   to 0x00010101; the short 0x00000101 has no entry there. If that series
   lands, this fix is lost again on this model. I am replying to that
   thread separately.

2. Two payloads are still unhandled here: 0x00000901 and 0x00010901. They
   are not key presses -- the EC echoes back the Caps Lock LED state that
   the host itself has just set (third byte 1 =3D on, 0 =3D off, the same
   scheme as the Fn Lock events). Verified by switching between windows
   with per-window keyboard layouts, which changes the LED without anyone
   touching the key: the events still arrive, 200-500 ms after the LED
   change. On a system where Caps Lock switches the layout this is a
   steady stream of dev_dbg lines; KE_IGNORE would silence it.

Details and traces: https://bugzilla.kernel.org/show_bug.cgi?id=3D222062

Thanks for the quick fix!

Anton

=D0=B2=D1=82, 29 =D1=81=D0=B5=D0=BD=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 01:1=
4, Ilya Gladyshev <ilya.gladyshev@linux.dev>:
>
> As reported on the mailing list [1], on the Xiaomi Redmi Book Pro 16
> 2024, the display-switch key emits 0x101 as a WMI payload. Add a
> mapping for it to the keymap.
>
> [1]: https://lore.kernel.org/all/CAFsq4KBXCB=3DaK8ENHx__6+RcC-ybT7eKjcgsa=
3TgcJ54x-PLEg@mail.gmail.com/
>
> Reported-by: =D0=90=D0=BD=D1=82=D0=BE=D0=BD =D0=9A=D0=B0=D1=80=D0=B0=D1=
=81=D0=B5=D0=B2 <uselessfire@gmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D222062
> Signed-off-by: Ilya Gladyshev <ilya.gladyshev@linux.dev>
> ---
>
> This patch conflicts with the unification of redmi-wmi and
> bitland-mifs-wmi [2]. However, that patch appears to be stuck for now,
> so updating a single mapping in the old driver seems acceptable.
>
> Cc its author, Mingyou Chen.
>
> Also, I can only test that it doesn't break on my hardware, so any
> additional testing is highly welcome.
>
> [2]: https://lore.kernel.org/all/20260816100813.300450-1-qby140326@gmail.=
com/
> ---
>  drivers/platform/x86/redmi-wmi.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/platform/x86/redmi-wmi.c b/drivers/platform/x86/redm=
i-wmi.c
> index cc82ef502002..155777bf90f3 100644
> --- a/drivers/platform/x86/redmi-wmi.c
> +++ b/drivers/platform/x86/redmi-wmi.c
> @@ -22,6 +22,7 @@ static const struct key_entry redmi_wmi_keymap[] =3D {
>         {KE_KEY, 0x00000301,    {KEY_ALL_APPLICATIONS}},
>         {KE_KEY, 0x00001b01,    {KEY_CONFIG}},
>         {KE_KEY, 0x00011b01,    {KEY_CONFIG}},
> +       {KE_KEY, 0x00000101,    {KEY_SWITCHVIDEOMODE}},
>         {KE_KEY, 0x00010101,    {KEY_SWITCHVIDEOMODE}},
>         {KE_KEY, 0x00001a01,    {KEY_REFRESH_RATE_TOGGLE}},
>
> --
> 2.55.0
>
