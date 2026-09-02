Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4114AA1FA
	for <platform-driver-x86@vger.kernel.org>; Wed,  2 Sep 2026 16:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788367396; cv=pass; b=teLwV/4psRvbm+rJlo/OLOUQJpHm0Nj6urXW7YzpLOa3hnApdOFptNYqjV82Yp35SSluZjCX7/1r8SJk3TX3mbnEDyGc6hnaNdgs4lEm9UzueDz6QsPU6XBFdiyaBl1rHTB/ffNTcwMg8sjjlnzQ5PsmnkBaGAxiwKP3mlP7rss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788367396; c=relaxed/simple;
	bh=gPS8xPpxftd5m0qUB0pJRUJAoUIhG5xIYoObHIgKCXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JMdjoqLO56fo86rxA+1lB3EAyx/E2zOZBCSiotINBQT4+4HpJxoabuH0CTYgIHwEsytCb9xXT0dAnqxU1RzgonHjqe1+G5w/gITZetvojpKM1MTzD3xUQbpu/x8MORadB0guZH3opqy88H2zffIpjp6NBxoRgj8y0Sgy09VUKqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vg44FnCl; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vg44FnCl"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a5e971c970so136520a12.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 02 Sep 2026 09:43:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788367391; cv=none;
        d=google.com; s=arc-20260327;
        b=qYfXLiFwrNMvQwmoFz5mFkZREFUA3RXYXka+qWYRal0ow1BxNZc+DdnArDJ8H+DUjQ
         0YXYFQnaIjqI8MvQk72NnA4OX3HAcdSQBpFNGwn+X81pokuTuxVa/POD7/ErIQIHJWge
         /Z+A0xDSw0Dg5L8EWli46CipNBgn067mpBTuPWM6EfeTdG6bgi2sIuoykwSpLBxaYLqw
         rhEjoNVuUiVnEQwsgsq5rKQXrjv8OiwTltF4lwOer3tSMZffEhCgaFhb+nN80vlvA7Ee
         19jrYHKG8x76NdNcw81JNSTf0Yft89iD3IB/YzYkNJrHTrxKbrcMWXQI+E8r91B3+e2Q
         vWxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xamHj01VKWI6LV5czE0pHDzK6LRZaTCUiyHzG1X+Lyw=;
        fh=ev4867VxmoVXuR9Krl1NwkBdVs9XvoAUiokAPkoNphQ=;
        b=bUrVxOZBLZh9m5GSy5XOsHIz/K3KlOSk/pEov80Z5Z/VFTmVuA4Nc7QuQL9ZXLaowO
         mZmU5ifh/ZNohGb4Tjm3b2uLzN2TNj3fEXp2X95340ojcGj7GabghjbDjeUwc/9lLseA
         zgccUBvIvTVsY8nMPp89aTWPd65FmulysiANiXXKJAifoMIa0+bxRGNdsycpXH15isBx
         a6ahSm0iJRYyRyTFYqsy58DSqw6Y4vMrhNItrDN9Qzr5MI1JDcEQJKRNHUoId1lIfKFF
         9q/gHw7Ou/txNtBS/4oWi0o0Q9feeBHjDXJACXvrEJuFNkSYwzTCdCBqVsoDuiqNeFqr
         /C2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788367391; x=1788972191; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xamHj01VKWI6LV5czE0pHDzK6LRZaTCUiyHzG1X+Lyw=;
        b=Vg44FnCl079/rzGgHyjkXujx23xzhFhBziA5BFR9sY/vPC+0mVssCTGY8lSN+LLELl
         CPQWVAfnN/ISAR1uS+7DFIBrvbKsqBSHMhQ0DLO3rPOgOAsT1wZFH+seqQUHgTmSjQjX
         VsctB1j4hxRj8Wv6+Fuzr6eVNRKZVwDaYs91bIq/sQFDNj3rerivIvp+GaHdLtayadK3
         a8l5FACwLPf52e3qIW4xaGfKeoLgVk8lmvC0/xDMps6dj1ctOtMET3MdO3N70reswZFB
         RWgLLKEgB3D4BCIHxyZEQ6N2n6xEZm3ft2MrEf4YGc8R+N4JbewWIArJsWs5Xw0RlERm
         HTww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367391; x=1788972191;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xamHj01VKWI6LV5czE0pHDzK6LRZaTCUiyHzG1X+Lyw=;
        b=dPMqu32O/kTlVSJuNBX/UvnauSmeuiHXIRfG+gElXPYFN19unk2l9MOr+yiy7Z80oA
         C11YFgO3WJAjMV4P21J760fZ8tBWVWKAPG3trFf/pEzYZEwt3tBwPhJbltGO05H4KlQJ
         xl+cg9QgKQWGC/PK+OqziCPCWRSMqKRydlP9kbQjEjjCt+bpTbsVSf4dngJolaYWAe0x
         r8uLfJxpEBWZWYEjJwszIWL/Totnx1/7lS77kGeKCg8iQRV+JNYUykNlKM4iRaLB/yWn
         kcfU4IpTxl7NTDBcqzp+v/ifgajXb2cywlk7oudfLrgEuIP1ts9/bq7ME6HObxS3j3E7
         26NA==
X-Forwarded-Encrypted: i=1; AKwUvBz05GwaqVlbczRVlJBy/emdb/FH8rc7xCZICkIOYK8OogvWNupE4uSQ+l2fJatNxST5R660P2+553afiJtaNwGNw5BS@vger.kernel.org
X-Gm-Message-State: AFuF++ngD9qZ56M0UHvVn2rF3JPXme5wg9P4I6uZaoBNXRiqiccEyAXP
	UNG4JTKxVuD14NrGsqWoegR1miyklf6EA/V21dOOZ3P+Q876UCOLgiry1oET6UorQLRggWkjoPH
	SvMAL3SWmRhz9CmRMFx/teFMLrxjJ9oU=
X-Gm-Gg: AYBFou0dJ59gN8RSLHNZuz/IdcTvN29m/mOwL7PFB4dWlprA7AYM5NhzOstIgPp/kUI
	tXOurbA0yqScG46UWhnJ9jGzGK52rdvOx3QiDG+0clmIm4rq8bDm3Dj9KXh8a22kIyLiJgpBbHp
	wcXUKTRVlT1O0E2xVpBqtFLzX284rTXWlIrfeJXCJLeCUW14x6V4r5xK3yxN2TUX7iDMaKHif3h
	nM3Q28P24GF1JyNr8LDurrsbE5KPJofdHz+F76AD4t3leEFsrF1mxrEk0t2qD6tt1nseLmutKHq
	ZqWSuRjoJkWT/Kl9qI+PYP1OAC7PYrn+2U1oDOq0aqRq
X-Received: by 2002:a17:907:9288:b0:c25:3e36:acc8 with SMTP id
 a640c23a62f3a-c25efbe1685mr30515166b.4.1788367391342; Wed, 02 Sep 2026
 09:43:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902032353.16106-1-idotohors@gmail.com> <b8cdf49b-91d4-2e86-a8ea-04d1db119225@linux.intel.com>
 <a6bff161-0d6c-467e-99a8-2062f123a6f8@linux.dev>
In-Reply-To: <a6bff161-0d6c-467e-99a8-2062f123a6f8@linux.dev>
From: ido <idotohors@gmail.com>
Date: Wed, 2 Sep 2026 23:42:59 +0700
X-Gm-Features: AcwNN1Vj7rRrx-LnXXLhkLbjkfomsecCDmwbl60GuUPcPkoK-B4GKjYPfAaqN8U
Message-ID: <CAF-TU9b7htDRcar_3+uq+T-_3PgDpWjewC7wVHpxneJSpiLD+Q@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86: asus-wmi: fix FA401 series keyboard
 sleep strobe
To: Denis Benato <denis.benato@linux.dev>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>, 
	Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Denis,

Thanks for the feedback!

That's a very fair point regarding userspace and kernel policy. I'll try to
find a more proper workaround.

Regards,
Ido


On Wed, Sep 2, 2026 at 6:54=E2=80=AFPM Denis Benato <denis.benato@linux.dev=
> wrote:
> Hi Idotoho!
>
> I tried to change the ASUS TUF interface for leds moving it to asus-armou=
ry once,
> I dropped it in the end, but I got these defines and bitfields right: you=
 can reuse
> my code code if you want, just leave the interface in asus-wmi.
>
> Also about this restore the backlight setting before entering sleep: do w=
e really
> want the kernel to decide to override a userspace decision to shine some =
leds
> in s2idle? My understanding is that if this is a userspace "missing featu=
re"
> (the ability to configure what happens to LEDs upon entering s2idle) it i=
s the
> userspace that has to be improved, not for the kernel to force a decision=
.
>
> Best regards,
> Denis
> >> +                                      0, NULL);
> >> +    }
> >> +
> >>      return 0;
> >>  }
> >>
> >> diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/as=
us-wmi.h
> >> index 5cd4392b9..69d224774 100644
> >> --- a/drivers/platform/x86/asus-wmi.h
> >> +++ b/drivers/platform/x86/asus-wmi.h
> >> @@ -52,6 +52,7 @@ struct quirk_entry {
> >>       */
> >>      int no_display_toggle;
> >>      u32 xusb2pr;
> >> +    bool kbd_rgb_state_quirk;
> >>  };
> >>
> >>  struct asus_wmi_driver {
> >>
