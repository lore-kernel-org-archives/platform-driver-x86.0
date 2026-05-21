Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EE83CF05B
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 12:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779367804; cv=pass; b=YUdgRoPkaQFpfLb6odi9xvE3vb5K/7HFMZVKzBNpt0AuEWUYGucrK+gRYbK3BJrIsU3FcECmbowRqPC7XmATQdboHxSOOOi3Ue2o13uwPg0x6eSY807So58CqzoJ0SK6Sjf/vTi/PoXyni6cluO2a2qNC6bWURyalC3kq62bqCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779367804; c=relaxed/simple;
	bh=rK8SqOSyuXy40vTNKk9GwO+72sLQEb+qkKyfOyPTTZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uHxe4Uu87c4xTBMD+laNCkYOqwnzhNMH3sDG3J8zOQrXF5WO9wXs+aj5TWIVEwgNs9pRvlgCmLn6pDqCbAqK9PUjNVZF5EwOql7lwlJeLTr0BNvwLQnJZaUPjBmZGRhSabmrxp64YPoTbNAE0LOgdAumXciYSdIbB7fyixbnqFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=asOFjybJ; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="asOFjybJ"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-67b8d9c26bbso13055050a12.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 05:50:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779367801; cv=none;
        d=google.com; s=arc-20240605;
        b=FnQ69SUvIkaFqPCfcgTkVDs5VdUcNVaFPftJMokt5NQzJnVhf+bvpyI6DMNAYwKrKf
         4gItT/KbrwRhLDCgiGnIqgKpNT5p9C2u0g3dgZAq3FZbCdZlhLaHMFjDyc4479eUW9P3
         yma0cQWfRH1q1KdHpTvAmW1vPyLgQabkEjh9xJFX23tz36uDp1pGHs0yrdBQwXmvF1Gc
         ++Yf2qTOHbrE3VGPPo4eMN1cl06Tggr4cMvgkE0P1zOEKMBeulGLTP+gewmMyEpncyLn
         hHWMgsxo7Rkb14Khz7wSRVXpJ7kvjRuvZo1fb3GjFkk1yZhrIlQLIWV0iTjzZjeCGL0X
         yDGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+QVahzrzmnVBYKabR7+8y85cgjXH1ygDSASSrfb0n5A=;
        fh=Qsam3c9C+daHZxzzvB5yJJpsn/bbJ50FPGUnp06BkxU=;
        b=A2RrX/qBm6dsAtA++fFjxzStGkzELCHWIrZnZUYTbvZHDb/WT+tEeaolFCqxK6C0Rn
         KePKm48thbaxFC9o817YQ3qAYFeuMqJpbpS6vB8+IRxC/jdWYOeqtBzdJYWW5MLwXq9N
         5cZ9hxNW2o41EqvpJMQoMzGNBs189sL9jh63aQ2LcqPQ2ilDSRJtTejhLldqUCYdDfx2
         ukXR65d1p5ykJCGsA5M3Av23hvc2CRRVxNpg1AOORbfoX9ewx/skD+38WqndZAIs0Xxh
         PnoIM+br00qraq86PTZHkJkBId3gVxnZP7POwEdffYumhOIBNrFEFZ9Fkrgcz22u5lCl
         NV0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779367801; x=1779972601; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QVahzrzmnVBYKabR7+8y85cgjXH1ygDSASSrfb0n5A=;
        b=asOFjybJRYZHR+KChUS4yyy2ArpWOa/jIxW80xs15PSISPEaP0OKcxW016lf1/re2c
         5EPW4Gh9kui2w+PH81B7L05p+Rm6aoMwqaT+kHSIgkJepLIo8R/kR39eHCja4mFFm5mF
         pskGwRv39MTKscMye1w/0Lkxupdb+Rc7W+5hoDI0jvgmC5210AMo0h57lRxN1vTN4pgW
         2zdlYcXsMDp26pCl7IQvKNYFSOPh03Y9ZMsUvDoDDZY02e8rTU4Cp7D/kBhIGThmKOKe
         G6agB8APyUfpvTobXZ2iXW4K/54hrou+oft8mDNI4NA776naX2lPwXztUd8Ytb5VuOut
         rPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779367801; x=1779972601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+QVahzrzmnVBYKabR7+8y85cgjXH1ygDSASSrfb0n5A=;
        b=kw5Na/GvpcTAoPL0+clWrXEoyfdLKTc5MFkkdYnOqmVhtwXznV8/AYQgR5zeKC9dMO
         OOQMvl+NAJFzb3/iEWFjuZoAjJ5TmzRWA0QBYS4IIpBOmYDMqXgS4QPT/12XZKvG/LP6
         2qpjkkfOu7bflVwsHLH5ciyIAblU++OdeqHrcqxawcjDBx6TaWRZAaYihNGKS/KDfA6f
         Fft+5gyR9CvHYXxVwAn8ZhFMKHD3VGzDZGPm5gOqq0tGu9BYCdcDrJAys4JAqaRD+QER
         2lho2bY/kQovY5HT8mjkcb77KUt9Sx88oemjQ3DMdQuK3Xj6RhkxBQcrvOPY97DiAIz4
         2VwQ==
X-Gm-Message-State: AOJu0Yx4FpfjKv0fVe/WIa5AaOHeqXFXLCg3iNcOmUpsOV3VFr4rY676
	i22itVQvMaC9bKXyH+PbFjWn1iAhvoqfuV5qIqYLZt9t4b6zMbHitUL6BWep0o+gVepMK7pVXb9
	CjV4R68wrm38jnOcvR51Qu+pOaYPAaCc=
X-Gm-Gg: Acq92OEYZg5jlUZoQ5ORYihrpP92jk79Vlr76UIRyyelf/c5pLfR+r9GVg12w2VKhkI
	SozkJ0buCIz8f4+PpWN1qLT8vXnukLBV4ZLa9a5Kfb5MEUj3f0c/Ef5tO5sHEUjRb3iPBcAOXMC
	ZzGLYBiJF095zw6K5fujK3Dg4TdfAjOkf7rfPY648TUJs9Y2R5suSdQJh/aU2Z1Qhlw45bc8HzO
	ESuT6XMOwC2Scb5891B8APZhXsjnK27Mp9aKpECAFqdGsS+hV0raOtHdeKj1j72mg+mruRt8Sen
	pCWpjjwMetZH7bUOv1sIzMNYXIqKIIL6FVEYyfJbI7hk5hywriM=
X-Received: by 2002:a05:6402:13cf:b0:672:a1df:9c6e with SMTP id
 4fb4d7f45d1cf-68836ecafdcmr1507409a12.25.1779367801093; Thu, 21 May 2026
 05:50:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520140800.130530-1-radheykalra901@gmail.com> <ag3yZmFDRUqsoVAm@archlinux>
In-Reply-To: <ag3yZmFDRUqsoVAm@archlinux>
From: Radhey Kalra <radheykalra901@gmail.com>
Date: Thu, 21 May 2026 18:19:48 +0530
X-Gm-Features: AVHnY4Lu0A6IYiAizgPqe5DM6ciRCOtvNxsqTgNF7e4GeVRQ-gMmBj6YZh0ooTk
Message-ID: <CAJ5VyXL0nYQXb=R_5Nd=HZCLiPKFnrJ+ttXb=D1LTAN2j4M2vw@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] platform/x86: hp-wmi: Add Victus 15-fb0xxx fan control
To: Krishna Chomal <krishna.chomal108@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krishna,

I tested the current platform-profile behavior on 8A3D more carefully.

The board already exposes the generic hp-wmi platform-profile choices:

cool quiet balanced performance

Writes to all choices succeed and read back correctly, and I do not
see hp_wmi errors in dmesg.

However, under full CPU load I could not confirm that these profiles
change CPU power behavior. Across quiet/balanced/performance/cool, CPU
frequency stayed around 3.27 GHz and the reported PPT stayed around 33
W. Fan RPM rose somewhat later in the test, but the system was also
heating up, so I cannot separate that from normal firmware thermal fan
ramping.

So I should not claim that platform-profile policy is meaningfully
validated for 8A3D. What I have verified is that the Victus
fan-control path works.

That is why I avoided a plain addition to
victus_s_thermal_profile_boards: it would move 8A3D from the existing
generic platform-profile path to the Victus S-specific
platform-profile path, which I have not verified on this board.

Thanks, Radhey


On Wed, May 20, 2026 at 11:20=E2=80=AFPM Krishna Chomal
<krishna.chomal108@gmail.com> wrote:
>
> On Wed, May 20, 2026 at 07:37:46PM +0530, Radhey Kalra wrote:
> >Hi,
> >
> >This is a smaller v5 split for the Victus 15-fb0xxx fan-control change.
> >Patch 1 prepares the hp-wmi board data and hwmon fan-control selection
> >so fan support can be described independently from Victus S thermal
> >profiles. Patch 2 adds fan-control support for Victus 15-fb0xxx board
> >8A3D.
> >
>
> I am sure I must be missing something but I don't see why this isn't
> just a DMI table addition?
>
> I understand that you want to refactor the structs to decouple fan contro=
l
> from platform profile so that you can just use fan control feature and
> ignore platform profile, but I don't understand why that is done?
>
> If I use victus_8a3d_board_params quirk on my device (8C78), it effective=
ly
> removes platform profile support, why is this choice made?
>
> >Based on platform-drivers-x86/for-next commit:
> >165e81354eefd5551358112773f24027aac59d5a
> >
> >Tested on a Victus by HP Gaming Laptop 15-fb0xxx, board 8A3D, BIOS
> >F.22. With the series applied, pwm1 and pwm1_enable are exposed and
> >the EC-layout warning is not emitted for 8A3D.
> >
> >Radhey Kalra (2):
> >  platform/x86: hp-wmi: Prepare Victus fan control board data
> >  platform/x86: hp-wmi: Add Victus 15-fb0xxx fan control
> >
> > drivers/platform/x86/hp/hp-wmi.c | 212 ++++++++++++++++++++++---------
> > 1 file changed, 153 insertions(+), 59 deletions(-)
> >
> >---
> >Changes in v5:
> >- Reduce the series to two patches: one preparatory board-data/hwmon
> >  patch and one focused 8A3D enablement patch.
> >- Drop the active_thermal_profile_params global and dereference the
> >  thermal-profile data through active_board_params.
> >- Wrap the setup comment added in the preparatory patch to stay under
> >  80 columns.
> >
> >Changes in v4:
> >- Split v3 into two no-functional-changes-intended refactors, one
> >  fan-table parsing fix, and one 8A3D support patch.
> >- Rebase on platform-drivers-x86/for-next commit 165e81354eefd555.
> >- Move revision notes to the cover letter.
> >
> >Changes in v3:
> >- Rebase on platform-drivers-x86/for-next commit 165e81354eefd555.
> >- Keep the v2 board-data approach and 8A3D fan-control-only handling.
> >
> >Changes in v2:
> >- Use real name in Signed-off-by.
> >- Replace the ad-hoc fan-control DMI table with board data in
> >  .driver_data.
> >- Keep 8A3D fan-control-only instead of enabling Victus S thermal
> >  profiles.
> >- Use the fixed fan-table parser path and derive gpu_delta from the
> >  first non-zero GPU row.
> >
> >--
> >2.54.0
