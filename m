Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AA03E8C79
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Jan 2026 14:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767883109; cv=none; b=bQtdZQf3XYi7i9rbSqesfpA4yc/PxbzrLDdG6NBw7he8VXlnMAkNyjjBcfjbK6KB6h6Pe4QYg7Hs4zRzu93kEmzgwciDT3f6rONy1x/eYahyBs1Gc4h+eXW5seELlOR2a4ChGjp2TJNrRpFbHG3ZEi3g9bzEAyfGTkUmtlllvlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767883109; c=relaxed/simple;
	bh=yXR3akQkkOd1suwHrre1Hd3X0xIOLAKYfSQdYQ9bmUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A/D9k96VEGBu/J82kmlDY5rRajWyUxb1VbpywqWvlpv8mJS+9zkCzBKebZSAzBUhaZPNr+VsM/dYPT+Sypq8yFCGdBCv2IApV4FmUP8yQGl01ECOb0Dqp6tj+F1O44n+OS4wBmus91xlsV/yvF7EeL0HO5MkjLT9SBgtyam2bRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lNGTj/Xi; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lNGTj/Xi"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-78c66bdf675so32829387b3.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Jan 2026 06:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767883106; x=1768487906; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXR3akQkkOd1suwHrre1Hd3X0xIOLAKYfSQdYQ9bmUA=;
        b=lNGTj/XihYvy6Cc5nPkYuBJ1EP7mFmLHoHkHTBjvg+qkLQNTVB/O7fhBINyoJCSXCU
         75+BvI3p4O8Riv2te3kgPPtT3wgUZrwuFWjCejbgupCc9E3qPiYs5Yv2PEDf2Em+CGKM
         SmNS8C22Z4Hq5OI9zb87PFUSmsJZsyOikR/GYELL8K+XYKF6XA02x4C+9NRlzjrPNuRU
         zQ+xwd1gvJ4oq24N8fgu+HnytIyLUHUwJkl/qsrwM7u9gRvRToJrxI+hfLtSa5hMZReg
         1SGWvadQ+qI6tm4/klrMibNGRgxu5AZacR8jjGaj0sRWEgqKQytekEvtOzLB53DgT1AD
         HZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767883106; x=1768487906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yXR3akQkkOd1suwHrre1Hd3X0xIOLAKYfSQdYQ9bmUA=;
        b=Il1cBEzTfMNQu5BjE4S1KxKZa42EI/letUA2jKcDQws55UHjGGy+kosNkPXi4DBni7
         HtdWJRs1yKA8WmM/k+tmh1ZbonYDVtZyOYBPzrKSzmrqR934px4IBdC6ouFEvvNEssDp
         xe5MoAndwNdAklhY7eYoYqhDE1Qra3r2GJf7rUn+EhYL87elKc33TY/w/VMd1tknCYuM
         bse8urjzexvXmslgux3N6cIg34hFQX3t0jaqivlsOR7zF0mmqLEpyJdl3Silde1dIaqi
         IVgctPMRnjJuKDCV3QvdjxEsZMCHpMJZqNbf1bnoty44/+oXH0gLRA3zikYXjOhg/FK7
         3fzQ==
X-Gm-Message-State: AOJu0YyssoDqvn53mSjGObujdog31I2fI9g73+AVYp/pPxIUy9+KPRmq
	QOx3PYory1DAGpUahk9CfL2oPPn9vimH47bdPIWR4bJOp6LTrlbJCWCtR2yOf/tCx+j5Vyueuef
	u3Z581n8iTGlHWM+aPfs5hwJCt/LKENA=
X-Gm-Gg: AY/fxX5vC3LQis/7gLUJWYAeJWKsrGSa9icLbn3kFtEITGXu0pR3IjFh7Iy7dlbWa2o
	do49KruS3SMBt7tcHeR28JpS6XbdDrKgSdHXNbpkryY5EDwFsAL1oPh4thdl2tPQmGIQwDYitAS
	rtpqVPhPqPF9Y8SUsvWeiNTH6upAptykrenQtEAfDWXgxuoLWYN0TnMZIoUlTJRTKRupckQ0RTr
	P5oPZtdMG1uxFhqk2U/dE0onNtKamuNEkZN99asKTBhoCDkZQk1Zqo+luwsX28q4hhDlyADeQxN
	hLsVEGkodY64ljN4DAA3qGaIVhgx
X-Google-Smtp-Source: AGHT+IFXrIXlqGUjYwpKqGeJa9p3KuY/9HKtvZoNMrZXdusyJzPXu+LEBCldBtgTD3dO5DcCpioYV0nYf+Kz8ZkZYKE=
X-Received: by 2002:a53:b2fb:0:b0:645:527b:bc11 with SMTP id
 956f58d0204a3-64716bbba19mr3956925d50.3.1767883106425; Thu, 08 Jan 2026
 06:38:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACy5qBaFv_L5y_nGJU_3pd3CXbFZrUAE18y5Fc-hnAmrd8bSLA@mail.gmail.com>
 <1e4fe52c-d044-4869-a583-fa14f9740de0@gmx.de> <CACy5qBZW1pbYrrTc-1tcNwzGTuty=aovnrK17==CaSppXuBurg@mail.gmail.com>
 <abeb08c2-5aa5-4919-8016-d714c04c508b@gmx.de> <CACy5qBY-6v7_jRizJ=dJkeKGF+4fVUwmX9oaP=8XHGROEYOgCA@mail.gmail.com>
 <CACy5qBbgvgLa-y-TXz9ChaC1pvCAgKjQbU+=0Zd3gm-qyHHW_Q@mail.gmail.com>
 <655738e4-6128-4b43-aabe-b0eb0da0a0c7@gmx.de> <CACy5qBZmA47D1G9Ma5V+yn4bcZZYg98JCGtXeKX212FFUoo13Q@mail.gmail.com>
In-Reply-To: <CACy5qBZmA47D1G9Ma5V+yn4bcZZYg98JCGtXeKX212FFUoo13Q@mail.gmail.com>
From: Pranay Pawar <pranaypawarofficial@gmail.com>
Date: Thu, 8 Jan 2026 20:08:14 +0530
X-Gm-Features: AQt7F2rKrWRYw5Zqmi6BsAo5Sw1wCKeW2DckgHUfCmukCqrtrYR775sVzZ4rPDk
Message-ID: <CACy5qBaPBFwZ6d735fNbtC6_U4r9imzgeLuYpBuj0ckBXVDhPg@mail.gmail.com>
Subject: Re: platform/x86: acer-wmi: Missing max fan speed (7000+ RPM) on Acer
 Nitro AN515-58
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Armin,

I have tested the suggested sysfs attributes with the patched driver,
and here are the results:

Mode: balanced, pwmX_enable=3D0
Setting this to "0" successfully puts both fans at maximum speed.

Mode: balanced-performance, pwmX_enable=3D0
Setting this to "0" also puts both fans at maximum speed.

Mode: performance, pwmX_enable=3D0
Setting this to "0" also puts both fans at maximum speed.

It appears that switching the attributes to "0" does correctly trigger
the turbo mode for the fans.

Thanks,
Pranay Pawar (Bugaddr)

> On Mon, Jan 5, 2026 at 10:31=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote=
:
>>
>> Am 30.12.25 um 06:54 schrieb Pranay Pawar:
>>
>> > Sorry for the confusion earlier =E2=80=94 after rechecking the behavio=
r
>> > without the new patch, I=E2=80=99d like to clarify the results.
>> >
>> > ** Without the patch:
>> > 1. The fans are able to reach maximum RPM only when using the
>> > balanced-performance profile.
>> > 2. When selecting the performance profile, the fan speed remains
>> > capped at ~4500 RPM.
>> >
>> > ** With the patch applied:
>> > 1. Manual fan control is unlocked, which makes this patch important
>> > and effective.
>> > 2. The fans are able to reach maximum RPM only when using the
>> > balanced-performance profile.
>> >
>> > So the issue is specifically that the performance profile still keeps
>> > the fans capped, even though it is expected to be more aggressive than
>> > balanced-performance.
>>
>> I see. Can you check if the fans reach their max. speed if you set the p=
wmX_enable
>> sysfs attributes below the associated hwmon device to "0"? This should s=
witch them
>> into turbo mode.
>>
>> Thanks,
>> Armin Wolf
>>
>> >
>> > Apologies for the misunderstanding.
>> >
>> > Best regards,
>> > Pranay Pawar (Bugaddr)
>> >
>> > On Mon, Dec 29, 2025 at 1:47=E2=80=AFPM Pranay <pranaypawarofficial@gm=
ail.com> wrote:
>> >> Yes this patch is making the driver work as expected. I had modified
>> >> the acer-wmi driver and loaded it, then changed platform profile to
>> >> balanced-performance & now fans are able to reach max RPM's. But in
>> >> performance mode (Which is supposed to be powerful than
>> >> balanced-performance) the fans are still max locked at 4500 rpm only.
>> >>
>> >> Thanks & Regards,
>> >> Bugaddr (Pranay Pawar)
>> >>
>> >> On Mon, Dec 29, 2025 at 2:10=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> w=
rote:
>> >>> Am 25.12.25 um 22:51 schrieb Pranay:
>> >>>
>> >>>> Sure here you go, in attachments
>> >>>>
>> >>>> Thanks,
>> >>>> Bugaddr
>> >>> I attached an experimental patch that should whitelist fan control f=
or your model. Can you
>> >>> test that fan control and the nitro button works?
>> >>>
>> >>> Thanks,
>> >>> Armin Wolf
>> >>>
>> >>>> On Thu, Dec 25, 2025 at 11:14=E2=80=AFPM Armin Wolf <W_Armin@gmx.de=
> wrote:
>> >>>>> Am 24.12.25 um 20:40 schrieb Pranay:
>> >>>>>
>> >>>>>> Dear Maintainers,
>> >>>>>>
>> >>>>>> I am reporting a limitation in the acer-wmi driver regarding fan =
speed
>> >>>>>> control on the Acer Nitro AN515-58.
>> >>>>>>
>> >>>>>> The Issue: On Windows, enabling "Performance" mode via NitroSense
>> >>>>>> ramps the fans up to 7000+ RPM. On Linux, selecting the "Performa=
nce"
>> >>>>>> platform profile boosts the CPU power correctly, but the fans rem=
ain
>> >>>>>> capped at maximum 3500-4000 RPM.
>> >>>>>>
>> >>>>>> Observation: This laptop model lacks a physical "Turbo" button. t=
hough
>> >>>>>> there is a nitrosense button which is useless in linux.
>> >>>>>>
>> >>>>>> I am requesting that support be added to fix the maximum fan spee=
d state issue.
>> >>>>> Sure thing, can you share the output of "acpidump" to i can whitel=
ist your model
>> >>>>> for fan control?
>> >>>>>
>> >>>>> Thanks,
>> >>>>> Armin Wolf
>> >>>>>
>> >>>>>> Best regards,
>> >>>>>>
>> >>>>>> bugaddr
>> >>>>>>
