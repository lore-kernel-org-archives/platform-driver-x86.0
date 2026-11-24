Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795479690;
	b=Xm3KvYqb5G+YQVvrn9JnlGCA6UFTJG2iFhhQpuohMs2G2TAKzFwIpafK6KG2JqwkuuNh
	 UqgT5mfc5zKx0EDmp7AyPsxFsFY3t5+0tU3yueEm+v4oSRoWSz7Q75TDxiOkpQC+NJjee
	 Bb9fGHnEZfDZekur/2PGfZRN7Ti6DoWX0nv3eOABy70v+LV/SUV99BOEhw2EHnAhIoWMd
	 gXxsmBZfypd57Br7dBW2aviaCgmcce6I+1RauLhs+mQv4yyD4vpMxQo2GNBbUDww5X+r3
	 VQ+guCvtE0DFgvD4PY9tB6BawJ3HaqfEoeH202IXooUXCse7IWARuk9PHyFGMbu4pPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795479690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FqRh/LX34nQF3qudAfGlfiwq6IAwp90MpzECot2f3+Q=;
	b=0quy3a0xiZyczVeTZhCrc0uzp2dZmCwGRBvf0iFWs2ra5CDxQsJjYxQFTWUDI6AuYcrX
	 LjdAozBAF0toB5H+LVzApwGgoSTgwnyp0y8gBNCxLeSzE3adKXFZkdRSpbH5RBKzsA1XN
	 kOPcR5T8X3So7r7/fPeAwCWWnuRiXdQAeVp1JPIjTTGUfJQ6ViowW6tlu1xEcftH6oSxK
	 gstZdILylJ5GJ4trggusC9PkiRdgLU6WevDcC21pdMP30BuflP6T1jkFmjCQ7/xBgUUKF
	 7tNHJrenCzpipZlbBsiBxIMHHIpv/ehGwTBcnZNR8y92NyBmIH3Ce6ZiQDJTNJCxy0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rLKF5rHs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68504606A321
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 00:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68504606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rLKF5rHs
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso4808112a12.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 16:21:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795479689; cv=none;
        d=google.com; s=arc-20260327;
        b=P95VhAWAkEtCUSisYzGzzOA16jXQchZNpFAQGGF01dV3oUPzqiz8WTeJ99It2Ck8Gk
         doMEDsAvKUG4J5hjtficnsFaAW4oXkDQOSXhHmy9iPboOX9ay/dnS6uOHqj0W+aVtW4d
         1yhu10sb6srtsOGSr5TjegN4XLt8AE3gKYlukel0w19jUkw35AkWCfFxwny6nhneJ+e7
         1fJj0bvxE/OC1IlrmxM2f5tP9MebabZK9fMxxJSG4UWJcCEgbz4u0Dlv4vrBGZbIUWEC
         OesJjdRlvvv91IiNlBxpxbiiTyTILffIPhhzqzWr9gKB4IZs6HCTZxJjGSNHrUOo776w
         4Zhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FqRh/LX34nQF3qudAfGlfiwq6IAwp90MpzECot2f3+Q=;
        fh=Hb/KHRkjqCQiaV3JmlZ1Gvyl+eYZYWXqnfc/tRZx/qQ=;
        b=NjbEWcAokomDDyuUBI/TZQ0kYLuK7TefL2XPUHa84OJV6SPBY6X+9FTdz2OfzJYR+5
         mmsqr7TZMO+aVcAQDDBTcOv1AC6Dg9KAJSB2+hf3Ohdt5cc265MV1H8lVS33a8TxME1V
         /nhA9ByyaO88iWyksMw22rIU9aV3uW2MgFmnRLK9OupiYPaIMq1xIjCLvfydNmloeOFF
         MNQNXV/A8PKvJqR0MgKSp1qgRZG1/pfgFH5ksyGM6O5JbXjw5b/tQ2FdyXzi8T9udCJA
         8C69WE01o/fRH/e+Tg9HpYtuR9a9mZwETU1J7VEsDNprrtL9Sqqup233t+6XTWf7ZNM+
         Hd8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795479689; x=1796084489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FqRh/LX34nQF3qudAfGlfiwq6IAwp90MpzECot2f3+Q=;
        b=rLKF5rHsPOTUzw8jA6fcmSGCc3SISVvG81SEj/QnbdI73VCFd2+SvR+URp4aXbiwTU
         NMzD3TIeDed3u7sxPq/mCjWshoSmyEAY8hkCMRuzffM052x+L2ClWbWN82//8ypEiyTM
         sylrTabCRhpuD57mx4ich2UOC1noPuAsuxFcdLWZQXGd64dsy0YiiWJN3A4OiFN+1CU4
         kiisVQS6vXOMCrTfeUSa+jCc6n0Kq54zLFRF+wI6o11KR5+XHpHa45ghp190zJ2UD7c3
         aW21p/V88n0SbjTTz37tVvwVZmMqG6jAKQ3VX58m7OvQHDhS2nxf/e5meFyf0jok55yq
         1M8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795479689; x=1796084489;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FqRh/LX34nQF3qudAfGlfiwq6IAwp90MpzECot2f3+Q=;
        b=cwjstxnQCWcAIwrFhYNVxfhmj0H/Zh79Csut4XQ03C3nvpQq7e33SzAPW+f1AYHSrG
         rVZUCROESJLmZbrp4fW0ccUmaTRhBe+/oMp5OS0C5Idn/tulz1aKBXAf9v5L3oij2V0l
         l2tve7YLaIat7UugWU22VYfzPD8WPa/7OiejYej4EXN87nvsth8hrfv0GBcLK1hdDTow
         b4Dqbow1vMcCemHEeqfq3mMtoEou/cbq9N+mA/4Mzq2oYvbvAnMdp1AckFXi8MqwK/aJ
         z/PPFhWd6+C/N5VEJwX+eWZwDVP611KRFzkf3bKQisnucXvaGfsMNBaQx/qJVxE/m2S8
         C/DA==
X-Forwarded-Encrypted: i=1; AL+hErGrKRpb8UvL0NWbBq/MgoHoqqLCUNexI7DgeZZWy6F/mzaxfhxZE9vSxdFYF0KtY3K4JXI/iXO0kUnx6UFLemLtJjYG@vger.kernel.org
X-Gm-Message-State: APuU4Z8BwMfB6pS5pWtug0yLB0doflQVsJ+9lK/9lC4e74tAEqXJ7GyE
	4E1PNcfctkHa47ZaNYcYpCiLxy0LkDEjm8GyvtknJER3ffhAWzs1iNDUdgmITIFV+Jr4FYYx5S/
	iU02TBeoLERCJP3Q8a8wa4TWJhzfWxxU=
X-Gm-Gg: AZFdTZdwHorRYr2xyrf7iPrqRcrqu/LbkU9ZJZBOuNrnoSQiBoWaNmn5x4U+ktHP19Z
	om8/PgKZJaHFU9cAmru8bzLF4iWMwnhY8/xGidtlRW0eMqDaHgMRQLRJI4gthJjAurePxy12zUY
	Dt8BKZB95U/5csLvIK2wM1DS07Mes5ge6Rk1yFu8MH0p5sHK/S4S8mIpTLss88V0SwRam7Zvc7V
	bOK9YyVJXwST2zS+fol+XgDAgG3DAguH1Qa4WRPQ0oyCuqBhhCIQIhrx9Z/aBeHumjpl0M8+h9L
	Poco+gIof6Uzc5ZtjTFZ1QfM0pO9EJHyrenxP54PTNSmrTiOR+/PQhWVPj5yRcZs4F/7hTblIZ5
	GmZbCCYCxEz58fIbyGulwjEBQjMMd1GO6FaGYr+PmB/rdAZiE/h4IC2M3ifxUnEbVGDAa1UImyc
	Qqw4NTO/8nWnSr16zwBlq1J6a5r5RtgCtL/+DXW+tSKjyEtSEpqOG7y5dfcepHIkxbVue7qsfT3
	HMA9gYuXvu+nlwMD0/o/n1BYCUfBlJjVQYe5zf5m0pd08C/KQ==
X-Received: by 2002:a05:6402:4009:b0:6b9:c43e:19df with SMTP id
 4fb4d7f45d1cf-6ba37ed9a8bmr8687510a12.41.1795479688502; Mon, 23 Nov 2026
 16:21:28 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795219225.git.rosenp@gmail.com> <6abac23d8f9985b55282ee56c97155a67076257c.1795219225.git.rosenp@gmail.com>
 <51f6631e-62df-0e64-b358-805d343475b7@linux.intel.com>
In-Reply-To: <51f6631e-62df-0e64-b358-805d343475b7@linux.intel.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 23 Nov 2026 16:21:15 -0800
X-Gm-Features: Aa3M54pIlzL6e3JOmkuHYZ-2pLUgxSjaakZlAQWrxfICjUxUzInmwGW9UZ0eKFk
Message-ID: <CAKxU2N8cn+hbUH4iwP2w6myQV28LM1+djvmQfN92A8z1G9Y5Tw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] platform/x86: dell-laptop: Parse the charge end
 threshold as an int
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, 
	Darren Hart <dvhart@linux.intel.com>, platform-driver-x86@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 12:32=E2=80=AFAM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Fri, 20 Nov 2026, Rosen Penev wrote:
>
> > charge_control_end_threshold_store() passes a pointer to an int to
> > kstrtouint(), which only builds because the kernel disables
> > -Wpointer-sign, and makes the following "end < 0" check dead code.
> > Use kstrtoint() like charge_control_start_threshold_store(). Values
> > outside 0 to 100 are rejected either way.
>
> Why the <0 check has to be kept on the driver side?
It's currently a one line change instead of three.
>
> Why not change the variable type instead and remove the then dead code
> check?
>
> It's somewhat disappointing this even has to be pointed out by review.
>
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/platform/x86/dell/dell-laptop.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform=
/x86/dell/dell-laptop.c
> > index eca348497ac3..c512267be4c4 100644
> > --- a/drivers/platform/x86/dell/dell-laptop.c
> > +++ b/drivers/platform/x86/dell/dell-laptop.c
> > @@ -2382,7 +2382,7 @@ static ssize_t charge_control_end_threshold_store=
(struct device *dev,
> >  {
> >       int ret, end;
> >
> > -     ret =3D kstrtouint(buf, 10, &end);
> > +     ret =3D kstrtoint(buf, 10, &end);
> >       if (ret)
> >               return ret;
> >       if (end < 0 || end > 100)
> >
>
> --
>  i.
>
