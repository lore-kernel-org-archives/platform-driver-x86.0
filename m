Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55AF420893
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Jul 2026 13:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783343131; cv=pass; b=AzZnBojDut8GV/i+vqwaQ95t7jcru547bA1zw1VbhXIqF0pgPLP5OVznMdmJHMIqEG07mDJH2k9uOVK/0gbMgLnJ3zHoWsOyYxOEOuL6cPVx55r2i5YiqSN8RDlRotTLyOeLzVWVbVHRX/Nwi1MuD3vdoVEkQuFkfJ0UhagFy/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783343131; c=relaxed/simple;
	bh=9SbWC6KYVVZRMEQdEAAxcx4p2VOO5rNO11idabNFzgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=epaeXTOUvoGRUJOOfHktISjvAcN3eLczArNHQUOioc93Kdohh4XyM9MZDr1+m4hsJpOjUPCqadtVs4A7IR6XE32y765bd8+ZUG9+F3cXFYGE7AJeGwZpiRLBplUtLe64LGYzESdSLjpUNp6SyVWjclCfcrSYb6PI6WY+FnMT+pA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cvYB0pXj; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ANICBhJ6; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cvYB0pXj";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ANICBhJ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783343128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sdTMoj183NRSMeTXAp4YsXZlzmlZIQsL6VbDv6J293s=;
	b=cvYB0pXjvqJY8CvqJxUp3GomboDc8ONmhUQRsQVeU1lB8pWpY74jFXSHwbMUC1clx40c6v
	fTCx5naZGNCkRa2TnzcYibSDsub+LNhcsoLZDVa81Yh2F/sYTrf+yfnzwGWxxpk87Cu+ah
	4HoO7UCW0e/I+08XYJeTjOE+K/LFWfA=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462-PKb2CDj7O8CvWLHw94DImw-1; Mon, 06 Jul 2026 09:05:27 -0400
X-MC-Unique: PKb2CDj7O8CvWLHw94DImw-1
X-Mimecast-MFC-AGG-ID: PKb2CDj7O8CvWLHw94DImw_1783343127
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6a17ce8b08dso1376867eaf.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Jul 2026 06:05:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783343127; cv=none;
        d=google.com; s=arc-20260327;
        b=bUG4MUScSBrhe9/r2iX6d1dS6K8iwdmQ6uVFizA9R6vw+m1MDfkC3FD3gulLEDCPau
         +cdihW0glraWV4bGDtkhDL1Ims3yJTC1LFgkSzP1LSWYG3lTJMiRJ+47XwVUjKVTe8wX
         3OhND5bMxldxdGc9MKYMzXOF3ckx62DxMsaZVublB+7djZv3CARSg7um0XY9Rc4HEXp+
         /RrrS9Lv0vtZmPpPaxAvbc8u6rtuzJkzwArGiyt4KFKHwww7FtDjcfEXX+lnBgRF0yF/
         dVxW85WoDVudAL7RmAmVJGv/NNxcx1ovmEixh8MSV0xwLvvnesZdk+i/ixuLnS2nmVyl
         iIjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sdTMoj183NRSMeTXAp4YsXZlzmlZIQsL6VbDv6J293s=;
        fh=SDZt1yYcRHVqOPMW8ZhgDyCnv4/s4MKBtGxxoZwwZ0g=;
        b=ArK9cgVNUjAwewOEkX+w3+DoTLJB6CijaeDMGaFAqKANUz9PUkb6vr1i5KDis6nwCq
         ANU59tZgpR0geFxjXAbVubeHcHHq3wopE3r719DVT8RFzge1LqsArX7feyyWS5ROSc0J
         qv/IkI0yH8M44GH7+FqjWjYBxcshcYK83YGHpsrkcCWtNrZSALt/T2kBBkGapC7tvsqw
         rUmDguVBQJT1qLUG82wWgEjPy8Qg/iZQSbmtN0MFt5HarTm3C/TJR9V71shKnAkn0xAQ
         DNoRF1Mg7Xl/g52VcngS0/E+npemZRiwqksk1yfrKC2tQ9pjIeTodeHbgmiFHPBg9Gfs
         yHUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783343127; x=1783947927; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sdTMoj183NRSMeTXAp4YsXZlzmlZIQsL6VbDv6J293s=;
        b=ANICBhJ6wbQy1+cmlXMH8eDPiI6CFN8wdZPBigppQ0w5W9ljltAh1l4sAnbOetzh/W
         ObgX+vA3aHzH24I81Ij2zoap2uiAhU99labGQRus7jsw5X+Ab2stsr3eJNADDp+c+Ymi
         9oFk/GmX7hJc7dMqahAzhes8UKiefgI0b7eFHCw2bgqGGVmX97pSN+J/vM0VS7CWXiiL
         Fv64d5kjTIj5ZEeLaEkirRjZbTTwQ5YSlAGnkauULnLtPR4feMmRlmMdl6sqZGAjmPr3
         iKsdm/7zUwkNGG3V+L+3Y2W4GVSVC/oaeyeIXOFHrvXVQIdb2ww6X+Abes44cCcjI6fF
         xtyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783343127; x=1783947927;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sdTMoj183NRSMeTXAp4YsXZlzmlZIQsL6VbDv6J293s=;
        b=kqTJlFH4d/Qy3E/9rsNu7wfkCbCTVn7zRgF1JBmDCfSKcb6Fp9U3hF/Rn8cYziG1cN
         k4Hlm6zFuy8Ws4hf73GHtWSzD1jBu5kHGjV3tB7nhLLFC6wGNRYwkNdoKSoZW4Gu2MP/
         8Rxq4CgKkaCrrfL/BmXvq0kpcUvLagXzB6eoRXj3xWBtW7FHoeWuY5l9ACe2sjeSUDkb
         jjcS+kc5FXDmCAd9eW589PpCJXN2GFHXWGvKWziBY2hxdtQg+6D/GNAgKMD2uEtB1nM3
         AWii+mmoecKmuwzG6ld/bebsHMw4XwNDhw2ZCaRyHZFM28z8JPvUw/+O+qgKqrvb0m1c
         iUJQ==
X-Forwarded-Encrypted: i=1; AFNElJ9wN69Xrx0pYWj86uO5WlPf/Qmh2iaB6rQZboqqBBu7+0dTmr1bjwLE/BrjvS6xsB76zJnPbLKfHv6QOB0HoYa4pq6K@vger.kernel.org
X-Gm-Message-State: AOJu0YwrgjD6iDxohZrv8XlXXeO9xopbpH5ToGvH8J/+4FnCRrLdLtju
	CbCXCNNhox4UCpRIKELduQfCZB4ye8VeTzzHNW0WmrMzaaTzjvUUqOT6TzE/jYXuSAQatxIQV+9
	8ZgkqoRe7u9Mgb69R3ZU/YS3tm9AaVZDgKvhEEh8XxIrzlcZTBgRRztxI55VbI5Fi31KgB0950d
	uJ9mnrAI1AOnTTqlhvYacLLQOK7tzsxwKDqrJ2KjDHHgpRxRBScQ==
X-Gm-Gg: AfdE7cny49EKwGnQMcIRSDaPWe7CQzWIkRzhLDDIEgyxmG9vnlDCl2kUikQgJRQNM2V
	fvHU5IWHlP6MsanfBHW5/PHzRI5UnNI6RZpAhDnQe8ARRV3tky94B/jSgMLusnh4GwzexUUCgkL
	A2AQXOwswgnY4YmDPbwENBAiF1giOoGjKFM7vqAUckH4DlJds7vpRrHazFCJY4v2WDhbM=
X-Received: by 2002:a05:6820:81d3:b0:6a1:6f12:1aac with SMTP id 006d021491bc7-6a35526582bmr205763eaf.10.1783343124500;
        Mon, 06 Jul 2026 06:05:24 -0700 (PDT)
X-Received: by 2002:a05:6820:81d3:b0:6a1:6f12:1aac with SMTP id
 006d021491bc7-6a35526582bmr205575eaf.10.1783343119494; Mon, 06 Jul 2026
 06:05:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629074026.35490-1-hpa@redhat.com> <20260629074026.35490-4-hpa@redhat.com>
 <PN3P287MB18292C819793395D643D426A8BF72@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <49257d09-a2fd-4a9d-9479-4d2b5e0fb8a6@kernel.org> <PN3P287MB182945B5747452110940BEA08BF62@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <c7634571-4682-41d5-aa9d-8b965d641d51@kernel.org> <akT2CSCbaR0a3BMA@kekkonen.localdomain>
 <PN3P287MB18296E80E1786B05F5ACF37E8BF62@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <d59e796b-fe53-4103-a94b-5ffba53246b9@kernel.org> <aklcEKiFDfZwCFP-@kekkonen.localdomain>
 <PN3P287MB1829FE03558376196C9030328BF12@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <PN3P287MB1829FE03558376196C9030328BF12@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
From: Kate Hsuan <hpa@redhat.com>
Date: Mon, 6 Jul 2026 21:05:08 +0800
X-Gm-Features: AVVi8CddLzx4eQRFaxdBT2pu3p2HbYXIVt8N98r-CMBvGbAxEWVq6TYvkkHLf5w
Message-ID: <CAEth8oG_jDMz3Sspayfv18Ue4vO6103fM0J_f_i_NG6tZ7c4XA@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] platform: int3472: discrete: con_id vana for Sony
 IMX471 as power enable
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Serin Yeh <serin.yeh@intel.com>, Damjan Georgievski <gdamjan@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, computman <anis@talbi.fr>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Daniel Scally <dan.scally@ideasonboard.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans, Sakari and Tarang,

Thank you for your comments.

On Mon, Jul 6, 2026 at 3:16=E2=80=AFPM Tarang Raval
<tarang.raval@siliconsignals.io> wrote:
>
> Hi Sakari,
>
> > On Thu, Jul 02, 2026 at 08:05:25PM +0200, Hans de Goede wrote:
> > > > I went through the INT3472 driver and would like to propose a gener=
ic
> > > > approach that satisfies both sides without per-HID quirks or sensor=
 driver
> > > > changes.
> > > >
> > > > The problem is:
> > > >  - INT3472 standardizes on "avdd" internally
> > > >  - Sony IMX sensor drivers use "vana" per datasheet, and all existi=
ng
> > > >    Sony DT bindings (imx219, imx290, imx415) already use vana-suppl=
y
> > > >  - Changing imx471 to "avdd" now will create inconsistency with tho=
se
> > > >    bindings, or require a rename later
> > >
> > > Ack, as mentioned in my reply to Sakari from 1 minute ago I'm ok
> > > with sticking with vana for the imx* case,
> >
> > At least some Sony sensors use "INT" PnP vendor prefix and so telling t=
hem
> > apart from the rest doesn't work at least this way. There could also be
> > other prefixes as well, they're not all "SONY". Right now there is one =
with
> > INT prefix and three with SONY prefix.
> >
> > If we start having lots of devices with the same quirk, we could also
> > introduce a pointer to an array of IDs to avoid repeating the same quir=
k
> > over and over.
> >
> > Kate's patch adds two quirks so this could be already considered (and o=
nly
> > one of these IDs is using SONY prefix).

The idea may look like

const char *sony_hids [] =3D {
"SONY471A",
"TBE20A0,
NULL
};

 { /* imx471 expects "vana" as con_id for power enable */
     .hid =3D sony_hids,   <--- A ponter to sony_hids
     .type_from =3D INT3472_GPIO_TYPE_POWER_ENABLE,
     .type_to =3D INT3472_GPIO_TYPE_POWER_ENABLE,
     .con_id =3D "vana",
     .enable_time_us =3D GPIO_REGULATOR_ENABLE_TIME,
 },

and
and the following functions need to be changed.
Do I understand it correctly?

Sakari, do you want to implement this approach or could Tarang and I do tha=
t?

>
> The HID prefix is not actually a concern for the alias idea, because the
> alias table triggers on supply_name not on HID. Since INT3472 always
> assigns "avdd" to any POWER_ENABLE GPIO regardless of HID prefix, the
> alias would work the same for SONY471A, TBE20A0 or any future INTXXXXX
> prefix.
>
> However there is a different problem with the alias idea: it would regist=
er
> both avdd and vana for every sensor that has a POWER_ENABLE GPIO, not jus=
t
> Sony IMX sensors. So I agree this is not a good approach.
>
> The NULL-terminated HID array is the correct approach, the mapping is
> explicit and only applied to hid we explicitly list.
>
> I can send a patch implementing this on top of Kate's patch.
Sounds good.
If Sakari agree with that, I can include your patch in my series.

Thank you :)
>
> Best Regards,
> Tarang
>


--=20
BR,
Kate

